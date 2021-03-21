SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;
USE `emm_mall`;

-- ----------------------------
-- Create table `mall_shipping`
-- ----------------------------
DROP TABLE IF EXISTS mall_shipping;
CREATE TABLE `mall_shipping`
(
    `id`                bigint(20) UNSIGNED                                     NOT NULL COMMENT '邮寄编号',
    `user_id`           bigint(20) UNSIGNED                                     NOT NULL COMMENT '用户编号',
    `receiver_name`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货姓名',
    `receiver_phone`    varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '收货手机',
    `receiver_province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '省份名称',
    `receiver_city`     varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '城市名称',
    `receiver_district` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '区县名称',
    `receiver_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
    `receiver_zip`      varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '邮政编码',
    `status`            int(6)                                                  NOT NULL COMMENT '邮寄状态',
    `create_by`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
    `create_time`       datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户',
    `update_time`       datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    `remark`            varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `index_user_id` (`user_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '商城邮寄表'
  ROW_FORMAT = Dynamic;