SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;
USE `emm_mall`;

-- ----------------------------
-- Create table `mall_cart`
-- ----------------------------
DROP TABLE IF EXISTS mall_cart;
CREATE TABLE `mall_cart`
(
    `id`          bigint(20) UNSIGNED                                     NOT NULL COMMENT '购物车编号',
    `user_id`     bigint(20) UNSIGNED                                     NOT NULL COMMENT '用户编号',
    `product_id`  bigint(20) UNSIGNED                                     NOT NULL COMMENT '商品编号',
    `quantity`    int(11) UNSIGNED                                        NOT NULL COMMENT '商品数量',
    `checked`     tinyint(1) UNSIGNED                                     NULL DEFAULT NULL COMMENT '勾选状态',
    `create_by`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
    `create_time` datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户',
    `update_time` datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `index_user_id` (`user_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '商城购物车表'
  ROW_FORMAT = Dynamic;