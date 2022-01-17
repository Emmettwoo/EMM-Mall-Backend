package top.woohoo.mall.model.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * 商城收货地址表
 *
 * @author Emmett Woo
 * @since 2021/04/28
 */
@Data
@EqualsAndHashCode(of = "id", callSuper = false)
@ApiModel(value = "MallShipping对象", description = "商城收货地址表")
public class MallShipping extends MallBasicPO implements Serializable {

    private static final long serialVersionUID = -8639800289794591698L;

    @ApiModelProperty(value = "收货地址编号")
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    @ApiModelProperty(value = "启用状态")
    private Long userId;

    @ApiModelProperty(value = "收件人名称")
    private String receiverName;

    @ApiModelProperty(value = "收件人联系方式")
    private String receiverPhone;

    @ApiModelProperty(value = "收件省份")
    private String receiverProvince;

    @ApiModelProperty(value = "收件城市")
    private String receiverCity;

    @ApiModelProperty(value = "收件区县")
    private String receiverDistrict;

    @ApiModelProperty(value = "详细地址")
    private String receiverAddress;

    @ApiModelProperty(value = "地址邮编")
    private String receiverZip;

    @ApiModelProperty(value = "启用状态")
    private Integer status;
}