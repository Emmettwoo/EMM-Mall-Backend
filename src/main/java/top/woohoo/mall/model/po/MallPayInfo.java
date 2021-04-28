package top.woohoo.mall.model.po;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.io.Serializable;
import java.util.Date;

/**
 * 商城支付信息表
 * @author wuzhihong
 * @since 2021/04/28
 */
@Data
@EqualsAndHashCode(of = "id")
@ApiModel(value = "MallPayInfo对象", description = "商城支付信息表")
public class MallPayInfo implements Serializable {

    private static final long serialVersionUID = 1L;

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