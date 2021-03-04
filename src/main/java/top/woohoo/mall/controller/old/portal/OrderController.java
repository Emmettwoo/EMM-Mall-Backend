package top.woohoo.mall.controller.old.portal;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.demo.trade.config.Configs;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Maps;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import top.woohoo.mall.common.Const;
import top.woohoo.mall.common.ResponseCode;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.service.OrderService;
import top.woohoo.mall.model.vo.Order.OrderProductVO;
import top.woohoo.mall.model.vo.Order.OrderVO;
import top.woohoo.mall.model.vo.User.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Iterator;
import java.util.Map;

@Controller
@RequestMapping("/order/")
public class OrderController {

    private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private OrderService orderService;


    @RequestMapping("cart.do")
    @ResponseBody
    public ServerResponse<OrderProductVO> cart(HttpSession session) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return this.orderService.cart(user.getId());
    }

    @RequestMapping("create.do")
    @ResponseBody
    public ServerResponse<OrderVO> create(HttpSession session, Integer shippingId) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        // 好像没有一种情况是创建订单时就存在ShippingId的吧？
        return this.orderService.create(user.getId(), shippingId);
    }

    @RequestMapping("cancel.do")
    @ResponseBody
    public ServerResponse cancel(HttpSession session, Long orderNo) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return this.orderService.cancel(user.getId(), orderNo);
    }

    @RequestMapping("detail.do")
    @ResponseBody
    public ServerResponse<OrderVO> detail(HttpSession session, Long orderNo) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return this.orderService.detail(user.getId(), orderNo);
    }

    @RequestMapping("list.do")
    @ResponseBody
    public ServerResponse<PageInfo<OrderVO>> list(HttpSession session,
                                                  @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                                  @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return this.orderService.list(user.getId(), null, pageNum, pageSize);
    }

    @RequestMapping("ended.do")
    @ResponseBody
    public ServerResponse ended(HttpSession session, Long orderNo) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return this.orderService.ended(user.getId(), orderNo);
    }


    // 以下为订单模块的付款部分（暂时只对接了支付宝）

    @RequestMapping("pay.do")
    @ResponseBody
    public ServerResponse<Map<String, String>> pay(HttpSession session, Long orderNo) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return orderService.pay(user.getId(), orderNo, session.getServletContext().getRealPath("upload"));
    }

    @RequestMapping("get_pay_status.do")
    @ResponseBody
    public ServerResponse<Boolean> getPayStatus(HttpSession session, Long orderNo) {
        UserVO user = (UserVO) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }

        if (orderService.getPayStatus(user.getId(), orderNo).isSuccess()) {
            return ServerResponse.createBySuccess(true);
        }
        return ServerResponse.createBySuccess(false);
    }

    @RequestMapping("alipay_callback.do")
    @ResponseBody
    public Object alipayCallback(HttpServletRequest request) {
        Map<String, String> params = Maps.newHashMap();

        // 获取回调数据并保存
        Map<String, String[]> requestParameterMap = request.getParameterMap();
        for (Iterator<String> iterator = requestParameterMap.keySet().iterator(); iterator.hasNext(); ) {
            String name = iterator.next();
            String[] values = requestParameterMap.get(name);
            String valueString = "";

            for (int i = 0; i < values.length; i++) {
                // 若非最后一个元素，则以逗号分隔
                valueString = (i == values.length - 1) ? valueString + values[i] : valueString + values[i] + ",";
            }
            params.put(name, valueString);
        }
        logger.info("支付宝回调: sign:{}, trade_status:{}, 参数:{}",
                params.get("sign"), params.get("trade_status"), params.toString());

        // 验证回调的正确性
        params.remove("sign_type");
        try {
            boolean alipayRSACheckedV2Status = AlipaySignature.rsaCheckV2(
                    params, Configs.getAlipayPublicKey(), "utf-8", Configs.getSignType());
            if (!alipayRSACheckedV2Status) {
                return Const.AlipayCallback.RESPONSE_FAILED;
            }
        } catch (AlipayApiException e) {
            logger.error("支付宝回调验证异常: " + e);
        }

        // 验证成功，写入数据库
        if (orderService.alipayCallback(params).isSuccess()) {
            return Const.AlipayCallback.RESPONSE_SUCCESS;
        }
        return Const.AlipayCallback.RESPONSE_FAILED;
    }
}
