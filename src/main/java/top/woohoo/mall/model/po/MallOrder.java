package top.woohoo.mall.model.po;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 商城订单表
 * @author wuzhihong
 * @since 2021/04/28
 */
@Data
@EqualsAndHashCode(of = "id")
@ApiModel(value = "MallOrder对象", description = "商城订单表")
public class MallOrder implements Serializable {

    private static final long serialVersionUID = 1L;

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

    @ApiModelProperty(value = "创建用户")
    private String createBy;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    @ApiModelProperty(value = "更新用户")
    private String updateBy;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @ApiModelProperty(value = "备注")
    private String remark;
}