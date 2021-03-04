package top.woohoo.mall.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.woohoo.mall.common.Const;
import top.woohoo.mall.common.ResponseCode;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.mapper.CategoryMapper;
import top.woohoo.mall.mapper.ProductMapper;
import top.woohoo.mall.model.pojo.Category;
import top.woohoo.mall.model.pojo.Product;
import top.woohoo.mall.service.CategoryService;
import top.woohoo.mall.service.ProductService;
import top.woohoo.mall.util.DateTimeUtil;
import top.woohoo.mall.util.PropertiesUtil;
import top.woohoo.mall.model.vo.Product.ProductDetailVO;
import top.woohoo.mall.model.vo.Product.ProductListVO;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {

    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private CategoryService categoryService;


    @Override
    public ServerResponse saveProduct(Product product) {
        if (productMapper.updateByPrimaryKeySelective(product) > 0) {
            return ServerResponse.createBySuccessMessage("产品信息保存成功");
        } else if (productMapper.insert(product) > 0) {
            if (product.getName() == null) {
                return ServerResponse.createByErrorMessage("产品名称不能为空");
            }
            if (product.getCategoryId() == null) {
                product.setCategoryId(0);
            }
            if (product.getPrice().doubleValue() <= 0) {
                return ServerResponse.createByErrorMessage("商品价格必须大于零");
            }
            return ServerResponse.createBySuccessMessage("产品信息创建成功");
        } else {
            return ServerResponse.createByErrorMessage("产品信息创建失败");
        }
    }

    @Override
    public ServerResponse setProductStatus(Integer productId, Integer status) {
        if (productId == null || status == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }

        Product product = new Product();
        product.setId(productId);
        product.setStatus(status);
        if (productMapper.updateByPrimaryKeySelective(product) > 0) {
            return ServerResponse.createBySuccessMessage("销售状态设置成功");
        }
        return ServerResponse.createByErrorMessage("设置失败，产品不存在");
    }

    @Override
    public ServerResponse deleteProduct(Integer productId) {
        if (productId == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }

        if (productMapper.deleteByPrimaryKey(productId) > 0) {
            return ServerResponse.createBySuccessMessage("商品信息删除成功");
        }
        return ServerResponse.createByErrorMessage("删除失败，产品不存在");
    }

    @Override
    public ServerResponse<ProductDetailVO> productDetail(Integer productId) {
        if (productId == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }
        Product product = productMapper.selectByPrimaryKey(productId);
        if (product == null) {
            return ServerResponse.createByErrorMessage("编辑失败，产品不存在");
        }

        return ServerResponse.createBySuccess(this.assembleProductDetailVO(product));
    }

    @Override
    public ServerResponse<ProductDetailVO> onSaleProductDetail(Integer productId) {
        if (productId == null) {
            return ServerResponse.createByCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }
        Product product = productMapper.selectByPrimaryKey(productId);
        if (product == null) {
            return ServerResponse.createByErrorMessage("查看失败，产品不存在");
        }
        if (product.getStatus() != Const.ProductStatusEnum.ON_SALE.getCode()) {
            return ServerResponse.createByErrorMessage("查看失败，产品不在售");
        }

        return ServerResponse.createBySuccess(this.assembleProductDetailVO(product));
    }

    @Override
    public ServerResponse<PageInfo<ProductListVO>> searchProducts(Integer productId, String productName, Integer categoryId,
                                                                  Integer saleStatus, int pageNum, int pageSize, String orderBy) {
        // 有搜索关键字则处理，没有设为null不匹配。
        if (StringUtils.isNotBlank(productName)) {
            productName = "%" + productName + "%";
        } else {
            productName = null;
        }

        // 分类id为零则设为null不匹配，目标分类不存在时返回错误，存在时储存其所有子孙分类（含自身）。
        List<Integer> categoryIdList = new ArrayList<>();
        Category category = categoryMapper.selectByPrimaryKey(categoryId);
        if (categoryId == 0) {
            categoryIdList = null;
        } else if (category == null) {
            return ServerResponse.createByErrorMessage("找不到目标分类");
        } else {
            for (Category item : categoryService.getCategoryOffspring(categoryId).getData()) {
                categoryIdList.add(item.getId());
            }
        }

        PageHelper.startPage(pageNum, pageSize);
        // 处理排序问题，你就继续惯着PageHelper吧。
        if (StringUtils.isNotBlank(orderBy)) {
            if (Const.ProductListOrderBy.PRICE_ASC_DESC.contains(orderBy)) {
                String[] orderByArray = orderBy.split("_");
                PageHelper.orderBy(orderByArray[0] + " " + orderByArray[1]);
            }
        }

        // 开始查找符合条件的产品数据
        List<Product> productList = productMapper.searchProducts(productId, productName, categoryIdList, saleStatus);
        List<ProductListVO> productListVOList = this.assembleProductListVO(productList);

        PageInfo pageInfo = new PageInfo<>(productList);
        pageInfo.setList(productListVOList);
        return ServerResponse.createBySuccess((PageInfo<ProductListVO>) pageInfo);
    }


    // 用Product对象生成ProductDetailVO对象
    private ProductDetailVO assembleProductDetailVO(Product product) {
        ProductDetailVO productDetailVO = new ProductDetailVO();
        productDetailVO.setId(product.getId());
        productDetailVO.setCategoryId(product.getCategoryId());
        productDetailVO.setName(product.getName());
        productDetailVO.setSubtitle(product.getSubtitle());
        productDetailVO.setMainImage(product.getMainImage());
        productDetailVO.setSubImages(product.getSubImages());
        productDetailVO.setDetail(product.getDetail());
        productDetailVO.setPrice(product.getPrice());
        productDetailVO.setStock(product.getStock());
        productDetailVO.setStatus(product.getStatus());

        productDetailVO.setImageHost(PropertiesUtil.getProperty("ftp.server.http.prefix", "http://img.woohoo.top/"));
        // 解决商品品类id是0时，品类条目不存在的bug。（虽然理论上根品类0不存放商品）
        Category category = categoryMapper.selectByPrimaryKey(product.getCategoryId());
        productDetailVO.setParentCategoryId((category != null ? category.getParentId() : null));
        productDetailVO.setCreateTime(DateTimeUtil.timestamp2FormatTime(product.getCreateTime()));
        productDetailVO.setUpdateTime(DateTimeUtil.timestamp2FormatTime(product.getUpdateTime()));

        return productDetailVO;
    }

    // 用Product对象列表生成ProductListVO对象列表
    private List<ProductListVO> assembleProductListVO(List<Product> productList) {
        List<ProductListVO> productListVOList = Lists.newArrayList();
        for (Product product : productList) {
            ProductListVO productListVO = new ProductListVO();
            productListVO.setId(product.getId());
            productListVO.setCategoryId(product.getCategoryId());
            productListVO.setName(product.getName());
            productListVO.setSubtitle(product.getSubtitle());
            productListVO.setMainImage(product.getMainImage());
            productListVO.setPrice(product.getPrice());
            productListVO.setStock(product.getStock());
            productListVO.setStatus(product.getStatus());
            productListVO.setImageHost(PropertiesUtil.getProperty("ftp.server.http.prefix", "http://img.woohoo.top/"));

            productListVOList.add(productListVO);
        }
        return productListVOList;
    }
}