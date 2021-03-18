package top.woohoo.mall.model.po;

import io.swagger.annotations.ApiModel;
import lombok.*;

import java.io.Serializable;
import java.util.Date;

/**
 * 商城购物车表
 * @author wuzhihong
 * @since 2021/03/17
 */
@Data
@ApiModel(value = "MallCart对象", description = "商城购物车表")
public class MallCart implements Serializable {

    private static final long serialVersionUID = 1L;


    private Integer id;
    private Integer userId;
    private Integer productId;
    private Integer quantity;
    private Integer checked;
    private Date createTime;
    private Date updateTime;
}