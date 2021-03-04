package top.woohoo.mall.model.vo.Cart;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
public class CartProductVO {
    // 针对用户购物车的属性
    private Integer id;
    private Integer userId;
    private Integer productId;
    private Integer quantity;
    // 针对购物车具体商品的属性
    private String productName;
    private String productSubtitle;
    private String productMainImage;
    private BigDecimal productPrice;
    private Integer productStatus;
    private BigDecimal productTotalPrice;
    private Integer productStock;
    private Integer productChecked;
    // 购物车物品是否超出库存数量
    private String outOfStock;
}
