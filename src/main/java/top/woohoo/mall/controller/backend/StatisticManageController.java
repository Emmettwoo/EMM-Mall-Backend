package top.woohoo.mall.controller.backend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.woohoo.mall.common.Const;
import top.woohoo.mall.common.ResponseCode;
import top.woohoo.mall.common.ServerResponse;
import top.woohoo.mall.pojo.User;
import top.woohoo.mall.service.IStatisticService;
import top.woohoo.mall.service.IUserService;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/manage/statistic/")
public class StatisticManageController {

    @Autowired
    private IUserService iUserService;
    @Autowired
    private IStatisticService iStatisticService;


    @RequestMapping("base_count.do")
    @ResponseBody
    public ServerResponse<Map<String, Integer>> baseCount(HttpSession session) {
        if (iUserService.checkAdminRole(session)) {
            return iStatisticService.baseCount();
        } else {
            return ServerResponse.createByCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "无法获取统计数据，用户未登入或无权操作");
        }
    }
}