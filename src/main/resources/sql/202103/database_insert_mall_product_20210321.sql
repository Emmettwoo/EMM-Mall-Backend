SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;
USE `emm_mall`;

-- ----------------------------
-- Insert into table `mall_product`
-- ----------------------------
BEGIN;
TRUNCATE TABLE mall_product;
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (1, 2, '猎蜂', 'Beehunter', 'Beehunter/Beehunter_img-1.png',
        'Beehunter/Beehunter_img-1.png,Beehunter/Beehunter_img-2.png,Beehunter/Beehunter_img-3.png', '<img src="http://q.woohoo.top/Beehunter/Beehunter_img-1.png" width="512px">
<img src="http://q.woohoo.top/Beehunter/Beehunter_img-2.png" width="512px">
<img src="http://q.woohoo.top/Beehunter/Beehunter_img-3.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (2, 4, '米格鲁', 'Beagle', 'Beagle/Beagle_img-1.png', 'Beagle/Beagle_img-1.png,Beagle/Beagle_img-2.png', '<img src="http://q.woohoo.top/Beagle/Beagle_img-1.png" width="512px">
<img src="http://q.woohoo.top/Beagle/Beagle_img-2.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (3, 6, '月禾', 'Tsukinogi', 'Tsukinogi/Tsukinogi_img-1.png',
        'Tsukinogi/Tsukinogi_img-1.png,Tsukinogi/Tsukinogi_img-2.png', '<img src="http://q.woohoo.top/Tsukinogi/Tsukinogi_img-1.png" width="512px">
<img src="http://q.woohoo.top/Tsukinogi/Tsukinogi_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (4, 2, '芳汀', 'Arene', 'Arene/Arene_img-1.png', 'Arene/Arene_img-1.png,Arene/Arene_img-2.png', '<img src="http://q.woohoo.top/Arene/Arene_img-1.png" width="512px">
<img src="http://q.woohoo.top/Arene/Arene_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (5, 4, '黑角', 'NoirCorne', 'NoirCorne/NoirCorne_img-1.png', 'NoirCorne/NoirCorne_img-1.png', '<img src="http://q.woohoo.top/NoirCorne/NoirCorne_img-1.png" width="512px">
', 2, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (6, 7, '刻俄柏', 'Ceobe', 'Ceobe/Ceobe_img-1.png',
        'Ceobe/Ceobe_img-1.png,Ceobe/Ceobe_img-2.png,Ceobe/Ceobe_img-3.png', '<img src="http://q.woohoo.top/Ceobe/Ceobe_img-1.png" width="512px">
<img src="http://q.woohoo.top/Ceobe/Ceobe_img-2.png" width="512px">
<img src="http://q.woohoo.top/Ceobe/Ceobe_img-3.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (7, 4, '吽', 'Hung', 'Hung/Hung_img-1.png', 'Hung/Hung_img-1.png,Hung/Hung_img-2.png', '<img src="http://q.woohoo.top/Hung/Hung_img-1.png" width="512px">
<img src="http://q.woohoo.top/Hung/Hung_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (8, 2, '煌', 'Blaze', 'Blaze/Blaze_img-1.png', 'Blaze/Blaze_img-1.png,Blaze/Blaze_img-2.png', '<img src="http://q.woohoo.top/Blaze/Blaze_img-1.png" width="512px">
<img src="http://q.woohoo.top/Blaze/Blaze_img-2.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (9, 5, '微风', 'Breeze', 'Breeze/Breeze_img-1.png', 'Breeze/Breeze_img-1.png,Breeze/Breeze_img-2.png', '<img src="http://q.woohoo.top/Breeze/Breeze_img-1.png" width="512px">
<img src="http://q.woohoo.top/Breeze/Breeze_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (10, 5, '闪灵', 'Shining', 'Shining/Shining_img-1.png',
        'Shining/Shining_img-1.png,Shining/Shining_img-2.png,Shining/Shining_img-3.png', '<img src="http://q.woohoo.top/Shining/Shining_img-1.png" width="512px">
<img src="http://q.woohoo.top/Shining/Shining_img-2.png" width="512px">
<img src="http://q.woohoo.top/Shining/Shining_img-3.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (11, 5, 'Lancet-2', 'Lancet-2', 'Lancet-2/Lancet-2_img-1.png', 'Lancet-2/Lancet-2_img-1.png', '<img src="http://q.woohoo.top/Lancet-2/Lancet-2_img-1.png" width="512px">
', 1, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (12, 8, '槐琥', 'WaaiFu', 'WaaiFu/WaaiFu_img-1.png', 'WaaiFu/WaaiFu_img-1.png,WaaiFu/WaaiFu_img-2.png', '<img src="http://q.woohoo.top/WaaiFu/WaaiFu_img-1.png" width="512px">
<img src="http://q.woohoo.top/WaaiFu/WaaiFu_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (13, 2, 'Castle-3', 'Castle-3', 'Castle-3/Castle-3_img-1.png',
        'Castle-3/Castle-3_img-1.png,Castle-3/Castle-3_img-2.png', '<img src="http://q.woohoo.top/Castle-3/Castle-3_img-1.png" width="512px">
<img src="http://q.woohoo.top/Castle-3/Castle-3_img-2.png" width="512px">
', 1, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (14, 5, '絮雨', 'Whisperain', 'Whisperain/Whisperain_img-1.png',
        'Whisperain/Whisperain_img-1.png,Whisperain/Whisperain_img-2.png', '<img src="http://q.woohoo.top/Whisperain/Whisperain_img-1.png" width="512px">
<img src="http://q.woohoo.top/Whisperain/Whisperain_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (15, 7, '天火', 'Skyfire', 'Skyfire/Skyfire_img-1.png',
        'Skyfire/Skyfire_img-1.png,Skyfire/Skyfire_img-2.png,Skyfire/Skyfire_img-3.png', '<img src="http://q.woohoo.top/Skyfire/Skyfire_img-1.png" width="512px">
<img src="http://q.woohoo.top/Skyfire/Skyfire_img-2.png" width="512px">
<img src="http://q.woohoo.top/Skyfire/Skyfire_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (16, 4, '森蚺', 'Eunectes', 'Eunectes/Eunectes_img-1.png',
        'Eunectes/Eunectes_img-1.png,Eunectes/Eunectes_img-2.png', '<img src="http://q.woohoo.top/Eunectes/Eunectes_img-1.png" width="512px">
<img src="http://q.woohoo.top/Eunectes/Eunectes_img-2.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (17, 3, '能天使', 'Exusiai', 'Exusiai/Exusiai_img-1.png',
        'Exusiai/Exusiai_img-1.png,Exusiai/Exusiai_img-2.png,Exusiai/Exusiai_img-3.png,Exusiai/Exusiai_img-4.png', '<img src="http://q.woohoo.top/Exusiai/Exusiai_img-1.png" width="512px">
<img src="http://q.woohoo.top/Exusiai/Exusiai_img-2.png" width="512px">
<img src="http://q.woohoo.top/Exusiai/Exusiai_img-3.png" width="512px">
<img src="http://q.woohoo.top/Exusiai/Exusiai_img-4.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (18, 3, '奥斯塔', 'Aosta', 'Aosta/Aosta_img-1.png', 'Aosta/Aosta_img-1.png,Aosta/Aosta_img-2.png', '<img src="http://q.woohoo.top/Aosta/Aosta_img-1.png" width="512px">
<img src="http://q.woohoo.top/Aosta/Aosta_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (19, 4, '瑕光', 'Blemishine', 'Blemishine/Blemishine_img-1.png',
        'Blemishine/Blemishine_img-1.png,Blemishine/Blemishine_img-2.png', '<img src="http://q.woohoo.top/Blemishine/Blemishine_img-1.png" width="512px">
<img src="http://q.woohoo.top/Blemishine/Blemishine_img-2.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (20, 3, '酸糖', 'Aciddrop', 'Aciddrop/Aciddrop_img-1.png',
        'Aciddrop/Aciddrop_img-1.png,Aciddrop/Aciddrop_img-2.png', '<img src="http://q.woohoo.top/Aciddrop/Aciddrop_img-1.png" width="512px">
<img src="http://q.woohoo.top/Aciddrop/Aciddrop_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (21, 7, '阿米娅', 'Amiya', 'Amiya/Amiya_img-1.png',
        'Amiya/Amiya_img-1.png,Amiya/Amiya_img-2.png,Amiya/Amiya_img-3.png,Amiya/Amiya_img-4.png', '<img src="http://q.woohoo.top/Amiya/Amiya_img-1.png" width="512px">
<img src="http://q.woohoo.top/Amiya/Amiya_img-2.png" width="512px">
<img src="http://q.woohoo.top/Amiya/Amiya_img-3.png" width="512px">
<img src="http://q.woohoo.top/Amiya/Amiya_img-4.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (22, 4, '坚雷', 'Dur-nar', 'Dur-nar/Dur-nar_img-1.png', 'Dur-nar/Dur-nar_img-1.png,Dur-nar/Dur-nar_img-2.png', '<img src="http://q.woohoo.top/Dur-nar/Dur-nar_img-1.png" width="512px">
<img src="http://q.woohoo.top/Dur-nar/Dur-nar_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (23, 2, '炎客', 'Flamebringer', 'Flamebringer/Flamebringer_img-1.png',
        'Flamebringer/Flamebringer_img-1.png,Flamebringer/Flamebringer_img-2.png', '<img src="http://q.woohoo.top/Flamebringer/Flamebringer_img-1.png" width="512px">
<img src="http://q.woohoo.top/Flamebringer/Flamebringer_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (24, 2, '断崖', 'Ayerscarpe', 'Ayerscarpe/Ayerscarpe_img-1.png',
        'Ayerscarpe/Ayerscarpe_img-1.png,Ayerscarpe/Ayerscarpe_img-2.png', '<img src="http://q.woohoo.top/Ayerscarpe/Ayerscarpe_img-1.png" width="512px">
<img src="http://q.woohoo.top/Ayerscarpe/Ayerscarpe_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (25, 2, '斯卡蒂', 'Skadi', 'Skadi/Skadi_img-1.png',
        'Skadi/Skadi_img-1.png,Skadi/Skadi_img-2.png,Skadi/Skadi_img-3.png', '<img src="http://q.woohoo.top/Skadi/Skadi_img-1.png" width="512px">
<img src="http://q.woohoo.top/Skadi/Skadi_img-2.png" width="512px">
<img src="http://q.woohoo.top/Skadi/Skadi_img-3.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (26, 4, '蛇屠箱', 'Cuora', 'Cuora/Cuora_img-1.png',
        'Cuora/Cuora_img-1.png,Cuora/Cuora_img-2.png,Cuora/Cuora_img-3.png', '<img src="http://q.woohoo.top/Cuora/Cuora_img-1.png" width="512px">
<img src="http://q.woohoo.top/Cuora/Cuora_img-2.png" width="512px">
<img src="http://q.woohoo.top/Cuora/Cuora_img-3.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (27, 7, '薄绿', 'Mint', 'Mint/Mint_img-1.png', 'Mint/Mint_img-1.png,Mint/Mint_img-2.png', '<img src="http://q.woohoo.top/Mint/Mint_img-1.png" width="512px">
<img src="http://q.woohoo.top/Mint/Mint_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (28, 2, '宴', 'Utage', 'Utage/Utage_img-1.png',
        'Utage/Utage_img-1.png,Utage/Utage_img-2.png,Utage/Utage_img-3.png', '<img src="http://q.woohoo.top/Utage/Utage_img-1.png" width="512px">
<img src="http://q.woohoo.top/Utage/Utage_img-2.png" width="512px">
<img src="http://q.woohoo.top/Utage/Utage_img-3.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (29, 6, '初雪', 'Pramanix', 'Pramanix/Pramanix_img-1.png',
        'Pramanix/Pramanix_img-1.png,Pramanix/Pramanix_img-2.png,Pramanix/Pramanix_img-3.png', '<img src="http://q.woohoo.top/Pramanix/Pramanix_img-1.png" width="512px">
<img src="http://q.woohoo.top/Pramanix/Pramanix_img-2.png" width="512px">
<img src="http://q.woohoo.top/Pramanix/Pramanix_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (30, 6, '空', 'Sora', 'Sora/Sora_img-1.png', 'Sora/Sora_img-1.png,Sora/Sora_img-2.png,Sora/Sora_img-3.png', '<img src="http://q.woohoo.top/Sora/Sora_img-1.png" width="512px">
<img src="http://q.woohoo.top/Sora/Sora_img-2.png" width="512px">
<img src="http://q.woohoo.top/Sora/Sora_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (31, 8, '阿消', 'Shaw', 'Shaw/Shaw_img-1.png', 'Shaw/Shaw_img-1.png,Shaw/Shaw_img-2.png,Shaw/Shaw_img-3.png', '<img src="http://q.woohoo.top/Shaw/Shaw_img-1.png" width="512px">
<img src="http://q.woohoo.top/Shaw/Shaw_img-2.png" width="512px">
<img src="http://q.woohoo.top/Shaw/Shaw_img-3.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (32, 6, '稀音', 'Scene', 'Scene/Scene_img-1.png', 'Scene/Scene_img-1.png,Scene/Scene_img-2.png', '<img src="http://q.woohoo.top/Scene/Scene_img-1.png" width="512px">
<img src="http://q.woohoo.top/Scene/Scene_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (33, 7, '苦艾', 'Absinthe', 'Absinthe/Absinthe_img-1.png',
        'Absinthe/Absinthe_img-1.png,Absinthe/Absinthe_img-2.png', '<img src="http://q.woohoo.top/Absinthe/Absinthe_img-1.png" width="512px">
<img src="http://q.woohoo.top/Absinthe/Absinthe_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (34, 2, '燧石', 'Flint', 'Flint/Flint_img-1.png', 'Flint/Flint_img-1.png,Flint/Flint_img-2.png', '<img src="http://q.woohoo.top/Flint/Flint_img-1.png" width="512px">
<img src="http://q.woohoo.top/Flint/Flint_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (35, 5, '苏苏洛', 'Sussurro', 'Sussurro/Sussurro_img-1.png',
        'Sussurro/Sussurro_img-1.png,Sussurro/Sussurro_img-2.png', '<img src="http://q.woohoo.top/Sussurro/Sussurro_img-1.png" width="512px">
<img src="http://q.woohoo.top/Sussurro/Sussurro_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (36, 8, '温蒂', 'Weedy', 'Weedy/Weedy_img-1.png', 'Weedy/Weedy_img-1.png,Weedy/Weedy_img-2.png', '<img src="http://q.woohoo.top/Weedy/Weedy_img-1.png" width="512px">
<img src="http://q.woohoo.top/Weedy/Weedy_img-2.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (37, 7, '杜林', 'Durin', 'Durin/Durin_img-1.png', 'Durin/Durin_img-1.png', '<img src="http://q.woohoo.top/Durin/Durin_img-1.png" width="512px">
', 2, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (38, 4, '泥岩', 'Mudrock', 'Mudrock/Mudrock_img-1.png', 'Mudrock/Mudrock_img-1.png,Mudrock/Mudrock_img-2.png', '<img src="http://q.woohoo.top/Mudrock/Mudrock_img-1.png" width="512px">
<img src="http://q.woohoo.top/Mudrock/Mudrock_img-2.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (39, 7, '卡达', 'Click', 'Click/Click_img-1.png', 'Click/Click_img-1.png,Click/Click_img-2.png', '<img src="http://q.woohoo.top/Click/Click_img-1.png" width="512px">
<img src="http://q.woohoo.top/Click/Click_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (40, 3, '巡林者', 'Rangers', 'Rangers/Rangers_img-1.png', 'Rangers/Rangers_img-1.png', '<img src="http://q.woohoo.top/Rangers/Rangers_img-1.png" width="512px">
', 2, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (41, 3, '白金', 'Platinum', 'Platinum/Platinum_img-1.png',
        'Platinum/Platinum_img-1.png,Platinum/Platinum_img-2.png,Platinum/Platinum_img-3.png', '<img src="http://q.woohoo.top/Platinum/Platinum_img-1.png" width="512px">
<img src="http://q.woohoo.top/Platinum/Platinum_img-2.png" width="512px">
<img src="http://q.woohoo.top/Platinum/Platinum_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (42, 4, '雷蛇', 'Liskarm', 'Liskarm/Liskarm_img-1.png',
        'Liskarm/Liskarm_img-1.png,Liskarm/Liskarm_img-2.png,Liskarm/Liskarm_img-3.png', '<img src="http://q.woohoo.top/Liskarm/Liskarm_img-1.png" width="512px">
<img src="http://q.woohoo.top/Liskarm/Liskarm_img-2.png" width="512px">
<img src="http://q.woohoo.top/Liskarm/Liskarm_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (43, 8, '崖心', 'Cliffheart', 'Cliffheart/Cliffheart_img-1.png',
        'Cliffheart/Cliffheart_img-1.png,Cliffheart/Cliffheart_img-2.png,Cliffheart/Cliffheart_img-3.png,Cliffheart/Cliffheart_img-4.png', '<img src="http://q.woohoo.top/Cliffheart/Cliffheart_img-1.png" width="512px">
<img src="http://q.woohoo.top/Cliffheart/Cliffheart_img-2.png" width="512px">
<img src="http://q.woohoo.top/Cliffheart/Cliffheart_img-3.png" width="512px">
<img src="http://q.woohoo.top/Cliffheart/Cliffheart_img-4.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (44, 4, '古米', 'Гум', 'Гум/Гум_img-1.png', 'Гум/Гум_img-1.png,Гум/Гум_img-2.png,Гум/Гум_img-3.png', '<img src="http://q.woohoo.top/Гум/Гум_img-1.png" width="512px">
<img src="http://q.woohoo.top/Гум/Гум_img-2.png" width="512px">
<img src="http://q.woohoo.top/Гум/Гум_img-3.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (45, 2, '柏喙', 'Bibeak', 'Bibeak/Bibeak_img-1.png', 'Bibeak/Bibeak_img-1.png,Bibeak/Bibeak_img-2.png', '<img src="http://q.woohoo.top/Bibeak/Bibeak_img-1.png" width="512px">
<img src="http://q.woohoo.top/Bibeak/Bibeak_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (46, 7, '伊芙利特', 'Ifrit', 'Ifrit/Ifrit_img-1.png',
        'Ifrit/Ifrit_img-1.png,Ifrit/Ifrit_img-2.png,Ifrit/Ifrit_img-3.png,Ifrit/Ifrit_img-4.png', '<img src="http://q.woohoo.top/Ifrit/Ifrit_img-1.png" width="512px">
<img src="http://q.woohoo.top/Ifrit/Ifrit_img-2.png" width="512px">
<img src="http://q.woohoo.top/Ifrit/Ifrit_img-3.png" width="512px">
<img src="http://q.woohoo.top/Ifrit/Ifrit_img-4.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (47, 7, '惊蛰', 'Leizi', 'Leizi/Leizi_img-1.png', 'Leizi/Leizi_img-1.png,Leizi/Leizi_img-2.png', '<img src="http://q.woohoo.top/Leizi/Leizi_img-1.png" width="512px">
<img src="http://q.woohoo.top/Leizi/Leizi_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (48, 3, '早露', 'Роса', 'Роса/Роса_img-1.png', 'Роса/Роса_img-1.png,Роса/Роса_img-2.png', '<img src="http://q.woohoo.top/Роса/Роса_img-1.png" width="512px">
<img src="http://q.woohoo.top/Роса/Роса_img-2.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (49, 1, '红豆', 'Vigna', 'Vigna/Vigna_img-1.png',
        'Vigna/Vigna_img-1.png,Vigna/Vigna_img-2.png,Vigna/Vigna_img-3.png', '<img src="http://q.woohoo.top/Vigna/Vigna_img-1.png" width="512px">
<img src="http://q.woohoo.top/Vigna/Vigna_img-2.png" width="512px">
<img src="http://q.woohoo.top/Vigna/Vigna_img-3.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (50, 1, '苇草', 'Reed', 'Reed/Reed_img-1.png', 'Reed/Reed_img-1.png,Reed/Reed_img-2.png', '<img src="http://q.woohoo.top/Reed/Reed_img-1.png" width="512px">
<img src="http://q.woohoo.top/Reed/Reed_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (51, 4, '石棉', 'Asbestos', 'Asbestos/Asbestos_img-1.png',
        'Asbestos/Asbestos_img-1.png,Asbestos/Asbestos_img-2.png', '<img src="http://q.woohoo.top/Asbestos/Asbestos_img-1.png" width="512px">
<img src="http://q.woohoo.top/Asbestos/Asbestos_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (52, 5, '芙蓉', 'Hibiscus', 'Hibiscus/Hibiscus_img-1.png',
        'Hibiscus/Hibiscus_img-1.png,Hibiscus/Hibiscus_img-2.png', '<img src="http://q.woohoo.top/Hibiscus/Hibiscus_img-1.png" width="512px">
<img src="http://q.woohoo.top/Hibiscus/Hibiscus_img-2.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (53, 1, '翎羽', 'Plume', 'Plume/Plume_img-1.png', 'Plume/Plume_img-1.png', '<img src="http://q.woohoo.top/Plume/Plume_img-1.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (54, 3, '克洛丝', 'Kroos', 'Kroos/Kroos_img-1.png', 'Kroos/Kroos_img-1.png,Kroos/Kroos_img-2.png', '<img src="http://q.woohoo.top/Kroos/Kroos_img-1.png" width="512px">
<img src="http://q.woohoo.top/Kroos/Kroos_img-2.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (55, 4, '拜松', 'Bison', 'Bison/Bison_img-1.png', 'Bison/Bison_img-1.png,Bison/Bison_img-2.png', '<img src="http://q.woohoo.top/Bison/Bison_img-1.png" width="512px">
<img src="http://q.woohoo.top/Bison/Bison_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (56, 2, '赫拉格', 'Hellagur', 'Hellagur/Hellagur_img-1.png',
        'Hellagur/Hellagur_img-1.png,Hellagur/Hellagur_img-2.png', '<img src="http://q.woohoo.top/Hellagur/Hellagur_img-1.png" width="512px">
<img src="http://q.woohoo.top/Hellagur/Hellagur_img-2.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (57, 3, '空爆', 'Catapult', 'Catapult/Catapult_img-1.png', 'Catapult/Catapult_img-1.png', '<img src="http://q.woohoo.top/Catapult/Catapult_img-1.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (58, 4, '卡缇', 'Cardigan', 'Cardigan/Cardigan_img-1.png',
        'Cardigan/Cardigan_img-1.png,Cardigan/Cardigan_img-2.png', '<img src="http://q.woohoo.top/Cardigan/Cardigan_img-1.png" width="512px">
<img src="http://q.woohoo.top/Cardigan/Cardigan_img-2.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (59, 5, '锡兰', 'Ceylon', 'Ceylon/Ceylon_img-1.png', 'Ceylon/Ceylon_img-1.png,Ceylon/Ceylon_img-2.png', '<img src="http://q.woohoo.top/Ceylon/Ceylon_img-1.png" width="512px">
<img src="http://q.woohoo.top/Ceylon/Ceylon_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (60, 2, '断罪者', 'Conviction', 'Conviction/Conviction_img-1.png',
        'Conviction/Conviction_img-1.png,Conviction/Conviction_img-2.png', '<img src="http://q.woohoo.top/Conviction/Conviction_img-1.png" width="512px">
<img src="http://q.woohoo.top/Conviction/Conviction_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (61, 2, '鞭刃', 'Whislash', 'Whislash/Whislash_img-1.png',
        'Whislash/Whislash_img-1.png,Whislash/Whislash_img-2.png', '<img src="http://q.woohoo.top/Whislash/Whislash_img-1.png" width="512px">
<img src="http://q.woohoo.top/Whislash/Whislash_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (62, 8, '阿', 'Aak', 'Aak/Aak_img-1.png', 'Aak/Aak_img-1.png,Aak/Aak_img-2.png', '<img src="http://q.woohoo.top/Aak/Aak_img-1.png" width="512px">
<img src="http://q.woohoo.top/Aak/Aak_img-2.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (63, 8, '暗索', 'Rope', 'Rope/Rope_img-1.png',
        'Rope/Rope_img-1.png,Rope/Rope_img-2.png,Rope/Rope_img-3.png,Rope/Rope_img-4.png', '<img src="http://q.woohoo.top/Rope/Rope_img-1.png" width="512px">
<img src="http://q.woohoo.top/Rope/Rope_img-2.png" width="512px">
<img src="http://q.woohoo.top/Rope/Rope_img-3.png" width="512px">
<img src="http://q.woohoo.top/Rope/Rope_img-4.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (64, 5, '亚叶', 'Folinic', 'Folinic/Folinic_img-1.png', 'Folinic/Folinic_img-1.png,Folinic/Folinic_img-2.png', '<img src="http://q.woohoo.top/Folinic/Folinic_img-1.png" width="512px">
<img src="http://q.woohoo.top/Folinic/Folinic_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (65, 3, '慑砂', 'Sesa', 'Sesa/Sesa_img-1.png', 'Sesa/Sesa_img-1.png,Sesa/Sesa_img-2.png', '<img src="http://q.woohoo.top/Sesa/Sesa_img-1.png" width="512px">
<img src="http://q.woohoo.top/Sesa/Sesa_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (66, 3, '守林人', 'Firewatch', 'Firewatch/Firewatch_img-1.png',
        'Firewatch/Firewatch_img-1.png,Firewatch/Firewatch_img-2.png,Firewatch/Firewatch_img-3.png', '<img src="http://q.woohoo.top/Firewatch/Firewatch_img-1.png" width="512px">
<img src="http://q.woohoo.top/Firewatch/Firewatch_img-2.png" width="512px">
<img src="http://q.woohoo.top/Firewatch/Firewatch_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (67, 2, '玫兰莎', 'Melantha', 'Melantha/Melantha_img-1.png',
        'Melantha/Melantha_img-1.png,Melantha/Melantha_img-2.png', '<img src="http://q.woohoo.top/Melantha/Melantha_img-1.png" width="512px">
<img src="http://q.woohoo.top/Melantha/Melantha_img-2.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (68, 4, '年', 'Nian', 'Nian/Nian_img-1.png', 'Nian/Nian_img-1.png,Nian/Nian_img-2.png', '<img src="http://q.woohoo.top/Nian/Nian_img-1.png" width="512px">
<img src="http://q.woohoo.top/Nian/Nian_img-2.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (69, 8, 'THRM-EX', 'Thermal-EX', 'Thermal-EX/Thermal-EX_img-1.png', 'Thermal-EX/Thermal-EX_img-1.png', '<img src="http://q.woohoo.top/Thermal-EX/Thermal-EX_img-1.png" width="512px">
', 1, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (70, 6, '格劳克斯', 'Glaucus', 'Glaucus/Glaucus_img-1.png',
        'Glaucus/Glaucus_img-1.png,Glaucus/Glaucus_img-2.png,Glaucus/Glaucus_img-3.png', '<img src="http://q.woohoo.top/Glaucus/Glaucus_img-1.png" width="512px">
<img src="http://q.woohoo.top/Glaucus/Glaucus_img-2.png" width="512px">
<img src="http://q.woohoo.top/Glaucus/Glaucus_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (71, 2, '霜叶', 'Frostleaf', 'Frostleaf/Frostleaf_img-1.png',
        'Frostleaf/Frostleaf_img-1.png,Frostleaf/Frostleaf_img-2.png', '<img src="http://q.woohoo.top/Frostleaf/Frostleaf_img-1.png" width="512px">
<img src="http://q.woohoo.top/Frostleaf/Frostleaf_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (72, 7, '特米米', 'Tomimi', 'Tomimi/Tomimi_img-1.png', 'Tomimi/Tomimi_img-1.png,Tomimi/Tomimi_img-2.png', '<img src="http://q.woohoo.top/Tomimi/Tomimi_img-1.png" width="512px">
<img src="http://q.woohoo.top/Tomimi/Tomimi_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (73, 3, '蓝毒', 'BluePoison', 'BluePoison/BluePoison_img-1.png',
        'BluePoison/BluePoison_img-1.png,BluePoison/BluePoison_img-2.png', '<img src="http://q.woohoo.top/BluePoison/BluePoison_img-1.png" width="512px">
<img src="http://q.woohoo.top/BluePoison/BluePoison_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (74, 2, '刻刀', 'Cutter', 'Cutter/Cutter_img-1.png', 'Cutter/Cutter_img-1.png,Cutter/Cutter_img-2.png', '<img src="http://q.woohoo.top/Cutter/Cutter_img-1.png" width="512px">
<img src="http://q.woohoo.top/Cutter/Cutter_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (75, 8, '孑', 'Jaye', 'Jaye/Jaye_img-1.png', 'Jaye/Jaye_img-1.png,Jaye/Jaye_img-2.png', '<img src="http://q.woohoo.top/Jaye/Jaye_img-1.png" width="512px">
<img src="http://q.woohoo.top/Jaye/Jaye_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (76, 4, '塞雷娅', 'Saria', 'Saria/Saria_img-1.png',
        'Saria/Saria_img-1.png,Saria/Saria_img-2.png,Saria/Saria_img-3.png', '<img src="http://q.woohoo.top/Saria/Saria_img-1.png" width="512px">
<img src="http://q.woohoo.top/Saria/Saria_img-2.png" width="512px">
<img src="http://q.woohoo.top/Saria/Saria_img-3.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (77, 2, '泡普卡', 'Popukar', 'Popukar/Popukar_img-1.png', 'Popukar/Popukar_img-1.png', '<img src="http://q.woohoo.top/Popukar/Popukar_img-1.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (78, 4, '火神', 'Vulcan', 'Vulcan/Vulcan_img-1.png', 'Vulcan/Vulcan_img-1.png,Vulcan/Vulcan_img-2.png', '<img src="http://q.woohoo.top/Vulcan/Vulcan_img-1.png" width="512px">
<img src="http://q.woohoo.top/Vulcan/Vulcan_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (79, 4, '角峰', 'Matterhorn', 'Matterhorn/Matterhorn_img-1.png',
        'Matterhorn/Matterhorn_img-1.png,Matterhorn/Matterhorn_img-2.png,Matterhorn/Matterhorn_img-3.png', '<img src="http://q.woohoo.top/Matterhorn/Matterhorn_img-1.png" width="512px">
<img src="http://q.woohoo.top/Matterhorn/Matterhorn_img-2.png" width="512px">
<img src="http://q.woohoo.top/Matterhorn/Matterhorn_img-3.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (80, 6, '真理', 'Истина', 'Истина/Истина_img-1.png',
        'Истина/Истина_img-1.png,Истина/Истина_img-2.png,Истина/Истина_img-3.png', '<img src="http://q.woohoo.top/Истина/Истина_img-1.png" width="512px">
<img src="http://q.woohoo.top/Истина/Истина_img-2.png" width="512px">
<img src="http://q.woohoo.top/Истина/Истина_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (81, 7, '莱恩哈特', 'Leonhardt', 'Leonhardt/Leonhardt_img-1.png',
        'Leonhardt/Leonhardt_img-1.png,Leonhardt/Leonhardt_img-2.png,Leonhardt/Leonhardt_img-3.png', '<img src="http://q.woohoo.top/Leonhardt/Leonhardt_img-1.png" width="512px">
<img src="http://q.woohoo.top/Leonhardt/Leonhardt_img-2.png" width="512px">
<img src="http://q.woohoo.top/Leonhardt/Leonhardt_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (82, 8, '伊桑', 'Ethan', 'Ethan/Ethan_img-1.png',
        'Ethan/Ethan_img-1.png,Ethan/Ethan_img-2.png,Ethan/Ethan_img-3.png', '<img src="http://q.woohoo.top/Ethan/Ethan_img-1.png" width="512px">
<img src="http://q.woohoo.top/Ethan/Ethan_img-2.png" width="512px">
<img src="http://q.woohoo.top/Ethan/Ethan_img-3.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (83, 5, '赫默', 'Silence', 'Silence/Silence_img-1.png',
        'Silence/Silence_img-1.png,Silence/Silence_img-2.png,Silence/Silence_img-3.png', '<img src="http://q.woohoo.top/Silence/Silence_img-1.png" width="512px">
<img src="http://q.woohoo.top/Silence/Silence_img-2.png" width="512px">
<img src="http://q.woohoo.top/Silence/Silence_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (84, 7, '艾雅法拉', 'Eyjafjalla', 'Eyjafjalla/Eyjafjalla_img-1.png',
        'Eyjafjalla/Eyjafjalla_img-1.png,Eyjafjalla/Eyjafjalla_img-2.png', '<img src="http://q.woohoo.top/Eyjafjalla/Eyjafjalla_img-1.png" width="512px">
<img src="http://q.woohoo.top/Eyjafjalla/Eyjafjalla_img-2.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (85, 5, '夜莺', 'Nightingale', 'Nightingale/Nightingale_img-1.png',
        'Nightingale/Nightingale_img-1.png,Nightingale/Nightingale_img-2.png,Nightingale/Nightingale_img-3.png', '<img src="http://q.woohoo.top/Nightingale/Nightingale_img-1.png" width="512px">
<img src="http://q.woohoo.top/Nightingale/Nightingale_img-2.png" width="512px">
<img src="http://q.woohoo.top/Nightingale/Nightingale_img-3.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (86, 4, '斑点', 'Spot', 'Spot/Spot_img-1.png', 'Spot/Spot_img-1.png,Spot/Spot_img-2.png,Spot/Spot_img-3.png', '<img src="http://q.woohoo.top/Spot/Spot_img-1.png" width="512px">
<img src="http://q.woohoo.top/Spot/Spot_img-2.png" width="512px">
<img src="http://q.woohoo.top/Spot/Spot_img-3.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (87, 6, '地灵', 'Earthspirit', 'Earthspirit/Earthspirit_img-1.png',
        'Earthspirit/Earthspirit_img-1.png,Earthspirit/Earthspirit_img-2.png', '<img src="http://q.woohoo.top/Earthspirit/Earthspirit_img-1.png" width="512px">
<img src="http://q.woohoo.top/Earthspirit/Earthspirit_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (88, 2, '铸铁', 'Sideroca', 'Sideroca/Sideroca_img-1.png',
        'Sideroca/Sideroca_img-1.png,Sideroca/Sideroca_img-2.png', '<img src="http://q.woohoo.top/Sideroca/Sideroca_img-1.png" width="512px">
<img src="http://q.woohoo.top/Sideroca/Sideroca_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (89, 1, '格拉尼', 'Grani', 'Grani/Grani_img-1.png',
        'Grani/Grani_img-1.png,Grani/Grani_img-2.png,Grani/Grani_img-3.png', '<img src="http://q.woohoo.top/Grani/Grani_img-1.png" width="512px">
<img src="http://q.woohoo.top/Grani/Grani_img-2.png" width="512px">
<img src="http://q.woohoo.top/Grani/Grani_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (90, 2, '星极', 'Astesia', 'Astesia/Astesia_img-1.png',
        'Astesia/Astesia_img-1.png,Astesia/Astesia_img-2.png,Astesia/Astesia_img-3.png', '<img src="http://q.woohoo.top/Astesia/Astesia_img-1.png" width="512px">
<img src="http://q.woohoo.top/Astesia/Astesia_img-2.png" width="512px">
<img src="http://q.woohoo.top/Astesia/Astesia_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (91, 2, '史尔特尔', 'Surtr', 'Surtr/Surtr_img-1.png', 'Surtr/Surtr_img-1.png,Surtr/Surtr_img-2.png', '<img src="http://q.woohoo.top/Surtr/Surtr_img-1.png" width="512px">
<img src="http://q.woohoo.top/Surtr/Surtr_img-2.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (92, 1, '香草', 'Vanilla', 'Vanilla/Vanilla_img-1.png', 'Vanilla/Vanilla_img-1.png', '<img src="http://q.woohoo.top/Vanilla/Vanilla_img-1.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (93, 2, '棘刺', 'Thorns', 'Thorns/Thorns_img-1.png', 'Thorns/Thorns_img-1.png,Thorns/Thorns_img-2.png', '<img src="http://q.woohoo.top/Thorns/Thorns_img-1.png" width="512px">
<img src="http://q.woohoo.top/Thorns/Thorns_img-2.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (94, 1, '芬', 'Fang', 'Fang/Fang_img-1.png', 'Fang/Fang_img-1.png,Fang/Fang_img-2.png', '<img src="http://q.woohoo.top/Fang/Fang_img-1.png" width="512px">
<img src="http://q.woohoo.top/Fang/Fang_img-2.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (95, 1, '凛冬', 'Зима', 'Зима/Зима_img-1.png', 'Зима/Зима_img-1.png,Зима/Зима_img-2.png,Зима/Зима_img-3.png', '<img src="http://q.woohoo.top/Зима/Зима_img-1.png" width="512px">
<img src="http://q.woohoo.top/Зима/Зима_img-2.png" width="512px">
<img src="http://q.woohoo.top/Зима/Зима_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (96, 6, '麦哲伦', 'Magallan', 'Magallan/Magallan_img-1.png',
        'Magallan/Magallan_img-1.png,Magallan/Magallan_img-2.png,Magallan/Magallan_img-3.png', '<img src="http://q.woohoo.top/Magallan/Magallan_img-1.png" width="512px">
<img src="http://q.woohoo.top/Magallan/Magallan_img-2.png" width="512px">
<img src="http://q.woohoo.top/Magallan/Magallan_img-3.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (97, 8, '傀影', 'Phantom', 'Phantom/Phantom_img-1.png',
        'Phantom/Phantom_img-1.png,Phantom/Phantom_img-2.png,Phantom/Phantom_img-3.png', '<img src="http://q.woohoo.top/Phantom/Phantom_img-1.png" width="512px">
<img src="http://q.woohoo.top/Phantom/Phantom_img-2.png" width="512px">
<img src="http://q.woohoo.top/Phantom/Phantom_img-3.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (98, 2, '暴行', 'Savage', 'Savage/Savage_img-1.png', 'Savage/Savage_img-1.png,Savage/Savage_img-2.png', '<img src="http://q.woohoo.top/Savage/Savage_img-1.png" width="512px">
<img src="http://q.woohoo.top/Savage/Savage_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (99, 5, '安赛尔', 'Ansel', 'Ansel/Ansel_img-1.png', 'Ansel/Ansel_img-1.png,Ansel/Ansel_img-2.png', '<img src="http://q.woohoo.top/Ansel/Ansel_img-1.png" width="512px">
<img src="http://q.woohoo.top/Ansel/Ansel_img-2.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (100, 3, 'W', 'W', 'W/W_img-1.png', 'W/W_img-1.png,W/W_img-2.png,W/W_img-3.png', '<img src="http://q.woohoo.top/W/W_img-1.png" width="512px">
<img src="http://q.woohoo.top/W/W_img-2.png" width="512px">
<img src="http://q.woohoo.top/W/W_img-3.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (101, 6, '波登可', 'Podenco', 'Podenco/Podenco_img-1.png', 'Podenco/Podenco_img-1.png,Podenco/Podenco_img-2.png', '<img src="http://q.woohoo.top/Podenco/Podenco_img-1.png" width="512px">
<img src="http://q.woohoo.top/Podenco/Podenco_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (102, 6, '铃兰', 'Suzuran', 'Suzuran/Suzuran_img-1.png',
        'Suzuran/Suzuran_img-1.png,Suzuran/Suzuran_img-2.png,Suzuran/Suzuran_img-3.png', '<img src="http://q.woohoo.top/Suzuran/Suzuran_img-1.png" width="512px">
<img src="http://q.woohoo.top/Suzuran/Suzuran_img-2.png" width="512px">
<img src="http://q.woohoo.top/Suzuran/Suzuran_img-3.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (103, 1, '推进之王', 'Siege', 'Siege/Siege_img-1.png',
        'Siege/Siege_img-1.png,Siege/Siege_img-2.png,Siege/Siege_img-3.png', '<img src="http://q.woohoo.top/Siege/Siege_img-1.png" width="512px">
<img src="http://q.woohoo.top/Siege/Siege_img-2.png" width="512px">
<img src="http://q.woohoo.top/Siege/Siege_img-3.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (104, 3, '红云', 'Vermeil', 'Vermeil/Vermeil_img-1.png', 'Vermeil/Vermeil_img-1.png,Vermeil/Vermeil_img-2.png', '<img src="http://q.woohoo.top/Vermeil/Vermeil_img-1.png" width="512px">
<img src="http://q.woohoo.top/Vermeil/Vermeil_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (105, 2, '陈', 'Chen', 'Chen/Chen_img-1.png', 'Chen/Chen_img-1.png,Chen/Chen_img-2.png,Chen/Chen_img-3.png', '<img src="http://q.woohoo.top/Chen/Chen_img-1.png" width="512px">
<img src="http://q.woohoo.top/Chen/Chen_img-2.png" width="512px">
<img src="http://q.woohoo.top/Chen/Chen_img-3.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (106, 7, '12F', '12F', '12F/12F_img-1.png', '12F/12F_img-1.png', '<img src="http://q.woohoo.top/12F/12F_img-1.png" width="512px">
', 2, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (107, 3, '普罗旺斯', 'Provence', 'Provence/Provence_img-1.png',
        'Provence/Provence_img-1.png,Provence/Provence_img-2.png,Provence/Provence_img-3.png', '<img src="http://q.woohoo.top/Provence/Provence_img-1.png" width="512px">
<img src="http://q.woohoo.top/Provence/Provence_img-2.png" width="512px">
<img src="http://q.woohoo.top/Provence/Provence_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (108, 1, '德克萨斯', 'Texas', 'Texas/Texas_img-1.png',
        'Texas/Texas_img-1.png,Texas/Texas_img-2.png,Texas/Texas_img-3.png,Texas/Texas_img-4.png', '<img src="http://q.woohoo.top/Texas/Texas_img-1.png" width="512px">
<img src="http://q.woohoo.top/Texas/Texas_img-2.png" width="512px">
<img src="http://q.woohoo.top/Texas/Texas_img-3.png" width="512px">
<img src="http://q.woohoo.top/Texas/Texas_img-4.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (109, 8, '雪雉', 'Snowsant', 'Snowsant/Snowsant_img-1.png',
        'Snowsant/Snowsant_img-1.png,Snowsant/Snowsant_img-2.png', '<img src="http://q.woohoo.top/Snowsant/Snowsant_img-1.png" width="512px">
<img src="http://q.woohoo.top/Snowsant/Snowsant_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (110, 7, '蜜蜡', 'Beeswax', 'Beeswax/Beeswax_img-1.png', 'Beeswax/Beeswax_img-1.png,Beeswax/Beeswax_img-2.png', '<img src="http://q.woohoo.top/Beeswax/Beeswax_img-1.png" width="512px">
<img src="http://q.woohoo.top/Beeswax/Beeswax_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (111, 7, '炎熔', 'Lava', 'Lava/Lava_img-1.png', 'Lava/Lava_img-1.png', '<img src="http://q.woohoo.top/Lava/Lava_img-1.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (112, 7, '远山', 'Gitano', 'Gitano/Gitano_img-1.png',
        'Gitano/Gitano_img-1.png,Gitano/Gitano_img-2.png,Gitano/Gitano_img-3.png', '<img src="http://q.woohoo.top/Gitano/Gitano_img-1.png" width="512px">
<img src="http://q.woohoo.top/Gitano/Gitano_img-2.png" width="512px">
<img src="http://q.woohoo.top/Gitano/Gitano_img-3.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (113, 2, '因陀罗', 'Indra', 'Indra/Indra_img-1.png', 'Indra/Indra_img-1.png,Indra/Indra_img-2.png', '<img src="http://q.woohoo.top/Indra/Indra_img-1.png" width="512px">
<img src="http://q.woohoo.top/Indra/Indra_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (114, 2, '缠丸', 'Matoimaru', 'Matoimaru/Matoimaru_img-1.png',
        'Matoimaru/Matoimaru_img-1.png,Matoimaru/Matoimaru_img-2.png', '<img src="http://q.woohoo.top/Matoimaru/Matoimaru_img-1.png" width="512px">
<img src="http://q.woohoo.top/Matoimaru/Matoimaru_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (115, 2, '杰克', 'Jackie', 'Jackie/Jackie_img-1.png', 'Jackie/Jackie_img-1.png,Jackie/Jackie_img-2.png', '<img src="http://q.woohoo.top/Jackie/Jackie_img-1.png" width="512px">
<img src="http://q.woohoo.top/Jackie/Jackie_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (116, 6, '安洁莉娜', 'Angelina', 'Angelina/Angelina_img-1.png',
        'Angelina/Angelina_img-1.png,Angelina/Angelina_img-2.png,Angelina/Angelina_img-3.png', '<img src="http://q.woohoo.top/Angelina/Angelina_img-1.png" width="512px">
<img src="http://q.woohoo.top/Angelina/Angelina_img-2.png" width="512px">
<img src="http://q.woohoo.top/Angelina/Angelina_img-3.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (117, 1, '夜刀', 'Yato', 'Yato/Yato_img-1.png', 'Yato/Yato_img-1.png', '<img src="http://q.woohoo.top/Yato/Yato_img-1.png" width="512px">
', 2, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (118, 8, '狮蝎', 'Manticore', 'Manticore/Manticore_img-1.png',
        'Manticore/Manticore_img-1.png,Manticore/Manticore_img-2.png,Manticore/Manticore_img-3.png', '<img src="http://q.woohoo.top/Manticore/Manticore_img-1.png" width="512px">
<img src="http://q.woohoo.top/Manticore/Manticore_img-2.png" width="512px">
<img src="http://q.woohoo.top/Manticore/Manticore_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (119, 1, '风笛', 'Bagpipe', 'Bagpipe/Bagpipe_img-1.png', 'Bagpipe/Bagpipe_img-1.png,Bagpipe/Bagpipe_img-2.png', '<img src="http://q.woohoo.top/Bagpipe/Bagpipe_img-1.png" width="512px">
<img src="http://q.woohoo.top/Bagpipe/Bagpipe_img-2.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (120, 3, '迷迭香', 'Rosmontis', 'Rosmontis/Rosmontis_img-1.png',
        'Rosmontis/Rosmontis_img-1.png,Rosmontis/Rosmontis_img-2.png', '<img src="http://q.woohoo.top/Rosmontis/Rosmontis_img-1.png" width="512px">
<img src="http://q.woohoo.top/Rosmontis/Rosmontis_img-2.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (121, 4, '可颂', 'Croissant', 'Croissant/Croissant_img-1.png',
        'Croissant/Croissant_img-1.png,Croissant/Croissant_img-2.png,Croissant/Croissant_img-3.png,Croissant/Croissant_img-4.png', '<img src="http://q.woohoo.top/Croissant/Croissant_img-1.png" width="512px">
<img src="http://q.woohoo.top/Croissant/Croissant_img-2.png" width="512px">
<img src="http://q.woohoo.top/Croissant/Croissant_img-3.png" width="512px">
<img src="http://q.woohoo.top/Croissant/Croissant_img-4.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (122, 2, '幽灵鲨', 'Specter', 'Specter/Specter_img-1.png',
        'Specter/Specter_img-1.png,Specter/Specter_img-2.png,Specter/Specter_img-3.png', '<img src="http://q.woohoo.top/Specter/Specter_img-1.png" width="512px">
<img src="http://q.woohoo.top/Specter/Specter_img-2.png" width="512px">
<img src="http://q.woohoo.top/Specter/Specter_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (123, 4, '泡泡', 'Bubble', 'Bubble/Bubble_img-1.png', 'Bubble/Bubble_img-1.png,Bubble/Bubble_img-2.png', '<img src="http://q.woohoo.top/Bubble/Bubble_img-1.png" width="512px">
<img src="http://q.woohoo.top/Bubble/Bubble_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (124, 1, '清道夫', 'Scavenger', 'Scavenger/Scavenger_img-1.png',
        'Scavenger/Scavenger_img-1.png,Scavenger/Scavenger_img-2.png', '<img src="http://q.woohoo.top/Scavenger/Scavenger_img-1.png" width="512px">
<img src="http://q.woohoo.top/Scavenger/Scavenger_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (125, 8, '红', 'ProjektRed', 'ProjektRed/ProjektRed_img-1.png',
        'ProjektRed/ProjektRed_img-1.png,ProjektRed/ProjektRed_img-2.png', '<img src="http://q.woohoo.top/ProjektRed/ProjektRed_img-1.png" width="512px">
<img src="http://q.woohoo.top/ProjektRed/ProjektRed_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (126, 1, '讯使', 'Courier', 'Courier/Courier_img-1.png',
        'Courier/Courier_img-1.png,Courier/Courier_img-2.png,Courier/Courier_img-3.png', '<img src="http://q.woohoo.top/Courier/Courier_img-1.png" width="512px">
<img src="http://q.woohoo.top/Courier/Courier_img-2.png" width="512px">
<img src="http://q.woohoo.top/Courier/Courier_img-3.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (127, 2, '月见夜', 'Midnight', 'Midnight/Midnight_img-1.png',
        'Midnight/Midnight_img-1.png,Midnight/Midnight_img-2.png', '<img src="http://q.woohoo.top/Midnight/Midnight_img-1.png" width="512px">
<img src="http://q.woohoo.top/Midnight/Midnight_img-2.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (128, 1, '贾维', 'Chiave', 'Chiave/Chiave_img-1.png', 'Chiave/Chiave_img-1.png,Chiave/Chiave_img-2.png', '<img src="http://q.woohoo.top/Chiave/Chiave_img-1.png" width="512px">
<img src="http://q.woohoo.top/Chiave/Chiave_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (129, 6, '梓兰', 'Orchid', 'Orchid/Orchid_img-1.png', 'Orchid/Orchid_img-1.png', '<img src="http://q.woohoo.top/Orchid/Orchid_img-1.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (130, 7, '史都华德', 'Steward', 'Steward/Steward_img-1.png', 'Steward/Steward_img-1.png', '<img src="http://q.woohoo.top/Steward/Steward_img-1.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (131, 8, '食铁兽', 'FEater', 'FEater/FEater_img-1.png',
        'FEater/FEater_img-1.png,FEater/FEater_img-2.png,FEater/FEater_img-3.png', '<img src="http://q.woohoo.top/FEater/FEater_img-1.png" width="512px">
<img src="http://q.woohoo.top/FEater/FEater_img-2.png" width="512px">
<img src="http://q.woohoo.top/FEater/FEater_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (132, 5, '华法琳', 'Warfarin', 'Warfarin/Warfarin_img-1.png',
        'Warfarin/Warfarin_img-1.png,Warfarin/Warfarin_img-2.png,Warfarin/Warfarin_img-3.png', '<img src="http://q.woohoo.top/Warfarin/Warfarin_img-1.png" width="512px">
<img src="http://q.woohoo.top/Warfarin/Warfarin_img-2.png" width="512px">
<img src="http://q.woohoo.top/Warfarin/Warfarin_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (133, 2, '银灰', 'SilverAsh', 'SilverAsh/SilverAsh_img-1.png',
        'SilverAsh/SilverAsh_img-1.png,SilverAsh/SilverAsh_img-2.png,SilverAsh/SilverAsh_img-3.png,SilverAsh/SilverAsh_img-4.png', '<img src="http://q.woohoo.top/SilverAsh/SilverAsh_img-1.png" width="512px">
<img src="http://q.woohoo.top/SilverAsh/SilverAsh_img-2.png" width="512px">
<img src="http://q.woohoo.top/SilverAsh/SilverAsh_img-3.png" width="512px">
<img src="http://q.woohoo.top/SilverAsh/SilverAsh_img-4.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (134, 2, '布洛卡', 'Broca', 'Broca/Broca_img-1.png', 'Broca/Broca_img-1.png,Broca/Broca_img-2.png', '<img src="http://q.woohoo.top/Broca/Broca_img-1.png" width="512px">
<img src="http://q.woohoo.top/Broca/Broca_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (135, 8, '砾', 'Gravel', 'Gravel/Gravel_img-1.png', 'Gravel/Gravel_img-1.png,Gravel/Gravel_img-2.png', '<img src="http://q.woohoo.top/Gravel/Gravel_img-1.png" width="512px">
<img src="http://q.woohoo.top/Gravel/Gravel_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (136, 5, '白面鸮', 'Ptilopsis', 'Ptilopsis/Ptilopsis_img-1.png',
        'Ptilopsis/Ptilopsis_img-1.png,Ptilopsis/Ptilopsis_img-2.png,Ptilopsis/Ptilopsis_img-3.png', '<img src="http://q.woohoo.top/Ptilopsis/Ptilopsis_img-1.png" width="512px">
<img src="http://q.woohoo.top/Ptilopsis/Ptilopsis_img-2.png" width="512px">
<img src="http://q.woohoo.top/Ptilopsis/Ptilopsis_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (137, 2, '慕斯', 'Mousse', 'Mousse/Mousse_img-1.png', 'Mousse/Mousse_img-1.png,Mousse/Mousse_img-2.png', '<img src="http://q.woohoo.top/Mousse/Mousse_img-1.png" width="512px">
<img src="http://q.woohoo.top/Mousse/Mousse_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (138, 4, '临光', 'Nearl', 'Nearl/Nearl_img-1.png',
        'Nearl/Nearl_img-1.png,Nearl/Nearl_img-2.png,Nearl/Nearl_img-3.png', '<img src="http://q.woohoo.top/Nearl/Nearl_img-1.png" width="512px">
<img src="http://q.woohoo.top/Nearl/Nearl_img-2.png" width="512px">
<img src="http://q.woohoo.top/Nearl/Nearl_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (139, 6, '深海色', 'Deepcolor', 'Deepcolor/Deepcolor_img-1.png',
        'Deepcolor/Deepcolor_img-1.png,Deepcolor/Deepcolor_img-2.png', '<img src="http://q.woohoo.top/Deepcolor/Deepcolor_img-1.png" width="512px">
<img src="http://q.woohoo.top/Deepcolor/Deepcolor_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (140, 7, '莫斯提马', 'Mostima', 'Mostima/Mostima_img-1.png',
        'Mostima/Mostima_img-1.png,Mostima/Mostima_img-2.png,Mostima/Mostima_img-3.png', '<img src="http://q.woohoo.top/Mostima/Mostima_img-1.png" width="512px">
<img src="http://q.woohoo.top/Mostima/Mostima_img-2.png" width="512px">
<img src="http://q.woohoo.top/Mostima/Mostima_img-3.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (141, 2, '芙兰卡', 'Franka', 'Franka/Franka_img-1.png', 'Franka/Franka_img-1.png,Franka/Franka_img-2.png', '<img src="http://q.woohoo.top/Franka/Franka_img-1.png" width="512px">
<img src="http://q.woohoo.top/Franka/Franka_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (142, 4, '星熊', 'Hoshiguma', 'Hoshiguma/Hoshiguma_img-1.png',
        'Hoshiguma/Hoshiguma_img-1.png,Hoshiguma/Hoshiguma_img-2.png,Hoshiguma/Hoshiguma_img-3.png', '<img src="http://q.woohoo.top/Hoshiguma/Hoshiguma_img-1.png" width="512px">
<img src="http://q.woohoo.top/Hoshiguma/Hoshiguma_img-2.png" width="512px">
<img src="http://q.woohoo.top/Hoshiguma/Hoshiguma_img-3.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (143, 5, '清流', 'Purestream', 'Purestream/Purestream_img-1.png',
        'Purestream/Purestream_img-1.png,Purestream/Purestream_img-2.png', '<img src="http://q.woohoo.top/Purestream/Purestream_img-1.png" width="512px">
<img src="http://q.woohoo.top/Purestream/Purestream_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (144, 3, '安比尔', 'Ambriel', 'Ambriel/Ambriel_img-1.png', 'Ambriel/Ambriel_img-1.png,Ambriel/Ambriel_img-2.png', '<img src="http://q.woohoo.top/Ambriel/Ambriel_img-1.png" width="512px">
<img src="http://q.woohoo.top/Ambriel/Ambriel_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (145, 5, '嘉维尔', 'Gavial', 'Gavial/Gavial_img-1.png',
        'Gavial/Gavial_img-1.png,Gavial/Gavial_img-2.png,Gavial/Gavial_img-3.png', '<img src="http://q.woohoo.top/Gavial/Gavial_img-1.png" width="512px">
<img src="http://q.woohoo.top/Gavial/Gavial_img-2.png" width="512px">
<img src="http://q.woohoo.top/Gavial/Gavial_img-3.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (146, 7, '夜魔', 'Nightmare', 'Nightmare/Nightmare_img-1.png',
        'Nightmare/Nightmare_img-1.png,Nightmare/Nightmare_img-2.png,Nightmare/Nightmare_img-3.png', '<img src="http://q.woohoo.top/Nightmare/Nightmare_img-1.png" width="512px">
<img src="http://q.woohoo.top/Nightmare/Nightmare_img-2.png" width="512px">
<img src="http://q.woohoo.top/Nightmare/Nightmare_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (147, 3, '白雪', 'ShiraYuki', 'ShiraYuki/ShiraYuki_img-1.png',
        'ShiraYuki/ShiraYuki_img-1.png,ShiraYuki/ShiraYuki_img-2.png', '<img src="http://q.woohoo.top/ShiraYuki/ShiraYuki_img-1.png" width="512px">
<img src="http://q.woohoo.top/ShiraYuki/ShiraYuki_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (148, 5, '末药', 'Myrrh', 'Myrrh/Myrrh_img-1.png',
        'Myrrh/Myrrh_img-1.png,Myrrh/Myrrh_img-2.png,Myrrh/Myrrh_img-3.png', '<img src="http://q.woohoo.top/Myrrh/Myrrh_img-1.png" width="512px">
<img src="http://q.woohoo.top/Myrrh/Myrrh_img-2.png" width="512px">
<img src="http://q.woohoo.top/Myrrh/Myrrh_img-3.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (149, 3, '黑', 'Schwarz', 'Schwarz/Schwarz_img-1.png',
        'Schwarz/Schwarz_img-1.png,Schwarz/Schwarz_img-2.png,Schwarz/Schwarz_img-3.png', '<img src="http://q.woohoo.top/Schwarz/Schwarz_img-1.png" width="512px">
<img src="http://q.woohoo.top/Schwarz/Schwarz_img-2.png" width="512px">
<img src="http://q.woohoo.top/Schwarz/Schwarz_img-3.png" width="512px">
', 6, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (150, 3, '杰西卡', 'Jessica', 'Jessica/Jessica_img-1.png',
        'Jessica/Jessica_img-1.png,Jessica/Jessica_img-2.png,Jessica/Jessica_img-3.png,Jessica/Jessica_img-4.png,Jessica/Jessica_img-5.png', '<img src="http://q.woohoo.top/Jessica/Jessica_img-1.png" width="512px">
<img src="http://q.woohoo.top/Jessica/Jessica_img-2.png" width="512px">
<img src="http://q.woohoo.top/Jessica/Jessica_img-3.png" width="512px">
<img src="http://q.woohoo.top/Jessica/Jessica_img-4.png" width="512px">
<img src="http://q.woohoo.top/Jessica/Jessica_img-5.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (151, 3, '送葬人', 'Executor', 'Executor/Executor_img-1.png',
        'Executor/Executor_img-1.png,Executor/Executor_img-2.png,Executor/Executor_img-3.png', '<img src="http://q.woohoo.top/Executor/Executor_img-1.png" width="512px">
<img src="http://q.woohoo.top/Executor/Executor_img-2.png" width="512px">
<img src="http://q.woohoo.top/Executor/Executor_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (152, 2, '艾丝黛尔', 'Estelle', 'Estelle/Estelle_img-1.png', 'Estelle/Estelle_img-1.png,Estelle/Estelle_img-2.png', '<img src="http://q.woohoo.top/Estelle/Estelle_img-1.png" width="512px">
<img src="http://q.woohoo.top/Estelle/Estelle_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (153, 6, '巫恋', 'Shamare', 'Shamare/Shamare_img-1.png', 'Shamare/Shamare_img-1.png,Shamare/Shamare_img-2.png', '<img src="http://q.woohoo.top/Shamare/Shamare_img-1.png" width="512px">
<img src="http://q.woohoo.top/Shamare/Shamare_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (154, 2, '杜宾', 'Dobermann', 'Dobermann/Dobermann_img-1.png',
        'Dobermann/Dobermann_img-1.png,Dobermann/Dobermann_img-2.png,Dobermann/Dobermann_img-3.png', '<img src="http://q.woohoo.top/Dobermann/Dobermann_img-1.png" width="512px">
<img src="http://q.woohoo.top/Dobermann/Dobermann_img-2.png" width="512px">
<img src="http://q.woohoo.top/Dobermann/Dobermann_img-3.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (155, 7, '夜烟', 'Haze', 'Haze/Haze_img-1.png', 'Haze/Haze_img-1.png,Haze/Haze_img-2.png', '<img src="http://q.woohoo.top/Haze/Haze_img-1.png" width="512px">
<img src="http://q.woohoo.top/Haze/Haze_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (156, 1, '桃金娘', 'Myrtle', 'Myrtle/Myrtle_img-1.png', 'Myrtle/Myrtle_img-1.png,Myrtle/Myrtle_img-2.png', '<img src="http://q.woohoo.top/Myrtle/Myrtle_img-1.png" width="512px">
<img src="http://q.woohoo.top/Myrtle/Myrtle_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (157, 3, '安德切尔', 'Adnachiel', 'Adnachiel/Adnachiel_img-1.png', 'Adnachiel/Adnachiel_img-1.png', '<img src="http://q.woohoo.top/Adnachiel/Adnachiel_img-1.png" width="512px">
', 3, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (158, 7, '格雷伊', 'Greyy', 'Greyy/Greyy_img-1.png', 'Greyy/Greyy_img-1.png,Greyy/Greyy_img-2.png', '<img src="http://q.woohoo.top/Greyy/Greyy_img-1.png" width="512px">
<img src="http://q.woohoo.top/Greyy/Greyy_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (159, 3, '四月', 'April', 'April/April_img-1.png',
        'April/April_img-1.png,April/April_img-2.png,April/April_img-3.png', '<img src="http://q.woohoo.top/April/April_img-1.png" width="512px">
<img src="http://q.woohoo.top/April/April_img-2.png" width="512px">
<img src="http://q.woohoo.top/April/April_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (160, 2, '诗怀雅', 'Swire', 'Swire/Swire_img-1.png',
        'Swire/Swire_img-1.png,Swire/Swire_img-2.png,Swire/Swire_img-3.png', '<img src="http://q.woohoo.top/Swire/Swire_img-1.png" width="512px">
<img src="http://q.woohoo.top/Swire/Swire_img-2.png" width="512px">
<img src="http://q.woohoo.top/Swire/Swire_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (161, 6, '梅尔', 'Mayer', 'Mayer/Mayer_img-1.png',
        'Mayer/Mayer_img-1.png,Mayer/Mayer_img-2.png,Mayer/Mayer_img-3.png', '<img src="http://q.woohoo.top/Mayer/Mayer_img-1.png" width="512px">
<img src="http://q.woohoo.top/Mayer/Mayer_img-2.png" width="512px">
<img src="http://q.woohoo.top/Mayer/Mayer_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (162, 3, '梅', 'May', 'May/May_img-1.png', 'May/May_img-1.png,May/May_img-2.png', '<img src="http://q.woohoo.top/May/May_img-1.png" width="512px">
<img src="http://q.woohoo.top/May/May_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (163, 3, '灰喉', 'GreyThroat', 'GreyThroat/GreyThroat_img-1.png',
        'GreyThroat/GreyThroat_img-1.png,GreyThroat/GreyThroat_img-2.png,GreyThroat/GreyThroat_img-3.png', '<img src="http://q.woohoo.top/GreyThroat/GreyThroat_img-1.png" width="512px">
<img src="http://q.woohoo.top/GreyThroat/GreyThroat_img-2.png" width="512px">
<img src="http://q.woohoo.top/GreyThroat/GreyThroat_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (164, 1, '极境', 'Elysium', 'Elysium/Elysium_img-1.png', 'Elysium/Elysium_img-1.png,Elysium/Elysium_img-2.png', '<img src="http://q.woohoo.top/Elysium/Elysium_img-1.png" width="512px">
<img src="http://q.woohoo.top/Elysium/Elysium_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (165, 3, '陨星', 'Meteorite', 'Meteorite/Meteorite_img-1.png',
        'Meteorite/Meteorite_img-1.png,Meteorite/Meteorite_img-2.png,Meteorite/Meteorite_img-3.png', '<img src="http://q.woohoo.top/Meteorite/Meteorite_img-1.png" width="512px">
<img src="http://q.woohoo.top/Meteorite/Meteorite_img-2.png" width="512px">
<img src="http://q.woohoo.top/Meteorite/Meteorite_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (166, 5, '调香师', 'Perfumer', 'Perfumer/Perfumer_img-1.png',
        'Perfumer/Perfumer_img-1.png,Perfumer/Perfumer_img-2.png,Perfumer/Perfumer_img-3.png', '<img src="http://q.woohoo.top/Perfumer/Perfumer_img-1.png" width="512px">
<img src="http://q.woohoo.top/Perfumer/Perfumer_img-2.png" width="512px">
<img src="http://q.woohoo.top/Perfumer/Perfumer_img-3.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (167, 3, '安哲拉', 'Andreana', 'Andreana/Andreana_img-1.png',
        'Andreana/Andreana_img-1.png,Andreana/Andreana_img-2.png', '<img src="http://q.woohoo.top/Andreana/Andreana_img-1.png" width="512px">
<img src="http://q.woohoo.top/Andreana/Andreana_img-2.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (168, 2, '拉普兰德', 'Lappland', 'Lappland/Lappland_img-1.png',
        'Lappland/Lappland_img-1.png,Lappland/Lappland_img-2.png,Lappland/Lappland_img-3.png', '<img src="http://q.woohoo.top/Lappland/Lappland_img-1.png" width="512px">
<img src="http://q.woohoo.top/Lappland/Lappland_img-2.png" width="512px">
<img src="http://q.woohoo.top/Lappland/Lappland_img-3.png" width="512px">
', 5, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
INSERT INTO mall_product (id, category_id, name, subtitle, main_image, sub_images, detail, price, stock,
                          status, create_by, create_time, update_by, update_time, remark)
VALUES (169, 3, '流星', 'Meteor', 'Meteor/Meteor_img-1.png', 'Meteor/Meteor_img-1.png,Meteor/Meteor_img-2.png', '<img src="http://q.woohoo.top/Meteor/Meteor_img-1.png" width="512px">
<img src="http://q.woohoo.top/Meteor/Meteor_img-2.png" width="512px">
', 4, 1024, 1, 'system', '2021-03-21 00:00:00', 'system', '2021-03-21 00:00:00', 'system_manual_insert');
COMMIT;