package top.woohoo.mall.model.po;

import lombok.*;

import java.util.Date;

@Data
@EqualsAndHashCode(of = "id")
public class MallCategory {
    private Integer id;
    private Integer parentId;
    private String name;
    private Boolean status;
    private Date createTime;
    private Date updateTime;
}