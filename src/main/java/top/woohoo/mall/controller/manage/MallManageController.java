package top.woohoo.mall.controller.manage;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api/v2/manage")
public class MallManageController {

    @GetMapping("/help")
    public String help(@RequestParam(value = "name", defaultValue = "my friend") String name) {
        log.info(name + " visited help page.\n");
        StringBuffer welcomeSB = new StringBuffer();
        welcomeSB.append(String.format("Welcome to EMM-Mall, %s!\n", name));
        welcomeSB.append("This application is the new version of EMM-Mall-Backend\n");
        welcomeSB.append("which is base on SpringBoot and lots of java frameworks\n");
        welcomeSB.append("for practice purpose, hope you enjoy your time.\n");
        welcomeSB.append("By Emmett Woo @ 2021/03/17");
        return welcomeSB.toString();
    }
}
