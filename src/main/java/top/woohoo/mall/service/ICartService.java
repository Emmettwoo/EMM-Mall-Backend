package top.woohoo.mall.service;

import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.vo.CartVO;

public interface ICartService {

    ServerResponse<CartVO> add(Integer userId, Integer productId, Integer amount);
    ServerResponse<CartVO> update(Integer userId, Integer productId, Integer count);
    ServerResponse<CartVO> delete(Integer userId, String productIds);
    ServerResponse<CartVO> list(Integer userId);
    ServerResponse<CartVO> clear(Integer userId);
    ServerResponse<Integer> count(Integer userId, Integer checkedMode);
    ServerResponse<CartVO> checkedOrUnchecked(Integer userId, Integer productId, Integer checkedMode);
}
