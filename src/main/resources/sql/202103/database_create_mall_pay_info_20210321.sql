SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;
USE `emm_mall`;

-- ----------------------------
-- Create table `mall_pay_info`
-- ----------------------------
DROP TABLE IF EXISTS mall_pay_info;
CREATE TABLE `mall_pay_info`
(
    `id`                    bigint(20) UNSIGNED                                     NOT NULL COMMENT '支付信息编号',
    `user_id`               bigint(20) UNSIGNED                                     NOT NULL COMMENT '用户编号',
    `order_id`              bigint(20) UNSIGNED                                     NOT NULL COMMENT '订单编号',
    `platform_code`         varchar(20)                                             NOT NULL COMMENT '支付平台',
    `platform_order_number` varchar(200)                                            NOT NULL COMMENT '支付平台订单号',
    `platform_status`       varchar(20)                                             NOT NULL COMMENT '支付平台支付状态',
    `create_by`             varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
    `create_time`           datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`             varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户',
    `update_time`           datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    `remark`                varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `index_order_id` (`order_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '商城支付信息表'
  ROW_FORMAT = Dynamic;