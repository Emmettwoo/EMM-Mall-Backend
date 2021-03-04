SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;
DROP DATABASE IF EXISTS `emm_mall`;
CREATE DATABASE `emm_mall`;
USE `emm_mall`;
-- ----------------------------
-- Create table `mall_cart`
-- ----------------------------
DROP TABLE IF EXISTS cart;
CREATE TABLE `mall_cart`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `user_id`     int(11) NOT NULL,
    `product_id`  int(11)  DEFAULT NULL COMMENT '商品id',
    `quantity`    int(11)  DEFAULT NULL COMMENT '数量',
    `checked`     int(11)  DEFAULT NULL COMMENT '是否选择,1=已勾选,0=未勾选',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 146
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Pre-Records of `mall_cart`
-- ----------------------------
/*BEGIN;
INSERT INTO `mall_cart` VALUES ('126', '21', '26', '1', '1', '2020-02-01 12:00:00', '2020-02-01 12:00:00');
COMMIT;*/


-- ----------------------------
-- Create table `mall_category`
-- ----------------------------
DROP TABLE IF EXISTS category;
CREATE TABLE `mall_category`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '类别Id',
    `parent_id`   int(11)     DEFAULT NULL COMMENT '父类别id当id=0时说明是根节点,一级类别',
    `name`        varchar(50) DEFAULT NULL COMMENT '类别名称',
    `status`      tinyint(1)  DEFAULT '1' COMMENT '类别状态1-正常,2-已废弃',
    `sort_order`  int(4)      DEFAULT NULL COMMENT '排序编号,同类展示顺序,数值相等则自然排序',
    `create_time` datetime    DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime    DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100032
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Pre-Records of `mall_category`
-- ----------------------------
/*BEGIN;
INSERT INTO `mall_category` VALUES
('100001', '0', '家用电器', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100002', '0', '数码3C', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100003', '0', '服装箱包', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100004', '0', '食品生鲜', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100005', '0', '酒水饮料', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100006', '100001', '冰箱', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100007', '100001', '电视', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100008', '100001', '洗衣机', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100009', '100001', '空调', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100010', '100001', '电热水器', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100011', '100002', '电脑', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100012', '100002', '手机', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100013', '100002', '平板电脑', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100014', '100002', '数码相机', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100015', '100002', '3C配件', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100016', '100003', '女装', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100017', '100003', '帽子', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100018', '100003', '旅行箱', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100019', '100003', '手提包', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100020', '100003', '保暖内衣', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100021', '100004', '零食', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100022', '100004', '生鲜', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100023', '100004', '半成品菜', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100024', '100004', '速冻食品', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100025', '100004', '进口食品', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100026', '100005', '白酒', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100027', '100005', '红酒', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100028', '100005', '饮料', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100029', '100005', '调制鸡尾酒', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('100030', '100005', '进口洋酒', '1', null, '2020-02-01 00:00:00', '2020-02-01 00:00:00');
COMMIT;*/


-- ----------------------------
-- Create table `mall_order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `mall_order`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
    `order_no`     bigint(20)     DEFAULT NULL COMMENT '订单号',
    `user_id`      int(11)        DEFAULT NULL COMMENT '用户id',
    `shipping_id`  int(11)        DEFAULT NULL,
    `payment`      decimal(20, 2) DEFAULT NULL COMMENT '实际付款金额,单位是元,保留两位小数',
    `payment_type` int(4)         DEFAULT NULL COMMENT '支付类型,1-在线支付',
    `postage`      int(10)        DEFAULT NULL COMMENT '运费,单位是元',
    `status`       int(10)        DEFAULT NULL COMMENT '订单状态:0-已取消-10-未付款，20-已付款，40-已发货，50-交易成功，60-交易关闭',
    `payment_time` datetime       DEFAULT NULL COMMENT '支付时间',
    `send_time`    datetime       DEFAULT NULL COMMENT '发货时间',
    `end_time`     datetime       DEFAULT NULL COMMENT '交易完成时间',
    `close_time`   datetime       DEFAULT NULL COMMENT '交易关闭时间',
    `create_time`  datetime       DEFAULT NULL COMMENT '创建时间',
    `update_time`  datetime       DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `order_no_index` (`order_no`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 118
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Pre-Records of `mall_order`
-- ----------------------------
/*BEGIN;
INSERT INTO `mall_order` VALUES ('1', '1491753014256', '2', '1', '13998.00', '1', '0', '10', null, null, null, null, '2020-02-01 12:00:00', '2020-02-01 12:00:00'),
('2', '1491830695216', '3', '2', '13998.00', '1', '0', '10', null, null, null, null, '2020-02-01 13:00:00', '2020-02-01 13:00:00'),
('3', '1492089528889', '1', '3', '3299.00', '1', '0', '10', null, null, null, null, '2020-02-01 14:00:00', '2020-02-01 14:00:00'),
('4', '1492090946105', '1', '3', '27894.00', '1', '0', '20', '2020-02-01 15:02:01', null, null, null, '2020-02-01 15:00:00', '2020-02-01 15:02:01'),
('5', '1492091003128', '1', '3', '8597.00', '1', '0', '20', '2020-02-01 16:02:01', null, null, null, '2020-02-01 16:00:00', '2020-02-01 16:02:01'),
('6', '1492091051313', '1', '3', '1999.00', '1', '0', '10', null, null, null, null, '2020-02-01 17:00:00', '2020-02-01 17:00:00'),
('7', '1492091061513', '1', '3', '6598.00', '1', '0', '10', null, null, null, null, '2020-02-01 18:00:00', '2020-02-01 18:00:00'),
('8', '1492091069563', '1', '3', '3299.00', '1', '0', '10', null, null, null, null, '2020-02-01 19:00:00', '2020-02-01 19:00:00'),
('9', '1492091076073', '1', '3', '4299.00', '1', '0', '10', null, null, null, null, '2020-02-01 20:00:00', '2020-02-01 20:00:00'),
('10', '1492091083720', '1', '3', '3299.00', '1', '0', '10', null, null, null, null, '2020-02-01 21:00:00', '2020-02-01 21:00:00'),
('11', '1492091089794', '1', '3', '6999.00', '1', '0', '10', null, null, null, null, '2020-02-01 22:00:00', '2020-02-01 22:00:00'),
('12', '1492091096400', '1', '3', '6598.00', '1', '0', '10', null, null, null, null, '2020-02-01 23:00:00', '2020-02-01 23:00:00'),
('13', '1492091102371', '1', '3', '3299.00', '1', '0', '10', null, null, null, null, '2020-02-01 23:59:59', '2020-02-01 23:59:59'),
('14', '1492091110004', '1', '3', '8598.00', '1', '0', '40', '2020-02-02 01:02:01', '2020-02-02 01:04:02', null, null, '2020-02-02 01:00:00', '2020-02-02 01:04:02'),
('15', '1492091141269', '1', '3', '22894.00', '1', '0', '20', '2020-02-02 02:02:01', null, null, null, '2020-02-02 02:00:00', '2020-02-02 02:02:01');
COMMIT;*/


-- ----------------------------
-- Create table `mall_order_item`
-- ----------------------------
DROP TABLE IF EXISTS order_item;
CREATE TABLE `mall_order_item`
(
    `id`                 int(11) NOT NULL AUTO_INCREMENT COMMENT '订单子表id',
    `user_id`            int(11)        DEFAULT NULL,
    `order_no`           bigint(20)     DEFAULT NULL,
    `product_id`         int(11)        DEFAULT NULL COMMENT '商品id',
    `product_name`       varchar(100)   DEFAULT NULL COMMENT '商品名称',
    `product_image`      varchar(500)   DEFAULT NULL COMMENT '商品图片地址',
    `current_unit_price` decimal(20, 2) DEFAULT NULL COMMENT '生成订单时的商品单价，单位是元,保留两位小数',
    `quantity`           int(10)        DEFAULT NULL COMMENT '商品数量',
    `total_price`        decimal(20, 2) DEFAULT NULL COMMENT '商品总价,单位是元,保留两位小数',
    `create_time`        datetime       DEFAULT NULL,
    `update_time`        datetime       DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `order_no_index` (`order_no`) USING BTREE,
    KEY `order_no_user_id_index` (`user_id`, `order_no`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 135
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Pre-Records of `mall_order_item`
-- ----------------------------
/*BEGIN;
INSERT INTO `mall_order_item` VALUES
('1', '3', '1491753014256', '1', 'Apple iPhone 7 Plus (A1661) 128G 玫瑰金色 移动联通电信4G手机', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg', '6999.00', '2', '13998.00', '2020-02-01 12:00:00', '2020-02-01 12:00:00'),
('2', '2', '1491830695216', '1', 'Apple iPhone 7 Plus (A1661) 128G 玫瑰金色 移动联通电信4G手机', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg', '6999.00', '2', '13998.00', '2020-02-01 13:00:00', '2020-02-01 13:00:00'),
('3', '1', '1492089528889', '2', 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', '3299.00', '1', '3299.00', '2020-02-01 14:00:00', '2020-02-01 14:00:00'),
('4', '1', '1492090946105', '4', 'Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干家用大容量 洗烘一体', '173335a4-5dce-4afd-9f18-a10623724c4e.jpeg', '4299.00', '2', '8598.00', '2020-02-01 15:00:00', '2020-02-01 15:00:00'),
('5', '1', '1492090946105', '3', '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', '0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg', '1999.00', '1', '1999.00', '2020-02-01 15:00:00', '2020-02-01 15:00:00'),
('6', '1', '1492090946105', '2', 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', '3299.00', '1', '3299.00', '2020-02-01 15:00:00', '2020-02-01 15:00:00'),
('7', '1', '1492090946105', '1', 'Apple iPhone 7 Plus (A1661) 128G 玫瑰金色 移动联通电信4G手机', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg', '6999.00', '2', '13998.00', '2020-02-01 15:00:00', '2020-02-01 15:00:00'),
('8', '1', '1492091003128', '2', 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', '3299.00', '2', '6598.00', '2020-02-01 16:00:00', '2020-02-01 16:00:00'),
('9', '1', '1492091003128', '3', '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', '0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg', '1999.00', '1', '1999.00', '2020-02-01 16:00:00', '2020-02-01 16:00:00'),
('10', '1', '1492091051313', '3', '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', '0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg', '1999.00', '1', '1999.00', '2020-02-01 17:00:00', '2020-02-01 17:00:00'),
('11', '1', '1492091061513', '2', 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', '3299.00', '2', '6598.00', '2020-02-01 18:00:00', '2020-02-01 18:00:00'),
('12', '1', '1492091069563', '2', 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', '3299.00', '1', '3299.00', '2020-02-01 19:00:00', '2020-02-01 19:00:00'),
('13', '1', '1492091076073', '4', 'Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干家用大容量 洗烘一体', '173335a4-5dce-4afd-9f18-a10623724c4e.jpeg', '4299.00', '1', '4299.00', '2020-02-01 20:00:00', '2020-02-01 20:00:00'),
('14', '1', '1492091083720', '2', 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', '3299.00', '1', '3299.00', '2020-02-01 21:00:00', '2020-02-01 21:00:00'),
('15', '1', '1492091089794', '1', 'Apple iPhone 7 Plus (A1661) 128G 玫瑰金色 移动联通电信4G手机', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg', '6999.00', '1', '6999.00', '2020-02-01 22:00:00', '2020-02-01 22:00:00'),
('16', '1', '1492091096400', '2', 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', '3299.00', '2', '6598.00', '2020-02-01 23:00:00', '2020-02-01 23:00:00'),
('17', '1', '1492091102371', '2', 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', '3299.00', '1', '3299.00', '2020-02-01 23:59:59', '2020-02-01 23:59:59'),
('18', '1', '1492091110004', '4', 'Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干家用大容量 洗烘一体', '173335a4-5dce-4afd-9f18-a10623724c4e.jpeg', '4299.00', '2', '8598.00', '2020-02-02 01:00:00', '2020-02-02 01:00:00'),
('19', '1', '1492091141269', '1', 'Apple iPhone 7 Plus (A1661) 128G 玫瑰金色 移动联通电信4G手机', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg', '6999.00', '1', '6999.00', '2020-02-02 02:00:00', '2020-02-02 02:00:00'),
('20', '1', '1492091141269', '2', 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', '3299.00', '1', '3299.00', '2020-02-02 02:00:00', '2020-02-02 02:00:00'),
('21', '1', '1492091141269', '4', 'Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干家用大容量 洗烘一体', '173335a4-5dce-4afd-9f18-a10623724c4e.jpeg', '4299.00', '2', '8598.00', '2020-02-02 02:00:00', '2020-02-02 02:00:00'),
('22', '1', '1492091141269', '3', '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', '0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg', '1999.00', '2', '3998.00', '2020-02-02 02:00:00', '2020-02-02 02:00:00');
COMMIT;*/


-- ----------------------------
-- Create table `mall_pay_info`
-- ----------------------------
DROP TABLE IF EXISTS pay_info;
CREATE TABLE `mall_pay_info`
(
    `id`              int(11) NOT NULL AUTO_INCREMENT,
    `user_id`         int(11)      DEFAULT NULL COMMENT '用户id',
    `order_no`        bigint(20)   DEFAULT NULL COMMENT '订单号',
    `pay_platform`    int(10)      DEFAULT NULL COMMENT '支付平台:1-支付宝,2-微信',
    `platform_number` varchar(200) DEFAULT NULL COMMENT '支付宝支付流水号',
    `platform_status` varchar(20)  DEFAULT NULL COMMENT '支付宝支付状态',
    `create_time`     datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 61
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Pre-Records of `mall_pay_info`
-- ----------------------------
/*BEGIN;
INSERT INTO `mall_pay_info` VALUES
('1', '1', '1492090946105', '1', '2020020121001004300200116250', 'WAIT_BUYER_PAY', '2020-02-01 15:00:00', '2020-02-01 15:00:00'),
('2', '1', '1492090946105', '1', '2020020121001004300200116250', 'TRADE_SUCCESS', '2020-02-01 15:02:01', '2020-02-01 15:02:01'),
('3', '1', '1492091003128', '1', '2020020121001004300200116251', 'WAIT_BUYER_PAY', '2020-02-01 16:00:00', '2020-02-01 16:00:00'),
('4', '1', '1492091003128', '1', '2020020121001004300200116251', 'TRADE_SUCCESS', '2020-02-01 16:02:01', '2020-02-01 16:02:01'),
('5', '1', '1492091141269', '1', '2020020121001004300200116252', 'WAIT_BUYER_PAY', '2020-02-02 02:00:00', '2020-02-02 02:00:00'),
('6', '1', '1492091141269', '1', '2020020121001004300200116252', 'TRADE_SUCCESS', '2020-02-02 02:02:01', '2020-02-02 02:02:01'),
('7', '1', '1492091110004', '1', '2020020121001004300200116396', 'WAIT_BUYER_PAY', '2020-02-02 01:00:00', '2020-02-02 01:00:00'),
('8', '1', '1492091110004', '1', '2020020121001004300200116396', 'TRADE_SUCCESS', '2020-02-02 01:02:01', '2020-02-02 01:02:01');
COMMIT;*/


-- ----------------------------
-- Create table `mall_product`
-- ----------------------------
DROP TABLE IF EXISTS product;
CREATE TABLE `mall_product`
(
    `id`          int(11)        NOT NULL AUTO_INCREMENT COMMENT '商品id',
    `category_id` int(11)        NOT NULL COMMENT '分类id,对应mall_category表的主键',
    `name`        varchar(100)   NOT NULL COMMENT '商品名称',
    `subtitle`    varchar(200) DEFAULT NULL COMMENT '商品副标题',
    `main_image`  varchar(500) DEFAULT NULL COMMENT '产品主图,url相对地址',
    `sub_images`  text COMMENT '图片地址,json格式,扩展用',
    `detail`      text COMMENT '商品详情',
    `price`       decimal(20, 2) NOT NULL COMMENT '价格,单位-元保留两位小数',
    `stock`       int(11)        NOT NULL COMMENT '库存数量',
    `status`      int(6)       DEFAULT '1' COMMENT '商品状态.1-在售 2-下架 3-删除',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 30
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Pre-Records of `mall_product`
-- ----------------------------
/*BEGIN;
INSERT INTO `mall_product` (`id`, `category_id`, `name`, `subtitle`, `main_image`, `sub_images`, `detail`, `price`, `stock`, `status`, `create_time`, `update_time`) VALUES
(0, 0, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1023, 1, '2020-05-06 21:07:04', '2020-05-06 21:48:28'),
(1, 100002, 'Apple iPhone 7 Plus (A1661) 128G 玫瑰金色 移动联通电信4G手机', 'iPhone 7，现更以红色呈现。', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg,b6c56eb0-1748-49a9-98dc-bcc4b9788a54.jpeg,92f17532-1527-4563-aa1d-ed01baa0f7b2.jpeg,3adbe4f7-e374-4533-aa79-cc4a98c529bf.jpeg', '<p><img alt="image load failed.." src="http://img.woohoo.top/00bce8d4-e9af-4c8d-b205-e6c75c7e252b.jpg" width="790" height="553"><br></p><p><img alt="image load failed.." src="http://img.woohoo.top/4a70b4b4-01ee-46af-9468-31e67d0995b8.jpg" width="790" height="525"><br></p><p><img alt="image load failed." src="http://img.woohoo.top/0570e033-12d7-49b2-88f3-7a5d84157223.jpg" width="790" height="365"><br></p><p><img alt="image load failed." src="http://img.woohoo.top/50515c02-3255-44b9-a829-9e141a28c08a.jpg" width="790" height="525"><br></p><p><img alt="image load failed." src="http://img.woohoo.top/c138fc56-5843-4287-a029-91cf3732d034.jpg" width="790" height="525"><br></p><p><img alt="image load failed." src="http://img.woohoo.top/c92d1f8a-9827-453f-9d37-b10a3287e894.jpg" width="790" height="525"><br></p><p><br></p><p><img alt="image load failed." src="http://img.woohoo.top/bb1511fc-3483-471f-80e5-c7c81fa5e1dd.jpg" width="790" height="375"><br></p><p><br></p><p><img alt="image load failed." src="http://img.woohoo.top/698e6fbe-97ea-478b-8170-008ad24030f7.jpg" width="750" height="150"><br></p><p><img alt="image load failed." src="http://img.woohoo.top/ee276fe6-5d79-45aa-8393-ba1d210f9c89.jpg" width="790" height="351"><br></p>', '6999.00', 9991, 1, '2020-02-01 00:00:00', '2020-05-05 15:06:34'),
(2, 100006, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', '送品牌烤箱，五一大促', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg,4bb02f1c-62d5-48cc-b358-97b05af5740d.jpeg,36bdb49c-72ae-4185-9297-78829b54b566.jpeg', '<p><img alt="image load failed." src="http://img.woohoo.top/9c5c74e6-6615-4aa0-b1fc-c17a1eff6027.jpg" width="790" height="444"><br></p><p><img alt="image load failed." src="http://img.woohoo.top/31dc1a94-f354-48b8-a170-1a1a6de8751b.jpg" width="790" height="1441"><img alt="image load failed." src="http://img.woohoo.top/7862594b-3063-4b52-b7d4-cea980c604e0.jpg" width="790" height="1442"><img alt="image load failed." src="http://img.woohoo.top/9a650563-dc85-44d6-b174-d6960cfb1d6a.jpg" width="790" height="1441"><br></p>', '3299.00', 8875, 1, '2020-02-01 00:00:00', '2020-05-06 22:08:51'),
(3, 100012, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'NOVA青春版1999元', '0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg', '0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg,13da2172-4445-4eb5-a13f-c5d4ede8458c.jpeg,58d5d4b7-58d4-4948-81b6-2bae4f79bf02.jpeg', '<p><img alt="image load failed." src="http://img.woohoo.top/5c2d1c6d-9e09-48ce-bbdb-e833b42ff664.jpg" width="790" height="966"><img alt="image load failed." src="http://img.woohoo.top/9a10b877-818f-4a27-b6f7-62887f3fb39d.jpg" width="790" height="1344"><img alt="image load failed." src="http://img.woohoo.top/7d7fbd69-a3cb-4efe-8765-423bf8276e3e.jpg" width="790" height="700"><img alt="image load failed." src="http://img.woohoo.top/1d7160d2-9dba-422f-b2a0-e92847ba6ce9.jpg" width="790" height="393"><br></p>', '1999.00', 9994, 1, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
(4, 100008, 'Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干家用大容量 洗烘一体', '门店机型 德邦送货', '173335a4-5dce-4afd-9f18-a10623724c4e.jpeg', '173335a4-5dce-4afd-9f18-a10623724c4e.jpeg,42b1b8bc-27c7-4ee1-80ab-753d216a1d49.jpeg,2f1b3de1-1eb1-4c18-8ca2-518934931bec.jpeg', '<p><img alt="image load failed." src="http://img.woohoo.top/ffcce953-81bd-463c-acd1-d690b263d6df.jpg" width="790" height="920"><img alt="image load failed." src="http://img.woohoo.top/58a7bd25-c3e7-4248-9dba-158ef2a90e70.jpg" width="790" height="1052"><img alt="image load failed." src="http://img.woohoo.top/2edbe9b3-28be-4a8b-a9c3-82e40703f22f.jpg" width="790" height="820"><br></p>', '4299.00', 9993, 1, '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
(5, 100001, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(6, 100003, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(7, 100004, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(8, 100005, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(9, 100007, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(10, 100009, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(11, 100010, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(12, 100011, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(13, 100013, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(14, 100014, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(15, 100015, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(16, 100016, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(17, 100017, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(18, 100018, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(19, 100019, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(20, 100020, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(21, 100021, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(22, 100022, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(23, 100023, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(24, 100024, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(25, 100025, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(26, 100026, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(27, 100029, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(28, 100027, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(29, 100028, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06'),
(30, 100030, '不存在的商品', '404_Not_Found', '404.jpeg', '404.jpeg,404.jpeg,404.jpeg', '<img alt="image load failed." src="http://img.woohoo.top/404.jpeg">', '0.01', 1024, 1, '2020-05-06 21:07:04', '2020-05-06 21:07:06');
COMMIT;*/


-- ----------------------------
-- Create table `mall_shipping`
-- ----------------------------
DROP TABLE IF EXISTS shipping;
CREATE TABLE `mall_shipping`
(
    `id`                int(11) NOT NULL AUTO_INCREMENT,
    `user_id`           int(11)      DEFAULT NULL COMMENT '用户id',
    `receiver_name`     varchar(20)  DEFAULT NULL COMMENT '收货姓名',
    `receiver_phone`    varchar(20)  DEFAULT NULL COMMENT '收货电话',
    `receiver_province` varchar(20)  DEFAULT NULL COMMENT '省份',
    `receiver_city`     varchar(20)  DEFAULT NULL COMMENT '城市',
    `receiver_district` varchar(20)  DEFAULT NULL COMMENT '区/县',
    `receiver_address`  varchar(200) DEFAULT NULL COMMENT '详细地址',
    `receiver_zip`      varchar(6)   DEFAULT NULL COMMENT '邮编',
    `status`            int(6)       DEFAULT '1' COMMENT '可用状态',
    `create_time`       datetime     DEFAULT NULL,
    `update_time`       datetime     DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 33
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Pre-Records of `mall_shipping`
-- ----------------------------
/*BEGIN;
INSERT INTO `mall_shipping` VALUES
('1', '2', 'emmettwoo', '13800138000', '北京', '北京市', '海淀区', '中关村', '100000', '1', '2020-02-02 01:04:02', '2020-02-02 01:04:02'),
('2', '3', 'cdfeng', '13800138000', '北京', '北京市', '海淀区', '中关村', '100000', '1', '2020-02-02 01:04:02', '2020-02-02 01:04:02'),
('3', '1', 'admin', '13800138000', '北京', '北京市', '海淀区', '海淀区中关村', '100000', '1', '2020-02-02 01:04:02', '2020-02-02 01:04:02');
COMMIT;*/


-- ----------------------------
-- Create table `mall_user`
-- ----------------------------
DROP TABLE IF EXISTS user;
CREATE TABLE `mall_user`
(
    `id`          int(11)     NOT NULL AUTO_INCREMENT COMMENT '用户表id',
    `username`    varchar(50) NOT NULL COMMENT '用户名',
    `password`    varchar(50) NOT NULL COMMENT '用户密码，MD5加密',
    `email`       varchar(50)  DEFAULT NULL,
    `phone`       varchar(20)  DEFAULT NULL,
    `question`    varchar(100) DEFAULT NULL COMMENT '找回密码问题',
    `answer`      varchar(100) DEFAULT NULL COMMENT '找回密码答案',
    `role`        int(4)      NOT NULL COMMENT '角色0-管理员,1-普通用户',
    `create_time` datetime    NOT NULL COMMENT '创建时间',
    `update_time` datetime    NOT NULL COMMENT '最后一次更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_name_unique` (`username`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 22
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Pre-Records of `mall_user`
-- ----------------------------
/*BEGIN;
INSERT INTO `mall_user` VALUES ('1', 'admin', '8EA7410A2B3E3158CBB17E6B1A087FD9', 'admin@woohoo.top', '13800138000', '问题', '答案', '1', '2020-02-01 00:00:00', '2020-02-01 00:00:00'),
('2', 'emmettwoo', '8EA7410A2B3E3158CBB17E6B1A087FD9', 'emmettwoo@outlook.com', '13800138000', '问题', '答案', '0', '2020-02-01 01:00:00', '2020-02-01 01:00:00'),
('3', 'cdfeng', '8EA7410A2B3E3158CBB17E6B1A087FD9', 'cdfeng@woohoo.top', '13800138000', '问题', '答案', '0', '2020-02-01 02:00:00', '2020-02-01 02:00:00'),
('4', 'notdefined', '8EA7410A2B3E3158CBB17E6B1A087FD9', 'notdefined@woohoo.top', '13800138000', '问题', '答案', '0', '2020-02-01 03:00:00', '2020-02-01 03:00:00');
COMMIT;*/


SET FOREIGN_KEY_CHECKS = 1;
