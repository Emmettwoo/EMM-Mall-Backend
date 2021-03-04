package top.woohoo.mall.controller.backend;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import top.woohoo.mall.common.Const;
import top.woohoo.mall.common.ResponseCode;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.pojo.User;
import top.woohoo.mall.service.IOrderService;
import top.woohoo.mall.service.IUserService;
import top.woohoo.mall.vo.OrderVO;
import top.woohoo.mall.vo.UserVO;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/manage/order/")
public class OrderManageController {

    @Autowired
    private IOrderService iOrderService;
    @Autowired
    private IUserService iUserService;

    @RequestMapping("list.do")
    @ResponseBody
    public ServerResponse<PageInfo<OrderVO>> list(HttpSession session,
                                                  @RequestParam(value = "orderNo", required = false) Long orderNo,
                                                  @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                                  @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        if (iUserService.checkAdminRole(session)) {
            return this.iOrderService.list(null, orderNo, pageNum, pageSize);
        } else {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "查询失败，用户未登入或无权操作");
        }
    }

    @RequestMapping("detail.do")
    @ResponseBody
    public ServerResponse<OrderVO> detail(HttpSession session, Long orderNo) {
        if (iUserService.checkAdminRole(session)) {
            return this.iOrderService.detail(null, orderNo);
        } else {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "查询失败，用户未登入或无权操作");
        }
    }

    @RequestMapping("delivery.do")
    @ResponseBody
    public ServerResponse delivery(HttpSession session, Long orderNo) {
        if (iUserService.checkAdminRole(session)) {
            return this.iOrderService.delivery(orderNo);
        } else {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "发货失败，用户未登入或无权操作");
        }
    }

    @RequestMapping("ended.do")
    @ResponseBody
    public ServerResponse ended(HttpSession session, Long orderNo) {
        if (iUserService.checkAdminRole(session)) {
            return this.iOrderService.ended(null, orderNo);
        } else {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "无法完成，用户未登入或无权操作");
        }
    }

    @RequestMapping("close.do")
    @ResponseBody
    public ServerResponse close(HttpSession session, Long orderNo) {
        if (iUserService.checkAdminRole(session)) {
            return this.iOrderService.close(orderNo);
        } else {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "无法完成，用户未登入或无权操作");
        }
    }

    @RequestMapping("cancel.do")
    @ResponseBody
    public ServerResponse cancel(HttpSession session, Long orderNo) {
        if (iUserService.checkAdminRole(session)) {
            return this.iOrderService.cancel(null, orderNo);
        } else {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "无法完成，用户未登入或无权操作");
        }
    }
}
