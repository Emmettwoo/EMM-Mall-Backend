package top.woohoo.mall.controller.old.backend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.woohoo.mall.common.ResponseCode;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.service.StatisticService;
import top.woohoo.mall.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/manage/statistic/")
public class StatisticManageController {

    @Autowired
    private UserService userService;
    @Autowired
    private StatisticService statisticService;


    @RequestMapping("base_count.do")
    @ResponseBody
    public ServerResponse<Map<String, Integer>> baseCount(HttpSession session) {
        if (userService.checkAdminRole(session)) {
            return statisticService.baseCount();
        } else {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "无法获取统计数据，用户未登入或无权操作");
        }
    }
}