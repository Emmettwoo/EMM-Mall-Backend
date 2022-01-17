package top.woohoo.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import top.woohoo.mall.common.ResponseException;
import top.woohoo.mall.enums.user.MallUserRoleEnum;
import top.woohoo.mall.mapper.MallUserMapper;
import top.woohoo.mall.model.dto.user.MallUserListDTO;
import top.woohoo.mall.model.po.MallUser;
import top.woohoo.mall.service.MallUserService;

import java.util.List;

/**
 * 商城用户表 服务实现类
 *
 * @author Emmett Woo
 * @since 2021-03-20
 */
@Service
public class MallUserServiceImpl extends ServiceImpl<MallUserMapper, MallUser> implements MallUserService {

    @Override
    public List<MallUser> listUser(MallUserListDTO dto) {

        // 模糊匹配传入的参数：编号、用户名、邮箱、手机号
        LambdaQueryWrapper<MallUser> wrapper = new LambdaQueryWrapper<MallUser>().like(dto.getUserId() != null,
                MallUser::getId, dto.getUserId()).like(dto.getUsername() != null, MallUser::getUsername,
                dto.getUsername()).like(dto.getEmail() != null, MallUser::getEmail, dto.getEmail()).like(dto.getPhone() != null, MallUser::getPhone, dto.getPhone());

        // 若传入账户类型名，检查是否存在并进行数据库匹配
        if (dto.getRole() != null) {
            MallUserRoleEnum userRole = MallUserRoleEnum.getByCode(dto.getRole());
            if (userRole == null) {
                throw new ResponseException(-1, "未找到指定的用户类型");
            } else {
                wrapper.eq(MallUser::getRole, userRole.getCode());
            }
        }

        return this.list(wrapper);
    }
}
