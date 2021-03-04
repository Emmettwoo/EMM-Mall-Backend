package top.woohoo.mall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.model.pojo.Cart;
import top.woohoo.mall.model.vo.Cart.CartVO;

public interface CartService extends IService<Cart> {

    ServerResponse<CartVO> add(Integer userId, Integer productId, Integer amount);

    ServerResponse<CartVO> update(Integer userId, Integer productId, Integer count);

    ServerResponse<CartVO> delete(Integer userId, String productIds);

    ServerResponse<CartVO> list(Integer userId);

    ServerResponse<CartVO> clear(Integer userId);

    ServerResponse<Integer> count(Integer userId, Integer checkedMode);

    ServerResponse<CartVO> checkedOrUnchecked(Integer userId, Integer productId, Integer checkedMode);
}
