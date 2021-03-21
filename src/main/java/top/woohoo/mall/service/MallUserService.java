package top.woohoo.mall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import top.woohoo.mall.model.dto.user.MallUserListDTO;
import top.woohoo.mall.model.po.MallUser;

import java.util.List;

/**
 * 商城用户表 服务接口类
 * @author wuzhihong
 * @since 2021-03-20
 */
public interface MallUserService extends IService<MallUser> {

    /**
     * 获取用户列表
     * @param dto 筛选条件
     * @return 用户列表
     */
    List<MallUser> listUser(MallUserListDTO dto);
}
