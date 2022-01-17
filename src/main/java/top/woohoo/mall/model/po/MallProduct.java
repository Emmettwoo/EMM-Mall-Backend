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
 * 商城商品表
 *
 * @author Emmett Woo
 * @since 2021/04/28
 */
@Data
@EqualsAndHashCode(of = "id", callSuper = false)
@ApiModel(value = "MallProduct对象", description = "商城商品表")
public class MallProduct extends MallBasicPO implements Serializable {

    private static final long serialVersionUID = 7808300108172424849L;

    @ApiModelProperty(value = "商品编号")
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    @ApiModelProperty(value = "品类编号")
    private Long categoryId;

    @ApiModelProperty(value = "商品名称")
    private String name;

    @ApiModelProperty(value = "商品副标题")
    private String subtitle;

    @ApiModelProperty(value = "商品主图")
    private String mainImage;

    @ApiModelProperty(value = "商品副图组")
    private String subImages;

    @ApiModelProperty(value = "商品详情")
    private String detail;

    @ApiModelProperty(value = "商品单价")
    private BigDecimal price;

    @ApiModelProperty(value = "商品库存")
    private Integer stock;

    @ApiModelProperty(value = "在售状态")
    private Integer status;
}