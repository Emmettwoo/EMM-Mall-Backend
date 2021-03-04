package top.woohoo.mall.controller.old.backend;

import com.github.pagehelper.PageInfo;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import top.woohoo.mall.common.ResponseCode;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.model.pojo.Product;
import top.woohoo.mall.service.FileService;
import top.woohoo.mall.service.ProductService;
import top.woohoo.mall.service.UserService;
import top.woohoo.mall.util.PropertiesUtil;
import top.woohoo.mall.model.vo.Product.ProductDetailVO;
import top.woohoo.mall.model.vo.Product.ProductListVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/manage/product/")
public class ProductManageController {

    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;
    @Autowired
    private FileService fileService;


    @RequestMapping("save.do")
    @ResponseBody
    public ServerResponse saveProduct(HttpSession session, Product product) {
        if (userService.checkAdminRole(session)) {
            return productService.saveProduct(product);
        }
        return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "保存失败，用户未登入或无权操作");
    }

    @RequestMapping("set_status.do")
    @ResponseBody
    public ServerResponse setProductStatus(HttpSession session, Integer productId, Integer status) {
        if (userService.checkAdminRole(session)) {
            return productService.setProductStatus(productId, status);
        }
        return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "保存失败，用户未登入或无权操作");
    }

    @RequestMapping("detail.do")
    @ResponseBody
    public ServerResponse<ProductDetailVO> productDetail(HttpSession session, Integer productId) {
        if (userService.checkAdminRole(session)) {
            return productService.productDetail(productId);
        }
        return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "查询失败，用户未登入或无权操作");
    }

    @RequestMapping("delete.do")
    @ResponseBody
    public ServerResponse<PageInfo<ProductListVO>> deleteProduct(HttpSession session, Integer productId) {

        if (userService.checkAdminRole(session)) {
            return productService.deleteProduct(productId);
        } else {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "无法删除该商品，用户未登入或无权操作");
        }
    }

    @RequestMapping("search.do")
    @ResponseBody
    public ServerResponse<PageInfo<ProductListVO>> searchProducts(HttpSession session,
                                                                  @RequestParam(value = "productId", required = false) Integer productId,
                                                                  @RequestParam(value = "productName", required = false) String productName,
                                                                  @RequestParam(value = "categoryId", defaultValue = "0") Integer categoryId,
                                                                  @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                                                  @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
                                                                  @RequestParam(value = "orderBy", defaultValue = "prize_asc") String orderBy) {

        if (userService.checkAdminRole(session)) {
            return productService.searchProducts(productId, productName, categoryId, null, pageNum, pageSize, orderBy);
        } else {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "无法获取商品列表，用户未登入或无权操作");
        }
    }


    @RequestMapping("upload_origin_image.do")
    @ResponseBody
    public ServerResponse<Map<String, String>> uploadOriginImage(MultipartFile file, HttpServletRequest request) {
        String path = request.getSession().getServletContext().getRealPath("upload");
        if (userService.checkAdminRole(request.getSession())) {
            ServerResponse<String> result = fileService.upload(file, path);
            if (!result.isSuccess()) {
                return ServerResponse.createByErrorMessage(result.getMsg());
            }
            String targetFileName = result.getData();
            Map<String, String> fileMap = Maps.newHashMap();
            fileMap.put("uri", targetFileName);
            fileMap.put("url", PropertiesUtil.getProperty("ftp.server.http.prefix") + targetFileName);
            return ServerResponse.createBySuccess(fileMap);
        }
        return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "上传失败，用户未登入或无权操作");
    }

    @RequestMapping("upload_richtext_image.do")
    @ResponseBody
    public Map<String, Object> uploadRichtextImage(MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> resultMap = Maps.newHashMap();
        String path = request.getSession().getServletContext().getRealPath("upload_file");
        if (userService.checkAdminRole(request.getSession())) {
            ServerResponse<String> result = fileService.upload(file, path);
            if (!result.isSuccess()) {
                resultMap.put("success", false);
                resultMap.put("msg", result.getMsg());
            }
            String targetFileName = result.getData();
            if (targetFileName == null) {
                resultMap.put("success", false);
                resultMap.put("msg", "上传文件到服务器期间出现错误");
            } else {
                resultMap.put("success", true);
                resultMap.put("file_path", PropertiesUtil.getProperty("ftp.server.http.prefix") + targetFileName);
                response.addHeader("Access-Control-Allow-Headers", "X-File-Name");
            }
        } else {
            resultMap.put("success", false);
            resultMap.put("msg", "上传失败，用户未登入或无权操作");
        }
        return resultMap;
    }

    // todo: 提供删除图片接口（危险）
}