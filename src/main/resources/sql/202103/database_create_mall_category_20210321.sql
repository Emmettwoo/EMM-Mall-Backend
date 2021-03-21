SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;
USE `emm_mall`;

-- ----------------------------
-- Create table `mall_category`
-- ----------------------------
DROP TABLE IF EXISTS mall_category;
CREATE TABLE `mall_category`
(
    `id`          bigint(20) UNSIGNED                                     NOT NULL COMMENT '品类编号',
    `parent_id`   bigint(20) UNSIGNED                                     NOT NULL COMMENT '父类编号',
    `name`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品类名称',
    `enable`      tinyint(1) UNSIGNED                                     NULL DEFAULT NULL COMMENT '启用状态,1=启用,0=禁用',
    `create_by`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
    `create_time` datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户',
    `update_time` datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '商城商品品类表'
  ROW_FORMAT = Dynamic;