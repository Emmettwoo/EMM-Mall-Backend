package top.woohoo.mall.model.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * 商城购物车表
 *
 * @author Emmett Woo
 * @since 2021/03/20
 */
@Data
@EqualsAndHashCode(of = "id", callSuper = false)
@ApiModel(value = "MallCart对象", description = "商城购物车表")
public class MallCart extends MallBasicPO implements Serializable {

    private static final long serialVersionUID = -5765370040830183721L;

    @ApiModelProperty(value = "购物车编号")
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    @ApiModelProperty(value = "用户编号")
    private Long userId;

    @ApiModelProperty(value = "商品编号")
    private Long productId;

    @ApiModelProperty(value = "商品数量")
    private Integer quantity;

    @ApiModelProperty(value = "选中状态")
    private Integer checked;
}