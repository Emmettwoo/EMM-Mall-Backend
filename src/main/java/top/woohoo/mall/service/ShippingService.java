package top.woohoo.mall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.pagehelper.PageInfo;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.model.pojo.Shipping;

public interface ShippingService extends IService<Shipping> {

    ServerResponse<Integer> add(Integer userId, Shipping shipping);

    ServerResponse delete(Integer userId, Integer shippingId);

    ServerResponse update(Integer userId, Shipping shipping);

    ServerResponse<Shipping> select(Integer userId, Integer shippingId);

    ServerResponse<PageInfo<Shipping>> list(Integer userId, int pageNum, int pageSize);
}