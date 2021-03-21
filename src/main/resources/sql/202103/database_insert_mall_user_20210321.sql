SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;
USE `emm_mall`;

-- ----------------------------
-- Insert into table `mall_user`
-- ----------------------------
BEGIN;
TRUNCATE TABLE mall_category;
INSERT INTO `mall_user`
VALUES ('1', 'admin', '8EA7410A2B3E3158CBB17E6B1A087FD9', 'emmettwoo', 'admin@woohoo.top', '13800138000', '问题', '答案',
        '1',
        'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert'),
       ('2', 'emmettwoo', '8EA7410A2B3E3158CBB17E6B1A087FD9', 'emmettwoo', 'emmettwoo@outlook.com', '13800138000', '问题',
        '答案', '0',
        'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert'),
       ('3', 'cdfeng', '8EA7410A2B3E3158CBB17E6B1A087FD9', 'emmettwoo', 'cdfeng@woohoo.top', '13800138000', '问题', '答案',
        '0',
        'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert'),
       ('4', 'notdefined', '8EA7410A2B3E3158CBB17E6B1A087FD9', 'emmettwoo', 'notdefined@woohoo.top', '13800138000',
        '问题', '答案', '0',
        'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
COMMIT;