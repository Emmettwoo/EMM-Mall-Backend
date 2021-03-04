package top.woohoo.mall.service.impl;

import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.dao.OrderMapper;
import top.woohoo.mall.dao.ProductMapper;
import top.woohoo.mall.dao.UserMapper;
import top.woohoo.mall.service.IStatisticService;

import java.util.Map;

@Service("iStatisticService")
public class StatisticServiceImpl implements IStatisticService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private OrderMapper orderMapper;


    @Override
    public ServerResponse<Map<String, Integer>> baseCount() {
        Map<String, Integer> statisticMap = Maps.newHashMap();

        statisticMap.put("userCount", userMapper.countUserNumbers());
        statisticMap.put("productCount", productMapper.countProductNumbers());
        statisticMap.put("orderCount", orderMapper.countOrderNumbers());

        return ServerResponse.createBySuccess(statisticMap);
    }
}