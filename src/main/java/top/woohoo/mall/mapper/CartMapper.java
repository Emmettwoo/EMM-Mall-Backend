package top.woohoo.mall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import top.woohoo.mall.model.pojo.Cart;

import java.util.List;

/**
 * 购物车表
 *
 * @author Emmett Woo
 * @since 2021/03/04
 */
@Mapper
public interface CartMapper extends BaseMapper<Cart> {

    int deleteByPrimaryKey(Integer id);

    @Override
    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);

    Cart selectCartByUserIdAndProductId(
            @Param("userId") Integer userId, @Param("productId") Integer productId);

    List<Cart> selectCartByUserId(Integer userId);

    int selectCartProductCheckedStatusByUserId(Integer userId);

    int deleteByUserIdAndProductIdList(
            @Param("userId") Integer userId, @Param("productIdList") List<String> productIdList);

    int checkedOrUncheckedByUserIdAndProductId(
            @Param("userId") Integer userId, @Param("productId") Integer productId,
            @Param("checkedMode") Integer checkedMode);

    int selectCartProductCountByUserId(
            @Param("userId") Integer userId, @Param("checkedMode") Integer checkedMode);

    List<Cart> selectCheckedCartByUserId(Integer userId);
}
