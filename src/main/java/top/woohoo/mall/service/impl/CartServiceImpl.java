package top.woohoo.mall.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.woohoo.mall.common.Const;
import top.woohoo.mall.common.ResponseCode;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.mapper.CartMapper;
import top.woohoo.mall.mapper.ProductMapper;
import top.woohoo.mall.model.pojo.Cart;
import top.woohoo.mall.model.pojo.Product;
import top.woohoo.mall.model.vo.Cart.CartProductVO;
import top.woohoo.mall.model.vo.Cart.CartVO;
import top.woohoo.mall.service.CartService;
import top.woohoo.mall.util.BigDecimalUtil;
import top.woohoo.mall.util.PropertiesUtil;

import java.math.BigDecimal;
import java.util.List;

@Service
public class CartServiceImpl extends ServiceImpl<CartMapper, Cart> implements CartService {

    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private ProductMapper productMapper;


    @Override
    public ServerResponse<CartVO> add(Integer userId, Integer productId, Integer amount) {
        if (productId == null || amount == null) {
            return ServerResponse.createByCodeMessage(
                    ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }
        if (amount <= 0) {
            return ServerResponse.createByErrorMessage("添加数量必须大于零");
        }
        Product product = productMapper.selectById(productId);
        if (product == null || product.getStatus() == Const.ProductStatusEnum.NOT_SALE.getCode()) {
            return ServerResponse.createByErrorMessage("商品不存在或不是在售状态");
        }

        Cart cart = cartMapper.selectCartByUserIdAndProductId(userId, productId);
        if (cart == null) {
            Cart newCart = new Cart();
            newCart.setUserId(userId);
            newCart.setProductId(productId);
            newCart.setQuantity(amount);
            newCart.setChecked(Const.CartItem.CHECKED);
            cartMapper.insert(newCart);
        } else {
            cart.setQuantity(cart.getQuantity() + amount);
            cartMapper.updateById(cart);
        }
        return this.list(userId);
    }

    @Override
    public ServerResponse<CartVO> delete(Integer userId, String productIds) {
        List<String> productIdList = Splitter.on(",").splitToList(productIds);
        if (productIdList.isEmpty()) {
            return ServerResponse.createByErrorMessage("接收删除目标失败");
        }
        // 购物车中若不存在该商品时，不做判断，仍正常执行。
        cartMapper.deleteByUserIdAndProductIdList(userId, productIdList);
        return this.list(userId);
    }

    @Override
    public ServerResponse<CartVO> update(Integer userId, Integer productId, Integer amount) {
        if (productId == null || amount == null) {
            return ServerResponse.createByCodeMessage(
                    ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }

        if (amount <= 0) {
            return ServerResponse.createByErrorMessage("商品数量必须大于零");
        }

        Product product = productMapper.selectByPrimaryKey(productId);
        if (product == null || product.getStatus() == Const.ProductStatusEnum.NOT_SALE.getCode()) {
            return ServerResponse.createByErrorMessage("商品不存在或不是在售状态");
        }

        // 购物车中若不存在该商品时，不做处理，正常返回。
        Cart cart = cartMapper.selectCartByUserIdAndProductId(userId, productId);
        if (cart != null) {
            cart.setQuantity(amount);
            cartMapper.updateByPrimaryKey(cart);
        }
        return this.list(userId);
    }

    @Override
    public ServerResponse<CartVO> list(Integer userId) {
        return ServerResponse.createBySuccess(this.assembleCartVO(userId));
    }

    @Override
    public ServerResponse<CartVO> clear(Integer userId) {
        cartMapper.deleteByUserIdAndProductIdList(userId, null);
        return this.list(userId);
    }

    @Override
    public ServerResponse<Integer> count(Integer userId, Integer checkedMode) {
        return ServerResponse.createBySuccess(cartMapper.selectCartProductCountByUserId(userId, checkedMode));
    }


    @Override
    public ServerResponse<CartVO> checkedOrUnchecked(Integer userId, Integer productId, Integer checkedMode) {
        cartMapper.checkedOrUncheckedByUserIdAndProductId(userId, productId, checkedMode);
        return this.list(userId);
    }


    private CartVO assembleCartVO(Integer userId) {
        if (userId == null) {
            return null;
        }

        CartVO cartVO = new CartVO();
        BigDecimal cartTotalPrice = new BigDecimal("0");
        List<CartProductVO> cartProductVOList = Lists.newArrayList();

        List<Cart> cartList = cartMapper.selectCartByUserId(userId);
        // 此时每个cart只有一个product，且不重复（参考this.add()方法）。
        if (cartList.size() != 0) {
            for (Cart cart : cartList) {
                CartProductVO cartProductVO = new CartProductVO();
                cartProductVO.setId(cart.getId());
                cartProductVO.setUserId(cart.getUserId());
                cartProductVO.setProductId(cart.getProductId());

                // 如果商品存在且在售，组装VO属性，判断库存，计算总价。
                Product product = productMapper.selectByPrimaryKey(cartProductVO.getProductId());
                if (product != null) {
                    cartProductVO.setProductName(product.getName());
                    cartProductVO.setProductSubtitle(product.getSubtitle());
                    cartProductVO.setProductMainImage(product.getMainImage());
                    cartProductVO.setProductPrice(product.getPrice());
                    cartProductVO.setProductStatus(product.getStatus());
                    cartProductVO.setProductStock(product.getStock());

                    if (product.getStatus() == Const.ProductStatusEnum.ON_SALE.getCode()) {
                        cartProductVO.setProductChecked(cart.getChecked());
                    } else {
                        cartProductVO.setProductChecked(Const.CartItem.UN_CHECKED);
                    }

                    if (cartProductVO.getProductStock() >= cart.getQuantity()) {
                        cartProductVO.setOutOfStock(Const.CartItem.NOT_OUT_OF_STOCK);
                        cartProductVO.setQuantity(cart.getQuantity());
                    } else {
                        cartProductVO.setOutOfStock(Const.CartItem.IS_OUT_OF_STOCK);
                        cartProductVO.setQuantity(cartProductVO.getProductStock());

                        // 更新购物车的购买数量等于当前库存。
                        Cart cartNewQuantity = new Cart();
                        cartNewQuantity.setId(cartProductVO.getId());
                        cartNewQuantity.setQuantity(cartProductVO.getProductStock());
                        cartMapper.updateByPrimaryKeySelective(cartNewQuantity);
                    }

                    cartProductVO.setProductTotalPrice(BigDecimalUtil.multiply(
                            cartProductVO.getProductPrice().doubleValue(), cartProductVO.getQuantity()));
                    if (cartProductVO.getProductChecked() == Const.CartItem.CHECKED) {
                        cartTotalPrice = BigDecimalUtil.add(
                                cartTotalPrice.doubleValue(), cartProductVO.getProductTotalPrice().doubleValue());
                    }
                    cartProductVOList.add(cartProductVO);
                }
                /* 算了，不删除，忽略吧。
                 else {
                    // 如果商品不存在，删除该项。
                    cartMapper.deleteByPrimaryKey(cart.getId());
                }*/
            }
            cartVO.setCartProductVOList(cartProductVOList);
            cartVO.setCartTotalPrice(cartTotalPrice);
            cartVO.setAllChecked(cartMapper.selectCartProductCheckedStatusByUserId(userId) == 0);
            cartVO.setImageHost(PropertiesUtil.getProperty("ftp.server.http.prefix"));
        }

        return cartVO;
    }
}