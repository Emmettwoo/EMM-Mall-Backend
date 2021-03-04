package top.woohoo.mall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import top.woohoo.mall.model.pojo.Product;

import java.util.List;

/**
 * 商品信息表
 *
 * @author Emmett Woo
 * @since 2021/03/04
 */
@Mapper
public interface ProductMapper extends BaseMapper<Product> {

    int deleteByPrimaryKey(Integer id);

    @Override
    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);


    List<Product> selectProductList();

    List<Product> selectProductListByIdOrName(@Param("productId") Integer productId, @Param("productName") String productName);

    List<Product> searchProducts(@Param("productId") Integer productId, @Param("productName") String productName,
                                 @Param("categoryIdList") List<Integer> categoryIdList, @Param("saleStatus") Integer saleStatus);

    int countProductNumbers();
}
