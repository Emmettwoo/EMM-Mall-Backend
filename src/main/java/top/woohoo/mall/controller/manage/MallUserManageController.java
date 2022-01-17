package top.woohoo.mall.controller.manage;

import com.google.common.collect.Lists;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import top.woohoo.mall.common.ResponseData;
import top.woohoo.mall.controller.MallBasicController;
import top.woohoo.mall.model.dto.user.MallUserListDTO;
import top.woohoo.mall.model.po.MallUser;
import top.woohoo.mall.service.MallUserService;

import javax.validation.Valid;
import java.util.ArrayList;

/**
 * 商城用户表 后台接口控制器
 *
 * @author Emmett Woo
 * @since 2021/03/20
 */
@RestController
@RequestMapping("/api/v2/manage/user")
@Api(tags = "EMM-Mall商城 Version2")
public class MallUserManageController extends MallBasicController {

    private final MallUserService userService;

    public MallUserManageController(MallUserService userService) {
        this.userService = userService;
    }

    @GetMapping("/list")
    @ApiOperation(value = "【后台】用户模块-用户列表", response = MallUser.class, responseContainer = "List")
    public ResponseData<ArrayList<MallUser>> listExaminationInPage(@Valid MallUserListDTO dto,
                                                                   BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return this.commonResponse(bindingResult);
        }

        return this.commonResponse(Lists.newArrayList(userService.listUser(dto)));
    }
}
