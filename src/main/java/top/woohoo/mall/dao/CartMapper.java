package top.woohoo.mall.dao;

import org.apache.ibatis.annotations.Param;
import top.woohoo.mall.pojo.Cart;

import java.util.List;

public interface CartMapper {
    int deleteByPrimaryKey(Integer id);
    int insert(Cart record);
    int insertSelective(Cart record);
    Cart selectByPrimaryKey(Integer id);
    int updateByPrimaryKeySelective(Cart record);
    int updateByPrimaryKey(Cart record);

    Cart selectCartByUserIdAndProductId (
            @Param("userId") Integer userId, @Param("productId") Integer productId);

    List<Cart> selectCartByUserId (Integer userId);
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