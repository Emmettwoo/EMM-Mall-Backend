package top.woohoo.mall.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import top.woohoo.mall.mapper.OrderItemMapper;
import top.woohoo.mall.model.pojo.OrderItem;
import top.woohoo.mall.service.OrderItemService;

@Service
@Slf4j
public class OrderItemServiceImpl extends ServiceImpl<OrderItemMapper, OrderItem> implements OrderItemService {
}