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
 * 商城商品品类表
 * @author wuzhihong
 * @since 2021/04/28
 */
@Data
@EqualsAndHashCode(of = "id")
@ApiModel(value = "MallCategory对象", description = "商城商品品类表")
public class MallCategory implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "品类编号")
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    @ApiModelProperty(value = "父级品类")
    private Long parentId;

    @ApiModelProperty(value = "品类名称")
    private String name;

    @ApiModelProperty(value = "启用状态")
    private Integer enable;

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