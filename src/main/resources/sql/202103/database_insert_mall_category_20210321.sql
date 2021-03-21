SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;
USE `emm_mall`;

-- ----------------------------
-- Insert into table `mall_category`
-- ----------------------------
BEGIN;
TRUNCATE TABLE mall_category;
INSERT INTO emm_mall.mall_category (id, parent_id, name, enable, create_by, create_time, update_by, update_time, remark)
VALUES (1, 0, '先锋干员', 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO emm_mall.mall_category (id, parent_id, name, enable, create_by, create_time, update_by, update_time, remark)
VALUES (2, 0, '近卫干员', 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO emm_mall.mall_category (id, parent_id, name, enable, create_by, create_time, update_by, update_time, remark)
VALUES (3, 0, '狙击干员', 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO emm_mall.mall_category (id, parent_id, name, enable, create_by, create_time, update_by, update_time, remark)
VALUES (4, 0, '重装干员', 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO emm_mall.mall_category (id, parent_id, name, enable, create_by, create_time, update_by, update_time, remark)
VALUES (5, 0, '医疗干员', 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO emm_mall.mall_category (id, parent_id, name, enable, create_by, create_time, update_by, update_time, remark)
VALUES (6, 0, '辅助干员', 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO emm_mall.mall_category (id, parent_id, name, enable, create_by, create_time, update_by, update_time, remark)
VALUES (7, 0, '术士干员', 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO emm_mall.mall_category (id, parent_id, name, enable, create_by, create_time, update_by, update_time, remark)
VALUES (8, 0, '特种干员', 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
COMMIT;