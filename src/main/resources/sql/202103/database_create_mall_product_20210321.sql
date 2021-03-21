SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;
USE `emm_mall`;

-- ----------------------------
-- Create table `mall_product`
-- ----------------------------
DROP TABLE IF EXISTS `mall_product`;
CREATE TABLE `mall_product`
(
    `id`          bigint(20) UNSIGNED                                     NOT NULL COMMENT '商品编号',
    `category_id` bigint(20) UNSIGNED                                     NOT NULL COMMENT '品类编号',
    `name`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品标题',
    `subtitle`    varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品副标题',
    `main_image`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品主图',
    `sub_images`  text CHARACTER SET utf8 COLLATE utf8_general_ci         NULL DEFAULT NULL COMMENT '商品图片',
    `detail`      text CHARACTER SET utf8 COLLATE utf8_general_ci         NULL DEFAULT NULL COMMENT '商品详情',
    `price`       decimal(20, 2)                                          NOT NULL COMMENT '商品单价',
    `stock`       int(11)                                                 NOT NULL COMMENT '商品库存',
    `status`      int(6)                                                  NOT NULL COMMENT '商品状态',
    `create_by`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
    `create_time` datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户',
    `update_time` datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `index_category_id` (`category_id`) USING BTREE,
    KEY `index_status` (`status`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '商城商品表'
  ROW_FORMAT = Dynamic;