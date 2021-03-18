package top.woohoo.mall.model.po;

import lombok.*;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class MallProduct {
    private Integer id;
    private Integer categoryId;
    private String name;
    private String subtitle;
    private String mainImage;
    private String subImages;
    private String detail;
    private BigDecimal price;
    private Integer stock;
    private Integer status;
    private Date createTime;
    private Date updateTime;
}