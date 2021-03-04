package top.woohoo.mall.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.mapper.CategoryMapper;
import top.woohoo.mall.model.pojo.Category;
import top.woohoo.mall.service.CategoryService;

import java.util.List;
import java.util.Set;

@Service
@Slf4j
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public ServerResponse addCategory(String categoryName, Integer parentId) {
        // 第一个条件永远为假吧，因为parentId存在默认值0
        if (parentId == null || StringUtils.isBlank(categoryName)) {
            return ServerResponse.createByErrorMessage("添加参数错误");
        }
        Category category = new Category();
        category.setName(categoryName);
        category.setParentId(parentId);
        category.setStatus(true);

        if (categoryMapper.insert(category) > 0) {
            return ServerResponse.createBySuccessMessage("添加分类成功");
        }
        return ServerResponse.createByErrorMessage("添加分类失败");
    }

    @Override
    public ServerResponse updateCategory(Integer categoryId, Integer parentId, String categoryName,
                                         Boolean status) {
        Category category = categoryMapper.selectByPrimaryKey(categoryId);
        if (category == null) {
            return ServerResponse.createByErrorMessage("修改目标分类不存在");
        }

        category.setParentId(parentId);
        category.setName(categoryName);
        category.setStatus(status);
        if (categoryMapper.updateByPrimaryKeySelective(category) > 0) {
            return ServerResponse.createBySuccessMessage("修改分类信息成功");
        }
        return ServerResponse.createByErrorMessage("修改分类信息失败");
    }

    @Override
    public ServerResponse deleteCategory(Integer categoryId) {
        if (!this.getCategoryChildren(categoryId).getData().isEmpty()) {
            return ServerResponse.createByErrorMessage("该分类下存在子分类，不能删除");
        } else {
            if (categoryMapper.deleteByPrimaryKey(categoryId) > 0) {
                return ServerResponse.createBySuccessMessage("分类删除成功");
            } else {
                return ServerResponse.createByErrorMessage("目标分类不存在");
            }
        }
    }


    @Override
    public ServerResponse<List<Category>> getCategoryChildren(Integer parentId) {
        List<Category> categories = categoryMapper.selectCategoryChildrenByParentId(parentId);
        if (categories.isEmpty()) {
            log.info("未找到当前分类的子类");
        }
        return ServerResponse.createBySuccess(categories);
    }

    @Override
    public ServerResponse<List<Category>> getCategoryOffspring(Integer parentId) {

        if (parentId == null) {
            return ServerResponse.createByErrorMessage("目标分类为空");
        }

        Set<Category> categorySet = Sets.newHashSet();
        // 不用接收参数？Set是引用传递？
        this.categoryOffspring(parentId, categorySet);
        if (categorySet.isEmpty()) {
            log.info("未找到当前分类的子孙分类");
        }

        // 将Set结果复制到List以便返回
        List<Category> categoryList = Lists.newArrayList();
        categoryList.addAll(categorySet);
        return ServerResponse.createBySuccess(categoryList);
    }

    // 递归遍历子分类的子分类，以实现子孙分类的获取。
    private Set<Category> categoryOffspring(Integer parentId, Set<Category> categorySet) {
        // 查找当前分类信息
        Category category = categoryMapper.selectByPrimaryKey(parentId);
        // 分类不为空则添加
        if (category != null) {
            categorySet.add(category);
        }
        // 查找当前分类的子分类
        List<Category> categoryList = categoryMapper.selectCategoryChildrenByParentId(parentId);
        // 递归遍历子分类，直到list为空
        for (Category item : categoryList) {
            categoryOffspring(item.getId(), categorySet);
        }
        return categorySet;
    }
}