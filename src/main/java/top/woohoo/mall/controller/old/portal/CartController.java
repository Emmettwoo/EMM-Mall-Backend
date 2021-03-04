package top.woohoo.mall.controller.old.portal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.woohoo.mall.common.Const;
import top.woohoo.mall.common.ResponseCode;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.service.CartService;
import top.woohoo.mall.model.vo.Cart.CartVO;
import top.woohoo.mall.model.vo.User.UserVO;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart/")
public class CartController {

    @Autowired
    private CartService cartService;

    @RequestMapping("add.do")
    @ResponseBody
    public ServerResponse<CartVO> add(HttpSession session, Integer productId, Integer amount) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return cartService.add(user.getId(), productId, amount);
    }

    @RequestMapping("delete.do")
    @ResponseBody
    // 删除的productId用String形式以支持多选删除，多个id以英文半角逗号,分割。
    public ServerResponse<CartVO> delete(HttpSession session, String productIds) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return cartService.delete(user.getId(), productIds);
    }

    @RequestMapping("update.do")
    @ResponseBody
    public ServerResponse<CartVO> update(HttpSession session, Integer productId, Integer amount) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return cartService.update(user.getId(), productId, amount);
    }

    @RequestMapping("list.do")
    @ResponseBody
    public ServerResponse<CartVO> list(HttpSession session) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return cartService.list(user.getId());
    }

    @RequestMapping("clear.do")
    @ResponseBody
    public ServerResponse<CartVO> clear(HttpSession session) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return cartService.clear(user.getId());
    }

    @RequestMapping("count_checked.do")
    @ResponseBody
    public ServerResponse<Integer> countChecked(HttpSession session) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return cartService.count(user.getId(), Const.CartItem.CHECKED);
    }

    @RequestMapping("count_all.do")
    @ResponseBody
    public ServerResponse<Integer> countAll(HttpSession session) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            // 导航栏初始化会调用，故不传need_login（自动跳转到登入界面）。
            return ServerResponse.createByErrorMessage("用户未登入");
        }
        return cartService.count(user.getId(), null);
    }


    @RequestMapping("checked.do")
    @ResponseBody
    public ServerResponse<CartVO> checkedOne(HttpSession session, Integer productId) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return cartService.checkedOrUnchecked(user.getId(), productId, Const.CartItem.CHECKED);
    }

    @RequestMapping("unchecked.do")
    @ResponseBody
    public ServerResponse<CartVO> uncheckedOne(HttpSession session, Integer productId) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return cartService.checkedOrUnchecked(user.getId(), productId, Const.CartItem.UN_CHECKED);
    }

    @RequestMapping("checked_all.do")
    @ResponseBody
    public ServerResponse<CartVO> checkedAll(HttpSession session) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return cartService.checkedOrUnchecked(user.getId(), null, Const.CartItem.CHECKED);
    }

    @RequestMapping("unchecked_all.do")
    @ResponseBody
    public ServerResponse<CartVO> uncheckedAll(HttpSession session) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return cartService.checkedOrUnchecked(user.getId(), null, Const.CartItem.UN_CHECKED);
    }
}