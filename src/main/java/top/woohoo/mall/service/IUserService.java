package top.woohoo.mall.service;

import com.github.pagehelper.PageInfo;
import top.woohoo.mall.common.Const;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.pojo.User;
import top.woohoo.mall.vo.UserVO;

import javax.servlet.http.HttpSession;

public interface IUserService {

    ServerResponse<UserVO> login(String username, String password);
    ServerResponse register(User user);
    ServerResponse<UserVO> getUserInfo(Integer id);
    ServerResponse<PageInfo<UserVO>> listUser(int pageNum, int pageSize);
    ServerResponse<UserVO> updateUser(User user);
    ServerResponse checkInput(String str, String type);

    ServerResponse<String> checkQuestion(String username);
    ServerResponse checkAnswer(String username, String question, String answer);
    ServerResponse forgetPasswordReset(String username, String password, String forgetToken);
    ServerResponse loginedPasswordUpdate(String passwordOld, String passwordNew, Integer userId);

    boolean checkAdminRole(HttpSession session);
}