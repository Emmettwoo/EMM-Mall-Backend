package top.woohoo.mall.model.vo.Order;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import top.woohoo.mall.model.vo.OrderItem.OrderItemVO;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class OrderProductVO {
    private List<OrderItemVO> orderItemVOList;
    private BigDecimal productTotalPrice;
    private String imageHost;
}
