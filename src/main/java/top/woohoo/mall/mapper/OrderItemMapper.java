package top.woohoo.mall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import top.woohoo.mall.model.pojo.OrderItem;

import java.util.List;

/**
 * 订单商品表
 *
 * @author Emmett Woo
 * @since 2021/03/04
 */
@Mapper
public interface OrderItemMapper extends BaseMapper<OrderItem> {

    int deleteByPrimaryKey(Integer id);

    @Override
    int insert(OrderItem record);

    int insertSelective(OrderItem record);

    OrderItem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderItem record);

    int updateByPrimaryKey(OrderItem record);

    List<OrderItem> selectByUserIdAndOrderNo(@Param("userId") Integer userId, @Param("orderNo") Long orderNo);

    List<OrderItem> selectByOrderNo(Long orderNo);

    void batchInsert(@Param("orderItemList") List<OrderItem> orderItemList);

}
