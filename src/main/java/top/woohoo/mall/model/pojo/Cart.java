package top.woohoo.mall.model.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 购物车 数据库对象
 *
 * @author Emmett Woo
 * @since 2021/03/04
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private Integer id;
    private Integer userId;
    private Integer productId;
    private Integer quantity;
    private Integer checked;
    private Date createTime;
    private Date updateTime;
}