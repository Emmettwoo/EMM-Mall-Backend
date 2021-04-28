package top.woohoo.mall.model.dto.user;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

/**
 * @author Emmett Woo
 * @since 2021/03/20
 */
@Data
@ApiModel("商城用户 列表DTO")
public class MallUserListDTO {

    @ApiModelProperty(value = "用户编号")
    private Integer userId;

    @ApiModelProperty(value = "用户邮箱")
    private String email;

    @ApiModelProperty(value = "用户手机号码")
    private String phone;

    @ApiModelProperty(value = "用户名")
    private String username;

    @Min(value = 0, message = "用户角色类型值错误")
    @Max(value = 1, message = "用户角色类型值错误")
    @ApiModelProperty(value = "用户角色类型")
    private Integer role;
}
