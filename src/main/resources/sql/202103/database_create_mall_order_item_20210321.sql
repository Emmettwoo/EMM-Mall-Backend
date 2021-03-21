SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;
USE `emm_mall`;

-- ----------------------------
-- Create table `mall_order_item`
-- ----------------------------
DROP TABLE IF EXISTS `mall_order_item`;
CREATE TABLE `mall_order_item`
(
    `id`            bigint(20) UNSIGNED                                     NOT NULL COMMENT '订单商品编号',
    `user_id`       bigint(20) UNSIGNED                                     NOT NULL COMMENT '用户编号',
    `order_id`      bigint(20) UNSIGNED                                     NOT NULL COMMENT '订单编号',
    `product_id`    bigint(20) UNSIGNED                                     NOT NULL COMMENT '商品编号',
    `product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
    `product_image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
    `unit_price`    decimal(20, 2)                                          NOT NULL COMMENT '商品单价',
    `quantity`      int(10)                                                 NOT NULL COMMENT '商品数量',
    `total_price`   decimal(20, 2)                                          NULL DEFAULT NULL COMMENT '商品总价',
    `create_by`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
    `create_time`   datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户',
    `update_time`   datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    `remark`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `index_user_id` (`user_id`) USING BTREE,
    KEY `index_order_id` (`order_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '商城订单商品表'
  ROW_FORMAT = Dynamic;