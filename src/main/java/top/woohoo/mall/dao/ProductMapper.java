package top.woohoo.mall.dao;

import org.apache.ibatis.annotations.Param;
import top.woohoo.mall.pojo.Product;

import java.util.List;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer id);
    int insert(Product record);
    int insertSelective(Product record);
    Product selectByPrimaryKey(Integer id);
    int updateByPrimaryKeySelective(Product record);
    int updateByPrimaryKey(Product record);


    List<Product> selectProductList();

    List<Product> selectProductListByIdOrName(@Param("productId") Integer productId, @Param("productName") String productName);

    List<Product> searchProducts(@Param("productId")Integer productId, @Param("productName") String productName,
                                 @Param("categoryIdList") List<Integer> categoryIdList, @Param("saleStatus") Integer saleStatus);

    int countProductNumbers();
}