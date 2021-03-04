package top.woohoo.mall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.pagehelper.PageInfo;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.model.pojo.Order;
import top.woohoo.mall.model.vo.Order.OrderProductVO;
import top.woohoo.mall.model.vo.Order.OrderVO;

import java.util.Map;

public interface OrderService extends IService<Order> {

    ServerResponse<OrderProductVO> cart(Integer userId);

    ServerResponse<OrderVO> create(Integer userId, Integer shippingId);

    ServerResponse cancel(Integer userId, Long orderNo);

    ServerResponse<OrderVO> detail(Integer userId, Long orderNo);

    ServerResponse<PageInfo<OrderVO>> list(Integer userId, Long orderNo, int pageNum, int pageSize);

    ServerResponse delivery(Long orderNo);

    ServerResponse ended(Integer userId, Long orderNo);

    ServerResponse close(Long orderNo);

    ServerResponse<Map<String, String>> pay(Integer userId, Long orderNo, String path);

    ServerResponse alipayCallback(Map<String, String> params);

    ServerResponse<Boolean> getPayStatus(Integer userId, Long orderNo);
}
