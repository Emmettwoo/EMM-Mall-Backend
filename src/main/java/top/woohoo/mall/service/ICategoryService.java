package top.woohoo.mall.service;

import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.pojo.Category;

import java.util.List;

public interface ICategoryService {
    ServerResponse addCategory(String categoryName, Integer parentId);
    ServerResponse updateCategory(Integer categoryId, Integer parentId, String categoryName,
                                  Boolean status);
    ServerResponse deleteCategory(Integer categoryId);

    ServerResponse<List<Category>> getCategoryChildren(Integer parentId);
    ServerResponse<List<Category>> getCategoryOffspring(Integer parentId);
}