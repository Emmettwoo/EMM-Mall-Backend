package top.woohoo.mall.model.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 商城订单表
 *
 * @author Emmett Woo
 * @since 2021/04/28
 */
@Data
@EqualsAndHashCode(of = "id", callSuper = false)
@ApiModel(value = "MallOrder对象", description = "商城订单表")
public class MallOrder extends MallBasicPO implements Serializable {

    private static final long serialVersionUID = -8009318967046532510L;

    @ApiModelProperty(value = "订单编号")
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    @ApiModelProperty(value = "用户编号")
    private Long userId;

    @ApiModelProperty(value = "收货地址编号")
    private Long shippingId;

    @ApiModelProperty(value = "支付金额")
    private BigDecimal payment;

    @ApiModelProperty(value = "支付类型")
    private Integer paymentType;

    @ApiModelProperty(value = "支付运费")
    private Integer postage;

    @ApiModelProperty(value = "订单状态")
    private Integer status;

    @ApiModelProperty(value = "支付时间")
    private Date paymentTime;

    @ApiModelProperty(value = "发货时间")
    private Date sendTime;

    @ApiModelProperty(value = "完成时间")
    private Date endTime;

    @ApiModelProperty(value = "关闭时间")
    private Date closeTime;
}