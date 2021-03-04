package top.woohoo.mall.model.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 商品品类 数据库对象
 *
 * @author Emmett Woo
 * @since 2021/03/04
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
public class Category {
    private Integer id;
    private Integer parentId;
    private String name;
    private Boolean status;
    private Date createTime;
    private Date updateTime;
}