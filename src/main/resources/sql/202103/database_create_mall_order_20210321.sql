SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;
USE `emm_mall`;

-- ----------------------------
-- Create table `mall_order`
-- ----------------------------
DROP TABLE IF EXISTS `mall_order`;
CREATE TABLE `mall_order`
(
    `id`           bigint(20) UNSIGNED                                     NOT NULL COMMENT '订单编号',
    `user_id`      bigint(20) UNSIGNED                                     NOT NULL COMMENT '用户编号',
    `shipping_id`  bigint(20) UNSIGNED                                     NULL DEFAULT NULL COMMENT '邮寄编号',
    `payment`      decimal(20, 2)                                          NOT NULL COMMENT '付款金额（单位CNY）',
    `payment_type` varchar(20)                                             NOT NULL COMMENT '付款类型',
    `postage`      int(10)                                                 NULL DEFAULT NULL COMMENT '邮寄费用（单位CNY）',
    `status`       int(10)                                                 NOT NULL COMMENT '订单状态',
    `payment_time` datetime                                                NULL DEFAULT NULL COMMENT '支付时间',
    `send_time`    datetime                                                NULL DEFAULT NULL COMMENT '发货时间',
    `end_time`     datetime                                                NULL DEFAULT NULL COMMENT '完成时间',
    `close_time`   datetime                                                NULL DEFAULT NULL COMMENT '关闭时间',
    `create_by`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
    `create_time`  datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户',
    `update_time`  datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    `remark`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `index_user_id` (`user_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '商城订单表'
  ROW_FORMAT = Dynamic;