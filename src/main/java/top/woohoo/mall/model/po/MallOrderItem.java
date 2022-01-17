package top.woohoo.mall.model.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 商城订单商品表
 *
 * @author Emmett Woo
 * @since 2021/04/28
 */
@Data
@EqualsAndHashCode(of = "id", callSuper = false)
@ApiModel(value = "MallOrderItem对象", description = "商城订单商品表")
public class MallOrderItem extends MallBasicPO implements Serializable {

    private static final long serialVersionUID = 6884508853995770556L;

    @ApiModelProperty(value = "订单商品编号（独立）")
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    @ApiModelProperty(value = "用户编号")
    private Long userId;

    @ApiModelProperty(value = "订单编号")
    private Long orderId;

    @ApiModelProperty(value = "商品编号")
    private Long productId;

    @ApiModelProperty(value = "商品名称")
    private String productName;

    @ApiModelProperty(value = "商品主图")
    private String productImage;

    @ApiModelProperty(value = "记录单价")
    private BigDecimal unitPrice;

    @ApiModelProperty(value = "下单数量")
    private Integer quantity;

    @ApiModelProperty(value = "商品总价")
    private BigDecimal totalPrice;
}