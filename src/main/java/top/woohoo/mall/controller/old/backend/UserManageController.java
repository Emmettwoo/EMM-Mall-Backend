package top.woohoo.mall.controller.old.backend;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import top.woohoo.mall.common.Const;
import top.woohoo.mall.common.ResponseCode;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.service.UserService;
import top.woohoo.mall.model.vo.User.UserVO;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/manage/user/")
public class UserManageController {

    @Autowired
    private UserService userService;


    @RequestMapping(value = "login.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<UserVO> login(String username, String password, HttpSession session) {
        ServerResponse<UserVO> response = userService.login(username, password);
        // 先判断是否登入成功，再判断是否是管理员账户。
        if (response.isSuccess()) {
            if (response.getData().getRole().equals(Const.UserRoleEnum.ROLE_ADMIN.getValue())) {
                session.setAttribute(Const.CURRENT_USER, response.getData());
                return response;
            } else {
                return ServerResponse.createByErrorMessage("非管理员用户，无法登入。");
            }
        }
        return response;
    }

    @RequestMapping(value = "list.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<PageInfo<UserVO>> listUserInfo(
            HttpSession session,
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {

        if (userService.checkAdminRole(session)) {
            return userService.listUser(pageNum, pageSize);
        } else {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "无法获取用户列表，用户未登入或无权操作");
        }
    }

    // todo: 编辑用户信息功能

}