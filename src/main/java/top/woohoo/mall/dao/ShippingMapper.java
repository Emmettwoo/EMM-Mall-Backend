package top.woohoo.mall.dao;

import org.apache.ibatis.annotations.Param;
import top.woohoo.mall.pojo.Shipping;

import java.util.List;

public interface ShippingMapper {
    int deleteByPrimaryKey(Integer id);
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