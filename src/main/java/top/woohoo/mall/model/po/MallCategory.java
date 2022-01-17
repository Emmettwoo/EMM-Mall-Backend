package top.woohoo.mall.model.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * 商城商品品类表
 *
 * @author Emmett Woo
 * @since 2021/04/28
 */
@Data
@EqualsAndHashCode(of = "id", callSuper = false)
@ApiModel(value = "MallCategory对象", description = "商城商品品类表")
public class MallCategory extends MallBasicPO implements Serializable {

    private static final long serialVersionUID = 6484245993353237114L;

    @ApiModelProperty(value = "品类编号")
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    @ApiModelProperty(value = "父级品类")
    private Long parentId;

    @ApiModelProperty(value = "品类名称")
    private String name;

    @ApiModelProperty(value = "启用状态")
    private Integer enable;
}