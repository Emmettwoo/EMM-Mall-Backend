SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;
USE `emm_mall`;

-- ----------------------------
-- Create table `mall_user`
-- ----------------------------
DROP TABLE IF EXISTS mall_user;
CREATE TABLE `mall_user`
(
    `id`          bigint(20) UNSIGNED                                     NOT NULL COMMENT '用户编号',
    `username`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
    `password`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
    `salt`        varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '加密盐值',
    `email`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT NULL COMMENT '用户邮箱',
    `phone`       varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci       DEFAULT NULL COMMENT '用户手机',
    `question`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT NULL COMMENT '安全问题',
    `answer`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT NULL COMMENT '安全问题答案',
    `role`        int(6)                                                  NOT NULL COMMENT '用户类型',
    `create_by`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
    `create_time` datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户',
    `update_time` datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '商城用户表'
  ROW_FORMAT = Dynamic;