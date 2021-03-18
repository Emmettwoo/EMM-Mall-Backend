package top.woohoo.mall.model.po;

import lombok.*;

import java.util.Date;

@Data
public class MallShipping {
    private Integer id;
    private Integer userId;
    private String receiverName;
    private String receiverPhone;
    private String receiverProvince;
    private String receiverCity;
    private String receiverDistrict;
    private String receiverAddress;
    private String receiverZip;
    private Integer status;
    private Date createTime;
    private Date updateTime;
}