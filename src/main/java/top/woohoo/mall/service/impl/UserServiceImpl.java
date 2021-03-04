package top.woohoo.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.woohoo.mall.common.Const;
import top.woohoo.mall.common.ResponseCode;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.common.TokenCache;
import top.woohoo.mall.dao.UserMapper;
import top.woohoo.mall.pojo.User;
import top.woohoo.mall.service.IUserService;
import top.woohoo.mall.util.DateTimeUtil;
import top.woohoo.mall.util.MD5Util;
import top.woohoo.mall.vo.UserVO;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;

@Service("iUserService")
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public ServerResponse<UserVO> login(String username, String password) {
        if(userMapper.checkUsername(username) == 0) {
            return ServerResponse.createByErrorMessage("用户名不存在");
        }

        User user = userMapper.loginAuth(username, MD5Util.MD5EncodeUtf8(password));
        if(user == null) {
            return ServerResponse.createByErrorMessage("用户密码错误");
        }
        return ServerResponse.createBySuccess("用户登入成功", this.assembleUserVO(user));
    }

    @Override
    public ServerResponse register(User user) {
        if(!this.checkInput(user.getUsername(), Const.USERNAME).isSuccess()) {
            return ServerResponse.createByErrorMessage("用户名已存在");
        }
        if(!this.checkInput(user.getEmail(), Const.EMAIL).isSuccess()) {
            return ServerResponse.createByErrorMessage("邮箱已被注册");
        }

        user.setRole(Const.UserRoleEnum.ROLE_CUSTOMER.getCode());
        user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));

        if(userMapper.insert(user) == 0) {
            return ServerResponse.createByErrorMessage("注册失败");
        }
        return ServerResponse.createBySuccessMessage("注册成功");
    }

    @Override
    public ServerResponse<UserVO> getUserInfo(Integer id) {
        User user = userMapper.selectByPrimaryKey(id);
        return ServerResponse.createBySuccess(this.assembleUserVO(user));
    }

    @Override
    public ServerResponse<PageInfo<UserVO>> listUser(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);

        List<User> userList = userMapper.listUser();
        List<UserVO> userVOList = Lists.newArrayList();

        for (User user : userList) {
            userVOList.add(this.assembleUserVO(user));
        }

        PageInfo pageInfo = new PageInfo(userList);
        pageInfo.setList(userVOList);
        return ServerResponse.createBySuccess((PageInfo<UserVO>)pageInfo);
    }

    @Override
    public ServerResponse<UserVO> updateUser(User user) {
        // 新邮箱不能跟已有其他用户的邮箱一致
        if(userMapper.checkEmailExceptSelf(user.getEmail(), user.getId()) > 0) {
            return ServerResponse.createByErrorMessage("邮箱已被注册");
        }
        // 问题答案为空时不更新
        if("".equals(user.getAnswer().trim())) {
            user.setAnswer(null);
        }

        if(userMapper.updateByPrimaryKeySelective(user) > 0) {
            return ServerResponse.createBySuccess("更新信息成功",
                    this.assembleUserVO(userMapper.selectByPrimaryKey(user.getId())));
        }
        return ServerResponse.createByErrorMessage("更新信息失败");
    }

    @Override
    public ServerResponse checkInput(String str, String type) {
        switch(type) {
            case Const.USERNAME:
                if (userMapper.checkUsername(str) > 0) {
                    return ServerResponse.createByErrorMessage("用户名已存在");
                } else {
                    return ServerResponse.createBySuccessMessage("校验成功");
                }
            case Const.EMAIL:
                if(userMapper.checkEmail(str) > 0) {
                    return ServerResponse.createByErrorMessage("邮箱已被注册");
                } else {
                    return ServerResponse.createBySuccessMessage("校验成功");
                }
            default:
                return ServerResponse.createByErrorMessage("数据类型错误");
        }
    }


    @Override
    public ServerResponse<String> checkQuestion(String username) {
        if(this.checkInput(username, Const.USERNAME).isSuccess()) {
            return ServerResponse.createByErrorMessage("用户名不存在");
        }

        String question = userMapper.selectQuestionByUsername(username);
        if(StringUtils.isNotBlank(question)) {
            return ServerResponse.createBySuccess(question);
        }

        return ServerResponse.createByErrorMessage("未设置安全问题");
    }

    @Override
    public ServerResponse checkAnswer(String username, String question, String answer) {
        if (userMapper.checkAnswer(username, question, answer) > 0) {
            String forgetToken = UUID.randomUUID().toString();
            // 设置一个Token，用于重设密码操作确权
            TokenCache.setKey(TokenCache.TOKEN_PREFIX + username, forgetToken);
            return ServerResponse.createBySuccess("问题回答正确" ,forgetToken);
        }
        return ServerResponse.createByErrorMessage("问题回答错误");
    }

    @Override
    public ServerResponse forgetPasswordReset(String username, String password, String forgetToken) {
        if (StringUtils.isBlank(forgetToken)) {
            return ServerResponse.createByErrorMessage("未获取到Token");
        }
        if(this.checkInput(username, Const.USERNAME).isSuccess()) {
            return ServerResponse.createByErrorMessage("用户名不存在");
        }

        String token = TokenCache.getKey(TokenCache.TOKEN_PREFIX + username);
        if (StringUtils.isBlank(token)) {
            return ServerResponse.createByErrorMessage("Token无效或过期");
        }

        if (StringUtils.equals(forgetToken, token)) {
            // 删除key，避免重复使用
            TokenCache.delKey(TokenCache.TOKEN_PREFIX + username);
            if(userMapper.updatePasswordByUsername(username, MD5Util.MD5EncodeUtf8(password)) > 0) {
                return ServerResponse.createBySuccessMessage("修改密码成功");
            }
        } else {
            return ServerResponse.createByErrorMessage("Token错误，请重试");
        }
        return ServerResponse.createByErrorMessage("修改密码失败");
    }

    @Override
    public ServerResponse loginedPasswordUpdate(String passwordOld, String passwordNew, Integer userId) {
        if(userMapper.checkPasswordByUserId(userId, MD5Util.MD5EncodeUtf8(passwordOld)) == 0) {
            return ServerResponse.createByErrorMessage("旧密码不正确");
        }
        // 创建一个新User只包含id和密码，减少数据库更新的数据
        User newUser = new User();
        newUser.setId(userId);
        newUser.setPassword(MD5Util.MD5EncodeUtf8(passwordNew));

        if (userMapper.updateByPrimaryKeySelective(newUser) > 0) {
            return ServerResponse.createBySuccessMessage("修改密码成功，请重新登入。");
        }

        return ServerResponse.createByErrorMessage("修改密码失败");
    }


    private UserVO assembleUserVO(User user) {
        UserVO userVO = new UserVO();
        userVO.setId(user.getId());
        userVO.setUsername(user.getUsername());
        userVO.setEmail(user.getEmail());
        userVO.setPhone(user.getPhone());
        userVO.setQuestion(user.getQuestion());
        userVO.setRole(Const.UserRoleEnum.codeOf(user.getRole()).getValue());
        userVO.setCreateTime(DateTimeUtil.timestamp2FormatTime(user.getCreateTime()));
        userVO.setUpdateTime(DateTimeUtil.timestamp2FormatTime(user.getUpdateTime()));

        return userVO;
    }

    // 暂时折衷由service层接受session进行处理，等2.0引入spring security再优化。
    @Override
    public boolean checkAdminRole(HttpSession session) {
        UserVO userVO = (UserVO)session.getAttribute(Const.CURRENT_USER);
        if (userVO == null) {
            return false;
        }
        return userVO.getRole().equals(Const.UserRoleEnum.ROLE_ADMIN.getValue());
    }
}