package top.woohoo.mall.model.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 商城用户 数据库对象
 *
 * @author Emmett Woo
 * @since 2021/03/04
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

    private Integer id;
    private String username;
    private String password;
    private String email;
    private String phone;
    private String question;
    private String answer;
    private Integer role;
    private Date createTime;
    private Date updateTime;
}
