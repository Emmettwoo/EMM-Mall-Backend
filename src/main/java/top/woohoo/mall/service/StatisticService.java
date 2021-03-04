package top.woohoo.mall.service;

import top.woohoo.mall.common.ServerResponse;

import java.util.Map;

public interface StatisticService {
    ServerResponse<Map<String, Integer>> baseCount();
}