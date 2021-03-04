package top.woohoo.mall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import top.woohoo.mall.model.pojo.Order;

import java.util.List;

/**
 * 订单信息表
 *
 * @author Emmett Woo
 * @since 2021/03/04
 */
@Mapper
public interface OrderMapper extends BaseMapper<Order> {

    int deleteByPrimaryKey(Integer id);

    @Override
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
