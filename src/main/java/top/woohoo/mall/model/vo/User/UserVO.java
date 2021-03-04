package top.woohoo.mall.model.vo.User;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UserVO {
    private Integer id;
    private String username;
    private String email;
    private String phone;
    private String question;
    private String role;
    private String createTime;
    private String updateTime;
}
