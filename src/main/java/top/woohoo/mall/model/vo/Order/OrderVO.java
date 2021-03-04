package top.woohoo.mall.model.vo.Order;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import top.woohoo.mall.model.vo.OrderItem.OrderItemVO;
import top.woohoo.mall.model.vo.Shipping.ShippingVO;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class OrderVO {
    private Long orderNo;
    private Integer userId;
    private Integer shippingId;
    private BigDecimal payment;
    private Integer paymentType;
    private String paymentTypeDesc;
    private Integer postage;
    private Integer status;
    private String statusDesc;
    private String paymentTime;
    private String sendTime;
    private String endTime;
    private String closeTime;
    private String createTime;

    private List<OrderItemVO> orderItemVOList;

    private String receiverName;
    private ShippingVO shippingVO;

    private String imageHost;
}
