package top.woohoo.mall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import top.woohoo.mall.model.pojo.Category;

import java.util.List;

/**
 * 商品品类表
 *
 * @author Emmett Woo
 * @since 2021/03/04
 */
@Mapper
public interface CategoryMapper extends BaseMapper<Category> {

    int deleteByPrimaryKey(Integer id);

    @Override
    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);


    List<Category> selectCategoryChildrenByParentId(Integer parentId);
}
