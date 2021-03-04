package top.woohoo.mall.controller.old.portal;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import top.woohoo.mall.common.Const;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.service.ProductService;
import top.woohoo.mall.model.vo.Product.ProductDetailVO;
import top.woohoo.mall.model.vo.Product.ProductListVO;

@Controller
@RequestMapping("/product/")
public class ProductController {

    @Autowired
    private ProductService productService;


    @RequestMapping("detail.do")
    @ResponseBody
    public ServerResponse<ProductDetailVO> productDetail(Integer productId) {
        return productService.onSaleProductDetail(productId);
    }


    @RequestMapping("search.do")
    @ResponseBody
    public ServerResponse<PageInfo<ProductListVO>> searchProducts(
            @RequestParam(value = "productId", required = false) Integer productId,
            @RequestParam(value = "productName", required = false) String productName,
            @RequestParam(value = "categoryId", defaultValue = "0") Integer categoryId,
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
            @RequestParam(value = "orderBy", defaultValue = "prize_asc") String orderBy) {
        return productService.searchProducts(productId, productName, categoryId,
                Const.ProductStatusEnum.ON_SALE.getCode(), pageNum, pageSize, orderBy);
    }
}