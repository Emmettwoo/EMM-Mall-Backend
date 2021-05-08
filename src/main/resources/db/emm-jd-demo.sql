SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;
DROP DATABASE IF EXISTS `emm_mall`;
CREATE DATABASE `emm_mall`;
USE `emm_mall`;
-- ----------------------------
-- Create table `mall_cart`
-- ----------------------------
DROP TABLE IF EXISTS `mall_cart`;
CREATE TABLE `mall_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  `checked` int(11) DEFAULT NULL COMMENT '是否选择,1=已勾选,0=未勾选',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Pre-Records of `mall_cart`
-- ----------------------------
/*BEGIN;
INSERT INTO `mall_cart` VALUES ('126', '21', '26', '1', '1', '2020-02-01 12:00:00', '2020-02-01 12:00:00');
COMMIT;*/


-- ----------------------------
-- Create table `mall_category`
-- ----------------------------
DROP TABLE IF EXISTS `mall_category`;
CREATE TABLE `mall_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别Id',
  `parent_id` int(11) DEFAULT NULL COMMENT '父类别id当id=0时说明是根节点,一级类别',
  `name` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '类别状态1-正常,2-已废弃',
  `sort_order` int(4) DEFAULT NULL COMMENT '排序编号,同类展示顺序,数值相等则自然排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100032 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Pre-Records of `mall_category`
-- ----------------------------
BEGIN;
INSERT INTO `mall_category` VALUES
('100001', '0', '衣', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100002', '0', '食', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100003', '0', '住', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100004', '0', '行', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100005', '0', '教', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100006', '100001', '男装', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100007', '100001', '女装', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100008', '100001', '童装', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100009', '100001', '内衣', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100010', '100001', '鞋品', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100011', '100001', '箱包', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100012', '100001', '钟表', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100013', '100001', '珠宝', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100014', '100001', '美妆', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100015', '100001', '个护', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100016', '100002', '食品', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100017', '100002', '酒类', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100018', '100002', '生鲜', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100019', '100002', '特产', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100020', '100003', '家具', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100021', '100003', '家装', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100022', '100003', '厨具', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100023', '100003', '家电', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100024', '100003', '手机', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100025', '100003', '运营商', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100026', '100003', '数码', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100027', '100003', '电脑', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100028', '100004', '汽车', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100029', '100004', '汽车用品', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100030', '100004', '户外', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100031', '100004', '运动用品', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100032', '100005', '图书', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100033', '100005', '电子书', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100034', '100005', '玩具', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('100035', '100005', '乐器', '1', null, '2021-05-15 00:00:00', '2021-05-15 00:00:00');
COMMIT;


-- ----------------------------
-- Create table `mall_order`
-- ----------------------------
DROP TABLE IF EXISTS `mall_order`;
CREATE TABLE `mall_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` bigint(20) DEFAULT NULL COMMENT '订单号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `shipping_id` int(11) DEFAULT NULL,
  `payment` decimal(20,2) DEFAULT NULL COMMENT '实际付款金额,单位是元,保留两位小数',
  `payment_type` int(4) DEFAULT NULL COMMENT '支付类型,1-在线支付',
  `postage` int(10) DEFAULT NULL COMMENT '运费,单位是元',
  `status` int(10) DEFAULT NULL COMMENT '订单状态:0-已取消-10-未付款，20-已付款，40-已发货，50-交易成功，60-交易关闭',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `send_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no_index` (`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

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
DROP TABLE IF EXISTS `mall_order_item`;
CREATE TABLE `mall_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单子表id',
  `user_id` int(11) DEFAULT NULL,
  `order_no` bigint(20) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `product_image` varchar(500) DEFAULT NULL COMMENT '商品图片地址',
  `current_unit_price` decimal(20,2) DEFAULT NULL COMMENT '生成订单时的商品单价，单位是元,保留两位小数',
  `quantity` int(10) DEFAULT NULL COMMENT '商品数量',
  `total_price` decimal(20,2) DEFAULT NULL COMMENT '商品总价,单位是元,保留两位小数',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_no_index` (`order_no`) USING BTREE,
  KEY `order_no_user_id_index` (`user_id`,`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

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
DROP TABLE IF EXISTS `mall_pay_info`;
CREATE TABLE `mall_pay_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `order_no` bigint(20) DEFAULT NULL COMMENT '订单号',
  `pay_platform` int(10) DEFAULT NULL COMMENT '支付平台:1-支付宝,2-微信',
  `platform_number` varchar(200) DEFAULT NULL COMMENT '支付宝支付流水号',
  `platform_status` varchar(20) DEFAULT NULL COMMENT '支付宝支付状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

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
DROP TABLE IF EXISTS `mall_product`;
CREATE TABLE `mall_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `category_id` int(11) NOT NULL COMMENT '分类id,对应mall_category表的主键',
  `name` varchar(100) NOT NULL COMMENT '商品名称',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '商品副标题',
  `main_image` varchar(500) DEFAULT NULL COMMENT '产品主图,url相对地址',
  `sub_images` text COMMENT '图片地址,json格式,扩展用',
  `detail` text COMMENT '商品详情',
  `price` decimal(20,2) NOT NULL COMMENT '价格,单位-元保留两位小数',
  `stock` int(11) NOT NULL COMMENT '库存数量',
  `status` int(6) DEFAULT '1' COMMENT '商品状态.1-在售 2-下架 3-删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Pre-Records of `mall_product`
-- ----------------------------
/*BEGIN;
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (30, 100006, '红豆Hodo 男士商务休闲正装纯色短袖衬衣 职业装短袖衬衫', '简约·修身牛津纺短袖衬衫', '6bd77f7d-4962-4b39-83d4-55ebd4d72f35.jpg', '6bd77f7d-4962-4b39-83d4-55ebd4d72f35.jpg,6b38441f-eca6-4c10-bb6a-b22bb784ef36.jpg,b6390fb3-f4aa-4531-981e-f85a23d72ff6.jpg,e220d57d-2938-4dbd-8e02-38f78e0b070c.jpg,1cd7204e-5dd4-42f2-83d9-9e7cc662bdab.jpg', '<p><img src="https://img10.360buyimg.com/imgzone/jfs/t1/134033/24/5054/197763/5f168073E90efc861/66e1266b2c3dd94e.jpg"><br></p>', 99.00, 99, 1, '2021-05-08 16:52:47', '2021-05-08 16:52:47');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (31, 100007, 'AIVEI欣贺艾薇20夏新款优雅简约V领网纱蝴蝶结礼服连衣裙', 'M0160067', '1afa7ee2-210f-4d46-9727-12fa9f1b4b08.jpg', '1afa7ee2-210f-4d46-9727-12fa9f1b4b08.jpg,afa0e21e-f065-4c0e-93fd-d128f2536288.jpg,e43b38b4-2237-4e20-a991-96d47bd33e02.jpg,3b93289f-cf39-4dbc-8769-28088aee1577.jpg', '<p><img src="https://img20.360buyimg.com/imgzone/jfs/t1/162057/25/5559/606130/601a5b34Ec3598855/d3f7218b71b0dcfc.png"></p>', 562.00, 99, 1, '2021-05-08 16:58:53', '2021-05-08 17:01:56');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (32, 100008, 'davebella戴维贝拉童装新生儿衣服婴儿连体衣男女宝宝春装新品初生儿哈衣爬服 小豹子', '建议身高73-80cm', '10485b34-3c0f-4338-bed1-b53a082085c0.jpg', '10485b34-3c0f-4338-bed1-b53a082085c0.jpg,886e14aa-eca1-447b-a416-3d1561c41ea7.jpg,c07c9795-9d73-4dd6-b50f-83c176212a88.jpg,33a7057b-bf3d-46c6-b514-c48a3ed282e4.jpg', '<p><img src="http://img30.360buyimg.com/popWareDetail/jfs/t1/120965/29/12677/456781/5f62bb87E9981e8f2/beffa8b839422bb7.png"></p><p><img src="http://img30.360buyimg.com/popWareDetail/jfs/t1/111640/37/17953/171402/5f62bb89E8becaae7/b6ad01b9fd73119f.png"><img src="http://img30.360buyimg.com/popWareDetail/jfs/t1/111451/12/17657/347521/5f62bb91Efaab8d99/1259b44d4140c85a.png"></p>', 99.00, 99, 1, '2021-05-08 17:06:59', '2021-05-08 17:06:59');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (33, 100010, '乐拖 ins风凉拖鞋男日式情侣柔软轻便室外沙滩浴室凉拖', '浅灰 适合41-42', '81af406d-deec-4679-8853-b6661a19f27f.jpg', '81af406d-deec-4679-8853-b6661a19f27f.jpg,11994f62-16b5-41a2-8667-ce9df65bdad2.jpg,a092d60c-8d9b-48ad-9d88-14162270efcd.jpg,2204b7af-055e-4eb7-b3f8-baa3ee2ec327.jpg,d3d5ce9d-a6ed-4dbc-841f-9e1ae9386b43.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/106890/8/17161/104690/5e844fd1E2dbb640e/56eb9f07b48f028e.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/106890/8/17161/104690/5e844fd1E2dbb640e/56eb9f07b48f028e.jpg" width="654" height="938"><br></p>', 15.90, 99, 1, '2021-05-08 17:11:49', '2021-05-08 17:11:49');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (34, 100011, '地平线8号（LEVEL8）行李箱旅行箱登机箱德国PC箱体男女拉杆箱', '（锤科出品） 20英寸 气质灰', '66b560be-da84-4db9-8bdf-bd305129faf2.jpg', '66b560be-da84-4db9-8bdf-bd305129faf2.jpg,fb9efc7f-f815-49e4-9da8-8f569d16f579.jpg,72ebacda-8f89-4194-9db9-fca551f89c12.jpg,1c98dac9-22d8-4399-b6c6-070130c2fc35.jpg', '<p><img src="https://img10.360buyimg.com/imgzone/jfs/t1/124653/6/12352/26435/5f59c260Ef1cf8152/4b1a750f82fe9dcc.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/139963/5/8023/157436/5f59c260E12a19ac7/b44feae598dfe8f5.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/126464/29/12305/111918/5f59c260E00e31156/9c4ab3af9137a5fb.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/138762/14/8157/235692/5f59c261E3f5e2e62/d5a96f70ed63cf83.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/123017/15/12092/152364/5f59c261Ec386766c/e2ecf1554a04e500.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/129733/32/9608/111492/5f59c261E421a9520/f737ea1bd8b0faf3.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/150996/37/320/195172/5f59c261E55bca637/b91d534c6edfa126.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/111484/32/17398/167070/5f59c262Ee22e4922/58705503438b4877.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/116707/13/17448/131320/5f59c262E45ff859d/4e3b803beae1f643.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/114367/5/17434/206669/5f59c262E8fb7a5c3/0f57e1b517e06d5a.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/113316/17/17326/65278/5f59c263Ed3974ec0/186bd154a79b6dbd.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/142482/31/8100/111765/5f59c263E557807a3/55de677ee742e950.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/128803/8/12339/74485/5f59c263E168d35da/b6e9af0e7fc49e44.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/151050/16/330/88678/5f59c264Ef90cf18d/83dde472d24d26f6.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/143369/3/8054/139741/5f59c265Edd6e3782/d8c7c122e2e75aa0.jpg"></p>', 299.00, 10, 1, '2021-05-08 17:17:51', '2021-05-08 17:17:51');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (35, 100012, '佳明（GARMIN）Venu2S玫瑰金触屏智能运动手表', '心率脉搏血氧离线音乐支付时尚精致高阶健康监测健身跑步游泳', '4c176d0e-2599-4f64-8a83-772bbd4ce372.jpg', '4c176d0e-2599-4f64-8a83-772bbd4ce372.jpg,fa5c011a-d152-4cc5-9ebe-bbab1ad249fd.jpg,e8308b60-1aaf-4c6d-9ae3-0c840f27c52f.jpg,5fbeb1d2-04bd-44aa-bc2d-6ff8ccb5703e.jpg,45073420-65ff-4110-85a5-9af91d9d6e9f.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/192617/18/25/222115/60864f1cE03544a56/743e1a2f32cf8c8a.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/192617/18/25/222115/60864f1cE03544a56/743e1a2f32cf8c8a.jpg" width="519" height="938"></p>', 2980.00, 99, 1, '2021-05-08 17:25:04', '2021-05-08 17:25:04');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (36, 100013, '施华洛世奇 ALTO黑碳纹理双环造型简洁休闲时尚', '【品牌官方直售】 咖啡色 5429899', '52430fe1-c6e2-4f16-a85f-a75f8832550f.jpg', '52430fe1-c6e2-4f16-a85f-a75f8832550f.jpg,532e38d4-e3aa-497b-87f0-3aad629efdf2.jpg,5a36a350-1697-4d47-b8e7-a9d32e1a3392.jpg', '<p><img alt="" src="http://img30.360buyimg.com/popWaterMark/jfs/t26545/9/387733212/28829/3f4c765/5b90a51cNddf5e031.jpg"></p>', 999.00, 99, 1, '2021-05-08 17:29:17', '2021-05-08 17:29:17');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (37, 100014, 'SK-II春日娃娃限定礼盒(粉)神仙水230ml精华液护肤品套装化妆品', '礼盒内赠清莹露+洗面奶+面霜', '879cfad1-4d70-4d65-93d0-9b6b9efbc2cb.jpg', '879cfad1-4d70-4d65-93d0-9b6b9efbc2cb.jpg,6f102d8d-3620-4243-a655-e8a7e65f830a.jpg,eb1d1a90-caf4-453e-97f4-1ee54195a9bf.jpg,a757353f-9aba-41a0-b222-4e9d1b515f79.jpg,e12bc346-fd56-49c9-8bbf-d341771367e0.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/187938/8/2025/812702/6095f30cE30ddc39a/9466740aa7113618.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/187938/8/2025/812702/6095f30cE30ddc39a/9466740aa7113618.jpg" width="83" height="670"></p>', 1590.00, 99, 1, '2021-05-08 17:36:51', '2021-05-08 17:36:51');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (38, 100015, '瓷遇洗脸巾袋装', '洗脸巾一次性棉质棉柔巾洁面巾', '0c029eed-ee14-457d-b60c-a32b7bf89683.jpg', '0c029eed-ee14-457d-b60c-a32b7bf89683.jpg,4e9a7f87-86c0-44fd-b51a-5ed8b60c68ba.jpg,8a7d727f-5fb9-4622-b626-304f32ff511b.jpg,dcdbdfa5-9b20-47dc-9c75-ea030e52a282.jpg,8b9fcb59-b09f-4a09-b788-095fde283633.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/97419/20/16073/301559/5e787161Efe32abd3/92372e65553cf7b7.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/97419/20/16073/301559/5e787161Efe32abd3/92372e65553cf7b7.jpg" width="498" height="670"></p>', 29.90, 99, 1, '2021-05-08 17:39:22', '2021-05-08 17:39:22');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (39, 100009, '睡衣女秋冬金丝绒性感蕾丝吊带长袖长裤睡裙袍三件套家居服套装女', 'BK313- 金丝绒三件套-灰蓝色 女L(110-125斤)', '4346c911-7069-434a-b723-e0d0ccddc693.jpg', '4346c911-7069-434a-b723-e0d0ccddc693.jpg,5c579e97-0128-4160-8493-366cb1a3741b.jpg,6e14043a-a984-4730-ba00-c0b3e17d59bc.jpg,d45076fd-c0b8-4e62-b4b0-b5f3ea6f4a7f.jpg,0751063b-979e-4dc7-8a22-8a1011bd6b9b.jpg', '<p><img src="http://img30.360buyimg.com/popWareDetail/jfs/t1/116334/38/18435/33158/5f68810fEd9425cc1/d74a92063b4f4e46.jpg"><img src="http://img30.360buyimg.com/popWareDetail/jfs/t1/139083/9/8913/44281/5f6880c2Eb83a41f6/b5b1b80fa1a63a69.jpg"><img src="http://img30.360buyimg.com/popWareDetail/jfs/t1/119058/14/18451/172933/5f6880c2E5f3e2098/420d430a85b01312.jpg"></p>', 168.00, 99, 1, '2021-05-09 00:25:16', '2021-05-09 00:25:16');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (40, 100016, '三只松鼠坚果礼盒9袋装1710g 火红A零食大礼包', '送礼每日坚果碧根果核桃果干团购礼物（新套装随机发货）', '28c60840-d347-4b83-b8f7-a659ed1815d9.jpg', '28c60840-d347-4b83-b8f7-a659ed1815d9.jpg,54005bf8-be73-4217-8519-eefe93d8c189.jpg,c7a7ece2-ce4c-4c20-b8f3-3134458218a4.jpg,4d533a0c-fcd5-4afb-b397-d544e1eaa7e8.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/156244/36/2757/373772/5fe9ac2eEc9e07cdf/33137eda0b6f764c.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/156244/36/2757/373772/5fe9ac2eEc9e07cdf/33137eda0b6f764c.jpg" width="715" height="938"></p>', 129.00, 99, 1, '2021-05-09 00:30:54', '2021-05-09 00:33:27');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (41, 100016, '旺旺 旺仔牛奶 6原味+6原味O泡（组合装）', '送礼佳品 245ml*12', '2b64941b-e199-4cda-9e03-a04d1e9f24a9.jpg', '2b64941b-e199-4cda-9e03-a04d1e9f24a9.jpg,53932ff0-3a4b-4494-bd86-a57dfe9f2a2d.jpg,a1d8b511-58b1-43b7-98ff-8e8a0c3d738f.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/132580/9/10619/304340/5f69cd83E3b168a79/d053dfe7a080bfcf.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/132580/9/10619/304340/5f69cd83E3b168a79/d053dfe7a080bfcf.jpg"></p>', 55.00, 99, 1, '2021-05-09 00:33:17', '2021-05-09 00:33:17');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (42, 100017, '5.0德国进口小麦白啤酒原浆型', '口感麦香浓郁自然浑浊型500ml*24听罐装整箱装', '38b45836-bd40-49be-a534-f31abafd620a.jpg', '38b45836-bd40-49be-a534-f31abafd620a.jpg,d893a0aa-4288-453d-8239-d959ce451c6f.jpg,c01bbe0e-ddb3-4d79-afd3-a7357fdf9723.jpg,94de88d1-5a41-4a01-a51b-86eab77c00e4.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/80989/26/7872/229674/5d5d15c3Eb9beacfd/f043ce62d70eb9ab.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/80989/26/7872/229674/5d5d15c3Eb9beacfd/f043ce62d70eb9ab.jpg" width="689" height="938"></p>', 138.00, 99, 1, '2021-05-09 00:37:47', '2021-05-09 00:37:47');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (43, 100018, '美威 原味三文鱼排（大西洋鲑）240g/袋 4片', '核酸已检测，含Ω3 BAP认证 生鲜 海鲜水产', '631fee4f-d797-48c0-a899-306607188f86.jpg', '631fee4f-d797-48c0-a899-306607188f86.jpg,a71b2e4d-bf9a-4c10-a00a-8e1708882e64.jpg,5b20ce98-a8cf-42ec-974b-f31c27d8e876.jpg,db083982-44de-48f5-be52-f55ff7ce16f1.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/71418/7/5852/199106/5d400ed2E23059983/f5970421bf7d284b.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/71418/7/5852/199106/5d400ed2E23059983/f5970421bf7d284b.jpg"><img src="https://img30.360buyimg.com/sku/jfs/t1/67175/22/11385/185350/5d8b0248Ebc6f07f4/19dd48016e415f3b.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/67175/22/11385/185350/5d8b0248Ebc6f07f4/19dd48016e415f3b.jpg" width="717" height="938"></p>', 59.90, 99, 1, '2021-05-09 00:41:23', '2021-05-09 00:41:23');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (44, 100019, '【河南农特产馆】三黄鸡土鸡 800g左右1只 3只装', '黄河三黄鸡肉新鲜冷冻整只白条鸡 生鲜', '0a7e8c5a-6953-4026-a471-f8148b5ef31a.jpg', '0a7e8c5a-6953-4026-a471-f8148b5ef31a.jpg,7b6466ff-e80c-4231-9f21-efc03e132b12.jpg,3a5c47a5-fd1a-4a58-b25e-fc04c9c9ea1c.png,2467bc44-6767-4221-8b70-b829a1e992aa.jpg', '<p><img src="https://img10.360buyimg.com/imgzone/jfs/t1/148386/23/15782/390659/5fc0a0c1E61570ffa/55b4317e4a1acd2b.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/147569/23/15979/515000/5fc0a0c1E37aafc4c/52313a56bbfee694.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/133875/7/17467/351212/5fc0a0c2E17e37e00/78530653ffd32ef4.jpg"></p>', 69.90, 99, 1, '2021-05-09 00:44:25', '2021-05-09 00:44:25');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (45, 100020, '中派 沙发 客厅皮布可拆洗实木框架布艺沙发组合', '双人+单人+贵妃', 'a5ffd368-7963-42d8-aae5-a8decab3ec74.jpg', 'a5ffd368-7963-42d8-aae5-a8decab3ec74.jpg,6117dd23-eed9-4fde-bd5f-55f3d44fd8b7.jpg,4e4ec0dc-6f6b-45fc-98b9-5eb89ad28a2a.jpg,7c74d4ee-f7e9-479a-bdfc-3ab6a1b0fc62.jpg', '<p><img src="http://img10.360buyimg.com/imgzone/jfs/t1/174909/17/1849/294099/60684022Ec26054fe/d516f7e5ba14182b.jpg"></p><p><img src="http://img10.360buyimg.com/imgzone/jfs/t1/168224/24/16076/117524/60684021Ed8a083bb/de873b3ce1a5aca4.jpg"></p>', 2499.00, 99, 1, '2021-05-09 00:51:47', '2021-05-09 00:51:47');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (46, 100020, '中派 北欧极简岩板餐桌组合可伸缩家用大理石餐桌椅套装', '1.3米一桌四椅【金丝绒岩板/标配马鞍椅】', 'fcae98e5-0b06-4913-a0ef-c71211d00448.jpg', 'fcae98e5-0b06-4913-a0ef-c71211d00448.jpg,fa2c3e58-d744-4906-8381-929aa73a0484.jpg,ebefe657-0938-44a9-92bf-952ab384b042.jpg', '<p><img src="http://img14.360buyimg.com/imgzone/jfs/t1/124021/29/12049/443770/5f561e72E52138c98/ab5481ec4ad2de53.jpg"></p><p><img src="http://img13.360buyimg.com/imgzone/jfs/t1/133201/25/9367/483340/5f561e74E6ceb2b4a/00d9d32e181adedd.jpg"></p><p><img src="http://img10.360buyimg.com/cms/jfs/t1/123907/28/14178/257581/5f77ee8bE207eedb3/a69d45ae5ef187f8.jpg"></p>', 3199.00, 99, 1, '2021-05-09 01:06:01', '2021-05-09 01:06:01');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (47, 100021, '德莱堡瓷砖 美式复古圆角砖500x500', '田园客厅餐厅阳台地砖 防滑防潮仿古砖 M513 500x500mm', 'ee5d3096-2cd9-4c47-b8b7-7287f39881a9.jpg', 'ee5d3096-2cd9-4c47-b8b7-7287f39881a9.jpg,e2e6b4a7-8f75-46e2-b53f-b8b37c6e7296.jpg,41378063-2578-4739-8e4c-a156dec798c6.jpg,08ec40cf-d2f1-43d2-9571-f0d919df0f17.jpg,637ca888-f71f-44a2-98c2-f21130151249.jpg', '<p><img src="https://img10.360buyimg.com/imgzone/jfs/t1/175042/4/1098/228486/60628fb9Ed31d14d9/1f3d077035003e26.jpg"><img src="https://img10.360buyimg.com/imgzone/jfs/t1/174479/23/1084/203323/60628fb9Ed94f644e/206c012917938d77.jpg"></p>', 28.00, 99, 1, '2021-05-09 01:10:43', '2021-05-09 01:10:43');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (48, 100021, '金属自粘马赛克瓷砖墙纸电视背景墙玄关卫生间自贴瓷砖浴室三角形', '三角魔方（单片装）', '0ac6e945-5ee5-458d-8815-885c583b89b3.jpg', '0ac6e945-5ee5-458d-8815-885c583b89b3.jpg,53f63108-7830-4605-970b-ba2b79ebb766.jpg,bc7f429d-2ad6-4fbf-a9ba-22022c41a70c.jpg,56c0d548-a08b-4139-b46c-c32f88056dbf.jpg', '<p><img src="https://img10.360buyimg.com/imgzone/jfs/t1/160894/6/18085/261554/6073b1a8E96fb581e/2a0bea8fe03c9062.jpg"></p>', 23.00, 99, 1, '2021-05-09 01:21:21', '2021-05-09 01:21:21');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (49, 100022, '美的（Midea）典雅金麦饭石色涂层不粘炒锅', '家用炒锅电磁炉煤气灶适用炒菜锅平底锅煎锅增竹铲 香槟金28WOK302', '794a32f7-93d6-443a-876d-d8c6eb0236ac.jpg', '794a32f7-93d6-443a-876d-d8c6eb0236ac.jpg,5fa4a1b0-0c45-44ca-8821-42dc63c5560d.jpg,bc4114dc-839f-44c6-9593-6471b0590e46.jpg,43c2bd5a-7b59-4e9f-bb78-2b45a3a81705.jpg,6437a19b-2417-44d5-93e7-2c879619568c.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/129288/32/18606/371714/5fb1d436E60db04b6/7887f6304fc4d85e.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/129288/32/18606/371714/5fb1d436E60db04b6/7887f6304fc4d85e.jpg" width="527" height="938"></p>', 75.00, 99, 1, '2021-05-09 01:24:18', '2021-05-09 01:24:18');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (50, 100023, '小米全面屏电视 65英寸Pro E65S', '4K超清 2GB+32GB 二级能效 金属机身 智能平板教育电视 L65M5-ES', '076d2d34-bf64-47f8-a5d1-304ab0781e90.jpg', '076d2d34-bf64-47f8-a5d1-304ab0781e90.jpg,b7c99949-005c-40f2-a103-08137492500b.jpg,adb0e68f-7db2-479d-b41f-6198e83218ab.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/124042/23/11390/416785/5f4c7360E6fbfb5d4/f80c372f958526ce.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/124042/23/11390/416785/5f4c7360E6fbfb5d4/f80c372f958526ce.jpg" width="289" height="938"></p>', 3599.00, 99, 1, '2021-05-09 01:28:22', '2021-05-09 01:28:22');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (51, 100024, 'Apple iPhone 12 (A2404) 64GB 紫色', '支持移动联通电信5G 双卡双待手机', 'ee36251d-2f5e-4217-b773-526d39309be7.jpg', 'ee36251d-2f5e-4217-b773-526d39309be7.jpg,031f12a2-b7e7-4581-b930-dc6c0911ca5a.jpg,fafb505c-a0f4-4f0e-a715-16325ea347fc.jpg,136f1c19-0074-4e51-b8f4-4eae35bd25ae.jpg', '<p><img src="https://img10.360buyimg.com/cms/jfs/t1/182872/6/133/795112/607f3495Ea178190e/01c683a879c788c5.jpg"></p>', 6299.00, 99, 1, '2021-05-09 01:30:10', '2021-05-09 01:30:10');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (52, 100025, '中国电信【惊鸿卡】95G充100得400元话费', '电信流量卡不限速电话卡手机卡上网卡手机号卡不限量', 'ac72a7ce-890e-4293-acc1-6f900e616449.jpg', 'ac72a7ce-890e-4293-acc1-6f900e616449.jpg,9facf2a6-beb1-477d-a4d4-cd94ebe5cf58.jpg,bced6cef-e865-4c46-931c-e1d54e3181f5.jpg', '<p><img src="http://img30.360buyimg.com/popWareDetail/jfs/t1/193840/9/311/268803/60892b17Efbb37293/097664d5b25c7454.jpg"></p>', 29.00, 99, 1, '2021-05-09 01:33:43', '2021-05-09 01:33:43');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (53, 100033, 'Kindle paperwhite 电子书阅读器', '电纸书 墨水屏 经典版 第四代 8G 墨黑色', '4b23c736-f864-4a22-b3bc-3bb17a5c8a93.jpg', '4b23c736-f864-4a22-b3bc-3bb17a5c8a93.jpg,bcb6da60-58f1-4cde-8bbc-b9ca4f25f99b.jpg,130ee983-2dd1-4ee0-a473-3b80b5b63f5c.jpg,c2fe464c-b176-4ab5-8e1e-4ce548442ef0.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/119158/40/17434/198976/5f5ae015E97f334a4/4ec0d310dba98440.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/119158/40/17434/198976/5f5ae015E97f334a4/4ec0d310dba98440.jpg" width="445" height="938"></p>', 998.00, 99, 1, '2021-05-09 01:35:23', '2021-05-09 01:57:18');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (54, 100027, '华硕无畏Pro14 标压锐龙版 2.8K OLED屏轻薄笔记本电脑', 'R7-5800H 16G 512G 133%sRGB高色域 600尼特 90Hz', 'fff7fc7b-596f-43dc-88f6-38f63606803e.jpg', 'fff7fc7b-596f-43dc-88f6-38f63606803e.jpg,e2c63dca-39d3-4b24-9c97-401ad432b27c.jpg,a8b52eb3-57ca-4d8a-8af5-6f55af3d0191.jpg,453631bb-4bb2-459d-9bbc-30b042c2e33c.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/186676/31/581/669854/608a4967E3041c6f0/3d249bc4086ec200.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/186676/31/581/669854/608a4967E3041c6f0/3d249bc4086ec200.jpg" width="527" height="938"></p>', 4999.00, 99, 1, '2021-05-09 01:37:10', '2021-05-09 01:37:10');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (55, 100028, '北汽新能源观光车 14座', '新车汽车买车新能源车电动特种车', '2d5a1bbe-e912-442e-8af7-7080bb04d6a2.jpg', '2d5a1bbe-e912-442e-8af7-7080bb04d6a2.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/167935/33/15497/780743/6062e2ceE9a19ad59/266da88928199cb5.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/167935/33/15497/780743/6062e2ceE9a19ad59/266da88928199cb5.jpg" width="800" height="630.7555555555556"></p>', 100000.00, 99, 1, '2021-05-09 01:40:28', '2021-05-09 01:40:28');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (56, 100029, '奥迪(AUDI) 4S店原厂汽车用品 机油/润滑油', '5W-40 1L A4L/A6L/Q3/Q5/Q7/TT/S系/全系汽柴油通用/一汽大众适用', '20f3676c-141a-47f3-9615-1209c5632f9b.jpg', '20f3676c-141a-47f3-9615-1209c5632f9b.jpg,6b4bd923-4b24-43c1-b411-098515154b37.jpg,1bfbb67d-e373-4904-b13d-ace78f8f1316.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/162314/12/3748/107163/60092928E68b4b8d8/8f050fc84657011c.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/162314/12/3748/107163/60092928E68b4b8d8/8f050fc84657011c.jpg"></p>', 89.00, 99, 1, '2021-05-09 01:42:36', '2021-05-09 01:42:36');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (57, 100029, '麦谷车联X8S 全面屏行车记录仪 4G流媒体智能后视镜', '前后高清双录 APP直播停车监控 联网', '28a49cb2-f46a-4a28-adf9-88f2f7d35abe.jpg', '28a49cb2-f46a-4a28-adf9-88f2f7d35abe.jpg,18a82397-77fe-434a-a074-5d65da38b0af.jpg,21ecd541-0bb3-4598-a438-93861a8ad0f4.jpg,aa60ae74-3f1e-4337-9641-5a38037a0f0b.jpg,bcf53ba5-73cd-43d0-84a5-7e1677378a51.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/111145/11/14396/63247/5f2d3043E407bc7ae/fd7d493d5a205038.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/111145/11/14396/63247/5f2d3043E407bc7ae/fd7d493d5a205038.jpg"><img src="https://img30.360buyimg.com/sku/jfs/t1/165502/5/14636/179865/605d42ebE6200e634/a666b58987878dda.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/165502/5/14636/179865/605d42ebE6200e634/a666b58987878dda.jpg"></p>', 769.00, 99, 1, '2021-05-09 01:44:47', '2021-05-09 01:44:47');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (58, 100030, '星特朗（CELESTRON）天文望远镜80DX（Deluxe80EQ）', '高清高倍大口径专业观星观景儿童科普礼物', '65a8816f-e186-4c58-a811-c3b39a0e457a.jpg', '65a8816f-e186-4c58-a811-c3b39a0e457a.jpg,fffdd2a3-a418-43f0-9e1a-5812d2e239fc.jpg,20ee4cbb-54ad-4c2a-9cec-9a78fc09f062.jpg,d2605b58-8e93-47d5-b502-61f8409502bf.jpg,cab6066f-d313-4c9f-8abe-f5b557054a2e.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/135379/27/7/222347/5ec77ec2E16e796dc/58718017d8fabf5a.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/135379/27/7/222347/5ec77ec2E16e796dc/58718017d8fabf5a.jpg"><img src="https://img30.360buyimg.com/sku/jfs/t1/116483/2/7995/179542/5ec77ec2E973fdbd3/01e0b2a4f87075f1.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/116483/2/7995/179542/5ec77ec2E973fdbd3/01e0b2a4f87075f1.jpg"></p>', 1100.00, 99, 1, '2021-05-09 01:46:53', '2021-05-09 01:46:53');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (59, 100031, '麦瑞克Merach椭圆机家用商用太空漫步机', '踏步椭圆仪运动健身器材昆仑K4 12KG飞轮/51cm步距/300斤承重/坡度调节', '3e342a9c-7cf3-4f65-a9b6-d8f576a44581.jpg', '3e342a9c-7cf3-4f65-a9b6-d8f576a44581.jpg,d5bcedda-eb98-4caa-afb7-eefc9f7f484c.jpg,a7de7736-b77d-4aa0-83c3-8c83e03896cb.jpg', '<p><img src="http://img10.360buyimg.com/imgzone/jfs/t1/117199/1/4821/425214/5eb01f96E245f8622/8480b32f1c661fd2.jpg"></p>', 3999.00, 99, 1, '2021-05-09 01:51:00', '2021-05-09 01:51:00');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (60, 100032, 'labuladong的算法小抄', 'Python Java C++零基础', '9668d4ae-294f-40f5-ad6c-cfcd9eda1c97.jpg', '9668d4ae-294f-40f5-ad6c-cfcd9eda1c97.jpg,9d4d2884-88c0-4b95-bc64-5f4395925726.jpg,a6c68aa6-936b-4231-b937-e447982ec857.jpg,dd50bca2-2396-42f2-832b-3ef704e6b681.jpg', '<p><img src="https://img30.360buyimg.com/vc/jfs/t1/130878/28/17657/703612/5fc0b332E329e7843/dd0416e72ca9ca4a.jpg"></p>', 82.90, 99, 1, '2021-05-09 01:54:45', '2021-05-09 01:54:45');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (61, 100026, 'JBL GO2 音乐金砖二代 便携式蓝牙音箱', '低音炮 户外音箱 迷你小音响 可免提通话 防水设计 宝石红', '5739d028-dcdd-464d-8cf0-aedfce5dae8f.jpg', '5739d028-dcdd-464d-8cf0-aedfce5dae8f.jpg,6fef344f-8da3-4ffe-8e6d-9493455014d0.jpg,caba409b-3541-4bf9-99e1-29126426bc8f.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t18451/111/2719705666/372614/3f6fc973/5b0518beNdc3fab63.jpg" alt="https://img30.360buyimg.com/sku/jfs/t18451/111/2719705666/372614/3f6fc973/5b0518beNdc3fab63.jpg"><img src="https://img30.360buyimg.com/sku/jfs/t1/110193/5/6332/701510/5e4a5b1aEb08780b5/5042e96fbad22673.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/110193/5/6332/701510/5e4a5b1aEb08780b5/5042e96fbad22673.jpg" width="750" height="1866.0477453580902"><br></p>', 199.00, 99, 1, '2021-05-09 01:59:24', '2021-05-09 01:59:24');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (62, 100034, '皇冠玩具（ HUANGGUAN）中密度木质足球台', '木纹板桌上足球机 小型6杆桌上足球 35', '891beb38-3005-40c3-a998-334e17d2a74c.jpg', '891beb38-3005-40c3-a998-334e17d2a74c.jpg,53b7a692-aa40-4f10-b010-83559dc1ab1d.jpg,ff87f718-4026-4b81-97bb-c691e5b90158.jpg,89aad033-ac1a-49be-93ba-32829187de25.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/166519/6/7070/656492/6059a6c4Eb1cec01e/093b36653b26e339.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/166519/6/7070/656492/6059a6c4Eb1cec01e/093b36653b26e339.jpg" width="587" height="938"></p>', 82.00, 99, 1, '2021-05-09 02:02:04', '2021-05-09 02:02:04');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (63, 100035, '恩雅（enya）MU1恩雅智能尤克里里23英寸', '神偷奶爸小黄人尤克里里初学者小吉他', 'a6546e28-5771-4470-bee8-3bf9573c223d.jpg', 'a6546e28-5771-4470-bee8-3bf9573c223d.jpg,c606fe30-c34b-4314-95e0-7a35b88af871.jpg,2dfc0579-aef7-408b-8b19-6c635062f7ef.jpg,e5cf9a50-aed0-4798-a7e8-9574029463f2.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t11542/70/2967335001/307920/9077e62b/5cdd2c24N490bfc4b.jpg" alt="https://img30.360buyimg.com/sku/jfs/t11542/70/2967335001/307920/9077e62b/5cdd2c24N490bfc4b.jpg"><img src="https://img30.360buyimg.com/sku/jfs/t1/47027/11/473/307067/5cd8d1caE10c89978/7496b3222953194a.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/47027/11/473/307067/5cd8d1caE10c89978/7496b3222953194a.jpg"><img src="https://img30.360buyimg.com/sku/jfs/t26800/253/2707099880/237149/edf546f3/5cd8d1d6Nda024283.jpg" alt="https://img30.360buyimg.com/sku/jfs/t26800/253/2707099880/237149/edf546f3/5cd8d1d6Nda024283.jpg" width="750" height="1043.7685459940653"><img src="https://img30.360buyimg.com/sku/jfs/t29836/193/1348233158/189438/5ddd8a84/5cdd344bNc87f9570.jpg" alt="https://img30.360buyimg.com/sku/jfs/t29836/193/1348233158/189438/5ddd8a84/5cdd344bNc87f9570.jpg" width="750" height="1537.833827893175"><img src="https://img30.360buyimg.com/sku/jfs/t28864/309/1156406035/147315/83db2fac/5cd8d1d6Nee475ce3.jpg" alt="https://img30.360buyimg.com/sku/jfs/t28864/309/1156406035/147315/83db2fac/5cd8d1d6Nee475ce3.jpg"><img src="https://img30.360buyimg.com/sku/jfs/t10579/321/2797542173/299369/d2d5e5ce/5cd8d1d6N8f95bed4.jpg" alt="https://img30.360buyimg.com/sku/jfs/t10579/321/2797542173/299369/d2d5e5ce/5cd8d1d6N8f95bed4.jpg"><img src="https://img30.360buyimg.com/sku/jfs/t30667/45/1160702104/298060/7e7c2902/5cd8d1d6N7dd34f23.jpg" alt="https://img30.360buyimg.com/sku/jfs/t30667/45/1160702104/298060/7e7c2902/5cd8d1d6N7dd34f23.jpg"><img src="https://img30.360buyimg.com/sku/jfs/t11278/338/2789228516/293237/d1df20d8/5cd8d221N464f2c37.jpg" alt="https://img30.360buyimg.com/sku/jfs/t11278/338/2789228516/293237/d1df20d8/5cd8d221N464f2c37.jpg"><img src="https://img30.360buyimg.com/sku/jfs/t30721/321/1205900291/296285/4f3a3f99/5cd8d221N21376111.jpg" alt="https://img30.360buyimg.com/sku/jfs/t30721/321/1205900291/296285/4f3a3f99/5cd8d221N21376111.jpg"><img src="https://img30.360buyimg.com/sku/jfs/t29710/33/1178637084/305551/2ae75177/5cd8d221N879a5f4d.jpg" alt="https://img30.360buyimg.com/sku/jfs/t29710/33/1178637084/305551/2ae75177/5cd8d221N879a5f4d.jpg"><img src="https://img30.360buyimg.com/sku/jfs/t10564/56/2772303490/310590/6be48555/5cd8d221Nc9a9cde0.jpg" alt="https://img30.360buyimg.com/sku/jfs/t10564/56/2772303490/310590/6be48555/5cd8d221Nc9a9cde0.jpg"><img src="https://img30.360buyimg.com/sku/jfs/t30184/64/1200933618/288632/ec42da8/5cd8d221N2d73ca8b.jpg" alt="https://img30.360buyimg.com/sku/jfs/t30184/64/1200933618/288632/ec42da8/5cd8d221N2d73ca8b.jpg"><img src="https://img30.360buyimg.com/sku/jfs/t30211/212/1136276232/295056/e1451b4d/5cd8d287N3836d74c.jpg" alt="https://img30.360buyimg.com/sku/jfs/t30211/212/1136276232/295056/e1451b4d/5cd8d287N3836d74c.jpg"></p>', 999.00, 99, 1, '2021-05-09 02:06:39', '2021-05-09 02:06:39');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (64, 100035, '雅马哈（YAMAHA）DTX452K入门升级款电子鼓', '电鼓便携爵士鼓成年人儿童通用电架子鼓', 'ad5dcd72-46ee-4dcd-8e02-6f4574b7df0b.jpg', 'ad5dcd72-46ee-4dcd-8e02-6f4574b7df0b.jpg,a290ceea-0968-42e2-92cc-cc42a04d7f01.jpg,1af0c5bf-703a-4b30-a81e-945125ac24b4.jpg,0c23de23-1971-4dd9-946d-37887b62a9e6.jpg', '<p><img src="https://img30.360buyimg.com/sku/jfs/t1/167561/23/5645/93541/601c9fb6E01979a73/2dd3b1ddff0dbe85.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/167561/23/5645/93541/601c9fb6E01979a73/2dd3b1ddff0dbe85.jpg" width="700" height="938"><img src="https://img30.360buyimg.com/sku/jfs/t1/160029/24/6155/138276/601ca13bEf443b77b/ca36182da09fa63a.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/160029/24/6155/138276/601ca13bEf443b77b/ca36182da09fa63a.jpg" width="700" height="1092.5124792013312"><img src="https://img30.360buyimg.com/sku/jfs/t1/164605/21/5647/115780/601ca152E0bd8d713/dfca64254f12c23f.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/164605/21/5647/115780/601ca152E0bd8d713/dfca64254f12c23f.jpg" width="700" height="1059.032258064516"><img src="https://img30.360buyimg.com/sku/jfs/t1/160342/10/5936/114468/601ca152E9750aa7e/c689746cc2f8964b.jpg" alt="https://img30.360buyimg.com/sku/jfs/t1/160342/10/5936/114468/601ca152E9750aa7e/c689746cc2f8964b.jpg" width="700" height="1002.4427480916031"></p>', 5199.00, 99, 1, '2021-05-09 02:09:14', '2021-05-09 02:09:14');
INSERT INTO emm_mall.mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock, status, create_time, update_time) VALUES (65, 100018, '丹东99草莓2斤装 新鲜水果', '现摘现发。净重2.8斤左右', '45db7075-de68-4c8b-aa1a-17571708cbdf.jpg', '45db7075-de68-4c8b-aa1a-17571708cbdf.jpg,f0e9c27b-c26a-4048-ac6a-92c09981b690.jpg,e466dd66-9338-410f-842e-809e4c13fbb6.jpg,5357c51a-9f50-40b2-941b-6afcb30ca95b.jpg,8fb2bfcf-954b-413a-9e4a-b49b8e6ee19d.jpg', '<p><img alt="" src="http://img30.360buyimg.com/popWaterMark/jfs/t19771/338/2067738064/303490/b61636bf/5ae07774N718fd289.jpg"><img alt="" src="http://img30.360buyimg.com/popWaterMark/jfs/t19840/309/5265330/419026/416fbd95/5ae07774N8c5667fa.jpg"><img alt="" src="http://img30.360buyimg.com/popWaterMark/jfs/t17221/239/1939066810/417182/2babf64d/5ae07774N4b644c82.jpg"></p>', 69.00, 99, 1, '2021-05-09 02:12:32', '2021-05-09 02:12:32');
COMMIT;*/


-- ----------------------------
-- Create table `mall_shipping`
-- ----------------------------
DROP TABLE IF EXISTS `mall_shipping`;
CREATE TABLE `mall_shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '收货姓名',
  `receiver_phone` varchar(20) DEFAULT NULL COMMENT '收货电话',
  `receiver_province` varchar(20) DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(20) DEFAULT NULL COMMENT '城市',
  `receiver_district` varchar(20) DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `receiver_zip` varchar(6) DEFAULT NULL COMMENT '邮编',
  `status` int(6) DEFAULT '1' COMMENT '可用状态',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

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
DROP TABLE IF EXISTS `mall_user`;
CREATE TABLE `mall_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '用户密码，MD5加密',
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `question` varchar(100) DEFAULT NULL COMMENT '找回密码问题',
  `answer` varchar(100) DEFAULT NULL COMMENT '找回密码答案',
  `role` int(4) NOT NULL COMMENT '角色0-管理员,1-普通用户',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_unique` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Pre-Records of `mall_user`
-- ----------------------------
/*BEGIN;
INSERT INTO `mall_user` VALUES ('1', 'admin', '8EA7410A2B3E3158CBB17E6B1A087FD9', 'admin@woohoo.top', '13800138000', '问题', '答案', '1', '2021-05-15 00:00:00', '2021-05-15 00:00:00'),
('2', 'emmettwoo', '8EA7410A2B3E3158CBB17E6B1A087FD9', 'emmettwoo@outlook.com', '13800138000', '问题', '答案', '0', '2020-02-01 01:00:00', '2020-02-01 01:00:00'),
('3', 'cdfeng', '8EA7410A2B3E3158CBB17E6B1A087FD9', 'cdfeng@woohoo.top', '13800138000', '问题', '答案', '0', '2020-02-01 02:00:00', '2020-02-01 02:00:00'),
('4', 'notdefined', '8EA7410A2B3E3158CBB17E6B1A087FD9', 'notdefined@woohoo.top', '13800138000', '问题', '答案', '0', '2020-02-01 03:00:00', '2020-02-01 03:00:00');
COMMIT;*/


SET FOREIGN_KEY_CHECKS = 1;
