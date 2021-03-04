package top.woohoo.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.woohoo.mall.common.Const;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.dao.OrderMapper;
import top.woohoo.mall.dao.ShippingMapper;
import top.woohoo.mall.pojo.Shipping;
import top.woohoo.mall.service.IShippingService;

import java.util.List;

@Service("iShippingService")
public class ShippingServiceImpl implements IShippingService {

    @Autowired
    ShippingMapper shippingMapper;
    @Autowired
    OrderMapper orderMapper;

    @Override
    public ServerResponse<Integer> add(Integer userId, Shipping shipping) {
        shipping.setId(null);
        shipping.setUserId(userId);
        shipping.setStatus(Const.ShippingStatusEnum.Available.getCode());

        if (shippingMapper.countByUserId(userId) >= 10) {
            return ServerResponse.createByErrorMessage("你拥有超过10个收货地址了，无法再添加。");
        }

        if (shippingMapper.insert(shipping) > 0) {
            return ServerResponse.createBySuccess("新增收货地址成功", shipping.getId());
        }
        return ServerResponse.createByErrorMessage("新增收货地址失败");
    }

    @Override
    public ServerResponse delete(Integer userId, Integer shippingId) {
        // 如果收货地址有被订单引用到，不应删除条目，采用隐藏处理。
        if (orderMapper.selectByShippingId(shippingId) > 0) {
            if (shippingMapper.setStatusByUserIdAndShippingId(
                    Const.ShippingStatusEnum.Unavailable.getCode(), userId, shippingId) > 0) {
                return ServerResponse.createBySuccessMessage("删除收货地址成功");
            }
        } else {
            // 此处使用了重写的sql，用id和userId匹配删除，防止横向越权。
            if (shippingMapper.deleteByUserIdAndShippingId(userId, shippingId) > 0) {
                return ServerResponse.createBySuccessMessage("删除收货地址成功");
            }
        }
        return ServerResponse.createByErrorMessage("删除收货地址失败");
    }

    @Override
    public ServerResponse update(Integer userId, Shipping shipping) {

        shipping.setUserId(userId);
        shipping.setStatus(Const.ShippingStatusEnum.Available.getCode());

        if (shippingMapper.updateByUserIdAndShippingId(shipping) > 0) {
            return ServerResponse.createBySuccessMessage("更新收货地址成功");
        }
        return ServerResponse.createByErrorMessage("更新收货地址失败");
    }

    @Override
    public ServerResponse<Shipping> select(Integer userId, Integer shippingId) {
        Shipping shipping = shippingMapper.selectByUserIdAndShippingId(userId, shippingId);
        if (shipping != null) {
            return ServerResponse.createBySuccess("查询收货地址成功", shipping);
        }
        return ServerResponse.createByErrorMessage("查询收货地址失败");
    }

    @Override
    public ServerResponse<PageInfo<Shipping>> list(Integer userId, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Shipping> shippingList = shippingMapper.selectByUserId(userId);
        // 即使数据为空，也直接返回（空的分页信息）。
        return ServerResponse.createBySuccess(new PageInfo<>(shippingList));
    }
}