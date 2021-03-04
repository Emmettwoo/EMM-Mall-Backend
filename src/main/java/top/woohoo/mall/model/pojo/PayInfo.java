package top.woohoo.mall.model.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 支付信息 数据库对象
 *
 * @author Emmett Woo
 * @since 2021/03/04
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PayInfo {
    private Integer id;
    private Integer userId;
    private Long orderNo;
    private Integer payPlatform;
    private String platformNumber;
    private String platformStatus;
    private Date createTime;
    private Date updateTime;
}