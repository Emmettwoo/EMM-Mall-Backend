package top.woohoo.mall.model.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * 商城支付信息表
 *
 * @author Emmett Woo
 * @since 2021/04/28
 */
@Data
@EqualsAndHashCode(of = "id", callSuper = false)
@ApiModel(value = "MallPayInfo对象", description = "商城支付信息表")
public class MallPayInfo extends MallBasicPO implements Serializable {

    private static final long serialVersionUID = -7803909195275576825L;

    @ApiModelProperty(value = "支付信息编号")
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    @ApiModelProperty(value = "用户编号")
    private Long userId;

    @ApiModelProperty(value = "订单编号")
    private Long orderId;

    @ApiModelProperty(value = "支付平台代码")
    private String platformCode;

    @ApiModelProperty(value = "支付平台订单编号")
    private String platformOrderNumber;

    @ApiModelProperty(value = "支付平台订单状态")
    private String platformOrderStatus;
}