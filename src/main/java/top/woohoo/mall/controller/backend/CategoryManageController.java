package top.woohoo.mall.controller.backend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import top.woohoo.mall.common.Const;
import top.woohoo.mall.common.ResponseCode;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.pojo.Category;
import top.woohoo.mall.pojo.User;
import top.woohoo.mall.service.ICategoryService;
import top.woohoo.mall.service.IUserService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/manage/category/")
public class CategoryManageController {

    @Autowired
    private IUserService iUserService;
    @Autowired
    private ICategoryService iCategoryService;


    @RequestMapping("add.do")
    @ResponseBody
    public ServerResponse addCategory(HttpSession session, String categoryName, @RequestParam(value = "parentId", defaultValue = "0") int parentId) {
        if (iUserService.checkAdminRole(session)) {
            return iCategoryService.addCategory(categoryName, parentId);
        } else {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "新增失败，用户未登入或无权操作");
        }
    }

    @RequestMapping("update.do")
    @ResponseBody
    public ServerResponse updateCategory(HttpSession session, Integer categoryId, Integer parentId,
                                         String categoryName, Boolean status) {
        if (iUserService.checkAdminRole(session)) {
            return iCategoryService.updateCategory(categoryId, parentId, categoryName, status);
        } else {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "修改失败，用户未登入或无权操作");
        }
    }

    @RequestMapping("delete.do")
    @ResponseBody
    public ServerResponse deleteCategory(HttpSession session, Integer categoryId) {
        if (iUserService.checkAdminRole(session)) {
            return iCategoryService.deleteCategory(categoryId);
        } else {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "删除失败，用户未登入或无权操作");
        }
    }

    @RequestMapping("get_children.do")
    @ResponseBody
    public ServerResponse<List<Category>> getCategoryChildren(HttpSession session, @RequestParam(value = "parentId", defaultValue = "0") Integer parentId) {
        if (iUserService.checkAdminRole(session)) {
            return iCategoryService.getCategoryChildren(parentId);
        } else {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "查询失败，用户未登入或无权操作");
        }
    }

    @RequestMapping("get_offspring.do")
    @ResponseBody
    public ServerResponse<List<Category>> getCategoryOffspring(HttpSession session, @RequestParam(value = "parentId", defaultValue = "0") Integer parentId) {
        if (iUserService.checkAdminRole(session)) {
            return iCategoryService.getCategoryOffspring(parentId);
        } else {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "查询失败，用户未登入或无权操作");
        }
    }
}