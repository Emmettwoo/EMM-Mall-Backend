package top.woohoo.mall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.pagehelper.PageInfo;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.model.pojo.Product;
import top.woohoo.mall.model.vo.Product.ProductDetailVO;
import top.woohoo.mall.model.vo.Product.ProductListVO;

public interface ProductService extends IService<Product> {

    ServerResponse saveProduct(Product product);

    ServerResponse setProductStatus(Integer productId, Integer status);

    ServerResponse deleteProduct(Integer productId);

    ServerResponse<ProductDetailVO> productDetail(Integer productId);

    ServerResponse<PageInfo<ProductListVO>> searchProducts(Integer productId, String productName, Integer categoryId,
                                                           Integer saleStatus, int pageNum, int pageSize, String orderBy);

    ServerResponse<ProductDetailVO> onSaleProductDetail(Integer productId);
}