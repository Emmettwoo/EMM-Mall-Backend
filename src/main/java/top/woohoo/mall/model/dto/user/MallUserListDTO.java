package top.woohoo.mall.model.dto.user;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

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

    @ApiModelProperty(value = "用户角色类型")
    private String role;
}
