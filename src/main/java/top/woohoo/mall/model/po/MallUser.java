package top.woohoo.mall.model.po;

import lombok.*;

import java.util.Date;

@Data
public class MallUser {
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