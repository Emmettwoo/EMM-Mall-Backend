package top.woohoo.mall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import top.woohoo.mall.model.pojo.Shipping;

import java.util.List;

/**
 * 收货地址表
 *
 * @author Emmett Woo
 * @since 2021/03/04
 */
@Mapper
public interface ShippingMapper extends BaseMapper<Shipping> {

    int deleteByPrimaryKey(Integer id);

    @Override
    int insert(Shipping record);

    int insertSelective(Shipping record);

    Shipping selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Shipping record);

    int updateByPrimaryKey(Shipping record);

    Shipping selectByUserIdAndShippingId(@Param("userId") Integer userId, @Param("shippingId") Integer shippingId);

    int updateByUserIdAndShippingId(Shipping shipping);

    int deleteByUserIdAndShippingId(@Param("userId") Integer userId, @Param("shippingId") Integer shippingId);

    int setStatusByUserIdAndShippingId(@Param("status") Integer status,
                                       @Param("userId") Integer userId, @Param("shippingId") Integer shippingId);

    List<Shipping> selectByUserId(Integer userId);

    int countByUserId(Integer userId);
}
