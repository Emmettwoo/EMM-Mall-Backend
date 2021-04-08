package top.woohoo.mall.controller.manage;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import top.woohoo.mall.common.ResponseData;
import top.woohoo.mall.controller.MallBasicController;
import top.woohoo.mall.model.dto.user.MallUserListDTO;
import top.woohoo.mall.model.po.MallUser;
import top.woohoo.mall.service.MallUserService;

import javax.validation.Valid;
import java.util.List;

/**
 * 商城用户表 后台接口控制器
 * @author Emmett Woo
 * @since 2021/03/20
 */
@RestController
@RequestMapping("/api/v2/manage/user")
@Api(tags = "EMM-Mall商城 Version2")
public class MallUserManageController extends MallBasicController {

    @Autowired
    private MallUserService userService;

    @GetMapping("/list")
    @ApiOperation(value = "【后台】用户模块-用户列表", response = MallUser.class, responseContainer = "List")
    public ResponseData<List<MallUser>> listExaminationInPage(@RequestBody @Valid MallUserListDTO dto, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return this.commonResponse(bindingResult);
        }

        return this.commonResponse(userService.listUser(dto));
    }
}
