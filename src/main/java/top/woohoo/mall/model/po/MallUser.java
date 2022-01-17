package top.woohoo.mall.model.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * 商城用户表
 *
 * @author Emmett Woo
 * @since 2021/04/28
 */
@Data
@EqualsAndHashCode(of = "id", callSuper = false)
@ApiModel(value = "MallUser对象", description = "商城用户表")
public class MallUser extends MallBasicPO implements Serializable {

    private static final long serialVersionUID = -4551802946085908899L;

    @ApiModelProperty(value = "用户编号")
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    @ApiModelProperty(value = "用户昵称")
    private String username;

    @ApiModelProperty(value = "用户密码")
    private String password;

    @ApiModelProperty(value = "用户邮箱")
    private String email;

    @ApiModelProperty(value = "手机号码")
    private String phone;

    @ApiModelProperty(value = "密保问题")
    private String question;

    @ApiModelProperty(value = "密保问题答案")
    private String answer;

    @ApiModelProperty(value = "用户类型")
    private Integer role;
}