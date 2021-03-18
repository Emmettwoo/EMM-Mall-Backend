package top.woohoo.mall.model.po;

import lombok.*;

import java.util.Date;

@Data
public class MallPayInfo {
    private Integer id;
    private Integer userId;
    private Long orderNo;
    private Integer payPlatform;
    private String platformNumber;
    private String platformStatus;
    private Date createTime;
    private Date updateTime;
}