package top.woohoo.mall.controller.portal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import top.woohoo.mall.common.Const;
import top.woohoo.mall.common.ResponseCode;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.pojo.User;
import top.woohoo.mall.service.IUserService;
import top.woohoo.mall.vo.UserVO;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private IUserService iUserService;

    @RequestMapping(value = "check_login.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<UserVO> checkLogin(HttpSession session) {
        UserVO user = (UserVO)session.getAttribute(Const.CURRENT_USER);
        if(user != null) {
            return iUserService.getUserInfo(user.getId());
        }
        // 导航栏初始化会调用，故不传need_login（自动跳转到登入界面）。
        return ServerResponse.createByErrorMessage("用户未登入");
    }

    @RequestMapping(value = "login.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<UserVO> login(String username, String password, HttpSession session) {
        ServerResponse<UserVO> response = iUserService.login(username, password);
        if(response.isSuccess()) {
            session.setAttribute(Const.CURRENT_USER, response.getData());
        }
        return response;
    }

    @RequestMapping(value = "logout.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse logout(HttpSession session) {
        if(session.getAttribute(Const.CURRENT_USER) != null) {
            session.removeAttribute(Const.CURRENT_USER);
        }
        return ServerResponse.createBySuccessMessage("用户登出成功");
    }

    @RequestMapping(value = "register.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse register(User user, HttpSession session) {
        ServerResponse response = iUserService.register(user);
        // 如果注册成功，自动完成登陆
        if(response.isSuccess()) {
            this.login(user.getUsername(), user.getPassword(), session);
        }
        return response;
    }

    @RequestMapping(value = "update.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<UserVO> updateUser(HttpSession session, User user) {
        UserVO currentUser = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if(currentUser == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        // 防止横向越权，强制Id为当前登入用户（id is the key for update）
        user.setId(currentUser.getId());
        // 用户名、密码和账户类型不进行更新，以防恶意注入
        user.setUsername(currentUser.getUsername());
        user.setPassword(null);
        user.setRole(null);


        ServerResponse<UserVO> response = iUserService.updateUser(user);
        if(response.isSuccess()) {
            session.setAttribute(Const.CURRENT_USER, response.getData());
        }
        return response;
    }

    @RequestMapping(value = "check.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse checkInput(String str, String type) {
        return iUserService.checkInput(str, type);
    }


    @RequestMapping(value = "forget_password_question.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> forgetPasswordQuestion(String username) {
        return iUserService.checkQuestion(username);
    }

    @RequestMapping(value = "forget_password_answer.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse forgetPasswordAnswer(String username, String question, String answer) {
        return iUserService.checkAnswer(username, question, answer);
    }

    @RequestMapping(value = "forget_password_reset.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse forgetPasswordReset(String username, String password, String forgetToken) {
        return iUserService.forgetPasswordReset(username, password, forgetToken);
    }

    @RequestMapping(value = "logined_password_update.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse loginedPasswordUpdate(HttpSession session, String passwordOld, String passwordNew) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        ServerResponse response = iUserService.loginedPasswordUpdate(passwordOld, passwordNew, user.getId());
        if (response.isSuccess()) {
            session.removeAttribute(Const.CURRENT_USER);
        }
        return response;
    }
}