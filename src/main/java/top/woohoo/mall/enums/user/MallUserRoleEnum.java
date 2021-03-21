package top.woohoo.mall.enums.user;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 商城用户 账户类型 枚举类
 * @author Emmett Woo
 * @since 2021/03/20
 */
@Getter
@AllArgsConstructor
public enum MallUserRoleEnum {

    /**
     账户类型枚举定义
     */
    TYPE_ADMINISTRATOR(0, "管理员"),
    TYPE_ORDINARY_USER(1, "普通用户");

    /**
     * 账户类型枚举结构
     */
    private final Integer code;
    private final String desc;

    /**
     * 根据账户类型值，获取枚举对象
     * @param code 账户类型值
     * @return 账户类型枚举类
     */
    public static MallUserRoleEnum getByCode(Integer code) {
        for (MallUserRoleEnum role : values()) {
            if (role.getCode().equals(code)) {
                return role;
            }
        }
        return null;
    }

    /**
     * 根据账户类型名，获取枚举对象
     * @param desc 账户类型名
     * @return 账户类型枚举类
     */
    public static MallUserRoleEnum getByDesc(String desc) {
        for (MallUserRoleEnum role : values()) {
            if (role.getDesc().equals(desc)) {
                return role;
            }
        }
        return null;
    }
}
