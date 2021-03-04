package top.woohoo.mall.dao;

import org.apache.ibatis.annotations.Param;
import top.woohoo.mall.pojo.Order;

import java.util.List;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);
    int insert(Order record);
    int insertSelective(Order record);
    Order selectByPrimaryKey(Integer id);
    int updateByPrimaryKeySelective(Order record);
    int updateByPrimaryKey(Order record);

    Order selectByUserIdAndOrderNo(@Param("userId") Integer userId, @Param("orderNo") Long orderNo);
    Order selectByOrderNo(Long orderNo);
    int selectByShippingId(Integer shippingId);
    List<Order> selectByUserId(Integer userId);
    List<Order> selectAll(@Param("orderNo") Long orderNo);

    int countOrderNumbers();
}