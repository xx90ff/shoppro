/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 127.0.0.1:3306
 Source Schema         : shoppro

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 03/06/2021 13:54:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fa_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin`;
CREATE TABLE `fa_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `logintime` int(10) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
INSERT INTO `fa_admin` VALUES (1, 'admin', 'Admin', '560bd3e02ad000ba429ad286cb4c45e7', 'b92613', '/assets/img/avatar.png', 'admin@admin.com', 0, 1622526892, '127.0.0.1', 1491635035, 1622526892, '2d867bed-1050-4eec-9d8c-c8881ea193dd', 'normal');

-- ----------------------------
-- Table structure for fa_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin_log`;
CREATE TABLE `fa_admin_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '日志标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_admin_log
-- ----------------------------
INSERT INTO `fa_admin_log` VALUES (1, 1, 'admin', '/wvmzRVQoTl.php/index/login?url=%2FwvmzRVQoTl.php', '登录', '{\"url\":\"\\/wvmzRVQoTl.php\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"aazu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 1617411295);
INSERT INTO `fa_admin_log` VALUES (2, 1, 'admin', '/wvmzRVQoTl.php/addon/local', '插件管理', '{\"uid\":\"4349\",\"token\":\"***\",\"version\":\"1.2.0.20210401_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 1617411439);
INSERT INTO `fa_admin_log` VALUES (3, 1, 'admin', '/wvmzRVQoTl.php/addon/install', '插件管理', '{\"name\":\"shopro\",\"force\":\"0\",\"uid\":\"1057\",\"token\":\"***\",\"version\":\"1.2.0\",\"faversion\":\"1.2.0.20210401_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 1617411592);
INSERT INTO `fa_admin_log` VALUES (4, 1, 'admin', '/wvmzRVQoTl.php/addon/install', '插件管理', '{\"name\":\"nkeditor\",\"force\":\"0\",\"uid\":\"1057\",\"token\":\"***\",\"version\":\"1.0.12\",\"faversion\":\"1.2.0.20210401_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 1617411663);
INSERT INTO `fa_admin_log` VALUES (5, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 1617411681);
INSERT INTO `fa_admin_log` VALUES (6, 1, 'admin', '/wvmzRVQoTl.php/shopro/dispatch/dispatch/typeList', 'Shopro商城 / 配送设置 / 发货模板', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 1617411681);
INSERT INTO `fa_admin_log` VALUES (7, 1, 'admin', '/wvmzRVQoTl.php/shopro/dispatch/dispatch/typeList', 'Shopro商城 / 配送设置 / 发货模板', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 1617411827);
INSERT INTO `fa_admin_log` VALUES (8, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 1617411827);
INSERT INTO `fa_admin_log` VALUES (9, 1, 'admin', '/wvmzRVQoTl.php/addon/install', '插件管理', '{\"name\":\"qiniu\",\"force\":\"0\",\"uid\":\"1057\",\"token\":\"***\",\"version\":\"1.1.3\",\"faversion\":\"1.2.0.20210401_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 1617412105);
INSERT INTO `fa_admin_log` VALUES (11, 1, 'admin', '/wvmzRVQoTl.php/addon/install', '插件管理', '{\"name\":\"kefu\",\"force\":\"0\",\"uid\":\"1057\",\"token\":\"***\",\"version\":\"1.0.7\",\"faversion\":\"1.2.0.20210401_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 1617412219);
INSERT INTO `fa_admin_log` VALUES (12, 1, 'admin', '/wvmzRVQoTl.php/addon/install', '插件管理', '{\"name\":\"csmradmin\",\"force\":\"0\",\"uid\":\"1057\",\"token\":\"***\",\"version\":\"1.0.1\",\"faversion\":\"1.2.0.20210401_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 1617412247);
INSERT INTO `fa_admin_log` VALUES (14, 1, 'admin', '/wvmzRVQoTl.php/addon/install', '插件管理', '{\"name\":\"alisms\",\"force\":\"0\",\"uid\":\"1057\",\"token\":\"***\",\"version\":\"1.0.9\",\"faversion\":\"1.2.0.20210401_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 1617412280);
INSERT INTO `fa_admin_log` VALUES (15, 1, 'admin', '/wvmzRVQoTl.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"alisms\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510722);
INSERT INTO `fa_admin_log` VALUES (16, 1, 'admin', '/wvmzRVQoTl.php/addon/get_table_list', '插件管理', '{\"name\":\"alisms\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510724);
INSERT INTO `fa_admin_log` VALUES (17, 1, 'admin', '/wvmzRVQoTl.php/addon/uninstall', '插件管理', '{\"name\":\"alisms\",\"force\":\"0\",\"droptables\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510726);
INSERT INTO `fa_admin_log` VALUES (18, 1, 'admin', '/wvmzRVQoTl.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"csmradmin\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510728);
INSERT INTO `fa_admin_log` VALUES (19, 1, 'admin', '/wvmzRVQoTl.php/addon/get_table_list', '插件管理', '{\"name\":\"csmradmin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510730);
INSERT INTO `fa_admin_log` VALUES (20, 1, 'admin', '/wvmzRVQoTl.php/addon/uninstall', '插件管理', '{\"name\":\"csmradmin\",\"force\":\"0\",\"droptables\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510732);
INSERT INTO `fa_admin_log` VALUES (21, 1, 'admin', '/wvmzRVQoTl.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"finance\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510740);
INSERT INTO `fa_admin_log` VALUES (22, 1, 'admin', '/wvmzRVQoTl.php/addon/get_table_list', '插件管理', '{\"name\":\"finance\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510743);
INSERT INTO `fa_admin_log` VALUES (23, 1, 'admin', '/wvmzRVQoTl.php/addon/uninstall', '插件管理', '{\"name\":\"finance\",\"force\":\"0\",\"droptables\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510745);
INSERT INTO `fa_admin_log` VALUES (24, 1, 'admin', '/wvmzRVQoTl.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"kefu\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510748);
INSERT INTO `fa_admin_log` VALUES (25, 1, 'admin', '/wvmzRVQoTl.php/addon/get_table_list', '插件管理', '{\"name\":\"kefu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510750);
INSERT INTO `fa_admin_log` VALUES (26, 1, 'admin', '/wvmzRVQoTl.php/addon/uninstall', '插件管理', '{\"name\":\"kefu\",\"force\":\"0\",\"droptables\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510752);
INSERT INTO `fa_admin_log` VALUES (27, 1, 'admin', '/wvmzRVQoTl.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"qiniu\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510756);
INSERT INTO `fa_admin_log` VALUES (28, 1, 'admin', '/wvmzRVQoTl.php/addon/get_table_list', '插件管理', '{\"name\":\"qiniu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510758);
INSERT INTO `fa_admin_log` VALUES (29, 1, 'admin', '/wvmzRVQoTl.php/addon/uninstall', '插件管理', '{\"name\":\"qiniu\",\"force\":\"0\",\"droptables\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510759);
INSERT INTO `fa_admin_log` VALUES (30, 1, 'admin', '/wvmzRVQoTl.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"user\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510761);
INSERT INTO `fa_admin_log` VALUES (31, 1, 'admin', '/wvmzRVQoTl.php/addon/get_table_list', '插件管理', '{\"name\":\"user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510764);
INSERT INTO `fa_admin_log` VALUES (32, 1, 'admin', '/wvmzRVQoTl.php/addon/uninstall', '插件管理', '{\"name\":\"user\",\"force\":\"0\",\"droptables\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510765);
INSERT INTO `fa_admin_log` VALUES (33, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"3\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510778);
INSERT INTO `fa_admin_log` VALUES (34, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510846);
INSERT INTO `fa_admin_log` VALUES (35, 1, 'admin', '/wvmzRVQoTl.php/shopro/dispatch/dispatch/typeList', 'Shopro商城 / 配送设置 / 发货模板', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510846);
INSERT INTO `fa_admin_log` VALUES (36, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"4\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510861);
INSERT INTO `fa_admin_log` VALUES (37, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510870);
INSERT INTO `fa_admin_log` VALUES (38, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/edit/ids/376?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"shopro\\/dashboard\",\"title\":\"控制台\",\"url\":\"\",\"icon\":\"fa fa-dashboard\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"用于展示当前系统中的统计数据、统计报表及重要实时数据\",\"status\":\"normal\"},\"ids\":\"376\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510890);
INSERT INTO `fa_admin_log` VALUES (39, 1, 'admin', '/wvmzRVQoTl.php/ajax/weigh', '', '{\"ids\":\"376,1,2,3,5,4,66,85\",\"changeid\":\"376\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510898);
INSERT INTO `fa_admin_log` VALUES (40, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"93\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510931);
INSERT INTO `fa_admin_log` VALUES (41, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"112\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510935);
INSERT INTO `fa_admin_log` VALUES (42, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"255\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510984);
INSERT INTO `fa_admin_log` VALUES (43, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"287\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622510999);
INSERT INTO `fa_admin_log` VALUES (44, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"491\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622511006);
INSERT INTO `fa_admin_log` VALUES (45, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"458\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622511009);
INSERT INTO `fa_admin_log` VALUES (46, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"418\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622511016);
INSERT INTO `fa_admin_log` VALUES (47, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"407\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622511035);
INSERT INTO `fa_admin_log` VALUES (48, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"382\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622511039);
INSERT INTO `fa_admin_log` VALUES (49, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"366\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622511050);
INSERT INTO `fa_admin_log` VALUES (50, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"66\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622511163);
INSERT INTO `fa_admin_log` VALUES (51, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"312\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622511216);
INSERT INTO `fa_admin_log` VALUES (52, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"211\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622511248);
INSERT INTO `fa_admin_log` VALUES (53, 1, 'admin', '/wvmzRVQoTl.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622511309);
INSERT INTO `fa_admin_log` VALUES (54, 1, 'admin', '/wvmzRVQoTl.php/shopro/user/user/update', 'Shopro商城 / 用户管理 / 更新', '{\"data\":\"{&quot;id&quot;:1,&quot;group_id&quot;:1,&quot;username&quot;:&quot;admin&quot;,&quot;nickname&quot;:&quot;admin&quot;,&quot;email&quot;:&quot;admin@163.com&quot;,&quot;mobile&quot;:&quot;13888888888&quot;,&quot;avatar&quot;:&quot;\\/uploads\\/20210601\\/d7a03cee101e1067eb791538b28f63d2.jpg&quot;,&quot;level&quot;:0,&quot;gender&quot;:0,&quot;birthday&quot;:&quot;2017-04-08&quot;,&quot;bio&quot;:&quot;&quot;,&quot;money&quot;:&quot;0.00&quot;,&quot;score&quot;:0,&quot;successions&quot;:1,&quot;maxsuccessions&quot;:1,&quot;prevtime&quot;:1491635035,&quot;logintime&quot;:1491635035,&quot;loginip&quot;:&quot;127.0.0.1&quot;,&quot;loginfailure&quot;:0,&quot;joinip&quot;:&quot;127.0.0.1&quot;,&quot;jointime&quot;:1491635035,&quot;createtime&quot;:0,&quot;updatetime&quot;:1491635035,&quot;token&quot;:&quot;&quot;,&quot;status&quot;:&quot;normal&quot;,&quot;verification&quot;:&quot;&quot;,&quot;parent_user_id&quot;:null,&quot;child_user_count&quot;:0,&quot;child_user_count_1&quot;:0,&quot;child_user_count_2&quot;:0,&quot;total_consume&quot;:&quot;0.00&quot;,&quot;third_platform&quot;:[]}\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622511312);
INSERT INTO `fa_admin_log` VALUES (55, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"4\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622511533);
INSERT INTO `fa_admin_log` VALUES (56, 1, 'admin', '/wvmzRVQoTl.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"nkeditor\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622511543);
INSERT INTO `fa_admin_log` VALUES (57, 1, 'admin', '/wvmzRVQoTl.php/addon/get_table_list', '插件管理', '{\"name\":\"nkeditor\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622511545);
INSERT INTO `fa_admin_log` VALUES (58, 1, 'admin', '/wvmzRVQoTl.php/addon/uninstall', '插件管理', '{\"name\":\"nkeditor\",\"force\":\"0\",\"droptables\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622511547);
INSERT INTO `fa_admin_log` VALUES (59, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"4\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622511591);
INSERT INTO `fa_admin_log` VALUES (60, 1, 'admin', '/wvmzRVQoTl.php/shopro/user/user/update', 'Shopro商城 / 用户管理 / 更新', '{\"data\":\"{&quot;id&quot;:1,&quot;group_id&quot;:1,&quot;username&quot;:&quot;shopro&quot;,&quot;nickname&quot;:&quot;Shopro-1&quot;,&quot;email&quot;:&quot;shopro@www.shoppro.com&quot;,&quot;mobile&quot;:&quot;13888888888&quot;,&quot;avatar&quot;:&quot;http:\\/\\/api.7wpp.com\\/assets\\/addons\\/shopro\\/img\\/default-avatar.png&quot;,&quot;level&quot;:1,&quot;gender&quot;:0,&quot;birthday&quot;:null,&quot;bio&quot;:&quot;&quot;,&quot;money&quot;:&quot;0.00&quot;,&quot;score&quot;:0,&quot;successions&quot;:1,&quot;maxsuccessions&quot;:1,&quot;prevtime&quot;:1622514576,&quot;logintime&quot;:1622514576,&quot;loginip&quot;:&quot;127.0.0.1&quot;,&quot;loginfailure&quot;:0,&quot;joinip&quot;:&quot;127.0.0.1&quot;,&quot;jointime&quot;:1622514576,&quot;createtime&quot;:1622514576,&quot;updatetime&quot;:1622514576,&quot;token&quot;:&quot;&quot;,&quot;status&quot;:&quot;normal&quot;,&quot;verification&quot;:&quot;&quot;,&quot;parent_user_id&quot;:null,&quot;child_user_count&quot;:0,&quot;child_user_count_1&quot;:0,&quot;child_user_count_2&quot;:0,&quot;total_consume&quot;:&quot;0.00&quot;,&quot;third_platform&quot;:[],&quot;password&quot;:&quot;a147258&quot;}\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622515941);
INSERT INTO `fa_admin_log` VALUES (61, 1, 'admin', '/wvmzRVQoTl.php/shopro/category/add', 'Shopro商城 / 商品分类 / 添加', '{\"data\":\"{&quot;type&quot;:1,&quot;name&quot;:&quot;电子设备&quot;,&quot;weigh&quot;:0,&quot;status&quot;:&quot;normal&quot;}\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622525266);
INSERT INTO `fa_admin_log` VALUES (62, 1, 'admin', '/wvmzRVQoTl.php/shopro/category/update?ids=1', 'Shopro商城 / 商品分类 / 保存更新', '{\"ids\":\"1\",\"data\":\"[{&quot;id&quot;:&quot;&quot;,&quot;name&quot;:&quot;笔记本&quot;,&quot;status&quot;:&quot;normal&quot;,&quot;image&quot;:&quot;&quot;,&quot;weigh&quot;:0,&quot;children&quot;:[]},{&quot;id&quot;:&quot;&quot;,&quot;name&quot;:&quot;平板电脑&quot;,&quot;status&quot;:&quot;normal&quot;,&quot;image&quot;:&quot;&quot;,&quot;weigh&quot;:0,&quot;children&quot;:[]}]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622525318);
INSERT INTO `fa_admin_log` VALUES (63, 1, 'admin', '/wvmzRVQoTl.php/shopro/category/edit?ids=1', 'Shopro商城 / 商品分类 / 编辑', '{\"ids\":\"1\",\"data\":\"{&quot;type&quot;:&quot;1&quot;,&quot;name&quot;:&quot;商品分类&quot;,&quot;weigh&quot;:0,&quot;status&quot;:&quot;normal&quot;}\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622525487);
INSERT INTO `fa_admin_log` VALUES (64, 1, 'admin', '/wvmzRVQoTl.php/shopro/category/update?ids=1', 'Shopro商城 / 商品分类 / 保存更新', '{\"ids\":\"1\",\"data\":\"[{&quot;id&quot;:2,&quot;name&quot;:&quot;电子设备&quot;,&quot;type&quot;:&quot;&quot;,&quot;image&quot;:&quot;&quot;,&quot;pid&quot;:1,&quot;weigh&quot;:0,&quot;description&quot;:&quot;&quot;,&quot;status&quot;:&quot;normal&quot;,&quot;createtime&quot;:1622525318,&quot;updatetime&quot;:1622525318},{&quot;id&quot;:3,&quot;name&quot;:&quot;平板电脑&quot;,&quot;type&quot;:&quot;&quot;,&quot;image&quot;:&quot;&quot;,&quot;pid&quot;:1,&quot;weigh&quot;:0,&quot;description&quot;:&quot;&quot;,&quot;status&quot;:&quot;normal&quot;,&quot;createtime&quot;:1622525318,&quot;updatetime&quot;:1622525318,&quot;deleted&quot;:1}]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622525575);
INSERT INTO `fa_admin_log` VALUES (65, 1, 'admin', '/wvmzRVQoTl.php/shopro/category/update?ids=1', 'Shopro商城 / 商品分类 / 保存更新', '{\"ids\":\"1\",\"data\":\"[{&quot;id&quot;:2,&quot;name&quot;:&quot;电子设备&quot;,&quot;type&quot;:&quot;&quot;,&quot;image&quot;:&quot;\\/uploads\\/20210601\\/d7a03cee101e1067eb791538b28f63d2.jpg&quot;,&quot;pid&quot;:1,&quot;weigh&quot;:&quot;1&quot;,&quot;description&quot;:&quot;&quot;,&quot;status&quot;:&quot;normal&quot;,&quot;createtime&quot;:1622525318,&quot;updatetime&quot;:1622525575}]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622525651);
INSERT INTO `fa_admin_log` VALUES (66, 1, 'admin', '/wvmzRVQoTl.php/shopro/category/update?ids=1', 'Shopro商城 / 商品分类 / 保存更新', '{\"ids\":\"1\",\"data\":\"[{&quot;id&quot;:2,&quot;name&quot;:&quot;电子设备&quot;,&quot;type&quot;:&quot;&quot;,&quot;image&quot;:&quot;\\/uploads\\/20210601\\/d7a03cee101e1067eb791538b28f63d2.jpg&quot;,&quot;pid&quot;:1,&quot;weigh&quot;:1,&quot;description&quot;:&quot;&quot;,&quot;status&quot;:&quot;normal&quot;,&quot;createtime&quot;:1622525318,&quot;updatetime&quot;:1622525651,&quot;deleted&quot;:1}]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622525692);
INSERT INTO `fa_admin_log` VALUES (67, 1, 'admin', '/wvmzRVQoTl.php/shopro/category/edit?ids=1', 'Shopro商城 / 商品分类 / 编辑', '{\"ids\":\"1\",\"data\":\"{&quot;type&quot;:2,&quot;name&quot;:&quot;商品分类&quot;,&quot;weigh&quot;:0,&quot;status&quot;:&quot;normal&quot;}\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622525701);
INSERT INTO `fa_admin_log` VALUES (68, 1, 'admin', '/wvmzRVQoTl.php/shopro/category/edit?ids=1', 'Shopro商城 / 商品分类 / 编辑', '{\"ids\":\"1\",\"data\":\"{&quot;type&quot;:3,&quot;name&quot;:&quot;商品分类&quot;,&quot;weigh&quot;:0,&quot;status&quot;:&quot;normal&quot;}\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622525709);
INSERT INTO `fa_admin_log` VALUES (69, 1, 'admin', '/wvmzRVQoTl.php/shopro/category/update?ids=1', 'Shopro商城 / 商品分类 / 保存更新', '{\"ids\":\"1\",\"data\":\"[{&quot;id&quot;:&quot;&quot;,&quot;name&quot;:&quot;电子设备&quot;,&quot;status&quot;:&quot;normal&quot;,&quot;image&quot;:&quot;&quot;,&quot;weigh&quot;:0,&quot;children&quot;:[{&quot;id&quot;:&quot;&quot;,&quot;name&quot;:&quot;笔记本&quot;,&quot;status&quot;:&quot;normal&quot;,&quot;image&quot;:&quot;&quot;,&quot;weigh&quot;:0,&quot;children&quot;:[]},{&quot;id&quot;:&quot;&quot;,&quot;name&quot;:&quot;平板电脑&quot;,&quot;status&quot;:&quot;normal&quot;,&quot;image&quot;:&quot;&quot;,&quot;weigh&quot;:0,&quot;children&quot;:[]}]}]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622525737);
INSERT INTO `fa_admin_log` VALUES (70, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526105);
INSERT INTO `fa_admin_log` VALUES (71, 1, 'admin', '/wvmzRVQoTl.php/shopro/dispatch/dispatch/typeList', 'Shopro商城 / 配送设置 / 发货模板', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526105);
INSERT INTO `fa_admin_log` VALUES (72, 1, 'admin', '/wvmzRVQoTl.php/shopro/category/update?ids=1', 'Shopro商城 / 商品分类 / 保存更新', '{\"ids\":\"1\",\"data\":\"[{&quot;id&quot;:4,&quot;name&quot;:&quot;服饰装包&quot;,&quot;type&quot;:&quot;&quot;,&quot;image&quot;:&quot;&quot;,&quot;pid&quot;:1,&quot;weigh&quot;:0,&quot;description&quot;:&quot;&quot;,&quot;status&quot;:&quot;normal&quot;,&quot;createtime&quot;:1622525737,&quot;updatetime&quot;:1622525737,&quot;children&quot;:[{&quot;id&quot;:5,&quot;name&quot;:&quot;男士外套&quot;,&quot;type&quot;:&quot;&quot;,&quot;image&quot;:&quot;&quot;,&quot;pid&quot;:4,&quot;weigh&quot;:0,&quot;description&quot;:&quot;&quot;,&quot;status&quot;:&quot;normal&quot;,&quot;createtime&quot;:1622525737,&quot;updatetime&quot;:1622525737},{&quot;id&quot;:6,&quot;name&quot;:&quot;女士裙装&quot;,&quot;type&quot;:&quot;&quot;,&quot;image&quot;:&quot;&quot;,&quot;pid&quot;:4,&quot;weigh&quot;:0,&quot;description&quot;:&quot;&quot;,&quot;status&quot;:&quot;normal&quot;,&quot;createtime&quot;:1622525737,&quot;updatetime&quot;:1622525737}]}]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526305);
INSERT INTO `fa_admin_log` VALUES (73, 1, 'admin', '/wvmzRVQoTl.php/shopro/dispatch/dispatch/typeList', 'Shopro商城 / 配送设置 / 发货模板', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526339);
INSERT INTO `fa_admin_log` VALUES (74, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526339);
INSERT INTO `fa_admin_log` VALUES (75, 1, 'admin', '/wvmzRVQoTl.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526401);
INSERT INTO `fa_admin_log` VALUES (76, 1, 'admin', '/wvmzRVQoTl.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526457);
INSERT INTO `fa_admin_log` VALUES (77, 1, 'admin', '/wvmzRVQoTl.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526457);
INSERT INTO `fa_admin_log` VALUES (78, 1, 'admin', '/wvmzRVQoTl.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526457);
INSERT INTO `fa_admin_log` VALUES (79, 1, 'admin', '/wvmzRVQoTl.php/shopro/dispatch/express/add', 'Shopro商城 / 配送设置 / 物流快递 / 添加', '{\"data\":\"{&quot;name&quot;:&quot;全国&quot;,&quot;type&quot;:&quot;number&quot;,&quot;express&quot;:[{&quot;first_num&quot;:0,&quot;first_price&quot;:0,&quot;additional_num&quot;:0,&quot;additional_price&quot;:0,&quot;province_ids&quot;:&quot;110000,120000,130000,140000,150000,210000,220000,230000,310000,320000,330000,340000,350000,360000,370000,410000,420000,430000,440000,450000,460000,500000,510000,520000,530000,540000,610000,620000,630000,640000,650000,710000,810000,820000&quot;,&quot;city_ids&quot;:&quot;&quot;,&quot;area_ids&quot;:&quot;&quot;,&quot;weigh&quot;:1}]}\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526507);
INSERT INTO `fa_admin_log` VALUES (80, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526552);
INSERT INTO `fa_admin_log` VALUES (81, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/goods/add', 'Shopro商城 / 商品管理 / 添加', '{\"row\":{\"category_ids\":\"5\",\"content\":\"\",\"dispatch_ids\":\"1\",\"dispatch_type\":\"express\",\"expire_day\":\"0\",\"image\":\"\\/uploads\\/20210601\\/e3e96da45a068da5c3ecea808b573a9b.jpg\",\"images\":\"\\/uploads\\/20210601\\/4f66c8067382ef0bb3a9b18da85f866b.jpg,\\/uploads\\/20210601\\/5f45bc1f3fca51e3582e1d23109aa7aa.jpg,\\/uploads\\/20210601\\/412a2c1b65cd9d570c265829355b5f69.jpg\",\"is_sku\":\"0\",\"original_price\":\"220\",\"params\":\"[]\",\"price\":\"169\",\"service_ids\":\"4,3,2,1\",\"show_sales\":\"\",\"status\":\"up\",\"subtitle\":\"正品保证 放心购\",\"title\":\"安踏外套男装官网正品2020春夏季新款连帽健身休闲夹克卫衣运动服\",\"type\":\"normal\",\"views\":\"\",\"weigh\":\"\",\"weight\":\"\",\"stock\":\"1000\",\"sn\":\"\",\"autosend_content\":\"\"},\"sku\":{\"listData\":\"[]\",\"priceData\":\"[]\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526561);
INSERT INTO `fa_admin_log` VALUES (82, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526567);
INSERT INTO `fa_admin_log` VALUES (83, 1, 'admin', '/wvmzRVQoTl.php/shopro/dispatch/dispatch/typeList', 'Shopro商城 / 配送设置 / 发货模板', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526567);
INSERT INTO `fa_admin_log` VALUES (84, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/goods/detail/ids/1', 'Shopro商城 / 商品管理 / 查看详情', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526567);
INSERT INTO `fa_admin_log` VALUES (85, 1, 'admin', '/wvmzRVQoTl.php/shopro/dispatch/dispatch/typeList', 'Shopro商城 / 配送设置 / 发货模板', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526617);
INSERT INTO `fa_admin_log` VALUES (86, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526617);
INSERT INTO `fa_admin_log` VALUES (87, 1, 'admin', '/wvmzRVQoTl.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526744);
INSERT INTO `fa_admin_log` VALUES (88, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526795);
INSERT INTO `fa_admin_log` VALUES (89, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/goods/add', 'Shopro商城 / 商品管理 / 添加', '{\"row\":{\"category_ids\":\"6\",\"content\":\"\",\"dispatch_ids\":\"1\",\"dispatch_type\":\"express\",\"expire_day\":\"0\",\"image\":\"\\/uploads\\/20210601\\/3327f635ab3384d526fc8c3159c839e9.jpg\",\"images\":\"\\/uploads\\/20210601\\/3327f635ab3384d526fc8c3159c839e9.jpg\",\"is_sku\":\"0\",\"original_price\":\"200\",\"params\":\"[]\",\"price\":\"165\",\"service_ids\":\"4,3,2,1\",\"show_sales\":\"\",\"status\":\"up\",\"subtitle\":\"正品保证 放心购\",\"title\":\"白色雪纺连衣裙20新款女夏季流行女士收腰气质超仙女甜美长裙子 白色 M\",\"type\":\"normal\",\"views\":\"\",\"weigh\":\"\",\"weight\":\"\",\"stock\":\"1000\",\"sn\":\"\",\"autosend_content\":\"\"},\"sku\":{\"listData\":\"[]\",\"priceData\":\"[]\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526800);
INSERT INTO `fa_admin_log` VALUES (90, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"4\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526809);
INSERT INTO `fa_admin_log` VALUES (91, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526868);
INSERT INTO `fa_admin_log` VALUES (92, 1, 'admin', '/wvmzRVQoTl.php/shopro/dispatch/dispatch/typeList', 'Shopro商城 / 配送设置 / 发货模板', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526868);
INSERT INTO `fa_admin_log` VALUES (93, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/goods/detail/ids/2', 'Shopro商城 / 商品管理 / 查看详情', '{\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526868);
INSERT INTO `fa_admin_log` VALUES (94, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526877);
INSERT INTO `fa_admin_log` VALUES (95, 1, 'admin', '/wvmzRVQoTl.php/shopro/dispatch/dispatch/typeList', 'Shopro商城 / 配送设置 / 发货模板', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526877);
INSERT INTO `fa_admin_log` VALUES (96, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/goods/detail/ids/2', 'Shopro商城 / 商品管理 / 查看详情', '{\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526877);
INSERT INTO `fa_admin_log` VALUES (97, 1, 'admin', '/wvmzRVQoTl.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"42yq\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526892);
INSERT INTO `fa_admin_log` VALUES (98, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526900);
INSERT INTO `fa_admin_log` VALUES (99, 1, 'admin', '/wvmzRVQoTl.php/shopro/dispatch/dispatch/typeList', 'Shopro商城 / 配送设置 / 发货模板', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526900);
INSERT INTO `fa_admin_log` VALUES (100, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/goods/detail/ids/2', 'Shopro商城 / 商品管理 / 查看详情', '{\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526900);
INSERT INTO `fa_admin_log` VALUES (101, 1, 'admin', '/wvmzRVQoTl.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"nkeditor\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526919);
INSERT INTO `fa_admin_log` VALUES (102, 1, 'admin', '/wvmzRVQoTl.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"nkeditor\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526920);
INSERT INTO `fa_admin_log` VALUES (103, 1, 'admin', '/wvmzRVQoTl.php/shopro/dispatch/dispatch/typeList', 'Shopro商城 / 配送设置 / 发货模板', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526926);
INSERT INTO `fa_admin_log` VALUES (104, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526926);
INSERT INTO `fa_admin_log` VALUES (105, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/goods/detail/ids/2', 'Shopro商城 / 商品管理 / 查看详情', '{\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526926);
INSERT INTO `fa_admin_log` VALUES (106, 1, 'admin', '/wvmzRVQoTl.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"nkeditor\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526940);
INSERT INTO `fa_admin_log` VALUES (107, 1, 'admin', '/wvmzRVQoTl.php/addon/get_table_list', '插件管理', '{\"name\":\"nkeditor\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526943);
INSERT INTO `fa_admin_log` VALUES (108, 1, 'admin', '/wvmzRVQoTl.php/addon/uninstall', '插件管理', '{\"name\":\"nkeditor\",\"force\":\"0\",\"droptables\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526945);
INSERT INTO `fa_admin_log` VALUES (109, 1, 'admin', '/wvmzRVQoTl.php/addon/install', '插件管理', '{\"name\":\"nkeditor\",\"force\":\"0\",\"uid\":\"4349\",\"token\":\"***\",\"version\":\"1.0.12\",\"faversion\":\"1.2.0.20210401_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526978);
INSERT INTO `fa_admin_log` VALUES (110, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526988);
INSERT INTO `fa_admin_log` VALUES (111, 1, 'admin', '/wvmzRVQoTl.php/shopro/dispatch/dispatch/typeList', 'Shopro商城 / 配送设置 / 发货模板', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526988);
INSERT INTO `fa_admin_log` VALUES (112, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/goods/detail/ids/2', 'Shopro商城 / 商品管理 / 查看详情', '{\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622526988);
INSERT INTO `fa_admin_log` VALUES (113, 1, 'admin', '/wvmzRVQoTl.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"4\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622527009);
INSERT INTO `fa_admin_log` VALUES (114, 1, 'admin', '/wvmzRVQoTl.php/shopro/dispatch/dispatch/typeList', 'Shopro商城 / 配送设置 / 发货模板', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622527032);
INSERT INTO `fa_admin_log` VALUES (115, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622527032);
INSERT INTO `fa_admin_log` VALUES (116, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/goods/detail/ids/2', 'Shopro商城 / 商品管理 / 查看详情', '{\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622527032);
INSERT INTO `fa_admin_log` VALUES (117, 1, 'admin', '/wvmzRVQoTl.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622527128);
INSERT INTO `fa_admin_log` VALUES (118, 1, 'admin', '/wvmzRVQoTl.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622527142);
INSERT INTO `fa_admin_log` VALUES (119, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/goods/edit/ids/2', 'Shopro商城 / 商品管理 / 编辑', '{\"row\":{\"category_ids\":\"6\",\"content\":\"\",\"dispatch_ids\":\"1\",\"dispatch_type\":\"express\",\"expire_day\":\"0\",\"image\":\"\\/uploads\\/20210601\\/3327f635ab3384d526fc8c3159c839e9.jpg\",\"images\":\"\\/uploads\\/20210601\\/3327f635ab3384d526fc8c3159c839e9.jpg\",\"is_sku\":\"0\",\"original_price\":\"200.00\",\"params\":\"[]\",\"price\":\"165\",\"service_ids\":\"4,3,2,1\",\"show_sales\":\"\",\"status\":\"up\",\"subtitle\":\"正品保证 放心购\",\"title\":\"白色雪纺连衣裙20新款女夏季流行女士收腰气质超仙女甜美长裙子 白色 M\",\"type\":\"normal\",\"views\":\"\",\"weigh\":\"\",\"weight\":\"\",\"stock\":\"1000\",\"sn\":\"\",\"autosend_content\":\"\"},\"sku\":{\"listData\":\"[]\",\"priceData\":\"[]\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622527161);
INSERT INTO `fa_admin_log` VALUES (120, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622527233);
INSERT INTO `fa_admin_log` VALUES (121, 1, 'admin', '/wvmzRVQoTl.php/shopro/dispatch/dispatch/typeList', 'Shopro商城 / 配送设置 / 发货模板', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622527233);
INSERT INTO `fa_admin_log` VALUES (122, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/goods/detail/ids/1', 'Shopro商城 / 商品管理 / 查看详情', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622527233);
INSERT INTO `fa_admin_log` VALUES (123, 1, 'admin', '/wvmzRVQoTl.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622527247);
INSERT INTO `fa_admin_log` VALUES (124, 1, 'admin', '/wvmzRVQoTl.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622527252);
INSERT INTO `fa_admin_log` VALUES (125, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/goods/edit/ids/1', 'Shopro商城 / 商品管理 / 编辑', '{\"row\":{\"category_ids\":\"5\",\"content\":\"\",\"dispatch_ids\":\"1\",\"dispatch_type\":\"express\",\"expire_day\":\"0\",\"image\":\"\\/uploads\\/20210601\\/e3e96da45a068da5c3ecea808b573a9b.jpg\",\"images\":\"\\/uploads\\/20210601\\/4f66c8067382ef0bb3a9b18da85f866b.jpg,\\/uploads\\/20210601\\/5f45bc1f3fca51e3582e1d23109aa7aa.jpg,\\/uploads\\/20210601\\/412a2c1b65cd9d570c265829355b5f69.jpg\",\"is_sku\":\"0\",\"original_price\":\"220.00\",\"params\":\"[]\",\"price\":\"169\",\"service_ids\":\"4,3,2,1\",\"show_sales\":\"\",\"status\":\"up\",\"subtitle\":\"正品保证 放心购\",\"title\":\"安踏外套男装官网正品2020春夏季新款连帽健身休闲夹克卫衣运动服\",\"type\":\"normal\",\"views\":\"\",\"weigh\":\"\",\"weight\":\"\",\"stock\":\"1000\",\"sn\":\"\",\"autosend_content\":\"\"},\"sku\":{\"listData\":\"[]\",\"priceData\":\"[]\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622527264);
INSERT INTO `fa_admin_log` VALUES (126, 1, 'admin', '/wvmzRVQoTl.php/shopro/dispatch/dispatch/typeList', 'Shopro商城 / 配送设置 / 发货模板', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622527532);
INSERT INTO `fa_admin_log` VALUES (127, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/service/all', 'Shopro商城 / 服务标签', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622527532);
INSERT INTO `fa_admin_log` VALUES (128, 1, 'admin', '/wvmzRVQoTl.php/shopro/goods/goods/detail/ids/1', 'Shopro商城 / 商品管理 / 查看详情', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 1622527532);

-- ----------------------------
-- Table structure for fa_area
-- ----------------------------
DROP TABLE IF EXISTS `fa_area`;
CREATE TABLE `fa_area`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) NULL DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简称',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `mergename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) NULL DEFAULT NULL COMMENT '层级 0 1 2 省市区县',
  `pinyin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '长途区号',
  `zip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '地区表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fa_attachment`;
CREATE TABLE `fa_attachment`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片帧数',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '文件名称',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `mimetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) NULL DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_attachment
-- ----------------------------
INSERT INTO `fa_attachment` VALUES (1, 1, 0, '/assets/img/qrcode.png', '150', '150', 'png', 0, 'qrcode.png', 21859, 'image/png', '', 1491635035, 1491635035, 1491635035, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `fa_attachment` VALUES (2, 1, 0, '/uploads/20210601/d7a03cee101e1067eb791538b28f63d2.jpg', '110', '110', 'jpg', 0, 'tb.1.2e6dd63d.kfm-1cjhe2aKYqT2N5jx4g.jpg', 4915, 'image/jpeg', '', 1622511308, 1622511308, 1622511308, 'local', '1037e65ad74907c6ea5b72f2e7771ac9cc065ed6');
INSERT INTO `fa_attachment` VALUES (3, 1, 0, '/uploads/20210601/e3e96da45a068da5c3ecea808b573a9b.jpg', '430', '430', 'jpg', 0, 'e3e96da45a068da5c3ecea808b573a9b.jpg_430x430q90.jpg', 34974, 'image/jpeg', '', 1622526401, 1622526401, 1622526401, 'local', '5c830c19bbb287731c9d314e840a48a1850ea3ca');
INSERT INTO `fa_attachment` VALUES (4, 1, 0, '/uploads/20210601/4f66c8067382ef0bb3a9b18da85f866b.jpg', '430', '430', 'jpg', 0, '4f66c8067382ef0bb3a9b18da85f866b.jpg_430x430q90.jpg', 34817, 'image/jpeg', '', 1622526457, 1622526457, 1622526457, 'local', '38f3ffd003fbce107e82f7654d21e421bb9043ce');
INSERT INTO `fa_attachment` VALUES (5, 1, 0, '/uploads/20210601/5f45bc1f3fca51e3582e1d23109aa7aa.jpg', '430', '430', 'jpg', 0, '5f45bc1f3fca51e3582e1d23109aa7aa.jpg_430x430q90.jpg', 41265, 'image/jpeg', '', 1622526457, 1622526457, 1622526457, 'local', '327abd34572a4862e2bed3b4724123b6a31e27ea');
INSERT INTO `fa_attachment` VALUES (6, 1, 0, '/uploads/20210601/412a2c1b65cd9d570c265829355b5f69.jpg', '430', '430', 'jpg', 0, '412a2c1b65cd9d570c265829355b5f69.jpg', 38034, 'image/jpeg', '', 1622526457, 1622526457, 1622526457, 'local', 'a75a890bdc209dc00e37a1afe7b2b6c5ad201e01');
INSERT INTO `fa_attachment` VALUES (7, 1, 0, '/uploads/20210601/3327f635ab3384d526fc8c3159c839e9.jpg', '750', '750', 'jpg', 0, '3327f635ab3384d526fc8c3159c839e9.jpg', 95723, 'image/jpeg', '', 1622526744, 1622526744, 1622526744, 'local', 'bbe4565845edbd30df694719f245bb23ab12b59f');
INSERT INTO `fa_attachment` VALUES (8, 1, 0, '/uploads/20210601/99e106b28915a19e57f1b8b6691288dc.jpg', '640', '896', 'jpg', 0, '99e106b28915a19e57f1b8b6691288dc.jpg', 83416, 'image/jpeg', '', 1622527128, 1622527128, 1622527128, 'local', '45c9b8e30c4ecb73060f73832049e0fea1261739');
INSERT INTO `fa_attachment` VALUES (9, 1, 0, '/uploads/20210601/8b367f40e31646844ddf3e6279b59713.jpg', '640', '705', 'jpg', 0, '8b367f40e31646844ddf3e6279b59713.jpg', 72750, 'image/jpeg', '', 1622527142, 1622527142, 1622527142, 'local', '56c0640210175c3d83f548bd52313598b0f4dd75');
INSERT INTO `fa_attachment` VALUES (10, 1, 0, '/uploads/20210601/06d2dcf97fdf2287791678221d3bedd9.jpg', '790', '980', 'jpg', 0, '06d2dcf97fdf2287791678221d3bedd9.jpg', 354536, 'image/jpeg', '', 1622527246, 1622527246, 1622527246, 'local', '2d5f310dd2a8cc5711cc4ed235462da6c31da184');
INSERT INTO `fa_attachment` VALUES (11, 1, 0, '/uploads/20210601/9a6b2c41e475055c53eeaee71b538319.jpg', '790', '1100', 'jpg', 0, '9a6b2c41e475055c53eeaee71b538319.jpg', 569117, 'image/jpeg', '', 1622527252, 1622527252, 1622527252, 'local', 'ec699641cf09b4e717561910c9b6f1be62600951');

-- ----------------------------
-- Table structure for fa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group`;
CREATE TABLE `fa_auth_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
INSERT INTO `fa_auth_group` VALUES (1, 0, 'Admin group', '*', 1491635035, 1491635035, 'normal');
INSERT INTO `fa_auth_group` VALUES (2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1491635035, 1491635035, 'normal');
INSERT INTO `fa_auth_group` VALUES (3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1491635035, 1491635035, 'normal');
INSERT INTO `fa_auth_group` VALUES (4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1491635035, 1491635035, 'normal');
INSERT INTO `fa_auth_group` VALUES (5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1491635035, 1491635035, 'normal');

-- ----------------------------
-- Table structure for fa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group_access`;
CREATE TABLE `fa_auth_group_access`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID',
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '权限分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_group_access
-- ----------------------------
INSERT INTO `fa_auth_group_access` VALUES (1, 1);

-- ----------------------------
-- Table structure for fa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_rule`;
CREATE TABLE `fa_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图标',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '规则URL',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `menutype` enum('addtabs','blank','dialog','ajax') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单类型',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '扩展属性',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 511 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
INSERT INTO `fa_auth_rule` VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', '', 'Dashboard tips', 0, NULL, '', 1491635035, 1622510870, 137, 'normal');
INSERT INTO `fa_auth_rule` VALUES (2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', '', 1, NULL, '', 1491635035, 1491635035, 119, 'normal');
INSERT INTO `fa_auth_rule` VALUES (3, 'file', 0, 'category', 'Category', 'fa fa-leaf', '', '', 'Category tips', 0, NULL, '', 1491635035, 1622510778, 99, 'normal');
INSERT INTO `fa_auth_rule` VALUES (4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', '', 'Addon tips', 0, NULL, '', 1491635035, 1622527009, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', '', 1, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', '', 'Config tips', 1, NULL, '', 1491635035, 1491635035, 60, 'normal');
INSERT INTO `fa_auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', '', 'Attachment tips', 1, NULL, '', 1491635035, 1491635035, 53, 'normal');
INSERT INTO `fa_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', '', 1, NULL, '', 1491635035, 1491635035, 34, 'normal');
INSERT INTO `fa_auth_rule` VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', '', 'Admin tips', 1, NULL, '', 1491635035, 1491635035, 118, 'normal');
INSERT INTO `fa_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', '', 'Admin log tips', 1, NULL, '', 1491635035, 1491635035, 113, 'normal');
INSERT INTO `fa_auth_rule` VALUES (11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', '', 'Group tips', 1, NULL, '', 1491635035, 1491635035, 109, 'normal');
INSERT INTO `fa_auth_rule` VALUES (12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', '', 'Rule tips', 1, NULL, '', 1491635035, 1491635035, 104, 'normal');
INSERT INTO `fa_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 136, 'normal');
INSERT INTO `fa_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 135, 'normal');
INSERT INTO `fa_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 133, 'normal');
INSERT INTO `fa_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 134, 'normal');
INSERT INTO `fa_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 132, 'normal');
INSERT INTO `fa_auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 52, 'normal');
INSERT INTO `fa_auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 51, 'normal');
INSERT INTO `fa_auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 50, 'normal');
INSERT INTO `fa_auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 49, 'normal');
INSERT INTO `fa_auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 48, 'normal');
INSERT INTO `fa_auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', '', 'Attachment tips', 0, NULL, '', 1491635035, 1491635035, 59, 'normal');
INSERT INTO `fa_auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 58, 'normal');
INSERT INTO `fa_auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 57, 'normal');
INSERT INTO `fa_auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 56, 'normal');
INSERT INTO `fa_auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 55, 'normal');
INSERT INTO `fa_auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 54, 'normal');
INSERT INTO `fa_auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 33, 'normal');
INSERT INTO `fa_auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 32, 'normal');
INSERT INTO `fa_auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 31, 'normal');
INSERT INTO `fa_auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 30, 'normal');
INSERT INTO `fa_auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 29, 'normal');
INSERT INTO `fa_auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 28, 'normal');
INSERT INTO `fa_auth_rule` VALUES (35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', '', 'Category tips', 0, NULL, '', 1491635035, 1491635035, 142, 'normal');
INSERT INTO `fa_auth_rule` VALUES (36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 141, 'normal');
INSERT INTO `fa_auth_rule` VALUES (37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 140, 'normal');
INSERT INTO `fa_auth_rule` VALUES (38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 139, 'normal');
INSERT INTO `fa_auth_rule` VALUES (39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 138, 'normal');
INSERT INTO `fa_auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', '', 'Admin tips', 0, NULL, '', 1491635035, 1491635035, 117, 'normal');
INSERT INTO `fa_auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 116, 'normal');
INSERT INTO `fa_auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 115, 'normal');
INSERT INTO `fa_auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 114, 'normal');
INSERT INTO `fa_auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', '', 'Admin log tips', 0, NULL, '', 1491635035, 1491635035, 112, 'normal');
INSERT INTO `fa_auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 111, 'normal');
INSERT INTO `fa_auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 110, 'normal');
INSERT INTO `fa_auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', '', 'Group tips', 0, NULL, '', 1491635035, 1491635035, 108, 'normal');
INSERT INTO `fa_auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 107, 'normal');
INSERT INTO `fa_auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 106, 'normal');
INSERT INTO `fa_auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 105, 'normal');
INSERT INTO `fa_auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', '', 'Rule tips', 0, NULL, '', 1491635035, 1491635035, 103, 'normal');
INSERT INTO `fa_auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 102, 'normal');
INSERT INTO `fa_auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 101, 'normal');
INSERT INTO `fa_auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 100, 'normal');
INSERT INTO `fa_auth_rule` VALUES (55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', '', 'Addon tips', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (59, 'file', 4, 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (66, 'file', 0, 'user', 'User', 'fa fa-list', '', '', '', 0, NULL, '', 1491635035, 1622511163, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', '', 1, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', '', 1, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', '', 1, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (85, 'file', 0, 'shopro', 'Shopro商城', 'fa fa-home', '', '', '', 1, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (86, 'file', 85, 'shopro/config', '商城配置', 'fa fa-sliders', '', '', '', 1, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (87, 'file', 86, 'shopro/config/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (88, 'file', 86, 'shopro/config/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (89, 'file', 86, 'shopro/config/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (90, 'file', 86, 'shopro/config/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (91, 'file', 86, 'shopro/config/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (92, 'file', 86, 'shopro/config/platform', '平台配置', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (93, 'file', 85, 'shopro/decorate', '店铺装修', 'fa fa-paint-brush', '', '', '', 0, NULL, '', 1617411588, 1622510931, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (94, 'file', 93, 'shopro/decorate/lists', '模版管理', 'fa fa-cubes', '', '', '', 1, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (95, 'file', 93, 'shopro/decorate/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (96, 'file', 93, 'shopro/decorate/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (97, 'file', 93, 'shopro/decorate/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (98, 'file', 93, 'shopro/decorate/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (99, 'file', 93, 'shopro/decorate/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (100, 'file', 93, 'shopro/decorate/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (101, 'file', 93, 'shopro/decorate/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (102, 'file', 93, 'shopro/decorate/dodecorate', '装修', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (103, 'file', 93, 'shopro/decorate/preview', '预览页面', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (104, 'file', 93, 'shopro/decorate/designer', '设计师模板', 'fa fa-cube', '', '', '', 1, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (105, 'file', 104, 'shopro/decorate/use_designer_template', '使用', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (106, 'file', 93, 'shopro/decorate/custom', '自定义页面', 'fa fa-clone', '', '', '', 1, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (107, 'file', 93, 'shopro/decorate/publish', '发布', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (108, 'file', 93, 'shopro/decorate/dodecorate_save', '装修保存', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (109, 'file', 93, 'shopro/decorate/copy', '复制模板', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (110, 'file', 93, 'shopro/decorate/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (111, 'file', 93, 'shopro/decorate/down', '模板下架', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (112, 'file', 85, 'shopro/coupons', '优惠券', 'fa fa-money', '', '', '', 0, NULL, '', 1617411588, 1622510935, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (113, 'file', 112, 'shopro/coupons/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (114, 'file', 112, 'shopro/coupons/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (115, 'file', 112, 'shopro/coupons/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (116, 'file', 112, 'shopro/coupons/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (117, 'file', 112, 'shopro/coupons/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (118, 'file', 112, 'shopro/coupons/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (119, 'file', 112, 'shopro/coupons/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (120, 'file', 112, 'shopro/coupons/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (121, 'file', 112, 'shopro/coupons/select', '选择优惠券', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (122, 'file', 85, 'shopro/dispatch', '配送设置', 'fa fa-gears', '', '', '', 1, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (123, 'file', 122, 'shopro/dispatch/dispatch', '发货模板', 'fa fa-ambulance', '', '', '', 1, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (124, 'file', 123, 'shopro/dispatch/dispatch/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (125, 'file', 123, 'shopro/dispatch/dispatch/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (126, 'file', 123, 'shopro/dispatch/dispatch/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (127, 'file', 123, 'shopro/dispatch/dispatch/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (128, 'file', 123, 'shopro/dispatch/dispatch/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (129, 'file', 123, 'shopro/dispatch/dispatch/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (130, 'file', 123, 'shopro/dispatch/dispatch/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (131, 'file', 123, 'shopro/dispatch/dispatch/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (132, 'file', 123, 'shopro/dispatch/dispatch/select', '选择模板', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (133, 'file', 122, 'shopro/dispatch/selfetch', '到店/自提', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (134, 'file', 133, 'shopro/dispatch/selfetch/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (135, 'file', 133, 'shopro/dispatch/selfetch/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (136, 'file', 133, 'shopro/dispatch/selfetch/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (137, 'file', 133, 'shopro/dispatch/selfetch/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (138, 'file', 133, 'shopro/dispatch/selfetch/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (139, 'file', 133, 'shopro/dispatch/selfetch/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (140, 'file', 133, 'shopro/dispatch/selfetch/destroy', '销毁', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (141, 'file', 122, 'shopro/dispatch/express', '物流快递', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (142, 'file', 141, 'shopro/dispatch/express/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (143, 'file', 141, 'shopro/dispatch/express/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (144, 'file', 141, 'shopro/dispatch/express/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (145, 'file', 141, 'shopro/dispatch/express/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (146, 'file', 141, 'shopro/dispatch/express/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (147, 'file', 141, 'shopro/dispatch/express/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (148, 'file', 141, 'shopro/dispatch/express/destroy', '销毁', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (149, 'file', 122, 'shopro/dispatch/store', '商家配送', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (150, 'file', 149, 'shopro/dispatch/store/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (151, 'file', 149, 'shopro/dispatch/store/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (152, 'file', 149, 'shopro/dispatch/store/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (153, 'file', 149, 'shopro/dispatch/store/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (154, 'file', 149, 'shopro/dispatch/store/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (155, 'file', 149, 'shopro/dispatch/store/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (156, 'file', 149, 'shopro/dispatch/store/destroy', '销毁', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (157, 'file', 122, 'shopro/dispatch/autosend', '自动发货', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (158, 'file', 157, 'shopro/dispatch/autosend/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (159, 'file', 157, 'shopro/dispatch/autosend/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (160, 'file', 157, 'shopro/dispatch/autosend/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (161, 'file', 157, 'shopro/dispatch/autosend/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (162, 'file', 157, 'shopro/dispatch/autosend/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (163, 'file', 157, 'shopro/dispatch/autosend/destroy', '销毁', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (164, 'file', 157, 'shopro/dispatch/autosend/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (165, 'file', 122, 'shopro/express', '快递公司', 'fa fa-automobile', '', '', '', 1, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (166, 'file', 165, 'shopro/express/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (167, 'file', 165, 'shopro/express/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (168, 'file', 165, 'shopro/express/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (169, 'file', 165, 'shopro/express/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (170, 'file', 165, 'shopro/express/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (171, 'file', 165, 'shopro/express/select', '选择', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (172, 'file', 85, 'shopro/product', '商品管理', 'fa fa-archive', '', '', '', 1, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (173, 'file', 172, 'shopro/category', '商品分类', 'fa fa-sitemap', '', '', '', 1, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (174, 'file', 173, 'shopro/category/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (175, 'file', 173, 'shopro/category/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (176, 'file', 173, 'shopro/category/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (177, 'file', 173, 'shopro/category/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (178, 'file', 173, 'shopro/category/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (179, 'file', 173, 'shopro/category/select', '选择商品组', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (180, 'file', 173, 'shopro/category/update', '保存更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (181, 'file', 172, 'shopro/goods/goods', '商品管理', 'fa fa-shopping-bag', '', '', '', 1, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (182, 'file', 181, 'shopro/goods/goods/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (183, 'file', 181, 'shopro/goods/goods/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (184, 'file', 181, 'shopro/goods/goods/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (185, 'file', 181, 'shopro/goods/goods/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (186, 'file', 181, 'shopro/goods/goods/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (187, 'file', 181, 'shopro/goods/goods/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (188, 'file', 181, 'shopro/goods/goods/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (189, 'file', 181, 'shopro/goods/goods/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (190, 'file', 181, 'shopro/goods/goods/select', '选择商品', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (191, 'file', 181, 'shopro/goods/goods/detail', '查看详情', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (192, 'file', 181, 'shopro/goods/goods/setstatus', '商品状态', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (193, 'file', 172, 'shopro/goods/service', '服务标签', 'fa fa-tags', '', '', '', 1, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (194, 'file', 193, 'shopro/goods/service/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (195, 'file', 193, 'shopro/goods/service/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (196, 'file', 193, 'shopro/goods/service/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (197, 'file', 193, 'shopro/goods/service/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (198, 'file', 193, 'shopro/goods/service/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (199, 'file', 193, 'shopro/goods/service/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (200, 'file', 193, 'shopro/goods/service/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (201, 'file', 193, 'shopro/goods/service/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (202, 'file', 172, 'shopro/goods/comment', '商品评价', 'fa fa-pencil-square', '', '', '', 1, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (203, 'file', 202, 'shopro/goods/comment/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (204, 'file', 202, 'shopro/goods/comment/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (205, 'file', 202, 'shopro/goods/comment/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (206, 'file', 202, 'shopro/goods/comment/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (207, 'file', 202, 'shopro/goods/comment/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (208, 'file', 202, 'shopro/goods/comment/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (209, 'file', 202, 'shopro/goods/comment/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (210, 'file', 202, 'shopro/goods/comment/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411588, 1617411588, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (211, 'file', 85, 'shopro/material', '资料管理', 'fa fa-file-text', '', '', '', 0, NULL, '', 1617411589, 1622511248, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (212, 'file', 211, 'shopro/richtext', '富文本', 'fa fa-language', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (213, 'file', 212, 'shopro/richtext/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (214, 'file', 212, 'shopro/richtext/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (215, 'file', 212, 'shopro/richtext/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (216, 'file', 212, 'shopro/richtext/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (217, 'file', 212, 'shopro/richtext/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (218, 'file', 212, 'shopro/richtext/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (219, 'file', 212, 'shopro/richtext/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (220, 'file', 212, 'shopro/richtext/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (221, 'file', 212, 'shopro/richtext/select', '选择富文本', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (222, 'file', 211, 'shopro/link', '页面链接', 'fa fa-unlink', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (223, 'file', 222, 'shopro/link/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (224, 'file', 222, 'shopro/link/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (225, 'file', 222, 'shopro/link/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (226, 'file', 222, 'shopro/link/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (227, 'file', 222, 'shopro/link/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (228, 'file', 222, 'shopro/link/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (229, 'file', 222, 'shopro/link/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (230, 'file', 222, 'shopro/link/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (231, 'file', 222, 'shopro/link/select', '选择链接', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (232, 'file', 211, 'shopro/area', '省市区数据', 'fa fa-percent', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (233, 'file', 232, 'shopro/area/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (234, 'file', 232, 'shopro/area/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (235, 'file', 232, 'shopro/area/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (236, 'file', 232, 'shopro/area/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (237, 'file', 232, 'shopro/area/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (238, 'file', 232, 'shopro/area/select', '选择省市区', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (239, 'file', 211, 'shopro/faq', '常见问题', 'fa fa-info-circle', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (240, 'file', 239, 'shopro/faq/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (241, 'file', 239, 'shopro/faq/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (242, 'file', 239, 'shopro/faq/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (243, 'file', 239, 'shopro/faq/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (244, 'file', 239, 'shopro/faq/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (245, 'file', 239, 'shopro/faq/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (246, 'file', 239, 'shopro/faq/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (247, 'file', 239, 'shopro/faq/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (248, 'file', 211, 'shopro/user_fake', '虚拟用户', 'fa fa-user-o', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (249, 'file', 248, 'shopro/user_fake/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (250, 'file', 248, 'shopro/user_fake/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (251, 'file', 248, 'shopro/user_fake/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (252, 'file', 248, 'shopro/user_fake/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (253, 'file', 248, 'shopro/user_fake/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (254, 'file', 248, 'shopro/user_fake/random_user', '添加虚拟用户', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (255, 'file', 85, 'shopro/activity', '活动中心', 'fa fa-font-awesome', '', '', '', 0, NULL, '', 1617411589, 1622510984, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (256, 'file', 255, 'shopro/activity/activity', '营销活动', 'fa fa-star', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (257, 'file', 256, 'shopro/activity/activity/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (258, 'file', 256, 'shopro/activity/activity/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (259, 'file', 256, 'shopro/activity/activity/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (260, 'file', 256, 'shopro/activity/activity/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (261, 'file', 256, 'shopro/activity/activity/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (262, 'file', 256, 'shopro/activity/activity/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (263, 'file', 256, 'shopro/activity/activity/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (264, 'file', 256, 'shopro/activity/activity/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (265, 'file', 256, 'shopro/activity/activity/createorupdatesku', '编辑活动规格', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (266, 'file', 256, 'shopro/activity/activity/select', '选择活动', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (267, 'file', 256, 'shopro/activity/activity/sku', '活动规格', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (268, 'file', 256, 'shopro/activity/activity/detail', '活动详情', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (269, 'file', 256, 'shopro/activity/activity/all', '活动记录', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (270, 'file', 255, 'shopro/activity/activity_sku_price', '商品规格', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (271, 'file', 270, 'shopro/activity/activity_sku_price/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (272, 'file', 270, 'shopro/activity/activity_sku_price/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (273, 'file', 270, 'shopro/activity/activity_sku_price/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (274, 'file', 270, 'shopro/activity/activity_sku_price/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (275, 'file', 270, 'shopro/activity/activity_sku_price/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (276, 'file', 270, 'shopro/activity/activity_sku_price/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (277, 'file', 270, 'shopro/activity/activity_sku_price/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (278, 'file', 270, 'shopro/activity/activity_sku_price/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (279, 'file', 255, 'shopro/activity/groupon', '拼团列表', 'fa fa-modx', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (280, 'file', 279, 'shopro/activity/groupon/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (281, 'file', 279, 'shopro/activity/groupon/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (282, 'file', 279, 'shopro/activity/groupon/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (283, 'file', 279, 'shopro/activity/groupon/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (284, 'file', 279, 'shopro/activity/groupon/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (285, 'file', 279, 'shopro/activity/groupon/detail', '详情', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (286, 'file', 279, 'shopro/activity/groupon/addfictitious', '确定拼团虚拟人', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (287, 'file', 85, 'shopro/app', '应用', 'fa fa-suitcase', '', '', '', 0, NULL, '', 1617411589, 1622510999, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (288, 'file', 287, 'shopro/app/score_shop', '积分商城', 'fa fa-database', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (289, 'file', 288, 'shopro/app/score_shop/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (290, 'file', 288, 'shopro/app/score_shop/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (291, 'file', 288, 'shopro/app/score_shop/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (292, 'file', 288, 'shopro/app/score_shop/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (293, 'file', 288, 'shopro/app/score_shop/select', '选择积分产品', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (294, 'file', 288, 'shopro/app/score_shop/createorupdatesku', '更编辑积分规格', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (295, 'file', 288, 'shopro/app/score_shop/sku', '积分规格', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (296, 'file', 288, 'shopro/app/score_shop/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (297, 'file', 288, 'shopro/app/score_shop/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (298, 'file', 288, 'shopro/app/score_shop/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (299, 'file', 288, 'shopro/app/score_shop/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (300, 'file', 287, 'shopro/app/live', '小程序直播', 'fa fa-video-camera', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (301, 'file', 300, 'shopro/app/live/select', '直播间选择', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (302, 'file', 300, 'shopro/app/live/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (303, 'file', 300, 'shopro/app/live/detail', '直播详情', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (304, 'file', 300, 'shopro/app/live/synclive', '同步直播间', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (305, 'file', 300, 'shopro/app/live/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (306, 'file', 300, 'shopro/app/live/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (307, 'file', 300, 'shopro/app/live/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (308, 'file', 300, 'shopro/app/live/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (309, 'file', 300, 'shopro/app/live/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (310, 'file', 300, 'shopro/app/live/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (311, 'file', 300, 'shopro/app/live/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (312, 'file', 85, 'shopro/user_wallet_apply', '用户提现', 'fa fa-jpy', '', '', '', 0, NULL, '', 1617411589, 1622511216, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (313, 'file', 312, 'shopro/user_wallet_apply/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (314, 'file', 312, 'shopro/user_wallet_apply/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (315, 'file', 312, 'shopro/user_wallet_apply/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (316, 'file', 312, 'shopro/user_wallet_apply/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (317, 'file', 312, 'shopro/user_wallet_apply/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (318, 'file', 312, 'shopro/user_wallet_apply/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (319, 'file', 312, 'shopro/user_wallet_apply/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (320, 'file', 312, 'shopro/user_wallet_apply/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (321, 'file', 312, 'shopro/user_wallet_apply/applyoper', '提现操作', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (322, 'file', 85, 'shopro/order', '订单中心', 'fa fa-file', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (323, 'file', 322, 'shopro/order/order', '订单管理', 'fa fa-file-text', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (324, 'file', 323, 'shopro/order/order/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (325, 'file', 323, 'shopro/order/order/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (326, 'file', 323, 'shopro/order/order/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (327, 'file', 323, 'shopro/order/order/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (328, 'file', 323, 'shopro/order/order/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (329, 'file', 323, 'shopro/order/order/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (330, 'file', 323, 'shopro/order/order/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (331, 'file', 323, 'shopro/order/order/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (332, 'file', 323, 'shopro/order/order/detail', '详情', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (333, 'file', 323, 'shopro/order/order/send', '发货', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (334, 'file', 323, 'shopro/order/order/aftersalefinish', '售后', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (335, 'file', 323, 'shopro/order/order/refund', '退款', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (336, 'file', 323, 'shopro/order/order/editmemo', '备注', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (337, 'file', 323, 'shopro/order/order/gettype', '订单筛选', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (338, 'file', 323, 'shopro/order/order/refundrefuse', '拒绝退款', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (339, 'file', 323, 'shopro/order/order/export', '订单导出', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (340, 'file', 323, 'shopro/order/order/actions', '操作记录', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (341, 'file', 323, 'shopro/order/order/editconsignee', '修改收货信息', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (342, 'file', 323, 'shopro/order/order/sendstore', '备货', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (343, 'file', 322, 'shopro/order/order_item', '订单商品明细', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (344, 'file', 343, 'shopro/order/order_item/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (345, 'file', 343, 'shopro/order/order_item/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (346, 'file', 343, 'shopro/order/order_item/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (347, 'file', 343, 'shopro/order/order_item/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (348, 'file', 343, 'shopro/order/order_item/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (349, 'file', 343, 'shopro/order/order_item/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (350, 'file', 343, 'shopro/order/order_item/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (351, 'file', 343, 'shopro/order/order_item/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (352, 'file', 322, 'shopro/order/aftersale', '售后/退款', 'fa fa-handshake-o', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (353, 'file', 352, 'shopro/order/aftersale/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (354, 'file', 352, 'shopro/order/aftersale/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (355, 'file', 352, 'shopro/order/aftersale/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (356, 'file', 352, 'shopro/order/aftersale/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (357, 'file', 352, 'shopro/order/aftersale/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (358, 'file', 352, 'shopro/order/aftersale/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (359, 'file', 352, 'shopro/order/aftersale/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (360, 'file', 352, 'shopro/order/aftersale/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (361, 'file', 352, 'shopro/order/aftersale/detail', '详情', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (362, 'file', 352, 'shopro/order/aftersale/addlog', '售后反馈', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (363, 'file', 352, 'shopro/order/aftersale/refuse', '拒绝申请', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (364, 'file', 352, 'shopro/order/aftersale/refund', '同意退款', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (365, 'file', 352, 'shopro/order/aftersale/finish', '售后完成', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (366, 'file', 85, 'shopro/feedback', '意见反馈', 'fa fa-question-circle-o', '', '', '', 0, NULL, '', 1617411589, 1622511050, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (367, 'file', 366, 'shopro/feedback/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (368, 'file', 366, 'shopro/feedback/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (369, 'file', 366, 'shopro/feedback/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (370, 'file', 366, 'shopro/feedback/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (371, 'file', 366, 'shopro/feedback/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (372, 'file', 366, 'shopro/feedback/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (373, 'file', 366, 'shopro/feedback/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (374, 'file', 366, 'shopro/feedback/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (375, 'file', 366, 'shopro/feedback/detail', '详情', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (376, 'file', 0, 'shopro/dashboard', '控制台', 'fa fa-dashboard', '', '', '用于展示当前系统中的统计数据、统计报表及重要实时数据', 1, 'addtabs', '', 1617411589, 1622510890, 143, 'normal');
INSERT INTO `fa_auth_rule` VALUES (377, 'file', 376, 'shopro/dashboard/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (378, 'file', 376, 'shopro/dashboard/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (379, 'file', 376, 'shopro/dashboard/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (380, 'file', 376, 'shopro/dashboard/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (381, 'file', 376, 'shopro/dashboard/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (382, 'file', 85, 'shopro/wechat', '微信管理', 'fa fa-wechat', '', '', '', 0, NULL, '', 1617411589, 1622511039, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (383, 'file', 382, 'shopro/wechat/fans/index', '粉丝管理', 'fa fa-users', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (384, 'file', 383, 'shopro/wechat/fans/user', '查看用户', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (385, 'file', 383, 'shopro/wechat/fans/syncfans', '同步粉丝', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (386, 'file', 382, 'shopro/wechat/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (387, 'file', 382, 'shopro/wechat/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (388, 'file', 382, 'shopro/wechat/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (389, 'file', 382, 'shopro/wechat/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (390, 'file', 382, 'shopro/wechat/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (391, 'file', 382, 'shopro/wechat/menu/index', '菜单管理', 'fa fa-server', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (392, 'file', 391, 'shopro/wechat/menu/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (393, 'file', 391, 'shopro/wechat/menu/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (394, 'file', 391, 'shopro/wechat/menu/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (395, 'file', 391, 'shopro/wechat/menu/publish', '发布', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (396, 'file', 391, 'shopro/wechat/menu/copy', '复制', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (397, 'file', 382, 'shopro/wechat/auto_reply/index', '自动回复', 'fa fa-send', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (398, 'file', 397, 'shopro/wechat/auto_reply/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (399, 'file', 397, 'shopro/wechat/auto_reply/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (400, 'file', 397, 'shopro/wechat/auto_reply/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (401, 'file', 382, 'shopro/wechat/material/index', '素材管理', 'fa fa-folder-open', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (402, 'file', 401, 'shopro/wechat/material/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (403, 'file', 401, 'shopro/wechat/material/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (404, 'file', 401, 'shopro/wechat/material/detail', '音频播放', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (405, 'file', 401, 'shopro/wechat/material/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (406, 'file', 401, 'shopro/wechat/material/select', '选择', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (407, 'file', 85, 'shopro/notification', '消息通知', 'fa fa-bullhorn', '', '', '', 0, NULL, '', 1617411589, 1622511035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (408, 'file', 407, 'shopro/notification/index', '查看列表', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (409, 'file', 407, 'shopro/notification/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (410, 'file', 407, 'shopro/notification/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (411, 'file', 407, 'shopro/notification/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (412, 'file', 407, 'shopro/notification/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (413, 'file', 407, 'shopro/notification/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (414, 'file', 407, 'shopro/notification/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (415, 'file', 407, 'shopro/notification/config', '消息配置', 'fa fa-cogs', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (416, 'file', 407, 'shopro/notification/set_template', '配置模板', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (417, 'file', 407, 'shopro/notification/set_status', '切换状态', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (418, 'file', 85, 'shopro/store', '门店管理', 'fa fa-bank', '', '', '', 0, NULL, '', 1617411589, 1622511016, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (419, 'file', 418, 'shopro/store/store', '门店列表', 'fa fa-building', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (420, 'file', 419, 'shopro/store/store/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (421, 'file', 419, 'shopro/store/store/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (422, 'file', 419, 'shopro/store/store/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (423, 'file', 419, 'shopro/store/store/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (424, 'file', 419, 'shopro/store/store/setstatus', '是否禁用', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (425, 'file', 419, 'shopro/store/store/select', '选择', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (426, 'file', 419, 'shopro/store/store/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (427, 'file', 419, 'shopro/store/store/all', '全部门店', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (428, 'file', 419, 'shopro/store/store/restore', '单个还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (429, 'file', 419, 'shopro/store/store/destroy', '单个销毁', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (430, 'file', 418, 'shopro/store/apply', '门店审核', 'fa fa-circle-o', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (431, 'file', 430, 'shopro/store/apply/applyoper', '操作', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (432, 'file', 430, 'shopro/store/apply/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (433, 'file', 430, 'shopro/store/apply/detail', '详情', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (434, 'file', 418, 'shopro/store/dashboard', '门店统计', 'fa fa-circle-o', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (435, 'file', 434, 'shopro/store/dashboard/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (436, 'file', 85, 'shopro/user/user', '用户管理', 'fa fa-user', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (437, 'file', 436, 'shopro/user/user/index', '用户列表', 'fa fa-list-ul', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (438, 'file', 436, 'shopro/user/user/select', '选择', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (439, 'file', 436, 'shopro/user/user/profile', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (440, 'file', 436, 'shopro/user/user/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (441, 'file', 436, 'shopro/user/user/order_log', '订单记录', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (442, 'file', 436, 'shopro/user/user/login_log', '登录记录', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (443, 'file', 436, 'shopro/user/user/money_log', '余额明细', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (444, 'file', 436, 'shopro/user/user/score_log', '积分明细', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (445, 'file', 436, 'shopro/user/user/share_log', '分享记录', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (446, 'file', 436, 'shopro/user/user/goods_favorite', '收藏商品', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (447, 'file', 436, 'shopro/user/user/coupon_log', '优惠券', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (448, 'file', 436, 'shopro/user/user/goods_view', '浏览足迹', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (449, 'file', 436, 'shopro/user/user/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (450, 'file', 436, 'shopro/user/user/update', '更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (451, 'file', 436, 'shopro/user/user/money_recharge', '余额充值', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (452, 'file', 436, 'shopro/user/user/score_recharge', '积分充值', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (453, 'file', 436, 'shopro/user/group', '用户分组', 'fa fa-circle-o', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (454, 'file', 453, 'shopro/user/group/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (455, 'file', 453, 'shopro/user/group/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (456, 'file', 453, 'shopro/user/group/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (457, 'file', 453, 'shopro/user/group/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (458, 'file', 85, 'shopro/commission', '分销中心', 'fa fa-users', '', '', '', 0, NULL, '', 1617411589, 1622511009, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (459, 'file', 458, 'shopro/commission/config', '分销设置', 'fa fa-cog', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (460, 'file', 459, 'shopro/commission/config/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (461, 'file', 459, 'shopro/commission/config/save', '保存', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (462, 'file', 458, 'shopro/commission/agent', '分销商', 'fa fa-user', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (463, 'file', 462, 'shopro/commission/agent/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (464, 'file', 462, 'shopro/commission/agent/profile', '详情', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (465, 'file', 462, 'shopro/commission/agent/update', '更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (466, 'file', 462, 'shopro/commission/agent/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (467, 'file', 462, 'shopro/commission/agent/team', '团队', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (468, 'file', 458, 'shopro/commission/goods', '分销商品', 'fa fa-briefcase', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (469, 'file', 468, 'shopro/commission/goods/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (470, 'file', 468, 'shopro/commission/goods/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (471, 'file', 468, 'shopro/commission/goods/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (472, 'file', 468, 'shopro/commission/goods/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (473, 'file', 468, 'shopro/commission/goods/commission_status', '是否参与分销', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (474, 'file', 458, 'shopro/commission/order', '分销订单', 'fa fa-file-text', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (475, 'file', 474, 'shopro/commission/order/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (476, 'file', 474, 'shopro/commission/order/runcommission', '分销订单结算', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (477, 'file', 474, 'shopro/commission/reward/runcommission', '佣金明细结算', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (478, 'file', 474, 'shopro/commission/reward/backcommission', '佣金明细退回', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (479, 'file', 474, 'shopro/commission/reward/edit', '修改分销金额', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (480, 'file', 474, 'shopro/commission/order/backcommission', '分销订单退回', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (481, 'file', 458, 'shopro/commission/dashboard', '分销概览', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (482, 'file', 458, 'shopro/commission/level', '分销商等级', 'fa fa-star', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (483, 'file', 482, 'shopro/commission/level/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (484, 'file', 482, 'shopro/commission/level/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (485, 'file', 482, 'shopro/commission/level/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (486, 'file', 482, 'shopro/commission/level/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (487, 'file', 458, 'shopro/commission/reward', '佣金明细', 'fa fa-usd', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (488, 'file', 487, 'shopro/commission/reward/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (489, 'file', 458, 'shopro/commission/log', '分销动态', 'fa fa-comments', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (490, 'file', 489, 'shopro/commission/log/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (491, 'file', 85, 'shopro/chat', '客服管理', 'fa fa-list', '', '', '', 0, NULL, '', 1617411589, 1622511006, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (492, 'file', 491, 'shopro/chat/fast_reply', '快捷回复', 'fa fa-commenting', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (493, 'file', 492, 'shopro/chat/fast_reply/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (494, 'file', 492, 'shopro/chat/fast_reply/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (495, 'file', 492, 'shopro/chat/fast_reply/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (496, 'file', 492, 'shopro/chat/fast_reply/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (497, 'file', 492, 'shopro/chat/fast_reply/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (498, 'file', 491, 'shopro/chat/question', '常见问题', 'fa fa-envelope-open', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (499, 'file', 498, 'shopro/chat/question/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (500, 'file', 498, 'shopro/chat/question/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (501, 'file', 498, 'shopro/chat/question/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (502, 'file', 498, 'shopro/chat/question/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (503, 'file', 498, 'shopro/chat/question/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (504, 'file', 491, 'shopro/chat/customer_service', '客服管理', 'fa fa-user-circle', '', '', '', 1, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (505, 'file', 504, 'shopro/chat/customer_service/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (506, 'file', 504, 'shopro/chat/customer_service/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (507, 'file', 504, 'shopro/chat/customer_service/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (508, 'file', 504, 'shopro/chat/customer_service/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (509, 'file', 504, 'shopro/chat/customer_service/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (510, 'file', 504, 'shopro/admin/index', '管理员列表', 'fa fa-circle-o', '', '', '', 0, NULL, '', 1617411589, 1617411589, 0, 'normal');

-- ----------------------------
-- Table structure for fa_category
-- ----------------------------
DROP TABLE IF EXISTS `fa_category`;
CREATE TABLE `fa_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `flag` set('hot','index','recommend') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `weigh`(`weigh`, `id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_category
-- ----------------------------
INSERT INTO `fa_category` VALUES (1, 0, 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', 1491635035, 1491635035, 1, 'normal');
INSERT INTO `fa_category` VALUES (2, 0, 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', 1491635035, 1491635035, 2, 'normal');
INSERT INTO `fa_category` VALUES (3, 2, 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', 1491635035, 1491635035, 3, 'normal');
INSERT INTO `fa_category` VALUES (4, 2, 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', 1491635035, 1491635035, 4, 'normal');
INSERT INTO `fa_category` VALUES (5, 0, 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', 1491635035, 1491635035, 5, 'normal');
INSERT INTO `fa_category` VALUES (6, 5, 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', 1491635035, 1491635035, 6, 'normal');
INSERT INTO `fa_category` VALUES (7, 5, 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', 1491635035, 1491635035, 7, 'normal');
INSERT INTO `fa_category` VALUES (8, 6, 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', 1491635035, 1491635035, 8, 'normal');
INSERT INTO `fa_category` VALUES (9, 6, 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', 1491635035, 1491635035, 9, 'normal');
INSERT INTO `fa_category` VALUES (10, 7, 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', 1491635035, 1491635035, 10, 'normal');
INSERT INTO `fa_category` VALUES (11, 7, 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', 1491635035, 1491635035, 11, 'normal');
INSERT INTO `fa_category` VALUES (12, 0, 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', 1491635035, 1491635035, 12, 'normal');
INSERT INTO `fa_category` VALUES (13, 0, 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', 1491635035, 1491635035, 13, 'normal');

-- ----------------------------
-- Table structure for fa_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_config`;
CREATE TABLE `fa_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '变量值',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '变量字典数据',
  `rule` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '扩展属性',
  `setting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '配置',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_config
-- ----------------------------
INSERT INTO `fa_config` VALUES (1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '我的网站', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '', '');
INSERT INTO `fa_config` VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果全站静态资源使用第三方云储存请配置该值', 'string', '', '', '', '', '');
INSERT INTO `fa_config` VALUES (4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.4', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '', '');
INSERT INTO `fa_config` VALUES (7, 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '', '');
INSERT INTO `fa_config` VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '', '');
INSERT INTO `fa_config` VALUES (11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"请选择\",\"SMTP\"]', '', '', '');
INSERT INTO `fa_config` VALUES (12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '', '');
INSERT INTO `fa_config` VALUES (13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '', '');
INSERT INTO `fa_config` VALUES (14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '', '');
INSERT INTO `fa_config` VALUES (15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码或授权码）', 'string', 'password', '', '', '', '');
INSERT INTO `fa_config` VALUES (16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"无\",\"TLS\",\"SSL\"]', '', '', '');
INSERT INTO `fa_config` VALUES (17, 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '', '');

-- ----------------------------
-- Table structure for fa_ems
-- ----------------------------
DROP TABLE IF EXISTS `fa_ems`;
CREATE TABLE `fa_ems`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邮箱验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_jobs
-- ----------------------------
DROP TABLE IF EXISTS `fa_jobs`;
CREATE TABLE `fa_jobs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED NULL DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_activity
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_activity`;
CREATE TABLE `fa_shopro_activity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `goods_ids` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品组',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `richtext_id` int(11) NULL DEFAULT 0 COMMENT '活动说明',
  `richtext_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明标题',
  `starttime` int(11) NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '活动规则',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '营销活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_activity_goods_sku_price
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_activity_goods_sku_price`;
CREATE TABLE `fa_shopro_activity_goods_sku_price`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL DEFAULT 0 COMMENT '活动 id',
  `sku_price_id` int(11) NOT NULL DEFAULT 0 COMMENT '规格 id',
  `goods_id` int(11) NOT NULL COMMENT '所属产品',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存',
  `sales` int(11) NOT NULL DEFAULT 0 COMMENT '已售',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `createtime` int(11) NULL DEFAULT NULL,
  `updatetime` int(11) NULL DEFAULT NULL,
  `deletetime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品规格' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_activity_groupon
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_activity_groupon`;
CREATE TABLE `fa_shopro_activity_groupon`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '团长',
  `goods_id` int(11) NOT NULL COMMENT '商品',
  `activity_id` int(11) NOT NULL COMMENT '活动',
  `num` int(11) NOT NULL COMMENT '成团人数',
  `current_num` int(11) NOT NULL COMMENT '当前人数',
  `status` enum('invalid','ing','finish','finish-fictitious') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态:invalid=已过期,ing=进行中,finish=已成团,finish-fictitious=虚拟成团',
  `expiretime` int(10) NULL DEFAULT NULL COMMENT '过期时间',
  `finishtime` int(10) NULL DEFAULT NULL COMMENT '成团时间',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_activity_groupon_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_activity_groupon_log`;
CREATE TABLE `fa_shopro_activity_groupon_log`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `user_avatar` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `groupon_id` int(11) NOT NULL DEFAULT 0 COMMENT '团',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品',
  `goods_sku_price_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品规格',
  `activity_id` int(11) NOT NULL DEFAULT 0 COMMENT '活动',
  `is_leader` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否团长',
  `is_fictitious` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否虚拟用户',
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单',
  `is_refund` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否退款',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_area
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_area`;
CREATE TABLE `fa_shopro_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `pid` int(11) NULL DEFAULT 0 COMMENT '上级',
  `level` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 820105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '省市区数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_shopro_area
-- ----------------------------
INSERT INTO `fa_shopro_area` VALUES (110000, '北京市', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (110100, '北京市', 110000, 2);
INSERT INTO `fa_shopro_area` VALUES (110101, '东城区', 110100, 3);
INSERT INTO `fa_shopro_area` VALUES (110102, '西城区', 110100, 3);
INSERT INTO `fa_shopro_area` VALUES (110105, '朝阳区', 110100, 3);
INSERT INTO `fa_shopro_area` VALUES (110106, '丰台区', 110100, 3);
INSERT INTO `fa_shopro_area` VALUES (110107, '石景山区', 110100, 3);
INSERT INTO `fa_shopro_area` VALUES (110108, '海淀区', 110100, 3);
INSERT INTO `fa_shopro_area` VALUES (110109, '门头沟区', 110100, 3);
INSERT INTO `fa_shopro_area` VALUES (110111, '房山区', 110100, 3);
INSERT INTO `fa_shopro_area` VALUES (110112, '通州区', 110100, 3);
INSERT INTO `fa_shopro_area` VALUES (110113, '顺义区', 110100, 3);
INSERT INTO `fa_shopro_area` VALUES (110114, '昌平区', 110100, 3);
INSERT INTO `fa_shopro_area` VALUES (110115, '大兴区', 110100, 3);
INSERT INTO `fa_shopro_area` VALUES (110116, '怀柔区', 110100, 3);
INSERT INTO `fa_shopro_area` VALUES (110117, '平谷区', 110100, 3);
INSERT INTO `fa_shopro_area` VALUES (110118, '密云区', 110100, 3);
INSERT INTO `fa_shopro_area` VALUES (110119, '延庆区', 110100, 3);
INSERT INTO `fa_shopro_area` VALUES (120000, '天津市', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (120100, '天津市', 120000, 2);
INSERT INTO `fa_shopro_area` VALUES (120101, '和平区', 120100, 3);
INSERT INTO `fa_shopro_area` VALUES (120102, '河东区', 120100, 3);
INSERT INTO `fa_shopro_area` VALUES (120103, '河西区', 120100, 3);
INSERT INTO `fa_shopro_area` VALUES (120104, '南开区', 120100, 3);
INSERT INTO `fa_shopro_area` VALUES (120105, '河北区', 120100, 3);
INSERT INTO `fa_shopro_area` VALUES (120106, '红桥区', 120100, 3);
INSERT INTO `fa_shopro_area` VALUES (120110, '东丽区', 120100, 3);
INSERT INTO `fa_shopro_area` VALUES (120111, '西青区', 120100, 3);
INSERT INTO `fa_shopro_area` VALUES (120112, '津南区', 120100, 3);
INSERT INTO `fa_shopro_area` VALUES (120113, '北辰区', 120100, 3);
INSERT INTO `fa_shopro_area` VALUES (120114, '武清区', 120100, 3);
INSERT INTO `fa_shopro_area` VALUES (120115, '宝坻区', 120100, 3);
INSERT INTO `fa_shopro_area` VALUES (120116, '滨海新区', 120100, 3);
INSERT INTO `fa_shopro_area` VALUES (120117, '宁河区', 120100, 3);
INSERT INTO `fa_shopro_area` VALUES (120118, '静海区', 120100, 3);
INSERT INTO `fa_shopro_area` VALUES (120119, '蓟州区', 120100, 3);
INSERT INTO `fa_shopro_area` VALUES (130000, '河北省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (130100, '石家庄市', 130000, 2);
INSERT INTO `fa_shopro_area` VALUES (130102, '长安区', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130104, '桥西区', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130105, '新华区', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130107, '井陉矿区', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130108, '裕华区', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130109, '藁城区', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130110, '鹿泉区', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130111, '栾城区', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130121, '井陉县', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130123, '正定县', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130125, '行唐县', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130126, '灵寿县', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130127, '高邑县', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130128, '深泽县', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130129, '赞皇县', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130130, '无极县', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130131, '平山县', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130132, '元氏县', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130133, '赵县', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130181, '辛集市', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130183, '晋州市', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130184, '新乐市', 130100, 3);
INSERT INTO `fa_shopro_area` VALUES (130200, '唐山市', 130000, 2);
INSERT INTO `fa_shopro_area` VALUES (130202, '路南区', 130200, 3);
INSERT INTO `fa_shopro_area` VALUES (130203, '路北区', 130200, 3);
INSERT INTO `fa_shopro_area` VALUES (130204, '古冶区', 130200, 3);
INSERT INTO `fa_shopro_area` VALUES (130205, '开平区', 130200, 3);
INSERT INTO `fa_shopro_area` VALUES (130207, '丰南区', 130200, 3);
INSERT INTO `fa_shopro_area` VALUES (130208, '丰润区', 130200, 3);
INSERT INTO `fa_shopro_area` VALUES (130209, '曹妃甸区', 130200, 3);
INSERT INTO `fa_shopro_area` VALUES (130223, '滦县', 130200, 3);
INSERT INTO `fa_shopro_area` VALUES (130224, '滦南县', 130200, 3);
INSERT INTO `fa_shopro_area` VALUES (130225, '乐亭县', 130200, 3);
INSERT INTO `fa_shopro_area` VALUES (130227, '迁西县', 130200, 3);
INSERT INTO `fa_shopro_area` VALUES (130229, '玉田县', 130200, 3);
INSERT INTO `fa_shopro_area` VALUES (130281, '遵化市', 130200, 3);
INSERT INTO `fa_shopro_area` VALUES (130283, '迁安市', 130200, 3);
INSERT INTO `fa_shopro_area` VALUES (130300, '秦皇岛市', 130000, 2);
INSERT INTO `fa_shopro_area` VALUES (130302, '海港区', 130300, 3);
INSERT INTO `fa_shopro_area` VALUES (130303, '山海关区', 130300, 3);
INSERT INTO `fa_shopro_area` VALUES (130304, '北戴河区', 130300, 3);
INSERT INTO `fa_shopro_area` VALUES (130306, '抚宁区', 130300, 3);
INSERT INTO `fa_shopro_area` VALUES (130321, '青龙满族自治县', 130300, 3);
INSERT INTO `fa_shopro_area` VALUES (130322, '昌黎县', 130300, 3);
INSERT INTO `fa_shopro_area` VALUES (130324, '卢龙县', 130300, 3);
INSERT INTO `fa_shopro_area` VALUES (130400, '邯郸市', 130000, 2);
INSERT INTO `fa_shopro_area` VALUES (130402, '邯山区', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130403, '丛台区', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130404, '复兴区', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130406, '峰峰矿区', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130407, '肥乡区', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130408, '永年区', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130423, '临漳县', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130424, '成安县', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130425, '大名县', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130426, '涉县', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130427, '磁县', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130430, '邱县', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130431, '鸡泽县', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130432, '广平县', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130433, '馆陶县', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130434, '魏县', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130435, '曲周县', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130481, '武安市', 130400, 3);
INSERT INTO `fa_shopro_area` VALUES (130500, '邢台市', 130000, 2);
INSERT INTO `fa_shopro_area` VALUES (130502, '桥东区', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130503, '桥西区', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130521, '邢台县', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130522, '临城县', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130523, '内丘县', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130524, '柏乡县', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130525, '隆尧县', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130526, '任县', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130527, '南和县', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130528, '宁晋县', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130529, '巨鹿县', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130530, '新河县', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130531, '广宗县', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130532, '平乡县', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130533, '威县', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130534, '清河县', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130535, '临西县', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130581, '南宫市', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130582, '沙河市', 130500, 3);
INSERT INTO `fa_shopro_area` VALUES (130600, '保定市', 130000, 2);
INSERT INTO `fa_shopro_area` VALUES (130602, '竞秀区', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130606, '莲池区', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130607, '满城区', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130608, '清苑区', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130609, '徐水区', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130623, '涞水县', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130624, '阜平县', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130626, '定兴县', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130627, '唐县', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130628, '高阳县', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130629, '容城县', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130630, '涞源县', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130631, '望都县', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130632, '安新县', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130633, '易县', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130634, '曲阳县', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130635, '蠡县', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130636, '顺平县', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130637, '博野县', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130638, '雄县', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130681, '涿州市', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130682, '定州市', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130683, '安国市', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130684, '高碑店市', 130600, 3);
INSERT INTO `fa_shopro_area` VALUES (130700, '张家口市', 130000, 2);
INSERT INTO `fa_shopro_area` VALUES (130702, '桥东区', 130700, 3);
INSERT INTO `fa_shopro_area` VALUES (130703, '桥西区', 130700, 3);
INSERT INTO `fa_shopro_area` VALUES (130705, '宣化区', 130700, 3);
INSERT INTO `fa_shopro_area` VALUES (130706, '下花园区', 130700, 3);
INSERT INTO `fa_shopro_area` VALUES (130708, '万全区', 130700, 3);
INSERT INTO `fa_shopro_area` VALUES (130709, '崇礼区', 130700, 3);
INSERT INTO `fa_shopro_area` VALUES (130722, '张北县', 130700, 3);
INSERT INTO `fa_shopro_area` VALUES (130723, '康保县', 130700, 3);
INSERT INTO `fa_shopro_area` VALUES (130724, '沽源县', 130700, 3);
INSERT INTO `fa_shopro_area` VALUES (130725, '尚义县', 130700, 3);
INSERT INTO `fa_shopro_area` VALUES (130726, '蔚县', 130700, 3);
INSERT INTO `fa_shopro_area` VALUES (130727, '阳原县', 130700, 3);
INSERT INTO `fa_shopro_area` VALUES (130728, '怀安县', 130700, 3);
INSERT INTO `fa_shopro_area` VALUES (130730, '怀来县', 130700, 3);
INSERT INTO `fa_shopro_area` VALUES (130731, '涿鹿县', 130700, 3);
INSERT INTO `fa_shopro_area` VALUES (130732, '赤城县', 130700, 3);
INSERT INTO `fa_shopro_area` VALUES (130800, '承德市', 130000, 2);
INSERT INTO `fa_shopro_area` VALUES (130802, '双桥区', 130800, 3);
INSERT INTO `fa_shopro_area` VALUES (130803, '双滦区', 130800, 3);
INSERT INTO `fa_shopro_area` VALUES (130804, '鹰手营子矿区', 130800, 3);
INSERT INTO `fa_shopro_area` VALUES (130821, '承德县', 130800, 3);
INSERT INTO `fa_shopro_area` VALUES (130822, '兴隆县', 130800, 3);
INSERT INTO `fa_shopro_area` VALUES (130824, '滦平县', 130800, 3);
INSERT INTO `fa_shopro_area` VALUES (130825, '隆化县', 130800, 3);
INSERT INTO `fa_shopro_area` VALUES (130826, '丰宁满族自治县', 130800, 3);
INSERT INTO `fa_shopro_area` VALUES (130827, '宽城满族自治县', 130800, 3);
INSERT INTO `fa_shopro_area` VALUES (130828, '围场满族蒙古族自治县', 130800, 3);
INSERT INTO `fa_shopro_area` VALUES (130881, '平泉市', 130800, 3);
INSERT INTO `fa_shopro_area` VALUES (130900, '沧州市', 130000, 2);
INSERT INTO `fa_shopro_area` VALUES (130902, '新华区', 130900, 3);
INSERT INTO `fa_shopro_area` VALUES (130903, '运河区', 130900, 3);
INSERT INTO `fa_shopro_area` VALUES (130921, '沧县', 130900, 3);
INSERT INTO `fa_shopro_area` VALUES (130922, '青县', 130900, 3);
INSERT INTO `fa_shopro_area` VALUES (130923, '东光县', 130900, 3);
INSERT INTO `fa_shopro_area` VALUES (130924, '海兴县', 130900, 3);
INSERT INTO `fa_shopro_area` VALUES (130925, '盐山县', 130900, 3);
INSERT INTO `fa_shopro_area` VALUES (130926, '肃宁县', 130900, 3);
INSERT INTO `fa_shopro_area` VALUES (130927, '南皮县', 130900, 3);
INSERT INTO `fa_shopro_area` VALUES (130928, '吴桥县', 130900, 3);
INSERT INTO `fa_shopro_area` VALUES (130929, '献县', 130900, 3);
INSERT INTO `fa_shopro_area` VALUES (130930, '孟村回族自治县', 130900, 3);
INSERT INTO `fa_shopro_area` VALUES (130981, '泊头市', 130900, 3);
INSERT INTO `fa_shopro_area` VALUES (130982, '任丘市', 130900, 3);
INSERT INTO `fa_shopro_area` VALUES (130983, '黄骅市', 130900, 3);
INSERT INTO `fa_shopro_area` VALUES (130984, '河间市', 130900, 3);
INSERT INTO `fa_shopro_area` VALUES (131000, '廊坊市', 130000, 2);
INSERT INTO `fa_shopro_area` VALUES (131002, '安次区', 131000, 3);
INSERT INTO `fa_shopro_area` VALUES (131003, '广阳区', 131000, 3);
INSERT INTO `fa_shopro_area` VALUES (131022, '固安县', 131000, 3);
INSERT INTO `fa_shopro_area` VALUES (131023, '永清县', 131000, 3);
INSERT INTO `fa_shopro_area` VALUES (131024, '香河县', 131000, 3);
INSERT INTO `fa_shopro_area` VALUES (131025, '大城县', 131000, 3);
INSERT INTO `fa_shopro_area` VALUES (131026, '文安县', 131000, 3);
INSERT INTO `fa_shopro_area` VALUES (131028, '大厂回族自治县', 131000, 3);
INSERT INTO `fa_shopro_area` VALUES (131081, '霸州市', 131000, 3);
INSERT INTO `fa_shopro_area` VALUES (131082, '三河市', 131000, 3);
INSERT INTO `fa_shopro_area` VALUES (131100, '衡水市', 130000, 2);
INSERT INTO `fa_shopro_area` VALUES (131102, '桃城区', 131100, 3);
INSERT INTO `fa_shopro_area` VALUES (131103, '冀州区', 131100, 3);
INSERT INTO `fa_shopro_area` VALUES (131121, '枣强县', 131100, 3);
INSERT INTO `fa_shopro_area` VALUES (131122, '武邑县', 131100, 3);
INSERT INTO `fa_shopro_area` VALUES (131123, '武强县', 131100, 3);
INSERT INTO `fa_shopro_area` VALUES (131124, '饶阳县', 131100, 3);
INSERT INTO `fa_shopro_area` VALUES (131125, '安平县', 131100, 3);
INSERT INTO `fa_shopro_area` VALUES (131126, '故城县', 131100, 3);
INSERT INTO `fa_shopro_area` VALUES (131127, '景县', 131100, 3);
INSERT INTO `fa_shopro_area` VALUES (131128, '阜城县', 131100, 3);
INSERT INTO `fa_shopro_area` VALUES (131182, '深州市', 131100, 3);
INSERT INTO `fa_shopro_area` VALUES (140000, '山西省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (140100, '太原市', 140000, 2);
INSERT INTO `fa_shopro_area` VALUES (140105, '小店区', 140100, 3);
INSERT INTO `fa_shopro_area` VALUES (140106, '迎泽区', 140100, 3);
INSERT INTO `fa_shopro_area` VALUES (140107, '杏花岭区', 140100, 3);
INSERT INTO `fa_shopro_area` VALUES (140108, '尖草坪区', 140100, 3);
INSERT INTO `fa_shopro_area` VALUES (140109, '万柏林区', 140100, 3);
INSERT INTO `fa_shopro_area` VALUES (140110, '晋源区', 140100, 3);
INSERT INTO `fa_shopro_area` VALUES (140121, '清徐县', 140100, 3);
INSERT INTO `fa_shopro_area` VALUES (140122, '阳曲县', 140100, 3);
INSERT INTO `fa_shopro_area` VALUES (140123, '娄烦县', 140100, 3);
INSERT INTO `fa_shopro_area` VALUES (140181, '古交市', 140100, 3);
INSERT INTO `fa_shopro_area` VALUES (140200, '大同市', 140000, 2);
INSERT INTO `fa_shopro_area` VALUES (140202, '城区', 140200, 3);
INSERT INTO `fa_shopro_area` VALUES (140203, '矿区', 140200, 3);
INSERT INTO `fa_shopro_area` VALUES (140211, '南郊区', 140200, 3);
INSERT INTO `fa_shopro_area` VALUES (140212, '新荣区', 140200, 3);
INSERT INTO `fa_shopro_area` VALUES (140221, '阳高县', 140200, 3);
INSERT INTO `fa_shopro_area` VALUES (140222, '天镇县', 140200, 3);
INSERT INTO `fa_shopro_area` VALUES (140223, '广灵县', 140200, 3);
INSERT INTO `fa_shopro_area` VALUES (140224, '灵丘县', 140200, 3);
INSERT INTO `fa_shopro_area` VALUES (140225, '浑源县', 140200, 3);
INSERT INTO `fa_shopro_area` VALUES (140226, '左云县', 140200, 3);
INSERT INTO `fa_shopro_area` VALUES (140227, '大同县', 140200, 3);
INSERT INTO `fa_shopro_area` VALUES (140300, '阳泉市', 140000, 2);
INSERT INTO `fa_shopro_area` VALUES (140302, '城区', 140300, 3);
INSERT INTO `fa_shopro_area` VALUES (140303, '矿区', 140300, 3);
INSERT INTO `fa_shopro_area` VALUES (140311, '郊区', 140300, 3);
INSERT INTO `fa_shopro_area` VALUES (140321, '平定县', 140300, 3);
INSERT INTO `fa_shopro_area` VALUES (140322, '盂县', 140300, 3);
INSERT INTO `fa_shopro_area` VALUES (140400, '长治市', 140000, 2);
INSERT INTO `fa_shopro_area` VALUES (140402, '城区', 140400, 3);
INSERT INTO `fa_shopro_area` VALUES (140411, '郊区', 140400, 3);
INSERT INTO `fa_shopro_area` VALUES (140421, '长治县', 140400, 3);
INSERT INTO `fa_shopro_area` VALUES (140423, '襄垣县', 140400, 3);
INSERT INTO `fa_shopro_area` VALUES (140424, '屯留县', 140400, 3);
INSERT INTO `fa_shopro_area` VALUES (140425, '平顺县', 140400, 3);
INSERT INTO `fa_shopro_area` VALUES (140426, '黎城县', 140400, 3);
INSERT INTO `fa_shopro_area` VALUES (140427, '壶关县', 140400, 3);
INSERT INTO `fa_shopro_area` VALUES (140428, '长子县', 140400, 3);
INSERT INTO `fa_shopro_area` VALUES (140429, '武乡县', 140400, 3);
INSERT INTO `fa_shopro_area` VALUES (140430, '沁县', 140400, 3);
INSERT INTO `fa_shopro_area` VALUES (140431, '沁源县', 140400, 3);
INSERT INTO `fa_shopro_area` VALUES (140481, '潞城市', 140400, 3);
INSERT INTO `fa_shopro_area` VALUES (140500, '晋城市', 140000, 2);
INSERT INTO `fa_shopro_area` VALUES (140502, '城区', 140500, 3);
INSERT INTO `fa_shopro_area` VALUES (140521, '沁水县', 140500, 3);
INSERT INTO `fa_shopro_area` VALUES (140522, '阳城县', 140500, 3);
INSERT INTO `fa_shopro_area` VALUES (140524, '陵川县', 140500, 3);
INSERT INTO `fa_shopro_area` VALUES (140525, '泽州县', 140500, 3);
INSERT INTO `fa_shopro_area` VALUES (140581, '高平市', 140500, 3);
INSERT INTO `fa_shopro_area` VALUES (140600, '朔州市', 140000, 2);
INSERT INTO `fa_shopro_area` VALUES (140602, '朔城区', 140600, 3);
INSERT INTO `fa_shopro_area` VALUES (140603, '平鲁区', 140600, 3);
INSERT INTO `fa_shopro_area` VALUES (140621, '山阴县', 140600, 3);
INSERT INTO `fa_shopro_area` VALUES (140622, '应县', 140600, 3);
INSERT INTO `fa_shopro_area` VALUES (140623, '右玉县', 140600, 3);
INSERT INTO `fa_shopro_area` VALUES (140624, '怀仁县', 140600, 3);
INSERT INTO `fa_shopro_area` VALUES (140700, '晋中市', 140000, 2);
INSERT INTO `fa_shopro_area` VALUES (140702, '榆次区', 140700, 3);
INSERT INTO `fa_shopro_area` VALUES (140721, '榆社县', 140700, 3);
INSERT INTO `fa_shopro_area` VALUES (140722, '左权县', 140700, 3);
INSERT INTO `fa_shopro_area` VALUES (140723, '和顺县', 140700, 3);
INSERT INTO `fa_shopro_area` VALUES (140724, '昔阳县', 140700, 3);
INSERT INTO `fa_shopro_area` VALUES (140725, '寿阳县', 140700, 3);
INSERT INTO `fa_shopro_area` VALUES (140726, '太谷县', 140700, 3);
INSERT INTO `fa_shopro_area` VALUES (140727, '祁县', 140700, 3);
INSERT INTO `fa_shopro_area` VALUES (140728, '平遥县', 140700, 3);
INSERT INTO `fa_shopro_area` VALUES (140729, '灵石县', 140700, 3);
INSERT INTO `fa_shopro_area` VALUES (140781, '介休市', 140700, 3);
INSERT INTO `fa_shopro_area` VALUES (140800, '运城市', 140000, 2);
INSERT INTO `fa_shopro_area` VALUES (140802, '盐湖区', 140800, 3);
INSERT INTO `fa_shopro_area` VALUES (140821, '临猗县', 140800, 3);
INSERT INTO `fa_shopro_area` VALUES (140822, '万荣县', 140800, 3);
INSERT INTO `fa_shopro_area` VALUES (140823, '闻喜县', 140800, 3);
INSERT INTO `fa_shopro_area` VALUES (140824, '稷山县', 140800, 3);
INSERT INTO `fa_shopro_area` VALUES (140825, '新绛县', 140800, 3);
INSERT INTO `fa_shopro_area` VALUES (140826, '绛县', 140800, 3);
INSERT INTO `fa_shopro_area` VALUES (140827, '垣曲县', 140800, 3);
INSERT INTO `fa_shopro_area` VALUES (140828, '夏县', 140800, 3);
INSERT INTO `fa_shopro_area` VALUES (140829, '平陆县', 140800, 3);
INSERT INTO `fa_shopro_area` VALUES (140830, '芮城县', 140800, 3);
INSERT INTO `fa_shopro_area` VALUES (140881, '永济市', 140800, 3);
INSERT INTO `fa_shopro_area` VALUES (140882, '河津市', 140800, 3);
INSERT INTO `fa_shopro_area` VALUES (140900, '忻州市', 140000, 2);
INSERT INTO `fa_shopro_area` VALUES (140902, '忻府区', 140900, 3);
INSERT INTO `fa_shopro_area` VALUES (140921, '定襄县', 140900, 3);
INSERT INTO `fa_shopro_area` VALUES (140922, '五台县', 140900, 3);
INSERT INTO `fa_shopro_area` VALUES (140923, '代县', 140900, 3);
INSERT INTO `fa_shopro_area` VALUES (140924, '繁峙县', 140900, 3);
INSERT INTO `fa_shopro_area` VALUES (140925, '宁武县', 140900, 3);
INSERT INTO `fa_shopro_area` VALUES (140926, '静乐县', 140900, 3);
INSERT INTO `fa_shopro_area` VALUES (140927, '神池县', 140900, 3);
INSERT INTO `fa_shopro_area` VALUES (140928, '五寨县', 140900, 3);
INSERT INTO `fa_shopro_area` VALUES (140929, '岢岚县', 140900, 3);
INSERT INTO `fa_shopro_area` VALUES (140930, '河曲县', 140900, 3);
INSERT INTO `fa_shopro_area` VALUES (140931, '保德县', 140900, 3);
INSERT INTO `fa_shopro_area` VALUES (140932, '偏关县', 140900, 3);
INSERT INTO `fa_shopro_area` VALUES (140981, '原平市', 140900, 3);
INSERT INTO `fa_shopro_area` VALUES (141000, '临汾市', 140000, 2);
INSERT INTO `fa_shopro_area` VALUES (141002, '尧都区', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141021, '曲沃县', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141022, '翼城县', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141023, '襄汾县', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141024, '洪洞县', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141025, '古县', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141026, '安泽县', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141027, '浮山县', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141028, '吉县', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141029, '乡宁县', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141030, '大宁县', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141031, '隰县', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141032, '永和县', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141033, '蒲县', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141034, '汾西县', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141081, '侯马市', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141082, '霍州市', 141000, 3);
INSERT INTO `fa_shopro_area` VALUES (141100, '吕梁市', 140000, 2);
INSERT INTO `fa_shopro_area` VALUES (141102, '离石区', 141100, 3);
INSERT INTO `fa_shopro_area` VALUES (141121, '文水县', 141100, 3);
INSERT INTO `fa_shopro_area` VALUES (141122, '交城县', 141100, 3);
INSERT INTO `fa_shopro_area` VALUES (141123, '兴县', 141100, 3);
INSERT INTO `fa_shopro_area` VALUES (141124, '临县', 141100, 3);
INSERT INTO `fa_shopro_area` VALUES (141125, '柳林县', 141100, 3);
INSERT INTO `fa_shopro_area` VALUES (141126, '石楼县', 141100, 3);
INSERT INTO `fa_shopro_area` VALUES (141127, '岚县', 141100, 3);
INSERT INTO `fa_shopro_area` VALUES (141128, '方山县', 141100, 3);
INSERT INTO `fa_shopro_area` VALUES (141129, '中阳县', 141100, 3);
INSERT INTO `fa_shopro_area` VALUES (141130, '交口县', 141100, 3);
INSERT INTO `fa_shopro_area` VALUES (141181, '孝义市', 141100, 3);
INSERT INTO `fa_shopro_area` VALUES (141182, '汾阳市', 141100, 3);
INSERT INTO `fa_shopro_area` VALUES (150000, '内蒙古自治区', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (150100, '呼和浩特市', 150000, 2);
INSERT INTO `fa_shopro_area` VALUES (150102, '新城区', 150100, 3);
INSERT INTO `fa_shopro_area` VALUES (150103, '回民区', 150100, 3);
INSERT INTO `fa_shopro_area` VALUES (150104, '玉泉区', 150100, 3);
INSERT INTO `fa_shopro_area` VALUES (150105, '赛罕区', 150100, 3);
INSERT INTO `fa_shopro_area` VALUES (150121, '土默特左旗', 150100, 3);
INSERT INTO `fa_shopro_area` VALUES (150122, '托克托县', 150100, 3);
INSERT INTO `fa_shopro_area` VALUES (150123, '和林格尔县', 150100, 3);
INSERT INTO `fa_shopro_area` VALUES (150124, '清水河县', 150100, 3);
INSERT INTO `fa_shopro_area` VALUES (150125, '武川县', 150100, 3);
INSERT INTO `fa_shopro_area` VALUES (150200, '包头市', 150000, 2);
INSERT INTO `fa_shopro_area` VALUES (150202, '东河区', 150200, 3);
INSERT INTO `fa_shopro_area` VALUES (150203, '昆都仑区', 150200, 3);
INSERT INTO `fa_shopro_area` VALUES (150204, '青山区', 150200, 3);
INSERT INTO `fa_shopro_area` VALUES (150205, '石拐区', 150200, 3);
INSERT INTO `fa_shopro_area` VALUES (150206, '白云鄂博矿区', 150200, 3);
INSERT INTO `fa_shopro_area` VALUES (150207, '九原区', 150200, 3);
INSERT INTO `fa_shopro_area` VALUES (150221, '土默特右旗', 150200, 3);
INSERT INTO `fa_shopro_area` VALUES (150222, '固阳县', 150200, 3);
INSERT INTO `fa_shopro_area` VALUES (150223, '达尔罕茂明安联合旗', 150200, 3);
INSERT INTO `fa_shopro_area` VALUES (150300, '乌海市', 150000, 2);
INSERT INTO `fa_shopro_area` VALUES (150302, '海勃湾区', 150300, 3);
INSERT INTO `fa_shopro_area` VALUES (150303, '海南区', 150300, 3);
INSERT INTO `fa_shopro_area` VALUES (150304, '乌达区', 150300, 3);
INSERT INTO `fa_shopro_area` VALUES (150400, '赤峰市', 150000, 2);
INSERT INTO `fa_shopro_area` VALUES (150402, '红山区', 150400, 3);
INSERT INTO `fa_shopro_area` VALUES (150403, '元宝山区', 150400, 3);
INSERT INTO `fa_shopro_area` VALUES (150404, '松山区', 150400, 3);
INSERT INTO `fa_shopro_area` VALUES (150421, '阿鲁科尔沁旗', 150400, 3);
INSERT INTO `fa_shopro_area` VALUES (150422, '巴林左旗', 150400, 3);
INSERT INTO `fa_shopro_area` VALUES (150423, '巴林右旗', 150400, 3);
INSERT INTO `fa_shopro_area` VALUES (150424, '林西县', 150400, 3);
INSERT INTO `fa_shopro_area` VALUES (150425, '克什克腾旗', 150400, 3);
INSERT INTO `fa_shopro_area` VALUES (150426, '翁牛特旗', 150400, 3);
INSERT INTO `fa_shopro_area` VALUES (150428, '喀喇沁旗', 150400, 3);
INSERT INTO `fa_shopro_area` VALUES (150429, '宁城县', 150400, 3);
INSERT INTO `fa_shopro_area` VALUES (150430, '敖汉旗', 150400, 3);
INSERT INTO `fa_shopro_area` VALUES (150500, '通辽市', 150000, 2);
INSERT INTO `fa_shopro_area` VALUES (150502, '科尔沁区', 150500, 3);
INSERT INTO `fa_shopro_area` VALUES (150521, '科尔沁左翼中旗', 150500, 3);
INSERT INTO `fa_shopro_area` VALUES (150522, '科尔沁左翼后旗', 150500, 3);
INSERT INTO `fa_shopro_area` VALUES (150523, '开鲁县', 150500, 3);
INSERT INTO `fa_shopro_area` VALUES (150524, '库伦旗', 150500, 3);
INSERT INTO `fa_shopro_area` VALUES (150525, '奈曼旗', 150500, 3);
INSERT INTO `fa_shopro_area` VALUES (150526, '扎鲁特旗', 150500, 3);
INSERT INTO `fa_shopro_area` VALUES (150581, '霍林郭勒市', 150500, 3);
INSERT INTO `fa_shopro_area` VALUES (150600, '鄂尔多斯市', 150000, 2);
INSERT INTO `fa_shopro_area` VALUES (150602, '东胜区', 150600, 3);
INSERT INTO `fa_shopro_area` VALUES (150603, '康巴什区', 150600, 3);
INSERT INTO `fa_shopro_area` VALUES (150621, '达拉特旗', 150600, 3);
INSERT INTO `fa_shopro_area` VALUES (150622, '准格尔旗', 150600, 3);
INSERT INTO `fa_shopro_area` VALUES (150623, '鄂托克前旗', 150600, 3);
INSERT INTO `fa_shopro_area` VALUES (150624, '鄂托克旗', 150600, 3);
INSERT INTO `fa_shopro_area` VALUES (150625, '杭锦旗', 150600, 3);
INSERT INTO `fa_shopro_area` VALUES (150626, '乌审旗', 150600, 3);
INSERT INTO `fa_shopro_area` VALUES (150627, '伊金霍洛旗', 150600, 3);
INSERT INTO `fa_shopro_area` VALUES (150700, '呼伦贝尔市', 150000, 2);
INSERT INTO `fa_shopro_area` VALUES (150702, '海拉尔区', 150700, 3);
INSERT INTO `fa_shopro_area` VALUES (150703, '扎赉诺尔区', 150700, 3);
INSERT INTO `fa_shopro_area` VALUES (150721, '阿荣旗', 150700, 3);
INSERT INTO `fa_shopro_area` VALUES (150722, '莫力达瓦达斡尔族自治旗', 150700, 3);
INSERT INTO `fa_shopro_area` VALUES (150723, '鄂伦春自治旗', 150700, 3);
INSERT INTO `fa_shopro_area` VALUES (150724, '鄂温克族自治旗', 150700, 3);
INSERT INTO `fa_shopro_area` VALUES (150725, '陈巴尔虎旗', 150700, 3);
INSERT INTO `fa_shopro_area` VALUES (150726, '新巴尔虎左旗', 150700, 3);
INSERT INTO `fa_shopro_area` VALUES (150727, '新巴尔虎右旗', 150700, 3);
INSERT INTO `fa_shopro_area` VALUES (150781, '满洲里市', 150700, 3);
INSERT INTO `fa_shopro_area` VALUES (150782, '牙克石市', 150700, 3);
INSERT INTO `fa_shopro_area` VALUES (150783, '扎兰屯市', 150700, 3);
INSERT INTO `fa_shopro_area` VALUES (150784, '额尔古纳市', 150700, 3);
INSERT INTO `fa_shopro_area` VALUES (150785, '根河市', 150700, 3);
INSERT INTO `fa_shopro_area` VALUES (150800, '巴彦淖尔市', 150000, 2);
INSERT INTO `fa_shopro_area` VALUES (150802, '临河区', 150800, 3);
INSERT INTO `fa_shopro_area` VALUES (150821, '五原县', 150800, 3);
INSERT INTO `fa_shopro_area` VALUES (150822, '磴口县', 150800, 3);
INSERT INTO `fa_shopro_area` VALUES (150823, '乌拉特前旗', 150800, 3);
INSERT INTO `fa_shopro_area` VALUES (150824, '乌拉特中旗', 150800, 3);
INSERT INTO `fa_shopro_area` VALUES (150825, '乌拉特后旗', 150800, 3);
INSERT INTO `fa_shopro_area` VALUES (150826, '杭锦后旗', 150800, 3);
INSERT INTO `fa_shopro_area` VALUES (150900, '乌兰察布市', 150000, 2);
INSERT INTO `fa_shopro_area` VALUES (150902, '集宁区', 150900, 3);
INSERT INTO `fa_shopro_area` VALUES (150921, '卓资县', 150900, 3);
INSERT INTO `fa_shopro_area` VALUES (150922, '化德县', 150900, 3);
INSERT INTO `fa_shopro_area` VALUES (150923, '商都县', 150900, 3);
INSERT INTO `fa_shopro_area` VALUES (150924, '兴和县', 150900, 3);
INSERT INTO `fa_shopro_area` VALUES (150925, '凉城县', 150900, 3);
INSERT INTO `fa_shopro_area` VALUES (150926, '察哈尔右翼前旗', 150900, 3);
INSERT INTO `fa_shopro_area` VALUES (150927, '察哈尔右翼中旗', 150900, 3);
INSERT INTO `fa_shopro_area` VALUES (150928, '察哈尔右翼后旗', 150900, 3);
INSERT INTO `fa_shopro_area` VALUES (150929, '四子王旗', 150900, 3);
INSERT INTO `fa_shopro_area` VALUES (150981, '丰镇市', 150900, 3);
INSERT INTO `fa_shopro_area` VALUES (152200, '兴安盟', 150000, 2);
INSERT INTO `fa_shopro_area` VALUES (152201, '乌兰浩特市', 152200, 3);
INSERT INTO `fa_shopro_area` VALUES (152202, '阿尔山市', 152200, 3);
INSERT INTO `fa_shopro_area` VALUES (152221, '科尔沁右翼前旗', 152200, 3);
INSERT INTO `fa_shopro_area` VALUES (152222, '科尔沁右翼中旗', 152200, 3);
INSERT INTO `fa_shopro_area` VALUES (152223, '扎赉特旗', 152200, 3);
INSERT INTO `fa_shopro_area` VALUES (152224, '突泉县', 152200, 3);
INSERT INTO `fa_shopro_area` VALUES (152500, '锡林郭勒盟', 150000, 2);
INSERT INTO `fa_shopro_area` VALUES (152501, '二连浩特市', 152500, 3);
INSERT INTO `fa_shopro_area` VALUES (152502, '锡林浩特市', 152500, 3);
INSERT INTO `fa_shopro_area` VALUES (152522, '阿巴嘎旗', 152500, 3);
INSERT INTO `fa_shopro_area` VALUES (152523, '苏尼特左旗', 152500, 3);
INSERT INTO `fa_shopro_area` VALUES (152524, '苏尼特右旗', 152500, 3);
INSERT INTO `fa_shopro_area` VALUES (152525, '东乌珠穆沁旗', 152500, 3);
INSERT INTO `fa_shopro_area` VALUES (152526, '西乌珠穆沁旗', 152500, 3);
INSERT INTO `fa_shopro_area` VALUES (152527, '太仆寺旗', 152500, 3);
INSERT INTO `fa_shopro_area` VALUES (152528, '镶黄旗', 152500, 3);
INSERT INTO `fa_shopro_area` VALUES (152529, '正镶白旗', 152500, 3);
INSERT INTO `fa_shopro_area` VALUES (152530, '正蓝旗', 152500, 3);
INSERT INTO `fa_shopro_area` VALUES (152531, '多伦县', 152500, 3);
INSERT INTO `fa_shopro_area` VALUES (152900, '阿拉善盟', 150000, 2);
INSERT INTO `fa_shopro_area` VALUES (152921, '阿拉善左旗', 152900, 3);
INSERT INTO `fa_shopro_area` VALUES (152922, '阿拉善右旗', 152900, 3);
INSERT INTO `fa_shopro_area` VALUES (152923, '额济纳旗', 152900, 3);
INSERT INTO `fa_shopro_area` VALUES (210000, '辽宁省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (210100, '沈阳市', 210000, 2);
INSERT INTO `fa_shopro_area` VALUES (210102, '和平区', 210100, 3);
INSERT INTO `fa_shopro_area` VALUES (210103, '沈河区', 210100, 3);
INSERT INTO `fa_shopro_area` VALUES (210104, '大东区', 210100, 3);
INSERT INTO `fa_shopro_area` VALUES (210105, '皇姑区', 210100, 3);
INSERT INTO `fa_shopro_area` VALUES (210106, '铁西区', 210100, 3);
INSERT INTO `fa_shopro_area` VALUES (210111, '苏家屯区', 210100, 3);
INSERT INTO `fa_shopro_area` VALUES (210112, '浑南区', 210100, 3);
INSERT INTO `fa_shopro_area` VALUES (210113, '沈北新区', 210100, 3);
INSERT INTO `fa_shopro_area` VALUES (210114, '于洪区', 210100, 3);
INSERT INTO `fa_shopro_area` VALUES (210115, '辽中区', 210100, 3);
INSERT INTO `fa_shopro_area` VALUES (210123, '康平县', 210100, 3);
INSERT INTO `fa_shopro_area` VALUES (210124, '法库县', 210100, 3);
INSERT INTO `fa_shopro_area` VALUES (210181, '新民市', 210100, 3);
INSERT INTO `fa_shopro_area` VALUES (210200, '大连市', 210000, 2);
INSERT INTO `fa_shopro_area` VALUES (210202, '中山区', 210200, 3);
INSERT INTO `fa_shopro_area` VALUES (210203, '西岗区', 210200, 3);
INSERT INTO `fa_shopro_area` VALUES (210204, '沙河口区', 210200, 3);
INSERT INTO `fa_shopro_area` VALUES (210211, '甘井子区', 210200, 3);
INSERT INTO `fa_shopro_area` VALUES (210212, '旅顺口区', 210200, 3);
INSERT INTO `fa_shopro_area` VALUES (210213, '金州区', 210200, 3);
INSERT INTO `fa_shopro_area` VALUES (210214, '普兰店区', 210200, 3);
INSERT INTO `fa_shopro_area` VALUES (210224, '长海县', 210200, 3);
INSERT INTO `fa_shopro_area` VALUES (210281, '瓦房店市', 210200, 3);
INSERT INTO `fa_shopro_area` VALUES (210283, '庄河市', 210200, 3);
INSERT INTO `fa_shopro_area` VALUES (210300, '鞍山市', 210000, 2);
INSERT INTO `fa_shopro_area` VALUES (210302, '铁东区', 210300, 3);
INSERT INTO `fa_shopro_area` VALUES (210303, '铁西区', 210300, 3);
INSERT INTO `fa_shopro_area` VALUES (210304, '立山区', 210300, 3);
INSERT INTO `fa_shopro_area` VALUES (210311, '千山区', 210300, 3);
INSERT INTO `fa_shopro_area` VALUES (210321, '台安县', 210300, 3);
INSERT INTO `fa_shopro_area` VALUES (210323, '岫岩满族自治县', 210300, 3);
INSERT INTO `fa_shopro_area` VALUES (210381, '海城市', 210300, 3);
INSERT INTO `fa_shopro_area` VALUES (210400, '抚顺市', 210000, 2);
INSERT INTO `fa_shopro_area` VALUES (210402, '新抚区', 210400, 3);
INSERT INTO `fa_shopro_area` VALUES (210403, '东洲区', 210400, 3);
INSERT INTO `fa_shopro_area` VALUES (210404, '望花区', 210400, 3);
INSERT INTO `fa_shopro_area` VALUES (210411, '顺城区', 210400, 3);
INSERT INTO `fa_shopro_area` VALUES (210421, '抚顺县', 210400, 3);
INSERT INTO `fa_shopro_area` VALUES (210422, '新宾满族自治县', 210400, 3);
INSERT INTO `fa_shopro_area` VALUES (210423, '清原满族自治县', 210400, 3);
INSERT INTO `fa_shopro_area` VALUES (210500, '本溪市', 210000, 2);
INSERT INTO `fa_shopro_area` VALUES (210502, '平山区', 210500, 3);
INSERT INTO `fa_shopro_area` VALUES (210503, '溪湖区', 210500, 3);
INSERT INTO `fa_shopro_area` VALUES (210504, '明山区', 210500, 3);
INSERT INTO `fa_shopro_area` VALUES (210505, '南芬区', 210500, 3);
INSERT INTO `fa_shopro_area` VALUES (210521, '本溪满族自治县', 210500, 3);
INSERT INTO `fa_shopro_area` VALUES (210522, '桓仁满族自治县', 210500, 3);
INSERT INTO `fa_shopro_area` VALUES (210600, '丹东市', 210000, 2);
INSERT INTO `fa_shopro_area` VALUES (210602, '元宝区', 210600, 3);
INSERT INTO `fa_shopro_area` VALUES (210603, '振兴区', 210600, 3);
INSERT INTO `fa_shopro_area` VALUES (210604, '振安区', 210600, 3);
INSERT INTO `fa_shopro_area` VALUES (210624, '宽甸满族自治县', 210600, 3);
INSERT INTO `fa_shopro_area` VALUES (210681, '东港市', 210600, 3);
INSERT INTO `fa_shopro_area` VALUES (210682, '凤城市', 210600, 3);
INSERT INTO `fa_shopro_area` VALUES (210700, '锦州市', 210000, 2);
INSERT INTO `fa_shopro_area` VALUES (210702, '古塔区', 210700, 3);
INSERT INTO `fa_shopro_area` VALUES (210703, '凌河区', 210700, 3);
INSERT INTO `fa_shopro_area` VALUES (210711, '太和区', 210700, 3);
INSERT INTO `fa_shopro_area` VALUES (210726, '黑山县', 210700, 3);
INSERT INTO `fa_shopro_area` VALUES (210727, '义县', 210700, 3);
INSERT INTO `fa_shopro_area` VALUES (210781, '凌海市', 210700, 3);
INSERT INTO `fa_shopro_area` VALUES (210782, '北镇市', 210700, 3);
INSERT INTO `fa_shopro_area` VALUES (210800, '营口市', 210000, 2);
INSERT INTO `fa_shopro_area` VALUES (210802, '站前区', 210800, 3);
INSERT INTO `fa_shopro_area` VALUES (210803, '西市区', 210800, 3);
INSERT INTO `fa_shopro_area` VALUES (210804, '鲅鱼圈区', 210800, 3);
INSERT INTO `fa_shopro_area` VALUES (210811, '老边区', 210800, 3);
INSERT INTO `fa_shopro_area` VALUES (210881, '盖州市', 210800, 3);
INSERT INTO `fa_shopro_area` VALUES (210882, '大石桥市', 210800, 3);
INSERT INTO `fa_shopro_area` VALUES (210900, '阜新市', 210000, 2);
INSERT INTO `fa_shopro_area` VALUES (210902, '海州区', 210900, 3);
INSERT INTO `fa_shopro_area` VALUES (210903, '新邱区', 210900, 3);
INSERT INTO `fa_shopro_area` VALUES (210904, '太平区', 210900, 3);
INSERT INTO `fa_shopro_area` VALUES (210905, '清河门区', 210900, 3);
INSERT INTO `fa_shopro_area` VALUES (210911, '细河区', 210900, 3);
INSERT INTO `fa_shopro_area` VALUES (210921, '阜新蒙古族自治县', 210900, 3);
INSERT INTO `fa_shopro_area` VALUES (210922, '彰武县', 210900, 3);
INSERT INTO `fa_shopro_area` VALUES (211000, '辽阳市', 210000, 2);
INSERT INTO `fa_shopro_area` VALUES (211002, '白塔区', 211000, 3);
INSERT INTO `fa_shopro_area` VALUES (211003, '文圣区', 211000, 3);
INSERT INTO `fa_shopro_area` VALUES (211004, '宏伟区', 211000, 3);
INSERT INTO `fa_shopro_area` VALUES (211005, '弓长岭区', 211000, 3);
INSERT INTO `fa_shopro_area` VALUES (211011, '太子河区', 211000, 3);
INSERT INTO `fa_shopro_area` VALUES (211021, '辽阳县', 211000, 3);
INSERT INTO `fa_shopro_area` VALUES (211081, '灯塔市', 211000, 3);
INSERT INTO `fa_shopro_area` VALUES (211100, '盘锦市', 210000, 2);
INSERT INTO `fa_shopro_area` VALUES (211102, '双台子区', 211100, 3);
INSERT INTO `fa_shopro_area` VALUES (211103, '兴隆台区', 211100, 3);
INSERT INTO `fa_shopro_area` VALUES (211104, '大洼区', 211100, 3);
INSERT INTO `fa_shopro_area` VALUES (211122, '盘山县', 211100, 3);
INSERT INTO `fa_shopro_area` VALUES (211200, '铁岭市', 210000, 2);
INSERT INTO `fa_shopro_area` VALUES (211202, '银州区', 211200, 3);
INSERT INTO `fa_shopro_area` VALUES (211204, '清河区', 211200, 3);
INSERT INTO `fa_shopro_area` VALUES (211221, '铁岭县', 211200, 3);
INSERT INTO `fa_shopro_area` VALUES (211223, '西丰县', 211200, 3);
INSERT INTO `fa_shopro_area` VALUES (211224, '昌图县', 211200, 3);
INSERT INTO `fa_shopro_area` VALUES (211281, '调兵山市', 211200, 3);
INSERT INTO `fa_shopro_area` VALUES (211282, '开原市', 211200, 3);
INSERT INTO `fa_shopro_area` VALUES (211300, '朝阳市', 210000, 2);
INSERT INTO `fa_shopro_area` VALUES (211302, '双塔区', 211300, 3);
INSERT INTO `fa_shopro_area` VALUES (211303, '龙城区', 211300, 3);
INSERT INTO `fa_shopro_area` VALUES (211321, '朝阳县', 211300, 3);
INSERT INTO `fa_shopro_area` VALUES (211322, '建平县', 211300, 3);
INSERT INTO `fa_shopro_area` VALUES (211324, '喀喇沁左翼蒙古族自治县', 211300, 3);
INSERT INTO `fa_shopro_area` VALUES (211381, '北票市', 211300, 3);
INSERT INTO `fa_shopro_area` VALUES (211382, '凌源市', 211300, 3);
INSERT INTO `fa_shopro_area` VALUES (211400, '葫芦岛市', 210000, 2);
INSERT INTO `fa_shopro_area` VALUES (211402, '连山区', 211400, 3);
INSERT INTO `fa_shopro_area` VALUES (211403, '龙港区', 211400, 3);
INSERT INTO `fa_shopro_area` VALUES (211404, '南票区', 211400, 3);
INSERT INTO `fa_shopro_area` VALUES (211421, '绥中县', 211400, 3);
INSERT INTO `fa_shopro_area` VALUES (211422, '建昌县', 211400, 3);
INSERT INTO `fa_shopro_area` VALUES (211481, '兴城市', 211400, 3);
INSERT INTO `fa_shopro_area` VALUES (220000, '吉林省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (220100, '长春市', 220000, 2);
INSERT INTO `fa_shopro_area` VALUES (220102, '南关区', 220100, 3);
INSERT INTO `fa_shopro_area` VALUES (220103, '宽城区', 220100, 3);
INSERT INTO `fa_shopro_area` VALUES (220104, '朝阳区', 220100, 3);
INSERT INTO `fa_shopro_area` VALUES (220105, '二道区', 220100, 3);
INSERT INTO `fa_shopro_area` VALUES (220106, '绿园区', 220100, 3);
INSERT INTO `fa_shopro_area` VALUES (220112, '双阳区', 220100, 3);
INSERT INTO `fa_shopro_area` VALUES (220113, '九台区', 220100, 3);
INSERT INTO `fa_shopro_area` VALUES (220122, '农安县', 220100, 3);
INSERT INTO `fa_shopro_area` VALUES (220182, '榆树市', 220100, 3);
INSERT INTO `fa_shopro_area` VALUES (220183, '德惠市', 220100, 3);
INSERT INTO `fa_shopro_area` VALUES (220200, '吉林市', 220000, 2);
INSERT INTO `fa_shopro_area` VALUES (220202, '昌邑区', 220200, 3);
INSERT INTO `fa_shopro_area` VALUES (220203, '龙潭区', 220200, 3);
INSERT INTO `fa_shopro_area` VALUES (220204, '船营区', 220200, 3);
INSERT INTO `fa_shopro_area` VALUES (220211, '丰满区', 220200, 3);
INSERT INTO `fa_shopro_area` VALUES (220221, '永吉县', 220200, 3);
INSERT INTO `fa_shopro_area` VALUES (220281, '蛟河市', 220200, 3);
INSERT INTO `fa_shopro_area` VALUES (220282, '桦甸市', 220200, 3);
INSERT INTO `fa_shopro_area` VALUES (220283, '舒兰市', 220200, 3);
INSERT INTO `fa_shopro_area` VALUES (220284, '磐石市', 220200, 3);
INSERT INTO `fa_shopro_area` VALUES (220300, '四平市', 220000, 2);
INSERT INTO `fa_shopro_area` VALUES (220302, '铁西区', 220300, 3);
INSERT INTO `fa_shopro_area` VALUES (220303, '铁东区', 220300, 3);
INSERT INTO `fa_shopro_area` VALUES (220322, '梨树县', 220300, 3);
INSERT INTO `fa_shopro_area` VALUES (220323, '伊通满族自治县', 220300, 3);
INSERT INTO `fa_shopro_area` VALUES (220381, '公主岭市', 220300, 3);
INSERT INTO `fa_shopro_area` VALUES (220382, '双辽市', 220300, 3);
INSERT INTO `fa_shopro_area` VALUES (220400, '辽源市', 220000, 2);
INSERT INTO `fa_shopro_area` VALUES (220402, '龙山区', 220400, 3);
INSERT INTO `fa_shopro_area` VALUES (220403, '西安区', 220400, 3);
INSERT INTO `fa_shopro_area` VALUES (220421, '东丰县', 220400, 3);
INSERT INTO `fa_shopro_area` VALUES (220422, '东辽县', 220400, 3);
INSERT INTO `fa_shopro_area` VALUES (220500, '通化市', 220000, 2);
INSERT INTO `fa_shopro_area` VALUES (220502, '东昌区', 220500, 3);
INSERT INTO `fa_shopro_area` VALUES (220503, '二道江区', 220500, 3);
INSERT INTO `fa_shopro_area` VALUES (220521, '通化县', 220500, 3);
INSERT INTO `fa_shopro_area` VALUES (220523, '辉南县', 220500, 3);
INSERT INTO `fa_shopro_area` VALUES (220524, '柳河县', 220500, 3);
INSERT INTO `fa_shopro_area` VALUES (220581, '梅河口市', 220500, 3);
INSERT INTO `fa_shopro_area` VALUES (220582, '集安市', 220500, 3);
INSERT INTO `fa_shopro_area` VALUES (220600, '白山市', 220000, 2);
INSERT INTO `fa_shopro_area` VALUES (220602, '浑江区', 220600, 3);
INSERT INTO `fa_shopro_area` VALUES (220605, '江源区', 220600, 3);
INSERT INTO `fa_shopro_area` VALUES (220621, '抚松县', 220600, 3);
INSERT INTO `fa_shopro_area` VALUES (220622, '靖宇县', 220600, 3);
INSERT INTO `fa_shopro_area` VALUES (220623, '长白朝鲜族自治县', 220600, 3);
INSERT INTO `fa_shopro_area` VALUES (220681, '临江市', 220600, 3);
INSERT INTO `fa_shopro_area` VALUES (220700, '松原市', 220000, 2);
INSERT INTO `fa_shopro_area` VALUES (220702, '宁江区', 220700, 3);
INSERT INTO `fa_shopro_area` VALUES (220721, '前郭尔罗斯蒙古族自治县', 220700, 3);
INSERT INTO `fa_shopro_area` VALUES (220722, '长岭县', 220700, 3);
INSERT INTO `fa_shopro_area` VALUES (220723, '乾安县', 220700, 3);
INSERT INTO `fa_shopro_area` VALUES (220781, '扶余市', 220700, 3);
INSERT INTO `fa_shopro_area` VALUES (220800, '白城市', 220000, 2);
INSERT INTO `fa_shopro_area` VALUES (220802, '洮北区', 220800, 3);
INSERT INTO `fa_shopro_area` VALUES (220821, '镇赉县', 220800, 3);
INSERT INTO `fa_shopro_area` VALUES (220822, '通榆县', 220800, 3);
INSERT INTO `fa_shopro_area` VALUES (220881, '洮南市', 220800, 3);
INSERT INTO `fa_shopro_area` VALUES (220882, '大安市', 220800, 3);
INSERT INTO `fa_shopro_area` VALUES (222400, '延边朝鲜族自治州', 220000, 2);
INSERT INTO `fa_shopro_area` VALUES (222401, '延吉市', 222400, 3);
INSERT INTO `fa_shopro_area` VALUES (222402, '图们市', 222400, 3);
INSERT INTO `fa_shopro_area` VALUES (222403, '敦化市', 222400, 3);
INSERT INTO `fa_shopro_area` VALUES (222404, '珲春市', 222400, 3);
INSERT INTO `fa_shopro_area` VALUES (222405, '龙井市', 222400, 3);
INSERT INTO `fa_shopro_area` VALUES (222406, '和龙市', 222400, 3);
INSERT INTO `fa_shopro_area` VALUES (222424, '汪清县', 222400, 3);
INSERT INTO `fa_shopro_area` VALUES (222426, '安图县', 222400, 3);
INSERT INTO `fa_shopro_area` VALUES (230000, '黑龙江省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (230100, '哈尔滨市', 230000, 2);
INSERT INTO `fa_shopro_area` VALUES (230102, '道里区', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230103, '南岗区', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230104, '道外区', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230108, '平房区', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230109, '松北区', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230110, '香坊区', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230111, '呼兰区', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230112, '阿城区', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230113, '双城区', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230123, '依兰县', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230124, '方正县', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230125, '宾县', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230126, '巴彦县', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230127, '木兰县', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230128, '通河县', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230129, '延寿县', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230183, '尚志市', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230184, '五常市', 230100, 3);
INSERT INTO `fa_shopro_area` VALUES (230200, '齐齐哈尔市', 230000, 2);
INSERT INTO `fa_shopro_area` VALUES (230202, '龙沙区', 230200, 3);
INSERT INTO `fa_shopro_area` VALUES (230203, '建华区', 230200, 3);
INSERT INTO `fa_shopro_area` VALUES (230204, '铁锋区', 230200, 3);
INSERT INTO `fa_shopro_area` VALUES (230205, '昂昂溪区', 230200, 3);
INSERT INTO `fa_shopro_area` VALUES (230206, '富拉尔基区', 230200, 3);
INSERT INTO `fa_shopro_area` VALUES (230207, '碾子山区', 230200, 3);
INSERT INTO `fa_shopro_area` VALUES (230208, '梅里斯达斡尔族区', 230200, 3);
INSERT INTO `fa_shopro_area` VALUES (230221, '龙江县', 230200, 3);
INSERT INTO `fa_shopro_area` VALUES (230223, '依安县', 230200, 3);
INSERT INTO `fa_shopro_area` VALUES (230224, '泰来县', 230200, 3);
INSERT INTO `fa_shopro_area` VALUES (230225, '甘南县', 230200, 3);
INSERT INTO `fa_shopro_area` VALUES (230227, '富裕县', 230200, 3);
INSERT INTO `fa_shopro_area` VALUES (230229, '克山县', 230200, 3);
INSERT INTO `fa_shopro_area` VALUES (230230, '克东县', 230200, 3);
INSERT INTO `fa_shopro_area` VALUES (230231, '拜泉县', 230200, 3);
INSERT INTO `fa_shopro_area` VALUES (230281, '讷河市', 230200, 3);
INSERT INTO `fa_shopro_area` VALUES (230300, '鸡西市', 230000, 2);
INSERT INTO `fa_shopro_area` VALUES (230302, '鸡冠区', 230300, 3);
INSERT INTO `fa_shopro_area` VALUES (230303, '恒山区', 230300, 3);
INSERT INTO `fa_shopro_area` VALUES (230304, '滴道区', 230300, 3);
INSERT INTO `fa_shopro_area` VALUES (230305, '梨树区', 230300, 3);
INSERT INTO `fa_shopro_area` VALUES (230306, '城子河区', 230300, 3);
INSERT INTO `fa_shopro_area` VALUES (230307, '麻山区', 230300, 3);
INSERT INTO `fa_shopro_area` VALUES (230321, '鸡东县', 230300, 3);
INSERT INTO `fa_shopro_area` VALUES (230381, '虎林市', 230300, 3);
INSERT INTO `fa_shopro_area` VALUES (230382, '密山市', 230300, 3);
INSERT INTO `fa_shopro_area` VALUES (230400, '鹤岗市', 230000, 2);
INSERT INTO `fa_shopro_area` VALUES (230402, '向阳区', 230400, 3);
INSERT INTO `fa_shopro_area` VALUES (230403, '工农区', 230400, 3);
INSERT INTO `fa_shopro_area` VALUES (230404, '南山区', 230400, 3);
INSERT INTO `fa_shopro_area` VALUES (230405, '兴安区', 230400, 3);
INSERT INTO `fa_shopro_area` VALUES (230406, '东山区', 230400, 3);
INSERT INTO `fa_shopro_area` VALUES (230407, '兴山区', 230400, 3);
INSERT INTO `fa_shopro_area` VALUES (230421, '萝北县', 230400, 3);
INSERT INTO `fa_shopro_area` VALUES (230422, '绥滨县', 230400, 3);
INSERT INTO `fa_shopro_area` VALUES (230500, '双鸭山市', 230000, 2);
INSERT INTO `fa_shopro_area` VALUES (230502, '尖山区', 230500, 3);
INSERT INTO `fa_shopro_area` VALUES (230503, '岭东区', 230500, 3);
INSERT INTO `fa_shopro_area` VALUES (230505, '四方台区', 230500, 3);
INSERT INTO `fa_shopro_area` VALUES (230506, '宝山区', 230500, 3);
INSERT INTO `fa_shopro_area` VALUES (230521, '集贤县', 230500, 3);
INSERT INTO `fa_shopro_area` VALUES (230522, '友谊县', 230500, 3);
INSERT INTO `fa_shopro_area` VALUES (230523, '宝清县', 230500, 3);
INSERT INTO `fa_shopro_area` VALUES (230524, '饶河县', 230500, 3);
INSERT INTO `fa_shopro_area` VALUES (230600, '大庆市', 230000, 2);
INSERT INTO `fa_shopro_area` VALUES (230602, '萨尔图区', 230600, 3);
INSERT INTO `fa_shopro_area` VALUES (230603, '龙凤区', 230600, 3);
INSERT INTO `fa_shopro_area` VALUES (230604, '让胡路区', 230600, 3);
INSERT INTO `fa_shopro_area` VALUES (230605, '红岗区', 230600, 3);
INSERT INTO `fa_shopro_area` VALUES (230606, '大同区', 230600, 3);
INSERT INTO `fa_shopro_area` VALUES (230621, '肇州县', 230600, 3);
INSERT INTO `fa_shopro_area` VALUES (230622, '肇源县', 230600, 3);
INSERT INTO `fa_shopro_area` VALUES (230623, '林甸县', 230600, 3);
INSERT INTO `fa_shopro_area` VALUES (230624, '杜尔伯特蒙古族自治县', 230600, 3);
INSERT INTO `fa_shopro_area` VALUES (230700, '伊春市', 230000, 2);
INSERT INTO `fa_shopro_area` VALUES (230702, '伊春区', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230703, '南岔区', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230704, '友好区', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230705, '西林区', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230706, '翠峦区', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230707, '新青区', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230708, '美溪区', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230709, '金山屯区', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230710, '五营区', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230711, '乌马河区', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230712, '汤旺河区', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230713, '带岭区', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230714, '乌伊岭区', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230715, '红星区', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230716, '上甘岭区', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230722, '嘉荫县', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230781, '铁力市', 230700, 3);
INSERT INTO `fa_shopro_area` VALUES (230800, '佳木斯市', 230000, 2);
INSERT INTO `fa_shopro_area` VALUES (230803, '向阳区', 230800, 3);
INSERT INTO `fa_shopro_area` VALUES (230804, '前进区', 230800, 3);
INSERT INTO `fa_shopro_area` VALUES (230805, '东风区', 230800, 3);
INSERT INTO `fa_shopro_area` VALUES (230811, '郊区', 230800, 3);
INSERT INTO `fa_shopro_area` VALUES (230822, '桦南县', 230800, 3);
INSERT INTO `fa_shopro_area` VALUES (230826, '桦川县', 230800, 3);
INSERT INTO `fa_shopro_area` VALUES (230828, '汤原县', 230800, 3);
INSERT INTO `fa_shopro_area` VALUES (230881, '同江市', 230800, 3);
INSERT INTO `fa_shopro_area` VALUES (230882, '富锦市', 230800, 3);
INSERT INTO `fa_shopro_area` VALUES (230883, '抚远市', 230800, 3);
INSERT INTO `fa_shopro_area` VALUES (230900, '七台河市', 230000, 2);
INSERT INTO `fa_shopro_area` VALUES (230902, '新兴区', 230900, 3);
INSERT INTO `fa_shopro_area` VALUES (230903, '桃山区', 230900, 3);
INSERT INTO `fa_shopro_area` VALUES (230904, '茄子河区', 230900, 3);
INSERT INTO `fa_shopro_area` VALUES (230921, '勃利县', 230900, 3);
INSERT INTO `fa_shopro_area` VALUES (231000, '牡丹江市', 230000, 2);
INSERT INTO `fa_shopro_area` VALUES (231002, '东安区', 231000, 3);
INSERT INTO `fa_shopro_area` VALUES (231003, '阳明区', 231000, 3);
INSERT INTO `fa_shopro_area` VALUES (231004, '爱民区', 231000, 3);
INSERT INTO `fa_shopro_area` VALUES (231005, '西安区', 231000, 3);
INSERT INTO `fa_shopro_area` VALUES (231025, '林口县', 231000, 3);
INSERT INTO `fa_shopro_area` VALUES (231081, '绥芬河市', 231000, 3);
INSERT INTO `fa_shopro_area` VALUES (231083, '海林市', 231000, 3);
INSERT INTO `fa_shopro_area` VALUES (231084, '宁安市', 231000, 3);
INSERT INTO `fa_shopro_area` VALUES (231085, '穆棱市', 231000, 3);
INSERT INTO `fa_shopro_area` VALUES (231086, '东宁市', 231000, 3);
INSERT INTO `fa_shopro_area` VALUES (231100, '黑河市', 230000, 2);
INSERT INTO `fa_shopro_area` VALUES (231102, '爱辉区', 231100, 3);
INSERT INTO `fa_shopro_area` VALUES (231121, '嫩江县', 231100, 3);
INSERT INTO `fa_shopro_area` VALUES (231123, '逊克县', 231100, 3);
INSERT INTO `fa_shopro_area` VALUES (231124, '孙吴县', 231100, 3);
INSERT INTO `fa_shopro_area` VALUES (231181, '北安市', 231100, 3);
INSERT INTO `fa_shopro_area` VALUES (231182, '五大连池市', 231100, 3);
INSERT INTO `fa_shopro_area` VALUES (231200, '绥化市', 230000, 2);
INSERT INTO `fa_shopro_area` VALUES (231202, '北林区', 231200, 3);
INSERT INTO `fa_shopro_area` VALUES (231221, '望奎县', 231200, 3);
INSERT INTO `fa_shopro_area` VALUES (231222, '兰西县', 231200, 3);
INSERT INTO `fa_shopro_area` VALUES (231223, '青冈县', 231200, 3);
INSERT INTO `fa_shopro_area` VALUES (231224, '庆安县', 231200, 3);
INSERT INTO `fa_shopro_area` VALUES (231225, '明水县', 231200, 3);
INSERT INTO `fa_shopro_area` VALUES (231226, '绥棱县', 231200, 3);
INSERT INTO `fa_shopro_area` VALUES (231281, '安达市', 231200, 3);
INSERT INTO `fa_shopro_area` VALUES (231282, '肇东市', 231200, 3);
INSERT INTO `fa_shopro_area` VALUES (231283, '海伦市', 231200, 3);
INSERT INTO `fa_shopro_area` VALUES (232700, '大兴安岭地区', 230000, 2);
INSERT INTO `fa_shopro_area` VALUES (232701, '加格达奇区', 232700, 3);
INSERT INTO `fa_shopro_area` VALUES (232702, '松岭区', 232700, 3);
INSERT INTO `fa_shopro_area` VALUES (232703, '新林区', 232700, 3);
INSERT INTO `fa_shopro_area` VALUES (232704, '呼中区', 232700, 3);
INSERT INTO `fa_shopro_area` VALUES (232721, '呼玛县', 232700, 3);
INSERT INTO `fa_shopro_area` VALUES (232722, '塔河县', 232700, 3);
INSERT INTO `fa_shopro_area` VALUES (232723, '漠河县', 232700, 3);
INSERT INTO `fa_shopro_area` VALUES (310000, '上海市', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (310100, '上海市', 310000, 2);
INSERT INTO `fa_shopro_area` VALUES (310101, '黄浦区', 310100, 3);
INSERT INTO `fa_shopro_area` VALUES (310104, '徐汇区', 310100, 3);
INSERT INTO `fa_shopro_area` VALUES (310105, '长宁区', 310100, 3);
INSERT INTO `fa_shopro_area` VALUES (310106, '静安区', 310100, 3);
INSERT INTO `fa_shopro_area` VALUES (310107, '普陀区', 310100, 3);
INSERT INTO `fa_shopro_area` VALUES (310109, '虹口区', 310100, 3);
INSERT INTO `fa_shopro_area` VALUES (310110, '杨浦区', 310100, 3);
INSERT INTO `fa_shopro_area` VALUES (310112, '闵行区', 310100, 3);
INSERT INTO `fa_shopro_area` VALUES (310113, '宝山区', 310100, 3);
INSERT INTO `fa_shopro_area` VALUES (310114, '嘉定区', 310100, 3);
INSERT INTO `fa_shopro_area` VALUES (310115, '浦东新区', 310100, 3);
INSERT INTO `fa_shopro_area` VALUES (310116, '金山区', 310100, 3);
INSERT INTO `fa_shopro_area` VALUES (310117, '松江区', 310100, 3);
INSERT INTO `fa_shopro_area` VALUES (310118, '青浦区', 310100, 3);
INSERT INTO `fa_shopro_area` VALUES (310120, '奉贤区', 310100, 3);
INSERT INTO `fa_shopro_area` VALUES (310151, '崇明区', 310100, 3);
INSERT INTO `fa_shopro_area` VALUES (320000, '江苏省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (320100, '南京市', 320000, 2);
INSERT INTO `fa_shopro_area` VALUES (320102, '玄武区', 320100, 3);
INSERT INTO `fa_shopro_area` VALUES (320104, '秦淮区', 320100, 3);
INSERT INTO `fa_shopro_area` VALUES (320105, '建邺区', 320100, 3);
INSERT INTO `fa_shopro_area` VALUES (320106, '鼓楼区', 320100, 3);
INSERT INTO `fa_shopro_area` VALUES (320111, '浦口区', 320100, 3);
INSERT INTO `fa_shopro_area` VALUES (320113, '栖霞区', 320100, 3);
INSERT INTO `fa_shopro_area` VALUES (320114, '雨花台区', 320100, 3);
INSERT INTO `fa_shopro_area` VALUES (320115, '江宁区', 320100, 3);
INSERT INTO `fa_shopro_area` VALUES (320116, '六合区', 320100, 3);
INSERT INTO `fa_shopro_area` VALUES (320117, '溧水区', 320100, 3);
INSERT INTO `fa_shopro_area` VALUES (320118, '高淳区', 320100, 3);
INSERT INTO `fa_shopro_area` VALUES (320200, '无锡市', 320000, 2);
INSERT INTO `fa_shopro_area` VALUES (320205, '锡山区', 320200, 3);
INSERT INTO `fa_shopro_area` VALUES (320206, '惠山区', 320200, 3);
INSERT INTO `fa_shopro_area` VALUES (320211, '滨湖区', 320200, 3);
INSERT INTO `fa_shopro_area` VALUES (320213, '梁溪区', 320200, 3);
INSERT INTO `fa_shopro_area` VALUES (320214, '新吴区', 320200, 3);
INSERT INTO `fa_shopro_area` VALUES (320281, '江阴市', 320200, 3);
INSERT INTO `fa_shopro_area` VALUES (320282, '宜兴市', 320200, 3);
INSERT INTO `fa_shopro_area` VALUES (320300, '徐州市', 320000, 2);
INSERT INTO `fa_shopro_area` VALUES (320302, '鼓楼区', 320300, 3);
INSERT INTO `fa_shopro_area` VALUES (320303, '云龙区', 320300, 3);
INSERT INTO `fa_shopro_area` VALUES (320305, '贾汪区', 320300, 3);
INSERT INTO `fa_shopro_area` VALUES (320311, '泉山区', 320300, 3);
INSERT INTO `fa_shopro_area` VALUES (320312, '铜山区', 320300, 3);
INSERT INTO `fa_shopro_area` VALUES (320321, '丰县', 320300, 3);
INSERT INTO `fa_shopro_area` VALUES (320322, '沛县', 320300, 3);
INSERT INTO `fa_shopro_area` VALUES (320324, '睢宁县', 320300, 3);
INSERT INTO `fa_shopro_area` VALUES (320381, '新沂市', 320300, 3);
INSERT INTO `fa_shopro_area` VALUES (320382, '邳州市', 320300, 3);
INSERT INTO `fa_shopro_area` VALUES (320400, '常州市', 320000, 2);
INSERT INTO `fa_shopro_area` VALUES (320402, '天宁区', 320400, 3);
INSERT INTO `fa_shopro_area` VALUES (320404, '钟楼区', 320400, 3);
INSERT INTO `fa_shopro_area` VALUES (320411, '新北区', 320400, 3);
INSERT INTO `fa_shopro_area` VALUES (320412, '武进区', 320400, 3);
INSERT INTO `fa_shopro_area` VALUES (320413, '金坛区', 320400, 3);
INSERT INTO `fa_shopro_area` VALUES (320481, '溧阳市', 320400, 3);
INSERT INTO `fa_shopro_area` VALUES (320500, '苏州市', 320000, 2);
INSERT INTO `fa_shopro_area` VALUES (320505, '虎丘区', 320500, 3);
INSERT INTO `fa_shopro_area` VALUES (320506, '吴中区', 320500, 3);
INSERT INTO `fa_shopro_area` VALUES (320507, '相城区', 320500, 3);
INSERT INTO `fa_shopro_area` VALUES (320508, '姑苏区', 320500, 3);
INSERT INTO `fa_shopro_area` VALUES (320509, '吴江区', 320500, 3);
INSERT INTO `fa_shopro_area` VALUES (320581, '常熟市', 320500, 3);
INSERT INTO `fa_shopro_area` VALUES (320582, '张家港市', 320500, 3);
INSERT INTO `fa_shopro_area` VALUES (320583, '昆山市', 320500, 3);
INSERT INTO `fa_shopro_area` VALUES (320585, '太仓市', 320500, 3);
INSERT INTO `fa_shopro_area` VALUES (320600, '南通市', 320000, 2);
INSERT INTO `fa_shopro_area` VALUES (320602, '崇川区', 320600, 3);
INSERT INTO `fa_shopro_area` VALUES (320611, '港闸区', 320600, 3);
INSERT INTO `fa_shopro_area` VALUES (320612, '通州区', 320600, 3);
INSERT INTO `fa_shopro_area` VALUES (320621, '海安县', 320600, 3);
INSERT INTO `fa_shopro_area` VALUES (320623, '如东县', 320600, 3);
INSERT INTO `fa_shopro_area` VALUES (320681, '启东市', 320600, 3);
INSERT INTO `fa_shopro_area` VALUES (320682, '如皋市', 320600, 3);
INSERT INTO `fa_shopro_area` VALUES (320684, '海门市', 320600, 3);
INSERT INTO `fa_shopro_area` VALUES (320700, '连云港市', 320000, 2);
INSERT INTO `fa_shopro_area` VALUES (320703, '连云区', 320700, 3);
INSERT INTO `fa_shopro_area` VALUES (320706, '海州区', 320700, 3);
INSERT INTO `fa_shopro_area` VALUES (320707, '赣榆区', 320700, 3);
INSERT INTO `fa_shopro_area` VALUES (320722, '东海县', 320700, 3);
INSERT INTO `fa_shopro_area` VALUES (320723, '灌云县', 320700, 3);
INSERT INTO `fa_shopro_area` VALUES (320724, '灌南县', 320700, 3);
INSERT INTO `fa_shopro_area` VALUES (320800, '淮安市', 320000, 2);
INSERT INTO `fa_shopro_area` VALUES (320803, '淮安区', 320800, 3);
INSERT INTO `fa_shopro_area` VALUES (320804, '淮阴区', 320800, 3);
INSERT INTO `fa_shopro_area` VALUES (320812, '清江浦区', 320800, 3);
INSERT INTO `fa_shopro_area` VALUES (320813, '洪泽区', 320800, 3);
INSERT INTO `fa_shopro_area` VALUES (320826, '涟水县', 320800, 3);
INSERT INTO `fa_shopro_area` VALUES (320830, '盱眙县', 320800, 3);
INSERT INTO `fa_shopro_area` VALUES (320831, '金湖县', 320800, 3);
INSERT INTO `fa_shopro_area` VALUES (320900, '盐城市', 320000, 2);
INSERT INTO `fa_shopro_area` VALUES (320902, '亭湖区', 320900, 3);
INSERT INTO `fa_shopro_area` VALUES (320903, '盐都区', 320900, 3);
INSERT INTO `fa_shopro_area` VALUES (320904, '大丰区', 320900, 3);
INSERT INTO `fa_shopro_area` VALUES (320921, '响水县', 320900, 3);
INSERT INTO `fa_shopro_area` VALUES (320922, '滨海县', 320900, 3);
INSERT INTO `fa_shopro_area` VALUES (320923, '阜宁县', 320900, 3);
INSERT INTO `fa_shopro_area` VALUES (320924, '射阳县', 320900, 3);
INSERT INTO `fa_shopro_area` VALUES (320925, '建湖县', 320900, 3);
INSERT INTO `fa_shopro_area` VALUES (320981, '东台市', 320900, 3);
INSERT INTO `fa_shopro_area` VALUES (321000, '扬州市', 320000, 2);
INSERT INTO `fa_shopro_area` VALUES (321002, '广陵区', 321000, 3);
INSERT INTO `fa_shopro_area` VALUES (321003, '邗江区', 321000, 3);
INSERT INTO `fa_shopro_area` VALUES (321012, '江都区', 321000, 3);
INSERT INTO `fa_shopro_area` VALUES (321023, '宝应县', 321000, 3);
INSERT INTO `fa_shopro_area` VALUES (321081, '仪征市', 321000, 3);
INSERT INTO `fa_shopro_area` VALUES (321084, '高邮市', 321000, 3);
INSERT INTO `fa_shopro_area` VALUES (321100, '镇江市', 320000, 2);
INSERT INTO `fa_shopro_area` VALUES (321102, '京口区', 321100, 3);
INSERT INTO `fa_shopro_area` VALUES (321111, '润州区', 321100, 3);
INSERT INTO `fa_shopro_area` VALUES (321112, '丹徒区', 321100, 3);
INSERT INTO `fa_shopro_area` VALUES (321181, '丹阳市', 321100, 3);
INSERT INTO `fa_shopro_area` VALUES (321182, '扬中市', 321100, 3);
INSERT INTO `fa_shopro_area` VALUES (321183, '句容市', 321100, 3);
INSERT INTO `fa_shopro_area` VALUES (321200, '泰州市', 320000, 2);
INSERT INTO `fa_shopro_area` VALUES (321202, '海陵区', 321200, 3);
INSERT INTO `fa_shopro_area` VALUES (321203, '高港区', 321200, 3);
INSERT INTO `fa_shopro_area` VALUES (321204, '姜堰区', 321200, 3);
INSERT INTO `fa_shopro_area` VALUES (321281, '兴化市', 321200, 3);
INSERT INTO `fa_shopro_area` VALUES (321282, '靖江市', 321200, 3);
INSERT INTO `fa_shopro_area` VALUES (321283, '泰兴市', 321200, 3);
INSERT INTO `fa_shopro_area` VALUES (321300, '宿迁市', 320000, 2);
INSERT INTO `fa_shopro_area` VALUES (321302, '宿城区', 321300, 3);
INSERT INTO `fa_shopro_area` VALUES (321311, '宿豫区', 321300, 3);
INSERT INTO `fa_shopro_area` VALUES (321322, '沭阳县', 321300, 3);
INSERT INTO `fa_shopro_area` VALUES (321323, '泗阳县', 321300, 3);
INSERT INTO `fa_shopro_area` VALUES (321324, '泗洪县', 321300, 3);
INSERT INTO `fa_shopro_area` VALUES (330000, '浙江省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (330100, '杭州市', 330000, 2);
INSERT INTO `fa_shopro_area` VALUES (330102, '上城区', 330100, 3);
INSERT INTO `fa_shopro_area` VALUES (330103, '下城区', 330100, 3);
INSERT INTO `fa_shopro_area` VALUES (330104, '江干区', 330100, 3);
INSERT INTO `fa_shopro_area` VALUES (330105, '拱墅区', 330100, 3);
INSERT INTO `fa_shopro_area` VALUES (330106, '西湖区', 330100, 3);
INSERT INTO `fa_shopro_area` VALUES (330108, '滨江区', 330100, 3);
INSERT INTO `fa_shopro_area` VALUES (330109, '萧山区', 330100, 3);
INSERT INTO `fa_shopro_area` VALUES (330110, '余杭区', 330100, 3);
INSERT INTO `fa_shopro_area` VALUES (330111, '富阳区', 330100, 3);
INSERT INTO `fa_shopro_area` VALUES (330112, '临安区', 330100, 3);
INSERT INTO `fa_shopro_area` VALUES (330122, '桐庐县', 330100, 3);
INSERT INTO `fa_shopro_area` VALUES (330127, '淳安县', 330100, 3);
INSERT INTO `fa_shopro_area` VALUES (330182, '建德市', 330100, 3);
INSERT INTO `fa_shopro_area` VALUES (330200, '宁波市', 330000, 2);
INSERT INTO `fa_shopro_area` VALUES (330203, '海曙区', 330200, 3);
INSERT INTO `fa_shopro_area` VALUES (330205, '江北区', 330200, 3);
INSERT INTO `fa_shopro_area` VALUES (330206, '北仑区', 330200, 3);
INSERT INTO `fa_shopro_area` VALUES (330211, '镇海区', 330200, 3);
INSERT INTO `fa_shopro_area` VALUES (330212, '鄞州区', 330200, 3);
INSERT INTO `fa_shopro_area` VALUES (330213, '奉化区', 330200, 3);
INSERT INTO `fa_shopro_area` VALUES (330225, '象山县', 330200, 3);
INSERT INTO `fa_shopro_area` VALUES (330226, '宁海县', 330200, 3);
INSERT INTO `fa_shopro_area` VALUES (330281, '余姚市', 330200, 3);
INSERT INTO `fa_shopro_area` VALUES (330282, '慈溪市', 330200, 3);
INSERT INTO `fa_shopro_area` VALUES (330300, '温州市', 330000, 2);
INSERT INTO `fa_shopro_area` VALUES (330302, '鹿城区', 330300, 3);
INSERT INTO `fa_shopro_area` VALUES (330303, '龙湾区', 330300, 3);
INSERT INTO `fa_shopro_area` VALUES (330304, '瓯海区', 330300, 3);
INSERT INTO `fa_shopro_area` VALUES (330305, '洞头区', 330300, 3);
INSERT INTO `fa_shopro_area` VALUES (330324, '永嘉县', 330300, 3);
INSERT INTO `fa_shopro_area` VALUES (330326, '平阳县', 330300, 3);
INSERT INTO `fa_shopro_area` VALUES (330327, '苍南县', 330300, 3);
INSERT INTO `fa_shopro_area` VALUES (330328, '文成县', 330300, 3);
INSERT INTO `fa_shopro_area` VALUES (330329, '泰顺县', 330300, 3);
INSERT INTO `fa_shopro_area` VALUES (330381, '瑞安市', 330300, 3);
INSERT INTO `fa_shopro_area` VALUES (330382, '乐清市', 330300, 3);
INSERT INTO `fa_shopro_area` VALUES (330400, '嘉兴市', 330000, 2);
INSERT INTO `fa_shopro_area` VALUES (330402, '南湖区', 330400, 3);
INSERT INTO `fa_shopro_area` VALUES (330411, '秀洲区', 330400, 3);
INSERT INTO `fa_shopro_area` VALUES (330421, '嘉善县', 330400, 3);
INSERT INTO `fa_shopro_area` VALUES (330424, '海盐县', 330400, 3);
INSERT INTO `fa_shopro_area` VALUES (330481, '海宁市', 330400, 3);
INSERT INTO `fa_shopro_area` VALUES (330482, '平湖市', 330400, 3);
INSERT INTO `fa_shopro_area` VALUES (330483, '桐乡市', 330400, 3);
INSERT INTO `fa_shopro_area` VALUES (330500, '湖州市', 330000, 2);
INSERT INTO `fa_shopro_area` VALUES (330502, '吴兴区', 330500, 3);
INSERT INTO `fa_shopro_area` VALUES (330503, '南浔区', 330500, 3);
INSERT INTO `fa_shopro_area` VALUES (330521, '德清县', 330500, 3);
INSERT INTO `fa_shopro_area` VALUES (330522, '长兴县', 330500, 3);
INSERT INTO `fa_shopro_area` VALUES (330523, '安吉县', 330500, 3);
INSERT INTO `fa_shopro_area` VALUES (330600, '绍兴市', 330000, 2);
INSERT INTO `fa_shopro_area` VALUES (330602, '越城区', 330600, 3);
INSERT INTO `fa_shopro_area` VALUES (330603, '柯桥区', 330600, 3);
INSERT INTO `fa_shopro_area` VALUES (330604, '上虞区', 330600, 3);
INSERT INTO `fa_shopro_area` VALUES (330624, '新昌县', 330600, 3);
INSERT INTO `fa_shopro_area` VALUES (330681, '诸暨市', 330600, 3);
INSERT INTO `fa_shopro_area` VALUES (330683, '嵊州市', 330600, 3);
INSERT INTO `fa_shopro_area` VALUES (330700, '金华市', 330000, 2);
INSERT INTO `fa_shopro_area` VALUES (330702, '婺城区', 330700, 3);
INSERT INTO `fa_shopro_area` VALUES (330703, '金东区', 330700, 3);
INSERT INTO `fa_shopro_area` VALUES (330723, '武义县', 330700, 3);
INSERT INTO `fa_shopro_area` VALUES (330726, '浦江县', 330700, 3);
INSERT INTO `fa_shopro_area` VALUES (330727, '磐安县', 330700, 3);
INSERT INTO `fa_shopro_area` VALUES (330781, '兰溪市', 330700, 3);
INSERT INTO `fa_shopro_area` VALUES (330782, '义乌市', 330700, 3);
INSERT INTO `fa_shopro_area` VALUES (330783, '东阳市', 330700, 3);
INSERT INTO `fa_shopro_area` VALUES (330784, '永康市', 330700, 3);
INSERT INTO `fa_shopro_area` VALUES (330800, '衢州市', 330000, 2);
INSERT INTO `fa_shopro_area` VALUES (330802, '柯城区', 330800, 3);
INSERT INTO `fa_shopro_area` VALUES (330803, '衢江区', 330800, 3);
INSERT INTO `fa_shopro_area` VALUES (330822, '常山县', 330800, 3);
INSERT INTO `fa_shopro_area` VALUES (330824, '开化县', 330800, 3);
INSERT INTO `fa_shopro_area` VALUES (330825, '龙游县', 330800, 3);
INSERT INTO `fa_shopro_area` VALUES (330881, '江山市', 330800, 3);
INSERT INTO `fa_shopro_area` VALUES (330900, '舟山市', 330000, 2);
INSERT INTO `fa_shopro_area` VALUES (330902, '定海区', 330900, 3);
INSERT INTO `fa_shopro_area` VALUES (330903, '普陀区', 330900, 3);
INSERT INTO `fa_shopro_area` VALUES (330921, '岱山县', 330900, 3);
INSERT INTO `fa_shopro_area` VALUES (330922, '嵊泗县', 330900, 3);
INSERT INTO `fa_shopro_area` VALUES (331000, '台州市', 330000, 2);
INSERT INTO `fa_shopro_area` VALUES (331002, '椒江区', 331000, 3);
INSERT INTO `fa_shopro_area` VALUES (331003, '黄岩区', 331000, 3);
INSERT INTO `fa_shopro_area` VALUES (331004, '路桥区', 331000, 3);
INSERT INTO `fa_shopro_area` VALUES (331022, '三门县', 331000, 3);
INSERT INTO `fa_shopro_area` VALUES (331023, '天台县', 331000, 3);
INSERT INTO `fa_shopro_area` VALUES (331024, '仙居县', 331000, 3);
INSERT INTO `fa_shopro_area` VALUES (331081, '温岭市', 331000, 3);
INSERT INTO `fa_shopro_area` VALUES (331082, '临海市', 331000, 3);
INSERT INTO `fa_shopro_area` VALUES (331083, '玉环市', 331000, 3);
INSERT INTO `fa_shopro_area` VALUES (331100, '丽水市', 330000, 2);
INSERT INTO `fa_shopro_area` VALUES (331102, '莲都区', 331100, 3);
INSERT INTO `fa_shopro_area` VALUES (331121, '青田县', 331100, 3);
INSERT INTO `fa_shopro_area` VALUES (331122, '缙云县', 331100, 3);
INSERT INTO `fa_shopro_area` VALUES (331123, '遂昌县', 331100, 3);
INSERT INTO `fa_shopro_area` VALUES (331124, '松阳县', 331100, 3);
INSERT INTO `fa_shopro_area` VALUES (331125, '云和县', 331100, 3);
INSERT INTO `fa_shopro_area` VALUES (331126, '庆元县', 331100, 3);
INSERT INTO `fa_shopro_area` VALUES (331127, '景宁畲族自治县', 331100, 3);
INSERT INTO `fa_shopro_area` VALUES (331181, '龙泉市', 331100, 3);
INSERT INTO `fa_shopro_area` VALUES (340000, '安徽省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (340100, '合肥市', 340000, 2);
INSERT INTO `fa_shopro_area` VALUES (340102, '瑶海区', 340100, 3);
INSERT INTO `fa_shopro_area` VALUES (340103, '庐阳区', 340100, 3);
INSERT INTO `fa_shopro_area` VALUES (340104, '蜀山区', 340100, 3);
INSERT INTO `fa_shopro_area` VALUES (340111, '包河区', 340100, 3);
INSERT INTO `fa_shopro_area` VALUES (340121, '长丰县', 340100, 3);
INSERT INTO `fa_shopro_area` VALUES (340122, '肥东县', 340100, 3);
INSERT INTO `fa_shopro_area` VALUES (340123, '肥西县', 340100, 3);
INSERT INTO `fa_shopro_area` VALUES (340124, '庐江县', 340100, 3);
INSERT INTO `fa_shopro_area` VALUES (340181, '巢湖市', 340100, 3);
INSERT INTO `fa_shopro_area` VALUES (340200, '芜湖市', 340000, 2);
INSERT INTO `fa_shopro_area` VALUES (340202, '镜湖区', 340200, 3);
INSERT INTO `fa_shopro_area` VALUES (340203, '弋江区', 340200, 3);
INSERT INTO `fa_shopro_area` VALUES (340207, '鸠江区', 340200, 3);
INSERT INTO `fa_shopro_area` VALUES (340208, '三山区', 340200, 3);
INSERT INTO `fa_shopro_area` VALUES (340221, '芜湖县', 340200, 3);
INSERT INTO `fa_shopro_area` VALUES (340222, '繁昌县', 340200, 3);
INSERT INTO `fa_shopro_area` VALUES (340223, '南陵县', 340200, 3);
INSERT INTO `fa_shopro_area` VALUES (340225, '无为县', 340200, 3);
INSERT INTO `fa_shopro_area` VALUES (340300, '蚌埠市', 340000, 2);
INSERT INTO `fa_shopro_area` VALUES (340302, '龙子湖区', 340300, 3);
INSERT INTO `fa_shopro_area` VALUES (340303, '蚌山区', 340300, 3);
INSERT INTO `fa_shopro_area` VALUES (340304, '禹会区', 340300, 3);
INSERT INTO `fa_shopro_area` VALUES (340311, '淮上区', 340300, 3);
INSERT INTO `fa_shopro_area` VALUES (340321, '怀远县', 340300, 3);
INSERT INTO `fa_shopro_area` VALUES (340322, '五河县', 340300, 3);
INSERT INTO `fa_shopro_area` VALUES (340323, '固镇县', 340300, 3);
INSERT INTO `fa_shopro_area` VALUES (340400, '淮南市', 340000, 2);
INSERT INTO `fa_shopro_area` VALUES (340402, '大通区', 340400, 3);
INSERT INTO `fa_shopro_area` VALUES (340403, '田家庵区', 340400, 3);
INSERT INTO `fa_shopro_area` VALUES (340404, '谢家集区', 340400, 3);
INSERT INTO `fa_shopro_area` VALUES (340405, '八公山区', 340400, 3);
INSERT INTO `fa_shopro_area` VALUES (340406, '潘集区', 340400, 3);
INSERT INTO `fa_shopro_area` VALUES (340421, '凤台县', 340400, 3);
INSERT INTO `fa_shopro_area` VALUES (340422, '寿县', 340400, 3);
INSERT INTO `fa_shopro_area` VALUES (340500, '马鞍山市', 340000, 2);
INSERT INTO `fa_shopro_area` VALUES (340503, '花山区', 340500, 3);
INSERT INTO `fa_shopro_area` VALUES (340504, '雨山区', 340500, 3);
INSERT INTO `fa_shopro_area` VALUES (340506, '博望区', 340500, 3);
INSERT INTO `fa_shopro_area` VALUES (340521, '当涂县', 340500, 3);
INSERT INTO `fa_shopro_area` VALUES (340522, '含山县', 340500, 3);
INSERT INTO `fa_shopro_area` VALUES (340523, '和县', 340500, 3);
INSERT INTO `fa_shopro_area` VALUES (340600, '淮北市', 340000, 2);
INSERT INTO `fa_shopro_area` VALUES (340602, '杜集区', 340600, 3);
INSERT INTO `fa_shopro_area` VALUES (340603, '相山区', 340600, 3);
INSERT INTO `fa_shopro_area` VALUES (340604, '烈山区', 340600, 3);
INSERT INTO `fa_shopro_area` VALUES (340621, '濉溪县', 340600, 3);
INSERT INTO `fa_shopro_area` VALUES (340700, '铜陵市', 340000, 2);
INSERT INTO `fa_shopro_area` VALUES (340705, '铜官区', 340700, 3);
INSERT INTO `fa_shopro_area` VALUES (340706, '义安区', 340700, 3);
INSERT INTO `fa_shopro_area` VALUES (340711, '郊区', 340700, 3);
INSERT INTO `fa_shopro_area` VALUES (340722, '枞阳县', 340700, 3);
INSERT INTO `fa_shopro_area` VALUES (340800, '安庆市', 340000, 2);
INSERT INTO `fa_shopro_area` VALUES (340802, '迎江区', 340800, 3);
INSERT INTO `fa_shopro_area` VALUES (340803, '大观区', 340800, 3);
INSERT INTO `fa_shopro_area` VALUES (340811, '宜秀区', 340800, 3);
INSERT INTO `fa_shopro_area` VALUES (340822, '怀宁县', 340800, 3);
INSERT INTO `fa_shopro_area` VALUES (340824, '潜山县', 340800, 3);
INSERT INTO `fa_shopro_area` VALUES (340825, '太湖县', 340800, 3);
INSERT INTO `fa_shopro_area` VALUES (340826, '宿松县', 340800, 3);
INSERT INTO `fa_shopro_area` VALUES (340827, '望江县', 340800, 3);
INSERT INTO `fa_shopro_area` VALUES (340828, '岳西县', 340800, 3);
INSERT INTO `fa_shopro_area` VALUES (340881, '桐城市', 340800, 3);
INSERT INTO `fa_shopro_area` VALUES (341000, '黄山市', 340000, 2);
INSERT INTO `fa_shopro_area` VALUES (341002, '屯溪区', 341000, 3);
INSERT INTO `fa_shopro_area` VALUES (341003, '黄山区', 341000, 3);
INSERT INTO `fa_shopro_area` VALUES (341004, '徽州区', 341000, 3);
INSERT INTO `fa_shopro_area` VALUES (341021, '歙县', 341000, 3);
INSERT INTO `fa_shopro_area` VALUES (341022, '休宁县', 341000, 3);
INSERT INTO `fa_shopro_area` VALUES (341023, '黟县', 341000, 3);
INSERT INTO `fa_shopro_area` VALUES (341024, '祁门县', 341000, 3);
INSERT INTO `fa_shopro_area` VALUES (341100, '滁州市', 340000, 2);
INSERT INTO `fa_shopro_area` VALUES (341102, '琅琊区', 341100, 3);
INSERT INTO `fa_shopro_area` VALUES (341103, '南谯区', 341100, 3);
INSERT INTO `fa_shopro_area` VALUES (341122, '来安县', 341100, 3);
INSERT INTO `fa_shopro_area` VALUES (341124, '全椒县', 341100, 3);
INSERT INTO `fa_shopro_area` VALUES (341125, '定远县', 341100, 3);
INSERT INTO `fa_shopro_area` VALUES (341126, '凤阳县', 341100, 3);
INSERT INTO `fa_shopro_area` VALUES (341181, '天长市', 341100, 3);
INSERT INTO `fa_shopro_area` VALUES (341182, '明光市', 341100, 3);
INSERT INTO `fa_shopro_area` VALUES (341200, '阜阳市', 340000, 2);
INSERT INTO `fa_shopro_area` VALUES (341202, '颍州区', 341200, 3);
INSERT INTO `fa_shopro_area` VALUES (341203, '颍东区', 341200, 3);
INSERT INTO `fa_shopro_area` VALUES (341204, '颍泉区', 341200, 3);
INSERT INTO `fa_shopro_area` VALUES (341221, '临泉县', 341200, 3);
INSERT INTO `fa_shopro_area` VALUES (341222, '太和县', 341200, 3);
INSERT INTO `fa_shopro_area` VALUES (341225, '阜南县', 341200, 3);
INSERT INTO `fa_shopro_area` VALUES (341226, '颍上县', 341200, 3);
INSERT INTO `fa_shopro_area` VALUES (341282, '界首市', 341200, 3);
INSERT INTO `fa_shopro_area` VALUES (341300, '宿州市', 340000, 2);
INSERT INTO `fa_shopro_area` VALUES (341302, '埇桥区', 341300, 3);
INSERT INTO `fa_shopro_area` VALUES (341321, '砀山县', 341300, 3);
INSERT INTO `fa_shopro_area` VALUES (341322, '萧县', 341300, 3);
INSERT INTO `fa_shopro_area` VALUES (341323, '灵璧县', 341300, 3);
INSERT INTO `fa_shopro_area` VALUES (341324, '泗县', 341300, 3);
INSERT INTO `fa_shopro_area` VALUES (341500, '六安市', 340000, 2);
INSERT INTO `fa_shopro_area` VALUES (341502, '金安区', 341500, 3);
INSERT INTO `fa_shopro_area` VALUES (341503, '裕安区', 341500, 3);
INSERT INTO `fa_shopro_area` VALUES (341504, '叶集区', 341500, 3);
INSERT INTO `fa_shopro_area` VALUES (341522, '霍邱县', 341500, 3);
INSERT INTO `fa_shopro_area` VALUES (341523, '舒城县', 341500, 3);
INSERT INTO `fa_shopro_area` VALUES (341524, '金寨县', 341500, 3);
INSERT INTO `fa_shopro_area` VALUES (341525, '霍山县', 341500, 3);
INSERT INTO `fa_shopro_area` VALUES (341600, '亳州市', 340000, 2);
INSERT INTO `fa_shopro_area` VALUES (341602, '谯城区', 341600, 3);
INSERT INTO `fa_shopro_area` VALUES (341621, '涡阳县', 341600, 3);
INSERT INTO `fa_shopro_area` VALUES (341622, '蒙城县', 341600, 3);
INSERT INTO `fa_shopro_area` VALUES (341623, '利辛县', 341600, 3);
INSERT INTO `fa_shopro_area` VALUES (341700, '池州市', 340000, 2);
INSERT INTO `fa_shopro_area` VALUES (341702, '贵池区', 341700, 3);
INSERT INTO `fa_shopro_area` VALUES (341721, '东至县', 341700, 3);
INSERT INTO `fa_shopro_area` VALUES (341722, '石台县', 341700, 3);
INSERT INTO `fa_shopro_area` VALUES (341723, '青阳县', 341700, 3);
INSERT INTO `fa_shopro_area` VALUES (341800, '宣城市', 340000, 2);
INSERT INTO `fa_shopro_area` VALUES (341802, '宣州区', 341800, 3);
INSERT INTO `fa_shopro_area` VALUES (341821, '郎溪县', 341800, 3);
INSERT INTO `fa_shopro_area` VALUES (341822, '广德县', 341800, 3);
INSERT INTO `fa_shopro_area` VALUES (341823, '泾县', 341800, 3);
INSERT INTO `fa_shopro_area` VALUES (341824, '绩溪县', 341800, 3);
INSERT INTO `fa_shopro_area` VALUES (341825, '旌德县', 341800, 3);
INSERT INTO `fa_shopro_area` VALUES (341881, '宁国市', 341800, 3);
INSERT INTO `fa_shopro_area` VALUES (350000, '福建省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (350100, '福州市', 350000, 2);
INSERT INTO `fa_shopro_area` VALUES (350102, '鼓楼区', 350100, 3);
INSERT INTO `fa_shopro_area` VALUES (350103, '台江区', 350100, 3);
INSERT INTO `fa_shopro_area` VALUES (350104, '仓山区', 350100, 3);
INSERT INTO `fa_shopro_area` VALUES (350105, '马尾区', 350100, 3);
INSERT INTO `fa_shopro_area` VALUES (350111, '晋安区', 350100, 3);
INSERT INTO `fa_shopro_area` VALUES (350112, '长乐区', 350100, 3);
INSERT INTO `fa_shopro_area` VALUES (350121, '闽侯县', 350100, 3);
INSERT INTO `fa_shopro_area` VALUES (350122, '连江县', 350100, 3);
INSERT INTO `fa_shopro_area` VALUES (350123, '罗源县', 350100, 3);
INSERT INTO `fa_shopro_area` VALUES (350124, '闽清县', 350100, 3);
INSERT INTO `fa_shopro_area` VALUES (350125, '永泰县', 350100, 3);
INSERT INTO `fa_shopro_area` VALUES (350128, '平潭县', 350100, 3);
INSERT INTO `fa_shopro_area` VALUES (350181, '福清市', 350100, 3);
INSERT INTO `fa_shopro_area` VALUES (350200, '厦门市', 350000, 2);
INSERT INTO `fa_shopro_area` VALUES (350203, '思明区', 350200, 3);
INSERT INTO `fa_shopro_area` VALUES (350205, '海沧区', 350200, 3);
INSERT INTO `fa_shopro_area` VALUES (350206, '湖里区', 350200, 3);
INSERT INTO `fa_shopro_area` VALUES (350211, '集美区', 350200, 3);
INSERT INTO `fa_shopro_area` VALUES (350212, '同安区', 350200, 3);
INSERT INTO `fa_shopro_area` VALUES (350213, '翔安区', 350200, 3);
INSERT INTO `fa_shopro_area` VALUES (350300, '莆田市', 350000, 2);
INSERT INTO `fa_shopro_area` VALUES (350302, '城厢区', 350300, 3);
INSERT INTO `fa_shopro_area` VALUES (350303, '涵江区', 350300, 3);
INSERT INTO `fa_shopro_area` VALUES (350304, '荔城区', 350300, 3);
INSERT INTO `fa_shopro_area` VALUES (350305, '秀屿区', 350300, 3);
INSERT INTO `fa_shopro_area` VALUES (350322, '仙游县', 350300, 3);
INSERT INTO `fa_shopro_area` VALUES (350400, '三明市', 350000, 2);
INSERT INTO `fa_shopro_area` VALUES (350402, '梅列区', 350400, 3);
INSERT INTO `fa_shopro_area` VALUES (350403, '三元区', 350400, 3);
INSERT INTO `fa_shopro_area` VALUES (350421, '明溪县', 350400, 3);
INSERT INTO `fa_shopro_area` VALUES (350423, '清流县', 350400, 3);
INSERT INTO `fa_shopro_area` VALUES (350424, '宁化县', 350400, 3);
INSERT INTO `fa_shopro_area` VALUES (350425, '大田县', 350400, 3);
INSERT INTO `fa_shopro_area` VALUES (350426, '尤溪县', 350400, 3);
INSERT INTO `fa_shopro_area` VALUES (350427, '沙县', 350400, 3);
INSERT INTO `fa_shopro_area` VALUES (350428, '将乐县', 350400, 3);
INSERT INTO `fa_shopro_area` VALUES (350429, '泰宁县', 350400, 3);
INSERT INTO `fa_shopro_area` VALUES (350430, '建宁县', 350400, 3);
INSERT INTO `fa_shopro_area` VALUES (350481, '永安市', 350400, 3);
INSERT INTO `fa_shopro_area` VALUES (350500, '泉州市', 350000, 2);
INSERT INTO `fa_shopro_area` VALUES (350502, '鲤城区', 350500, 3);
INSERT INTO `fa_shopro_area` VALUES (350503, '丰泽区', 350500, 3);
INSERT INTO `fa_shopro_area` VALUES (350504, '洛江区', 350500, 3);
INSERT INTO `fa_shopro_area` VALUES (350505, '泉港区', 350500, 3);
INSERT INTO `fa_shopro_area` VALUES (350521, '惠安县', 350500, 3);
INSERT INTO `fa_shopro_area` VALUES (350524, '安溪县', 350500, 3);
INSERT INTO `fa_shopro_area` VALUES (350525, '永春县', 350500, 3);
INSERT INTO `fa_shopro_area` VALUES (350526, '德化县', 350500, 3);
INSERT INTO `fa_shopro_area` VALUES (350527, '金门县', 350500, 3);
INSERT INTO `fa_shopro_area` VALUES (350581, '石狮市', 350500, 3);
INSERT INTO `fa_shopro_area` VALUES (350582, '晋江市', 350500, 3);
INSERT INTO `fa_shopro_area` VALUES (350583, '南安市', 350500, 3);
INSERT INTO `fa_shopro_area` VALUES (350600, '漳州市', 350000, 2);
INSERT INTO `fa_shopro_area` VALUES (350602, '芗城区', 350600, 3);
INSERT INTO `fa_shopro_area` VALUES (350603, '龙文区', 350600, 3);
INSERT INTO `fa_shopro_area` VALUES (350622, '云霄县', 350600, 3);
INSERT INTO `fa_shopro_area` VALUES (350623, '漳浦县', 350600, 3);
INSERT INTO `fa_shopro_area` VALUES (350624, '诏安县', 350600, 3);
INSERT INTO `fa_shopro_area` VALUES (350625, '长泰县', 350600, 3);
INSERT INTO `fa_shopro_area` VALUES (350626, '东山县', 350600, 3);
INSERT INTO `fa_shopro_area` VALUES (350627, '南靖县', 350600, 3);
INSERT INTO `fa_shopro_area` VALUES (350628, '平和县', 350600, 3);
INSERT INTO `fa_shopro_area` VALUES (350629, '华安县', 350600, 3);
INSERT INTO `fa_shopro_area` VALUES (350681, '龙海市', 350600, 3);
INSERT INTO `fa_shopro_area` VALUES (350700, '南平市', 350000, 2);
INSERT INTO `fa_shopro_area` VALUES (350702, '延平区', 350700, 3);
INSERT INTO `fa_shopro_area` VALUES (350703, '建阳区', 350700, 3);
INSERT INTO `fa_shopro_area` VALUES (350721, '顺昌县', 350700, 3);
INSERT INTO `fa_shopro_area` VALUES (350722, '浦城县', 350700, 3);
INSERT INTO `fa_shopro_area` VALUES (350723, '光泽县', 350700, 3);
INSERT INTO `fa_shopro_area` VALUES (350724, '松溪县', 350700, 3);
INSERT INTO `fa_shopro_area` VALUES (350725, '政和县', 350700, 3);
INSERT INTO `fa_shopro_area` VALUES (350781, '邵武市', 350700, 3);
INSERT INTO `fa_shopro_area` VALUES (350782, '武夷山市', 350700, 3);
INSERT INTO `fa_shopro_area` VALUES (350783, '建瓯市', 350700, 3);
INSERT INTO `fa_shopro_area` VALUES (350800, '龙岩市', 350000, 2);
INSERT INTO `fa_shopro_area` VALUES (350802, '新罗区', 350800, 3);
INSERT INTO `fa_shopro_area` VALUES (350803, '永定区', 350800, 3);
INSERT INTO `fa_shopro_area` VALUES (350821, '长汀县', 350800, 3);
INSERT INTO `fa_shopro_area` VALUES (350823, '上杭县', 350800, 3);
INSERT INTO `fa_shopro_area` VALUES (350824, '武平县', 350800, 3);
INSERT INTO `fa_shopro_area` VALUES (350825, '连城县', 350800, 3);
INSERT INTO `fa_shopro_area` VALUES (350881, '漳平市', 350800, 3);
INSERT INTO `fa_shopro_area` VALUES (350900, '宁德市', 350000, 2);
INSERT INTO `fa_shopro_area` VALUES (350902, '蕉城区', 350900, 3);
INSERT INTO `fa_shopro_area` VALUES (350921, '霞浦县', 350900, 3);
INSERT INTO `fa_shopro_area` VALUES (350922, '古田县', 350900, 3);
INSERT INTO `fa_shopro_area` VALUES (350923, '屏南县', 350900, 3);
INSERT INTO `fa_shopro_area` VALUES (350924, '寿宁县', 350900, 3);
INSERT INTO `fa_shopro_area` VALUES (350925, '周宁县', 350900, 3);
INSERT INTO `fa_shopro_area` VALUES (350926, '柘荣县', 350900, 3);
INSERT INTO `fa_shopro_area` VALUES (350981, '福安市', 350900, 3);
INSERT INTO `fa_shopro_area` VALUES (350982, '福鼎市', 350900, 3);
INSERT INTO `fa_shopro_area` VALUES (360000, '江西省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (360100, '南昌市', 360000, 2);
INSERT INTO `fa_shopro_area` VALUES (360102, '东湖区', 360100, 3);
INSERT INTO `fa_shopro_area` VALUES (360103, '西湖区', 360100, 3);
INSERT INTO `fa_shopro_area` VALUES (360104, '青云谱区', 360100, 3);
INSERT INTO `fa_shopro_area` VALUES (360105, '湾里区', 360100, 3);
INSERT INTO `fa_shopro_area` VALUES (360111, '青山湖区', 360100, 3);
INSERT INTO `fa_shopro_area` VALUES (360112, '新建区', 360100, 3);
INSERT INTO `fa_shopro_area` VALUES (360121, '南昌县', 360100, 3);
INSERT INTO `fa_shopro_area` VALUES (360123, '安义县', 360100, 3);
INSERT INTO `fa_shopro_area` VALUES (360124, '进贤县', 360100, 3);
INSERT INTO `fa_shopro_area` VALUES (360200, '景德镇市', 360000, 2);
INSERT INTO `fa_shopro_area` VALUES (360202, '昌江区', 360200, 3);
INSERT INTO `fa_shopro_area` VALUES (360203, '珠山区', 360200, 3);
INSERT INTO `fa_shopro_area` VALUES (360222, '浮梁县', 360200, 3);
INSERT INTO `fa_shopro_area` VALUES (360281, '乐平市', 360200, 3);
INSERT INTO `fa_shopro_area` VALUES (360300, '萍乡市', 360000, 2);
INSERT INTO `fa_shopro_area` VALUES (360302, '安源区', 360300, 3);
INSERT INTO `fa_shopro_area` VALUES (360313, '湘东区', 360300, 3);
INSERT INTO `fa_shopro_area` VALUES (360321, '莲花县', 360300, 3);
INSERT INTO `fa_shopro_area` VALUES (360322, '上栗县', 360300, 3);
INSERT INTO `fa_shopro_area` VALUES (360323, '芦溪县', 360300, 3);
INSERT INTO `fa_shopro_area` VALUES (360400, '九江市', 360000, 2);
INSERT INTO `fa_shopro_area` VALUES (360402, '濂溪区', 360400, 3);
INSERT INTO `fa_shopro_area` VALUES (360403, '浔阳区', 360400, 3);
INSERT INTO `fa_shopro_area` VALUES (360404, '柴桑区', 360400, 3);
INSERT INTO `fa_shopro_area` VALUES (360423, '武宁县', 360400, 3);
INSERT INTO `fa_shopro_area` VALUES (360424, '修水县', 360400, 3);
INSERT INTO `fa_shopro_area` VALUES (360425, '永修县', 360400, 3);
INSERT INTO `fa_shopro_area` VALUES (360426, '德安县', 360400, 3);
INSERT INTO `fa_shopro_area` VALUES (360428, '都昌县', 360400, 3);
INSERT INTO `fa_shopro_area` VALUES (360429, '湖口县', 360400, 3);
INSERT INTO `fa_shopro_area` VALUES (360430, '彭泽县', 360400, 3);
INSERT INTO `fa_shopro_area` VALUES (360481, '瑞昌市', 360400, 3);
INSERT INTO `fa_shopro_area` VALUES (360482, '共青城市', 360400, 3);
INSERT INTO `fa_shopro_area` VALUES (360483, '庐山市', 360400, 3);
INSERT INTO `fa_shopro_area` VALUES (360500, '新余市', 360000, 2);
INSERT INTO `fa_shopro_area` VALUES (360502, '渝水区', 360500, 3);
INSERT INTO `fa_shopro_area` VALUES (360521, '分宜县', 360500, 3);
INSERT INTO `fa_shopro_area` VALUES (360600, '鹰潭市', 360000, 2);
INSERT INTO `fa_shopro_area` VALUES (360602, '月湖区', 360600, 3);
INSERT INTO `fa_shopro_area` VALUES (360622, '余江区', 360600, 3);
INSERT INTO `fa_shopro_area` VALUES (360681, '贵溪市', 360600, 3);
INSERT INTO `fa_shopro_area` VALUES (360700, '赣州市', 360000, 2);
INSERT INTO `fa_shopro_area` VALUES (360702, '章贡区', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360703, '南康区', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360704, '赣县区', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360722, '信丰县', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360723, '大余县', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360724, '上犹县', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360725, '崇义县', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360726, '安远县', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360727, '龙南县', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360728, '定南县', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360729, '全南县', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360730, '宁都县', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360731, '于都县', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360732, '兴国县', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360733, '会昌县', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360734, '寻乌县', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360735, '石城县', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360781, '瑞金市', 360700, 3);
INSERT INTO `fa_shopro_area` VALUES (360800, '吉安市', 360000, 2);
INSERT INTO `fa_shopro_area` VALUES (360802, '吉州区', 360800, 3);
INSERT INTO `fa_shopro_area` VALUES (360803, '青原区', 360800, 3);
INSERT INTO `fa_shopro_area` VALUES (360821, '吉安县', 360800, 3);
INSERT INTO `fa_shopro_area` VALUES (360822, '吉水县', 360800, 3);
INSERT INTO `fa_shopro_area` VALUES (360823, '峡江县', 360800, 3);
INSERT INTO `fa_shopro_area` VALUES (360824, '新干县', 360800, 3);
INSERT INTO `fa_shopro_area` VALUES (360825, '永丰县', 360800, 3);
INSERT INTO `fa_shopro_area` VALUES (360826, '泰和县', 360800, 3);
INSERT INTO `fa_shopro_area` VALUES (360827, '遂川县', 360800, 3);
INSERT INTO `fa_shopro_area` VALUES (360828, '万安县', 360800, 3);
INSERT INTO `fa_shopro_area` VALUES (360829, '安福县', 360800, 3);
INSERT INTO `fa_shopro_area` VALUES (360830, '永新县', 360800, 3);
INSERT INTO `fa_shopro_area` VALUES (360881, '井冈山市', 360800, 3);
INSERT INTO `fa_shopro_area` VALUES (360900, '宜春市', 360000, 2);
INSERT INTO `fa_shopro_area` VALUES (360902, '袁州区', 360900, 3);
INSERT INTO `fa_shopro_area` VALUES (360921, '奉新县', 360900, 3);
INSERT INTO `fa_shopro_area` VALUES (360922, '万载县', 360900, 3);
INSERT INTO `fa_shopro_area` VALUES (360923, '上高县', 360900, 3);
INSERT INTO `fa_shopro_area` VALUES (360924, '宜丰县', 360900, 3);
INSERT INTO `fa_shopro_area` VALUES (360925, '靖安县', 360900, 3);
INSERT INTO `fa_shopro_area` VALUES (360926, '铜鼓县', 360900, 3);
INSERT INTO `fa_shopro_area` VALUES (360981, '丰城市', 360900, 3);
INSERT INTO `fa_shopro_area` VALUES (360982, '樟树市', 360900, 3);
INSERT INTO `fa_shopro_area` VALUES (360983, '高安市', 360900, 3);
INSERT INTO `fa_shopro_area` VALUES (361000, '抚州市', 360000, 2);
INSERT INTO `fa_shopro_area` VALUES (361002, '临川区', 361000, 3);
INSERT INTO `fa_shopro_area` VALUES (361003, '东乡区', 361000, 3);
INSERT INTO `fa_shopro_area` VALUES (361021, '南城县', 361000, 3);
INSERT INTO `fa_shopro_area` VALUES (361022, '黎川县', 361000, 3);
INSERT INTO `fa_shopro_area` VALUES (361023, '南丰县', 361000, 3);
INSERT INTO `fa_shopro_area` VALUES (361024, '崇仁县', 361000, 3);
INSERT INTO `fa_shopro_area` VALUES (361025, '乐安县', 361000, 3);
INSERT INTO `fa_shopro_area` VALUES (361026, '宜黄县', 361000, 3);
INSERT INTO `fa_shopro_area` VALUES (361027, '金溪县', 361000, 3);
INSERT INTO `fa_shopro_area` VALUES (361028, '资溪县', 361000, 3);
INSERT INTO `fa_shopro_area` VALUES (361030, '广昌县', 361000, 3);
INSERT INTO `fa_shopro_area` VALUES (361100, '上饶市', 360000, 2);
INSERT INTO `fa_shopro_area` VALUES (361102, '信州区', 361100, 3);
INSERT INTO `fa_shopro_area` VALUES (361103, '广丰区', 361100, 3);
INSERT INTO `fa_shopro_area` VALUES (361121, '上饶县', 361100, 3);
INSERT INTO `fa_shopro_area` VALUES (361123, '玉山县', 361100, 3);
INSERT INTO `fa_shopro_area` VALUES (361124, '铅山县', 361100, 3);
INSERT INTO `fa_shopro_area` VALUES (361125, '横峰县', 361100, 3);
INSERT INTO `fa_shopro_area` VALUES (361126, '弋阳县', 361100, 3);
INSERT INTO `fa_shopro_area` VALUES (361127, '余干县', 361100, 3);
INSERT INTO `fa_shopro_area` VALUES (361128, '鄱阳县', 361100, 3);
INSERT INTO `fa_shopro_area` VALUES (361129, '万年县', 361100, 3);
INSERT INTO `fa_shopro_area` VALUES (361130, '婺源县', 361100, 3);
INSERT INTO `fa_shopro_area` VALUES (361181, '德兴市', 361100, 3);
INSERT INTO `fa_shopro_area` VALUES (370000, '山东省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (370100, '济南市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (370102, '历下区', 370100, 3);
INSERT INTO `fa_shopro_area` VALUES (370103, '市中区', 370100, 3);
INSERT INTO `fa_shopro_area` VALUES (370104, '槐荫区', 370100, 3);
INSERT INTO `fa_shopro_area` VALUES (370105, '天桥区', 370100, 3);
INSERT INTO `fa_shopro_area` VALUES (370112, '历城区', 370100, 3);
INSERT INTO `fa_shopro_area` VALUES (370113, '长清区', 370100, 3);
INSERT INTO `fa_shopro_area` VALUES (370114, '章丘区', 370100, 3);
INSERT INTO `fa_shopro_area` VALUES (370124, '平阴县', 370100, 3);
INSERT INTO `fa_shopro_area` VALUES (370125, '济阳县', 370100, 3);
INSERT INTO `fa_shopro_area` VALUES (370126, '商河县', 370100, 3);
INSERT INTO `fa_shopro_area` VALUES (370200, '青岛市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (370202, '市南区', 370200, 3);
INSERT INTO `fa_shopro_area` VALUES (370203, '市北区', 370200, 3);
INSERT INTO `fa_shopro_area` VALUES (370211, '黄岛区', 370200, 3);
INSERT INTO `fa_shopro_area` VALUES (370212, '崂山区', 370200, 3);
INSERT INTO `fa_shopro_area` VALUES (370213, '李沧区', 370200, 3);
INSERT INTO `fa_shopro_area` VALUES (370214, '城阳区', 370200, 3);
INSERT INTO `fa_shopro_area` VALUES (370215, '即墨区', 370200, 3);
INSERT INTO `fa_shopro_area` VALUES (370281, '胶州市', 370200, 3);
INSERT INTO `fa_shopro_area` VALUES (370283, '平度市', 370200, 3);
INSERT INTO `fa_shopro_area` VALUES (370285, '莱西市', 370200, 3);
INSERT INTO `fa_shopro_area` VALUES (370300, '淄博市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (370302, '淄川区', 370300, 3);
INSERT INTO `fa_shopro_area` VALUES (370303, '张店区', 370300, 3);
INSERT INTO `fa_shopro_area` VALUES (370304, '博山区', 370300, 3);
INSERT INTO `fa_shopro_area` VALUES (370305, '临淄区', 370300, 3);
INSERT INTO `fa_shopro_area` VALUES (370306, '周村区', 370300, 3);
INSERT INTO `fa_shopro_area` VALUES (370321, '桓台县', 370300, 3);
INSERT INTO `fa_shopro_area` VALUES (370322, '高青县', 370300, 3);
INSERT INTO `fa_shopro_area` VALUES (370323, '沂源县', 370300, 3);
INSERT INTO `fa_shopro_area` VALUES (370400, '枣庄市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (370402, '市中区', 370400, 3);
INSERT INTO `fa_shopro_area` VALUES (370403, '薛城区', 370400, 3);
INSERT INTO `fa_shopro_area` VALUES (370404, '峄城区', 370400, 3);
INSERT INTO `fa_shopro_area` VALUES (370405, '台儿庄区', 370400, 3);
INSERT INTO `fa_shopro_area` VALUES (370406, '山亭区', 370400, 3);
INSERT INTO `fa_shopro_area` VALUES (370481, '滕州市', 370400, 3);
INSERT INTO `fa_shopro_area` VALUES (370500, '东营市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (370502, '东营区', 370500, 3);
INSERT INTO `fa_shopro_area` VALUES (370503, '河口区', 370500, 3);
INSERT INTO `fa_shopro_area` VALUES (370505, '垦利区', 370500, 3);
INSERT INTO `fa_shopro_area` VALUES (370522, '利津县', 370500, 3);
INSERT INTO `fa_shopro_area` VALUES (370523, '广饶县', 370500, 3);
INSERT INTO `fa_shopro_area` VALUES (370600, '烟台市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (370602, '芝罘区', 370600, 3);
INSERT INTO `fa_shopro_area` VALUES (370611, '福山区', 370600, 3);
INSERT INTO `fa_shopro_area` VALUES (370612, '牟平区', 370600, 3);
INSERT INTO `fa_shopro_area` VALUES (370613, '莱山区', 370600, 3);
INSERT INTO `fa_shopro_area` VALUES (370634, '长岛县', 370600, 3);
INSERT INTO `fa_shopro_area` VALUES (370681, '龙口市', 370600, 3);
INSERT INTO `fa_shopro_area` VALUES (370682, '莱阳市', 370600, 3);
INSERT INTO `fa_shopro_area` VALUES (370683, '莱州市', 370600, 3);
INSERT INTO `fa_shopro_area` VALUES (370684, '蓬莱市', 370600, 3);
INSERT INTO `fa_shopro_area` VALUES (370685, '招远市', 370600, 3);
INSERT INTO `fa_shopro_area` VALUES (370686, '栖霞市', 370600, 3);
INSERT INTO `fa_shopro_area` VALUES (370687, '海阳市', 370600, 3);
INSERT INTO `fa_shopro_area` VALUES (370700, '潍坊市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (370702, '潍城区', 370700, 3);
INSERT INTO `fa_shopro_area` VALUES (370703, '寒亭区', 370700, 3);
INSERT INTO `fa_shopro_area` VALUES (370704, '坊子区', 370700, 3);
INSERT INTO `fa_shopro_area` VALUES (370705, '奎文区', 370700, 3);
INSERT INTO `fa_shopro_area` VALUES (370724, '临朐县', 370700, 3);
INSERT INTO `fa_shopro_area` VALUES (370725, '昌乐县', 370700, 3);
INSERT INTO `fa_shopro_area` VALUES (370781, '青州市', 370700, 3);
INSERT INTO `fa_shopro_area` VALUES (370782, '诸城市', 370700, 3);
INSERT INTO `fa_shopro_area` VALUES (370783, '寿光市', 370700, 3);
INSERT INTO `fa_shopro_area` VALUES (370784, '安丘市', 370700, 3);
INSERT INTO `fa_shopro_area` VALUES (370785, '高密市', 370700, 3);
INSERT INTO `fa_shopro_area` VALUES (370786, '昌邑市', 370700, 3);
INSERT INTO `fa_shopro_area` VALUES (370800, '济宁市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (370811, '任城区', 370800, 3);
INSERT INTO `fa_shopro_area` VALUES (370812, '兖州区', 370800, 3);
INSERT INTO `fa_shopro_area` VALUES (370826, '微山县', 370800, 3);
INSERT INTO `fa_shopro_area` VALUES (370827, '鱼台县', 370800, 3);
INSERT INTO `fa_shopro_area` VALUES (370828, '金乡县', 370800, 3);
INSERT INTO `fa_shopro_area` VALUES (370829, '嘉祥县', 370800, 3);
INSERT INTO `fa_shopro_area` VALUES (370830, '汶上县', 370800, 3);
INSERT INTO `fa_shopro_area` VALUES (370831, '泗水县', 370800, 3);
INSERT INTO `fa_shopro_area` VALUES (370832, '梁山县', 370800, 3);
INSERT INTO `fa_shopro_area` VALUES (370881, '曲阜市', 370800, 3);
INSERT INTO `fa_shopro_area` VALUES (370883, '邹城市', 370800, 3);
INSERT INTO `fa_shopro_area` VALUES (370900, '泰安市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (370902, '泰山区', 370900, 3);
INSERT INTO `fa_shopro_area` VALUES (370911, '岱岳区', 370900, 3);
INSERT INTO `fa_shopro_area` VALUES (370921, '宁阳县', 370900, 3);
INSERT INTO `fa_shopro_area` VALUES (370923, '东平县', 370900, 3);
INSERT INTO `fa_shopro_area` VALUES (370982, '新泰市', 370900, 3);
INSERT INTO `fa_shopro_area` VALUES (370983, '肥城市', 370900, 3);
INSERT INTO `fa_shopro_area` VALUES (371000, '威海市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (371002, '环翠区', 371000, 3);
INSERT INTO `fa_shopro_area` VALUES (371003, '文登区', 371000, 3);
INSERT INTO `fa_shopro_area` VALUES (371082, '荣成市', 371000, 3);
INSERT INTO `fa_shopro_area` VALUES (371083, '乳山市', 371000, 3);
INSERT INTO `fa_shopro_area` VALUES (371100, '日照市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (371102, '东港区', 371100, 3);
INSERT INTO `fa_shopro_area` VALUES (371103, '岚山区', 371100, 3);
INSERT INTO `fa_shopro_area` VALUES (371121, '五莲县', 371100, 3);
INSERT INTO `fa_shopro_area` VALUES (371122, '莒县', 371100, 3);
INSERT INTO `fa_shopro_area` VALUES (371200, '莱芜市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (371202, '莱城区', 371200, 3);
INSERT INTO `fa_shopro_area` VALUES (371203, '钢城区', 371200, 3);
INSERT INTO `fa_shopro_area` VALUES (371300, '临沂市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (371302, '兰山区', 371300, 3);
INSERT INTO `fa_shopro_area` VALUES (371311, '罗庄区', 371300, 3);
INSERT INTO `fa_shopro_area` VALUES (371312, '河东区', 371300, 3);
INSERT INTO `fa_shopro_area` VALUES (371321, '沂南县', 371300, 3);
INSERT INTO `fa_shopro_area` VALUES (371322, '郯城县', 371300, 3);
INSERT INTO `fa_shopro_area` VALUES (371323, '沂水县', 371300, 3);
INSERT INTO `fa_shopro_area` VALUES (371324, '兰陵县', 371300, 3);
INSERT INTO `fa_shopro_area` VALUES (371325, '费县', 371300, 3);
INSERT INTO `fa_shopro_area` VALUES (371326, '平邑县', 371300, 3);
INSERT INTO `fa_shopro_area` VALUES (371327, '莒南县', 371300, 3);
INSERT INTO `fa_shopro_area` VALUES (371328, '蒙阴县', 371300, 3);
INSERT INTO `fa_shopro_area` VALUES (371329, '临沭县', 371300, 3);
INSERT INTO `fa_shopro_area` VALUES (371400, '德州市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (371402, '德城区', 371400, 3);
INSERT INTO `fa_shopro_area` VALUES (371403, '陵城区', 371400, 3);
INSERT INTO `fa_shopro_area` VALUES (371422, '宁津县', 371400, 3);
INSERT INTO `fa_shopro_area` VALUES (371423, '庆云县', 371400, 3);
INSERT INTO `fa_shopro_area` VALUES (371424, '临邑县', 371400, 3);
INSERT INTO `fa_shopro_area` VALUES (371425, '齐河县', 371400, 3);
INSERT INTO `fa_shopro_area` VALUES (371426, '平原县', 371400, 3);
INSERT INTO `fa_shopro_area` VALUES (371427, '夏津县', 371400, 3);
INSERT INTO `fa_shopro_area` VALUES (371428, '武城县', 371400, 3);
INSERT INTO `fa_shopro_area` VALUES (371481, '乐陵市', 371400, 3);
INSERT INTO `fa_shopro_area` VALUES (371482, '禹城市', 371400, 3);
INSERT INTO `fa_shopro_area` VALUES (371500, '聊城市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (371502, '东昌府区', 371500, 3);
INSERT INTO `fa_shopro_area` VALUES (371521, '阳谷县', 371500, 3);
INSERT INTO `fa_shopro_area` VALUES (371522, '莘县', 371500, 3);
INSERT INTO `fa_shopro_area` VALUES (371523, '茌平县', 371500, 3);
INSERT INTO `fa_shopro_area` VALUES (371524, '东阿县', 371500, 3);
INSERT INTO `fa_shopro_area` VALUES (371525, '冠县', 371500, 3);
INSERT INTO `fa_shopro_area` VALUES (371526, '高唐县', 371500, 3);
INSERT INTO `fa_shopro_area` VALUES (371581, '临清市', 371500, 3);
INSERT INTO `fa_shopro_area` VALUES (371600, '滨州市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (371602, '滨城区', 371600, 3);
INSERT INTO `fa_shopro_area` VALUES (371603, '沾化区', 371600, 3);
INSERT INTO `fa_shopro_area` VALUES (371621, '惠民县', 371600, 3);
INSERT INTO `fa_shopro_area` VALUES (371622, '阳信县', 371600, 3);
INSERT INTO `fa_shopro_area` VALUES (371623, '无棣县', 371600, 3);
INSERT INTO `fa_shopro_area` VALUES (371625, '博兴县', 371600, 3);
INSERT INTO `fa_shopro_area` VALUES (371626, '邹平县', 371600, 3);
INSERT INTO `fa_shopro_area` VALUES (371700, '菏泽市', 370000, 2);
INSERT INTO `fa_shopro_area` VALUES (371702, '牡丹区', 371700, 3);
INSERT INTO `fa_shopro_area` VALUES (371703, '定陶区', 371700, 3);
INSERT INTO `fa_shopro_area` VALUES (371721, '曹县', 371700, 3);
INSERT INTO `fa_shopro_area` VALUES (371722, '单县', 371700, 3);
INSERT INTO `fa_shopro_area` VALUES (371723, '成武县', 371700, 3);
INSERT INTO `fa_shopro_area` VALUES (371724, '巨野县', 371700, 3);
INSERT INTO `fa_shopro_area` VALUES (371725, '郓城县', 371700, 3);
INSERT INTO `fa_shopro_area` VALUES (371726, '鄄城县', 371700, 3);
INSERT INTO `fa_shopro_area` VALUES (371728, '东明县', 371700, 3);
INSERT INTO `fa_shopro_area` VALUES (410000, '河南省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (410100, '郑州市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (410102, '中原区', 410100, 3);
INSERT INTO `fa_shopro_area` VALUES (410103, '二七区', 410100, 3);
INSERT INTO `fa_shopro_area` VALUES (410104, '管城回族区', 410100, 3);
INSERT INTO `fa_shopro_area` VALUES (410105, '金水区', 410100, 3);
INSERT INTO `fa_shopro_area` VALUES (410106, '上街区', 410100, 3);
INSERT INTO `fa_shopro_area` VALUES (410108, '惠济区', 410100, 3);
INSERT INTO `fa_shopro_area` VALUES (410122, '中牟县', 410100, 3);
INSERT INTO `fa_shopro_area` VALUES (410181, '巩义市', 410100, 3);
INSERT INTO `fa_shopro_area` VALUES (410182, '荥阳市', 410100, 3);
INSERT INTO `fa_shopro_area` VALUES (410183, '新密市', 410100, 3);
INSERT INTO `fa_shopro_area` VALUES (410184, '新郑市', 410100, 3);
INSERT INTO `fa_shopro_area` VALUES (410185, '登封市', 410100, 3);
INSERT INTO `fa_shopro_area` VALUES (410200, '开封市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (410202, '龙亭区', 410200, 3);
INSERT INTO `fa_shopro_area` VALUES (410203, '顺河回族区', 410200, 3);
INSERT INTO `fa_shopro_area` VALUES (410204, '鼓楼区', 410200, 3);
INSERT INTO `fa_shopro_area` VALUES (410205, '禹王台区', 410200, 3);
INSERT INTO `fa_shopro_area` VALUES (410212, '祥符区', 410200, 3);
INSERT INTO `fa_shopro_area` VALUES (410221, '杞县', 410200, 3);
INSERT INTO `fa_shopro_area` VALUES (410222, '通许县', 410200, 3);
INSERT INTO `fa_shopro_area` VALUES (410223, '尉氏县', 410200, 3);
INSERT INTO `fa_shopro_area` VALUES (410225, '兰考县', 410200, 3);
INSERT INTO `fa_shopro_area` VALUES (410300, '洛阳市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (410302, '老城区', 410300, 3);
INSERT INTO `fa_shopro_area` VALUES (410303, '西工区', 410300, 3);
INSERT INTO `fa_shopro_area` VALUES (410304, '瀍河回族区', 410300, 3);
INSERT INTO `fa_shopro_area` VALUES (410305, '涧西区', 410300, 3);
INSERT INTO `fa_shopro_area` VALUES (410306, '吉利区', 410300, 3);
INSERT INTO `fa_shopro_area` VALUES (410311, '洛龙区', 410300, 3);
INSERT INTO `fa_shopro_area` VALUES (410322, '孟津县', 410300, 3);
INSERT INTO `fa_shopro_area` VALUES (410323, '新安县', 410300, 3);
INSERT INTO `fa_shopro_area` VALUES (410324, '栾川县', 410300, 3);
INSERT INTO `fa_shopro_area` VALUES (410325, '嵩县', 410300, 3);
INSERT INTO `fa_shopro_area` VALUES (410326, '汝阳县', 410300, 3);
INSERT INTO `fa_shopro_area` VALUES (410327, '宜阳县', 410300, 3);
INSERT INTO `fa_shopro_area` VALUES (410328, '洛宁县', 410300, 3);
INSERT INTO `fa_shopro_area` VALUES (410329, '伊川县', 410300, 3);
INSERT INTO `fa_shopro_area` VALUES (410381, '偃师市', 410300, 3);
INSERT INTO `fa_shopro_area` VALUES (410400, '平顶山市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (410402, '新华区', 410400, 3);
INSERT INTO `fa_shopro_area` VALUES (410403, '卫东区', 410400, 3);
INSERT INTO `fa_shopro_area` VALUES (410404, '石龙区', 410400, 3);
INSERT INTO `fa_shopro_area` VALUES (410411, '湛河区', 410400, 3);
INSERT INTO `fa_shopro_area` VALUES (410421, '宝丰县', 410400, 3);
INSERT INTO `fa_shopro_area` VALUES (410422, '叶县', 410400, 3);
INSERT INTO `fa_shopro_area` VALUES (410423, '鲁山县', 410400, 3);
INSERT INTO `fa_shopro_area` VALUES (410425, '郏县', 410400, 3);
INSERT INTO `fa_shopro_area` VALUES (410481, '舞钢市', 410400, 3);
INSERT INTO `fa_shopro_area` VALUES (410482, '汝州市', 410400, 3);
INSERT INTO `fa_shopro_area` VALUES (410500, '安阳市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (410502, '文峰区', 410500, 3);
INSERT INTO `fa_shopro_area` VALUES (410503, '北关区', 410500, 3);
INSERT INTO `fa_shopro_area` VALUES (410505, '殷都区', 410500, 3);
INSERT INTO `fa_shopro_area` VALUES (410506, '龙安区', 410500, 3);
INSERT INTO `fa_shopro_area` VALUES (410522, '安阳县', 410500, 3);
INSERT INTO `fa_shopro_area` VALUES (410523, '汤阴县', 410500, 3);
INSERT INTO `fa_shopro_area` VALUES (410526, '滑县', 410500, 3);
INSERT INTO `fa_shopro_area` VALUES (410527, '内黄县', 410500, 3);
INSERT INTO `fa_shopro_area` VALUES (410581, '林州市', 410500, 3);
INSERT INTO `fa_shopro_area` VALUES (410600, '鹤壁市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (410602, '鹤山区', 410600, 3);
INSERT INTO `fa_shopro_area` VALUES (410603, '山城区', 410600, 3);
INSERT INTO `fa_shopro_area` VALUES (410611, '淇滨区', 410600, 3);
INSERT INTO `fa_shopro_area` VALUES (410621, '浚县', 410600, 3);
INSERT INTO `fa_shopro_area` VALUES (410622, '淇县', 410600, 3);
INSERT INTO `fa_shopro_area` VALUES (410700, '新乡市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (410702, '红旗区', 410700, 3);
INSERT INTO `fa_shopro_area` VALUES (410703, '卫滨区', 410700, 3);
INSERT INTO `fa_shopro_area` VALUES (410704, '凤泉区', 410700, 3);
INSERT INTO `fa_shopro_area` VALUES (410711, '牧野区', 410700, 3);
INSERT INTO `fa_shopro_area` VALUES (410721, '新乡县', 410700, 3);
INSERT INTO `fa_shopro_area` VALUES (410724, '获嘉县', 410700, 3);
INSERT INTO `fa_shopro_area` VALUES (410725, '原阳县', 410700, 3);
INSERT INTO `fa_shopro_area` VALUES (410726, '延津县', 410700, 3);
INSERT INTO `fa_shopro_area` VALUES (410727, '封丘县', 410700, 3);
INSERT INTO `fa_shopro_area` VALUES (410728, '长垣县', 410700, 3);
INSERT INTO `fa_shopro_area` VALUES (410781, '卫辉市', 410700, 3);
INSERT INTO `fa_shopro_area` VALUES (410782, '辉县市', 410700, 3);
INSERT INTO `fa_shopro_area` VALUES (410800, '焦作市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (410802, '解放区', 410800, 3);
INSERT INTO `fa_shopro_area` VALUES (410803, '中站区', 410800, 3);
INSERT INTO `fa_shopro_area` VALUES (410804, '马村区', 410800, 3);
INSERT INTO `fa_shopro_area` VALUES (410811, '山阳区', 410800, 3);
INSERT INTO `fa_shopro_area` VALUES (410821, '修武县', 410800, 3);
INSERT INTO `fa_shopro_area` VALUES (410822, '博爱县', 410800, 3);
INSERT INTO `fa_shopro_area` VALUES (410823, '武陟县', 410800, 3);
INSERT INTO `fa_shopro_area` VALUES (410825, '温县', 410800, 3);
INSERT INTO `fa_shopro_area` VALUES (410882, '沁阳市', 410800, 3);
INSERT INTO `fa_shopro_area` VALUES (410883, '孟州市', 410800, 3);
INSERT INTO `fa_shopro_area` VALUES (410900, '濮阳市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (410902, '华龙区', 410900, 3);
INSERT INTO `fa_shopro_area` VALUES (410922, '清丰县', 410900, 3);
INSERT INTO `fa_shopro_area` VALUES (410923, '南乐县', 410900, 3);
INSERT INTO `fa_shopro_area` VALUES (410926, '范县', 410900, 3);
INSERT INTO `fa_shopro_area` VALUES (410927, '台前县', 410900, 3);
INSERT INTO `fa_shopro_area` VALUES (410928, '濮阳县', 410900, 3);
INSERT INTO `fa_shopro_area` VALUES (411000, '许昌市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (411002, '魏都区', 411000, 3);
INSERT INTO `fa_shopro_area` VALUES (411003, '建安区', 411000, 3);
INSERT INTO `fa_shopro_area` VALUES (411024, '鄢陵县', 411000, 3);
INSERT INTO `fa_shopro_area` VALUES (411025, '襄城县', 411000, 3);
INSERT INTO `fa_shopro_area` VALUES (411081, '禹州市', 411000, 3);
INSERT INTO `fa_shopro_area` VALUES (411082, '长葛市', 411000, 3);
INSERT INTO `fa_shopro_area` VALUES (411100, '漯河市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (411102, '源汇区', 411100, 3);
INSERT INTO `fa_shopro_area` VALUES (411103, '郾城区', 411100, 3);
INSERT INTO `fa_shopro_area` VALUES (411104, '召陵区', 411100, 3);
INSERT INTO `fa_shopro_area` VALUES (411121, '舞阳县', 411100, 3);
INSERT INTO `fa_shopro_area` VALUES (411122, '临颍县', 411100, 3);
INSERT INTO `fa_shopro_area` VALUES (411200, '三门峡市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (411202, '湖滨区', 411200, 3);
INSERT INTO `fa_shopro_area` VALUES (411203, '陕州区', 411200, 3);
INSERT INTO `fa_shopro_area` VALUES (411221, '渑池县', 411200, 3);
INSERT INTO `fa_shopro_area` VALUES (411224, '卢氏县', 411200, 3);
INSERT INTO `fa_shopro_area` VALUES (411281, '义马市', 411200, 3);
INSERT INTO `fa_shopro_area` VALUES (411282, '灵宝市', 411200, 3);
INSERT INTO `fa_shopro_area` VALUES (411300, '南阳市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (411302, '宛城区', 411300, 3);
INSERT INTO `fa_shopro_area` VALUES (411303, '卧龙区', 411300, 3);
INSERT INTO `fa_shopro_area` VALUES (411321, '南召县', 411300, 3);
INSERT INTO `fa_shopro_area` VALUES (411322, '方城县', 411300, 3);
INSERT INTO `fa_shopro_area` VALUES (411323, '西峡县', 411300, 3);
INSERT INTO `fa_shopro_area` VALUES (411324, '镇平县', 411300, 3);
INSERT INTO `fa_shopro_area` VALUES (411325, '内乡县', 411300, 3);
INSERT INTO `fa_shopro_area` VALUES (411326, '淅川县', 411300, 3);
INSERT INTO `fa_shopro_area` VALUES (411327, '社旗县', 411300, 3);
INSERT INTO `fa_shopro_area` VALUES (411328, '唐河县', 411300, 3);
INSERT INTO `fa_shopro_area` VALUES (411329, '新野县', 411300, 3);
INSERT INTO `fa_shopro_area` VALUES (411330, '桐柏县', 411300, 3);
INSERT INTO `fa_shopro_area` VALUES (411381, '邓州市', 411300, 3);
INSERT INTO `fa_shopro_area` VALUES (411400, '商丘市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (411402, '梁园区', 411400, 3);
INSERT INTO `fa_shopro_area` VALUES (411403, '睢阳区', 411400, 3);
INSERT INTO `fa_shopro_area` VALUES (411421, '民权县', 411400, 3);
INSERT INTO `fa_shopro_area` VALUES (411422, '睢县', 411400, 3);
INSERT INTO `fa_shopro_area` VALUES (411423, '宁陵县', 411400, 3);
INSERT INTO `fa_shopro_area` VALUES (411424, '柘城县', 411400, 3);
INSERT INTO `fa_shopro_area` VALUES (411425, '虞城县', 411400, 3);
INSERT INTO `fa_shopro_area` VALUES (411426, '夏邑县', 411400, 3);
INSERT INTO `fa_shopro_area` VALUES (411481, '永城市', 411400, 3);
INSERT INTO `fa_shopro_area` VALUES (411500, '信阳市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (411502, '浉河区', 411500, 3);
INSERT INTO `fa_shopro_area` VALUES (411503, '平桥区', 411500, 3);
INSERT INTO `fa_shopro_area` VALUES (411521, '罗山县', 411500, 3);
INSERT INTO `fa_shopro_area` VALUES (411522, '光山县', 411500, 3);
INSERT INTO `fa_shopro_area` VALUES (411523, '新县', 411500, 3);
INSERT INTO `fa_shopro_area` VALUES (411524, '商城县', 411500, 3);
INSERT INTO `fa_shopro_area` VALUES (411525, '固始县', 411500, 3);
INSERT INTO `fa_shopro_area` VALUES (411526, '潢川县', 411500, 3);
INSERT INTO `fa_shopro_area` VALUES (411527, '淮滨县', 411500, 3);
INSERT INTO `fa_shopro_area` VALUES (411528, '息县', 411500, 3);
INSERT INTO `fa_shopro_area` VALUES (411600, '周口市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (411602, '川汇区', 411600, 3);
INSERT INTO `fa_shopro_area` VALUES (411621, '扶沟县', 411600, 3);
INSERT INTO `fa_shopro_area` VALUES (411622, '西华县', 411600, 3);
INSERT INTO `fa_shopro_area` VALUES (411623, '商水县', 411600, 3);
INSERT INTO `fa_shopro_area` VALUES (411624, '沈丘县', 411600, 3);
INSERT INTO `fa_shopro_area` VALUES (411625, '郸城县', 411600, 3);
INSERT INTO `fa_shopro_area` VALUES (411626, '淮阳县', 411600, 3);
INSERT INTO `fa_shopro_area` VALUES (411627, '太康县', 411600, 3);
INSERT INTO `fa_shopro_area` VALUES (411628, '鹿邑县', 411600, 3);
INSERT INTO `fa_shopro_area` VALUES (411681, '项城市', 411600, 3);
INSERT INTO `fa_shopro_area` VALUES (411700, '驻马店市', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (411702, '驿城区', 411700, 3);
INSERT INTO `fa_shopro_area` VALUES (411721, '西平县', 411700, 3);
INSERT INTO `fa_shopro_area` VALUES (411722, '上蔡县', 411700, 3);
INSERT INTO `fa_shopro_area` VALUES (411723, '平舆县', 411700, 3);
INSERT INTO `fa_shopro_area` VALUES (411724, '正阳县', 411700, 3);
INSERT INTO `fa_shopro_area` VALUES (411725, '确山县', 411700, 3);
INSERT INTO `fa_shopro_area` VALUES (411726, '泌阳县', 411700, 3);
INSERT INTO `fa_shopro_area` VALUES (411727, '汝南县', 411700, 3);
INSERT INTO `fa_shopro_area` VALUES (411728, '遂平县', 411700, 3);
INSERT INTO `fa_shopro_area` VALUES (411729, '新蔡县', 411700, 3);
INSERT INTO `fa_shopro_area` VALUES (419000, '省直辖县级行政区划', 410000, 2);
INSERT INTO `fa_shopro_area` VALUES (419001, '济源市', 419000, 3);
INSERT INTO `fa_shopro_area` VALUES (420000, '湖北省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (420100, '武汉市', 420000, 2);
INSERT INTO `fa_shopro_area` VALUES (420102, '江岸区', 420100, 3);
INSERT INTO `fa_shopro_area` VALUES (420103, '江汉区', 420100, 3);
INSERT INTO `fa_shopro_area` VALUES (420104, '硚口区', 420100, 3);
INSERT INTO `fa_shopro_area` VALUES (420105, '汉阳区', 420100, 3);
INSERT INTO `fa_shopro_area` VALUES (420106, '武昌区', 420100, 3);
INSERT INTO `fa_shopro_area` VALUES (420107, '青山区', 420100, 3);
INSERT INTO `fa_shopro_area` VALUES (420111, '洪山区', 420100, 3);
INSERT INTO `fa_shopro_area` VALUES (420112, '东西湖区', 420100, 3);
INSERT INTO `fa_shopro_area` VALUES (420113, '汉南区', 420100, 3);
INSERT INTO `fa_shopro_area` VALUES (420114, '蔡甸区', 420100, 3);
INSERT INTO `fa_shopro_area` VALUES (420115, '江夏区', 420100, 3);
INSERT INTO `fa_shopro_area` VALUES (420116, '黄陂区', 420100, 3);
INSERT INTO `fa_shopro_area` VALUES (420117, '新洲区', 420100, 3);
INSERT INTO `fa_shopro_area` VALUES (420200, '黄石市', 420000, 2);
INSERT INTO `fa_shopro_area` VALUES (420202, '黄石港区', 420200, 3);
INSERT INTO `fa_shopro_area` VALUES (420203, '西塞山区', 420200, 3);
INSERT INTO `fa_shopro_area` VALUES (420204, '下陆区', 420200, 3);
INSERT INTO `fa_shopro_area` VALUES (420205, '铁山区', 420200, 3);
INSERT INTO `fa_shopro_area` VALUES (420222, '阳新县', 420200, 3);
INSERT INTO `fa_shopro_area` VALUES (420281, '大冶市', 420200, 3);
INSERT INTO `fa_shopro_area` VALUES (420300, '十堰市', 420000, 2);
INSERT INTO `fa_shopro_area` VALUES (420302, '茅箭区', 420300, 3);
INSERT INTO `fa_shopro_area` VALUES (420303, '张湾区', 420300, 3);
INSERT INTO `fa_shopro_area` VALUES (420304, '郧阳区', 420300, 3);
INSERT INTO `fa_shopro_area` VALUES (420322, '郧西县', 420300, 3);
INSERT INTO `fa_shopro_area` VALUES (420323, '竹山县', 420300, 3);
INSERT INTO `fa_shopro_area` VALUES (420324, '竹溪县', 420300, 3);
INSERT INTO `fa_shopro_area` VALUES (420325, '房县', 420300, 3);
INSERT INTO `fa_shopro_area` VALUES (420381, '丹江口市', 420300, 3);
INSERT INTO `fa_shopro_area` VALUES (420500, '宜昌市', 420000, 2);
INSERT INTO `fa_shopro_area` VALUES (420502, '西陵区', 420500, 3);
INSERT INTO `fa_shopro_area` VALUES (420503, '伍家岗区', 420500, 3);
INSERT INTO `fa_shopro_area` VALUES (420504, '点军区', 420500, 3);
INSERT INTO `fa_shopro_area` VALUES (420505, '猇亭区', 420500, 3);
INSERT INTO `fa_shopro_area` VALUES (420506, '夷陵区', 420500, 3);
INSERT INTO `fa_shopro_area` VALUES (420525, '远安县', 420500, 3);
INSERT INTO `fa_shopro_area` VALUES (420526, '兴山县', 420500, 3);
INSERT INTO `fa_shopro_area` VALUES (420527, '秭归县', 420500, 3);
INSERT INTO `fa_shopro_area` VALUES (420528, '长阳土家族自治县', 420500, 3);
INSERT INTO `fa_shopro_area` VALUES (420529, '五峰土家族自治县', 420500, 3);
INSERT INTO `fa_shopro_area` VALUES (420581, '宜都市', 420500, 3);
INSERT INTO `fa_shopro_area` VALUES (420582, '当阳市', 420500, 3);
INSERT INTO `fa_shopro_area` VALUES (420583, '枝江市', 420500, 3);
INSERT INTO `fa_shopro_area` VALUES (420600, '襄阳市', 420000, 2);
INSERT INTO `fa_shopro_area` VALUES (420602, '襄城区', 420600, 3);
INSERT INTO `fa_shopro_area` VALUES (420606, '樊城区', 420600, 3);
INSERT INTO `fa_shopro_area` VALUES (420607, '襄州区', 420600, 3);
INSERT INTO `fa_shopro_area` VALUES (420624, '南漳县', 420600, 3);
INSERT INTO `fa_shopro_area` VALUES (420625, '谷城县', 420600, 3);
INSERT INTO `fa_shopro_area` VALUES (420626, '保康县', 420600, 3);
INSERT INTO `fa_shopro_area` VALUES (420682, '老河口市', 420600, 3);
INSERT INTO `fa_shopro_area` VALUES (420683, '枣阳市', 420600, 3);
INSERT INTO `fa_shopro_area` VALUES (420684, '宜城市', 420600, 3);
INSERT INTO `fa_shopro_area` VALUES (420700, '鄂州市', 420000, 2);
INSERT INTO `fa_shopro_area` VALUES (420702, '梁子湖区', 420700, 3);
INSERT INTO `fa_shopro_area` VALUES (420703, '华容区', 420700, 3);
INSERT INTO `fa_shopro_area` VALUES (420704, '鄂城区', 420700, 3);
INSERT INTO `fa_shopro_area` VALUES (420800, '荆门市', 420000, 2);
INSERT INTO `fa_shopro_area` VALUES (420802, '东宝区', 420800, 3);
INSERT INTO `fa_shopro_area` VALUES (420804, '掇刀区', 420800, 3);
INSERT INTO `fa_shopro_area` VALUES (420821, '京山县', 420800, 3);
INSERT INTO `fa_shopro_area` VALUES (420822, '沙洋县', 420800, 3);
INSERT INTO `fa_shopro_area` VALUES (420881, '钟祥市', 420800, 3);
INSERT INTO `fa_shopro_area` VALUES (420900, '孝感市', 420000, 2);
INSERT INTO `fa_shopro_area` VALUES (420902, '孝南区', 420900, 3);
INSERT INTO `fa_shopro_area` VALUES (420921, '孝昌县', 420900, 3);
INSERT INTO `fa_shopro_area` VALUES (420922, '大悟县', 420900, 3);
INSERT INTO `fa_shopro_area` VALUES (420923, '云梦县', 420900, 3);
INSERT INTO `fa_shopro_area` VALUES (420981, '应城市', 420900, 3);
INSERT INTO `fa_shopro_area` VALUES (420982, '安陆市', 420900, 3);
INSERT INTO `fa_shopro_area` VALUES (420984, '汉川市', 420900, 3);
INSERT INTO `fa_shopro_area` VALUES (421000, '荆州市', 420000, 2);
INSERT INTO `fa_shopro_area` VALUES (421002, '沙市区', 421000, 3);
INSERT INTO `fa_shopro_area` VALUES (421003, '荆州区', 421000, 3);
INSERT INTO `fa_shopro_area` VALUES (421022, '公安县', 421000, 3);
INSERT INTO `fa_shopro_area` VALUES (421023, '监利县', 421000, 3);
INSERT INTO `fa_shopro_area` VALUES (421024, '江陵县', 421000, 3);
INSERT INTO `fa_shopro_area` VALUES (421081, '石首市', 421000, 3);
INSERT INTO `fa_shopro_area` VALUES (421083, '洪湖市', 421000, 3);
INSERT INTO `fa_shopro_area` VALUES (421087, '松滋市', 421000, 3);
INSERT INTO `fa_shopro_area` VALUES (421100, '黄冈市', 420000, 2);
INSERT INTO `fa_shopro_area` VALUES (421102, '黄州区', 421100, 3);
INSERT INTO `fa_shopro_area` VALUES (421121, '团风县', 421100, 3);
INSERT INTO `fa_shopro_area` VALUES (421122, '红安县', 421100, 3);
INSERT INTO `fa_shopro_area` VALUES (421123, '罗田县', 421100, 3);
INSERT INTO `fa_shopro_area` VALUES (421124, '英山县', 421100, 3);
INSERT INTO `fa_shopro_area` VALUES (421125, '浠水县', 421100, 3);
INSERT INTO `fa_shopro_area` VALUES (421126, '蕲春县', 421100, 3);
INSERT INTO `fa_shopro_area` VALUES (421127, '黄梅县', 421100, 3);
INSERT INTO `fa_shopro_area` VALUES (421181, '麻城市', 421100, 3);
INSERT INTO `fa_shopro_area` VALUES (421182, '武穴市', 421100, 3);
INSERT INTO `fa_shopro_area` VALUES (421200, '咸宁市', 420000, 2);
INSERT INTO `fa_shopro_area` VALUES (421202, '咸安区', 421200, 3);
INSERT INTO `fa_shopro_area` VALUES (421221, '嘉鱼县', 421200, 3);
INSERT INTO `fa_shopro_area` VALUES (421222, '通城县', 421200, 3);
INSERT INTO `fa_shopro_area` VALUES (421223, '崇阳县', 421200, 3);
INSERT INTO `fa_shopro_area` VALUES (421224, '通山县', 421200, 3);
INSERT INTO `fa_shopro_area` VALUES (421281, '赤壁市', 421200, 3);
INSERT INTO `fa_shopro_area` VALUES (421300, '随州市', 420000, 2);
INSERT INTO `fa_shopro_area` VALUES (421303, '曾都区', 421300, 3);
INSERT INTO `fa_shopro_area` VALUES (421321, '随县', 421300, 3);
INSERT INTO `fa_shopro_area` VALUES (421381, '广水市', 421300, 3);
INSERT INTO `fa_shopro_area` VALUES (422800, '恩施土家族苗族自治州', 420000, 2);
INSERT INTO `fa_shopro_area` VALUES (422801, '恩施市', 422800, 3);
INSERT INTO `fa_shopro_area` VALUES (422802, '利川市', 422800, 3);
INSERT INTO `fa_shopro_area` VALUES (422822, '建始县', 422800, 3);
INSERT INTO `fa_shopro_area` VALUES (422823, '巴东县', 422800, 3);
INSERT INTO `fa_shopro_area` VALUES (422825, '宣恩县', 422800, 3);
INSERT INTO `fa_shopro_area` VALUES (422826, '咸丰县', 422800, 3);
INSERT INTO `fa_shopro_area` VALUES (422827, '来凤县', 422800, 3);
INSERT INTO `fa_shopro_area` VALUES (422828, '鹤峰县', 422800, 3);
INSERT INTO `fa_shopro_area` VALUES (429000, '省直辖县级行政区划', 420000, 2);
INSERT INTO `fa_shopro_area` VALUES (429004, '仙桃市', 429000, 3);
INSERT INTO `fa_shopro_area` VALUES (429005, '潜江市', 429000, 3);
INSERT INTO `fa_shopro_area` VALUES (429006, '天门市', 429000, 3);
INSERT INTO `fa_shopro_area` VALUES (429021, '神农架林区', 429000, 3);
INSERT INTO `fa_shopro_area` VALUES (430000, '湖南省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (430100, '长沙市', 430000, 2);
INSERT INTO `fa_shopro_area` VALUES (430102, '芙蓉区', 430100, 3);
INSERT INTO `fa_shopro_area` VALUES (430103, '天心区', 430100, 3);
INSERT INTO `fa_shopro_area` VALUES (430104, '岳麓区', 430100, 3);
INSERT INTO `fa_shopro_area` VALUES (430105, '开福区', 430100, 3);
INSERT INTO `fa_shopro_area` VALUES (430111, '雨花区', 430100, 3);
INSERT INTO `fa_shopro_area` VALUES (430112, '望城区', 430100, 3);
INSERT INTO `fa_shopro_area` VALUES (430121, '长沙县', 430100, 3);
INSERT INTO `fa_shopro_area` VALUES (430181, '浏阳市', 430100, 3);
INSERT INTO `fa_shopro_area` VALUES (430182, '宁乡市', 430100, 3);
INSERT INTO `fa_shopro_area` VALUES (430200, '株洲市', 430000, 2);
INSERT INTO `fa_shopro_area` VALUES (430202, '荷塘区', 430200, 3);
INSERT INTO `fa_shopro_area` VALUES (430203, '芦淞区', 430200, 3);
INSERT INTO `fa_shopro_area` VALUES (430204, '石峰区', 430200, 3);
INSERT INTO `fa_shopro_area` VALUES (430211, '天元区', 430200, 3);
INSERT INTO `fa_shopro_area` VALUES (430221, '株洲县', 430200, 3);
INSERT INTO `fa_shopro_area` VALUES (430223, '攸县', 430200, 3);
INSERT INTO `fa_shopro_area` VALUES (430224, '茶陵县', 430200, 3);
INSERT INTO `fa_shopro_area` VALUES (430225, '炎陵县', 430200, 3);
INSERT INTO `fa_shopro_area` VALUES (430281, '醴陵市', 430200, 3);
INSERT INTO `fa_shopro_area` VALUES (430300, '湘潭市', 430000, 2);
INSERT INTO `fa_shopro_area` VALUES (430302, '雨湖区', 430300, 3);
INSERT INTO `fa_shopro_area` VALUES (430304, '岳塘区', 430300, 3);
INSERT INTO `fa_shopro_area` VALUES (430321, '湘潭县', 430300, 3);
INSERT INTO `fa_shopro_area` VALUES (430381, '湘乡市', 430300, 3);
INSERT INTO `fa_shopro_area` VALUES (430382, '韶山市', 430300, 3);
INSERT INTO `fa_shopro_area` VALUES (430400, '衡阳市', 430000, 2);
INSERT INTO `fa_shopro_area` VALUES (430405, '珠晖区', 430400, 3);
INSERT INTO `fa_shopro_area` VALUES (430406, '雁峰区', 430400, 3);
INSERT INTO `fa_shopro_area` VALUES (430407, '石鼓区', 430400, 3);
INSERT INTO `fa_shopro_area` VALUES (430408, '蒸湘区', 430400, 3);
INSERT INTO `fa_shopro_area` VALUES (430412, '南岳区', 430400, 3);
INSERT INTO `fa_shopro_area` VALUES (430421, '衡阳县', 430400, 3);
INSERT INTO `fa_shopro_area` VALUES (430422, '衡南县', 430400, 3);
INSERT INTO `fa_shopro_area` VALUES (430423, '衡山县', 430400, 3);
INSERT INTO `fa_shopro_area` VALUES (430424, '衡东县', 430400, 3);
INSERT INTO `fa_shopro_area` VALUES (430426, '祁东县', 430400, 3);
INSERT INTO `fa_shopro_area` VALUES (430481, '耒阳市', 430400, 3);
INSERT INTO `fa_shopro_area` VALUES (430482, '常宁市', 430400, 3);
INSERT INTO `fa_shopro_area` VALUES (430500, '邵阳市', 430000, 2);
INSERT INTO `fa_shopro_area` VALUES (430502, '双清区', 430500, 3);
INSERT INTO `fa_shopro_area` VALUES (430503, '大祥区', 430500, 3);
INSERT INTO `fa_shopro_area` VALUES (430511, '北塔区', 430500, 3);
INSERT INTO `fa_shopro_area` VALUES (430521, '邵东县', 430500, 3);
INSERT INTO `fa_shopro_area` VALUES (430522, '新邵县', 430500, 3);
INSERT INTO `fa_shopro_area` VALUES (430523, '邵阳县', 430500, 3);
INSERT INTO `fa_shopro_area` VALUES (430524, '隆回县', 430500, 3);
INSERT INTO `fa_shopro_area` VALUES (430525, '洞口县', 430500, 3);
INSERT INTO `fa_shopro_area` VALUES (430527, '绥宁县', 430500, 3);
INSERT INTO `fa_shopro_area` VALUES (430528, '新宁县', 430500, 3);
INSERT INTO `fa_shopro_area` VALUES (430529, '城步苗族自治县', 430500, 3);
INSERT INTO `fa_shopro_area` VALUES (430581, '武冈市', 430500, 3);
INSERT INTO `fa_shopro_area` VALUES (430600, '岳阳市', 430000, 2);
INSERT INTO `fa_shopro_area` VALUES (430602, '岳阳楼区', 430600, 3);
INSERT INTO `fa_shopro_area` VALUES (430603, '云溪区', 430600, 3);
INSERT INTO `fa_shopro_area` VALUES (430611, '君山区', 430600, 3);
INSERT INTO `fa_shopro_area` VALUES (430621, '岳阳县', 430600, 3);
INSERT INTO `fa_shopro_area` VALUES (430623, '华容县', 430600, 3);
INSERT INTO `fa_shopro_area` VALUES (430624, '湘阴县', 430600, 3);
INSERT INTO `fa_shopro_area` VALUES (430626, '平江县', 430600, 3);
INSERT INTO `fa_shopro_area` VALUES (430681, '汨罗市', 430600, 3);
INSERT INTO `fa_shopro_area` VALUES (430682, '临湘市', 430600, 3);
INSERT INTO `fa_shopro_area` VALUES (430700, '常德市', 430000, 2);
INSERT INTO `fa_shopro_area` VALUES (430702, '武陵区', 430700, 3);
INSERT INTO `fa_shopro_area` VALUES (430703, '鼎城区', 430700, 3);
INSERT INTO `fa_shopro_area` VALUES (430721, '安乡县', 430700, 3);
INSERT INTO `fa_shopro_area` VALUES (430722, '汉寿县', 430700, 3);
INSERT INTO `fa_shopro_area` VALUES (430723, '澧县', 430700, 3);
INSERT INTO `fa_shopro_area` VALUES (430724, '临澧县', 430700, 3);
INSERT INTO `fa_shopro_area` VALUES (430725, '桃源县', 430700, 3);
INSERT INTO `fa_shopro_area` VALUES (430726, '石门县', 430700, 3);
INSERT INTO `fa_shopro_area` VALUES (430781, '津市市', 430700, 3);
INSERT INTO `fa_shopro_area` VALUES (430800, '张家界市', 430000, 2);
INSERT INTO `fa_shopro_area` VALUES (430802, '永定区', 430800, 3);
INSERT INTO `fa_shopro_area` VALUES (430811, '武陵源区', 430800, 3);
INSERT INTO `fa_shopro_area` VALUES (430821, '慈利县', 430800, 3);
INSERT INTO `fa_shopro_area` VALUES (430822, '桑植县', 430800, 3);
INSERT INTO `fa_shopro_area` VALUES (430900, '益阳市', 430000, 2);
INSERT INTO `fa_shopro_area` VALUES (430902, '资阳区', 430900, 3);
INSERT INTO `fa_shopro_area` VALUES (430903, '赫山区', 430900, 3);
INSERT INTO `fa_shopro_area` VALUES (430921, '南县', 430900, 3);
INSERT INTO `fa_shopro_area` VALUES (430922, '桃江县', 430900, 3);
INSERT INTO `fa_shopro_area` VALUES (430923, '安化县', 430900, 3);
INSERT INTO `fa_shopro_area` VALUES (430981, '沅江市', 430900, 3);
INSERT INTO `fa_shopro_area` VALUES (431000, '郴州市', 430000, 2);
INSERT INTO `fa_shopro_area` VALUES (431002, '北湖区', 431000, 3);
INSERT INTO `fa_shopro_area` VALUES (431003, '苏仙区', 431000, 3);
INSERT INTO `fa_shopro_area` VALUES (431021, '桂阳县', 431000, 3);
INSERT INTO `fa_shopro_area` VALUES (431022, '宜章县', 431000, 3);
INSERT INTO `fa_shopro_area` VALUES (431023, '永兴县', 431000, 3);
INSERT INTO `fa_shopro_area` VALUES (431024, '嘉禾县', 431000, 3);
INSERT INTO `fa_shopro_area` VALUES (431025, '临武县', 431000, 3);
INSERT INTO `fa_shopro_area` VALUES (431026, '汝城县', 431000, 3);
INSERT INTO `fa_shopro_area` VALUES (431027, '桂东县', 431000, 3);
INSERT INTO `fa_shopro_area` VALUES (431028, '安仁县', 431000, 3);
INSERT INTO `fa_shopro_area` VALUES (431081, '资兴市', 431000, 3);
INSERT INTO `fa_shopro_area` VALUES (431100, '永州市', 430000, 2);
INSERT INTO `fa_shopro_area` VALUES (431102, '零陵区', 431100, 3);
INSERT INTO `fa_shopro_area` VALUES (431103, '冷水滩区', 431100, 3);
INSERT INTO `fa_shopro_area` VALUES (431121, '祁阳县', 431100, 3);
INSERT INTO `fa_shopro_area` VALUES (431122, '东安县', 431100, 3);
INSERT INTO `fa_shopro_area` VALUES (431123, '双牌县', 431100, 3);
INSERT INTO `fa_shopro_area` VALUES (431124, '道县', 431100, 3);
INSERT INTO `fa_shopro_area` VALUES (431125, '江永县', 431100, 3);
INSERT INTO `fa_shopro_area` VALUES (431126, '宁远县', 431100, 3);
INSERT INTO `fa_shopro_area` VALUES (431127, '蓝山县', 431100, 3);
INSERT INTO `fa_shopro_area` VALUES (431128, '新田县', 431100, 3);
INSERT INTO `fa_shopro_area` VALUES (431129, '江华瑶族自治县', 431100, 3);
INSERT INTO `fa_shopro_area` VALUES (431200, '怀化市', 430000, 2);
INSERT INTO `fa_shopro_area` VALUES (431202, '鹤城区', 431200, 3);
INSERT INTO `fa_shopro_area` VALUES (431221, '中方县', 431200, 3);
INSERT INTO `fa_shopro_area` VALUES (431222, '沅陵县', 431200, 3);
INSERT INTO `fa_shopro_area` VALUES (431223, '辰溪县', 431200, 3);
INSERT INTO `fa_shopro_area` VALUES (431224, '溆浦县', 431200, 3);
INSERT INTO `fa_shopro_area` VALUES (431225, '会同县', 431200, 3);
INSERT INTO `fa_shopro_area` VALUES (431226, '麻阳苗族自治县', 431200, 3);
INSERT INTO `fa_shopro_area` VALUES (431227, '新晃侗族自治县', 431200, 3);
INSERT INTO `fa_shopro_area` VALUES (431228, '芷江侗族自治县', 431200, 3);
INSERT INTO `fa_shopro_area` VALUES (431229, '靖州苗族侗族自治县', 431200, 3);
INSERT INTO `fa_shopro_area` VALUES (431230, '通道侗族自治县', 431200, 3);
INSERT INTO `fa_shopro_area` VALUES (431281, '洪江市', 431200, 3);
INSERT INTO `fa_shopro_area` VALUES (431300, '娄底市', 430000, 2);
INSERT INTO `fa_shopro_area` VALUES (431302, '娄星区', 431300, 3);
INSERT INTO `fa_shopro_area` VALUES (431321, '双峰县', 431300, 3);
INSERT INTO `fa_shopro_area` VALUES (431322, '新化县', 431300, 3);
INSERT INTO `fa_shopro_area` VALUES (431381, '冷水江市', 431300, 3);
INSERT INTO `fa_shopro_area` VALUES (431382, '涟源市', 431300, 3);
INSERT INTO `fa_shopro_area` VALUES (433100, '湘西土家族苗族自治州', 430000, 2);
INSERT INTO `fa_shopro_area` VALUES (433101, '吉首市', 433100, 3);
INSERT INTO `fa_shopro_area` VALUES (433122, '泸溪县', 433100, 3);
INSERT INTO `fa_shopro_area` VALUES (433123, '凤凰县', 433100, 3);
INSERT INTO `fa_shopro_area` VALUES (433124, '花垣县', 433100, 3);
INSERT INTO `fa_shopro_area` VALUES (433125, '保靖县', 433100, 3);
INSERT INTO `fa_shopro_area` VALUES (433126, '古丈县', 433100, 3);
INSERT INTO `fa_shopro_area` VALUES (433127, '永顺县', 433100, 3);
INSERT INTO `fa_shopro_area` VALUES (433130, '龙山县', 433100, 3);
INSERT INTO `fa_shopro_area` VALUES (440000, '广东省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (440100, '广州市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (440103, '荔湾区', 440100, 3);
INSERT INTO `fa_shopro_area` VALUES (440104, '越秀区', 440100, 3);
INSERT INTO `fa_shopro_area` VALUES (440105, '海珠区', 440100, 3);
INSERT INTO `fa_shopro_area` VALUES (440106, '天河区', 440100, 3);
INSERT INTO `fa_shopro_area` VALUES (440111, '白云区', 440100, 3);
INSERT INTO `fa_shopro_area` VALUES (440112, '黄埔区', 440100, 3);
INSERT INTO `fa_shopro_area` VALUES (440113, '番禺区', 440100, 3);
INSERT INTO `fa_shopro_area` VALUES (440114, '花都区', 440100, 3);
INSERT INTO `fa_shopro_area` VALUES (440115, '南沙区', 440100, 3);
INSERT INTO `fa_shopro_area` VALUES (440117, '从化区', 440100, 3);
INSERT INTO `fa_shopro_area` VALUES (440118, '增城区', 440100, 3);
INSERT INTO `fa_shopro_area` VALUES (440200, '韶关市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (440203, '武江区', 440200, 3);
INSERT INTO `fa_shopro_area` VALUES (440204, '浈江区', 440200, 3);
INSERT INTO `fa_shopro_area` VALUES (440205, '曲江区', 440200, 3);
INSERT INTO `fa_shopro_area` VALUES (440222, '始兴县', 440200, 3);
INSERT INTO `fa_shopro_area` VALUES (440224, '仁化县', 440200, 3);
INSERT INTO `fa_shopro_area` VALUES (440229, '翁源县', 440200, 3);
INSERT INTO `fa_shopro_area` VALUES (440232, '乳源瑶族自治县', 440200, 3);
INSERT INTO `fa_shopro_area` VALUES (440233, '新丰县', 440200, 3);
INSERT INTO `fa_shopro_area` VALUES (440281, '乐昌市', 440200, 3);
INSERT INTO `fa_shopro_area` VALUES (440282, '南雄市', 440200, 3);
INSERT INTO `fa_shopro_area` VALUES (440300, '深圳市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (440303, '罗湖区', 440300, 3);
INSERT INTO `fa_shopro_area` VALUES (440304, '福田区', 440300, 3);
INSERT INTO `fa_shopro_area` VALUES (440305, '南山区', 440300, 3);
INSERT INTO `fa_shopro_area` VALUES (440306, '宝安区', 440300, 3);
INSERT INTO `fa_shopro_area` VALUES (440307, '龙岗区', 440300, 3);
INSERT INTO `fa_shopro_area` VALUES (440308, '盐田区', 440300, 3);
INSERT INTO `fa_shopro_area` VALUES (440309, '龙华区', 440300, 3);
INSERT INTO `fa_shopro_area` VALUES (440310, '坪山区', 440300, 3);
INSERT INTO `fa_shopro_area` VALUES (440400, '珠海市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (440402, '香洲区', 440400, 3);
INSERT INTO `fa_shopro_area` VALUES (440403, '斗门区', 440400, 3);
INSERT INTO `fa_shopro_area` VALUES (440404, '金湾区', 440400, 3);
INSERT INTO `fa_shopro_area` VALUES (440500, '汕头市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (440507, '龙湖区', 440500, 3);
INSERT INTO `fa_shopro_area` VALUES (440511, '金平区', 440500, 3);
INSERT INTO `fa_shopro_area` VALUES (440512, '濠江区', 440500, 3);
INSERT INTO `fa_shopro_area` VALUES (440513, '潮阳区', 440500, 3);
INSERT INTO `fa_shopro_area` VALUES (440514, '潮南区', 440500, 3);
INSERT INTO `fa_shopro_area` VALUES (440515, '澄海区', 440500, 3);
INSERT INTO `fa_shopro_area` VALUES (440523, '南澳县', 440500, 3);
INSERT INTO `fa_shopro_area` VALUES (440600, '佛山市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (440604, '禅城区', 440600, 3);
INSERT INTO `fa_shopro_area` VALUES (440605, '南海区', 440600, 3);
INSERT INTO `fa_shopro_area` VALUES (440606, '顺德区', 440600, 3);
INSERT INTO `fa_shopro_area` VALUES (440607, '三水区', 440600, 3);
INSERT INTO `fa_shopro_area` VALUES (440608, '高明区', 440600, 3);
INSERT INTO `fa_shopro_area` VALUES (440700, '江门市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (440703, '蓬江区', 440700, 3);
INSERT INTO `fa_shopro_area` VALUES (440704, '江海区', 440700, 3);
INSERT INTO `fa_shopro_area` VALUES (440705, '新会区', 440700, 3);
INSERT INTO `fa_shopro_area` VALUES (440781, '台山市', 440700, 3);
INSERT INTO `fa_shopro_area` VALUES (440783, '开平市', 440700, 3);
INSERT INTO `fa_shopro_area` VALUES (440784, '鹤山市', 440700, 3);
INSERT INTO `fa_shopro_area` VALUES (440785, '恩平市', 440700, 3);
INSERT INTO `fa_shopro_area` VALUES (440800, '湛江市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (440802, '赤坎区', 440800, 3);
INSERT INTO `fa_shopro_area` VALUES (440803, '霞山区', 440800, 3);
INSERT INTO `fa_shopro_area` VALUES (440804, '坡头区', 440800, 3);
INSERT INTO `fa_shopro_area` VALUES (440811, '麻章区', 440800, 3);
INSERT INTO `fa_shopro_area` VALUES (440823, '遂溪县', 440800, 3);
INSERT INTO `fa_shopro_area` VALUES (440825, '徐闻县', 440800, 3);
INSERT INTO `fa_shopro_area` VALUES (440881, '廉江市', 440800, 3);
INSERT INTO `fa_shopro_area` VALUES (440882, '雷州市', 440800, 3);
INSERT INTO `fa_shopro_area` VALUES (440883, '吴川市', 440800, 3);
INSERT INTO `fa_shopro_area` VALUES (440900, '茂名市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (440902, '茂南区', 440900, 3);
INSERT INTO `fa_shopro_area` VALUES (440904, '电白区', 440900, 3);
INSERT INTO `fa_shopro_area` VALUES (440981, '高州市', 440900, 3);
INSERT INTO `fa_shopro_area` VALUES (440982, '化州市', 440900, 3);
INSERT INTO `fa_shopro_area` VALUES (440983, '信宜市', 440900, 3);
INSERT INTO `fa_shopro_area` VALUES (441200, '肇庆市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (441202, '端州区', 441200, 3);
INSERT INTO `fa_shopro_area` VALUES (441203, '鼎湖区', 441200, 3);
INSERT INTO `fa_shopro_area` VALUES (441204, '高要区', 441200, 3);
INSERT INTO `fa_shopro_area` VALUES (441223, '广宁县', 441200, 3);
INSERT INTO `fa_shopro_area` VALUES (441224, '怀集县', 441200, 3);
INSERT INTO `fa_shopro_area` VALUES (441225, '封开县', 441200, 3);
INSERT INTO `fa_shopro_area` VALUES (441226, '德庆县', 441200, 3);
INSERT INTO `fa_shopro_area` VALUES (441284, '四会市', 441200, 3);
INSERT INTO `fa_shopro_area` VALUES (441300, '惠州市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (441302, '惠城区', 441300, 3);
INSERT INTO `fa_shopro_area` VALUES (441303, '惠阳区', 441300, 3);
INSERT INTO `fa_shopro_area` VALUES (441322, '博罗县', 441300, 3);
INSERT INTO `fa_shopro_area` VALUES (441323, '惠东县', 441300, 3);
INSERT INTO `fa_shopro_area` VALUES (441324, '龙门县', 441300, 3);
INSERT INTO `fa_shopro_area` VALUES (441400, '梅州市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (441402, '梅江区', 441400, 3);
INSERT INTO `fa_shopro_area` VALUES (441403, '梅县区', 441400, 3);
INSERT INTO `fa_shopro_area` VALUES (441422, '大埔县', 441400, 3);
INSERT INTO `fa_shopro_area` VALUES (441423, '丰顺县', 441400, 3);
INSERT INTO `fa_shopro_area` VALUES (441424, '五华县', 441400, 3);
INSERT INTO `fa_shopro_area` VALUES (441426, '平远县', 441400, 3);
INSERT INTO `fa_shopro_area` VALUES (441427, '蕉岭县', 441400, 3);
INSERT INTO `fa_shopro_area` VALUES (441481, '兴宁市', 441400, 3);
INSERT INTO `fa_shopro_area` VALUES (441500, '汕尾市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (441502, '城区', 441500, 3);
INSERT INTO `fa_shopro_area` VALUES (441521, '海丰县', 441500, 3);
INSERT INTO `fa_shopro_area` VALUES (441523, '陆河县', 441500, 3);
INSERT INTO `fa_shopro_area` VALUES (441581, '陆丰市', 441500, 3);
INSERT INTO `fa_shopro_area` VALUES (441600, '河源市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (441602, '源城区', 441600, 3);
INSERT INTO `fa_shopro_area` VALUES (441621, '紫金县', 441600, 3);
INSERT INTO `fa_shopro_area` VALUES (441622, '龙川县', 441600, 3);
INSERT INTO `fa_shopro_area` VALUES (441623, '连平县', 441600, 3);
INSERT INTO `fa_shopro_area` VALUES (441624, '和平县', 441600, 3);
INSERT INTO `fa_shopro_area` VALUES (441625, '东源县', 441600, 3);
INSERT INTO `fa_shopro_area` VALUES (441700, '阳江市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (441702, '江城区', 441700, 3);
INSERT INTO `fa_shopro_area` VALUES (441704, '阳东区', 441700, 3);
INSERT INTO `fa_shopro_area` VALUES (441721, '阳西县', 441700, 3);
INSERT INTO `fa_shopro_area` VALUES (441781, '阳春市', 441700, 3);
INSERT INTO `fa_shopro_area` VALUES (441800, '清远市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (441802, '清城区', 441800, 3);
INSERT INTO `fa_shopro_area` VALUES (441803, '清新区', 441800, 3);
INSERT INTO `fa_shopro_area` VALUES (441821, '佛冈县', 441800, 3);
INSERT INTO `fa_shopro_area` VALUES (441823, '阳山县', 441800, 3);
INSERT INTO `fa_shopro_area` VALUES (441825, '连山壮族瑶族自治县', 441800, 3);
INSERT INTO `fa_shopro_area` VALUES (441826, '连南瑶族自治县', 441800, 3);
INSERT INTO `fa_shopro_area` VALUES (441881, '英德市', 441800, 3);
INSERT INTO `fa_shopro_area` VALUES (441882, '连州市', 441800, 3);
INSERT INTO `fa_shopro_area` VALUES (441900, '东莞市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (441901, '东城街道', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441902, '南城街道', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441903, '万江街道', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441904, '莞城街道', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441905, '石碣镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441906, '石龙镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441907, '茶山镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441908, '石排镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441909, '企石镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441910, '横沥镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441911, '桥头镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441912, '谢岗镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441913, '东坑镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441914, '常平镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441915, '寮步镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441916, '樟木头镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441917, '大朗镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441918, '黄江镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441919, '清溪镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441920, '塘厦镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441921, '凤岗镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441922, '大岭山镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441923, '长安镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441924, '虎门镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441925, '厚街镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441926, '沙田镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441927, '道滘镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441928, '洪梅镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441929, '麻涌镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441930, '望牛墩镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441931, '中堂镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441932, '高埗镇', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441933, '松山湖管委会', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441934, '虎门港管委会', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (441935, '东莞生态园', 441900, 3);
INSERT INTO `fa_shopro_area` VALUES (442000, '中山市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (442001, '石岐区街道', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442002, '东区街道', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442003, '火炬开发区', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442004, '西区街道', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442005, '南区街道', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442006, '五桂山街道', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442007, '小榄镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442008, '黄圃镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442009, '民众镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442010, '东凤镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442011, '东升镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442012, '古镇镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442013, '沙溪镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442014, '坦洲镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442015, '港口镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442016, '三角镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442017, '横栏镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442018, '南头镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442019, '阜沙镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442020, '南朗镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442021, '三乡镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442022, '板芙镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442023, '大涌镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (442024, '神湾镇', 442000, 3);
INSERT INTO `fa_shopro_area` VALUES (445100, '潮州市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (445102, '湘桥区', 445100, 3);
INSERT INTO `fa_shopro_area` VALUES (445103, '潮安区', 445100, 3);
INSERT INTO `fa_shopro_area` VALUES (445122, '饶平县', 445100, 3);
INSERT INTO `fa_shopro_area` VALUES (445200, '揭阳市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (445202, '榕城区', 445200, 3);
INSERT INTO `fa_shopro_area` VALUES (445203, '揭东区', 445200, 3);
INSERT INTO `fa_shopro_area` VALUES (445222, '揭西县', 445200, 3);
INSERT INTO `fa_shopro_area` VALUES (445224, '惠来县', 445200, 3);
INSERT INTO `fa_shopro_area` VALUES (445281, '普宁市', 445200, 3);
INSERT INTO `fa_shopro_area` VALUES (445300, '云浮市', 440000, 2);
INSERT INTO `fa_shopro_area` VALUES (445302, '云城区', 445300, 3);
INSERT INTO `fa_shopro_area` VALUES (445303, '云安区', 445300, 3);
INSERT INTO `fa_shopro_area` VALUES (445321, '新兴县', 445300, 3);
INSERT INTO `fa_shopro_area` VALUES (445322, '郁南县', 445300, 3);
INSERT INTO `fa_shopro_area` VALUES (445381, '罗定市', 445300, 3);
INSERT INTO `fa_shopro_area` VALUES (450000, '广西壮族自治区', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (450100, '南宁市', 450000, 2);
INSERT INTO `fa_shopro_area` VALUES (450102, '兴宁区', 450100, 3);
INSERT INTO `fa_shopro_area` VALUES (450103, '青秀区', 450100, 3);
INSERT INTO `fa_shopro_area` VALUES (450105, '江南区', 450100, 3);
INSERT INTO `fa_shopro_area` VALUES (450107, '西乡塘区', 450100, 3);
INSERT INTO `fa_shopro_area` VALUES (450108, '良庆区', 450100, 3);
INSERT INTO `fa_shopro_area` VALUES (450109, '邕宁区', 450100, 3);
INSERT INTO `fa_shopro_area` VALUES (450110, '武鸣区', 450100, 3);
INSERT INTO `fa_shopro_area` VALUES (450123, '隆安县', 450100, 3);
INSERT INTO `fa_shopro_area` VALUES (450124, '马山县', 450100, 3);
INSERT INTO `fa_shopro_area` VALUES (450125, '上林县', 450100, 3);
INSERT INTO `fa_shopro_area` VALUES (450126, '宾阳县', 450100, 3);
INSERT INTO `fa_shopro_area` VALUES (450127, '横县', 450100, 3);
INSERT INTO `fa_shopro_area` VALUES (450200, '柳州市', 450000, 2);
INSERT INTO `fa_shopro_area` VALUES (450202, '城中区', 450200, 3);
INSERT INTO `fa_shopro_area` VALUES (450203, '鱼峰区', 450200, 3);
INSERT INTO `fa_shopro_area` VALUES (450204, '柳南区', 450200, 3);
INSERT INTO `fa_shopro_area` VALUES (450205, '柳北区', 450200, 3);
INSERT INTO `fa_shopro_area` VALUES (450206, '柳江区', 450200, 3);
INSERT INTO `fa_shopro_area` VALUES (450222, '柳城县', 450200, 3);
INSERT INTO `fa_shopro_area` VALUES (450223, '鹿寨县', 450200, 3);
INSERT INTO `fa_shopro_area` VALUES (450224, '融安县', 450200, 3);
INSERT INTO `fa_shopro_area` VALUES (450225, '融水苗族自治县', 450200, 3);
INSERT INTO `fa_shopro_area` VALUES (450226, '三江侗族自治县', 450200, 3);
INSERT INTO `fa_shopro_area` VALUES (450300, '桂林市', 450000, 2);
INSERT INTO `fa_shopro_area` VALUES (450302, '秀峰区', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450303, '叠彩区', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450304, '象山区', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450305, '七星区', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450311, '雁山区', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450312, '临桂区', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450321, '阳朔县', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450323, '灵川县', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450324, '全州县', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450325, '兴安县', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450326, '永福县', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450327, '灌阳县', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450328, '龙胜各族自治县', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450329, '资源县', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450330, '平乐县', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450331, '荔浦县', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450332, '恭城瑶族自治县', 450300, 3);
INSERT INTO `fa_shopro_area` VALUES (450400, '梧州市', 450000, 2);
INSERT INTO `fa_shopro_area` VALUES (450403, '万秀区', 450400, 3);
INSERT INTO `fa_shopro_area` VALUES (450405, '长洲区', 450400, 3);
INSERT INTO `fa_shopro_area` VALUES (450406, '龙圩区', 450400, 3);
INSERT INTO `fa_shopro_area` VALUES (450421, '苍梧县', 450400, 3);
INSERT INTO `fa_shopro_area` VALUES (450422, '藤县', 450400, 3);
INSERT INTO `fa_shopro_area` VALUES (450423, '蒙山县', 450400, 3);
INSERT INTO `fa_shopro_area` VALUES (450481, '岑溪市', 450400, 3);
INSERT INTO `fa_shopro_area` VALUES (450500, '北海市', 450000, 2);
INSERT INTO `fa_shopro_area` VALUES (450502, '海城区', 450500, 3);
INSERT INTO `fa_shopro_area` VALUES (450503, '银海区', 450500, 3);
INSERT INTO `fa_shopro_area` VALUES (450512, '铁山港区', 450500, 3);
INSERT INTO `fa_shopro_area` VALUES (450521, '合浦县', 450500, 3);
INSERT INTO `fa_shopro_area` VALUES (450600, '防城港市', 450000, 2);
INSERT INTO `fa_shopro_area` VALUES (450602, '港口区', 450600, 3);
INSERT INTO `fa_shopro_area` VALUES (450603, '防城区', 450600, 3);
INSERT INTO `fa_shopro_area` VALUES (450621, '上思县', 450600, 3);
INSERT INTO `fa_shopro_area` VALUES (450681, '东兴市', 450600, 3);
INSERT INTO `fa_shopro_area` VALUES (450700, '钦州市', 450000, 2);
INSERT INTO `fa_shopro_area` VALUES (450702, '钦南区', 450700, 3);
INSERT INTO `fa_shopro_area` VALUES (450703, '钦北区', 450700, 3);
INSERT INTO `fa_shopro_area` VALUES (450721, '灵山县', 450700, 3);
INSERT INTO `fa_shopro_area` VALUES (450722, '浦北县', 450700, 3);
INSERT INTO `fa_shopro_area` VALUES (450800, '贵港市', 450000, 2);
INSERT INTO `fa_shopro_area` VALUES (450802, '港北区', 450800, 3);
INSERT INTO `fa_shopro_area` VALUES (450803, '港南区', 450800, 3);
INSERT INTO `fa_shopro_area` VALUES (450804, '覃塘区', 450800, 3);
INSERT INTO `fa_shopro_area` VALUES (450821, '平南县', 450800, 3);
INSERT INTO `fa_shopro_area` VALUES (450881, '桂平市', 450800, 3);
INSERT INTO `fa_shopro_area` VALUES (450900, '玉林市', 450000, 2);
INSERT INTO `fa_shopro_area` VALUES (450902, '玉州区', 450900, 3);
INSERT INTO `fa_shopro_area` VALUES (450903, '福绵区', 450900, 3);
INSERT INTO `fa_shopro_area` VALUES (450921, '容县', 450900, 3);
INSERT INTO `fa_shopro_area` VALUES (450922, '陆川县', 450900, 3);
INSERT INTO `fa_shopro_area` VALUES (450923, '博白县', 450900, 3);
INSERT INTO `fa_shopro_area` VALUES (450924, '兴业县', 450900, 3);
INSERT INTO `fa_shopro_area` VALUES (450981, '北流市', 450900, 3);
INSERT INTO `fa_shopro_area` VALUES (451000, '百色市', 450000, 2);
INSERT INTO `fa_shopro_area` VALUES (451002, '右江区', 451000, 3);
INSERT INTO `fa_shopro_area` VALUES (451021, '田阳县', 451000, 3);
INSERT INTO `fa_shopro_area` VALUES (451022, '田东县', 451000, 3);
INSERT INTO `fa_shopro_area` VALUES (451023, '平果县', 451000, 3);
INSERT INTO `fa_shopro_area` VALUES (451024, '德保县', 451000, 3);
INSERT INTO `fa_shopro_area` VALUES (451026, '那坡县', 451000, 3);
INSERT INTO `fa_shopro_area` VALUES (451027, '凌云县', 451000, 3);
INSERT INTO `fa_shopro_area` VALUES (451028, '乐业县', 451000, 3);
INSERT INTO `fa_shopro_area` VALUES (451029, '田林县', 451000, 3);
INSERT INTO `fa_shopro_area` VALUES (451030, '西林县', 451000, 3);
INSERT INTO `fa_shopro_area` VALUES (451031, '隆林各族自治县', 451000, 3);
INSERT INTO `fa_shopro_area` VALUES (451081, '靖西市', 451000, 3);
INSERT INTO `fa_shopro_area` VALUES (451100, '贺州市', 450000, 2);
INSERT INTO `fa_shopro_area` VALUES (451102, '八步区', 451100, 3);
INSERT INTO `fa_shopro_area` VALUES (451103, '平桂区', 451100, 3);
INSERT INTO `fa_shopro_area` VALUES (451121, '昭平县', 451100, 3);
INSERT INTO `fa_shopro_area` VALUES (451122, '钟山县', 451100, 3);
INSERT INTO `fa_shopro_area` VALUES (451123, '富川瑶族自治县', 451100, 3);
INSERT INTO `fa_shopro_area` VALUES (451200, '河池市', 450000, 2);
INSERT INTO `fa_shopro_area` VALUES (451202, '金城江区', 451200, 3);
INSERT INTO `fa_shopro_area` VALUES (451203, '宜州区', 451200, 3);
INSERT INTO `fa_shopro_area` VALUES (451221, '南丹县', 451200, 3);
INSERT INTO `fa_shopro_area` VALUES (451222, '天峨县', 451200, 3);
INSERT INTO `fa_shopro_area` VALUES (451223, '凤山县', 451200, 3);
INSERT INTO `fa_shopro_area` VALUES (451224, '东兰县', 451200, 3);
INSERT INTO `fa_shopro_area` VALUES (451225, '罗城仫佬族自治县', 451200, 3);
INSERT INTO `fa_shopro_area` VALUES (451226, '环江毛南族自治县', 451200, 3);
INSERT INTO `fa_shopro_area` VALUES (451227, '巴马瑶族自治县', 451200, 3);
INSERT INTO `fa_shopro_area` VALUES (451228, '都安瑶族自治县', 451200, 3);
INSERT INTO `fa_shopro_area` VALUES (451229, '大化瑶族自治县', 451200, 3);
INSERT INTO `fa_shopro_area` VALUES (451300, '来宾市', 450000, 2);
INSERT INTO `fa_shopro_area` VALUES (451302, '兴宾区', 451300, 3);
INSERT INTO `fa_shopro_area` VALUES (451321, '忻城县', 451300, 3);
INSERT INTO `fa_shopro_area` VALUES (451322, '象州县', 451300, 3);
INSERT INTO `fa_shopro_area` VALUES (451323, '武宣县', 451300, 3);
INSERT INTO `fa_shopro_area` VALUES (451324, '金秀瑶族自治县', 451300, 3);
INSERT INTO `fa_shopro_area` VALUES (451381, '合山市', 451300, 3);
INSERT INTO `fa_shopro_area` VALUES (451400, '崇左市', 450000, 2);
INSERT INTO `fa_shopro_area` VALUES (451402, '江州区', 451400, 3);
INSERT INTO `fa_shopro_area` VALUES (451421, '扶绥县', 451400, 3);
INSERT INTO `fa_shopro_area` VALUES (451422, '宁明县', 451400, 3);
INSERT INTO `fa_shopro_area` VALUES (451423, '龙州县', 451400, 3);
INSERT INTO `fa_shopro_area` VALUES (451424, '大新县', 451400, 3);
INSERT INTO `fa_shopro_area` VALUES (451425, '天等县', 451400, 3);
INSERT INTO `fa_shopro_area` VALUES (451481, '凭祥市', 451400, 3);
INSERT INTO `fa_shopro_area` VALUES (460000, '海南省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (460100, '海口市', 460000, 2);
INSERT INTO `fa_shopro_area` VALUES (460105, '秀英区', 460100, 3);
INSERT INTO `fa_shopro_area` VALUES (460106, '龙华区', 460100, 3);
INSERT INTO `fa_shopro_area` VALUES (460107, '琼山区', 460100, 3);
INSERT INTO `fa_shopro_area` VALUES (460108, '美兰区', 460100, 3);
INSERT INTO `fa_shopro_area` VALUES (460200, '三亚市', 460000, 2);
INSERT INTO `fa_shopro_area` VALUES (460202, '海棠区', 460200, 3);
INSERT INTO `fa_shopro_area` VALUES (460203, '吉阳区', 460200, 3);
INSERT INTO `fa_shopro_area` VALUES (460204, '天涯区', 460200, 3);
INSERT INTO `fa_shopro_area` VALUES (460205, '崖州区', 460200, 3);
INSERT INTO `fa_shopro_area` VALUES (460300, '三沙市', 460000, 2);
INSERT INTO `fa_shopro_area` VALUES (460321, '西沙群岛', 460300, 3);
INSERT INTO `fa_shopro_area` VALUES (460322, '南沙群岛', 460300, 3);
INSERT INTO `fa_shopro_area` VALUES (460323, '中沙群岛的岛礁及其海域', 460300, 3);
INSERT INTO `fa_shopro_area` VALUES (460400, '儋州市', 460000, 2);
INSERT INTO `fa_shopro_area` VALUES (460401, '那大镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460402, '和庆镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460403, '南丰镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460404, '大成镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460405, '雅星镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460406, '兰洋镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460407, '光村镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460408, '木棠镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460409, '海头镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460410, '峨蔓镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460411, '三都镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460412, '王五镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460413, '白马井镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460414, '中和镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460415, '排浦镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460416, '东成镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460417, '新州镇', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460418, '国营西培农场', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460419, '国营西联农场', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460420, '国营蓝洋农场', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460421, '国营八一农场', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460422, '洋浦经济开发区', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460423, '华南热作学院', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (460424, '红岭农场', 460400, 3);
INSERT INTO `fa_shopro_area` VALUES (469000, '省直辖县级行政区划', 460000, 2);
INSERT INTO `fa_shopro_area` VALUES (469001, '五指山市', 469000, 3);
INSERT INTO `fa_shopro_area` VALUES (469002, '琼海市', 469000, 3);
INSERT INTO `fa_shopro_area` VALUES (469005, '文昌市', 469000, 3);
INSERT INTO `fa_shopro_area` VALUES (469006, '万宁市', 469000, 3);
INSERT INTO `fa_shopro_area` VALUES (469007, '东方市', 469000, 3);
INSERT INTO `fa_shopro_area` VALUES (469021, '定安县', 469000, 3);
INSERT INTO `fa_shopro_area` VALUES (469022, '屯昌县', 469000, 3);
INSERT INTO `fa_shopro_area` VALUES (469023, '澄迈县', 469000, 3);
INSERT INTO `fa_shopro_area` VALUES (469024, '临高县', 469000, 3);
INSERT INTO `fa_shopro_area` VALUES (469025, '白沙黎族自治县', 469000, 3);
INSERT INTO `fa_shopro_area` VALUES (469026, '昌江黎族自治县', 469000, 3);
INSERT INTO `fa_shopro_area` VALUES (469027, '乐东黎族自治县', 469000, 3);
INSERT INTO `fa_shopro_area` VALUES (469028, '陵水黎族自治县', 469000, 3);
INSERT INTO `fa_shopro_area` VALUES (469029, '保亭黎族苗族自治县', 469000, 3);
INSERT INTO `fa_shopro_area` VALUES (469030, '琼中黎族苗族自治县', 469000, 3);
INSERT INTO `fa_shopro_area` VALUES (500000, '重庆市', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (500100, '重庆市', 500000, 2);
INSERT INTO `fa_shopro_area` VALUES (500101, '万州区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500102, '涪陵区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500103, '渝中区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500104, '大渡口区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500105, '江北区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500106, '沙坪坝区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500107, '九龙坡区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500108, '南岸区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500109, '北碚区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500110, '綦江区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500111, '大足区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500112, '渝北区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500113, '巴南区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500114, '黔江区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500115, '长寿区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500116, '江津区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500117, '合川区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500118, '永川区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500119, '南川区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500120, '璧山区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500151, '铜梁区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500152, '潼南区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500153, '荣昌区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500154, '开州区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500155, '梁平区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500156, '武隆区', 500100, 3);
INSERT INTO `fa_shopro_area` VALUES (500200, '县', 500000, 2);
INSERT INTO `fa_shopro_area` VALUES (500229, '城口县', 500200, 3);
INSERT INTO `fa_shopro_area` VALUES (500230, '丰都县', 500200, 3);
INSERT INTO `fa_shopro_area` VALUES (500231, '垫江县', 500200, 3);
INSERT INTO `fa_shopro_area` VALUES (500233, '忠县', 500200, 3);
INSERT INTO `fa_shopro_area` VALUES (500235, '云阳县', 500200, 3);
INSERT INTO `fa_shopro_area` VALUES (500236, '奉节县', 500200, 3);
INSERT INTO `fa_shopro_area` VALUES (500237, '巫山县', 500200, 3);
INSERT INTO `fa_shopro_area` VALUES (500238, '巫溪县', 500200, 3);
INSERT INTO `fa_shopro_area` VALUES (500240, '石柱土家族自治县', 500200, 3);
INSERT INTO `fa_shopro_area` VALUES (500241, '秀山土家族苗族自治县', 500200, 3);
INSERT INTO `fa_shopro_area` VALUES (500242, '酉阳土家族苗族自治县', 500200, 3);
INSERT INTO `fa_shopro_area` VALUES (500243, '彭水苗族土家族自治县', 500200, 3);
INSERT INTO `fa_shopro_area` VALUES (510000, '四川省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (510100, '成都市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (510104, '锦江区', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510105, '青羊区', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510106, '金牛区', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510107, '武侯区', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510108, '成华区', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510112, '龙泉驿区', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510113, '青白江区', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510114, '新都区', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510115, '温江区', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510116, '双流区', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510117, '郫都区', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510121, '金堂县', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510129, '大邑县', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510131, '蒲江县', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510132, '新津县', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510181, '都江堰市', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510182, '彭州市', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510183, '邛崃市', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510184, '崇州市', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510185, '简阳市', 510100, 3);
INSERT INTO `fa_shopro_area` VALUES (510300, '自贡市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (510302, '自流井区', 510300, 3);
INSERT INTO `fa_shopro_area` VALUES (510303, '贡井区', 510300, 3);
INSERT INTO `fa_shopro_area` VALUES (510304, '大安区', 510300, 3);
INSERT INTO `fa_shopro_area` VALUES (510311, '沿滩区', 510300, 3);
INSERT INTO `fa_shopro_area` VALUES (510321, '荣县', 510300, 3);
INSERT INTO `fa_shopro_area` VALUES (510322, '富顺县', 510300, 3);
INSERT INTO `fa_shopro_area` VALUES (510400, '攀枝花市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (510402, '东区', 510400, 3);
INSERT INTO `fa_shopro_area` VALUES (510403, '西区', 510400, 3);
INSERT INTO `fa_shopro_area` VALUES (510411, '仁和区', 510400, 3);
INSERT INTO `fa_shopro_area` VALUES (510421, '米易县', 510400, 3);
INSERT INTO `fa_shopro_area` VALUES (510422, '盐边县', 510400, 3);
INSERT INTO `fa_shopro_area` VALUES (510500, '泸州市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (510502, '江阳区', 510500, 3);
INSERT INTO `fa_shopro_area` VALUES (510503, '纳溪区', 510500, 3);
INSERT INTO `fa_shopro_area` VALUES (510504, '龙马潭区', 510500, 3);
INSERT INTO `fa_shopro_area` VALUES (510521, '泸县', 510500, 3);
INSERT INTO `fa_shopro_area` VALUES (510522, '合江县', 510500, 3);
INSERT INTO `fa_shopro_area` VALUES (510524, '叙永县', 510500, 3);
INSERT INTO `fa_shopro_area` VALUES (510525, '古蔺县', 510500, 3);
INSERT INTO `fa_shopro_area` VALUES (510600, '德阳市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (510603, '旌阳区', 510600, 3);
INSERT INTO `fa_shopro_area` VALUES (510604, '罗江区', 510600, 3);
INSERT INTO `fa_shopro_area` VALUES (510623, '中江县', 510600, 3);
INSERT INTO `fa_shopro_area` VALUES (510681, '广汉市', 510600, 3);
INSERT INTO `fa_shopro_area` VALUES (510682, '什邡市', 510600, 3);
INSERT INTO `fa_shopro_area` VALUES (510683, '绵竹市', 510600, 3);
INSERT INTO `fa_shopro_area` VALUES (510700, '绵阳市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (510703, '涪城区', 510700, 3);
INSERT INTO `fa_shopro_area` VALUES (510704, '游仙区', 510700, 3);
INSERT INTO `fa_shopro_area` VALUES (510705, '安州区', 510700, 3);
INSERT INTO `fa_shopro_area` VALUES (510722, '三台县', 510700, 3);
INSERT INTO `fa_shopro_area` VALUES (510723, '盐亭县', 510700, 3);
INSERT INTO `fa_shopro_area` VALUES (510725, '梓潼县', 510700, 3);
INSERT INTO `fa_shopro_area` VALUES (510726, '北川羌族自治县', 510700, 3);
INSERT INTO `fa_shopro_area` VALUES (510727, '平武县', 510700, 3);
INSERT INTO `fa_shopro_area` VALUES (510781, '江油市', 510700, 3);
INSERT INTO `fa_shopro_area` VALUES (510800, '广元市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (510802, '利州区', 510800, 3);
INSERT INTO `fa_shopro_area` VALUES (510811, '昭化区', 510800, 3);
INSERT INTO `fa_shopro_area` VALUES (510812, '朝天区', 510800, 3);
INSERT INTO `fa_shopro_area` VALUES (510821, '旺苍县', 510800, 3);
INSERT INTO `fa_shopro_area` VALUES (510822, '青川县', 510800, 3);
INSERT INTO `fa_shopro_area` VALUES (510823, '剑阁县', 510800, 3);
INSERT INTO `fa_shopro_area` VALUES (510824, '苍溪县', 510800, 3);
INSERT INTO `fa_shopro_area` VALUES (510900, '遂宁市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (510903, '船山区', 510900, 3);
INSERT INTO `fa_shopro_area` VALUES (510904, '安居区', 510900, 3);
INSERT INTO `fa_shopro_area` VALUES (510921, '蓬溪县', 510900, 3);
INSERT INTO `fa_shopro_area` VALUES (510922, '射洪县', 510900, 3);
INSERT INTO `fa_shopro_area` VALUES (510923, '大英县', 510900, 3);
INSERT INTO `fa_shopro_area` VALUES (511000, '内江市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (511002, '市中区', 511000, 3);
INSERT INTO `fa_shopro_area` VALUES (511011, '东兴区', 511000, 3);
INSERT INTO `fa_shopro_area` VALUES (511024, '威远县', 511000, 3);
INSERT INTO `fa_shopro_area` VALUES (511025, '资中县', 511000, 3);
INSERT INTO `fa_shopro_area` VALUES (511083, '隆昌市', 511000, 3);
INSERT INTO `fa_shopro_area` VALUES (511100, '乐山市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (511102, '市中区', 511100, 3);
INSERT INTO `fa_shopro_area` VALUES (511111, '沙湾区', 511100, 3);
INSERT INTO `fa_shopro_area` VALUES (511112, '五通桥区', 511100, 3);
INSERT INTO `fa_shopro_area` VALUES (511113, '金口河区', 511100, 3);
INSERT INTO `fa_shopro_area` VALUES (511123, '犍为县', 511100, 3);
INSERT INTO `fa_shopro_area` VALUES (511124, '井研县', 511100, 3);
INSERT INTO `fa_shopro_area` VALUES (511126, '夹江县', 511100, 3);
INSERT INTO `fa_shopro_area` VALUES (511129, '沐川县', 511100, 3);
INSERT INTO `fa_shopro_area` VALUES (511132, '峨边彝族自治县', 511100, 3);
INSERT INTO `fa_shopro_area` VALUES (511133, '马边彝族自治县', 511100, 3);
INSERT INTO `fa_shopro_area` VALUES (511181, '峨眉山市', 511100, 3);
INSERT INTO `fa_shopro_area` VALUES (511300, '南充市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (511302, '顺庆区', 511300, 3);
INSERT INTO `fa_shopro_area` VALUES (511303, '高坪区', 511300, 3);
INSERT INTO `fa_shopro_area` VALUES (511304, '嘉陵区', 511300, 3);
INSERT INTO `fa_shopro_area` VALUES (511321, '南部县', 511300, 3);
INSERT INTO `fa_shopro_area` VALUES (511322, '营山县', 511300, 3);
INSERT INTO `fa_shopro_area` VALUES (511323, '蓬安县', 511300, 3);
INSERT INTO `fa_shopro_area` VALUES (511324, '仪陇县', 511300, 3);
INSERT INTO `fa_shopro_area` VALUES (511325, '西充县', 511300, 3);
INSERT INTO `fa_shopro_area` VALUES (511381, '阆中市', 511300, 3);
INSERT INTO `fa_shopro_area` VALUES (511400, '眉山市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (511402, '东坡区', 511400, 3);
INSERT INTO `fa_shopro_area` VALUES (511403, '彭山区', 511400, 3);
INSERT INTO `fa_shopro_area` VALUES (511421, '仁寿县', 511400, 3);
INSERT INTO `fa_shopro_area` VALUES (511423, '洪雅县', 511400, 3);
INSERT INTO `fa_shopro_area` VALUES (511424, '丹棱县', 511400, 3);
INSERT INTO `fa_shopro_area` VALUES (511425, '青神县', 511400, 3);
INSERT INTO `fa_shopro_area` VALUES (511500, '宜宾市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (511502, '翠屏区', 511500, 3);
INSERT INTO `fa_shopro_area` VALUES (511503, '南溪区', 511500, 3);
INSERT INTO `fa_shopro_area` VALUES (511521, '宜宾县', 511500, 3);
INSERT INTO `fa_shopro_area` VALUES (511523, '江安县', 511500, 3);
INSERT INTO `fa_shopro_area` VALUES (511524, '长宁县', 511500, 3);
INSERT INTO `fa_shopro_area` VALUES (511525, '高县', 511500, 3);
INSERT INTO `fa_shopro_area` VALUES (511526, '珙县', 511500, 3);
INSERT INTO `fa_shopro_area` VALUES (511527, '筠连县', 511500, 3);
INSERT INTO `fa_shopro_area` VALUES (511528, '兴文县', 511500, 3);
INSERT INTO `fa_shopro_area` VALUES (511529, '屏山县', 511500, 3);
INSERT INTO `fa_shopro_area` VALUES (511600, '广安市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (511602, '广安区', 511600, 3);
INSERT INTO `fa_shopro_area` VALUES (511603, '前锋区', 511600, 3);
INSERT INTO `fa_shopro_area` VALUES (511621, '岳池县', 511600, 3);
INSERT INTO `fa_shopro_area` VALUES (511622, '武胜县', 511600, 3);
INSERT INTO `fa_shopro_area` VALUES (511623, '邻水县', 511600, 3);
INSERT INTO `fa_shopro_area` VALUES (511681, '华蓥市', 511600, 3);
INSERT INTO `fa_shopro_area` VALUES (511700, '达州市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (511702, '通川区', 511700, 3);
INSERT INTO `fa_shopro_area` VALUES (511703, '达川区', 511700, 3);
INSERT INTO `fa_shopro_area` VALUES (511722, '宣汉县', 511700, 3);
INSERT INTO `fa_shopro_area` VALUES (511723, '开江县', 511700, 3);
INSERT INTO `fa_shopro_area` VALUES (511724, '大竹县', 511700, 3);
INSERT INTO `fa_shopro_area` VALUES (511725, '渠县', 511700, 3);
INSERT INTO `fa_shopro_area` VALUES (511781, '万源市', 511700, 3);
INSERT INTO `fa_shopro_area` VALUES (511800, '雅安市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (511802, '雨城区', 511800, 3);
INSERT INTO `fa_shopro_area` VALUES (511803, '名山区', 511800, 3);
INSERT INTO `fa_shopro_area` VALUES (511822, '荥经县', 511800, 3);
INSERT INTO `fa_shopro_area` VALUES (511823, '汉源县', 511800, 3);
INSERT INTO `fa_shopro_area` VALUES (511824, '石棉县', 511800, 3);
INSERT INTO `fa_shopro_area` VALUES (511825, '天全县', 511800, 3);
INSERT INTO `fa_shopro_area` VALUES (511826, '芦山县', 511800, 3);
INSERT INTO `fa_shopro_area` VALUES (511827, '宝兴县', 511800, 3);
INSERT INTO `fa_shopro_area` VALUES (511900, '巴中市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (511902, '巴州区', 511900, 3);
INSERT INTO `fa_shopro_area` VALUES (511903, '恩阳区', 511900, 3);
INSERT INTO `fa_shopro_area` VALUES (511921, '通江县', 511900, 3);
INSERT INTO `fa_shopro_area` VALUES (511922, '南江县', 511900, 3);
INSERT INTO `fa_shopro_area` VALUES (511923, '平昌县', 511900, 3);
INSERT INTO `fa_shopro_area` VALUES (512000, '资阳市', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (512002, '雁江区', 512000, 3);
INSERT INTO `fa_shopro_area` VALUES (512021, '安岳县', 512000, 3);
INSERT INTO `fa_shopro_area` VALUES (512022, '乐至县', 512000, 3);
INSERT INTO `fa_shopro_area` VALUES (513200, '阿坝藏族羌族自治州', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (513201, '马尔康市', 513200, 3);
INSERT INTO `fa_shopro_area` VALUES (513221, '汶川县', 513200, 3);
INSERT INTO `fa_shopro_area` VALUES (513222, '理县', 513200, 3);
INSERT INTO `fa_shopro_area` VALUES (513223, '茂县', 513200, 3);
INSERT INTO `fa_shopro_area` VALUES (513224, '松潘县', 513200, 3);
INSERT INTO `fa_shopro_area` VALUES (513225, '九寨沟县', 513200, 3);
INSERT INTO `fa_shopro_area` VALUES (513226, '金川县', 513200, 3);
INSERT INTO `fa_shopro_area` VALUES (513227, '小金县', 513200, 3);
INSERT INTO `fa_shopro_area` VALUES (513228, '黑水县', 513200, 3);
INSERT INTO `fa_shopro_area` VALUES (513230, '壤塘县', 513200, 3);
INSERT INTO `fa_shopro_area` VALUES (513231, '阿坝县', 513200, 3);
INSERT INTO `fa_shopro_area` VALUES (513232, '若尔盖县', 513200, 3);
INSERT INTO `fa_shopro_area` VALUES (513233, '红原县', 513200, 3);
INSERT INTO `fa_shopro_area` VALUES (513300, '甘孜藏族自治州', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (513301, '康定市', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513322, '泸定县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513323, '丹巴县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513324, '九龙县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513325, '雅江县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513326, '道孚县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513327, '炉霍县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513328, '甘孜县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513329, '新龙县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513330, '德格县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513331, '白玉县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513332, '石渠县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513333, '色达县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513334, '理塘县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513335, '巴塘县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513336, '乡城县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513337, '稻城县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513338, '得荣县', 513300, 3);
INSERT INTO `fa_shopro_area` VALUES (513400, '凉山彝族自治州', 510000, 2);
INSERT INTO `fa_shopro_area` VALUES (513401, '西昌市', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (513422, '木里藏族自治县', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (513423, '盐源县', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (513424, '德昌县', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (513425, '会理县', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (513426, '会东县', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (513427, '宁南县', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (513428, '普格县', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (513429, '布拖县', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (513430, '金阳县', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (513431, '昭觉县', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (513432, '喜德县', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (513433, '冕宁县', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (513434, '越西县', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (513435, '甘洛县', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (513436, '美姑县', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (513437, '雷波县', 513400, 3);
INSERT INTO `fa_shopro_area` VALUES (520000, '贵州省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (520100, '贵阳市', 520000, 2);
INSERT INTO `fa_shopro_area` VALUES (520102, '南明区', 520100, 3);
INSERT INTO `fa_shopro_area` VALUES (520103, '云岩区', 520100, 3);
INSERT INTO `fa_shopro_area` VALUES (520111, '花溪区', 520100, 3);
INSERT INTO `fa_shopro_area` VALUES (520112, '乌当区', 520100, 3);
INSERT INTO `fa_shopro_area` VALUES (520113, '白云区', 520100, 3);
INSERT INTO `fa_shopro_area` VALUES (520115, '观山湖区', 520100, 3);
INSERT INTO `fa_shopro_area` VALUES (520121, '开阳县', 520100, 3);
INSERT INTO `fa_shopro_area` VALUES (520122, '息烽县', 520100, 3);
INSERT INTO `fa_shopro_area` VALUES (520123, '修文县', 520100, 3);
INSERT INTO `fa_shopro_area` VALUES (520181, '清镇市', 520100, 3);
INSERT INTO `fa_shopro_area` VALUES (520200, '六盘水市', 520000, 2);
INSERT INTO `fa_shopro_area` VALUES (520201, '钟山区', 520200, 3);
INSERT INTO `fa_shopro_area` VALUES (520203, '六枝特区', 520200, 3);
INSERT INTO `fa_shopro_area` VALUES (520221, '水城县', 520200, 3);
INSERT INTO `fa_shopro_area` VALUES (520281, '盘州市', 520200, 3);
INSERT INTO `fa_shopro_area` VALUES (520300, '遵义市', 520000, 2);
INSERT INTO `fa_shopro_area` VALUES (520302, '红花岗区', 520300, 3);
INSERT INTO `fa_shopro_area` VALUES (520303, '汇川区', 520300, 3);
INSERT INTO `fa_shopro_area` VALUES (520304, '播州区', 520300, 3);
INSERT INTO `fa_shopro_area` VALUES (520322, '桐梓县', 520300, 3);
INSERT INTO `fa_shopro_area` VALUES (520323, '绥阳县', 520300, 3);
INSERT INTO `fa_shopro_area` VALUES (520324, '正安县', 520300, 3);
INSERT INTO `fa_shopro_area` VALUES (520325, '道真仡佬族苗族自治县', 520300, 3);
INSERT INTO `fa_shopro_area` VALUES (520326, '务川仡佬族苗族自治县', 520300, 3);
INSERT INTO `fa_shopro_area` VALUES (520327, '凤冈县', 520300, 3);
INSERT INTO `fa_shopro_area` VALUES (520328, '湄潭县', 520300, 3);
INSERT INTO `fa_shopro_area` VALUES (520329, '余庆县', 520300, 3);
INSERT INTO `fa_shopro_area` VALUES (520330, '习水县', 520300, 3);
INSERT INTO `fa_shopro_area` VALUES (520381, '赤水市', 520300, 3);
INSERT INTO `fa_shopro_area` VALUES (520382, '仁怀市', 520300, 3);
INSERT INTO `fa_shopro_area` VALUES (520400, '安顺市', 520000, 2);
INSERT INTO `fa_shopro_area` VALUES (520402, '西秀区', 520400, 3);
INSERT INTO `fa_shopro_area` VALUES (520403, '平坝区', 520400, 3);
INSERT INTO `fa_shopro_area` VALUES (520422, '普定县', 520400, 3);
INSERT INTO `fa_shopro_area` VALUES (520423, '镇宁布依族苗族自治县', 520400, 3);
INSERT INTO `fa_shopro_area` VALUES (520424, '关岭布依族苗族自治县', 520400, 3);
INSERT INTO `fa_shopro_area` VALUES (520425, '紫云苗族布依族自治县', 520400, 3);
INSERT INTO `fa_shopro_area` VALUES (520500, '毕节市', 520000, 2);
INSERT INTO `fa_shopro_area` VALUES (520502, '七星关区', 520500, 3);
INSERT INTO `fa_shopro_area` VALUES (520521, '大方县', 520500, 3);
INSERT INTO `fa_shopro_area` VALUES (520522, '黔西县', 520500, 3);
INSERT INTO `fa_shopro_area` VALUES (520523, '金沙县', 520500, 3);
INSERT INTO `fa_shopro_area` VALUES (520524, '织金县', 520500, 3);
INSERT INTO `fa_shopro_area` VALUES (520525, '纳雍县', 520500, 3);
INSERT INTO `fa_shopro_area` VALUES (520526, '威宁彝族回族苗族自治县', 520500, 3);
INSERT INTO `fa_shopro_area` VALUES (520527, '赫章县', 520500, 3);
INSERT INTO `fa_shopro_area` VALUES (520600, '铜仁市', 520000, 2);
INSERT INTO `fa_shopro_area` VALUES (520602, '碧江区', 520600, 3);
INSERT INTO `fa_shopro_area` VALUES (520603, '万山区', 520600, 3);
INSERT INTO `fa_shopro_area` VALUES (520621, '江口县', 520600, 3);
INSERT INTO `fa_shopro_area` VALUES (520622, '玉屏侗族自治县', 520600, 3);
INSERT INTO `fa_shopro_area` VALUES (520623, '石阡县', 520600, 3);
INSERT INTO `fa_shopro_area` VALUES (520624, '思南县', 520600, 3);
INSERT INTO `fa_shopro_area` VALUES (520625, '印江土家族苗族自治县', 520600, 3);
INSERT INTO `fa_shopro_area` VALUES (520626, '德江县', 520600, 3);
INSERT INTO `fa_shopro_area` VALUES (520627, '沿河土家族自治县', 520600, 3);
INSERT INTO `fa_shopro_area` VALUES (520628, '松桃苗族自治县', 520600, 3);
INSERT INTO `fa_shopro_area` VALUES (522300, '黔西南布依族苗族自治州', 520000, 2);
INSERT INTO `fa_shopro_area` VALUES (522301, '兴义市', 522300, 3);
INSERT INTO `fa_shopro_area` VALUES (522322, '兴仁县', 522300, 3);
INSERT INTO `fa_shopro_area` VALUES (522323, '普安县', 522300, 3);
INSERT INTO `fa_shopro_area` VALUES (522324, '晴隆县', 522300, 3);
INSERT INTO `fa_shopro_area` VALUES (522325, '贞丰县', 522300, 3);
INSERT INTO `fa_shopro_area` VALUES (522326, '望谟县', 522300, 3);
INSERT INTO `fa_shopro_area` VALUES (522327, '册亨县', 522300, 3);
INSERT INTO `fa_shopro_area` VALUES (522328, '安龙县', 522300, 3);
INSERT INTO `fa_shopro_area` VALUES (522600, '黔东南苗族侗族自治州', 520000, 2);
INSERT INTO `fa_shopro_area` VALUES (522601, '凯里市', 522600, 3);
INSERT INTO `fa_shopro_area` VALUES (522622, '黄平县', 522600, 3);
INSERT INTO `fa_shopro_area` VALUES (522623, '施秉县', 522600, 3);
INSERT INTO `fa_shopro_area` VALUES (522624, '三穗县', 522600, 3);
INSERT INTO `fa_shopro_area` VALUES (522625, '镇远县', 522600, 3);
INSERT INTO `fa_shopro_area` VALUES (522626, '岑巩县', 522600, 3);
INSERT INTO `fa_shopro_area` VALUES (522627, '天柱县', 522600, 3);
INSERT INTO `fa_shopro_area` VALUES (522628, '锦屏县', 522600, 3);
INSERT INTO `fa_shopro_area` VALUES (522629, '剑河县', 522600, 3);
INSERT INTO `fa_shopro_area` VALUES (522630, '台江县', 522600, 3);
INSERT INTO `fa_shopro_area` VALUES (522631, '黎平县', 522600, 3);
INSERT INTO `fa_shopro_area` VALUES (522632, '榕江县', 522600, 3);
INSERT INTO `fa_shopro_area` VALUES (522633, '从江县', 522600, 3);
INSERT INTO `fa_shopro_area` VALUES (522634, '雷山县', 522600, 3);
INSERT INTO `fa_shopro_area` VALUES (522635, '麻江县', 522600, 3);
INSERT INTO `fa_shopro_area` VALUES (522636, '丹寨县', 522600, 3);
INSERT INTO `fa_shopro_area` VALUES (522700, '黔南布依族苗族自治州', 520000, 2);
INSERT INTO `fa_shopro_area` VALUES (522701, '都匀市', 522700, 3);
INSERT INTO `fa_shopro_area` VALUES (522702, '福泉市', 522700, 3);
INSERT INTO `fa_shopro_area` VALUES (522722, '荔波县', 522700, 3);
INSERT INTO `fa_shopro_area` VALUES (522723, '贵定县', 522700, 3);
INSERT INTO `fa_shopro_area` VALUES (522725, '瓮安县', 522700, 3);
INSERT INTO `fa_shopro_area` VALUES (522726, '独山县', 522700, 3);
INSERT INTO `fa_shopro_area` VALUES (522727, '平塘县', 522700, 3);
INSERT INTO `fa_shopro_area` VALUES (522728, '罗甸县', 522700, 3);
INSERT INTO `fa_shopro_area` VALUES (522729, '长顺县', 522700, 3);
INSERT INTO `fa_shopro_area` VALUES (522730, '龙里县', 522700, 3);
INSERT INTO `fa_shopro_area` VALUES (522731, '惠水县', 522700, 3);
INSERT INTO `fa_shopro_area` VALUES (522732, '三都水族自治县', 522700, 3);
INSERT INTO `fa_shopro_area` VALUES (530000, '云南省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (530100, '昆明市', 530000, 2);
INSERT INTO `fa_shopro_area` VALUES (530102, '五华区', 530100, 3);
INSERT INTO `fa_shopro_area` VALUES (530103, '盘龙区', 530100, 3);
INSERT INTO `fa_shopro_area` VALUES (530111, '官渡区', 530100, 3);
INSERT INTO `fa_shopro_area` VALUES (530112, '西山区', 530100, 3);
INSERT INTO `fa_shopro_area` VALUES (530113, '东川区', 530100, 3);
INSERT INTO `fa_shopro_area` VALUES (530114, '呈贡区', 530100, 3);
INSERT INTO `fa_shopro_area` VALUES (530115, '晋宁区', 530100, 3);
INSERT INTO `fa_shopro_area` VALUES (530124, '富民县', 530100, 3);
INSERT INTO `fa_shopro_area` VALUES (530125, '宜良县', 530100, 3);
INSERT INTO `fa_shopro_area` VALUES (530126, '石林彝族自治县', 530100, 3);
INSERT INTO `fa_shopro_area` VALUES (530127, '嵩明县', 530100, 3);
INSERT INTO `fa_shopro_area` VALUES (530128, '禄劝彝族苗族自治县', 530100, 3);
INSERT INTO `fa_shopro_area` VALUES (530129, '寻甸回族彝族自治县', 530100, 3);
INSERT INTO `fa_shopro_area` VALUES (530181, '安宁市', 530100, 3);
INSERT INTO `fa_shopro_area` VALUES (530300, '曲靖市', 530000, 2);
INSERT INTO `fa_shopro_area` VALUES (530302, '麒麟区', 530300, 3);
INSERT INTO `fa_shopro_area` VALUES (530303, '沾益区', 530300, 3);
INSERT INTO `fa_shopro_area` VALUES (530321, '马龙县', 530300, 3);
INSERT INTO `fa_shopro_area` VALUES (530322, '陆良县', 530300, 3);
INSERT INTO `fa_shopro_area` VALUES (530323, '师宗县', 530300, 3);
INSERT INTO `fa_shopro_area` VALUES (530324, '罗平县', 530300, 3);
INSERT INTO `fa_shopro_area` VALUES (530325, '富源县', 530300, 3);
INSERT INTO `fa_shopro_area` VALUES (530326, '会泽县', 530300, 3);
INSERT INTO `fa_shopro_area` VALUES (530381, '宣威市', 530300, 3);
INSERT INTO `fa_shopro_area` VALUES (530400, '玉溪市', 530000, 2);
INSERT INTO `fa_shopro_area` VALUES (530402, '红塔区', 530400, 3);
INSERT INTO `fa_shopro_area` VALUES (530403, '江川区', 530400, 3);
INSERT INTO `fa_shopro_area` VALUES (530422, '澄江县', 530400, 3);
INSERT INTO `fa_shopro_area` VALUES (530423, '通海县', 530400, 3);
INSERT INTO `fa_shopro_area` VALUES (530424, '华宁县', 530400, 3);
INSERT INTO `fa_shopro_area` VALUES (530425, '易门县', 530400, 3);
INSERT INTO `fa_shopro_area` VALUES (530426, '峨山彝族自治县', 530400, 3);
INSERT INTO `fa_shopro_area` VALUES (530427, '新平彝族傣族自治县', 530400, 3);
INSERT INTO `fa_shopro_area` VALUES (530428, '元江哈尼族彝族傣族自治县', 530400, 3);
INSERT INTO `fa_shopro_area` VALUES (530500, '保山市', 530000, 2);
INSERT INTO `fa_shopro_area` VALUES (530502, '隆阳区', 530500, 3);
INSERT INTO `fa_shopro_area` VALUES (530521, '施甸县', 530500, 3);
INSERT INTO `fa_shopro_area` VALUES (530523, '龙陵县', 530500, 3);
INSERT INTO `fa_shopro_area` VALUES (530524, '昌宁县', 530500, 3);
INSERT INTO `fa_shopro_area` VALUES (530581, '腾冲市', 530500, 3);
INSERT INTO `fa_shopro_area` VALUES (530600, '昭通市', 530000, 2);
INSERT INTO `fa_shopro_area` VALUES (530602, '昭阳区', 530600, 3);
INSERT INTO `fa_shopro_area` VALUES (530621, '鲁甸县', 530600, 3);
INSERT INTO `fa_shopro_area` VALUES (530622, '巧家县', 530600, 3);
INSERT INTO `fa_shopro_area` VALUES (530623, '盐津县', 530600, 3);
INSERT INTO `fa_shopro_area` VALUES (530624, '大关县', 530600, 3);
INSERT INTO `fa_shopro_area` VALUES (530625, '永善县', 530600, 3);
INSERT INTO `fa_shopro_area` VALUES (530626, '绥江县', 530600, 3);
INSERT INTO `fa_shopro_area` VALUES (530627, '镇雄县', 530600, 3);
INSERT INTO `fa_shopro_area` VALUES (530628, '彝良县', 530600, 3);
INSERT INTO `fa_shopro_area` VALUES (530629, '威信县', 530600, 3);
INSERT INTO `fa_shopro_area` VALUES (530630, '水富县', 530600, 3);
INSERT INTO `fa_shopro_area` VALUES (530700, '丽江市', 530000, 2);
INSERT INTO `fa_shopro_area` VALUES (530702, '古城区', 530700, 3);
INSERT INTO `fa_shopro_area` VALUES (530721, '玉龙纳西族自治县', 530700, 3);
INSERT INTO `fa_shopro_area` VALUES (530722, '永胜县', 530700, 3);
INSERT INTO `fa_shopro_area` VALUES (530723, '华坪县', 530700, 3);
INSERT INTO `fa_shopro_area` VALUES (530724, '宁蒗彝族自治县', 530700, 3);
INSERT INTO `fa_shopro_area` VALUES (530800, '普洱市', 530000, 2);
INSERT INTO `fa_shopro_area` VALUES (530802, '思茅区', 530800, 3);
INSERT INTO `fa_shopro_area` VALUES (530821, '宁洱哈尼族彝族自治县', 530800, 3);
INSERT INTO `fa_shopro_area` VALUES (530822, '墨江哈尼族自治县', 530800, 3);
INSERT INTO `fa_shopro_area` VALUES (530823, '景东彝族自治县', 530800, 3);
INSERT INTO `fa_shopro_area` VALUES (530824, '景谷傣族彝族自治县', 530800, 3);
INSERT INTO `fa_shopro_area` VALUES (530825, '镇沅彝族哈尼族拉祜族自治县', 530800, 3);
INSERT INTO `fa_shopro_area` VALUES (530826, '江城哈尼族彝族自治县', 530800, 3);
INSERT INTO `fa_shopro_area` VALUES (530827, '孟连傣族拉祜族佤族自治县', 530800, 3);
INSERT INTO `fa_shopro_area` VALUES (530828, '澜沧拉祜族自治县', 530800, 3);
INSERT INTO `fa_shopro_area` VALUES (530829, '西盟佤族自治县', 530800, 3);
INSERT INTO `fa_shopro_area` VALUES (530900, '临沧市', 530000, 2);
INSERT INTO `fa_shopro_area` VALUES (530902, '临翔区', 530900, 3);
INSERT INTO `fa_shopro_area` VALUES (530921, '凤庆县', 530900, 3);
INSERT INTO `fa_shopro_area` VALUES (530922, '云县', 530900, 3);
INSERT INTO `fa_shopro_area` VALUES (530923, '永德县', 530900, 3);
INSERT INTO `fa_shopro_area` VALUES (530924, '镇康县', 530900, 3);
INSERT INTO `fa_shopro_area` VALUES (530925, '双江拉祜族佤族布朗族傣族自治县', 530900, 3);
INSERT INTO `fa_shopro_area` VALUES (530926, '耿马傣族佤族自治县', 530900, 3);
INSERT INTO `fa_shopro_area` VALUES (530927, '沧源佤族自治县', 530900, 3);
INSERT INTO `fa_shopro_area` VALUES (532300, '楚雄彝族自治州', 530000, 2);
INSERT INTO `fa_shopro_area` VALUES (532301, '楚雄市', 532300, 3);
INSERT INTO `fa_shopro_area` VALUES (532322, '双柏县', 532300, 3);
INSERT INTO `fa_shopro_area` VALUES (532323, '牟定县', 532300, 3);
INSERT INTO `fa_shopro_area` VALUES (532324, '南华县', 532300, 3);
INSERT INTO `fa_shopro_area` VALUES (532325, '姚安县', 532300, 3);
INSERT INTO `fa_shopro_area` VALUES (532326, '大姚县', 532300, 3);
INSERT INTO `fa_shopro_area` VALUES (532327, '永仁县', 532300, 3);
INSERT INTO `fa_shopro_area` VALUES (532328, '元谋县', 532300, 3);
INSERT INTO `fa_shopro_area` VALUES (532329, '武定县', 532300, 3);
INSERT INTO `fa_shopro_area` VALUES (532331, '禄丰县', 532300, 3);
INSERT INTO `fa_shopro_area` VALUES (532500, '红河哈尼族彝族自治州', 530000, 2);
INSERT INTO `fa_shopro_area` VALUES (532501, '个旧市', 532500, 3);
INSERT INTO `fa_shopro_area` VALUES (532502, '开远市', 532500, 3);
INSERT INTO `fa_shopro_area` VALUES (532503, '蒙自市', 532500, 3);
INSERT INTO `fa_shopro_area` VALUES (532504, '弥勒市', 532500, 3);
INSERT INTO `fa_shopro_area` VALUES (532523, '屏边苗族自治县', 532500, 3);
INSERT INTO `fa_shopro_area` VALUES (532524, '建水县', 532500, 3);
INSERT INTO `fa_shopro_area` VALUES (532525, '石屏县', 532500, 3);
INSERT INTO `fa_shopro_area` VALUES (532527, '泸西县', 532500, 3);
INSERT INTO `fa_shopro_area` VALUES (532528, '元阳县', 532500, 3);
INSERT INTO `fa_shopro_area` VALUES (532529, '红河县', 532500, 3);
INSERT INTO `fa_shopro_area` VALUES (532530, '金平苗族瑶族傣族自治县', 532500, 3);
INSERT INTO `fa_shopro_area` VALUES (532531, '绿春县', 532500, 3);
INSERT INTO `fa_shopro_area` VALUES (532532, '河口瑶族自治县', 532500, 3);
INSERT INTO `fa_shopro_area` VALUES (532600, '文山壮族苗族自治州', 530000, 2);
INSERT INTO `fa_shopro_area` VALUES (532601, '文山市', 532600, 3);
INSERT INTO `fa_shopro_area` VALUES (532622, '砚山县', 532600, 3);
INSERT INTO `fa_shopro_area` VALUES (532623, '西畴县', 532600, 3);
INSERT INTO `fa_shopro_area` VALUES (532624, '麻栗坡县', 532600, 3);
INSERT INTO `fa_shopro_area` VALUES (532625, '马关县', 532600, 3);
INSERT INTO `fa_shopro_area` VALUES (532626, '丘北县', 532600, 3);
INSERT INTO `fa_shopro_area` VALUES (532627, '广南县', 532600, 3);
INSERT INTO `fa_shopro_area` VALUES (532628, '富宁县', 532600, 3);
INSERT INTO `fa_shopro_area` VALUES (532800, '西双版纳傣族自治州', 530000, 2);
INSERT INTO `fa_shopro_area` VALUES (532801, '景洪市', 532800, 3);
INSERT INTO `fa_shopro_area` VALUES (532822, '勐海县', 532800, 3);
INSERT INTO `fa_shopro_area` VALUES (532823, '勐腊县', 532800, 3);
INSERT INTO `fa_shopro_area` VALUES (532900, '大理白族自治州', 530000, 2);
INSERT INTO `fa_shopro_area` VALUES (532901, '大理市', 532900, 3);
INSERT INTO `fa_shopro_area` VALUES (532922, '漾濞彝族自治县', 532900, 3);
INSERT INTO `fa_shopro_area` VALUES (532923, '祥云县', 532900, 3);
INSERT INTO `fa_shopro_area` VALUES (532924, '宾川县', 532900, 3);
INSERT INTO `fa_shopro_area` VALUES (532925, '弥渡县', 532900, 3);
INSERT INTO `fa_shopro_area` VALUES (532926, '南涧彝族自治县', 532900, 3);
INSERT INTO `fa_shopro_area` VALUES (532927, '巍山彝族回族自治县', 532900, 3);
INSERT INTO `fa_shopro_area` VALUES (532928, '永平县', 532900, 3);
INSERT INTO `fa_shopro_area` VALUES (532929, '云龙县', 532900, 3);
INSERT INTO `fa_shopro_area` VALUES (532930, '洱源县', 532900, 3);
INSERT INTO `fa_shopro_area` VALUES (532931, '剑川县', 532900, 3);
INSERT INTO `fa_shopro_area` VALUES (532932, '鹤庆县', 532900, 3);
INSERT INTO `fa_shopro_area` VALUES (533100, '德宏傣族景颇族自治州', 530000, 2);
INSERT INTO `fa_shopro_area` VALUES (533102, '瑞丽市', 533100, 3);
INSERT INTO `fa_shopro_area` VALUES (533103, '芒市', 533100, 3);
INSERT INTO `fa_shopro_area` VALUES (533122, '梁河县', 533100, 3);
INSERT INTO `fa_shopro_area` VALUES (533123, '盈江县', 533100, 3);
INSERT INTO `fa_shopro_area` VALUES (533124, '陇川县', 533100, 3);
INSERT INTO `fa_shopro_area` VALUES (533300, '怒江傈僳族自治州', 530000, 2);
INSERT INTO `fa_shopro_area` VALUES (533301, '泸水市', 533300, 3);
INSERT INTO `fa_shopro_area` VALUES (533323, '福贡县', 533300, 3);
INSERT INTO `fa_shopro_area` VALUES (533324, '贡山独龙族怒族自治县', 533300, 3);
INSERT INTO `fa_shopro_area` VALUES (533325, '兰坪白族普米族自治县', 533300, 3);
INSERT INTO `fa_shopro_area` VALUES (533400, '迪庆藏族自治州', 530000, 2);
INSERT INTO `fa_shopro_area` VALUES (533401, '香格里拉市', 533400, 3);
INSERT INTO `fa_shopro_area` VALUES (533422, '德钦县', 533400, 3);
INSERT INTO `fa_shopro_area` VALUES (533423, '维西傈僳族自治县', 533400, 3);
INSERT INTO `fa_shopro_area` VALUES (540000, '西藏自治区', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (540100, '拉萨市', 540000, 2);
INSERT INTO `fa_shopro_area` VALUES (540102, '城关区', 540100, 3);
INSERT INTO `fa_shopro_area` VALUES (540103, '堆龙德庆区', 540100, 3);
INSERT INTO `fa_shopro_area` VALUES (540104, '达孜区', 540100, 3);
INSERT INTO `fa_shopro_area` VALUES (540121, '林周县', 540100, 3);
INSERT INTO `fa_shopro_area` VALUES (540122, '当雄县', 540100, 3);
INSERT INTO `fa_shopro_area` VALUES (540123, '尼木县', 540100, 3);
INSERT INTO `fa_shopro_area` VALUES (540124, '曲水县', 540100, 3);
INSERT INTO `fa_shopro_area` VALUES (540127, '墨竹工卡县', 540100, 3);
INSERT INTO `fa_shopro_area` VALUES (540200, '日喀则市', 540000, 2);
INSERT INTO `fa_shopro_area` VALUES (540202, '桑珠孜区', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540221, '南木林县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540222, '江孜县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540223, '定日县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540224, '萨迦县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540225, '拉孜县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540226, '昂仁县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540227, '谢通门县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540228, '白朗县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540229, '仁布县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540230, '康马县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540231, '定结县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540232, '仲巴县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540233, '亚东县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540234, '吉隆县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540235, '聂拉木县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540236, '萨嘎县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540237, '岗巴县', 540200, 3);
INSERT INTO `fa_shopro_area` VALUES (540300, '昌都市', 540000, 2);
INSERT INTO `fa_shopro_area` VALUES (540302, '卡若区', 540300, 3);
INSERT INTO `fa_shopro_area` VALUES (540321, '江达县', 540300, 3);
INSERT INTO `fa_shopro_area` VALUES (540322, '贡觉县', 540300, 3);
INSERT INTO `fa_shopro_area` VALUES (540323, '类乌齐县', 540300, 3);
INSERT INTO `fa_shopro_area` VALUES (540324, '丁青县', 540300, 3);
INSERT INTO `fa_shopro_area` VALUES (540325, '察雅县', 540300, 3);
INSERT INTO `fa_shopro_area` VALUES (540326, '八宿县', 540300, 3);
INSERT INTO `fa_shopro_area` VALUES (540327, '左贡县', 540300, 3);
INSERT INTO `fa_shopro_area` VALUES (540328, '芒康县', 540300, 3);
INSERT INTO `fa_shopro_area` VALUES (540329, '洛隆县', 540300, 3);
INSERT INTO `fa_shopro_area` VALUES (540330, '边坝县', 540300, 3);
INSERT INTO `fa_shopro_area` VALUES (540400, '林芝市', 540000, 2);
INSERT INTO `fa_shopro_area` VALUES (540402, '巴宜区', 540400, 3);
INSERT INTO `fa_shopro_area` VALUES (540421, '工布江达县', 540400, 3);
INSERT INTO `fa_shopro_area` VALUES (540422, '米林县', 540400, 3);
INSERT INTO `fa_shopro_area` VALUES (540423, '墨脱县', 540400, 3);
INSERT INTO `fa_shopro_area` VALUES (540424, '波密县', 540400, 3);
INSERT INTO `fa_shopro_area` VALUES (540425, '察隅县', 540400, 3);
INSERT INTO `fa_shopro_area` VALUES (540426, '朗县', 540400, 3);
INSERT INTO `fa_shopro_area` VALUES (540500, '山南市', 540000, 2);
INSERT INTO `fa_shopro_area` VALUES (540502, '乃东区', 540500, 3);
INSERT INTO `fa_shopro_area` VALUES (540521, '扎囊县', 540500, 3);
INSERT INTO `fa_shopro_area` VALUES (540522, '贡嘎县', 540500, 3);
INSERT INTO `fa_shopro_area` VALUES (540523, '桑日县', 540500, 3);
INSERT INTO `fa_shopro_area` VALUES (540524, '琼结县', 540500, 3);
INSERT INTO `fa_shopro_area` VALUES (540525, '曲松县', 540500, 3);
INSERT INTO `fa_shopro_area` VALUES (540526, '措美县', 540500, 3);
INSERT INTO `fa_shopro_area` VALUES (540527, '洛扎县', 540500, 3);
INSERT INTO `fa_shopro_area` VALUES (540528, '加查县', 540500, 3);
INSERT INTO `fa_shopro_area` VALUES (540529, '隆子县', 540500, 3);
INSERT INTO `fa_shopro_area` VALUES (540530, '错那县', 540500, 3);
INSERT INTO `fa_shopro_area` VALUES (540531, '浪卡子县', 540500, 3);
INSERT INTO `fa_shopro_area` VALUES (542400, '那曲地区', 540000, 2);
INSERT INTO `fa_shopro_area` VALUES (542421, '那曲县', 542400, 3);
INSERT INTO `fa_shopro_area` VALUES (542422, '嘉黎县', 542400, 3);
INSERT INTO `fa_shopro_area` VALUES (542423, '比如县', 542400, 3);
INSERT INTO `fa_shopro_area` VALUES (542424, '聂荣县', 542400, 3);
INSERT INTO `fa_shopro_area` VALUES (542425, '安多县', 542400, 3);
INSERT INTO `fa_shopro_area` VALUES (542426, '申扎县', 542400, 3);
INSERT INTO `fa_shopro_area` VALUES (542427, '索县', 542400, 3);
INSERT INTO `fa_shopro_area` VALUES (542428, '班戈县', 542400, 3);
INSERT INTO `fa_shopro_area` VALUES (542429, '巴青县', 542400, 3);
INSERT INTO `fa_shopro_area` VALUES (542430, '尼玛县', 542400, 3);
INSERT INTO `fa_shopro_area` VALUES (542431, '双湖县', 542400, 3);
INSERT INTO `fa_shopro_area` VALUES (542500, '阿里地区', 540000, 2);
INSERT INTO `fa_shopro_area` VALUES (542521, '普兰县', 542500, 3);
INSERT INTO `fa_shopro_area` VALUES (542522, '札达县', 542500, 3);
INSERT INTO `fa_shopro_area` VALUES (542523, '噶尔县', 542500, 3);
INSERT INTO `fa_shopro_area` VALUES (542524, '日土县', 542500, 3);
INSERT INTO `fa_shopro_area` VALUES (542525, '革吉县', 542500, 3);
INSERT INTO `fa_shopro_area` VALUES (542526, '改则县', 542500, 3);
INSERT INTO `fa_shopro_area` VALUES (542527, '措勤县', 542500, 3);
INSERT INTO `fa_shopro_area` VALUES (610000, '陕西省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (610100, '西安市', 610000, 2);
INSERT INTO `fa_shopro_area` VALUES (610102, '新城区', 610100, 3);
INSERT INTO `fa_shopro_area` VALUES (610103, '碑林区', 610100, 3);
INSERT INTO `fa_shopro_area` VALUES (610104, '莲湖区', 610100, 3);
INSERT INTO `fa_shopro_area` VALUES (610111, '灞桥区', 610100, 3);
INSERT INTO `fa_shopro_area` VALUES (610112, '未央区', 610100, 3);
INSERT INTO `fa_shopro_area` VALUES (610113, '雁塔区', 610100, 3);
INSERT INTO `fa_shopro_area` VALUES (610114, '阎良区', 610100, 3);
INSERT INTO `fa_shopro_area` VALUES (610115, '临潼区', 610100, 3);
INSERT INTO `fa_shopro_area` VALUES (610116, '长安区', 610100, 3);
INSERT INTO `fa_shopro_area` VALUES (610117, '高陵区', 610100, 3);
INSERT INTO `fa_shopro_area` VALUES (610118, '鄠邑区', 610100, 3);
INSERT INTO `fa_shopro_area` VALUES (610122, '蓝田县', 610100, 3);
INSERT INTO `fa_shopro_area` VALUES (610124, '周至县', 610100, 3);
INSERT INTO `fa_shopro_area` VALUES (610200, '铜川市', 610000, 2);
INSERT INTO `fa_shopro_area` VALUES (610202, '王益区', 610200, 3);
INSERT INTO `fa_shopro_area` VALUES (610203, '印台区', 610200, 3);
INSERT INTO `fa_shopro_area` VALUES (610204, '耀州区', 610200, 3);
INSERT INTO `fa_shopro_area` VALUES (610222, '宜君县', 610200, 3);
INSERT INTO `fa_shopro_area` VALUES (610300, '宝鸡市', 610000, 2);
INSERT INTO `fa_shopro_area` VALUES (610302, '渭滨区', 610300, 3);
INSERT INTO `fa_shopro_area` VALUES (610303, '金台区', 610300, 3);
INSERT INTO `fa_shopro_area` VALUES (610304, '陈仓区', 610300, 3);
INSERT INTO `fa_shopro_area` VALUES (610322, '凤翔县', 610300, 3);
INSERT INTO `fa_shopro_area` VALUES (610323, '岐山县', 610300, 3);
INSERT INTO `fa_shopro_area` VALUES (610324, '扶风县', 610300, 3);
INSERT INTO `fa_shopro_area` VALUES (610326, '眉县', 610300, 3);
INSERT INTO `fa_shopro_area` VALUES (610327, '陇县', 610300, 3);
INSERT INTO `fa_shopro_area` VALUES (610328, '千阳县', 610300, 3);
INSERT INTO `fa_shopro_area` VALUES (610329, '麟游县', 610300, 3);
INSERT INTO `fa_shopro_area` VALUES (610330, '凤县', 610300, 3);
INSERT INTO `fa_shopro_area` VALUES (610331, '太白县', 610300, 3);
INSERT INTO `fa_shopro_area` VALUES (610400, '咸阳市', 610000, 2);
INSERT INTO `fa_shopro_area` VALUES (610402, '秦都区', 610400, 3);
INSERT INTO `fa_shopro_area` VALUES (610403, '杨陵区', 610400, 3);
INSERT INTO `fa_shopro_area` VALUES (610404, '渭城区', 610400, 3);
INSERT INTO `fa_shopro_area` VALUES (610422, '三原县', 610400, 3);
INSERT INTO `fa_shopro_area` VALUES (610423, '泾阳县', 610400, 3);
INSERT INTO `fa_shopro_area` VALUES (610424, '乾县', 610400, 3);
INSERT INTO `fa_shopro_area` VALUES (610425, '礼泉县', 610400, 3);
INSERT INTO `fa_shopro_area` VALUES (610426, '永寿县', 610400, 3);
INSERT INTO `fa_shopro_area` VALUES (610427, '彬州市', 610400, 3);
INSERT INTO `fa_shopro_area` VALUES (610428, '长武县', 610400, 3);
INSERT INTO `fa_shopro_area` VALUES (610429, '旬邑县', 610400, 3);
INSERT INTO `fa_shopro_area` VALUES (610430, '淳化县', 610400, 3);
INSERT INTO `fa_shopro_area` VALUES (610431, '武功县', 610400, 3);
INSERT INTO `fa_shopro_area` VALUES (610481, '兴平市', 610400, 3);
INSERT INTO `fa_shopro_area` VALUES (610500, '渭南市', 610000, 2);
INSERT INTO `fa_shopro_area` VALUES (610502, '临渭区', 610500, 3);
INSERT INTO `fa_shopro_area` VALUES (610503, '华州区', 610500, 3);
INSERT INTO `fa_shopro_area` VALUES (610522, '潼关县', 610500, 3);
INSERT INTO `fa_shopro_area` VALUES (610523, '大荔县', 610500, 3);
INSERT INTO `fa_shopro_area` VALUES (610524, '合阳县', 610500, 3);
INSERT INTO `fa_shopro_area` VALUES (610525, '澄城县', 610500, 3);
INSERT INTO `fa_shopro_area` VALUES (610526, '蒲城县', 610500, 3);
INSERT INTO `fa_shopro_area` VALUES (610527, '白水县', 610500, 3);
INSERT INTO `fa_shopro_area` VALUES (610528, '富平县', 610500, 3);
INSERT INTO `fa_shopro_area` VALUES (610581, '韩城市', 610500, 3);
INSERT INTO `fa_shopro_area` VALUES (610582, '华阴市', 610500, 3);
INSERT INTO `fa_shopro_area` VALUES (610600, '延安市', 610000, 2);
INSERT INTO `fa_shopro_area` VALUES (610602, '宝塔区', 610600, 3);
INSERT INTO `fa_shopro_area` VALUES (610603, '安塞区', 610600, 3);
INSERT INTO `fa_shopro_area` VALUES (610621, '延长县', 610600, 3);
INSERT INTO `fa_shopro_area` VALUES (610622, '延川县', 610600, 3);
INSERT INTO `fa_shopro_area` VALUES (610623, '子长县', 610600, 3);
INSERT INTO `fa_shopro_area` VALUES (610625, '志丹县', 610600, 3);
INSERT INTO `fa_shopro_area` VALUES (610626, '吴起县', 610600, 3);
INSERT INTO `fa_shopro_area` VALUES (610627, '甘泉县', 610600, 3);
INSERT INTO `fa_shopro_area` VALUES (610628, '富县', 610600, 3);
INSERT INTO `fa_shopro_area` VALUES (610629, '洛川县', 610600, 3);
INSERT INTO `fa_shopro_area` VALUES (610630, '宜川县', 610600, 3);
INSERT INTO `fa_shopro_area` VALUES (610631, '黄龙县', 610600, 3);
INSERT INTO `fa_shopro_area` VALUES (610632, '黄陵县', 610600, 3);
INSERT INTO `fa_shopro_area` VALUES (610700, '汉中市', 610000, 2);
INSERT INTO `fa_shopro_area` VALUES (610702, '汉台区', 610700, 3);
INSERT INTO `fa_shopro_area` VALUES (610703, '南郑区', 610700, 3);
INSERT INTO `fa_shopro_area` VALUES (610722, '城固县', 610700, 3);
INSERT INTO `fa_shopro_area` VALUES (610723, '洋县', 610700, 3);
INSERT INTO `fa_shopro_area` VALUES (610724, '西乡县', 610700, 3);
INSERT INTO `fa_shopro_area` VALUES (610725, '勉县', 610700, 3);
INSERT INTO `fa_shopro_area` VALUES (610726, '宁强县', 610700, 3);
INSERT INTO `fa_shopro_area` VALUES (610727, '略阳县', 610700, 3);
INSERT INTO `fa_shopro_area` VALUES (610728, '镇巴县', 610700, 3);
INSERT INTO `fa_shopro_area` VALUES (610729, '留坝县', 610700, 3);
INSERT INTO `fa_shopro_area` VALUES (610730, '佛坪县', 610700, 3);
INSERT INTO `fa_shopro_area` VALUES (610800, '榆林市', 610000, 2);
INSERT INTO `fa_shopro_area` VALUES (610802, '榆阳区', 610800, 3);
INSERT INTO `fa_shopro_area` VALUES (610803, '横山区', 610800, 3);
INSERT INTO `fa_shopro_area` VALUES (610822, '府谷县', 610800, 3);
INSERT INTO `fa_shopro_area` VALUES (610824, '靖边县', 610800, 3);
INSERT INTO `fa_shopro_area` VALUES (610825, '定边县', 610800, 3);
INSERT INTO `fa_shopro_area` VALUES (610826, '绥德县', 610800, 3);
INSERT INTO `fa_shopro_area` VALUES (610827, '米脂县', 610800, 3);
INSERT INTO `fa_shopro_area` VALUES (610828, '佳县', 610800, 3);
INSERT INTO `fa_shopro_area` VALUES (610829, '吴堡县', 610800, 3);
INSERT INTO `fa_shopro_area` VALUES (610830, '清涧县', 610800, 3);
INSERT INTO `fa_shopro_area` VALUES (610831, '子洲县', 610800, 3);
INSERT INTO `fa_shopro_area` VALUES (610881, '神木市', 610800, 3);
INSERT INTO `fa_shopro_area` VALUES (610900, '安康市', 610000, 2);
INSERT INTO `fa_shopro_area` VALUES (610902, '汉滨区', 610900, 3);
INSERT INTO `fa_shopro_area` VALUES (610921, '汉阴县', 610900, 3);
INSERT INTO `fa_shopro_area` VALUES (610922, '石泉县', 610900, 3);
INSERT INTO `fa_shopro_area` VALUES (610923, '宁陕县', 610900, 3);
INSERT INTO `fa_shopro_area` VALUES (610924, '紫阳县', 610900, 3);
INSERT INTO `fa_shopro_area` VALUES (610925, '岚皋县', 610900, 3);
INSERT INTO `fa_shopro_area` VALUES (610926, '平利县', 610900, 3);
INSERT INTO `fa_shopro_area` VALUES (610927, '镇坪县', 610900, 3);
INSERT INTO `fa_shopro_area` VALUES (610928, '旬阳县', 610900, 3);
INSERT INTO `fa_shopro_area` VALUES (610929, '白河县', 610900, 3);
INSERT INTO `fa_shopro_area` VALUES (611000, '商洛市', 610000, 2);
INSERT INTO `fa_shopro_area` VALUES (611002, '商州区', 611000, 3);
INSERT INTO `fa_shopro_area` VALUES (611021, '洛南县', 611000, 3);
INSERT INTO `fa_shopro_area` VALUES (611022, '丹凤县', 611000, 3);
INSERT INTO `fa_shopro_area` VALUES (611023, '商南县', 611000, 3);
INSERT INTO `fa_shopro_area` VALUES (611024, '山阳县', 611000, 3);
INSERT INTO `fa_shopro_area` VALUES (611025, '镇安县', 611000, 3);
INSERT INTO `fa_shopro_area` VALUES (611026, '柞水县', 611000, 3);
INSERT INTO `fa_shopro_area` VALUES (620000, '甘肃省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (620100, '兰州市', 620000, 2);
INSERT INTO `fa_shopro_area` VALUES (620102, '城关区', 620100, 3);
INSERT INTO `fa_shopro_area` VALUES (620103, '七里河区', 620100, 3);
INSERT INTO `fa_shopro_area` VALUES (620104, '西固区', 620100, 3);
INSERT INTO `fa_shopro_area` VALUES (620105, '安宁区', 620100, 3);
INSERT INTO `fa_shopro_area` VALUES (620111, '红古区', 620100, 3);
INSERT INTO `fa_shopro_area` VALUES (620121, '永登县', 620100, 3);
INSERT INTO `fa_shopro_area` VALUES (620122, '皋兰县', 620100, 3);
INSERT INTO `fa_shopro_area` VALUES (620123, '榆中县', 620100, 3);
INSERT INTO `fa_shopro_area` VALUES (620200, '嘉峪关市', 620000, 2);
INSERT INTO `fa_shopro_area` VALUES (620201, '雄关区', 620200, 3);
INSERT INTO `fa_shopro_area` VALUES (620202, '镜铁区', 620200, 3);
INSERT INTO `fa_shopro_area` VALUES (620203, '长城区', 620200, 3);
INSERT INTO `fa_shopro_area` VALUES (620300, '金昌市', 620000, 2);
INSERT INTO `fa_shopro_area` VALUES (620302, '金川区', 620300, 3);
INSERT INTO `fa_shopro_area` VALUES (620321, '永昌县', 620300, 3);
INSERT INTO `fa_shopro_area` VALUES (620400, '白银市', 620000, 2);
INSERT INTO `fa_shopro_area` VALUES (620402, '白银区', 620400, 3);
INSERT INTO `fa_shopro_area` VALUES (620403, '平川区', 620400, 3);
INSERT INTO `fa_shopro_area` VALUES (620421, '靖远县', 620400, 3);
INSERT INTO `fa_shopro_area` VALUES (620422, '会宁县', 620400, 3);
INSERT INTO `fa_shopro_area` VALUES (620423, '景泰县', 620400, 3);
INSERT INTO `fa_shopro_area` VALUES (620500, '天水市', 620000, 2);
INSERT INTO `fa_shopro_area` VALUES (620502, '秦州区', 620500, 3);
INSERT INTO `fa_shopro_area` VALUES (620503, '麦积区', 620500, 3);
INSERT INTO `fa_shopro_area` VALUES (620521, '清水县', 620500, 3);
INSERT INTO `fa_shopro_area` VALUES (620522, '秦安县', 620500, 3);
INSERT INTO `fa_shopro_area` VALUES (620523, '甘谷县', 620500, 3);
INSERT INTO `fa_shopro_area` VALUES (620524, '武山县', 620500, 3);
INSERT INTO `fa_shopro_area` VALUES (620525, '张家川回族自治县', 620500, 3);
INSERT INTO `fa_shopro_area` VALUES (620600, '武威市', 620000, 2);
INSERT INTO `fa_shopro_area` VALUES (620602, '凉州区', 620600, 3);
INSERT INTO `fa_shopro_area` VALUES (620621, '民勤县', 620600, 3);
INSERT INTO `fa_shopro_area` VALUES (620622, '古浪县', 620600, 3);
INSERT INTO `fa_shopro_area` VALUES (620623, '天祝藏族自治县', 620600, 3);
INSERT INTO `fa_shopro_area` VALUES (620700, '张掖市', 620000, 2);
INSERT INTO `fa_shopro_area` VALUES (620702, '甘州区', 620700, 3);
INSERT INTO `fa_shopro_area` VALUES (620721, '肃南裕固族自治县', 620700, 3);
INSERT INTO `fa_shopro_area` VALUES (620722, '民乐县', 620700, 3);
INSERT INTO `fa_shopro_area` VALUES (620723, '临泽县', 620700, 3);
INSERT INTO `fa_shopro_area` VALUES (620724, '高台县', 620700, 3);
INSERT INTO `fa_shopro_area` VALUES (620725, '山丹县', 620700, 3);
INSERT INTO `fa_shopro_area` VALUES (620800, '平凉市', 620000, 2);
INSERT INTO `fa_shopro_area` VALUES (620802, '崆峒区', 620800, 3);
INSERT INTO `fa_shopro_area` VALUES (620821, '泾川县', 620800, 3);
INSERT INTO `fa_shopro_area` VALUES (620822, '灵台县', 620800, 3);
INSERT INTO `fa_shopro_area` VALUES (620823, '崇信县', 620800, 3);
INSERT INTO `fa_shopro_area` VALUES (620824, '华亭县', 620800, 3);
INSERT INTO `fa_shopro_area` VALUES (620825, '庄浪县', 620800, 3);
INSERT INTO `fa_shopro_area` VALUES (620826, '静宁县', 620800, 3);
INSERT INTO `fa_shopro_area` VALUES (620900, '酒泉市', 620000, 2);
INSERT INTO `fa_shopro_area` VALUES (620902, '肃州区', 620900, 3);
INSERT INTO `fa_shopro_area` VALUES (620921, '金塔县', 620900, 3);
INSERT INTO `fa_shopro_area` VALUES (620922, '瓜州县', 620900, 3);
INSERT INTO `fa_shopro_area` VALUES (620923, '肃北蒙古族自治县', 620900, 3);
INSERT INTO `fa_shopro_area` VALUES (620924, '阿克塞哈萨克族自治县', 620900, 3);
INSERT INTO `fa_shopro_area` VALUES (620981, '玉门市', 620900, 3);
INSERT INTO `fa_shopro_area` VALUES (620982, '敦煌市', 620900, 3);
INSERT INTO `fa_shopro_area` VALUES (621000, '庆阳市', 620000, 2);
INSERT INTO `fa_shopro_area` VALUES (621002, '西峰区', 621000, 3);
INSERT INTO `fa_shopro_area` VALUES (621021, '庆城县', 621000, 3);
INSERT INTO `fa_shopro_area` VALUES (621022, '环县', 621000, 3);
INSERT INTO `fa_shopro_area` VALUES (621023, '华池县', 621000, 3);
INSERT INTO `fa_shopro_area` VALUES (621024, '合水县', 621000, 3);
INSERT INTO `fa_shopro_area` VALUES (621025, '正宁县', 621000, 3);
INSERT INTO `fa_shopro_area` VALUES (621026, '宁县', 621000, 3);
INSERT INTO `fa_shopro_area` VALUES (621027, '镇原县', 621000, 3);
INSERT INTO `fa_shopro_area` VALUES (621100, '定西市', 620000, 2);
INSERT INTO `fa_shopro_area` VALUES (621102, '安定区', 621100, 3);
INSERT INTO `fa_shopro_area` VALUES (621121, '通渭县', 621100, 3);
INSERT INTO `fa_shopro_area` VALUES (621122, '陇西县', 621100, 3);
INSERT INTO `fa_shopro_area` VALUES (621123, '渭源县', 621100, 3);
INSERT INTO `fa_shopro_area` VALUES (621124, '临洮县', 621100, 3);
INSERT INTO `fa_shopro_area` VALUES (621125, '漳县', 621100, 3);
INSERT INTO `fa_shopro_area` VALUES (621126, '岷县', 621100, 3);
INSERT INTO `fa_shopro_area` VALUES (621200, '陇南市', 620000, 2);
INSERT INTO `fa_shopro_area` VALUES (621202, '武都区', 621200, 3);
INSERT INTO `fa_shopro_area` VALUES (621221, '成县', 621200, 3);
INSERT INTO `fa_shopro_area` VALUES (621222, '文县', 621200, 3);
INSERT INTO `fa_shopro_area` VALUES (621223, '宕昌县', 621200, 3);
INSERT INTO `fa_shopro_area` VALUES (621224, '康县', 621200, 3);
INSERT INTO `fa_shopro_area` VALUES (621225, '西和县', 621200, 3);
INSERT INTO `fa_shopro_area` VALUES (621226, '礼县', 621200, 3);
INSERT INTO `fa_shopro_area` VALUES (621227, '徽县', 621200, 3);
INSERT INTO `fa_shopro_area` VALUES (621228, '两当县', 621200, 3);
INSERT INTO `fa_shopro_area` VALUES (622900, '临夏回族自治州', 620000, 2);
INSERT INTO `fa_shopro_area` VALUES (622901, '临夏市', 622900, 3);
INSERT INTO `fa_shopro_area` VALUES (622921, '临夏县', 622900, 3);
INSERT INTO `fa_shopro_area` VALUES (622922, '康乐县', 622900, 3);
INSERT INTO `fa_shopro_area` VALUES (622923, '永靖县', 622900, 3);
INSERT INTO `fa_shopro_area` VALUES (622924, '广河县', 622900, 3);
INSERT INTO `fa_shopro_area` VALUES (622925, '和政县', 622900, 3);
INSERT INTO `fa_shopro_area` VALUES (622926, '东乡族自治县', 622900, 3);
INSERT INTO `fa_shopro_area` VALUES (622927, '积石山保安族东乡族撒拉族自治县', 622900, 3);
INSERT INTO `fa_shopro_area` VALUES (623000, '甘南藏族自治州', 620000, 2);
INSERT INTO `fa_shopro_area` VALUES (623001, '合作市', 623000, 3);
INSERT INTO `fa_shopro_area` VALUES (623021, '临潭县', 623000, 3);
INSERT INTO `fa_shopro_area` VALUES (623022, '卓尼县', 623000, 3);
INSERT INTO `fa_shopro_area` VALUES (623023, '舟曲县', 623000, 3);
INSERT INTO `fa_shopro_area` VALUES (623024, '迭部县', 623000, 3);
INSERT INTO `fa_shopro_area` VALUES (623025, '玛曲县', 623000, 3);
INSERT INTO `fa_shopro_area` VALUES (623026, '碌曲县', 623000, 3);
INSERT INTO `fa_shopro_area` VALUES (623027, '夏河县', 623000, 3);
INSERT INTO `fa_shopro_area` VALUES (630000, '青海省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (630100, '西宁市', 630000, 2);
INSERT INTO `fa_shopro_area` VALUES (630102, '城东区', 630100, 3);
INSERT INTO `fa_shopro_area` VALUES (630103, '城中区', 630100, 3);
INSERT INTO `fa_shopro_area` VALUES (630104, '城西区', 630100, 3);
INSERT INTO `fa_shopro_area` VALUES (630105, '城北区', 630100, 3);
INSERT INTO `fa_shopro_area` VALUES (630121, '大通回族土族自治县', 630100, 3);
INSERT INTO `fa_shopro_area` VALUES (630122, '湟中县', 630100, 3);
INSERT INTO `fa_shopro_area` VALUES (630123, '湟源县', 630100, 3);
INSERT INTO `fa_shopro_area` VALUES (630200, '海东市', 630000, 2);
INSERT INTO `fa_shopro_area` VALUES (630202, '乐都区', 630200, 3);
INSERT INTO `fa_shopro_area` VALUES (630203, '平安区', 630200, 3);
INSERT INTO `fa_shopro_area` VALUES (630222, '民和回族土族自治县', 630200, 3);
INSERT INTO `fa_shopro_area` VALUES (630223, '互助土族自治县', 630200, 3);
INSERT INTO `fa_shopro_area` VALUES (630224, '化隆回族自治县', 630200, 3);
INSERT INTO `fa_shopro_area` VALUES (630225, '循化撒拉族自治县', 630200, 3);
INSERT INTO `fa_shopro_area` VALUES (632200, '海北藏族自治州', 630000, 2);
INSERT INTO `fa_shopro_area` VALUES (632221, '门源回族自治县', 632200, 3);
INSERT INTO `fa_shopro_area` VALUES (632222, '祁连县', 632200, 3);
INSERT INTO `fa_shopro_area` VALUES (632223, '海晏县', 632200, 3);
INSERT INTO `fa_shopro_area` VALUES (632224, '刚察县', 632200, 3);
INSERT INTO `fa_shopro_area` VALUES (632300, '黄南藏族自治州', 630000, 2);
INSERT INTO `fa_shopro_area` VALUES (632321, '同仁县', 632300, 3);
INSERT INTO `fa_shopro_area` VALUES (632322, '尖扎县', 632300, 3);
INSERT INTO `fa_shopro_area` VALUES (632323, '泽库县', 632300, 3);
INSERT INTO `fa_shopro_area` VALUES (632324, '河南蒙古族自治县', 632300, 3);
INSERT INTO `fa_shopro_area` VALUES (632500, '海南藏族自治州', 630000, 2);
INSERT INTO `fa_shopro_area` VALUES (632521, '共和县', 632500, 3);
INSERT INTO `fa_shopro_area` VALUES (632522, '同德县', 632500, 3);
INSERT INTO `fa_shopro_area` VALUES (632523, '贵德县', 632500, 3);
INSERT INTO `fa_shopro_area` VALUES (632524, '兴海县', 632500, 3);
INSERT INTO `fa_shopro_area` VALUES (632525, '贵南县', 632500, 3);
INSERT INTO `fa_shopro_area` VALUES (632600, '果洛藏族自治州', 630000, 2);
INSERT INTO `fa_shopro_area` VALUES (632621, '玛沁县', 632600, 3);
INSERT INTO `fa_shopro_area` VALUES (632622, '班玛县', 632600, 3);
INSERT INTO `fa_shopro_area` VALUES (632623, '甘德县', 632600, 3);
INSERT INTO `fa_shopro_area` VALUES (632624, '达日县', 632600, 3);
INSERT INTO `fa_shopro_area` VALUES (632625, '久治县', 632600, 3);
INSERT INTO `fa_shopro_area` VALUES (632626, '玛多县', 632600, 3);
INSERT INTO `fa_shopro_area` VALUES (632700, '玉树藏族自治州', 630000, 2);
INSERT INTO `fa_shopro_area` VALUES (632701, '玉树市', 632700, 3);
INSERT INTO `fa_shopro_area` VALUES (632722, '杂多县', 632700, 3);
INSERT INTO `fa_shopro_area` VALUES (632723, '称多县', 632700, 3);
INSERT INTO `fa_shopro_area` VALUES (632724, '治多县', 632700, 3);
INSERT INTO `fa_shopro_area` VALUES (632725, '囊谦县', 632700, 3);
INSERT INTO `fa_shopro_area` VALUES (632726, '曲麻莱县', 632700, 3);
INSERT INTO `fa_shopro_area` VALUES (632800, '海西蒙古族藏族自治州', 630000, 2);
INSERT INTO `fa_shopro_area` VALUES (632801, '格尔木市', 632800, 3);
INSERT INTO `fa_shopro_area` VALUES (632802, '德令哈市', 632800, 3);
INSERT INTO `fa_shopro_area` VALUES (632821, '乌兰县', 632800, 3);
INSERT INTO `fa_shopro_area` VALUES (632822, '都兰县', 632800, 3);
INSERT INTO `fa_shopro_area` VALUES (632823, '天峻县', 632800, 3);
INSERT INTO `fa_shopro_area` VALUES (632824, '冷湖行政委员会', 632800, 3);
INSERT INTO `fa_shopro_area` VALUES (632825, '大柴旦行政委员会', 632800, 3);
INSERT INTO `fa_shopro_area` VALUES (632826, '茫崖行政委员会', 632800, 3);
INSERT INTO `fa_shopro_area` VALUES (640000, '宁夏回族自治区', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (640100, '银川市', 640000, 2);
INSERT INTO `fa_shopro_area` VALUES (640104, '兴庆区', 640100, 3);
INSERT INTO `fa_shopro_area` VALUES (640105, '西夏区', 640100, 3);
INSERT INTO `fa_shopro_area` VALUES (640106, '金凤区', 640100, 3);
INSERT INTO `fa_shopro_area` VALUES (640121, '永宁县', 640100, 3);
INSERT INTO `fa_shopro_area` VALUES (640122, '贺兰县', 640100, 3);
INSERT INTO `fa_shopro_area` VALUES (640181, '灵武市', 640100, 3);
INSERT INTO `fa_shopro_area` VALUES (640200, '石嘴山市', 640000, 2);
INSERT INTO `fa_shopro_area` VALUES (640202, '大武口区', 640200, 3);
INSERT INTO `fa_shopro_area` VALUES (640205, '惠农区', 640200, 3);
INSERT INTO `fa_shopro_area` VALUES (640221, '平罗县', 640200, 3);
INSERT INTO `fa_shopro_area` VALUES (640300, '吴忠市', 640000, 2);
INSERT INTO `fa_shopro_area` VALUES (640302, '利通区', 640300, 3);
INSERT INTO `fa_shopro_area` VALUES (640303, '红寺堡区', 640300, 3);
INSERT INTO `fa_shopro_area` VALUES (640323, '盐池县', 640300, 3);
INSERT INTO `fa_shopro_area` VALUES (640324, '同心县', 640300, 3);
INSERT INTO `fa_shopro_area` VALUES (640381, '青铜峡市', 640300, 3);
INSERT INTO `fa_shopro_area` VALUES (640400, '固原市', 640000, 2);
INSERT INTO `fa_shopro_area` VALUES (640402, '原州区', 640400, 3);
INSERT INTO `fa_shopro_area` VALUES (640422, '西吉县', 640400, 3);
INSERT INTO `fa_shopro_area` VALUES (640423, '隆德县', 640400, 3);
INSERT INTO `fa_shopro_area` VALUES (640424, '泾源县', 640400, 3);
INSERT INTO `fa_shopro_area` VALUES (640425, '彭阳县', 640400, 3);
INSERT INTO `fa_shopro_area` VALUES (640500, '中卫市', 640000, 2);
INSERT INTO `fa_shopro_area` VALUES (640502, '沙坡头区', 640500, 3);
INSERT INTO `fa_shopro_area` VALUES (640521, '中宁县', 640500, 3);
INSERT INTO `fa_shopro_area` VALUES (640522, '海原县', 640500, 3);
INSERT INTO `fa_shopro_area` VALUES (650000, '新疆维吾尔自治区', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (650100, '乌鲁木齐市', 650000, 2);
INSERT INTO `fa_shopro_area` VALUES (650102, '天山区', 650100, 3);
INSERT INTO `fa_shopro_area` VALUES (650103, '沙依巴克区', 650100, 3);
INSERT INTO `fa_shopro_area` VALUES (650104, '新市区', 650100, 3);
INSERT INTO `fa_shopro_area` VALUES (650105, '水磨沟区', 650100, 3);
INSERT INTO `fa_shopro_area` VALUES (650106, '头屯河区', 650100, 3);
INSERT INTO `fa_shopro_area` VALUES (650107, '达坂城区', 650100, 3);
INSERT INTO `fa_shopro_area` VALUES (650109, '米东区', 650100, 3);
INSERT INTO `fa_shopro_area` VALUES (650121, '乌鲁木齐县', 650100, 3);
INSERT INTO `fa_shopro_area` VALUES (650200, '克拉玛依市', 650000, 2);
INSERT INTO `fa_shopro_area` VALUES (650202, '独山子区', 650200, 3);
INSERT INTO `fa_shopro_area` VALUES (650203, '克拉玛依区', 650200, 3);
INSERT INTO `fa_shopro_area` VALUES (650204, '白碱滩区', 650200, 3);
INSERT INTO `fa_shopro_area` VALUES (650205, '乌尔禾区', 650200, 3);
INSERT INTO `fa_shopro_area` VALUES (650400, '吐鲁番市', 650000, 2);
INSERT INTO `fa_shopro_area` VALUES (650402, '高昌区', 650400, 3);
INSERT INTO `fa_shopro_area` VALUES (650421, '鄯善县', 650400, 3);
INSERT INTO `fa_shopro_area` VALUES (650422, '托克逊县', 650400, 3);
INSERT INTO `fa_shopro_area` VALUES (650500, '哈密市', 650000, 2);
INSERT INTO `fa_shopro_area` VALUES (650502, '伊州区', 650500, 3);
INSERT INTO `fa_shopro_area` VALUES (650521, '巴里坤哈萨克自治县', 650500, 3);
INSERT INTO `fa_shopro_area` VALUES (650522, '伊吾县', 650500, 3);
INSERT INTO `fa_shopro_area` VALUES (652300, '昌吉回族自治州', 650000, 2);
INSERT INTO `fa_shopro_area` VALUES (652301, '昌吉市', 652300, 3);
INSERT INTO `fa_shopro_area` VALUES (652302, '阜康市', 652300, 3);
INSERT INTO `fa_shopro_area` VALUES (652323, '呼图壁县', 652300, 3);
INSERT INTO `fa_shopro_area` VALUES (652324, '玛纳斯县', 652300, 3);
INSERT INTO `fa_shopro_area` VALUES (652325, '奇台县', 652300, 3);
INSERT INTO `fa_shopro_area` VALUES (652327, '吉木萨尔县', 652300, 3);
INSERT INTO `fa_shopro_area` VALUES (652328, '木垒哈萨克自治县', 652300, 3);
INSERT INTO `fa_shopro_area` VALUES (652700, '博尔塔拉蒙古自治州', 650000, 2);
INSERT INTO `fa_shopro_area` VALUES (652701, '博乐市', 652700, 3);
INSERT INTO `fa_shopro_area` VALUES (652702, '阿拉山口市', 652700, 3);
INSERT INTO `fa_shopro_area` VALUES (652722, '精河县', 652700, 3);
INSERT INTO `fa_shopro_area` VALUES (652723, '温泉县', 652700, 3);
INSERT INTO `fa_shopro_area` VALUES (652800, '巴音郭楞蒙古自治州', 650000, 2);
INSERT INTO `fa_shopro_area` VALUES (652801, '库尔勒市', 652800, 3);
INSERT INTO `fa_shopro_area` VALUES (652822, '轮台县', 652800, 3);
INSERT INTO `fa_shopro_area` VALUES (652823, '尉犁县', 652800, 3);
INSERT INTO `fa_shopro_area` VALUES (652824, '若羌县', 652800, 3);
INSERT INTO `fa_shopro_area` VALUES (652825, '且末县', 652800, 3);
INSERT INTO `fa_shopro_area` VALUES (652826, '焉耆回族自治县', 652800, 3);
INSERT INTO `fa_shopro_area` VALUES (652827, '和静县', 652800, 3);
INSERT INTO `fa_shopro_area` VALUES (652828, '和硕县', 652800, 3);
INSERT INTO `fa_shopro_area` VALUES (652829, '博湖县', 652800, 3);
INSERT INTO `fa_shopro_area` VALUES (652900, '阿克苏地区', 650000, 2);
INSERT INTO `fa_shopro_area` VALUES (652901, '阿克苏市', 652900, 3);
INSERT INTO `fa_shopro_area` VALUES (652922, '温宿县', 652900, 3);
INSERT INTO `fa_shopro_area` VALUES (652923, '库车县', 652900, 3);
INSERT INTO `fa_shopro_area` VALUES (652924, '沙雅县', 652900, 3);
INSERT INTO `fa_shopro_area` VALUES (652925, '新和县', 652900, 3);
INSERT INTO `fa_shopro_area` VALUES (652926, '拜城县', 652900, 3);
INSERT INTO `fa_shopro_area` VALUES (652927, '乌什县', 652900, 3);
INSERT INTO `fa_shopro_area` VALUES (652928, '阿瓦提县', 652900, 3);
INSERT INTO `fa_shopro_area` VALUES (652929, '柯坪县', 652900, 3);
INSERT INTO `fa_shopro_area` VALUES (653000, '克孜勒苏柯尔克孜自治州', 650000, 2);
INSERT INTO `fa_shopro_area` VALUES (653001, '阿图什市', 653000, 3);
INSERT INTO `fa_shopro_area` VALUES (653022, '阿克陶县', 653000, 3);
INSERT INTO `fa_shopro_area` VALUES (653023, '阿合奇县', 653000, 3);
INSERT INTO `fa_shopro_area` VALUES (653024, '乌恰县', 653000, 3);
INSERT INTO `fa_shopro_area` VALUES (653100, '喀什地区', 650000, 2);
INSERT INTO `fa_shopro_area` VALUES (653101, '喀什市', 653100, 3);
INSERT INTO `fa_shopro_area` VALUES (653121, '疏附县', 653100, 3);
INSERT INTO `fa_shopro_area` VALUES (653122, '疏勒县', 653100, 3);
INSERT INTO `fa_shopro_area` VALUES (653123, '英吉沙县', 653100, 3);
INSERT INTO `fa_shopro_area` VALUES (653124, '泽普县', 653100, 3);
INSERT INTO `fa_shopro_area` VALUES (653125, '莎车县', 653100, 3);
INSERT INTO `fa_shopro_area` VALUES (653126, '叶城县', 653100, 3);
INSERT INTO `fa_shopro_area` VALUES (653127, '麦盖提县', 653100, 3);
INSERT INTO `fa_shopro_area` VALUES (653128, '岳普湖县', 653100, 3);
INSERT INTO `fa_shopro_area` VALUES (653129, '伽师县', 653100, 3);
INSERT INTO `fa_shopro_area` VALUES (653130, '巴楚县', 653100, 3);
INSERT INTO `fa_shopro_area` VALUES (653131, '塔什库尔干塔吉克自治县', 653100, 3);
INSERT INTO `fa_shopro_area` VALUES (653200, '和田地区', 650000, 2);
INSERT INTO `fa_shopro_area` VALUES (653201, '和田市', 653200, 3);
INSERT INTO `fa_shopro_area` VALUES (653221, '和田县', 653200, 3);
INSERT INTO `fa_shopro_area` VALUES (653222, '墨玉县', 653200, 3);
INSERT INTO `fa_shopro_area` VALUES (653223, '皮山县', 653200, 3);
INSERT INTO `fa_shopro_area` VALUES (653224, '洛浦县', 653200, 3);
INSERT INTO `fa_shopro_area` VALUES (653225, '策勒县', 653200, 3);
INSERT INTO `fa_shopro_area` VALUES (653226, '于田县', 653200, 3);
INSERT INTO `fa_shopro_area` VALUES (653227, '民丰县', 653200, 3);
INSERT INTO `fa_shopro_area` VALUES (654000, '伊犁哈萨克自治州', 650000, 2);
INSERT INTO `fa_shopro_area` VALUES (654002, '伊宁市', 654000, 3);
INSERT INTO `fa_shopro_area` VALUES (654003, '奎屯市', 654000, 3);
INSERT INTO `fa_shopro_area` VALUES (654004, '霍尔果斯市', 654000, 3);
INSERT INTO `fa_shopro_area` VALUES (654021, '伊宁县', 654000, 3);
INSERT INTO `fa_shopro_area` VALUES (654022, '察布查尔锡伯自治县', 654000, 3);
INSERT INTO `fa_shopro_area` VALUES (654023, '霍城县', 654000, 3);
INSERT INTO `fa_shopro_area` VALUES (654024, '巩留县', 654000, 3);
INSERT INTO `fa_shopro_area` VALUES (654025, '新源县', 654000, 3);
INSERT INTO `fa_shopro_area` VALUES (654026, '昭苏县', 654000, 3);
INSERT INTO `fa_shopro_area` VALUES (654027, '特克斯县', 654000, 3);
INSERT INTO `fa_shopro_area` VALUES (654028, '尼勒克县', 654000, 3);
INSERT INTO `fa_shopro_area` VALUES (654200, '塔城地区', 650000, 2);
INSERT INTO `fa_shopro_area` VALUES (654201, '塔城市', 654200, 3);
INSERT INTO `fa_shopro_area` VALUES (654202, '乌苏市', 654200, 3);
INSERT INTO `fa_shopro_area` VALUES (654221, '额敏县', 654200, 3);
INSERT INTO `fa_shopro_area` VALUES (654223, '沙湾县', 654200, 3);
INSERT INTO `fa_shopro_area` VALUES (654224, '托里县', 654200, 3);
INSERT INTO `fa_shopro_area` VALUES (654225, '裕民县', 654200, 3);
INSERT INTO `fa_shopro_area` VALUES (654226, '和布克赛尔蒙古自治县', 654200, 3);
INSERT INTO `fa_shopro_area` VALUES (654300, '阿勒泰地区', 650000, 2);
INSERT INTO `fa_shopro_area` VALUES (654301, '阿勒泰市', 654300, 3);
INSERT INTO `fa_shopro_area` VALUES (654321, '布尔津县', 654300, 3);
INSERT INTO `fa_shopro_area` VALUES (654322, '富蕴县', 654300, 3);
INSERT INTO `fa_shopro_area` VALUES (654323, '福海县', 654300, 3);
INSERT INTO `fa_shopro_area` VALUES (654324, '哈巴河县', 654300, 3);
INSERT INTO `fa_shopro_area` VALUES (654325, '青河县', 654300, 3);
INSERT INTO `fa_shopro_area` VALUES (654326, '吉木乃县', 654300, 3);
INSERT INTO `fa_shopro_area` VALUES (659000, '自治区直辖县级行政区划', 650000, 2);
INSERT INTO `fa_shopro_area` VALUES (659001, '石河子市', 659000, 3);
INSERT INTO `fa_shopro_area` VALUES (659002, '阿拉尔市', 659000, 3);
INSERT INTO `fa_shopro_area` VALUES (659003, '图木舒克市', 659000, 3);
INSERT INTO `fa_shopro_area` VALUES (659004, '五家渠市', 659000, 3);
INSERT INTO `fa_shopro_area` VALUES (659005, '北屯市', 659000, 3);
INSERT INTO `fa_shopro_area` VALUES (659006, '铁门关市', 659000, 3);
INSERT INTO `fa_shopro_area` VALUES (659007, '双河市', 659000, 3);
INSERT INTO `fa_shopro_area` VALUES (659008, '可克达拉市', 659000, 3);
INSERT INTO `fa_shopro_area` VALUES (659009, '昆玉市', 659000, 3);
INSERT INTO `fa_shopro_area` VALUES (710000, '台湾省', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (710100, '台北市', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (710101, '中正区', 710100, 3);
INSERT INTO `fa_shopro_area` VALUES (710102, '大同区', 710100, 3);
INSERT INTO `fa_shopro_area` VALUES (710103, '中山区', 710100, 3);
INSERT INTO `fa_shopro_area` VALUES (710104, '松山区', 710100, 3);
INSERT INTO `fa_shopro_area` VALUES (710105, '大安区', 710100, 3);
INSERT INTO `fa_shopro_area` VALUES (710106, '万华区', 710100, 3);
INSERT INTO `fa_shopro_area` VALUES (710107, '信义区', 710100, 3);
INSERT INTO `fa_shopro_area` VALUES (710108, '士林区', 710100, 3);
INSERT INTO `fa_shopro_area` VALUES (710109, '北投区', 710100, 3);
INSERT INTO `fa_shopro_area` VALUES (710110, '内湖区', 710100, 3);
INSERT INTO `fa_shopro_area` VALUES (710111, '南港区', 710100, 3);
INSERT INTO `fa_shopro_area` VALUES (710112, '文山区', 710100, 3);
INSERT INTO `fa_shopro_area` VALUES (710200, '高雄市', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (710201, '新兴区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710202, '前金区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710203, '苓雅区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710204, '盐埕区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710205, '鼓山区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710206, '旗津区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710207, '前镇区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710208, '三民区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710209, '左营区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710210, '楠梓区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710211, '小港区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710242, '仁武区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710243, '大社区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710244, '冈山区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710245, '路竹区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710246, '阿莲区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710247, '田寮区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710248, '燕巢区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710249, '桥头区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710250, '梓官区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710251, '弥陀区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710252, '永安区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710253, '湖内区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710254, '凤山区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710255, '大寮区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710256, '林园区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710257, '鸟松区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710258, '大树区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710259, '旗山区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710260, '美浓区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710261, '六龟区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710262, '内门区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710263, '杉林区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710264, '甲仙区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710265, '桃源区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710266, '那玛夏区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710267, '茂林区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710268, '茄萣区', 710200, 3);
INSERT INTO `fa_shopro_area` VALUES (710300, '台南市', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (710301, '中西区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710302, '东区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710303, '南区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710304, '北区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710305, '安平区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710306, '安南区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710339, '永康区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710340, '归仁区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710341, '新化区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710342, '左镇区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710343, '玉井区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710344, '楠西区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710345, '南化区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710346, '仁德区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710347, '关庙区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710348, '龙崎区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710349, '官田区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710350, '麻豆区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710351, '佳里区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710352, '西港区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710353, '七股区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710354, '将军区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710355, '学甲区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710356, '北门区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710357, '新营区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710358, '后壁区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710359, '白河区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710360, '东山区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710361, '六甲区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710362, '下营区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710363, '柳营区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710364, '盐水区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710365, '善化区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710366, '大内区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710367, '山上区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710368, '新市区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710369, '安定区', 710300, 3);
INSERT INTO `fa_shopro_area` VALUES (710400, '台中市', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (710401, '中区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710402, '东区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710403, '南区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710404, '西区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710405, '北区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710406, '北屯区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710407, '西屯区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710408, '南屯区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710431, '太平区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710432, '大里区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710433, '雾峰区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710434, '乌日区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710435, '丰原区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710436, '后里区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710437, '石冈区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710438, '东势区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710439, '和平区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710440, '新社区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710441, '潭子区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710442, '大雅区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710443, '神冈区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710444, '大肚区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710445, '沙鹿区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710446, '龙井区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710447, '梧栖区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710448, '清水区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710449, '大甲区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710450, '外埔区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710451, '大安区', 710400, 3);
INSERT INTO `fa_shopro_area` VALUES (710600, '南投县', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (710614, '南投市', 710600, 3);
INSERT INTO `fa_shopro_area` VALUES (710615, '中寮乡', 710600, 3);
INSERT INTO `fa_shopro_area` VALUES (710616, '草屯镇', 710600, 3);
INSERT INTO `fa_shopro_area` VALUES (710617, '国姓乡', 710600, 3);
INSERT INTO `fa_shopro_area` VALUES (710618, '埔里镇', 710600, 3);
INSERT INTO `fa_shopro_area` VALUES (710619, '仁爱乡', 710600, 3);
INSERT INTO `fa_shopro_area` VALUES (710620, '名间乡', 710600, 3);
INSERT INTO `fa_shopro_area` VALUES (710621, '集集镇', 710600, 3);
INSERT INTO `fa_shopro_area` VALUES (710622, '水里乡', 710600, 3);
INSERT INTO `fa_shopro_area` VALUES (710623, '鱼池乡', 710600, 3);
INSERT INTO `fa_shopro_area` VALUES (710624, '信义乡', 710600, 3);
INSERT INTO `fa_shopro_area` VALUES (710625, '竹山镇', 710600, 3);
INSERT INTO `fa_shopro_area` VALUES (710626, '鹿谷乡', 710600, 3);
INSERT INTO `fa_shopro_area` VALUES (710700, '基隆市', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (710701, '仁爱区', 710700, 3);
INSERT INTO `fa_shopro_area` VALUES (710702, '信义区', 710700, 3);
INSERT INTO `fa_shopro_area` VALUES (710703, '中正区', 710700, 3);
INSERT INTO `fa_shopro_area` VALUES (710704, '中山区', 710700, 3);
INSERT INTO `fa_shopro_area` VALUES (710705, '安乐区', 710700, 3);
INSERT INTO `fa_shopro_area` VALUES (710706, '暖暖区', 710700, 3);
INSERT INTO `fa_shopro_area` VALUES (710707, '七堵区', 710700, 3);
INSERT INTO `fa_shopro_area` VALUES (710800, '新竹市', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (710801, '东区', 710800, 3);
INSERT INTO `fa_shopro_area` VALUES (710802, '北区', 710800, 3);
INSERT INTO `fa_shopro_area` VALUES (710803, '香山区', 710800, 3);
INSERT INTO `fa_shopro_area` VALUES (710900, '嘉义市', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (710901, '东区', 710900, 3);
INSERT INTO `fa_shopro_area` VALUES (710902, '西区', 710900, 3);
INSERT INTO `fa_shopro_area` VALUES (711100, '新北市', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (711130, '万里区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711131, '金山区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711132, '板桥区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711133, '汐止区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711134, '深坑区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711135, '石碇区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711136, '瑞芳区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711137, '平溪区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711138, '双溪区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711139, '贡寮区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711140, '新店区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711141, '坪林区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711142, '乌来区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711143, '永和区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711144, '中和区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711145, '土城区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711146, '三峡区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711147, '树林区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711148, '莺歌区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711149, '三重区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711150, '新庄区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711151, '泰山区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711152, '林口区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711153, '芦洲区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711154, '五股区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711155, '八里区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711156, '淡水区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711157, '三芝区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711158, '石门区', 711100, 3);
INSERT INTO `fa_shopro_area` VALUES (711200, '宜兰县', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (711214, '宜兰市', 711200, 3);
INSERT INTO `fa_shopro_area` VALUES (711215, '头城镇', 711200, 3);
INSERT INTO `fa_shopro_area` VALUES (711216, '礁溪乡', 711200, 3);
INSERT INTO `fa_shopro_area` VALUES (711217, '壮围乡', 711200, 3);
INSERT INTO `fa_shopro_area` VALUES (711218, '员山乡', 711200, 3);
INSERT INTO `fa_shopro_area` VALUES (711219, '罗东镇', 711200, 3);
INSERT INTO `fa_shopro_area` VALUES (711220, '三星乡', 711200, 3);
INSERT INTO `fa_shopro_area` VALUES (711221, '大同乡', 711200, 3);
INSERT INTO `fa_shopro_area` VALUES (711222, '五结乡', 711200, 3);
INSERT INTO `fa_shopro_area` VALUES (711223, '冬山乡', 711200, 3);
INSERT INTO `fa_shopro_area` VALUES (711224, '苏澳镇', 711200, 3);
INSERT INTO `fa_shopro_area` VALUES (711225, '南澳乡', 711200, 3);
INSERT INTO `fa_shopro_area` VALUES (711300, '新竹县', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (711314, '竹北市', 711300, 3);
INSERT INTO `fa_shopro_area` VALUES (711315, '湖口乡', 711300, 3);
INSERT INTO `fa_shopro_area` VALUES (711316, '新丰乡', 711300, 3);
INSERT INTO `fa_shopro_area` VALUES (711317, '新埔镇', 711300, 3);
INSERT INTO `fa_shopro_area` VALUES (711318, '关西镇', 711300, 3);
INSERT INTO `fa_shopro_area` VALUES (711319, '芎林乡', 711300, 3);
INSERT INTO `fa_shopro_area` VALUES (711320, '宝山乡', 711300, 3);
INSERT INTO `fa_shopro_area` VALUES (711321, '竹东镇', 711300, 3);
INSERT INTO `fa_shopro_area` VALUES (711322, '五峰乡', 711300, 3);
INSERT INTO `fa_shopro_area` VALUES (711323, '横山乡', 711300, 3);
INSERT INTO `fa_shopro_area` VALUES (711324, '尖石乡', 711300, 3);
INSERT INTO `fa_shopro_area` VALUES (711325, '北埔乡', 711300, 3);
INSERT INTO `fa_shopro_area` VALUES (711326, '峨眉乡', 711300, 3);
INSERT INTO `fa_shopro_area` VALUES (711400, '桃园市', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (711414, '中坜区', 711400, 3);
INSERT INTO `fa_shopro_area` VALUES (711415, '平镇区', 711400, 3);
INSERT INTO `fa_shopro_area` VALUES (711416, '龙潭区', 711400, 3);
INSERT INTO `fa_shopro_area` VALUES (711417, '杨梅区', 711400, 3);
INSERT INTO `fa_shopro_area` VALUES (711418, '新屋区', 711400, 3);
INSERT INTO `fa_shopro_area` VALUES (711419, '观音区', 711400, 3);
INSERT INTO `fa_shopro_area` VALUES (711420, '桃园区', 711400, 3);
INSERT INTO `fa_shopro_area` VALUES (711421, '龟山区', 711400, 3);
INSERT INTO `fa_shopro_area` VALUES (711422, '八德区', 711400, 3);
INSERT INTO `fa_shopro_area` VALUES (711423, '大溪区', 711400, 3);
INSERT INTO `fa_shopro_area` VALUES (711424, '复兴区', 711400, 3);
INSERT INTO `fa_shopro_area` VALUES (711425, '大园区', 711400, 3);
INSERT INTO `fa_shopro_area` VALUES (711426, '芦竹区', 711400, 3);
INSERT INTO `fa_shopro_area` VALUES (711500, '苗栗县', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (711519, '竹南镇', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711520, '头份市', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711521, '三湾乡', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711522, '南庄乡', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711523, '狮潭乡', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711524, '后龙镇', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711525, '通霄镇', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711526, '苑里镇', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711527, '苗栗市', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711528, '造桥乡', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711529, '头屋乡', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711530, '公馆乡', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711531, '大湖乡', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711532, '泰安乡', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711533, '铜锣乡', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711534, '三义乡', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711535, '西湖乡', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711536, '卓兰镇', 711500, 3);
INSERT INTO `fa_shopro_area` VALUES (711700, '彰化县', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (711727, '彰化市', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711728, '芬园乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711729, '花坛乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711730, '秀水乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711731, '鹿港镇', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711732, '福兴乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711733, '线西乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711734, '和美镇', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711735, '伸港乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711736, '员林市', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711737, '社头乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711738, '永靖乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711739, '埔心乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711740, '溪湖镇', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711741, '大村乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711742, '埔盐乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711743, '田中镇', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711744, '北斗镇', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711745, '田尾乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711746, '埤头乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711747, '溪州乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711748, '竹塘乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711749, '二林镇', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711750, '大城乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711751, '芳苑乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711752, '二水乡', 711700, 3);
INSERT INTO `fa_shopro_area` VALUES (711900, '嘉义县', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (711919, '番路乡', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711920, '梅山乡', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711921, '竹崎乡', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711922, '阿里山乡', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711923, '中埔乡', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711924, '大埔乡', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711925, '水上乡', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711926, '鹿草乡', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711927, '太保市', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711928, '朴子市', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711929, '东石乡', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711930, '六脚乡', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711931, '新港乡', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711932, '民雄乡', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711933, '大林镇', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711934, '溪口乡', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711935, '义竹乡', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (711936, '布袋镇', 711900, 3);
INSERT INTO `fa_shopro_area` VALUES (712100, '云林县', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (712121, '斗南镇', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712122, '大埤乡', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712123, '虎尾镇', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712124, '土库镇', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712125, '褒忠乡', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712126, '东势乡', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712127, '台西乡', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712128, '仑背乡', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712129, '麦寮乡', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712130, '斗六市', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712131, '林内乡', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712132, '古坑乡', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712133, '莿桐乡', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712134, '西螺镇', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712135, '二仑乡', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712136, '北港镇', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712137, '水林乡', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712138, '口湖乡', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712139, '四湖乡', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712140, '元长乡', 712100, 3);
INSERT INTO `fa_shopro_area` VALUES (712400, '屏东县', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (712434, '屏东市', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712435, '三地门乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712436, '雾台乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712437, '玛家乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712438, '九如乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712439, '里港乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712440, '高树乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712441, '盐埔乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712442, '长治乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712443, '麟洛乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712444, '竹田乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712445, '内埔乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712446, '万丹乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712447, '潮州镇', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712448, '泰武乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712449, '来义乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712450, '万峦乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712451, '崁顶乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712452, '新埤乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712453, '南州乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712454, '林边乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712455, '东港镇', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712456, '琉球乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712457, '佳冬乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712458, '新园乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712459, '枋寮乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712460, '枋山乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712461, '春日乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712462, '狮子乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712463, '车城乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712464, '牡丹乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712465, '恒春镇', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712466, '满州乡', 712400, 3);
INSERT INTO `fa_shopro_area` VALUES (712500, '台东县', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (712517, '台东市', 712500, 3);
INSERT INTO `fa_shopro_area` VALUES (712518, '绿岛乡', 712500, 3);
INSERT INTO `fa_shopro_area` VALUES (712519, '兰屿乡', 712500, 3);
INSERT INTO `fa_shopro_area` VALUES (712520, '延平乡', 712500, 3);
INSERT INTO `fa_shopro_area` VALUES (712521, '卑南乡', 712500, 3);
INSERT INTO `fa_shopro_area` VALUES (712522, '鹿野乡', 712500, 3);
INSERT INTO `fa_shopro_area` VALUES (712523, '关山镇', 712500, 3);
INSERT INTO `fa_shopro_area` VALUES (712524, '海端乡', 712500, 3);
INSERT INTO `fa_shopro_area` VALUES (712525, '池上乡', 712500, 3);
INSERT INTO `fa_shopro_area` VALUES (712526, '东河乡', 712500, 3);
INSERT INTO `fa_shopro_area` VALUES (712527, '成功镇', 712500, 3);
INSERT INTO `fa_shopro_area` VALUES (712528, '长滨乡', 712500, 3);
INSERT INTO `fa_shopro_area` VALUES (712529, '金峰乡', 712500, 3);
INSERT INTO `fa_shopro_area` VALUES (712530, '大武乡', 712500, 3);
INSERT INTO `fa_shopro_area` VALUES (712531, '达仁乡', 712500, 3);
INSERT INTO `fa_shopro_area` VALUES (712532, '太麻里乡', 712500, 3);
INSERT INTO `fa_shopro_area` VALUES (712600, '花莲县', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (712615, '花莲市', 712600, 3);
INSERT INTO `fa_shopro_area` VALUES (712616, '新城乡', 712600, 3);
INSERT INTO `fa_shopro_area` VALUES (712618, '秀林乡', 712600, 3);
INSERT INTO `fa_shopro_area` VALUES (712619, '吉安乡', 712600, 3);
INSERT INTO `fa_shopro_area` VALUES (712620, '寿丰乡', 712600, 3);
INSERT INTO `fa_shopro_area` VALUES (712621, '凤林镇', 712600, 3);
INSERT INTO `fa_shopro_area` VALUES (712622, '光复乡', 712600, 3);
INSERT INTO `fa_shopro_area` VALUES (712623, '丰滨乡', 712600, 3);
INSERT INTO `fa_shopro_area` VALUES (712624, '瑞穗乡', 712600, 3);
INSERT INTO `fa_shopro_area` VALUES (712625, '万荣乡', 712600, 3);
INSERT INTO `fa_shopro_area` VALUES (712626, '玉里镇', 712600, 3);
INSERT INTO `fa_shopro_area` VALUES (712627, '卓溪乡', 712600, 3);
INSERT INTO `fa_shopro_area` VALUES (712628, '富里乡', 712600, 3);
INSERT INTO `fa_shopro_area` VALUES (712700, '澎湖县', 710000, 2);
INSERT INTO `fa_shopro_area` VALUES (712707, '马公市', 712700, 3);
INSERT INTO `fa_shopro_area` VALUES (712708, '西屿乡', 712700, 3);
INSERT INTO `fa_shopro_area` VALUES (712709, '望安乡', 712700, 3);
INSERT INTO `fa_shopro_area` VALUES (712710, '七美乡', 712700, 3);
INSERT INTO `fa_shopro_area` VALUES (712711, '白沙乡', 712700, 3);
INSERT INTO `fa_shopro_area` VALUES (712712, '湖西乡', 712700, 3);
INSERT INTO `fa_shopro_area` VALUES (810000, '香港特别行政区', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (810100, '香港特别行政区', 810000, 2);
INSERT INTO `fa_shopro_area` VALUES (810101, '中西区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810102, '东区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810103, '九龙城区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810104, '观塘区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810105, '南区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810106, '深水埗区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810107, '湾仔区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810108, '黄大仙区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810109, '油尖旺区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810110, '离岛区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810111, '葵青区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810112, '北区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810113, '西贡区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810114, '沙田区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810115, '屯门区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810116, '大埔区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810117, '荃湾区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (810118, '元朗区', 810100, 3);
INSERT INTO `fa_shopro_area` VALUES (820000, '澳门特别行政区', 0, 1);
INSERT INTO `fa_shopro_area` VALUES (820100, '澳门特别行政区', 820000, 2);
INSERT INTO `fa_shopro_area` VALUES (820101, '澳门半岛', 820100, 3);
INSERT INTO `fa_shopro_area` VALUES (820102, '凼仔', 820100, 3);
INSERT INTO `fa_shopro_area` VALUES (820103, '路凼城', 820100, 3);
INSERT INTO `fa_shopro_area` VALUES (820104, '路环', 820100, 3);

-- ----------------------------
-- Table structure for fa_shopro_cart
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_cart`;
CREATE TABLE `fa_shopro_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户',
  `goods_id` int(11) NULL DEFAULT NULL,
  `goods_num` int(11) NULL DEFAULT NULL,
  `sku_price_id` int(11) NULL DEFAULT NULL COMMENT '规格',
  `createtime` int(11) NULL DEFAULT NULL,
  `updatetime` int(11) NULL DEFAULT NULL,
  `deletetime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_category
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_category`;
CREATE TABLE `fa_shopro_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '栏目类型',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh_id`(`weigh`, `id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商城分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_shopro_category
-- ----------------------------
INSERT INTO `fa_shopro_category` VALUES (1, '商品分类', '3', '', 0, 0, '', 'normal', 1622525266, 1622525709);
INSERT INTO `fa_shopro_category` VALUES (4, '服饰装包', '', '', 1, 0, '', 'normal', 1622525737, 1622526305);
INSERT INTO `fa_shopro_category` VALUES (5, '男士外套', '', '', 4, 0, '', 'normal', 1622525737, 1622526305);
INSERT INTO `fa_shopro_category` VALUES (6, '女士裙装', '', '', 4, 0, '', 'normal', 1622525737, 1622526305);

-- ----------------------------
-- Table structure for fa_shopro_chat
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_chat`;
CREATE TABLE `fa_shopro_chat`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '绑定管理员',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客服昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客服头像',
  `max_num` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '接待上限',
  `lasttime` int(10) NOT NULL DEFAULT 0 COMMENT '上次服务时间',
  `status` enum('offline','online','busy') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'offline' COMMENT '状态:offline=离线,online=在线',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客服表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_chat_connection
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_chat_connection`;
CREATE TABLE `fa_shopro_chat_connection`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `session_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户标识',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `customer_service_id` int(10) NOT NULL DEFAULT 0 COMMENT '客服',
  `starttime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始时间',
  `endtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束时间',
  `status` enum('waiting','ing','end') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'waiting' COMMENT '状态:watting=等待中,ing=服务中,end=已结束',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `session_id`(`session_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `customer_service_id`(`customer_service_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '连接表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_chat_fast_reply
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_chat_fast_reply`;
CREATE TABLE `fa_shopro_chat_fast_reply`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'normal' COMMENT '状态:normal=启用,hidden=隐藏',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '快捷回复' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_shopro_chat_fast_reply
-- ----------------------------
INSERT INTO `fa_shopro_chat_fast_reply` VALUES (1, '退款退回问题', '亲，钱款都是按照原支付路径进行退回的，一般会在1~3三个工作日内完成退款，请注意查收', 'normal', 1, 1608629981, 1608629981);
INSERT INTO `fa_shopro_chat_fast_reply` VALUES (2, '红包退回问题', '亲，如果是双11的红包，因为只能当天使用，所以退款的时候，红包将不会退回', 'normal', 2, 1608630134, 1608630134);
INSERT INTO `fa_shopro_chat_fast_reply` VALUES (3, '发货问题', '<span style=\"white-space:normal;\">亲，一般会在下完单两天之内进行发货，如遇双十一等节日最晚会在一周内发货的，请耐心等待</span>', 'normal', 3, 1608630165, 1608630165);

-- ----------------------------
-- Table structure for fa_shopro_chat_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_chat_log`;
CREATE TABLE `fa_shopro_chat_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `session_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会话ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户',
  `sender_identify` enum('customer_service','user') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'user' COMMENT '发送人身份:customer_service=客服,user=用户',
  `sender_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发送人ID',
  `message_type` enum('text','image','file','system','goods','order') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'text' COMMENT '消息类型:text=文本,image=图片,file=文件,system=系统消息,goods=商品卡片,order=订单卡片',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '消息',
  `readtime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '读取时间',
  `createtime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `session_id`(`session_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '聊天记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_chat_question
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_chat_question`;
CREATE TABLE `fa_shopro_chat_question`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'normal' COMMENT '状态:normal=启用,hidden=隐藏',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '常见问题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_shopro_chat_question
-- ----------------------------
INSERT INTO `fa_shopro_chat_question` VALUES (1, '如何申请退款？', '亲，请在订单列表，选择要退款的订单，点击申请售后，选择售后类型，输入描述信息，我们看到会及时给您处理的', 'normal', 1, 1608629675, 1608629675);
INSERT INTO `fa_shopro_chat_question` VALUES (2, '什么时候发货？', '亲，一般会在下完单两天之内进行发货，如遇双十一等节日最晚会在一周内发货的，请耐心等待', 'normal', 2, 1608629736, 1608629736);
INSERT INTO `fa_shopro_chat_question` VALUES (3, '申请了退款，钱款退回到了那里？', '亲，后台同意退款之后，欠款会按照原支付路径退回到您的账户', 'normal', 3, 1608629815, 1608629901);

-- ----------------------------
-- Table structure for fa_shopro_chat_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_chat_user`;
CREATE TABLE `fa_shopro_chat_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `session_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标识',
  `user_id` int(10) NOT NULL DEFAULT 0 COMMENT '用户',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `customer_service_id` int(10) NOT NULL DEFAULT 0 COMMENT '最后接待客服',
  `lasttime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '上次上线时间',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `session_id`(`session_id`) USING BTREE COMMENT 'session 标识',
  INDEX `user_id`(`user_id`) USING BTREE COMMENT 'user_id'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客服用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_commission_agent
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_commission_agent`;
CREATE TABLE `fa_shopro_commission_agent`  (
  `user_id` int(11) NOT NULL COMMENT '用户',
  `level` int(11) NOT NULL COMMENT '分销商等级',
  `parent_agent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级分销商',
  `apply_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '申请信息',
  `total_income` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '总收益',
  `order_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '自购/直推分销订单金额',
  `child_order_money_1` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '一级分销订单总金额',
  `child_order_money_2` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '二级分销订单总金额',
  `child_order_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '团队分销订单总金额',
  `order_count` int(10) NOT NULL DEFAULT 0 COMMENT '自购/直推分销订单数量',
  `child_order_count_1` int(10) NOT NULL DEFAULT 0 COMMENT '一级分销订单数量',
  `child_order_count_2` int(10) NOT NULL DEFAULT 0 COMMENT '二级分销订单数量',
  `child_order_count` int(10) NOT NULL DEFAULT 0 COMMENT '团队分销订单数量',
  `child_agent_count_1` int(11) NOT NULL DEFAULT 0 COMMENT '直推分销商人数',
  `child_agent_count_2` int(10) NOT NULL DEFAULT 0 COMMENT '二级分销商人数',
  `child_agent_count` int(11) NOT NULL DEFAULT 0 COMMENT '团队分销商人数',
  `child_agent_level_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '一级分销商等级统计',
  `child_agent_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '团队分销商等级统计',
  `upgrade_lock` tinyint(1) NOT NULL DEFAULT 0 COMMENT '升级锁定:0=不锁定,1=锁定',
  `apply_num` int(11) NOT NULL DEFAULT 0 COMMENT '提交申请次数',
  `info_status` tinyint(1) NULL DEFAULT NULL COMMENT '完善资料状态:-1=驳回,0=未完善,1=已完善,null=无需资料',
  `level_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '升级状态:0=不升级,1=待升级',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'normal' COMMENT '分销商状态:forbidden=禁用,pending=审核中,normal=正常',
  `becometime` int(10) NULL DEFAULT NULL COMMENT '成为分销商时间',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  `updatetime` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `parent_agent_id`(`parent_agent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分销商' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_commission_agent_level
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_commission_agent_level`;
CREATE TABLE `fa_shopro_commission_agent_level`  (
  `level` int(10) NOT NULL COMMENT '权重等级',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '等级名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '等级徽章',
  `commission_rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '佣金比例设置',
  `upgrade_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '升级方式',
  `upgrade_rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '升级规则',
  PRIMARY KEY (`level`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分销商等级' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_commission_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_commission_config`;
CREATE TABLE `fa_shopro_commission_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `value` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  `group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分销设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_shopro_commission_config
-- ----------------------------
INSERT INTO `fa_shopro_commission_config` VALUES (1, 'commission_level', '0', 'basic', '分销层级');
INSERT INTO `fa_shopro_commission_config` VALUES (2, 'self_buy', '0', 'basic', '分销内购');
INSERT INTO `fa_shopro_commission_config` VALUES (3, 'invite_lock', 'share', 'basic', '邀请锁定条件');
INSERT INTO `fa_shopro_commission_config` VALUES (4, 'agent_check', '0', 'basic', '分销商审核');
INSERT INTO `fa_shopro_commission_config` VALUES (5, 'upgrade_check', '0', 'basic', '升级审核');
INSERT INTO `fa_shopro_commission_config` VALUES (6, 'upgrade_jump', '0', 'basic', '允许跃级升级:0=否,1=是');
INSERT INTO `fa_shopro_commission_config` VALUES (7, 'become_agent', '{\"type\":\"apply\",\"value\":\"\"}', 'agent', '成为分销商条件');
INSERT INTO `fa_shopro_commission_config` VALUES (8, 'agent_form', '{\"background_image\":\"http:\\/\\/api.7wpp.com\\/uploads\\/20201223\\/c1516571770ee0d100a569fbd851b41d.png\",\"content\":[{\"name\":\"真实姓名\",\"type\":\"input\"},{\"name\":\"手机号\",\"type\":\"input\"},{\"name\":\"身份证号\",\"type\":\"input\"}]}', 'agent', '完善资料');
INSERT INTO `fa_shopro_commission_config` VALUES (9, 'apply_protocol', '0', 'agent', '申请协议');
INSERT INTO `fa_shopro_commission_config` VALUES (10, 'commission_price_type', 'goods_price', 'amount', '佣金基础金额');
INSERT INTO `fa_shopro_commission_config` VALUES (11, 'commission_event', 'payed', 'amount', '佣金结算事件');
INSERT INTO `fa_shopro_commission_config` VALUES (12, 'upgrade_display', '0', 'basic', '升级进度显示');
INSERT INTO `fa_shopro_commission_config` VALUES (13, 'refund_commission_reward', '0', 'amount', '退款扣除佣金');
INSERT INTO `fa_shopro_commission_config` VALUES (14, 'refund_commission_order', '0', 'amount', '退款扣除分销业绩');

-- ----------------------------
-- Table structure for fa_shopro_commission_goods
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_commission_goods`;
CREATE TABLE `fa_shopro_commission_goods`  (
  `goods_id` int(11) NOT NULL COMMENT '分享商品',
  `self_rules` tinyint(1) NULL DEFAULT 0 COMMENT '独立设置佣金:0=否,1=是',
  `commission_rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '佣金设置',
  `status` tinyint(1) NOT NULL COMMENT '状态:0=不参与分销,1=参与分销',
  `commission_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '独立佣金规则',
  `commission_order_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否计入业绩:0=否,1=是',
  PRIMARY KEY (`goods_id`) USING BTREE,
  UNIQUE INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分销商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_commission_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_commission_log`;
CREATE TABLE `fa_shopro_commission_log`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) NOT NULL COMMENT '分销商',
  `event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件标识:agent=分销商,level=等级变动,order=分销业绩,team=团队,reward=佣金,share=绑定关系',
  `event_id` int(11) NULL DEFAULT 0 COMMENT '事件ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `oper_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作人:admin=管理员,system=系统,user=用户',
  `oper_id` int(10) NOT NULL DEFAULT 0 COMMENT '操作人ID',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `agent_id`(`agent_id`) USING BTREE COMMENT '分销商'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分销动态日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_commission_order
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_commission_order`;
CREATE TABLE `fa_shopro_commission_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单号',
  `self_buy` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否分销内购:0=分销订单,1=内购订单',
  `order_item_id` int(11) NOT NULL COMMENT '订单',
  `buyer_id` int(11) NOT NULL COMMENT '买家',
  `goods_id` int(11) NOT NULL COMMENT '商品',
  `agent_id` int(11) NOT NULL COMMENT '分销商',
  `amount` decimal(10, 2) NOT NULL COMMENT '商品结算金额',
  `commission_price_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品结算方式',
  `commission_order_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分销商业绩:-1=已扣除,0=不计入,1=已计入',
  `commission_reward_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '佣金处理状态:-1=已退回,0=未结算,1=已结算',
  `commission_rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行佣金结算规则',
  `commission_event` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '佣金结算事件',
  `commission_time` int(10) NULL DEFAULT NULL COMMENT '结算时间',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  `updatetime` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分销订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_commission_reward
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_commission_reward`;
CREATE TABLE `fa_shopro_commission_reward`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NULL DEFAULT NULL COMMENT '订单',
  `order_item_id` int(10) NULL DEFAULT NULL COMMENT '订单商品',
  `buyer_id` int(10) NULL DEFAULT NULL COMMENT '购买人',
  `commission_order_id` int(11) NOT NULL COMMENT '分销订单',
  `agent_id` int(10) NOT NULL COMMENT '分销商',
  `type` enum('money','score','cash','change','bank') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'money' COMMENT '打款方式:money=余额,score=积分,cash=现金(手动打款),change=企业付款到零钱,bank=企业付款到银行卡',
  `commission` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金',
  `original_commission` decimal(10, 2) NOT NULL COMMENT '原始佣金',
  `commission_level` tinyint(2) NOT NULL DEFAULT 0 COMMENT '执行层级',
  `agent_level` int(10) NOT NULL DEFAULT 0 COMMENT '执行等级',
  `commission_rules` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行规则',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态:-1=已退回,0=待入账,1=已入账',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  `updatetime` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分销佣金' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_config`;
CREATE TABLE `fa_shopro_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变量值',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '变量字典数据',
  `rule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商城配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_shopro_config
-- ----------------------------
INSERT INTO `fa_shopro_config` VALUES (1, 'shopro', 'basic', '商城信息', '', 'array', '{\"name\":\"Shopro\",\"domain\":\"http:\\/\\/shopro.7wpp.com\",\"version\":\"1.2.0\",\"logo\":\"http:\\/\\/api.7wpp.com\\/uploads\\/20200410\\/d5b2c163e9a23d78c7205d9ab5d7e47c.png\",\"copyright\":[\"\\u661f\\u54c1\\u79d1\\u6280Shopro\\u7248\\u6743\\u6240\\u6709\",\"Copyright 2018-2020\"]}', '', '', '');
INSERT INTO `fa_shopro_config` VALUES (2, 'share', 'basic', '分享设置', '', 'array', '{\"title\":\"\\u9080\\u8bf7\\u6709\\u597d\\u793c\",\"image\":\"http:\\/\\/api.7wpp.com\\/uploads\\/20200414\\/4be7c944935a0fd6fc890f0214e6c3e0.jpg\",\"goods_poster_bg\":\"http:\\/\\/api.7wpp.com\\/uploads\\/20200414\\/ab863760d809b0d0bfdf5eed24fecb61.png\",\"user_poster_bg\":\"http:\\/\\/api.7wpp.com\\/uploads\\/20200414\\/000fada6ece566b12ccfc348861fedf6.png\",\"groupon_poster_bg\":\"http:\\/\\/api.7wpp.com\\/uploads\\/20200912\\/c65b86f0ffb7f334fe7ca7528d2bb44a.png\"}', '', '', '');
INSERT INTO `fa_shopro_config` VALUES (3, 'score', 'score', '积分规则', '', 'array', '{\"everyday\":\"12\",\"inc_value\":\"3\",\"until_day\":\"7\"}', '', '', '');
INSERT INTO `fa_shopro_config` VALUES (4, 'withdraw', 'withdraw', '提现配置', '', 'array', '{\"service_fee\":\"0.10\",\"min\":\"10\",\"max\":\"100\"}', '', '', '');
INSERT INTO `fa_shopro_config` VALUES (5, 'wxOfficialAccount', 'platform', '微信公众号', '', 'array', '{\"name\":\"shopro\",\"wx_type\":\"4\",\"avatar\":\"\",\"url\":\"\",\"status\":\"0\",\"qrcode\":\"\",\"app_id\":\"wx3893992****0d244\",\"secret\":\"3c97004d85999f09a21****615692483\",\"token\":\"shopro\",\"aes_key\":\"\",\"auto_login\":\"0\"}', '', '', '');
INSERT INTO `fa_shopro_config` VALUES (6, 'wxMiniProgram', 'platform', '微信小程序', '', 'array', '{\"name\":\"\\u5c0f\\u65b0\",\"avatar\":\"\",\"qrcode\":\"\",\"app_id\":\"wx39cd079****67dd0\",\"secret\":\"e6e298ef743b85272****9aaa714960b\",\"auto_login\":\"1\"}', '', '', '');
INSERT INTO `fa_shopro_config` VALUES (7, 'H5', 'platform', 'H5', '', 'array', '{\"app_id\":\"wx38939920a****244\",\"secret\":\"3c97004d85999f09a2177d****69****\"}', '', '', '');
INSERT INTO `fa_shopro_config` VALUES (8, 'App', 'platform', 'App', '', 'array', '{\"app_id\":\"wx522bf4cc9a13****\",\"secret\":\"fa44dc893ab55338f46d65f900b1****\"}', '', '', '');
INSERT INTO `fa_shopro_config` VALUES (9, 'wechat', 'payment', '微信支付', '', 'array', '{\"platform\":[\"wxOfficialAccount\",\"wxMiniProgram\",\"H5\",\"App\"],\"mch_id\":\"148106****\",\"key\":\"bd1c671d1c3d5e461f545774****7d37\",\"cert_client\":\"\",\"cert_key\":\"\"}', '', '', '');
INSERT INTO `fa_shopro_config` VALUES (10, 'alipay', 'payment', '支付宝支付', '', 'array', '{\"platform\":[\"wxOfficialAccount\",\"wxMiniProgram\",\"H5\",\"App\"],\"app_id\":\"20210011****6742\",\"ali_public_key\":\"\",\"app_cert_public_key\":\"\",\"alipay_root_cert\":\"\",\"private_key\":\"\"}', '', '', '');
INSERT INTO `fa_shopro_config` VALUES (11, 'wallet', 'payment', '钱包支付', '', 'array', '{\"platform\":[\"wxOfficialAccount\",\"wxMiniProgram\",\"H5\",\"App\"]}', '', '', '');
INSERT INTO `fa_shopro_config` VALUES (12, 'iospay', 'payment', 'ApplePay', '', 'array', '{\"platform\":[]}', '', '', '');
INSERT INTO `fa_shopro_config` VALUES (13, 'order', 'basic', '订单配置', '', 'array', '{\"order_auto_close\":\"15\",\"order_auto_confirm\":\"10\",\"order_auto_comment\":\"7\"}', '', '', '');
INSERT INTO `fa_shopro_config` VALUES (14, 'user', 'basic', '用户配置', '', 'array', '{\"nickname\":\"Shopro-\",\"avatar\":\"http:\\/\\/api.7wpp.com\\/assets\\/addons\\/shopro\\/img\\/default-avatar.png\",\"group_id\":\"1\",\"money\":\"0\",\"score\":\"0\"}', '', '', '');
INSERT INTO `fa_shopro_config` VALUES (15, 'services', 'basic', '服务配置', '', 'array', '{\"express\": {\"ebusiness_id\":\"1655***\",\"appkey\":\"af70d016-5003-****-****-3eda4ae78fb2\",\"jd_code\":\"001K1***50\",\"type\":\"free\"},\"amap\":{\"appkey\":\"654b72d9fd8a1*********6156be7f\"}}', '', '', '');

-- ----------------------------
-- Table structure for fa_shopro_coupons
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_coupons`;
CREATE TABLE `fa_shopro_coupons`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` enum('cash','discount') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'cash' COMMENT '类型:cash=代金券,discount=折扣券',
  `goods_ids` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '适用商品',
  `amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '券面额',
  `enough` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '消费门槛',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存',
  `limit` int(11) NOT NULL DEFAULT 1 COMMENT '每人限制',
  `gettime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领取周期',
  `usetime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效期',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  `usetimestart` int(11) NULL DEFAULT NULL,
  `usetimeend` int(11) NULL DEFAULT NULL,
  `gettimestart` int(11) NULL DEFAULT NULL,
  `gettimeend` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠券' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_decorate
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_decorate`;
CREATE TABLE `fa_shopro_decorate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `type` enum('shop','custom','preview') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'shop' COMMENT '页面分类:shop=商城,custom=自定义,preview=临时预览',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'normal' COMMENT '状态',
  `platform` set('H5','wxOfficialAccount','wxMiniProgram','App','preview') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '适用平台:H5=H5,wxOfficialAccount=微信公众号网页,wxMiniProgram=微信小程序,App=App,preview=预览',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '店铺装修' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_decorate_content
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_decorate_content`;
CREATE TABLE `fa_shopro_decorate_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `category` enum('home','user','tabbar','popup','custom','float-button') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '页面类型:home=首页,user=个人中心,tabbar=底部导航,popup=弹出提醒,float-button=悬浮按钮,custom=自定义',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '规则',
  `decorate_id` int(11) NULL DEFAULT NULL COMMENT '归属模板ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '模板内容' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_dispatch`;
CREATE TABLE `fa_shopro_dispatch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` enum('express','selfetch','store','autosend') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发货方式:express=物流快递,selfetch=用户自提,store=商户配送,autosend=自动发货',
  `type_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包含模板',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发货设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_shopro_dispatch
-- ----------------------------
INSERT INTO `fa_shopro_dispatch` VALUES (1, '全国', 'express', '1', 1622526507, 1622526507, NULL);

-- ----------------------------
-- Table structure for fa_shopro_dispatch_autosend
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_dispatch_autosend`;
CREATE TABLE `fa_shopro_dispatch_autosend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('card','text','params') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自动发货类型:card=卡密,text=固定内容,params=自定义内容',
  `content` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发货内容',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '自动发货' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_dispatch_express
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_dispatch_express`;
CREATE TABLE `fa_shopro_dispatch_express`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('number','weight') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计费方式:number=件数,weight=重量',
  `weigh` int(11) NULL DEFAULT NULL COMMENT '权重',
  `first_num` int(11) NOT NULL DEFAULT 1 COMMENT '首(重/件)数',
  `first_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '首(重/件)',
  `additional_num` int(11) NOT NULL DEFAULT 0 COMMENT '续(重/件)数',
  `additional_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '续(重/件)',
  `province_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city_ids` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市级',
  `area_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '区域',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '运费模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_shopro_dispatch_express
-- ----------------------------
INSERT INTO `fa_shopro_dispatch_express` VALUES (1, 'number', 1, 0, 0.00, 0, 0.00, '110000,120000,130000,140000,150000,210000,220000,230000,310000,320000,330000,340000,350000,360000,370000,410000,420000,430000,440000,450000,460000,500000,510000,520000,530000,540000,610000,620000,630000,640000,650000,710000,810000,820000', '', '', 1622526507, 1622526507, NULL);

-- ----------------------------
-- Table structure for fa_shopro_dispatch_selfetch
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_dispatch_selfetch`;
CREATE TABLE `fa_shopro_dispatch_selfetch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '包含门店',
  `expire_type` enum('day','time') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'day' COMMENT '过期类型:day=天数,time=截至日期',
  `expire_day` int(11) NOT NULL DEFAULT 0 COMMENT 'X天过期',
  `expire_time` int(11) NOT NULL DEFAULT 0 COMMENT '截至日期',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '自提点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_dispatch_store
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_dispatch_store`;
CREATE TABLE `fa_shopro_dispatch_store`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '包含门店',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商家配送' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_express
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_express`;
CREATE TABLE `fa_shopro_express`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `weigh` int(11) NOT NULL DEFAULT 0 COMMENT '权重',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 308 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '快递公司' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_shopro_express
-- ----------------------------
INSERT INTO `fa_shopro_express` VALUES (1, '顺丰速运', 'SF', 0);
INSERT INTO `fa_shopro_express` VALUES (2, '百世快递', 'HTKY', 0);
INSERT INTO `fa_shopro_express` VALUES (3, '中通快递', 'ZTO', 0);
INSERT INTO `fa_shopro_express` VALUES (4, '申通快递', 'STO', 0);
INSERT INTO `fa_shopro_express` VALUES (5, '圆通速递', 'YTO', 0);
INSERT INTO `fa_shopro_express` VALUES (6, '韵达速递', 'YD', 0);
INSERT INTO `fa_shopro_express` VALUES (7, '邮政快递包裹', 'YZPY', 0);
INSERT INTO `fa_shopro_express` VALUES (8, 'EMS', 'EMS', 0);
INSERT INTO `fa_shopro_express` VALUES (9, '天天快递', 'HHTT', 0);
INSERT INTO `fa_shopro_express` VALUES (10, '京东快递', 'JD', 0);
INSERT INTO `fa_shopro_express` VALUES (11, '优速快递', 'UC', 0);
INSERT INTO `fa_shopro_express` VALUES (12, '德邦快递', 'DBL', 0);
INSERT INTO `fa_shopro_express` VALUES (13, '宅急送', 'ZJS', 0);
INSERT INTO `fa_shopro_express` VALUES (14, '安捷快递', 'AJ', 0);
INSERT INTO `fa_shopro_express` VALUES (15, '阿里跨境电商物流', 'ALKJWL', 0);
INSERT INTO `fa_shopro_express` VALUES (16, '安迅物流', 'AX', 0);
INSERT INTO `fa_shopro_express` VALUES (17, '安邮美国', 'AYUS', 0);
INSERT INTO `fa_shopro_express` VALUES (18, '亚马逊物流', 'AMAZON', 0);
INSERT INTO `fa_shopro_express` VALUES (19, '澳门邮政', 'AOMENYZ', 0);
INSERT INTO `fa_shopro_express` VALUES (20, '安能物流', 'ANE', 0);
INSERT INTO `fa_shopro_express` VALUES (21, '澳多多', 'ADD', 0);
INSERT INTO `fa_shopro_express` VALUES (22, '澳邮专线', 'AYCA', 0);
INSERT INTO `fa_shopro_express` VALUES (23, '安鲜达', 'AXD', 0);
INSERT INTO `fa_shopro_express` VALUES (24, '安能快运', 'ANEKY', 0);
INSERT INTO `fa_shopro_express` VALUES (25, '澳邦国际', 'ABGJ', 0);
INSERT INTO `fa_shopro_express` VALUES (26, '安得物流', 'ANNTO', 0);
INSERT INTO `fa_shopro_express` VALUES (27, '八达通  ', 'BDT', 0);
INSERT INTO `fa_shopro_express` VALUES (28, '百腾物流', 'BETWL', 0);
INSERT INTO `fa_shopro_express` VALUES (29, '北极星快运', 'BJXKY', 0);
INSERT INTO `fa_shopro_express` VALUES (30, '奔腾物流', 'BNTWL', 0);
INSERT INTO `fa_shopro_express` VALUES (31, '百福东方', 'BFDF', 0);
INSERT INTO `fa_shopro_express` VALUES (32, '贝海国际 ', 'BHGJ', 0);
INSERT INTO `fa_shopro_express` VALUES (33, '八方安运', 'BFAY', 0);
INSERT INTO `fa_shopro_express` VALUES (34, '百世快运', 'BTWL', 0);
INSERT INTO `fa_shopro_express` VALUES (35, '帮帮发转运', 'BBFZY', 0);
INSERT INTO `fa_shopro_express` VALUES (36, '百城通物流', 'BCTWL', 0);
INSERT INTO `fa_shopro_express` VALUES (37, '春风物流', 'CFWL', 0);
INSERT INTO `fa_shopro_express` VALUES (38, '诚通物流', 'CHTWL', 0);
INSERT INTO `fa_shopro_express` VALUES (39, '传喜物流', 'CXHY', 0);
INSERT INTO `fa_shopro_express` VALUES (40, '城市100', 'CITY100', 0);
INSERT INTO `fa_shopro_express` VALUES (41, '城际快递', 'CJKD', 0);
INSERT INTO `fa_shopro_express` VALUES (42, 'CNPEX中邮快递', 'CNPEX', 0);
INSERT INTO `fa_shopro_express` VALUES (43, 'COE东方快递', 'COE', 0);
INSERT INTO `fa_shopro_express` VALUES (44, '长沙创一', 'CSCY', 0);
INSERT INTO `fa_shopro_express` VALUES (45, '成都善途速运', 'CDSTKY', 0);
INSERT INTO `fa_shopro_express` VALUES (46, '联合运通', 'CTG', 0);
INSERT INTO `fa_shopro_express` VALUES (47, '疯狂快递', 'CRAZY', 0);
INSERT INTO `fa_shopro_express` VALUES (48, 'CBO钏博物流', 'CBO', 0);
INSERT INTO `fa_shopro_express` VALUES (49, '佳吉快运', 'CNEX', 0);
INSERT INTO `fa_shopro_express` VALUES (50, '承诺达', 'CND', 0);
INSERT INTO `fa_shopro_express` VALUES (51, '畅顺通达', 'CSTD', 0);
INSERT INTO `fa_shopro_express` VALUES (52, 'D速物流', 'DSWL', 0);
INSERT INTO `fa_shopro_express` VALUES (53, '到了港', 'DLG ', 0);
INSERT INTO `fa_shopro_express` VALUES (54, '大田物流', 'DTWL', 0);
INSERT INTO `fa_shopro_express` VALUES (55, '东骏快捷物流', 'DJKJWL', 0);
INSERT INTO `fa_shopro_express` VALUES (56, '德坤', 'DEKUN', 0);
INSERT INTO `fa_shopro_express` VALUES (57, '德邦快运', 'DBLKY', 0);
INSERT INTO `fa_shopro_express` VALUES (58, '大马鹿', 'DML', 0);
INSERT INTO `fa_shopro_express` VALUES (59, '丹鸟物流', 'DNWL', 0);
INSERT INTO `fa_shopro_express` VALUES (60, '东方汇', 'EST365', 0);
INSERT INTO `fa_shopro_express` VALUES (61, 'E特快', 'ETK', 0);
INSERT INTO `fa_shopro_express` VALUES (62, 'EMS国内', 'EMS2', 0);
INSERT INTO `fa_shopro_express` VALUES (63, 'EWE', 'EWE', 0);
INSERT INTO `fa_shopro_express` VALUES (64, '飞康达', 'FKD', 0);
INSERT INTO `fa_shopro_express` VALUES (65, '富腾达  ', 'FTD', 0);
INSERT INTO `fa_shopro_express` VALUES (66, '凡宇货的', 'FYKD', 0);
INSERT INTO `fa_shopro_express` VALUES (67, '速派快递', 'FASTGO', 0);
INSERT INTO `fa_shopro_express` VALUES (68, '飞豹快递', 'FBKD', 0);
INSERT INTO `fa_shopro_express` VALUES (69, '丰巢', 'FBOX', 0);
INSERT INTO `fa_shopro_express` VALUES (70, '飞狐快递', 'FHKD', 0);
INSERT INTO `fa_shopro_express` VALUES (71, '复融供应链', 'FRGYL', 0);
INSERT INTO `fa_shopro_express` VALUES (72, '飞远配送', 'FYPS', 0);
INSERT INTO `fa_shopro_express` VALUES (73, '凡宇速递', 'FYSD', 0);
INSERT INTO `fa_shopro_express` VALUES (74, '丰通快运', 'FT', 0);
INSERT INTO `fa_shopro_express` VALUES (75, '冠达   ', 'GD', 0);
INSERT INTO `fa_shopro_express` VALUES (76, '广东邮政', 'GDEMS', 0);
INSERT INTO `fa_shopro_express` VALUES (77, '共速达', 'GSD', 0);
INSERT INTO `fa_shopro_express` VALUES (78, '广通       ', 'GTONG', 0);
INSERT INTO `fa_shopro_express` VALUES (79, '冠达快递', 'GDKD', 0);
INSERT INTO `fa_shopro_express` VALUES (80, '挂号信', 'GHX', 0);
INSERT INTO `fa_shopro_express` VALUES (81, '广通速递', 'GTKD', 0);
INSERT INTO `fa_shopro_express` VALUES (82, '高铁快运', 'GTKY', 0);
INSERT INTO `fa_shopro_express` VALUES (83, '迦递快递', 'GAI', 0);
INSERT INTO `fa_shopro_express` VALUES (84, '港快速递', 'GKSD', 0);
INSERT INTO `fa_shopro_express` VALUES (85, '高铁速递', 'GTSD', 0);
INSERT INTO `fa_shopro_express` VALUES (86, '黑狗冷链', 'HGLL', 0);
INSERT INTO `fa_shopro_express` VALUES (87, '恒路物流', 'HLWL', 0);
INSERT INTO `fa_shopro_express` VALUES (88, '天地华宇', 'HOAU', 0);
INSERT INTO `fa_shopro_express` VALUES (89, '鸿桥供应链', 'HOTSCM', 0);
INSERT INTO `fa_shopro_express` VALUES (90, '海派通物流公司', 'HPTEX', 0);
INSERT INTO `fa_shopro_express` VALUES (91, '华强物流', 'hq568', 0);
INSERT INTO `fa_shopro_express` VALUES (92, '环球速运  ', 'HQSY', 0);
INSERT INTO `fa_shopro_express` VALUES (93, '华夏龙物流', 'HXLWL', 0);
INSERT INTO `fa_shopro_express` VALUES (94, '河北建华', 'HBJH', 0);
INSERT INTO `fa_shopro_express` VALUES (95, '汇丰物流', 'HF', 0);
INSERT INTO `fa_shopro_express` VALUES (96, '华航快递', 'HHKD', 0);
INSERT INTO `fa_shopro_express` VALUES (97, '华翰物流', 'HHWL', 0);
INSERT INTO `fa_shopro_express` VALUES (98, '黄马甲快递', 'HMJKD', 0);
INSERT INTO `fa_shopro_express` VALUES (99, '海盟速递', 'HMSD', 0);
INSERT INTO `fa_shopro_express` VALUES (100, '华企快运', 'HQKY', 0);
INSERT INTO `fa_shopro_express` VALUES (101, '昊盛物流', 'HSWL', 0);
INSERT INTO `fa_shopro_express` VALUES (102, '鸿泰物流', 'HTWL', 0);
INSERT INTO `fa_shopro_express` VALUES (103, '豪翔物流 ', 'HXWL', 0);
INSERT INTO `fa_shopro_express` VALUES (104, '合肥汇文', 'HFHW', 0);
INSERT INTO `fa_shopro_express` VALUES (105, '辉隆物流', 'HLONGWL', 0);
INSERT INTO `fa_shopro_express` VALUES (106, '华企快递', 'HQKD', 0);
INSERT INTO `fa_shopro_express` VALUES (107, '韩润物流', 'HRWL', 0);
INSERT INTO `fa_shopro_express` VALUES (108, '青岛恒通快递', 'HTKD', 0);
INSERT INTO `fa_shopro_express` VALUES (109, '货运皇物流', 'HYH', 0);
INSERT INTO `fa_shopro_express` VALUES (110, '好来运快递', 'HLYSD', 0);
INSERT INTO `fa_shopro_express` VALUES (111, '皇家物流', 'HJWL', 0);
INSERT INTO `fa_shopro_express` VALUES (112, '海信物流', 'HISENSE', 0);
INSERT INTO `fa_shopro_express` VALUES (113, '捷安达  ', 'JAD', 0);
INSERT INTO `fa_shopro_express` VALUES (114, '京广速递', 'JGSD', 0);
INSERT INTO `fa_shopro_express` VALUES (115, '九曳供应链', 'JIUYE', 0);
INSERT INTO `fa_shopro_express` VALUES (116, '急先达', 'JXD', 0);
INSERT INTO `fa_shopro_express` VALUES (117, '晋越快递', 'JYKD', 0);
INSERT INTO `fa_shopro_express` VALUES (118, '佳成国际', 'JCEX', 0);
INSERT INTO `fa_shopro_express` VALUES (119, '捷特快递', 'JTKD', 0);
INSERT INTO `fa_shopro_express` VALUES (120, '精英速运', 'JYSY', 0);
INSERT INTO `fa_shopro_express` VALUES (121, '加运美', 'JYM', 0);
INSERT INTO `fa_shopro_express` VALUES (122, '景光物流', 'JGWL', 0);
INSERT INTO `fa_shopro_express` VALUES (123, '佳怡物流', 'JYWL', 0);
INSERT INTO `fa_shopro_express` VALUES (124, '京东快运', 'JDKY', 0);
INSERT INTO `fa_shopro_express` VALUES (125, '金大物流', 'JDWL', 0);
INSERT INTO `fa_shopro_express` VALUES (126, '极兔速递', 'JTSD', 0);
INSERT INTO `fa_shopro_express` VALUES (127, '跨越速运', 'KYSY', 0);
INSERT INTO `fa_shopro_express` VALUES (128, '快服务', 'KFW', 0);
INSERT INTO `fa_shopro_express` VALUES (129, '快速递物流', 'KSDWL', 0);
INSERT INTO `fa_shopro_express` VALUES (130, '康力物流', 'KLWL', 0);
INSERT INTO `fa_shopro_express` VALUES (131, '快淘快递', 'KTKD', 0);
INSERT INTO `fa_shopro_express` VALUES (132, '快优达速递', 'KYDSD', 0);
INSERT INTO `fa_shopro_express` VALUES (133, '跨越物流', 'KYWL', 0);
INSERT INTO `fa_shopro_express` VALUES (134, '快8速运', 'KBSY', 0);
INSERT INTO `fa_shopro_express` VALUES (135, '龙邦快递', 'LB', 0);
INSERT INTO `fa_shopro_express` VALUES (136, '蓝弧快递', 'LHKD', 0);
INSERT INTO `fa_shopro_express` VALUES (137, '乐捷递', 'LJD', 0);
INSERT INTO `fa_shopro_express` VALUES (138, '立即送', 'LJS', 0);
INSERT INTO `fa_shopro_express` VALUES (139, '联昊通速递', 'LHT', 0);
INSERT INTO `fa_shopro_express` VALUES (140, '民邦快递', 'MB', 0);
INSERT INTO `fa_shopro_express` VALUES (141, '民航快递', 'MHKD', 0);
INSERT INTO `fa_shopro_express` VALUES (142, '美快    ', 'MK', 0);
INSERT INTO `fa_shopro_express` VALUES (143, '门对门快递', 'MDM', 0);
INSERT INTO `fa_shopro_express` VALUES (144, '迈达', 'MD', 0);
INSERT INTO `fa_shopro_express` VALUES (145, '闽盛快递', 'MSKD', 0);
INSERT INTO `fa_shopro_express` VALUES (146, '迈隆递运', 'MRDY', 0);
INSERT INTO `fa_shopro_express` VALUES (147, '明亮物流', 'MLWL', 0);
INSERT INTO `fa_shopro_express` VALUES (148, '南方传媒物流', 'NFCM', 0);
INSERT INTO `fa_shopro_express` VALUES (149, '南京晟邦物流', 'NJSBWL', 0);
INSERT INTO `fa_shopro_express` VALUES (150, '能达速递', 'NEDA', 0);
INSERT INTO `fa_shopro_express` VALUES (151, '平安达腾飞快递', 'PADTF', 0);
INSERT INTO `fa_shopro_express` VALUES (152, '泛捷快递', 'PANEX', 0);
INSERT INTO `fa_shopro_express` VALUES (153, '品骏快递', 'PJ', 0);
INSERT INTO `fa_shopro_express` VALUES (154, '陪行物流', 'PXWL', 0);
INSERT INTO `fa_shopro_express` VALUES (155, 'PCA Express', 'PCA', 0);
INSERT INTO `fa_shopro_express` VALUES (156, '全晨快递', 'QCKD', 0);
INSERT INTO `fa_shopro_express` VALUES (157, '全日通快递', 'QRT', 0);
INSERT INTO `fa_shopro_express` VALUES (158, '快客快递', 'QUICK', 0);
INSERT INTO `fa_shopro_express` VALUES (159, '全信通', 'QXT', 0);
INSERT INTO `fa_shopro_express` VALUES (160, '七曜中邮', 'QYZY', 0);
INSERT INTO `fa_shopro_express` VALUES (161, '如风达', 'RFD', 0);
INSERT INTO `fa_shopro_express` VALUES (162, '荣庆物流', 'RQ', 0);
INSERT INTO `fa_shopro_express` VALUES (163, '日日顺物流', 'RRS', 0);
INSERT INTO `fa_shopro_express` VALUES (164, '日昱物流', 'RLWL', 0);
INSERT INTO `fa_shopro_express` VALUES (165, '瑞丰速递', 'RFEX', 0);
INSERT INTO `fa_shopro_express` VALUES (166, '赛澳递', 'SAD', 0);
INSERT INTO `fa_shopro_express` VALUES (167, '苏宁物流', 'SNWL', 0);
INSERT INTO `fa_shopro_express` VALUES (168, '圣安物流', 'SAWL', 0);
INSERT INTO `fa_shopro_express` VALUES (169, '晟邦物流', 'SBWL', 0);
INSERT INTO `fa_shopro_express` VALUES (170, '上大物流', 'SDWL', 0);
INSERT INTO `fa_shopro_express` VALUES (171, '盛丰物流', 'SFWL', 0);
INSERT INTO `fa_shopro_express` VALUES (172, '速通物流', 'ST', 0);
INSERT INTO `fa_shopro_express` VALUES (173, '速腾快递', 'STWL', 0);
INSERT INTO `fa_shopro_express` VALUES (174, '速必达物流', 'SUBIDA', 0);
INSERT INTO `fa_shopro_express` VALUES (175, '速递e站', 'SDEZ', 0);
INSERT INTO `fa_shopro_express` VALUES (176, '速呈宅配', 'SCZPDS', 0);
INSERT INTO `fa_shopro_express` VALUES (177, '速尔快递', 'SURE', 0);
INSERT INTO `fa_shopro_express` VALUES (178, '山东海红', 'SDHH', 0);
INSERT INTO `fa_shopro_express` VALUES (179, '顺丰国际', 'SFGJ', 0);
INSERT INTO `fa_shopro_express` VALUES (180, '盛辉物流', 'SHWL', 0);
INSERT INTO `fa_shopro_express` VALUES (181, '穗佳物流', 'SJWL', 0);
INSERT INTO `fa_shopro_express` VALUES (182, '三态速递', 'STSD', 0);
INSERT INTO `fa_shopro_express` VALUES (183, '山西红马甲', 'SXHMJ', 0);
INSERT INTO `fa_shopro_express` VALUES (184, '世运快递', 'SYKD', 0);
INSERT INTO `fa_shopro_express` VALUES (185, '闪送', 'SS', 0);
INSERT INTO `fa_shopro_express` VALUES (186, '盛通快递', 'STKD', 0);
INSERT INTO `fa_shopro_express` VALUES (187, '郑州速捷', 'SJ', 0);
INSERT INTO `fa_shopro_express` VALUES (188, '顺心捷达', 'SX', 0);
INSERT INTO `fa_shopro_express` VALUES (189, '商桥物流', 'SQWL', 0);
INSERT INTO `fa_shopro_express` VALUES (190, '佳旺达物流', 'SYJWDX', 0);
INSERT INTO `fa_shopro_express` VALUES (191, '台湾邮政', 'TAIWANYZ', 0);
INSERT INTO `fa_shopro_express` VALUES (192, '唐山申通', 'TSSTO', 0);
INSERT INTO `fa_shopro_express` VALUES (193, '特急送', 'TJS', 0);
INSERT INTO `fa_shopro_express` VALUES (194, '通用物流', 'TYWL', 0);
INSERT INTO `fa_shopro_express` VALUES (195, '华宇物流', 'TDHY', 0);
INSERT INTO `fa_shopro_express` VALUES (196, '通和天下', 'THTX', 0);
INSERT INTO `fa_shopro_express` VALUES (197, '腾林物流', 'TLWL', 0);
INSERT INTO `fa_shopro_express` VALUES (198, '全一快递', 'UAPEX', 0);
INSERT INTO `fa_shopro_express` VALUES (199, 'UBI', 'UBI', 0);
INSERT INTO `fa_shopro_express` VALUES (200, 'UEQ Express', 'UEQ', 0);
INSERT INTO `fa_shopro_express` VALUES (201, '万家康  ', 'WJK', 0);
INSERT INTO `fa_shopro_express` VALUES (202, '万家物流', 'WJWL', 0);
INSERT INTO `fa_shopro_express` VALUES (203, '武汉同舟行', 'WHTZX', 0);
INSERT INTO `fa_shopro_express` VALUES (204, '维普恩', 'WPE', 0);
INSERT INTO `fa_shopro_express` VALUES (205, '中粮我买网', 'WM', 0);
INSERT INTO `fa_shopro_express` VALUES (206, '万象物流', 'WXWL', 0);
INSERT INTO `fa_shopro_express` VALUES (207, '微特派', 'WTP', 0);
INSERT INTO `fa_shopro_express` VALUES (208, '温通物流', 'WTWL', 0);
INSERT INTO `fa_shopro_express` VALUES (209, '迅驰物流  ', 'XCWL', 0);
INSERT INTO `fa_shopro_express` VALUES (210, '信丰物流', 'XFEX', 0);
INSERT INTO `fa_shopro_express` VALUES (211, '希优特', 'XYT', 0);
INSERT INTO `fa_shopro_express` VALUES (212, '新邦物流', 'XBWL', 0);
INSERT INTO `fa_shopro_express` VALUES (213, '祥龙运通', 'XLYT', 0);
INSERT INTO `fa_shopro_express` VALUES (214, '新杰物流', 'XJ', 0);
INSERT INTO `fa_shopro_express` VALUES (215, '源安达快递', 'YADEX', 0);
INSERT INTO `fa_shopro_express` VALUES (216, '远成物流', 'YCWL', 0);
INSERT INTO `fa_shopro_express` VALUES (217, '远成快运', 'YCSY', 0);
INSERT INTO `fa_shopro_express` VALUES (218, '义达国际物流', 'YDH', 0);
INSERT INTO `fa_shopro_express` VALUES (219, '易达通  ', 'YDT', 0);
INSERT INTO `fa_shopro_express` VALUES (220, '原飞航物流', 'YFHEX', 0);
INSERT INTO `fa_shopro_express` VALUES (221, '亚风快递', 'YFSD', 0);
INSERT INTO `fa_shopro_express` VALUES (222, '运通快递', 'YTKD', 0);
INSERT INTO `fa_shopro_express` VALUES (223, '亿翔快递', 'YXKD', 0);
INSERT INTO `fa_shopro_express` VALUES (224, '运东西网', 'YUNDX', 0);
INSERT INTO `fa_shopro_express` VALUES (225, '壹米滴答', 'YMDD', 0);
INSERT INTO `fa_shopro_express` VALUES (226, '邮政国内标快', 'YZBK', 0);
INSERT INTO `fa_shopro_express` VALUES (227, '一站通速运', 'YZTSY', 0);
INSERT INTO `fa_shopro_express` VALUES (228, '驭丰速运', 'YFSUYUN', 0);
INSERT INTO `fa_shopro_express` VALUES (229, '余氏东风', 'YSDF', 0);
INSERT INTO `fa_shopro_express` VALUES (230, '耀飞快递', 'YF', 0);
INSERT INTO `fa_shopro_express` VALUES (231, '韵达快运', 'YDKY', 0);
INSERT INTO `fa_shopro_express` VALUES (232, '云路', 'YL', 0);
INSERT INTO `fa_shopro_express` VALUES (233, '邮必佳', 'YBJ', 0);
INSERT INTO `fa_shopro_express` VALUES (234, '越丰物流', 'YFEX', 0);
INSERT INTO `fa_shopro_express` VALUES (235, '银捷速递', 'YJSD', 0);
INSERT INTO `fa_shopro_express` VALUES (236, '优联吉运', 'YLJY', 0);
INSERT INTO `fa_shopro_express` VALUES (237, '亿领速运', 'YLSY', 0);
INSERT INTO `fa_shopro_express` VALUES (238, '英脉物流', 'YMWL', 0);
INSERT INTO `fa_shopro_express` VALUES (239, '亿顺航', 'YSH', 0);
INSERT INTO `fa_shopro_express` VALUES (240, '音素快运', 'YSKY', 0);
INSERT INTO `fa_shopro_express` VALUES (241, '易通达', 'YTD', 0);
INSERT INTO `fa_shopro_express` VALUES (242, '一统飞鸿', 'YTFH', 0);
INSERT INTO `fa_shopro_express` VALUES (243, '圆通国际', 'YTOGJ', 0);
INSERT INTO `fa_shopro_express` VALUES (244, '宇鑫物流', 'YXWL', 0);
INSERT INTO `fa_shopro_express` VALUES (245, '包裹/平邮/挂号信', 'YZGN', 0);
INSERT INTO `fa_shopro_express` VALUES (246, '一智通', 'YZT', 0);
INSERT INTO `fa_shopro_express` VALUES (247, '优拜物流', 'YBWL', 0);
INSERT INTO `fa_shopro_express` VALUES (248, '增益快递', 'ZENY', 0);
INSERT INTO `fa_shopro_express` VALUES (249, '中睿速递', 'ZRSD', 0);
INSERT INTO `fa_shopro_express` VALUES (250, '中铁快运', 'ZTKY', 0);
INSERT INTO `fa_shopro_express` VALUES (251, '中天万运', 'ZTWY', 0);
INSERT INTO `fa_shopro_express` VALUES (252, '中外运速递', 'ZWYSD', 0);
INSERT INTO `fa_shopro_express` VALUES (253, '澳转运', 'ZY_AZY', 0);
INSERT INTO `fa_shopro_express` VALUES (254, '八达网', 'ZY_BDA', 0);
INSERT INTO `fa_shopro_express` VALUES (255, '贝易购', 'ZY_BYECO', 0);
INSERT INTO `fa_shopro_express` VALUES (256, '赤兔马转运', 'ZY_CTM', 0);
INSERT INTO `fa_shopro_express` VALUES (257, 'CUL中美速递', 'ZY_CUL', 0);
INSERT INTO `fa_shopro_express` VALUES (258, 'ETD', 'ZY_ETD', 0);
INSERT INTO `fa_shopro_express` VALUES (259, '风驰快递', 'ZY_FCKD', 0);
INSERT INTO `fa_shopro_express` VALUES (260, '风雷速递', 'ZY_FLSD', 0);
INSERT INTO `fa_shopro_express` VALUES (261, '皓晨优递', 'ZY_HCYD', 0);
INSERT INTO `fa_shopro_express` VALUES (262, '海带宝', 'ZY_HDB', 0);
INSERT INTO `fa_shopro_express` VALUES (263, '汇丰美中速递', 'ZY_HFMZ', 0);
INSERT INTO `fa_shopro_express` VALUES (264, '豪杰速递', 'ZY_HJSD', 0);
INSERT INTO `fa_shopro_express` VALUES (265, '华美快递', 'ZY_HMKD', 0);
INSERT INTO `fa_shopro_express` VALUES (266, '360hitao转运', 'ZY_HTAO', 0);
INSERT INTO `fa_shopro_express` VALUES (267, '海淘村', 'ZY_HTCUN', 0);
INSERT INTO `fa_shopro_express` VALUES (268, '365海淘客', 'ZY_HTKE', 0);
INSERT INTO `fa_shopro_express` VALUES (269, '华通快运', 'ZY_HTONG', 0);
INSERT INTO `fa_shopro_express` VALUES (270, '海星桥快递', 'ZY_HXKD', 0);
INSERT INTO `fa_shopro_express` VALUES (271, '华兴速运', 'ZY_HXSY', 0);
INSERT INTO `fa_shopro_express` VALUES (272, 'LogisticsY', 'ZY_IHERB', 0);
INSERT INTO `fa_shopro_express` VALUES (273, '领跑者快递', 'ZY_LPZ', 0);
INSERT INTO `fa_shopro_express` VALUES (274, '量子物流', 'ZY_LZWL', 0);
INSERT INTO `fa_shopro_express` VALUES (275, '明邦转运', 'ZY_MBZY', 0);
INSERT INTO `fa_shopro_express` VALUES (276, '美嘉快递', 'ZY_MJ', 0);
INSERT INTO `fa_shopro_express` VALUES (277, '168 美中快递', 'ZY_MZ', 0);
INSERT INTO `fa_shopro_express` VALUES (278, '欧e捷', 'ZY_OEJ', 0);
INSERT INTO `fa_shopro_express` VALUES (279, '欧洲疯', 'ZY_OZF', 0);
INSERT INTO `fa_shopro_express` VALUES (280, '欧洲GO', 'ZY_OZGO', 0);
INSERT INTO `fa_shopro_express` VALUES (281, '全美通', 'ZY_QMT', 0);
INSERT INTO `fa_shopro_express` VALUES (282, 'SCS国际物流', 'ZY_SCS', 0);
INSERT INTO `fa_shopro_express` VALUES (283, 'SOHO苏豪国际', 'ZY_SOHO', 0);
INSERT INTO `fa_shopro_express` VALUES (284, 'Sonic-Ex速递', 'ZY_SONIC', 0);
INSERT INTO `fa_shopro_express` VALUES (285, '通诚美中快递', 'ZY_TCM', 0);
INSERT INTO `fa_shopro_express` VALUES (286, 'TrakPak', 'ZY_TPAK', 0);
INSERT INTO `fa_shopro_express` VALUES (287, '天天海淘', 'ZY_TTHT', 0);
INSERT INTO `fa_shopro_express` VALUES (288, '天泽快递', 'ZY_TZKD', 0);
INSERT INTO `fa_shopro_express` VALUES (289, '迅达快递', 'ZY_XDKD', 0);
INSERT INTO `fa_shopro_express` VALUES (290, '信达速运', 'ZY_XDSY', 0);
INSERT INTO `fa_shopro_express` VALUES (291, '新干线快递', 'ZY_XGX', 0);
INSERT INTO `fa_shopro_express` VALUES (292, '信捷转运', 'ZY_XJ', 0);
INSERT INTO `fa_shopro_express` VALUES (293, '优购快递', 'ZY_YGKD', 0);
INSERT INTO `fa_shopro_express` VALUES (294, '友家速递(UCS)', 'ZY_YJSD', 0);
INSERT INTO `fa_shopro_express` VALUES (295, '云畔网', 'ZY_YPW', 0);
INSERT INTO `fa_shopro_express` VALUES (296, '易送网', 'ZY_YSW', 0);
INSERT INTO `fa_shopro_express` VALUES (297, '中运全速', 'ZYQS', 0);
INSERT INTO `fa_shopro_express` VALUES (298, '中邮物流', 'ZYWL', 0);
INSERT INTO `fa_shopro_express` VALUES (299, '汇强快递', 'ZHQKD', 0);
INSERT INTO `fa_shopro_express` VALUES (300, '众通快递', 'ZTE', 0);
INSERT INTO `fa_shopro_express` VALUES (301, '中通快运', 'ZTOKY', 0);
INSERT INTO `fa_shopro_express` VALUES (302, '中邮快递', 'ZYKD', 0);
INSERT INTO `fa_shopro_express` VALUES (303, '芝麻开门', 'ZMKM', 0);
INSERT INTO `fa_shopro_express` VALUES (304, '中骅物流', 'ZHWL', 0);
INSERT INTO `fa_shopro_express` VALUES (305, '中铁物流', 'ZTWL', 0);
INSERT INTO `fa_shopro_express` VALUES (306, '智汇鸟', 'ZHN', 99);
INSERT INTO `fa_shopro_express` VALUES (307, '众邮快递', 'ZYE', 0);

-- ----------------------------
-- Table structure for fa_shopro_failed_job
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_failed_job`;
CREATE TABLE `fa_shopro_failed_job`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '失败队列',
  `data` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_faq
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_faq`;
CREATE TABLE `fa_shopro_faq`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '常见问题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_shopro_faq
-- ----------------------------
INSERT INTO `fa_shopro_faq` VALUES (1, '付款后订单显示待付款？', '如您账户显示已扣款，但订单交易状态显示”等待付款”，可能是由于网络繁忙导致数据延迟，建议您稍后关注订单交易状态以及交易账户流水情况。', 1582259738, 1590746459, NULL);
INSERT INTO `fa_shopro_faq` VALUES (2, '商品退货了，谁承担运费？', '亲，平台运费规则秉承“谁过错，谁承担”的原则,如非商家或者物流问题，建议您联系商家协商处理，售后，退货运费需要您自行承担;如商品存在质量问题、商家发错货等情况，退货运费由商家承担。为了更好的保障您的权益，请您保留好相关凭证,退货物流费用麻烦您先垫付，不要使用到付，待商家收到您寄回的商品，退款成功后，您可以凭借凭证联系商家处理~', 1582259745, 1586946960, NULL);

-- ----------------------------
-- Table structure for fa_shopro_feedback
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_feedback`;
CREATE TABLE `fa_shopro_feedback`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '反馈用户',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '反馈类型',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '反馈内容',
  `images` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否处理:0=未处理,1=已处理',
  `remark` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理备注',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '意见反馈' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_goods
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_goods`;
CREATE TABLE `fa_shopro_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('normal','virtual') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'normal' COMMENT '商品类型:normal=实体商品,virtual=虚拟商品',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `status` enum('up','hidden','down') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品状态:up=上架,hidden=隐藏商品,down=下架',
  `weigh` int(11) NOT NULL DEFAULT 0 COMMENT '排序(从大到小)',
  `category_ids` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属分类',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品主图',
  `images` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '轮播图',
  `params` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数详情',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图文详情',
  `price` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '价格',
  `original_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '原价',
  `is_sku` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否多规格',
  `likes` int(11) NOT NULL DEFAULT 0 COMMENT '收藏人数',
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '浏览人数',
  `sales` int(11) NOT NULL DEFAULT 0 COMMENT '销量',
  `show_sales` int(11) NOT NULL COMMENT '显示销量',
  `service_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务标签',
  `dispatch_type` set('express','selfetch','store','autosend') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货方式:express=物流快递,selfetch=用户自提,store=商家配送,autosend=自动发货',
  `dispatch_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货模板',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_shopro_goods
-- ----------------------------
INSERT INTO `fa_shopro_goods` VALUES (1, 'normal', '安踏外套男装官网正品2020春夏季新款连帽健身休闲夹克卫衣运动服', '正品保证 放心购 ', 'up', 0, '5', '/uploads/20210601/e3e96da45a068da5c3ecea808b573a9b.jpg', '/uploads/20210601/4f66c8067382ef0bb3a9b18da85f866b.jpg,/uploads/20210601/5f45bc1f3fca51e3582e1d23109aa7aa.jpg,/uploads/20210601/412a2c1b65cd9d570c265829355b5f69.jpg', '[]', '<div align=\"center\"><img src=\"/uploads/20210601/06d2dcf97fdf2287791678221d3bedd9.jpg\" alt=\"\" /><img src=\"/uploads/20210601/9a6b2c41e475055c53eeaee71b538319.jpg\" alt=\"\" /></div>', '169', 220.00, 0, 0, 0, 0, 0, '4,3,2,1', 'express', '1', 1622526561, 1622527264, NULL);
INSERT INTO `fa_shopro_goods` VALUES (2, 'normal', '白色雪纺连衣裙20新款女夏季流行女士收腰气质超仙女甜美长裙子 白色 M', '正品保证 放心购 ', 'up', 0, '6', '/uploads/20210601/3327f635ab3384d526fc8c3159c839e9.jpg', '/uploads/20210601/3327f635ab3384d526fc8c3159c839e9.jpg', '[]', '<div align=\"center\"><img src=\"/uploads/20210601/99e106b28915a19e57f1b8b6691288dc.jpg\" alt=\"\" /><img src=\"/uploads/20210601/8b367f40e31646844ddf3e6279b59713.jpg\" alt=\"\" /></div>', '165', 200.00, 0, 0, 0, 0, 0, '4,3,2,1', 'express', '1', 1622526800, 1622527161, NULL);

-- ----------------------------
-- Table structure for fa_shopro_goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_goods_comment`;
CREATE TABLE `fa_shopro_goods_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论 id',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品',
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单',
  `order_item_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单商品',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户',
  `level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '评价星级',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价内容',
  `images` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价图片',
  `status` enum('show','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '显示状态',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '管理员 id',
  `reply_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `replytime` int(11) NULL DEFAULT NULL COMMENT '回复时间',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '评论时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品评价' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_goods_service
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_goods_service`;
CREATE TABLE `fa_shopro_goods_service`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务标志',
  `description` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `createtime` int(11) NULL DEFAULT NULL,
  `updatetime` int(11) NULL DEFAULT NULL,
  `deletetime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '服务标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_shopro_goods_service
-- ----------------------------
INSERT INTO `fa_shopro_goods_service` VALUES (1, '正品保障', 'http://api.7wpp.com/uploads/20200222/8ca30cc57e2f0f9bea5b32c0d7a2a9fe.png', '正品保障,假一赔三', 1582349797, 1582350058, NULL);
INSERT INTO `fa_shopro_goods_service` VALUES (2, '七天退换', 'http://api.7wpp.com/uploads/20200222/73d9b9857972e18b70c4f9aa0cb3cbe1.png', '满足相应条件(吊牌缺失，洗涤后不支持)时，消费者可申请“七天无理由退货”', 1582350155, 1582350155, NULL);
INSERT INTO `fa_shopro_goods_service` VALUES (3, '退货保障', 'http://api.7wpp.com/uploads/20200222/c7e0b30e543aef9e2a801539228fc972.png', '卖家投保退货运费险', 1582350220, 1582350220, NULL);
INSERT INTO `fa_shopro_goods_service` VALUES (4, '极速退款', 'http://api.7wpp.com/uploads/20200222/57d971eb5984317ee794e531ea0f9207.png', '超快无审核退款流程', 1582350241, 1582350241, NULL);

-- ----------------------------
-- Table structure for fa_shopro_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_goods_sku`;
CREATE TABLE `fa_shopro_goods_sku`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '所属规格',
  `goods_id` int(11) NOT NULL COMMENT '产品',
  `weigh` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品规格' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_goods_sku_price
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_goods_sku_price`;
CREATE TABLE `fa_shopro_goods_sku_price`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_sku_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_id` int(11) NOT NULL COMMENT '所属产品',
  `weigh` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存',
  `sales` int(11) NOT NULL DEFAULT 0 COMMENT '已售',
  `sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货号',
  `weight` int(11) NULL DEFAULT NULL COMMENT '重量(kg)',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `goods_sku_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中文规格',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'up' COMMENT '状态',
  `createtime` int(11) NULL DEFAULT NULL,
  `updatetime` int(11) NULL DEFAULT NULL,
  `deletetime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品规格' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_shopro_goods_sku_price
-- ----------------------------
INSERT INTO `fa_shopro_goods_sku_price` VALUES (1, NULL, 1, 0, NULL, 1000, 0, '', 0, 169.00, NULL, 'up', 1622526561, 1622526561, NULL);
INSERT INTO `fa_shopro_goods_sku_price` VALUES (2, NULL, 2, 0, NULL, 1000, 0, '', 0, 165.00, NULL, 'up', 1622526800, 1622526800, NULL);

-- ----------------------------
-- Table structure for fa_shopro_link
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_link`;
CREATE TABLE `fa_shopro_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
  `group` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属分组',
  `createtime` int(11) NULL DEFAULT NULL,
  `updatetime` int(11) NULL DEFAULT NULL,
  `deletetime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '页面链接' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_shopro_link
-- ----------------------------
INSERT INTO `fa_shopro_link` VALUES (1, '首页', '/pages/index/index', '商城', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (2, '分类', '/pages/index/category', '商城', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (3, '购物车', '/pages/index/cart', '商城', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (4, '我的', '/pages/index/user', '用户', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (5, '商品列表', '/pages/goods/list', '商城', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (6, '商品详情', '/pages/goods/detail/index', '商城', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (7, '今日必拼', '/pages/activity/groupon/list', '活动', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (8, '限时秒杀', '/pages/activity/seckill/list', '活动', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (9, '我的拼团', '/pages/activity/groupon/my-groupon', '活动', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (10, '优惠劵中心', '/pages/app/coupon/list', '优惠券', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (11, '优惠劵详情', '/pages/app/coupon/detail', '优惠券', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (12, '积分商城', '/pages/app/score/list', '应用', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (13, '我的订单', '/pages/order/list', '用户', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (14, '富文本', '/pages/public/richtext', '通用', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (15, '意见反馈', '/pages/public/feedback', '商城', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (16, '找回密码', '/pages/public/forgot', '用户', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (17, '登录', '/pages/public/login', '用户', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (18, '注册', '/pages/public/register', '用户', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (19, '海报', '/pages/public/poster/index', '通用', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (20, '常见问题', '/pages/public/faq', '通用', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (21, '浏览足迹', '/pages/user/log', '用户', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (22, '签到中心', '/pages/user/sign/index', '通用', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (23, '收货地址', '/pages/user/address/list', '用户', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (24, '系统设置', '/pages/user/set', '通用', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (25, '修改密码', '/pages/user/edit-password', '用户', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (26, '我的收藏', '/pages/user/favorite', '用户', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (27, '个人信息', '/pages/user/info', '用户', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (28, '修改手机号', '/pages/user/edit-phone', '用户', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (29, '我的钱包', '/pages/user/wallet/index', '用户', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (30, '绑定银行卡', '/pages/user/wallet/bind-bank', '用户', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (31, '钱包明细', '/pages/user/wallet/log', '用户', 1590983959, 1590983959, NULL);
INSERT INTO `fa_shopro_link` VALUES (32, '我的积分', '/pages/user/wallet/score-balance', '用户', 1590983959, 1590983959, NULL);

-- ----------------------------
-- Table structure for fa_shopro_live
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_live`;
CREATE TABLE `fa_shopro_live`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '房间名',
  `room_id` int(11) NOT NULL DEFAULT 0 COMMENT '房间 ID',
  `cover_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间背景',
  `live_status` enum('101','102','103','104','105','106','107') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '直播状态:101=直播中,102=未开始,103=已结束,104=禁播,105=暂停中,106=异常,107=已过期',
  `starttime` int(10) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `endtime` int(10) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `anchor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主播',
  `anchor_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主播头像',
  `share_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享封面',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_live_goods
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_live_goods`;
CREATE TABLE `fa_shopro_live_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `live_id` int(11) NOT NULL COMMENT '直播ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `origin_price` decimal(10, 2) NOT NULL COMMENT '原价',
  `price` decimal(10, 2) NOT NULL COMMENT '价格',
  `max_price` decimal(10, 2) NOT NULL COMMENT '最大价格',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品链接',
  `cover_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_live_link
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_live_link`;
CREATE TABLE `fa_shopro_live_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `live_id` int(11) NOT NULL COMMENT '直播ID',
  `media_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回放链接',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '回放创建时间',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '回放过期时间',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_notification
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_notification`;
CREATE TABLE `fa_shopro_notification`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消息表',
  `type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息类型',
  `notifiable_id` int(10) UNSIGNED NOT NULL COMMENT '接收人',
  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接收人类型',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据',
  `readtime` int(10) NULL DEFAULT NULL COMMENT '是否已读',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `notifiable_id_notifiable_type`(`notifiable_id`, `notifiable_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_notification_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_notification_config`;
CREATE TABLE `fa_shopro_notification_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `platform` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发送平台',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息名称',
  `event` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息事件',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '消息内容',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态:0=关闭,1=启用',
  `sendnum` int(11) NOT NULL DEFAULT 0 COMMENT '发送次数',
  `createtime` int(11) NULL DEFAULT NULL,
  `updatetime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_order
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_order`;
CREATE TABLE `fa_shopro_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('goods','score') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'goods' COMMENT '订单类型:goods=商城订单,score=积分商城订单',
  `order_sn` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户',
  `activity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动类型',
  `goods_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品总价',
  `dispatch_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '总运费',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `consignee` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `province_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `city_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `area_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `province_id` int(11) NOT NULL DEFAULT 0,
  `city_id` int(11) NOT NULL DEFAULT 0,
  `area_id` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '订单状态:-2=交易关闭,-1=已取消,0=未支付,1=已支付,2=已完成',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户备注',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户备注',
  `total_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单总金额',
  `score_amount` int(11) NOT NULL DEFAULT 0 COMMENT '积分总数',
  `total_fee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '支付金额',
  `discount_fee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '折扣总金额',
  `coupon_fee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠券抵用金额',
  `pay_fee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实际支付金额',
  `score_fee` int(11) NOT NULL DEFAULT 0 COMMENT '积分支付数',
  `goods_original_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品原价',
  `coupons_id` int(11) NOT NULL DEFAULT 0 COMMENT '优惠券 id',
  `transaction_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易单号',
  `payment_json` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易原始数据',
  `pay_type` enum('wechat','alipay','wallet','score') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式:wechat=微信支付,alipay=支付宝,wallet=钱包支付,score=积分支付',
  `paytime` int(11) NULL DEFAULT NULL COMMENT '支付时间',
  `ext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加字段',
  `platform` enum('H5','App','wxOfficialAccount','wxMiniProgram') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台:H5=H5,wxOfficialAccount=微信公众号,wxMiniProgram=微信小程序,App=App',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_order_action
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_order_action`;
CREATE TABLE `fa_shopro_order_action`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作记录 id',
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单 id',
  `order_item_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单商品id',
  `oper_type` enum('user','store','admin','system') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作人类型',
  `oper_id` int(11) NOT NULL DEFAULT 0 COMMENT '操作人 id',
  `order_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '订单状态',
  `dispatch_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '发货状态',
  `comment_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '评论状态',
  `aftersale_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '售后状态',
  `refund_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '退款状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '操作时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单操作记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_order_aftersale
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_order_aftersale`;
CREATE TABLE `fa_shopro_order_aftersale`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aftersale_sn` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '售后单号',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型:refund=退款,return=退货,other=其他',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `activity_id` int(11) NULL DEFAULT NULL COMMENT '活动',
  `activity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动类型',
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单',
  `order_item_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单商品',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品',
  `goods_sku_price_id` int(11) NOT NULL DEFAULT 0 COMMENT '规格 id',
  `goods_sku_text` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格名',
  `goods_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `goods_original_price` decimal(10, 2) NOT NULL COMMENT '商品原价',
  `discount_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠费用',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `goods_num` int(11) NOT NULL DEFAULT 0 COMMENT '购买数量',
  `dispatch_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '发货状态:0=未发货,1=已发货,2=已收货',
  `dispatch_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '发货费用',
  `aftersale_status` tinyint(2) NOT NULL COMMENT '售后状态:-1=拒绝,0=未处理,1=处理中,2=售后完成',
  `refund_status` tinyint(1) NULL DEFAULT NULL COMMENT '退款状态:-1=拒绝退款,0=未退款,1=同意',
  `refund_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `aftersale_sn`(`aftersale_sn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '售后单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_order_aftersale_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_order_aftersale_log`;
CREATE TABLE `fa_shopro_order_aftersale_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作记录 id',
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单',
  `order_aftersale_id` int(11) NOT NULL DEFAULT 0 COMMENT '售后单',
  `oper_type` enum('user','store','admin','system') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作人类型',
  `oper_id` int(11) NOT NULL DEFAULT 0 COMMENT '操作人 id',
  `dispatch_status` tinyint(2) NOT NULL COMMENT '发货状态',
  `aftersale_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '售后状态',
  `refund_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '退款状态',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售后原因',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `images` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '操作时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '售后单记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_order_express
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_order_express`;
CREATE TABLE `fa_shopro_order_express`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户',
  `order_id` int(11) NOT NULL COMMENT '订单',
  `express_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `express_code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司编号',
  `express_no` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '快递包裹' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_order_express_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_order_express_log`;
CREATE TABLE `fa_shopro_order_express_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户',
  `order_id` int(11) NOT NULL COMMENT '订单',
  `order_express_id` int(11) NOT NULL COMMENT '包裹',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '物流状态',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流信息',
  `changedate` datetime(0) NULL DEFAULT NULL COMMENT '变动时间',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物流信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_order_item
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_order_item`;
CREATE TABLE `fa_shopro_order_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户',
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品',
  `goods_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'normal' COMMENT '商品类型:normal=实体商品,virtual=虚拟商品',
  `goods_sku_price_id` int(11) NOT NULL DEFAULT 0 COMMENT '规格 id',
  `activity_id` int(11) NOT NULL DEFAULT 0 COMMENT '活动 id',
  `activity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动类型',
  `item_goods_sku_price_id` int(11) NOT NULL DEFAULT 0 COMMENT '活动规格|积分商城规格 id',
  `goods_sku_text` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格名',
  `goods_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `goods_original_price` decimal(10, 2) NOT NULL COMMENT '商品原价',
  `discount_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠费用',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `goods_num` int(11) NOT NULL DEFAULT 0 COMMENT '购买数量',
  `pay_price` decimal(10, 2) NOT NULL COMMENT '支付金额(不含运费)',
  `dispatch_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '发货状态:0=未发货,1=已发货,2=已收货',
  `dispatch_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '发货费用',
  `dispatch_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货方式',
  `dispatch_id` int(11) NULL DEFAULT NULL COMMENT '发货模板',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '门店',
  `aftersale_status` tinyint(2) NOT NULL COMMENT '售后状态:-1=拒绝,0=未申请,1=申请售后,2=售后完成',
  `comment_status` tinyint(2) NOT NULL COMMENT '评价状态:0=未评价,1=已评价',
  `refund_status` tinyint(1) NULL DEFAULT NULL COMMENT '退款状态:-1=拒绝退款,0=无,1=申请中,2=同意',
  `refund_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `refund_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款原因',
  `express_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `express_code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递公司编号',
  `express_no` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `ext` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加字段',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单商品明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_refund_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_refund_log`;
CREATE TABLE `fa_shopro_refund_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户订单号',
  `refund_sn` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户退款单号',
  `order_item_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单商品',
  `pay_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '支付金额',
  `refund_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `pay_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '付款方式',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '退款状态:0=退款中,1=退款完成,-1=退款失败',
  `payment_json` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款原始数据',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '退款日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_richtext
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_richtext`;
CREATE TABLE `fa_shopro_richtext`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '富文本' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_shopro_richtext
-- ----------------------------
INSERT INTO `fa_shopro_richtext` VALUES (1, '注册协议', '<p style=\"text-align: center;\" data-mpa-powered-by=\"yiban.io\"><span style=\"font-size: 16px;\">前言&nbsp;</span><br></p>\r\n<p>\r\n  <span style=\"font-size: 14px;\"></span>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">欢迎用户使用“Shopro商城”软件及相关服务！</span>\r\n</p>\r\n<p>​\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">“Shopro商城”软件及相关服务，系指星品科技有限公司（以下简称 “公司”）通过合法拥有并运营的、标注名称为“Shopro”的应用程序（以下简称““Shopro商城”软件”）向用户提供的产品与服务，包括但不限于个性化装修、商城设置、运费设置、营销活动、积分商城等核心功能以及其他功能，为用户提供一整套的移动营销商城平台。<mpchecktext contenteditable=\"false\" id=\"1586945717859_0.45392074502177926\">\r\n    </mpchecktext>“Shopro商城”软件的《用户协议》(以下简称“本协议”或“协议”)是用户与公司之间就用户注册、登录、使用（以下统称“使用”）“Shopro商城”软件及相关服务所订立的协议。<mpchecktext contenteditable=\"false\" id=\"1586945717860_0.19162217696189376\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717861_0.23895305026625113\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">为了更好地为用户提供服务，请用户在开始使用Shopro商城之前，认真阅读并充分理解本协议，特别是涉及免除或者限制责任的条款、权利许可和信息使用的条款、同意开通和使用特殊单项服务的条款、法律适用和争议解决条款等。<mpchecktext contenteditable=\"false\" id=\"1586945717862_0.6826780600856284\">\r\n    </mpchecktext>其中，免除或者限制责任条款等重要内容需要用户重点阅读。<mpchecktext contenteditable=\"false\" id=\"1586945717863_0.592752935512368\">\r\n    </mpchecktext>如用户未满18周岁，请在法定监护人陪同下仔细阅读并充分理解本协议，并征得法定监护人的同意后使用“Shopro商城”软件及相关服务。<mpchecktext contenteditable=\"false\" id=\"1586945717864_0.13057185339927369\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717865_0.48582193746739777\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">如用户不同意本协议，这将导致公司无法为用户提供完整的产品和服务，用户也可以选择停止使用。<mpchecktext contenteditable=\"false\" id=\"1586945717866_0.095419796821685\">\r\n    </mpchecktext>如用户自主选择同意或使用“Shopro商城”软件及相关服务，则视为用户已充分理解本协议，并同意作为本协议的一方当事人接受本协议以及其他与“Shopro商城”软件及相关服务相关的协议和规则（包括但不限于《隐私政策》）的约束。<mpchecktext contenteditable=\"false\" id=\"1586945717867_0.6932421723829425\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717868_0.160955727160502\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">一、“Shopro商城”软件及相关服务&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717869_0.28788409475007715\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">1.1 用户使用“Shopro商城”软件及相关服务，可以通过预装、公司已授权的第三方下载等方式获取“Shopro商城”软件。<mpchecktext contenteditable=\"false\" id=\"1586945717870_0.7555546322448072\">\r\n    </mpchecktext>若用户并非从公司或经公司授权的第三方获取“Shopro商城”软件的，公司无法保证非官方版本的“Shopro商城”软件能够正常使用，用户因此遭受的损失与公司无关。<mpchecktext contenteditable=\"false\" id=\"1586945717871_0.06031817555689889\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717872_0.38456734103671475\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">1.2 公司可能为不同的终端设备开发不同的应用程序软件版本，用户应当根据实际设备状况获取、下载、安装合适的版本。<mpchecktext contenteditable=\"false\" id=\"1586945717873_0.04507832533354872\">\r\n    </mpchecktext>如用户不再使用“Shopro商城”软件及相关服务，用户也可自行卸载相应的应用程序软件。<mpchecktext contenteditable=\"false\" id=\"1586945717874_0.685366723012101\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717875_0.860802706628788\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">1.3 为更好的提升用户体验及服务，公司将不定期提供“Shopro商城”软件及相关服务的更新或改变（包括但不限于软件修改、升级、功能强化、开发新服务、软件替换等），用户可根据需要自行选择是否更新相应的版本。<mpchecktext contenteditable=\"false\" id=\"1586945717876_0.38534034115618687\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717877_0.5769422265186244\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">为保证“Shopro商城”软件及相关服务安全、提升用户服务，在“Shopro商城”软件及相关服务的部分或全部更新后，公司将在可行的情况下以妥当的方式（包括但不限于系统提示、公告、站内信等）提示用户，用户有权选择接受更新后的版本；<mpchecktext contenteditable=\"false\" id=\"1586945717879_0.4067685580333855\">\r\n    </mpchecktext>如用户选择不作更新，“Shopro商城”软件及相关服务的部分功能将受到限制或不能正常使用。<mpchecktext contenteditable=\"false\" id=\"1586945717878_0.005714409231253992\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717880_0.0730404238665181\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">1.4 除非得到公司事先书面授权，用户不得以任何形式对“Shopro商城”软件及相关服务进行包括但不限于改编、复制、传播、垂直搜索、镜像或交易等未经授权的访问或使用。<mpchecktext contenteditable=\"false\" id=\"1586945717881_0.4087073887677406\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717882_0.9929180727812823\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">1.5 公司许可用户一项个人的、不可转让的、非独占地和非商业的合法使用“Shopro商城”软件及相关服务的权利。<mpchecktext contenteditable=\"false\" id=\"1586945717883_0.9799030673184836\">\r\n    </mpchecktext>本协议未明示授权的其他一切权利仍由公司保留，用户在行使该等权利前须另行获得公司的书面许可，同时公司如未行使前述任何权利，并不构成对该权利的放弃。<mpchecktext contenteditable=\"false\" id=\"1586945717884_0.03748083739873054\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717885_0.04882633650627466\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">1.6 用户无需注册也可开始使用“Shopro商城”软件及相关服务，但部分功能或服务可能会受到影响。<mpchecktext contenteditable=\"false\" id=\"1586945717886_0.42916827286947345\">\r\n    </mpchecktext>同时，用户也理解，为使用户更好地使用“Shopro商城”软件及相关服务，保障用户的用户帐号安全，某些功能和/或某些单项服务项目将要求用户按照国家相关法律法规的规定，提供真实的身份信息实名注册并登录后方可使用。<mpchecktext contenteditable=\"false\" id=\"1586945717887_0.9036179217249078\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717888_0.21335312540841644\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">二、帐号注册&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717889_0.15039944243691705\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">2.1 用户在使用“Shopro商城”软件及相关服务前需要注册一个“Shopro商城”用户帐号。<mpchecktext contenteditable=\"false\" id=\"1586945717890_0.240164062658897\">\r\n    </mpchecktext>该等用户帐号应当使用微信号注册、手机号验证注册或游客模式登录，请用户使用尚未在“Shopro商城”软件验证的手机号码，以及未被公司根据本协议封禁的用户账号进行注册、登录、使用。<mpchecktext contenteditable=\"false\" id=\"1586945717891_0.49309174984358983\">\r\n    </mpchecktext>公司可以根据用户的需求或产品需要对帐号注册和绑定的方式进行变更，而无须事先通知用户。<mpchecktext contenteditable=\"false\" id=\"1586945717892_0.013998777062480317\">\r\n    </mpchecktext>&nbsp; &nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717893_0.8224874358285899\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">2.2 鉴于用户帐号的注册方式，用户同意公司在用户注册时将使用用户提供的手机号码或自动提取用户的手机号码及自动提取用户的手机设备识别码等信息用于注册。<mpchecktext contenteditable=\"false\" id=\"1586945717894_0.06279704022923394\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717895_0.19151639361126938\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">2.3 在用户使用时，公司需要搜集能识别用户身份的个人信息以便根据相关法律规定、相关政府部门或主管机关的要求或其他必要的情况下联系用户，或为用户提供更好的使用体验。<mpchecktext contenteditable=\"false\" id=\"1586945717896_0.05460145181505083\">\r\n    </mpchecktext>公司可能搜集的信息包括但不限于用户的姓名、性别、年龄、出生日期、手机号码、身份证号、地址、工作信息、兴趣爱好、个人说明等；<mpchecktext contenteditable=\"false\" id=\"1586945717898_0.8492666242490619\">\r\n    </mpchecktext>公司同意对这些信息的使用将受限于第四条用户个人隐私信息保护的约束。<mpchecktext contenteditable=\"false\" id=\"1586945717897_0.09689583079920916\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717899_0.1305097196288254\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">2.4 用户理解并承诺，用户所设置的用户账号不得违反国家法律法规及公司的相关规则，不得实施任何侵害国家利益、损害其他公民合法权益，有害社会道德风尚的行为，用户的用户帐号名称、头像和简介等注册信息及其他个人信息中不得出现违法和不良信息，未经他人许可不得用他人名义（包括但不限于冒用他人姓名、名称、字号、头像等足以让人引起混淆的方式）开设账号，不得恶意注册“Shopro商城”软件的用户帐号（包括但不限于频繁注册、批量注册账号等行为）。<mpchecktext contenteditable=\"false\" id=\"1586945717900_0.3667252836191117\">\r\n    </mpchecktext>公司有权对用户提交的信息进行审核。<mpchecktext contenteditable=\"false\" id=\"1586945717901_0.6195467571124247\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717902_0.16641293926159584\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">2.5 用户的用户帐号仅限于用户本人使用，未经公司书面同意，禁止以任何形式赠与、借用、出租、转让、售卖或以其他方式许可他人使用该账号。<mpchecktext contenteditable=\"false\" id=\"1586945717903_0.43351815407326666\">\r\n    </mpchecktext>如果公司发现或者有合理理由认为使用者并非账号初始注册人，为保障账号安全，公司有权立即暂停或终止向该注册账号提供服务，或注销该账号。<mpchecktext contenteditable=\"false\" id=\"1586945717904_0.8035444663041129\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717905_0.4483691237512386\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">2.6 用户有责任维护用户账号、密码的安全性与保密性，并对用户以注册账号名义所从事的活动承担全部法律责任，包括但不限于用户在“Shopro商城”软件及相关服务上进行的任何数据修改、言论发表、款项支付等操作行为可能引起的一切法律责任。<mpchecktext contenteditable=\"false\" id=\"1586945717906_0.5958898253468685\">\r\n    </mpchecktext>用户应高度重视对账号与密码的保密，在任何情况下不向他人透露账号及密码。<mpchecktext contenteditable=\"false\" id=\"1586945717907_0.6437356837846298\">\r\n    </mpchecktext>若发现他人未经许可使用用户的用户帐号或发生其他任何安全漏洞问题时，用户应当立即通知公司。<mpchecktext contenteditable=\"false\" id=\"1586945717908_0.04623522961978699\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717909_0.590437676865726\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">2.7 在丢失账号或遗忘密码时，用户可遵照公司的申诉途径及时申诉请求找回账号或密码。<mpchecktext contenteditable=\"false\" id=\"1586945717910_0.9948828677881103\">\r\n    </mpchecktext>用户理解并认可，公司的密码找回机制仅需要识别通过短信验证通过的手机号与系统记录资料具有一致性，而无法识别申诉人是否系真正账号有权使用者。<mpchecktext contenteditable=\"false\" id=\"1586945717911_0.8024726682208796\">\r\n    </mpchecktext>公司特别提醒用户应妥善保管用户的用户帐号和密码。<mpchecktext contenteditable=\"false\" id=\"1586945717912_0.41885535088021353\">\r\n    </mpchecktext>当用户使用完毕后，应安全退出。<mpchecktext contenteditable=\"false\" id=\"1586945717913_0.540527006631994\">\r\n    </mpchecktext>如因用户保管不当等自身原因或其他不可抗因素导致遭受盗号或密码丢失，用户将自行承担相应责任。<mpchecktext contenteditable=\"false\" id=\"1586945717914_0.4380744179947367\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717915_0.06881903665678757\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">2.8 在注册、使用和管理账号时，用户应保证注册账号时填写的身份信息的真实性，请用户在注册、管理账号时使用真实、准确、合法、有效的相关身份证明材料及必要信息（包括用户的姓名及电子邮件地址、联系电话、联系地址等）。<mpchecktext contenteditable=\"false\" id=\"1586945717916_0.485378875386687\">\r\n    </mpchecktext>依照国家相关法律法规的规定，为使用“Shopro商城”软件及相关服务的部分功能，用户需要填写真实的身份信息，请用户按照相关法律规定完成实名认证，并注意及时更新上述相关信息。<mpchecktext contenteditable=\"false\" id=\"1586945717917_0.08597761200010656\">\r\n    </mpchecktext>若用户提交的材料或提供的信息不规范或不符合要求的，则公司有权拒绝为用户提供相关功能，用户可能无法使用“Shopro商城”软件及相关服务或在使用过程中部分功能受到限制。<mpchecktext contenteditable=\"false\" id=\"1586945717918_0.3872062011445079\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717919_0.044222175287903065\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">2.9 除自行注册“Shopro商城”软件的用户帐号外，用户也可授权使用其合法拥有的包括但不限于公司和/或其关联公司其他软件用户账号，以及实名注册的第三方软件用户账号登录使用“Shopro商城”软件及相关服务，但第三方软件或平台对此有限制或禁止的除外。<mpchecktext contenteditable=\"false\" id=\"1586945717920_0.7201493755389337\">\r\n    </mpchecktext>当用户以前述已有账号登录使用的，应保证相应账号已进行实名注册登记，并同样适用本协议中的相关条款。<mpchecktext contenteditable=\"false\" id=\"1586945717921_0.6596579681328247\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717922_0.2555116796535468\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">2.10 当用户完成“Shopro商城”软件的用户帐号注册、登录并进行合理和必要的身份验证后，用户可随时浏览、修改自己提交的个人身份信息。<mpchecktext contenteditable=\"false\" id=\"1586945717923_0.5268350166310434\">\r\n    </mpchecktext>用户理解并同意，出于安全性和身份识别（如账号或密码找回申诉服务等）的考虑，用户可能无法修改注册时提供的初始注册信息及其他验证信息。<mpchecktext contenteditable=\"false\" id=\"1586945717924_0.5604501109598137\">\r\n    </mpchecktext>用户也可以申请注销账号，公司会在完成个人身份、安全状态、设备信息等合理和必要的验证后协助用户注销账号，并依照用户的要求删除有关用户账号的一切信息，法律法规另有规定的除外。<mpchecktext contenteditable=\"false\" id=\"1586945717925_0.963359474775169\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717926_0.1519238199168107\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">三、内容规范&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717927_0.4908001040452643\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.1本条所述内容是指用户使用“Shopro商城”软件及相关服务过程中所制作、上载、复制、发布、传播的任何内容，包括但不限于帐号头像、名称、用户说明等注册信息及认证资料，或文字、语音、图片、视频、图文等发送、回复或自动回复消息和相关链接页面，以及其他使用“Shopro商城”软件及相关服务所产生的内容。<mpchecktext contenteditable=\"false\" id=\"1586945717928_0.5856036910178926\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717929_0.009413351376800438\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.2用户不得利用“Shopro商城”软件及相关服务制作、上载、复制、发布、传播如下法律、法规和政策禁止的内容：<mpchecktext contenteditable=\"false\" id=\"1586945717930_0.7447438431649249\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717931_0.49170073921986757\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.2.1 反对宪法所确定的基本原则的；<mpchecktext contenteditable=\"false\" id=\"1586945717932_0.2064206560899855\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717933_0.09726206297986795\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.2.2 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<mpchecktext contenteditable=\"false\" id=\"1586945717934_0.5381651697479561\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717935_0.4797931816154526\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.2.3 损害国家荣誉和利益的；<mpchecktext contenteditable=\"false\" id=\"1586945717936_0.5971847083272468\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717937_0.19538495699532343\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.2.4 煽动民族仇恨、民族歧视，破坏民族团结的；<mpchecktext contenteditable=\"false\" id=\"1586945717938_0.2967358683582957\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717939_0.23297694434224092\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.2.5 破坏国家宗教政策，宣扬邪教和封建迷信的；<mpchecktext contenteditable=\"false\" id=\"1586945717940_0.047080813149972256\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717941_0.5854304593372242\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.2.6 散布谣言，扰乱社会秩序，破坏社会稳定的；<mpchecktext contenteditable=\"false\" id=\"1586945717942_0.8327211500123035\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717943_0.3302393054932773\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.2.7 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<mpchecktext contenteditable=\"false\" id=\"1586945717944_0.41853581858378863\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717945_0.6676713923282385\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.2.8 侮辱或者诽谤他人，侵害他人合法权益的；<mpchecktext contenteditable=\"false\" id=\"1586945717946_0.820250353029184\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717947_0.9557146385079649\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.2.9 不遵守法律法规底线、社会主义制度底线、国家利益底线、公民合法权益底线、社会公共秩序底线、道德风尚底线和信息真实性底线的“七条底线”要求的；<mpchecktext contenteditable=\"false\" id=\"1586945717948_0.4663249637003126\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717949_0.005133570449364466\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.2.10 含有法律、行政法规禁止的其他内容的信息；<mpchecktext contenteditable=\"false\" id=\"1586945717950_0.46291279824835896\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717951_0.39493239801125535\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.2.11 若用户违反上述任一项规则，公司有权利删除用户发布的内容或封停违规用户账号。<mpchecktext contenteditable=\"false\" id=\"1586945717952_0.47936027179171337\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717953_0.1707189325700491\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.3用户不得利用“Shopro商城”软件及相关服务制作、上载、复制、发布、传播如下干扰公司正常运营，以及侵犯其他用户或第三方合法权益的内容：<mpchecktext contenteditable=\"false\" id=\"1586945717954_0.569699019580225\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717955_0.5340429781147165\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.3.1 含有任何性或性暗示的；<mpchecktext contenteditable=\"false\" id=\"1586945717956_0.35138061669722687\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717957_0.4348350456315242\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.3.2 含有辱骂、恐吓、威胁内容的；<mpchecktext contenteditable=\"false\" id=\"1586945717958_0.09769286944209132\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717959_0.38587308889611993\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.3.3 含有骚扰、垃圾广告、恶意信息、诱骗信息的；<mpchecktext contenteditable=\"false\" id=\"1586945717960_0.930822322844624\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717961_0.6118140295681467\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.3.4 涉及他人隐私、个人信息或资料的；<mpchecktext contenteditable=\"false\" id=\"1586945717962_0.9683657312769987\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717963_0.2619432399361228\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.3.5 侵害他人名誉权、肖像权、知识产权、商业秘密等合法权利的；<mpchecktext contenteditable=\"false\" id=\"1586945717964_0.37467967486597975\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717965_0.5011419787468785\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.3.6 含有其他干扰“Shopro商城”软件及相关服务正常运营和侵犯其他用户或第三方合法权益内容的信息。<mpchecktext contenteditable=\"false\" id=\"1586945717966_0.7824319712468593\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717967_0.6520922104391997\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">3.3.7 若用户违反上述任一项规则，公司有权利删除用户发布的内容或封停违规用户账号。<mpchecktext contenteditable=\"false\" id=\"1586945717968_0.6604667639887438\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717969_0.03430044987947789\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">四、使用规则&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717970_0.6624207535197362\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">4.1用户在“Shopro商城”软件及相关服务中或通过“Shopro商城”软件及相关服务所传送、发布的任何内容并不反映或代表，也不得被视为反映或代表公司的观点、立场或政策，公司对此不承担任何责任。<mpchecktext contenteditable=\"false\" id=\"1586945717971_0.7230417841539538\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717972_0.5232011775909156\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">4.2用户不得利用“Shopro商城”软件及相关服务进行如下行为：<mpchecktext contenteditable=\"false\" id=\"1586945717973_0.6934840145439858\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717974_0.05528893804847934\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">4.2.1 提交、发布虚假信息，或盗用他人头像或资料，冒充、利用他人名义的；<mpchecktext contenteditable=\"false\" id=\"1586945717975_0.04009195692999734\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717976_0.8464286163427102\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">4.2.2 强制、诱导其他用户关注、点击链接页面或分享信息的；<mpchecktext contenteditable=\"false\" id=\"1586945717977_0.274875471693411\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717978_0.5824010427636914\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">4.2.3 虚构事实、隐瞒真相以误导、欺骗他人的；<mpchecktext contenteditable=\"false\" id=\"1586945717979_0.9854839067243466\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717980_0.5877575870397544\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">4.2.4 利用技术手段批量建立虚假帐号的；<mpchecktext contenteditable=\"false\" id=\"1586945717981_0.9994730455267251\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717982_0.6396703470589646\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">4.2.5 利用“Shopro商城”软件及相关服务从事任何违法犯罪活动的；<mpchecktext contenteditable=\"false\" id=\"1586945717983_0.8578071033208059\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717984_0.9652410220631225\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">4.2.6 制作、发布与以上行为相关的方法、工具，或对此类方法、工具进行运营或传播，无论这些行为是否为商业目的；<mpchecktext contenteditable=\"false\" id=\"1586945717985_0.20397318559973843\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717986_0.5949012466709007\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">4.2.7 其他违反法律法规规定、侵犯其他用户合法权益、干扰公司正常运营或公司未明示授权的行为。<mpchecktext contenteditable=\"false\" id=\"1586945717987_0.10221489814003304\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717988_0.5944470289620998\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">4.2.8 若用户违反上述任一项规则，公司有权利封停违规用户账号。<mpchecktext contenteditable=\"false\" id=\"1586945717989_0.49803423763664156\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717990_0.8241284143457652\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">4.3用户须对利用“Shopro商城”软件及相关服务传送信息的真实性、合法性、无害性、准确性、有效性等全权负责，与用户所传播的信息相关的任何法律责任由用户自行承担，与公司无关。<mpchecktext contenteditable=\"false\" id=\"1586945717991_0.40613303076904783\">\r\n    </mpchecktext>如因此给公司或第三方造成任何损害的，用户应当依法予以全额赔偿。<mpchecktext contenteditable=\"false\" id=\"1586945717992_0.7676519684151621\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717993_0.11481520444855775\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">4.4公司提供的服务中可能包括广告，用户同意在使用过程中显示公司和第三方供应商、合作伙伴提供的广告。<mpchecktext contenteditable=\"false\" id=\"1586945717994_0.08263680933955397\">\r\n    </mpchecktext>除法律法规明确规定外，用户应自行对依该广告信息进行的交易负责，对用户因依该广告信息进行的交易或前述广告商提供的内容而遭受的损失或损害，公司不承担任何责任。<mpchecktext contenteditable=\"false\" id=\"1586945717995_0.030611879929003605\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717996_0.4122945645315925\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">五、账号管理&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945717997_0.06259733362159015\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">5.1用户有责任妥善保管注册帐号信息及帐号密码的安全，因用户保管不善可能导致遭受盗号或密码失窃，责任由用户自行承担。<mpchecktext contenteditable=\"false\" id=\"1586945717998_0.9135885911138069\">\r\n    </mpchecktext>用户需要对注册帐号以及密码下的行为承担法律责任。<mpchecktext contenteditable=\"false\" id=\"1586945717999_0.6636716499934869\">\r\n    </mpchecktext>用户同意在任何情况下不使用其他用户的帐号或密码。<mpchecktext contenteditable=\"false\" id=\"1586945718000_0.6838391940521436\">\r\n    </mpchecktext>在用户怀疑他人使用其帐号或密码时，用户同意立即通知公司。<mpchecktext contenteditable=\"false\" id=\"1586945718001_0.46643190906320897\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718002_0.8537319912398054\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">5.2用户应遵守本协议的各项条款，正确、适当地使用”Shopro商城”软件及相关服务，如因用户违反本协议中的任何条款，公司在通知用户后有权依据协议中断或终止对违约用户的用户帐号提供服务。<mpchecktext contenteditable=\"false\" id=\"1586945718003_0.8705789387316738\">\r\n    </mpchecktext>同时，公司保留在任何时候收回”Shopro商城”软件的用户账号、用户名的权利。<mpchecktext contenteditable=\"false\" id=\"1586945718004_0.22531059290777833\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718005_0.3318522812469402\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">5.3如用户注册”Shopro商城”软件的用户账号后一年不登录或使用，公司在通知用户后，可以收回该帐号，以免造成资源浪费，由此造成的不利后果由用户自行承担。<mpchecktext contenteditable=\"false\" id=\"1586945718006_0.17785242240321342\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718007_0.16277865359752708\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">六、数据储存&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718008_0.197058941408772\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">6.1公司不对用户在”Shopro商城”软件及相关服务中相关数据的删除或储存失败负责。<mpchecktext contenteditable=\"false\" id=\"1586945718009_0.6924466689188937\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718010_0.46024121259928785\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">6.2公司可以根据实际情况自行决定用户在”Shopro商城”软件及相关服务中数据的最长储存期限，并在服务器上为其分配数据最大存储空间等。<mpchecktext contenteditable=\"false\" id=\"1586945718011_0.2578754755453174\">\r\n    </mpchecktext>用户可根据自己的需要自行备份”Shopro商城”软件及相关服务中的相关数据。<mpchecktext contenteditable=\"false\" id=\"1586945718012_0.06694473650201616\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718013_0.771278093723996\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">6.3如用户停止使用”Shopro商城”软件及相关服务、或”Shopro商城”软件及相关服务终止，公司可以从服务器上永久地删除用户的数据。<mpchecktext contenteditable=\"false\" id=\"1586945718014_0.4479349437070126\">\r\n    </mpchecktext>”Shopro商城”软件及相关服务停止、终止后，公司没有义务向用户返还任何数据。<mpchecktext contenteditable=\"false\" id=\"1586945718015_0.679349673068157\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718016_0.839718703976593\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">七、风险承担&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718017_0.25860502998307244\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">7.1用户理解并同意，公司仅为用户提供信息分享、传送及获取的平台，用户必须为自己注册的用户帐号下的一切行为负责，包括用户所传送的任何内容以及由此产生的任何后果。<mpchecktext contenteditable=\"false\" id=\"1586945718018_0.42687141593164224\">\r\n    </mpchecktext>用户应对”Shopro商城”软件及相关服务中的内容自行加以判断，并承担因使用内容而引起的所有风险，包括因对内容的正确性、完整性或实用性的依赖而产生的风险。<mpchecktext contenteditable=\"false\" id=\"1586945718019_0.1844049693349641\">\r\n    </mpchecktext>公司无法且不会对因用户行为而导致的任何损失或损害承担责任。<mpchecktext contenteditable=\"false\" id=\"1586945718020_0.29800165362335096\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718021_0.5802199803102208\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">如果用户发现任何人违反本协议约定或以其他不当的方式使用”Shopro商城”软件及相关服务，请立即向公司举报或投诉，公司将依本协议约定进行处理。<mpchecktext contenteditable=\"false\" id=\"1586945718022_0.14139366007781207\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718023_0.19652933019997398\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">7.2用户理解并同意，因业务发展需要，公司保留单方面对”Shopro商城”软件及相关服务的全部或部分服务内容变更、暂停、终止或撤销的权利，用户需承担此风险。<mpchecktext contenteditable=\"false\" id=\"1586945718024_0.28306881992257216\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718025_0.9043627519802266\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">八、知识产权声明&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718026_0.009648761499897018\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">8.1公司在”Shopro商城”软件及相关服务中提供的内容（包括但不限于软件、技术、程序、网页、文字、图片、图像、音频、视频、图表、版面、设计、电子文档等）的知识产权均归公司所有；<mpchecktext contenteditable=\"false\" id=\"1586945718029_0.3419197545295056\">\r\n    </mpchecktext>公司提供”Shopro商城”软件及相关服务时所依托软件的著作权、专利权及其他知识产权均归公司所有。<mpchecktext contenteditable=\"false\" id=\"1586945718027_0.3052308167679014\">\r\n    </mpchecktext>未经公司许可，任何人不得擅自使用（包括但不限于通过任何机器人、蜘蛛等程序或设备监视、复制、传播、展示、镜像、上载、下载）“Shopro商城”软件及相关服务中的内容。<mpchecktext contenteditable=\"false\" id=\"1586945718028_0.8141494524751567\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718030_0.560496691892477\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">8.2用户确认并同意授权公司以公司自己的名义或委托专业第三方对侵犯用户上传发布的享有知识产权的内容进行代维权，维权形式包括但不限于：<mpchecktext contenteditable=\"false\" id=\"1586945718032_0.7571140093521687\">\r\n    </mpchecktext>监测侵权行为、发送维权函、提起诉讼或仲裁、调解、和解等，公司有权对维权事宜做出决策并独立实施。<mpchecktext contenteditable=\"false\" id=\"1586945718031_0.9235815054762617\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718033_0.507467707772993\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">8.4公司为“Shopro商城”开发、运营提供技术支持，并对“Shopro商城”软件及相关服务的开发和运营等过程中产生的所有数据和信息等享有法律法规允许范围内的全部权利。<mpchecktext contenteditable=\"false\" id=\"1586945718034_0.19830208410089334\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718035_0.815645860458921\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">8.5请用户在任何情况下都不要私自使用公司的包括但不限于“Shopro商城”的任何商标、服务标记、商号、域名、网站名称或其他显著品牌特征等（以下统称为“标识”）。<mpchecktext contenteditable=\"false\" id=\"1586945718036_0.8092096062135516\">\r\n    </mpchecktext>未经公司事先书面同意，用户不得将本条款前述标识以单独或结合任何方式展示、使用或申请注册商标、进行域名注册等，也不得实施向他人明示或暗示有权展示、使用、或其他有权处理该些标识的行为。<mpchecktext contenteditable=\"false\" id=\"1586945718037_0.05668581341989998\">\r\n    </mpchecktext>由于用户违反本协议使用公司上述商标、标识等给公司或他人造成损失的，由用户承担全部法律责任。<mpchecktext contenteditable=\"false\" id=\"1586945718038_0.1516549473018456\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718039_0.8120012169519413\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">8.6公司在”Shopro商城”软件及相关服务中所涉及的图形、文字或其组成，以及其他Shopro商城标志及产品、服务名称（以下统称“Shopro商城标识”），其著作权或商标权归公司所有。<mpchecktext contenteditable=\"false\" id=\"1586945718040_0.3895875861378757\">\r\n    </mpchecktext>未经公司事先书面同意，用户不得将Shopro商城标识以任何方式展示或使用或作其他处理，也不得向他人表明用户有权展示、使用、或其他有权处理Shopro商城标识的行为。<mpchecktext contenteditable=\"false\" id=\"1586945718041_0.3391487573706584\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718042_0.1585501571986787\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">8.7上述及其他任何公司或相关广告商依法拥有的知识产权均受到法律保护，未经公司或相关广告商书面许可，用户不得以任何形式进行使用或创造相关衍生作品。<mpchecktext contenteditable=\"false\" id=\"1586945718043_0.5348912434025339\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718044_0.9557637371265271\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">九、法律责任&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718045_0.07086234465255004\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">9.1如果公司发现或收到他人举报或投诉用户违反本协议约定的，公司有权不经通知随时对相关内容，包括但不限于用户资料、聊天记录进行审查、删除，并视情节轻重对违规帐号处以包括但不限于警告、帐号封禁、设备封禁 、功能封禁的处罚，且通知用户处理结果。<mpchecktext contenteditable=\"false\" id=\"1586945718046_0.21794138162582444\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718047_0.9483637619576666\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">9.2用户理解并同意，公司有权依合理判断对违反有关法律法规或本协议规定的行为进行处罚，对违法违规的任何用户采取适当的法律行动，并依据法律法规保存有关信息向有关部门报告等，用户应承担由此而产生的一切法律责任。<mpchecktext contenteditable=\"false\" id=\"1586945718048_0.49987789754854184\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718049_0.18440826331276905\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">9.3用户理解并同意，因用户违反本协议约定，导致或产生的任何第三方主张的任何索赔、要求或损失，包括合理的律师费，用户应当赔偿公司与合作公司、关联公司，并使之免受损害。<mpchecktext contenteditable=\"false\" id=\"1586945718050_0.41306736761997453\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718051_0.277318477844932\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">十、不可抗力及其他免责事由&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718052_0.0753870289992713\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">10.1用户理解并确认，在使用”Shopro商城”软件及相关服务的过程中，可能会遇到不可抗力等风险因素，致使”Shopro商城”软件及相关服务发生中断。<mpchecktext contenteditable=\"false\" id=\"1586945718053_0.2637689217021839\">\r\n    </mpchecktext>不可抗力是指不能预见、不能克服并不能避免且对一方或双方造成重大影响的客观事件，包括但不限于自然灾害如洪水、地震、瘟疫流行和风暴等以及社会事件如战争、动乱、政府行为等。<mpchecktext contenteditable=\"false\" id=\"1586945718054_0.15527814209538904\">\r\n    </mpchecktext>出现上述情况时，公司将努力在第一时间与合作单位配合，及时进行修复，但是由此给用户或第三方造成的损失，公司及合作单位在法律允许的范围内免责。<mpchecktext contenteditable=\"false\" id=\"1586945718055_0.8047947484322415\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718056_0.754669804572069\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">10.2”Shopro商城”软件及相关服务同大多数互联网服务一样，受包括但不限于用户原因、网络服务质量、社会环境等因素的差异影响，可能受到各种安全问题的侵扰，如他人利用用户的资料，造成现实生活中的骚扰；<mpchecktext contenteditable=\"false\" id=\"1586945718059_0.3800951501910297\">\r\n    </mpchecktext>用户下载安装的其它软件或访问的其他网站中含有“木马”等病毒，威胁到用户的计算机信息和数据的安全，继而影响”Shopro商城”软件及相关服务的正常使用等等。<mpchecktext contenteditable=\"false\" id=\"1586945718057_0.29095366844372084\">\r\n    </mpchecktext>用户应加强信息安全及使用者资料的保护意识，要注意加强密码保护，以免遭致损失和骚扰。<mpchecktext contenteditable=\"false\" id=\"1586945718058_0.11154313002708882\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718060_0.33072080156465167\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">10.3用户理解并确认，”Shopro商城”软件及相关服务存在因不可抗力、计算机病毒或黑客攻击、系统不稳定、用户所在位置、用户关机以及其他任何技术、互联网络、通信线路原因等造成的服务中断或不能满足用户要求的风险，因此导致的用户或第三方的任何损失，公司不承担任何责任。<mpchecktext contenteditable=\"false\" id=\"1586945718061_0.4869823797144923\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718062_0.48952213922479215\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">10.4用户理解并确认，在使用”Shopro商城”软件及相关服务过程中存在来自任何他人的包括误导性的、欺骗性的、威胁性的、诽谤性的、令人反感的或非法的信息，或侵犯他人权利的匿名或冒名的信息，以及伴随该等信息的行为，因此导致的用户或第三方的任何损失，公司不承担任何责任。<mpchecktext contenteditable=\"false\" id=\"1586945718063_0.05727530239194856\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718064_0.45981598194057405\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">10.5用户理解并确认，公司需要定期或不定期地对Shopro商城平台或相关的设备进行检修或者维护，如因此类情况而造成服务在合理时间内的中断，公司无需为此承担任何责任，但公司应事先进行通告。<mpchecktext contenteditable=\"false\" id=\"1586945718065_0.3862807871708589\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718066_0.8092398459549501\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">10.6公司依据法律法规、本协议约定获得处理违法违规或违约内容的权利，该权利不构成”Shopro商城”软件及相关服务的义务或承诺，公司不能保证及时发现违法违规或违约行为或进行相应处理。<mpchecktext contenteditable=\"false\" id=\"1586945718067_0.21468229369957026\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718068_0.7670365858425761\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">10.7用户理解并确认，对于公司向用户提供的下列产品或者服务的质量缺陷及其引发的任何损失，公司无需承担任何责任：<mpchecktext contenteditable=\"false\" id=\"1586945718069_0.9201840279724685\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718070_0.6758427036870427\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">10.7.1 公司向用户免费提供的服务；<mpchecktext contenteditable=\"false\" id=\"1586945718071_0.6098040167873355\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718072_0.18196369686698777\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">10.7.2 公司向用户赠送的任何产品或者服务。<mpchecktext contenteditable=\"false\" id=\"1586945718073_0.3243945695047401\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718074_0.2561646127774184\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">10.8在任何情况下，公司均不对任何间接性、后果性、惩罚性、偶然性、特殊性或刑罚性的损害，包括因用户使用”Shopro商城”软件及相关服务而遭受的利润损失，承担责任（即使Shopro商城已被告知该等损失的可能性亦然）。<mpchecktext contenteditable=\"false\" id=\"1586945718075_0.6510688921412782\">\r\n    </mpchecktext>尽管本协议中可能含有相悖的规定，公司对用户承担的全部责任，无论因何原因或何种行为方式，始终不超过用户因使用公司提供的服务而支付给公司的费用(如有)。<mpchecktext contenteditable=\"false\" id=\"1586945718076_0.1121475675858088\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718077_0.6134522143159546\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">十一、服务的变更、中断、终止&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718078_0.731142667389443\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">11.1鉴于网络服务的特殊性，用户同意公司有权随时变更、中断或终止部分或全部的服务（包括收费服务）。<mpchecktext contenteditable=\"false\" id=\"1586945718079_0.7464607475540119\">\r\n    </mpchecktext>公司变更、中断或终止的服务，公司应当在变更、中断或终止之前通知用户，并应向受影响的用户提供等值的替代性的服务；<mpchecktext contenteditable=\"false\" id=\"1586945718081_0.2926972258331706\">\r\n    </mpchecktext>如用户不愿意接受替代性的服务，如果该用户已经向公司支付任何费用，公司应当按照该用户实际使用服务的情况扣除相应的费用之后将剩余费用退还该用户的用户账户中。<mpchecktext contenteditable=\"false\" id=\"1586945718080_0.7489713111584706\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718082_0.30691668193466737\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">11.2如发生下列任何一种情形，公司有权变更、中断或终止向用户提供的免费服务或收费服务，而无需对用户或任何第三方承担任何责任：<mpchecktext contenteditable=\"false\" id=\"1586945718083_0.0059423474473430105\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718084_0.21658414248177849\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">11.2.1 根据法律规定用户应提交真实信息，而用户提供的个人资料不真实、或与注册时信息不一致又未能提供合理证明；<mpchecktext contenteditable=\"false\" id=\"1586945718085_0.33024363335742124\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718086_0.040927459258220944\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">11.2.2用户违反相关法律法规或本协议的约定；<mpchecktext contenteditable=\"false\" id=\"1586945718087_0.8997946645399544\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718088_0.8941594403097326\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">11.2.3 按照法律规定或有权机关的要求；<mpchecktext contenteditable=\"false\" id=\"1586945718089_0.16588999740013088\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718090_0.7358428775045516\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">11.2.4 出于安全的原因或其他必要的情形。<mpchecktext contenteditable=\"false\" id=\"1586945718091_0.7450787018365741\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718092_0.9750471093027926\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">十二、其他&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718093_0.4562759641257117\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">12.1本协议的效力、解释及纠纷的解决，适用于中华人民共和国法律。<mpchecktext contenteditable=\"false\" id=\"1586945718094_0.5159359021454946\">\r\n    </mpchecktext>若本协议之任何规定因与中华人民共和国的法律抵触而无效或不可执行，则这些条款将尽可能按照接近本协议原条文意旨重新解析，且本协议其它规定仍应具有完整的效力及效果。<mpchecktext contenteditable=\"false\" id=\"1586945718095_0.3852790084115234\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718096_0.10456728769598223\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">12.2若用户因本协议与公司发生任何争议或纠纷，双方应尽量友好协商解决；<mpchecktext contenteditable=\"false\" id=\"1586945718098_0.6498143991508649\">\r\n    </mpchecktext>如协商不成的，用户同意应将相关争议提交提交公司所在地有管辖权的人民法院管辖。<mpchecktext contenteditable=\"false\" id=\"1586945718097_0.9725335243029456\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718099_0.3786778740412624\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">12.3为给用户提供更好的服务或国家法律法规、政策调整，”Shopro商城”软件及相关服务将不时更新与变化，公司会适时对本协议进行修订，这些修订构成本协议的一部分。<mpchecktext contenteditable=\"false\" id=\"1586945718100_0.29822379860560955\">\r\n    </mpchecktext>本协议更新后，公司会在“Shopro商城”软件发出更新版本，以便用户及时了解本协议的最新版本。<mpchecktext contenteditable=\"false\" id=\"1586945718101_0.15263939449888553\">\r\n    </mpchecktext>如用户继续使用“Shopro商城”软件及相关服务，表示同意接受修订后的本协议的内容。<mpchecktext contenteditable=\"false\" id=\"1586945718102_0.18087569113218738\">\r\n    </mpchecktext>如用户对修改后的协议条款存有异议的，请立即停止登录或使用“Shopro商城”软件及相关服务。<mpchecktext contenteditable=\"false\" id=\"1586945718103_0.2713047620682163\">\r\n    </mpchecktext>若用户继续登录或使用“Shopro商城”软件及相关服务，即视为用户认可并接受修改后的协议条款。<mpchecktext contenteditable=\"false\" id=\"1586945718104_0.6971645174790961\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718105_0.0727784511046059\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">12.4本协议的任何条款无论因何种原因无效或不具可执行性，其余条款仍有效，对双方具有约束力。<mpchecktext contenteditable=\"false\" id=\"1586945718106_0.5030388981681164\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718107_0.8218117058363112\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">12.5本协议中的标题仅为方便及阅读而设，并不影响本协议中任何规定的含义或解释。<mpchecktext contenteditable=\"false\" id=\"1586945718108_0.425665288401716\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718109_0.732360961800592\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n<p>\r\n  <span style=\"font-size: 14px;\">12.6用户和公司均是独立的主体，在任何情况下本协议不构成公司对用户的任何形式的明示或暗示担保或条件，双方之间亦不构成代理、合伙、合营或雇佣关系。<mpchecktext contenteditable=\"false\" id=\"1586945718110_0.44833310193276654\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718111_0.7630279115044201\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p>\r\n  <br>\r\n</p>\r\n', 1582259738, 1586947013, NULL);
INSERT INTO `fa_shopro_richtext` VALUES (2, '隐私政策', '<p data-mpa-powered-by=\"yiban.io\"><span style=\"font-family: Helvetica; font-size: 14px; letter-spacing: 0px;\">更新日期：</span><mpchecktext contenteditable=\"false\" id=\"1586945718568_0.7794644835108058\" style=\"font-family: Helvetica; font-size: 14px; letter-spacing: 0px;\"></mpchecktext><span style=\"font-family: Helvetica; font-size: 14px; letter-spacing: 0px;\">&nbsp;2020年04月15日</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\"><br></p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">生效日期：<mpchecktext contenteditable=\"false\" id=\"1586945718571_0.9090471727885814\">\r\n    </mpchecktext>&nbsp;2020年04月15日&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718572_0.5708389898832869\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718573_0.08105318907844938\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\"><span style=\"font-family: Helvetica;\">公司深知个人信息对于用户的重要性，公司将按照法律法规的规定，尽力保护用户的个人信息及隐私安全。<mpchecktext contenteditable=\"false\" id=\"1586945718574_0.3466529688505142\">\r\n    </mpchecktext></span>&nbsp;希望用户在使用“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件及相关服务前仔细阅读并确认用户已经充分理解本条款即用户隐私政策（以下简称“隐私政策”）所写明的内容，并让用户可以按照隐私政策的指引做出用户认为适当的选择。<mpchecktext contenteditable=\"false\" id=\"1586945718575_0.4803192871473463\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718576_0.4300874827061736\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718577_0.6110124031679869\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"color: rgb(0, 0, 0); letter-spacing: 0px; font-family: Helvetica;\">隐私政策适用于用户通过公司应用程序、网页、供第三方网站和应用程序使用的</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\"><span style=\"font-family: Helvetica;\">软件开发工具包（</span>SDK）和应用程序编程接口（API）方式来访问和使用“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件及相关服务。<mpchecktext contenteditable=\"false\" id=\"1586945718578_0.4503998166117609\">\r\n    </mpchecktext>&nbsp;当用户使用或开启相关功能或使用服务时，为实现功能、服务所必需，公司会收集、使用相关权限或信息。<mpchecktext contenteditable=\"false\" id=\"1586945718579_0.8080132165917735\">\r\n    </mpchecktext>&nbsp;除非是为实现基本业务功能或根据法律法规要求的必要信息，用户均可以拒绝提供且不影响其他功能或服务。<mpchecktext contenteditable=\"false\" id=\"1586945718580_0.042862977566733296\">\r\n    </mpchecktext>&nbsp;公司将在隐私政策中逐项说明哪些是必要信息。<mpchecktext contenteditable=\"false\" id=\"1586945718581_0.19915186933049833\">\r\n    </mpchecktext>&nbsp;如果用户未登录用户帐号，公司会通过设备对应的标识符信息来保障信息推送的基本功能。<mpchecktext contenteditable=\"false\" id=\"1586945718582_0.43945351639301644\">\r\n    </mpchecktext>&nbsp;如果用户登录了账号，公司会根据账号信息实现信息推送。<mpchecktext contenteditable=\"false\" id=\"1586945718583_0.7927647272756195\">\r\n    </mpchecktext>&nbsp;摄像头、麦克风、通讯录权限等，均不会默认开启，只有经过用户的明示授权才会在为实现特定功能或服务时使用，用户也可以撤回授权。<mpchecktext contenteditable=\"false\" id=\"1586945718584_0.2410774863196501\">\r\n    </mpchecktext>&nbsp;特别需要指出的是，即使经过用户的授权，公司获得了这些敏感权限，也不会在相关功能或服务不需要时而收集用户的信息。<mpchecktext contenteditable=\"false\" id=\"1586945718585_0.23841092470300485\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718586_0.2044580229128501\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718587_0.8567789579010066\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">以下公司将向用户详细介绍公司是如何收集、使用、存储、传输、共享、转让（如适用）与保护个人信息；<mpchecktext contenteditable=\"false\" id=\"1586945718588_0.41399449434809865\">\r\n    </mpchecktext>&nbsp;如何为用户了解查询、访问、删除、更正、撤回授权个人信息的方式。<mpchecktext contenteditable=\"false\" id=\"1586945718589_0.6479072680000384\">\r\n    </mpchecktext>&nbsp;其中，公司对有关用户个人信息权益的重要内容也清晰展示，请特别关注。<mpchecktext contenteditable=\"false\" id=\"1586945718590_0.22689353963344372\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718591_0.00753505441650093\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718592_0.7638130152795586\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">公司如何收集和使用个人信息&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718593_0.9985345890663218\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718594_0.7650068997202926\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">对 Cookie 和同类技术的使用&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718595_0.7830170338190248\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718596_0.7688600790874489\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">公司如何共享、转让、公开披露个人信息&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718597_0.7471792343438568\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718598_0.6280157395353758\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">公司如何存储个人信息&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718599_0.3379574162080392\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718600_0.3041287342109156\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">公司如何保护个人信息的安全&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718601_0.49860768252219545\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718602_0.3285266637793307\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">管理用户的个人信息&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718603_0.4332366312557898\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718604_0.23920011883989756\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">未成年人条款&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718605_0.3242934946036895\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718606_0.47328878523260554\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">隐私政策的修订和通知&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718607_0.24449647438238054\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718608_0.3888904024794868\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">联系公司&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718609_0.9058510935810027\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718610_0.5811671096245523\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">一、公司如何收集和使用个人信息&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718611_0.6899118142840974\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718612_0.8751686533547496\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">公司会按照如下方式收集用户在使用服务时主动提供的，以及通过自动化手段收集用户在使用功能或接受服务过程中产生的信息：<mpchecktext contenteditable=\"false\" id=\"1586945718613_0.7309709692886177\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718614_0.41515161908439424\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718615_0.833471300185018\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.1 注册、登录、认证&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718616_0.45798203821880357\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718617_0.0075881041433727425\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">1.1.1 当用户使用“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件及相关服务时，用户可以通过微信号、手机号来创建用户账号，并且用户可以完善相关的网络身份识别信息（头像、昵称、密码等），收集这些信息是为了帮助用户完成注册。<mpchecktext contenteditable=\"false\" id=\"1586945718618_0.8278102460979111\">\r\n    </mpchecktext>&nbsp;用户还可以根据自身需求选择填写性别、生日、地区及个人介绍填写完善用户的信息。<mpchecktext contenteditable=\"false\" id=\"1586945718619_0.6840981828198933\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718620_0.1804410605601372\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718621_0.05829674749956659\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">1.1.2 用户也可以使用第三方账号登录并使用，用户将授权公司获取用户在第三方平台注册的公开信息（头像、昵称以及用户授权的其他信息），用于与“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">“软件及相关服务的用户账号绑定，使用户可以直接登录并使用本产品和相关服务。<mpchecktext contenteditable=\"false\" id=\"1586945718622_0.991694910921612\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718623_0.7320456841628098\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718624_0.11996666717265403\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.1.3 在用户使用身份认证的功能或服务时，根据相关法律法规，用户可能需要提供用户的真实身份信息（包括但不限于真实姓名、身份证号码及电话号码等）以完成实名验证。<mpchecktext contenteditable=\"false\" id=\"1586945718625_0.6457661392665186\">\r\n    </mpchecktext>&nbsp;这些信息属于个人敏感信息，用户可以拒绝提供，但用户将可能无法获得相关服务，但不影响其他功能与服务的正常使用。<mpchecktext contenteditable=\"false\" id=\"1586945718626_0.4482460566501518\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718627_0.19279178016187926\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718628_0.9033498339618062\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">1.2 关于</span><span style=\"color: rgb(0, 0, 0); letter-spacing: 0px; font-family: 宋体;\">商城</span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718629_0.9740363579498665\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718630_0.6166561263503292\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718631_0.7213976216352087\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">1.2.2公司可能会向用户推荐更感兴趣的</span><span style=\"color: rgb(0, 0, 0); letter-spacing: 0px; font-family: 宋体;\">商品</span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\"><span style=\"font-family: Helvetica;\">，为实现这一功能，公司可能会收集必要的日志信息，包括：<mpchecktext contenteditable=\"false\" id=\"1586945718632_0.9249167189553569\">\r\n    </mpchecktext></span>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718633_0.05791239194814013\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718634_0.09767651328944171\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">（1）用户操作、使用的行为信息：<mpchecktext contenteditable=\"false\" id=\"1586945718635_0.34869066559220263\">\r\n    </mpchecktext>&nbsp;点击、收藏、标记、搜索、浏览、分享；<mpchecktext contenteditable=\"false\" id=\"1586945718636_0.2007437288435321\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718637_0.8981463386678887\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718638_0.1515942738652809\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">（2）用户主动提供的信息：<mpchecktext contenteditable=\"false\" id=\"1586945718639_0.07285092096606682\">\r\n    </mpchecktext>&nbsp;反馈、点赞、评论；<mpchecktext contenteditable=\"false\" id=\"1586945718640_0.03215160794881933\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718641_0.6915131414321092\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718642_0.22547501349788912\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">（3）地理位置信息：<mpchecktext contenteditable=\"false\" id=\"1586945718644_0.7255390736125065\">\r\n    </mpchecktext>GPS信息、WLAN接入点、蓝牙和基站等传感器信息。<mpchecktext contenteditable=\"false\" id=\"1586945718643_0.37727509819325045\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718645_0.05834839855096874\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718646_0.21073919656985218\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.2.3公司收集、使用的上述信息进行了去标识化处理，数据分析仅对应特定的、无法直接关联用户身份的编码，不会与用户的真实身份相关联。<mpchecktext contenteditable=\"false\" id=\"1586945718647_0.3910781587497181\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718648_0.853719776212488\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718649_0.9175745642108273\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">1.2.4 公司为向用户提供“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件及相关服务中的商品、服务、奖品、奖励金，将向用户收集必要的相关用户个人信息，包括但不限于姓名、联系电话、微信号、订单信息、支付状态信息。<mpchecktext contenteditable=\"false\" id=\"1586945718650_0.4829811210801518\">\r\n    </mpchecktext>&nbsp;如果缺少相关信息，公司将无法为用户提供前述商品、服务、奖品、奖励金。<mpchecktext contenteditable=\"false\" id=\"1586945718651_0.04409999867658376\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718652_0.13184920753408447\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718653_0.6424942682213679\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">1.2.5 如用户在”</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”的软件及相关服务中其他用户可见的公开区域内上传或发布的信息中、用户对其他人上传或发布的信息作出的回应中公开用户的信息，该等信息可能会被他人收集并加以使用。<mpchecktext contenteditable=\"false\" id=\"1586945718654_0.11443455188697604\">\r\n    </mpchecktext>&nbsp;当用户发现他人不正当地收集或使用用户的信息时，可通过隐私政策中的“联系公司”条款所列的反馈渠道联系公司。<mpchecktext contenteditable=\"false\" id=\"1586945718655_0.0743631917143821\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718656_0.06841160345636488\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718657_0.7968108399978868\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.3 信息发布和产品分享&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718658_0.18029426986874797\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718659_0.06297289848322007\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.3.1用户发布评论时，公司将收集用户发布的信息，并展示用户的昵称、头像、发布内容。<mpchecktext contenteditable=\"false\" id=\"1586945718660_0.028415110659064213\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718661_0.9916322131236646\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718662_0.6423813546694703\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">1.3.2 ”</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件及相关服务中部分单项服务可能需要用户在用户的设备中开启特定的访问权限（例如用户的位置信息 、摄像头、相册、麦克风、发送短信、通讯录及/或日历、振动、红点标记提醒等），以实现这些权限所涉及信息的收集和使用。<mpchecktext contenteditable=\"false\" id=\"1586945718663_0.31109584404356183\">\r\n    </mpchecktext>&nbsp;用户如果拒绝授权提供，将无法使用此功能，但不影响用户正常使用”</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件及相关服务的其他功能。<mpchecktext contenteditable=\"false\" id=\"1586945718664_0.34407695558542195\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718665_0.5092696649551531\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718666_0.3846031093255975\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">1.3.3 用户因使用“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件及相关服务而被公司收集的信息，例如其他用户发布的信息中可能含有用户的部分信息（如：<mpchecktext contenteditable=\"false\" id=\"1586945718667_0.3324497589805675\">\r\n    </mpchecktext>&nbsp;在评论、留言、发布</span><span style=\"color: rgb(0, 0, 0); letter-spacing: 0px; font-family: 宋体;\">等</span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\"><span style=\"font-family: Helvetica;\">涉及到与用户相关的信息）。<mpchecktext contenteditable=\"false\" id=\"1586945718668_0.7136679300399373\">\r\n    </mpchecktext></span>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718669_0.9067984873147417\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718670_0.08057848093795128\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">1.3.4当用户将“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件及相关服务分享给用户的好友，涉及到使用群发邀请功能时，公司需要获取用户的联系人权限，通过调用通讯录权限完成群发，但是该权限不会默认打开，并且必须在用户授权同意下才会获取或调用。<mpchecktext contenteditable=\"false\" id=\"1586945718671_0.4504064991171066\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718672_0.5176465378196271\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718673_0.41701669852827283\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.4 搜索&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718674_0.9079635172199387\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718675_0.041017357350108696\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">用户使用公司的搜索服务时，公司会收集用户的搜索关键字信息、日志记录。<mpchecktext contenteditable=\"false\" id=\"1586945718676_0.5691897213806278\">\r\n    </mpchecktext>&nbsp;为了提供高效的搜索服务，部分前述信息会暂时存储在用户的本地存储设备之中，并可向用户展示搜索结果内容、搜索历史记录。<mpchecktext contenteditable=\"false\" id=\"1586945718677_0.7501738496309753\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718678_0.7146674279526297\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718679_0.8778707488728301\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.5 安全运行&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718680_0.3757834688206114\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718681_0.24918338622456115\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.5.1 安全保障功能&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718682_0.2514244465352735\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718683_0.5219386788282592\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">公司致力于为用户提供安全、可信的产品与使用环境，提供优质而可靠的服务是公司的核心目标。<mpchecktext contenteditable=\"false\" id=\"1586945718684_0.5594717613302549\">\r\n    </mpchecktext>&nbsp;为实现安全保障功能所收集的信息是必要信息。<mpchecktext contenteditable=\"false\" id=\"1586945718685_0.8223850541464346\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718686_0.35807133004146685\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718687_0.6492026071630574\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.5.2 设备信息与日志信息&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718688_0.2981056802826587\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718689_0.1900622671330272\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">(1) 为了保障软件与服务的安全运行，公司会收集用户的设备相关信息（包括但不限于硬件型号、客户端版本、操作系统版本号、国际移动设备识别码、唯一设备标识符、网络设备硬件地址、IP 地址、WLAN接入点、基站、软件版本号、网络接入方式、类型、状态、网络质量数据、操作、使用、服务日志、设备开启、设备唤醒），设备所在位置相关信息（包括但不限于GPS位置以及能够提供相关信息的WLAN接入点、蓝牙和基站传感器信息）。<mpchecktext contenteditable=\"false\" id=\"1586945718690_0.20049319996247772\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718691_0.9312869441219944\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718692_0.4745791723348447\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">(2) 为了预防恶意程序及安全运营所必需，公司可能会收集手机内安装的应用信息或正在运行的进程信息、应用程序的总体运行、使用情况与频率、应用崩溃情况、总体安装使用情况、性能数据或应用来源。<mpchecktext contenteditable=\"false\" id=\"1586945718693_0.1625456505172138\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718694_0.18593674873993882\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718695_0.2883638515325946\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">(3) 公司以及公司的关联公司、合作方在获得用户授权的前提下，可能使用用户的账户信息、设备信息、服务日志信息或依法可以共享的信息，用于判断账户安全、进行身份验证、检测及防范安全事件。<mpchecktext contenteditable=\"false\" id=\"1586945718696_0.16988388319086156\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718697_0.06358759985735474\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718698_0.27668386601380557\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.6 其他&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718699_0.4055937758081649\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718700_0.803161373645408\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.6.1 当用户使用公司的增值服务以提升用户体验时，公司可能会留存用户的充值或购买记录，以确保相关交易的可追溯性和安全性；<mpchecktext contenteditable=\"false\" id=\"1586945718702_0.6043291720819097\">\r\n    </mpchecktext>&nbsp;但是，公司不会因此而收集或存储用户的银行卡信息或身份认证信息。<mpchecktext contenteditable=\"false\" id=\"1586945718701_0.8129960868679003\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718703_0.5447967955301114\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718704_0.7839338599832784\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.6.2 当用户与公司联系时，公司可能会保存用户的通信/通话记录和内容或用户留下的联系方式等信息，以便与用户联系或帮助用户解决问题，或记录相关问题的处理方案及结果。<mpchecktext contenteditable=\"false\" id=\"1586945718705_0.11664228048956682\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718706_0.09843573544793682\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718707_0.9048533305961297\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">1.6.3 “</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件需要在有网络的情况下进行使用，若当前无法连接网络，软件将尝试通过断开WLAN网络，然后重连的方式恢复软件使用。<mpchecktext contenteditable=\"false\" id=\"1586945718708_0.7786276609462657\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718709_0.8872970062468999\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718710_0.5855530135288416\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718711_0.0327011936388526\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.7 收集、使用个人信息目的变更&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718712_0.43193041680823274\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718713_0.6966743267056172\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\"><span style=\"font-family: Helvetica;\">请用户了解，随着公司业务的发展，可能会对</span>“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">“软件的功能和提供的服务有所调整变化。<mpchecktext contenteditable=\"false\" id=\"1586945718714_0.3374903847841968\">\r\n    </mpchecktext>&nbsp;原则上，当“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">“软件的新功能或服务与公司当前提供的功能或服务相关时，收集与使用的个人信息将与原处理目的具有直接或合理关联。<mpchecktext contenteditable=\"false\" id=\"1586945718715_0.4591922246347022\">\r\n    </mpchecktext>&nbsp;在与原处理目的无直接或合理关联的场景下，公司收集、使用用户的个人信息，会再次进行告知，并征得用户的同意。<mpchecktext contenteditable=\"false\" id=\"1586945718716_0.5731230607788882\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718717_0.4143453301645996\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718718_0.748488816996902\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.8依法豁免征得同意收集和使用的个人信息&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718719_0.705851719359371\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718720_0.6123618594974605\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">请用户理解，在下列情形中，根据法律法规及相关国家标准，公司收集和使用用户的个人信息无需征得用户的授权同意：<mpchecktext contenteditable=\"false\" id=\"1586945718721_0.8278357962191336\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718722_0.2876472503664007\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718723_0.6779039165796421\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.8.1与国家安全、国防安全直接相关的；<mpchecktext contenteditable=\"false\" id=\"1586945718724_0.35903283942341435\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718725_0.914717449006446\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718726_0.6707759026701272\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.8.2与公共安全、公共卫生、重大公共利益直接相关的；<mpchecktext contenteditable=\"false\" id=\"1586945718727_0.3941873486405898\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718728_0.7622895298909627\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718729_0.7620813124150294\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.8.3与犯罪侦查、起诉、审判和判决执行等直接相关的；<mpchecktext contenteditable=\"false\" id=\"1586945718730_0.016302229892580566\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718731_0.23379707191245291\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718732_0.43512658056368014\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.8.4出于维护个人信息主体或其他个人的生命、财产等重大合法权益但又很难得到本人同意的；<mpchecktext contenteditable=\"false\" id=\"1586945718733_0.07709899871136061\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718734_0.11415986804260925\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718735_0.2880248163104362\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.8.5所收集的用户的个人信息是用户自行向社会公众公开的；<mpchecktext contenteditable=\"false\" id=\"1586945718736_0.9224517013199958\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718737_0.5113558952987152\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718738_0.98634011405566\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.8.6从合法公开披露的信息中收集的用户的个人信息的，如合法的新闻报道、政府信息公开等渠道；<mpchecktext contenteditable=\"false\" id=\"1586945718739_0.9641054312948216\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718740_0.6398119523762948\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718741_0.8301635391555486\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.8.7根据用户的要求签订或履行合同所必需的；<mpchecktext contenteditable=\"false\" id=\"1586945718742_0.6014696279143841\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718743_0.8084887878599805\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718744_0.5396624641281051\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.8.8用于维护软件及相关服务的安全稳定运行所必需的，例如发现、处置软件及相关服务的故障；<mpchecktext contenteditable=\"false\" id=\"1586945718745_0.9419974936041882\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718746_0.23676684853322083\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718747_0.744801336465271\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.8.9为合法的新闻报道所必需的；<mpchecktext contenteditable=\"false\" id=\"1586945718748_0.31669173536187833\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718749_0.4734014973680134\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718750_0.1970508221194982\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.8.10学术研究机构基于公共利益开展统计或学术研究所必要，且对外提供学术研究或描述的结果时，对结果中所包含的个人信息进行去标识化处理的；<mpchecktext contenteditable=\"false\" id=\"1586945718751_0.924626190195937\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718752_0.9332355485190096\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718753_0.9092874427365552\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">1.8.11法律法规规定的其他情形。<mpchecktext contenteditable=\"false\" id=\"1586945718754_0.11286686826736081\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718755_0.7526428067050976\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718756_0.4507778506661453\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">特别提示用户注意，如信息无法单独或结合其他信息识别到用户的个人身份，其不属于法律意义上用户的个人信息；<mpchecktext contenteditable=\"false\" id=\"1586945718757_0.6123759965701796\">\r\n    </mpchecktext>&nbsp;当用户的信息可以单独或结合其他信息识别到用户的个人身份时或公司将无法与任何特定个人信息建立联系的数据与其他用户的个人信息结合使用时，这些信息在结合使用期间，将作为用户的个人信息按照隐私政策处理与保护。<mpchecktext contenteditable=\"false\" id=\"1586945718758_0.6400729773907046\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718759_0.6286743431986419\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718760_0.5863347748256102\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">二、对 Cookie 和同类技术的使用&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718761_0.10608603701015151\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718762_0.9319907890836217\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">Cookie 和同类技术是互联网中普遍使用的技术。<mpchecktext contenteditable=\"false\" id=\"1586945718763_0.9882410807833992\">\r\n    </mpchecktext>&nbsp;当用户使用”</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件及相关服务时，公司可能会使用相关技术向用户的设备发送一个或多个 Cookie 或匿名标识符，以收集和存储用户访问、使用本产品时的信息。<mpchecktext contenteditable=\"false\" id=\"1586945718764_0.34880176704739996\">\r\n    </mpchecktext>&nbsp;公司承诺，不会将 Cookie 用于隐私政策所述目的之外的任何其他用途。<mpchecktext contenteditable=\"false\" id=\"1586945718765_0.04149981549134241\">\r\n    </mpchecktext>&nbsp;公司使用 Cookie 和同类技术主要为了实现以下功能或服务：<mpchecktext contenteditable=\"false\" id=\"1586945718766_0.7798679566220488\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718767_0.2399885581495711\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718768_0.2568641579913078\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">2.1 保障产品与服务的安全、高效运转&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718769_0.30320277120465766\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718770_0.5977047185228912\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">公司可能会设置认证与保障安全性的 Cookie 或匿名标识符，使公司确认用户是否安全登录服务，或者是否遇到盗用、欺诈及其他不法行为。<mpchecktext contenteditable=\"false\" id=\"1586945718771_0.7604054315963469\">\r\n    </mpchecktext>&nbsp;这些技术还会帮助公司改进服务效率，提升登录和响应速度。<mpchecktext contenteditable=\"false\" id=\"1586945718772_0.18102556000916104\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718773_0.35866877026205546\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718774_0.28297606015828447\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">2.2 帮助用户获得更轻松的访问体验&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718775_0.10639632149180578\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718776_0.7400989449722748\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">使用此类技术可以帮助用户省去重复用户填写个人信息、输入搜索内容的步骤和流程（示例：<mpchecktext contenteditable=\"false\" id=\"1586945718777_0.6649186669157732\">\r\n    </mpchecktext>&nbsp;记录搜索）。<mpchecktext contenteditable=\"false\" id=\"1586945718778_0.6475277778434443\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718779_0.8851919087602869\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718780_0.08561936891882405\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">2.3为用户推荐、展示、推送用户可能感兴趣的内容&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718781_0.8205485518552289\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718782_0.4547477604617447\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">2.3.1公司可能会利用 Cookie 和同类技术了解用户的偏好和使用习惯，进行数据分析，以改善产品服务、推荐用户感兴趣的信息或功能，并优化用户对广告的选择。<mpchecktext contenteditable=\"false\" id=\"1586945718783_0.10197588638110822\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718784_0.1564456552690363\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718785_0.71377498129398\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">2.3.1在“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件的分享页中，公司可能会使用cookie对浏览活动进行记录，用于向用户推荐信息和排查崩溃、延迟的相关异常情况以及探索更好的服务方式。<mpchecktext contenteditable=\"false\" id=\"1586945718786_0.7815843031867213\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718787_0.26929893827199214\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718788_0.5513378389897718\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">2.4 Cookie的清除&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718789_0.9515236887452174\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718790_0.3821474459966876\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\"><span style=\"font-family: Helvetica;\">大多数浏览器均为用户提供了清除浏览器缓存数据的功能，用户可以在浏览器设置功能中进行相应的数据清除操作；<mpchecktext contenteditable=\"false\" id=\"1586945718791_0.055573178675603296\">\r\n    </mpchecktext></span>&nbsp;对于“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件，如需清除Cookie，用户需要卸载“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件。<mpchecktext contenteditable=\"false\" id=\"1586945718792_0.2733600335572719\">\r\n    </mpchecktext>&nbsp;如用户进行清除，用户可能无法使用依赖于Cookie由公司提供的服务或相应功能。<mpchecktext contenteditable=\"false\" id=\"1586945718793_0.05489948662061339\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718794_0.2351153454649888\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718795_0.6156689746440105\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">三、公司如何共享、转让、公开披露个人信息&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718796_0.4784600566216919\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718797_0.4814786448305044\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.1共享&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718798_0.4393421938999531\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718799_0.6991102368382596\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.1.1共享原则&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718800_0.8604530239365342\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718801_0.18268981598283052\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">(1) 授权同意原则：<mpchecktext contenteditable=\"false\" id=\"1586945718804_0.1759913946342353\">\r\n    </mpchecktext>&nbsp;向公司的关联方或其他第三方共享用户的个人信息，需经过用户的授权同意，除非共享的个人信息是去标识化处理后的信息，且公司的关联方或其他第三方无法重新识别此类信息的自然人主体。<mpchecktext contenteditable=\"false\" id=\"1586945718802_0.9175619000585282\">\r\n    </mpchecktext>&nbsp;如果关联方或其他第三方使用信息的目的超越原授权同意范围，他们需要重新征得用户的同意。<mpchecktext contenteditable=\"false\" id=\"1586945718803_0.08499918220962299\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718805_0.4559498189309532\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718806_0.47906913005965435\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">(2) 合法正当与最小必要原则：<mpchecktext contenteditable=\"false\" id=\"1586945718808_0.03288859243921771\">\r\n    </mpchecktext>&nbsp;向关联方或其他第三方共享的数据必须具有合法正当目的，且共享的数据以达成目的必要为限。<mpchecktext contenteditable=\"false\" id=\"1586945718807_0.940298914287355\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718809_0.9313579903410465\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718810_0.9481318093579476\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">(3) 安全审慎原则：<mpchecktext contenteditable=\"false\" id=\"1586945718813_0.17626813830106625\">\r\n    </mpchecktext>&nbsp;公司将审慎评估关联方或其他第三方数据使用共享信息的目的，对这些合作方的安全保障能力进行综合评估，并要求其遵循合作法律协议。<mpchecktext contenteditable=\"false\" id=\"1586945718811_0.4767777206646613\">\r\n    </mpchecktext>&nbsp;公司会对合作方获取信息的软件工具开发包（SDK）、应用程序接口（API）进行严格的安全监测，以保护数据安全。<mpchecktext contenteditable=\"false\" id=\"1586945718812_0.030211753702017452\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718814_0.0991760733442284\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718815_0.6859178076923043\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">(4) 公司不会与公司的关联方或其他第三方共享用户的个人信息，但以下情况除外：<mpchecktext contenteditable=\"false\" id=\"1586945718816_0.17977447481505626\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718817_0.7544269863276174\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718818_0.42736329443671317\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">（a）在法律法规允许的范围内，为维护公司、公司的关联方或合作伙伴、用户或其他用户或社会公众利益、财产或安全免遭损害而有必要提供；<mpchecktext contenteditable=\"false\" id=\"1586945718819_0.4847321509686122\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718820_0.5591649554365727\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718821_0.5154916573177644\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">（b）应用户需求为用户处理用户与他人的纠纷或争议；<mpchecktext contenteditable=\"false\" id=\"1586945718822_0.660335260373478\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718823_0.5134853914190363\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718824_0.9257724017498001\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">（c）基于学术研究而使用；<mpchecktext contenteditable=\"false\" id=\"1586945718825_0.7207350540239512\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718826_0.27482355486336063\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718827_0.34959538637425935\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">（d）基于符合法律法规的社会公共利益而使用。<mpchecktext contenteditable=\"false\" id=\"1586945718828_0.11207568812314794\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718829_0.7986319706486478\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718830_0.8506827396448338\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.1.2 实现功能或服务的共享信息&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718831_0.13623812391227474\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718832_0.5505877099166485\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">(1) 当用户在使用“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件中由公司的关联方或其他第三方提供的功能，或者当软件服务提供商、智能设备提供商、系统服务提供商与公司联合为用户提供服务时公司会将去标识化后的个人信息与这些关联方或其他第三方共享，进行综合统计并通过算法做特征与偏好分析，形成间接人群画像，用以向用户进行推荐、展示或推送用户可能感兴趣的信息，或者推送更适合用户的特定功能、服务。<mpchecktext contenteditable=\"false\" id=\"1586945718833_0.3088267897778849\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718834_0.25784462783201256\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718835_0.7453672531359756\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">(2) 支付及收款功能：<mpchecktext contenteditable=\"false\" id=\"1586945718839_0.011420540667769652\">\r\n    </mpchecktext>&nbsp;支付和收款功能由与公司合作的第三方支付机构向用户提供服务。<mpchecktext contenteditable=\"false\" id=\"1586945718836_0.9844831232131819\">\r\n    </mpchecktext>&nbsp;第三方支付机构可能需要收集用户的姓名、微信账号信息、银行卡类型及卡号、有效期及手机号码。<mpchecktext contenteditable=\"false\" id=\"1586945718837_0.8960772341561485\">\r\n    </mpchecktext>&nbsp;银行卡号、有效期及手机号码是个人敏感信息，这些信息是支付和收款功能所必需的信息，拒绝提供将导致用户无法使用该功能，但不影响其他功能的正常使用。<mpchecktext contenteditable=\"false\" id=\"1586945718838_0.5932124325746517\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718840_0.2641026781288984\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718841_0.1738286530315294\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.1.3 实现安全与分析统计的共享信息&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718842_0.07539170808895812\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718843_0.5803889834070799\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">（1）保障使用安全：<mpchecktext contenteditable=\"false\" id=\"1586945718845_0.08479969416218536\">\r\n    </mpchecktext>&nbsp;公司非常重视账号与服务安全，为保障用户和其他用户的用户帐号与财产安全，使用户和公司的正当合法权益免受不法侵害，公司和公司的关联公司或其他服务提供商可能会共享必要的设备、账号及日志信息。<mpchecktext contenteditable=\"false\" id=\"1586945718844_0.8972261410242384\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718846_0.9810932926727964\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718847_0.7791242794651791\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">（2）分析产品使用情况：<mpchecktext contenteditable=\"false\" id=\"1586945718849_0.9495116019849414\">\r\n    </mpchecktext>&nbsp;为分析公司服务的使用情况，提升用户使用的体验，可能会与关联方或第三方共享产品使用情况（崩溃、闪退）的统计性数据，这些数据难以与其他信息结合识别用户的个人身份。<mpchecktext contenteditable=\"false\" id=\"1586945718848_0.6669752108330402\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718850_0.5121928279748948\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718851_0.11817043195414412\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">（3）改进网站功能和服务：<mpchecktext contenteditable=\"false\" id=\"1586945718856_0.34048166950914616\">\r\n    </mpchecktext>&nbsp;我们使用Google Analytics，一项由谷歌公司（“谷歌”）提供的网页分析服务。<mpchecktext contenteditable=\"false\" id=\"1586945718852_0.4385312707684086\">\r\n    </mpchecktext>Google Analytics使用信息记录程序（cookies）帮助我们分析用户对网站的使用以此来编辑网站活跃性报告并提供其他与网站活跃性和互联网应用相关的服务。<mpchecktext contenteditable=\"false\" id=\"1586945718853_0.3750943010780219\">\r\n    </mpchecktext>&nbsp;我们将用此等信息改进网站功能和服务。<mpchecktext contenteditable=\"false\" id=\"1586945718854_0.6129044949247833\">\r\n    </mpchecktext>Google Analytics会收集第一方 Cookie、与设备/浏览器有关的数据、IP 地址以及用户在网站/应用中的活动，以衡量用户与使用 Google Analytics的网站和/或应用进行的互动情况并报告相关统计信息。<mpchecktext contenteditable=\"false\" id=\"1586945718855_0.5409007624719473\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718857_0.8792343420288422\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718858_0.69847440950103\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.1.4 帮助用户参加营销推广活动&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718859_0.6501340818172021\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718860_0.5128105394097751\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">当用户选择参加公司、公司的关联方或其他第三方举办的有关营销活动时，可能需要用户提供姓名、通信地址、联系方式、微信账号、银行账号信息。<mpchecktext contenteditable=\"false\" id=\"1586945718861_0.7418014522663956\">\r\n    </mpchecktext>&nbsp;这些信息是敏感个人信息， 拒绝提供可能会影响用户参加相关活动，但不会影响其他功能。<mpchecktext contenteditable=\"false\" id=\"1586945718862_0.439727581195015\">\r\n    </mpchecktext>&nbsp;只有经过用户的同意，公司才会将这些信息与公司的关联方或第三方共享，以保障用户在联合活动中获得体验一致的服务，或委托第三方及时向用户兑现奖励。<mpchecktext contenteditable=\"false\" id=\"1586945718863_0.5860945412375977\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718864_0.5755330872742068\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718865_0.7302837072342474\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.2 转让&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718866_0.4817749648072136\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718867_0.2404988986517147\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.2.1公司不会转让用户的个人信息给任何其他第三方，除非征得用户的明确同意。<mpchecktext contenteditable=\"false\" id=\"1586945718868_0.5145269359871187\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718869_0.9387516148763513\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718870_0.646806816801639\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.2.2随着公司业务的持续发展，公司将有可能进行合并、收购、资产转让，用户的个人信息有可能因此而被转移。<mpchecktext contenteditable=\"false\" id=\"1586945718871_0.7342418349294926\">\r\n    </mpchecktext>&nbsp;在发生前述变更时，公司将按照法律法规及不低于隐私政策所载明的安全标准要求继受方保护用户的个人信息，否则公司将要求继受方重新征得用户的授权同意。<mpchecktext contenteditable=\"false\" id=\"1586945718872_0.7048115330052\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718873_0.941191434584074\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718874_0.9200253109912175\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.3 披露&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718875_0.265748426083914\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718876_0.01046701387430038\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.3.1 公司不会公开披露用户的信息，除非遵循国家法律法规规定或者获得用户的同意。<mpchecktext contenteditable=\"false\" id=\"1586945718877_0.812482301777135\">\r\n    </mpchecktext>&nbsp;公司公开披露用户的个人信息会采用符合行业内标准的安全保护措施。<mpchecktext contenteditable=\"false\" id=\"1586945718878_0.8942191795082017\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718879_0.30675296744824876\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718880_0.32231676249623065\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.3.2 对违规账号、欺诈行为进行处罚公告时，公司会披露相关账号的信息。<mpchecktext contenteditable=\"false\" id=\"1586945718881_0.6421912575072948\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718882_0.004655601913523766\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718883_0.3386579940816026\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.3.3当用户授权游戏或小程序后，用户和好友的头像、昵称将会在排名及相关功能中展示。<mpchecktext contenteditable=\"false\" id=\"1586945718884_0.2582825522944434\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718885_0.5096002327512044\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718886_0.9796973739993673\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.4 依法豁免征得同意共享、转让、公开披露的个人信息&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718887_0.7147344119161021\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718888_0.8002344970185138\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">请用户理解，在下列情形中，根据法律法规及国家标准，公司共享、转让、公开披露用户的个人信息无需征得用户的授权同意：<mpchecktext contenteditable=\"false\" id=\"1586945718889_0.6578398730142829\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718890_0.8719942251030632\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718891_0.5082609603676547\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.4.1与国家安全、国防安全直接相关的；<mpchecktext contenteditable=\"false\" id=\"1586945718892_0.19632964553039\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718893_0.4860696551342907\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718894_0.2566380573526339\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.4.2与公共安全、公共卫生、重大公共利益直接相关的；<mpchecktext contenteditable=\"false\" id=\"1586945718895_0.2838546584656254\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718896_0.5910921833864173\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718897_0.4254256128692575\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.4.3根据适用的法律法规、法律程序的要求、强制性的行政或司法要求所必须的情况进行提供的；<mpchecktext contenteditable=\"false\" id=\"1586945718898_0.6129912619178648\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718899_0.44677859656100716\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718900_0.05184148428434776\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.4.4 出于维护用户或其他个人的生命、财产等重大合法权益但又很难得到本人同意的；<mpchecktext contenteditable=\"false\" id=\"1586945718901_0.8179311371763875\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718902_0.3597097993825551\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718903_0.14218040233339213\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.4.5用户自行向社会公众公开或事先获得用户明确的同意或授权的个人信息；<mpchecktext contenteditable=\"false\" id=\"1586945718904_0.8537098928292801\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718905_0.12285278812200717\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718906_0.5208337608105678\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.4.6从合法公开披露的信息中收集个人信息的，如合法的新闻报道、政府信息公开等渠道；<mpchecktext contenteditable=\"false\" id=\"1586945718907_0.3650064204545769\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718908_0.4455799656965975\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718909_0.9407207815448599\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">3.4.7符合与用户签署的相关协议（包括在线签署的电子协议以及相应的平台规则）或其他的法律文件约定所提供。<mpchecktext contenteditable=\"false\" id=\"1586945718910_0.8888882851697093\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718911_0.1426465771388088\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718912_0.2943461594703949\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">四、公司如何存储个人信息&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718913_0.490289219825333\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718914_0.1708300250507082\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">4.1 存储地点&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718915_0.9261866487261619\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718916_0.15718518877883958\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">公司依照法律法规的规定，将在境内运营过程中收集和产生的用户的个人信息存储于中华人民共和国境内。<mpchecktext contenteditable=\"false\" id=\"1586945718917_0.8360790103597258\">\r\n    </mpchecktext>&nbsp;目前，公司不会将上述信息传输至境外，如果公司向境外传输，公司将会遵循相关国家规定或者征求用户的同意。<mpchecktext contenteditable=\"false\" id=\"1586945718918_0.603800701280975\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718919_0.4253401907496279\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718920_0.5296562248372629\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">4.2 存储期限&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718921_0.41626411764565474\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718922_0.3434952175757504\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\"><span style=\"font-family: Helvetica;\">公司仅在为提供</span>“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件及服务之目的所必需的期间内保留用户的个人信息：<mpchecktext contenteditable=\"false\" id=\"1586945718925_0.37393685480838545\">\r\n    </mpchecktext>&nbsp;用户发布的信息、评论等相关信息，在用户未撤回、删除或未注销账号期间，公司会进行保留。<mpchecktext contenteditable=\"false\" id=\"1586945718923_0.07109560784789792\">\r\n    </mpchecktext>&nbsp;超出必要期限后，公司将对用户的个人信息进行删除或匿名化处理，但法律法规另有规定的除外。<mpchecktext contenteditable=\"false\" id=\"1586945718924_0.9867640404275781\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718926_0.07985636188804057\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718927_0.6486601744647245\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">五、公司如何保护个人信息的安全&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718928_0.09204395391777287\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718929_0.7431135250413821\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">5.1 公司非常重视用户个人信息的安全，将努力采取合理的安全措施（包括技术方面和管理方面）来保护用户的个人信息，防止用户提供的个人信息被不当使用或未经授权的情况下被访问、公开披露、使用、修改、损坏、丢失或泄漏。<mpchecktext contenteditable=\"false\" id=\"1586945718930_0.5302571272809184\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718931_0.13378537992958117\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718932_0.03314717765383057\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">5.2公司会使用不低于行业同行的加密技术、匿名化处理及相关合理可行的手段保护用户的个人信息，并使用安全保护机制防止用户的个人信息遭到恶意攻击。<mpchecktext contenteditable=\"false\" id=\"1586945718933_0.021964095469130474\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718934_0.5655732886703702\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718935_0.7590406346247338\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">5.3公司会建立专门的安全部门、安全管理制度、数据安全流程保障用户的个人信息安全。<mpchecktext contenteditable=\"false\" id=\"1586945718936_0.13686256928542684\">\r\n    </mpchecktext>&nbsp;公司采取严格的数据使用和访问制度，确保只有授权人员才可访问用户的个人信息，并适时对数据和技术进行安全审计。<mpchecktext contenteditable=\"false\" id=\"1586945718937_0.8431744829343337\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718938_0.07532666977889657\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718939_0.7044251490288291\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">5.4 尽管已经采取了上述合理有效措施，并已经遵守了相关法律规定要求的标准，但请用户理解，由于技术的限制以及可能存在的各种恶意手段，在互联网行业，即便竭尽所能加强安全措施，也不可能始终保证信息百分之百的安全，公司将尽力确保用户提供给公司的个人信息的安全性。<mpchecktext contenteditable=\"false\" id=\"1586945718940_0.048400481926406114\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718941_0.45459017732096774\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718942_0.9214499685474915\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">5.5用户知悉并理解，用户接入公司的服务所用的系统和通讯网络，有可能因公司可控范围外的因素而出现问题。<mpchecktext contenteditable=\"false\" id=\"1586945718943_0.47979425142628807\">\r\n    </mpchecktext>&nbsp;因此，公司强烈建议用户采取积极措施保护个人信息的安全，包括但不限于使用复杂密码、定期修改密码、不将用户帐号的密码及相关个人信息透露给他人。<mpchecktext contenteditable=\"false\" id=\"1586945718944_0.6455767398931727\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718945_0.9323410025004231\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718946_0.27530878938121606\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">5.6公司会制定应急处理预案，并在发生用户信息安全事件时立即启动应急预案，努力阻止这些安全事件的影响和后果扩大。<mpchecktext contenteditable=\"false\" id=\"1586945718947_0.8018006797712494\">\r\n    </mpchecktext>&nbsp;一旦发生用户信息安全事件（泄露、丢失）后，公司将按照法律法规的要求，及时向用户告知：<mpchecktext contenteditable=\"false\" id=\"1586945718951_0.45886100360600435\">\r\n    </mpchecktext>&nbsp;安全事件的基本情况和可能的影响、公司已经采取或将要采取的处置措施、用户可自主防范和降低风险的建议、对用户的补救措施。<mpchecktext contenteditable=\"false\" id=\"1586945718948_0.6896441260845301\">\r\n    </mpchecktext>&nbsp;公司将及时将事件相关情况以推送通知、邮件、信函、短信及相关形式告知用户，难以逐一告知时，公司会采取合理、有效的方式发布公告。<mpchecktext contenteditable=\"false\" id=\"1586945718949_0.5735084931930481\">\r\n    </mpchecktext>&nbsp;同时，公司还将按照相关监管部门要求，上报用户信息安全事件的处置情况。<mpchecktext contenteditable=\"false\" id=\"1586945718950_0.9465987459001113\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718952_0.3479167065578659\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718953_0.44087521579762545\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">5.7用户一旦离开“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件及相关服务，浏览或使用其他软件、服务及内容资源，公司将没有能力和直接义务保护用户在”</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件及相关服务之外的软件、网站提交的任何个人信息，无论用户登录、浏览或使用上述软件、网站是否基于“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件的链接或引导。<mpchecktext contenteditable=\"false\" id=\"1586945718954_0.2593385482472652\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718955_0.8526046168942893\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718956_0.3744137026252947\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">六、管理用户的个人信息&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718957_0.21361526250785712\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718958_0.8670093661685967\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">公司非常重视用户对个人信息的管理，并尽全力保护用户对于用户个人信息的查询、访问、修改、删除、撤回同意授权、注销账号、投诉举报以及设置隐私功能的相关权利，以使用户有能力保障用户的隐私和信息安全。<mpchecktext contenteditable=\"false\" id=\"1586945718959_0.791295663353607\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718960_0.9400584584830751\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718961_0.8251740825571081\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">6.1 改变或撤回授权范围&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718962_0.856274959016361\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718963_0.9914336156887058\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">当用户需要在用户的设备中关闭特定的访问权限（例如用户的位置信息 、摄像头、相册、麦克风、通讯录及/或日历），大多数移动设备都会支持用户的这项需求，具体方法请参考或联系用户移动设备的服务商或生产商。<mpchecktext contenteditable=\"false\" id=\"1586945718964_0.07403543034465931\">\r\n    </mpchecktext>&nbsp;用户开启任一权限即代表用户授权公司可以收集和使用相关信息来为用户提供对应服务，用户一旦关闭任一权限即代表用户取消了授权，公司将不再基于对应权限继续收集和使用相关信息，也无法为用户提供该权限所对应的服务。<mpchecktext contenteditable=\"false\" id=\"1586945718965_0.45973331972351983\">\r\n    </mpchecktext>&nbsp;但是，用户关闭权限的决定不会影响此前基于用户的授权所进行的信息收集及使用。<mpchecktext contenteditable=\"false\" id=\"1586945718966_0.42109513867443815\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718967_0.690206013060854\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718968_0.8575261835849859\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">6.2 访问、删除、更正用户的个人信息&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718969_0.5938103139420083\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718970_0.9986565989146461\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">6.2.1 访问和修改用户账号信息&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718971_0.7664891051182692\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718972_0.32069068100737086\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\"><span style=\"font-family: Helvetica;\">用户可以在</span>”</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件的“我的” —“设置”选项中访问和修改用户的头像、昵称、</span><span style=\"color: rgb(0, 0, 0); letter-spacing: 0px; font-family: 宋体;\">提</span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\"><span style=\"font-family: Helvetica;\">醒设置等账号信息。<mpchecktext contenteditable=\"false\" id=\"1586945718973_0.8299147199530243\">\r\n    </mpchecktext></span>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718974_0.5484516667394619\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718975_0.7256133415866761\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">6.2.2 查询、访问、更改或删除用户收藏、点赞、评论、搜索历史记录等&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718976_0.3142372844001775\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718977_0.43739754254270324\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718978_0.15370656215574852\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">6.3 注销账号&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718979_0.08665840260621738\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718980_0.4782106034007585\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\"><span style=\"font-family: Helvetica;\">如用户需要注销</span>”</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”的用户帐号，请通过“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件中 “我的”—“帮助与反馈”，进入用户反馈界面进行申请, 公司将安排相关工作人员协助用户操作。<mpchecktext contenteditable=\"false\" id=\"1586945718981_0.46597243614623185\">\r\n    </mpchecktext>&nbsp;在用户注销账号前，公司将验证用户的个人身份、安全状态、设备信息等。<mpchecktext contenteditable=\"false\" id=\"1586945718982_0.23197641516016354\">\r\n    </mpchecktext>&nbsp;用户知悉并理解，注销账号的行为是不可逆的行为，当用户注销账号后，公司将删除有关用户的相关信息或进行匿名化处理，但法律法规另有规定的除外。<mpchecktext contenteditable=\"false\" id=\"1586945718983_0.5144821180111439\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718984_0.12717802466288597\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718985_0.04927178456073289\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">6.4 投诉举报&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718986_0.9898502609965742\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718987_0.8804950791301855\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\"><span style=\"font-family: Helvetica;\">用户可按照公司公示的制度进行投诉或举报。<mpchecktext contenteditable=\"false\" id=\"1586945718988_0.6942733143025128\">\r\n    </mpchecktext></span>&nbsp;如果用户认为用户的个人信息权利可能受到侵害，或者发现侵害个人信息权利的线索（例如：<mpchecktext contenteditable=\"false\" id=\"1586945718989_0.1127986070709115\">\r\n    </mpchecktext>&nbsp;认为公司收集用户的个人信息违反法律规定或者双方约定），用户可通过 “</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件中 “我的”—“帮助与反馈”，进入用户反馈界面与公司联系。<mpchecktext contenteditable=\"false\" id=\"1586945718990_0.4076285087534961\">\r\n    </mpchecktext>&nbsp;公司核查后会及时反馈用户的投诉与举报。<mpchecktext contenteditable=\"false\" id=\"1586945718991_0.6638701992512133\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718992_0.2019368345417203\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718993_0.5241501463747034\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">6.5 访问隐私政策&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718994_0.24643105759392459\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718995_0.685580621813227\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">6.5.1用户可以在注册登录页面查看隐私政策全部内容。<mpchecktext contenteditable=\"false\" id=\"1586945718996_0.6965925855465762\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718997_0.8450135912336458\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945718998_0.9422747619573058\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">6.5.2请用户了解，隐私政策中所述的“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件及相关服务可能会因用户所使用的手机型号、系统版本、软件应用程序版本、移动客户端等因素而有所不同。<mpchecktext contenteditable=\"false\" id=\"1586945718999_0.43973962681950596\">\r\n    </mpchecktext>&nbsp;最终的产品和服务以用户所使用的“</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件及相关服务为准。<mpchecktext contenteditable=\"false\" id=\"1586945719000_0.4766677597882045\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719001_0.26844028298483047\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719002_0.6105125709236132\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">6.6 停止运营向用户告知&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719003_0.7946930022506082\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719004_0.9357587959207601\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">如公司停止运营，公司将及时停止收集用户个人信息的活动，将停止运营的通知以逐一送达或公告的形式通知用户，并对所持有的用户的个人信息进行删除或匿名化处理。<mpchecktext contenteditable=\"false\" id=\"1586945719005_0.9146984586647913\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719006_0.7907010092443272\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719007_0.5138362216677685\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">七、未成年人条款&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719008_0.479605579353904\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719009_0.49629849486652633\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">7.1若用户是未满18周岁的未成年人，在使用”</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件及相关服务前，应在用户的父母或其他监护人监护、指导下共同阅读并同意隐私政策。<mpchecktext contenteditable=\"false\" id=\"1586945719010_0.6955232753795126\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719011_0.39433396125729403\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719012_0.3363608722085467\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">7.2公司根据国家相关法律法规的规定保护未成年人的个人信息，只会在法律允许、父母或其他监护人明确同意或保护未成年人所必要的情况下收集、使用、储存、共享、转让或披露未成年人的个人信息；<mpchecktext contenteditable=\"false\" id=\"1586945719014_0.9014469833976433\">\r\n    </mpchecktext>&nbsp;如果公司发现在未事先获得可证实的父母同意的情况下收集了未成年人的个人信息，则会设法尽快删除相关信息。<mpchecktext contenteditable=\"false\" id=\"1586945719013_0.8153744797834126\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719015_0.8267224905381865\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719016_0.10779418748521019\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">7.3若用户是未成年人的监护人，当用户对用户所监护的未成年人的个人信息有相关疑问时，请通过公司隐私政策公示的联系方式与公司联系。<mpchecktext contenteditable=\"false\" id=\"1586945719017_0.6956710192233222\">\r\n    </mpchecktext>&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719018_0.3886457434582966\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719019_0.2521329605416931\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">八、隐私政策的修订和通知&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719020_0.10428121373068078\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px; font-size: 14px;\">&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719021_0.2223923666597083\">\r\n    </mpchecktext></span>\r\n</p>\r\n<p style=\"margin-top:0;margin-right:0;margin-bottom:9px;margin-left:0;text-indent:0\">\r\n  <span style=\"font-size: 14px;\"><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">8.1为了给用户提供更好的服务，”</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); letter-spacing: 0px;\">Shopro<span style=\"font-family: 宋体;\">商城</span></span><span style=\"font-family: Helvetica; color: rgb(0, 0, 0); letter-spacing: 0px;\">”软件及相关服务将不时更新与变化，公司会适时对隐私政策进行修订，这些修订构成隐私政策的&nbsp;<mpchecktext contenteditable=\"false\" id=\"1586945719022_0.617229191757722\">\r\n    </mpchecktext></span></span>\r\n</p>\r\n<p>\r\n  <span style=\"font-family: Calibri; font-size: 14px;\">&nbsp;</span>\r\n</p>\r\n', 1582259745, 1586947511, NULL);
INSERT INTO `fa_shopro_richtext` VALUES (3, '关于我们', '<p data-mpa-powered-by=\"yiban.io\"><span style=\"font-size:14px;\">Shopro商城基于Fsatadmin和Uniapp进行开发的全平台（微信公众号、微信小程序、H5网页、 安卓-app、IOS-App）购物商城，拥有强大的店铺装修、自定义模板、路由同步、多端支付（微信，支付宝）、多规格商品、运费模板、多地区邮费、库存管理、全端分享等功能。</span><span style=\"font-size:14px;\">提供全部VUE+后台无加密源代码。</span></p>', 1582259745, 1590746109, NULL);
INSERT INTO `fa_shopro_richtext` VALUES (4, '拼团说明', '<p><strong style=\"font-size:18px;\"><img src=\"http://shopro-1253949872.image.myqcloud.com/uploads/20200529/9d73c3163fc494c489e2065f1b449f38.jpg\" alt=\"\" /><img src=\"http://shopro-1253949872.image.myqcloud.com/uploads/20200529/3ffc52e2b2ad49db6784950d6b670b21.png\" alt=\"\" /><img src=\"http://shopro-1253949872.image.myqcloud.com/uploads/20200529/b7226552996e7111ac121a36fc47661f.png\" alt=\"\" /><img src=\"http://shopro-1253949872.image.myqcloud.com/uploads/20200529/8715bdd23472bed9395140dd17bfce91.jpg\" alt=\"\" />活动说明</strong></p><p><span style=\"font-size:16px;\">1. 用户点击开团购买，成为团长，并邀请好友参团，在团有效时间内凑齐成团人数，即可拼团成功，商家将会发货；</span><br /><span style=\"font-size:16px;\">2. 开团有效时间内未凑齐成团人数，即拼团失败，系统自动取消订单并全额退款，退款金额将会原路退回付款账户；</span><br /><span style=\"font-size:16px;\">3. 开团有效时间，即允许邀请好友参团的时间，可在拼团详情页查看倒计时；</span></p>', 1590664792, 1590736081, NULL);

-- ----------------------------
-- Table structure for fa_shopro_score_goods_sku_price
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_score_goods_sku_price`;
CREATE TABLE `fa_shopro_score_goods_sku_price`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_price_id` int(11) NOT NULL DEFAULT 0 COMMENT '规格 id',
  `goods_id` int(11) NOT NULL COMMENT '所属产品',
  `status` enum('up','hidden','down') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上架状态:up=上架,hidden=隐藏,down=下架',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存',
  `sales` int(11) NOT NULL DEFAULT 0 COMMENT '已售',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `score` int(11) NOT NULL DEFAULT 0 COMMENT '积分',
  `createtime` int(11) NULL DEFAULT NULL,
  `updatetime` int(11) NULL DEFAULT NULL,
  `deletetime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '积分商城商品规格' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_share
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_share`;
CREATE TABLE `fa_shopro_share`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户',
  `share_id` int(11) NOT NULL COMMENT '分享人',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '识别类型',
  `type_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '识别标识',
  `platform` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `share_id`(`share_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户分享' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_startup
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_startup`;
CREATE TABLE `fa_shopro_startup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户',
  `platform` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端',
  `content` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问详情',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端IP',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '访问时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户端启动信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_store
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_store`;
CREATE TABLE `fa_shopro_store`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '门店名称',
  `images` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '门店图片',
  `realname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系电话',
  `province_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '省',
  `city_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '市',
  `area_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区',
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `city_id` int(11) NOT NULL COMMENT '市ID',
  `area_id` int(11) NOT NULL COMMENT '区ID',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址',
  `latitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `longitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `store` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '支持配送:0=否,1=是',
  `selfetch` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '支持自提:0=否,1=是',
  `service_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务范围',
  `service_radius` int(11) NOT NULL DEFAULT 0 COMMENT '服务半径',
  `service_province_ids` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务行政省',
  `service_city_ids` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务行政市',
  `service_area_ids` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务行政区',
  `openhours` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '营业时间',
  `openweeks` set('1','2','3','4','5','6','7') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1,2,3,4,5,6,7' COMMENT '营业天数',
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '门店状态:0=禁用,1=启用',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `updatetime` int(11) NOT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门店' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_store_apply
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_store_apply`;
CREATE TABLE `fa_shopro_store_apply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '门店名称',
  `images` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '门店图片',
  `realname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系电话',
  `province_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '省',
  `city_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '市',
  `area_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区',
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `city_id` int(11) NOT NULL COMMENT '市ID',
  `area_id` int(11) NOT NULL COMMENT '区ID',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址',
  `latitude` decimal(10, 6) NOT NULL DEFAULT 0.000000 COMMENT '纬度',
  `longitude` decimal(10, 6) NOT NULL DEFAULT 0.000000 COMMENT '经度',
  `openhours` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '营业时间',
  `openweeks` set('1','2','3','4','5','6','7') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1,2,3,4,5,6,7' COMMENT '营业天数',
  `apply_num` int(10) NOT NULL DEFAULT 0 COMMENT '申请次数',
  `status` enum('-1','0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '审核状态:-1驳回,0=未审核,1=已通过',
  `status_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驳回原因',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `updatetime` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门店入驻' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_user_address
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_user_address`;
CREATE TABLE `fa_shopro_user_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_default` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '默认',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户',
  `consignee` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `province_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `city_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `area_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `province_id` int(11) NULL DEFAULT NULL,
  `city_id` int(11) NULL DEFAULT NULL,
  `area_id` int(11) NULL DEFAULT NULL,
  `latitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `longitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `createtime` int(11) NULL DEFAULT NULL,
  `updatetime` int(11) NULL DEFAULT NULL,
  `deletetime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_user_bank
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_user_bank`;
CREATE TABLE `fa_shopro_user_bank`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `real_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `bank_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行名',
  `card_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卡号',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '提现银行卡' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_user_coupons
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_user_coupons`;
CREATE TABLE `fa_shopro_user_coupons`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户',
  `coupons_id` int(11) NULL DEFAULT NULL COMMENT '优惠券',
  `use_order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单 id',
  `usetime` int(11) NULL DEFAULT NULL COMMENT '使用时间',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '领取时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户优惠券' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_user_fake
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_user_fake`;
CREATE TABLE `fa_shopro_user_fake`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '虚拟用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_user_favorite`;
CREATE TABLE `fa_shopro_user_favorite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品',
  `createtime` int(11) NULL DEFAULT NULL,
  `updatetime` int(11) NULL DEFAULT NULL,
  `deletetime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户收藏' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_user_oauth
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_user_oauth`;
CREATE TABLE `fa_shopro_user_oauth`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '用户',
  `provider` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '厂商',
  `platform` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台',
  `unionid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '厂商ID',
  `openid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台ID',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) NULL DEFAULT 0 COMMENT '性别',
  `country` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '省',
  `city` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '市',
  `headimgurl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像',
  `logintime` int(11) NULL DEFAULT NULL COMMENT '登录时间',
  `logincount` int(11) NULL DEFAULT 0 COMMENT '累计登陆',
  `expire_in` int(11) NULL DEFAULT NULL COMMENT '过期周期(s)',
  `expiretime` int(11) NULL DEFAULT NULL COMMENT '过期时间',
  `session_key` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'session_key',
  `refresh_token` varchar(110) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'refresh_token',
  `access_token` varchar(110) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'access_token',
  `createtime` int(10) NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方授权' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_user_sign
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_user_sign`;
CREATE TABLE `fa_shopro_user_sign`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户',
  `date` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到日期',
  `score` int(11) NOT NULL DEFAULT 0 COMMENT '所得积分',
  `is_replenish` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否补签:0=正常,1=补签',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `date`(`date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户签到' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_user_store
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_user_store`;
CREATE TABLE `fa_shopro_user_store`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户',
  `store_id` int(11) NOT NULL COMMENT '门店',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门店管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_user_view
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_user_view`;
CREATE TABLE `fa_shopro_user_view`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户浏览记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_user_wallet_apply
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_user_wallet_apply`;
CREATE TABLE `fa_shopro_user_wallet_apply`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '提现用户',
  `money` decimal(10, 2) NOT NULL COMMENT '提现金额',
  `charge_money` decimal(10, 2) NOT NULL COMMENT '手续费',
  `service_fee` decimal(10, 3) NULL DEFAULT NULL COMMENT '手续费率',
  `get_type` enum('bank') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款类型:bank=银行卡',
  `bank_id` int(11) NOT NULL DEFAULT 0 COMMENT '银行卡',
  `real_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `bank_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '打款信息',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '提现状态:0=申请中,1=已打款,-1=已拒绝',
  `status_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驳回理由',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '申请时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '操作时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户提现' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_user_wallet_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_user_wallet_log`;
CREATE TABLE `fa_shopro_user_wallet_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志 id',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户',
  `wallet` decimal(10, 2) NOT NULL COMMENT '变动金额',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '变动类型',
  `wallet_type` enum('money','score') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志类型:money=余额,score=积分',
  `item_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目 id',
  `ext` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加字段',
  `oper_type` enum('user','store','admin','system') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user' COMMENT '操作人类型',
  `oper_id` int(11) NOT NULL DEFAULT 0 COMMENT '操作人',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '钱包日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_verify
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_verify`;
CREATE TABLE `fa_shopro_verify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'verify' COMMENT '类型:verify=核销券',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '核销码',
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单',
  `order_item_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单商品',
  `usetime` int(11) NULL DEFAULT NULL COMMENT '使用时间',
  `expiretime` int(11) NULL DEFAULT NULL COMMENT '过期时间',
  `oper_type` enum('user','store','admin','system') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人类型',
  `oper_id` int(11) NOT NULL DEFAULT 0 COMMENT '操作人',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE COMMENT '核销码'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '二维码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_wechat
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_wechat`;
CREATE TABLE `fa_shopro_wechat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置类型',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `rules` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `updatetime` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_shopro_wechat_fans
-- ----------------------------
DROP TABLE IF EXISTS `fa_shopro_wechat_fans`;
CREATE TABLE `fa_shopro_wechat_fans`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '粉丝昵称',
  `headimgurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '粉丝头像',
  `openid` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'openid',
  `sex` int(11) NOT NULL DEFAULT 0 COMMENT '性别',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '国家',
  `province` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '省',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '市',
  `subscribe` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关注状态:0=取消关注,1=已关注',
  `subscribe_time` int(11) NOT NULL COMMENT '关注时间',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `updatetime` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '粉丝管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_sms
-- ----------------------------
DROP TABLE IF EXISTS `fa_sms`;
CREATE TABLE `fa_sms`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_test
-- ----------------------------
DROP TABLE IF EXISTS `fa_test`;
CREATE TABLE `fa_test`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类ID(单选)',
  `category_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '价格',
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击',
  `startdate` date NULL DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime(0) NULL DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year NULL DEFAULT NULL COMMENT '年',
  `times` time(0) NULL DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) NULL DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) NULL DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT 0 COMMENT '开关',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '测试表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_test
-- ----------------------------
INSERT INTO `fa_test` VALUES (1, 0, 12, '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '{\"a\":\"1\",\"b\":\"2\"}', 0.00, 0, '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1491635035, 1491635035, 1491635035, NULL, 0, 1, 'normal', '1');

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '组别ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `score` int(10) NOT NULL DEFAULT 0 COMMENT '积分',
  `successions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '连续登录天数',
  `maxsuccessions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '最大连续登录天数',
  `prevtime` int(10) NULL DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `joinip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) NULL DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证',
  `parent_user_id` int(10) NULL DEFAULT NULL COMMENT '邀请人:NULL=暂无,0=无',
  `child_user_count` int(10) NOT NULL DEFAULT 0 COMMENT '团队用户人数',
  `child_user_count_1` int(10) NOT NULL DEFAULT 0 COMMENT '一级用户人数',
  `child_user_count_2` int(10) NOT NULL DEFAULT 0 COMMENT '二级用户人数',
  `total_consume` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '消费累计',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE,
  INDEX `parent_user_id`(`parent_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user
-- ----------------------------
INSERT INTO `fa_user` VALUES (1, 1, 'shopro', 'Shopro-1', '16e1dc8ea4fbadb374b83087f7fc538e', 'eul2L4', 'shopro@www.shoppro.com', '13888888888', 'http://api.7wpp.com/assets/addons/shopro/img/default-avatar.png', 1, 0, NULL, '', 0.00, 0, 1, 1, 1622517088, 1622517666, '127.0.0.1', 0, '127.0.0.1', 1622516171, 1622516171, 1622517666, '', 'normal', '', NULL, 0, 0, 0, 0.00);
INSERT INTO `fa_user` VALUES (2, 1, '13439302541', 'Shopro-2', '9e8c10325649d2663cedb4b7aa1f5b4c', 'OadGFE', '13439302541@www.shoppro.com', '13439302541', 'http://api.7wpp.com/assets/addons/shopro/img/default-avatar.png', 1, 0, NULL, '', 0.00, 0, 1, 1, 1622517477, 1622517485, '127.0.0.1', 0, '127.0.0.1', 1622516909, 1622516909, 1622517485, '', 'normal', '', NULL, 0, 0, 0, 0.00);

-- ----------------------------
-- Table structure for fa_user_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_group`;
CREATE TABLE `fa_user_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '权限节点',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '等级徽章',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_group
-- ----------------------------
INSERT INTO `fa_user_group` VALUES (1, '默认组', '1,3,5,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,99', NULL, 1515386468, 1541065475, 'normal');

-- ----------------------------
-- Table structure for fa_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_money_log`;
CREATE TABLE `fa_user_money_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更余额',
  `before` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更前余额',
  `after` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更后余额',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员余额变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_rule`;
CREATE TABLE `fa_user_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) NULL DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '标题',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) NULL DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NULL DEFAULT 0 COMMENT '权重',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  `icon` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fa fa-circle-o' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '条件',
  `type` enum('menu','file') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_rule
-- ----------------------------
INSERT INTO `fa_user_rule` VALUES (1, 0, 'dashboard', 'Dashboard', 'Dashboard tips', 1, 1516168079, 1516168079, 99, 'normal', 'fa fa-dashboard', '', 'file');
INSERT INTO `fa_user_rule` VALUES (2, 0, 'api', 'API接口', '', 1, 1516168062, 1537758838, 2, 'hidden', '', '', 'file');
INSERT INTO `fa_user_rule` VALUES (3, 1, 'dashboard/index', 'View', '', 0, 1515386247, 1515386247, 5, 'normal', 'fa fa-circle-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (4, 2, 'api/user', '会员模块', '', 1, 1515386221, 1537758859, 11, 'hidden', '', '', 'file');
INSERT INTO `fa_user_rule` VALUES (5, 0, 'user', 'User center', '', 1, 1515386262, 1516015236, 7, 'normal', 'fa fa-users', '', 'file');
INSERT INTO `fa_user_rule` VALUES (6, 5, 'user/secure', '安全管理', '', 1, 1516015012, 1516015012, 10, 'normal', 'fa fa-shield', '', 'file');
INSERT INTO `fa_user_rule` VALUES (7, 5, 'user/rich', '财富管理', '', 1, 1541045799, 1541052272, 9, 'normal', 'fa fa-money', '', 'file');
INSERT INTO `fa_user_rule` VALUES (8, 5, 'user/general', '常规管理', '', 1, 1541045799, 1541052272, 9, 'normal', 'fa fa-cogs', '', 'file');
INSERT INTO `fa_user_rule` VALUES (9, 4, 'api/user/login', '登录', '', 0, 1515386247, 1537758859, 6, 'hidden', '', '', 'file');
INSERT INTO `fa_user_rule` VALUES (10, 4, 'api/user/register', '注册', '', 0, 1515386262, 1537758859, 8, 'hidden', '', '', 'file');
INSERT INTO `fa_user_rule` VALUES (11, 4, 'api/user/index', '会员中心', '', 0, 1516015012, 1537758859, 10, 'hidden', '', '', 'file');
INSERT INTO `fa_user_rule` VALUES (12, 4, 'api/user/profile', '个人资料', '', 0, 1516015012, 1537758859, 3, 'hidden', '', '', 'file');
INSERT INTO `fa_user_rule` VALUES (13, 6, 'user/profile', 'Profile', '', 1, 1516015012, 1516015012, 10, 'normal', 'fa fa-user-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (14, 13, 'user/profile/index', 'View', '', 0, 1516015012, 1516015012, 4, 'normal', 'fa fa-circle-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (15, 13, 'user/profile/edit', 'Edit', '', 0, 1516015012, 1516015012, 4, 'normal', 'fa fa-circle-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (16, 6, 'user/changepwd', 'Change password', '', 1, 1541045799, 1541056067, 8, 'normal', 'fa fa-key', '', 'file');
INSERT INTO `fa_user_rule` VALUES (17, 16, 'user/changepwd/index', 'View', '', 0, 1541045799, 1541045799, 0, 'normal', 'fa fa-circle-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (18, 6, 'user/log', '用户日志', '', 1, 1516015012, 1541043105, 7, 'normal', 'fa fa-file-text-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (19, 18, 'user/log/index', 'View', '', 0, 1516015012, 1537758859, 3, 'normal', 'fa fa-circle-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (20, 7, 'user/scorelog', '积分日志', '', 1, 1541045799, 1541050931, 0, 'normal', 'fa fa-file-text-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (21, 20, 'user/scorelog/index', 'View', '', 0, 1541045799, 1541050931, 0, 'normal', 'fa fa-circle-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (22, 7, 'user/recharge', '充值余额', '', 1, 1541045799, 1541050931, 0, 'normal', 'fa fa-cny', '', 'file');
INSERT INTO `fa_user_rule` VALUES (23, 22, 'user/recharge/index', 'View', '', 0, 1541045799, 1541045799, 8, 'normal', 'fa fa-circle-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (24, 7, 'user/moneylog', '余额日志', '', 1, 1541045799, 1541050931, 0, 'normal', 'fa fa-file-text-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (25, 24, 'user/moneylog/index', 'View', '', 0, 1516015012, 1541043105, 7, 'normal', 'fa fa-circle-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (26, 7, 'user/withdraw', '余额提现', '', 1, 1541045799, 1541050931, 0, 'normal', 'fa fa-cny', '', 'file');
INSERT INTO `fa_user_rule` VALUES (27, 26, 'user/withdraw/index', 'View', '', 0, 1541045799, 1541045799, 8, 'normal', 'fa fa-circle-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (28, 7, 'user/withdrawlog', '提现日志', '', 1, 1541045799, 1541050931, 0, 'normal', 'fa fa-file-text-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (29, 28, 'user/withdrawlog/index', 'View', '', 0, 1516015012, 1541043105, 7, 'normal', 'fa fa-circle-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (30, 8, 'user/invite', '邀请好友', '', 1, 1541045799, 1541050931, 0, 'normal', 'fa fa-users', '', 'file');
INSERT INTO `fa_user_rule` VALUES (31, 30, 'user/invite/index', 'View', '', 0, 1516015012, 1541043105, 7, 'normal', 'fa fa-circle-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (32, 8, 'general/attachment', '附件管理', '', 1, 1541045799, 1541050931, 0, 'normal', 'fa fa-file-image-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (33, 32, 'general/attachment/index', 'View', '', 0, 1516015012, 1541043105, 7, 'normal', 'fa fa-circle-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (34, 32, 'general/attachment/add', 'Add', '', 0, 1516015012, 1541043105, 7, 'normal', 'fa fa-circle-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (35, 32, 'general/attachment/edit', 'Edit', '', 0, 1516015012, 1541043105, 7, 'normal', 'fa fa-circle-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (36, 32, 'general/attachment/del', 'Del', '', 0, 1516015012, 1541043105, 7, 'normal', 'fa fa-circle-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (37, 32, 'general/attachment/select', 'Select', '', 0, 1516015012, 1541043105, 7, 'normal', 'fa fa-circle-o', '', 'file');
INSERT INTO `fa_user_rule` VALUES (99, 32, 'general/attachment/multi', 'Multi', '', 0, 1516015012, 1541043105, 7, 'normal', 'fa fa-circle-o', '', 'file');

-- ----------------------------
-- Table structure for fa_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_score_log`;
CREATE TABLE `fa_user_score_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT 0 COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT 0 COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT 0 COMMENT '变更后积分',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员积分变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_user_token
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_token`;
CREATE TABLE `fa_user_token`  (
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员Token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_token
-- ----------------------------
INSERT INTO `fa_user_token` VALUES ('004b80a93c4c3804f041015bf917fe5089cb2973', 18, 1622514114, 1625106114);
INSERT INTO `fa_user_token` VALUES ('0df8a969d36a5b177408a2cea42f7b27bc535a70', 20, 1622514176, 1625106176);
INSERT INTO `fa_user_token` VALUES ('0f24b0e87014a5bc61862eed3126f7009d2e7372', 1, 1622516172, 1625108172);
INSERT INTO `fa_user_token` VALUES ('12bceef013608da69dd123446933f9825644cab4', 10, 1622513886, 1625105886);
INSERT INTO `fa_user_token` VALUES ('140ee8eab1a3b5d210ff0c4905e32cbe088a457a', 9, 1622513859, 1625105859);
INSERT INTO `fa_user_token` VALUES ('152dd7e73460120468fb17b37774d8c434efd65b', 17, 1622514102, 1625106102);
INSERT INTO `fa_user_token` VALUES ('1a263e2400ac45a2aa97fb34048fea75a731e455', 3, 1622513088, 1625105088);
INSERT INTO `fa_user_token` VALUES ('24802d2c819cba567b3be01f797a891a0623ee18', 2, 1622514643, 1625106643);
INSERT INTO `fa_user_token` VALUES ('29ccbf663dab7ca96d1a8b65d3777eb553b7ed56', 1, 1622514535, 1625106535);
INSERT INTO `fa_user_token` VALUES ('2a4064479e65d52f42a73e4f6732abfdb43e9754', 5, 1622513151, 1625105151);
INSERT INTO `fa_user_token` VALUES ('36d4d3b5f7f916d2ae8724857b36faea4ac66988', 2, 1622516909, 1625108909);
INSERT INTO `fa_user_token` VALUES ('400ee0b0968bf01660ea24b767fc008985ff8881', 3, 1622514688, 1625106688);
INSERT INTO `fa_user_token` VALUES ('406a9d6666cf7bb60d05c78ef65d0d53b18a3a89', 13, 1622514003, 1625106003);
INSERT INTO `fa_user_token` VALUES ('49fee1a8ebf23ded1881e81f35bbad3ebd1c290f', 4, 1622513130, 1625105130);
INSERT INTO `fa_user_token` VALUES ('4f6db503f5b2d56aa4b83e21d2b419f10abf56e4', 1, 1622516278, 1625108278);
INSERT INTO `fa_user_token` VALUES ('59b529dd395b5c6d03d00bae5ea9fc74ff5b1251', 2, 1622517485, 1625109485);
INSERT INTO `fa_user_token` VALUES ('5dd34fd0cead694f573a039a4edcd6c9e1b6585d', 19, 1622514156, 1625106156);
INSERT INTO `fa_user_token` VALUES ('6d87de13dbe134234549f7b21b03d7a4fa489c75', 6, 1622513220, 1625105220);
INSERT INTO `fa_user_token` VALUES ('702191269eb4a56e327642173d3c32c53149197c', 16, 1622514084, 1625106084);
INSERT INTO `fa_user_token` VALUES ('725f47bd10aaefc24bb245c82b8621aa693553b8', 21, 1622514187, 1625106187);
INSERT INTO `fa_user_token` VALUES ('989bef834b66b04e39f92d03c6b263d6474d6385', 11, 1622513915, 1625105915);
INSERT INTO `fa_user_token` VALUES ('a0ac6b4fb140824e68a201d0fa44d5d1b7fa74b0', 12, 1622513965, 1625105965);
INSERT INTO `fa_user_token` VALUES ('a8cdb07de9886d8445890ed44d99777007c1d523', 2, 1622517477, 1625109477);
INSERT INTO `fa_user_token` VALUES ('af2a3f1ee1960f8c0705c4da01199af721fc1720', 8, 1622513728, 1625105728);
INSERT INTO `fa_user_token` VALUES ('b292cfc4de59ac584ad300c4b9925e8881a0ce00', 1, 1622515947, 1625107947);
INSERT INTO `fa_user_token` VALUES ('b44a5ad6fe0548d98159ebe239ccb7a83237a34a', 15, 1622514049, 1625106049);
INSERT INTO `fa_user_token` VALUES ('b4e27a590d01235919d99e841416ac18486bdad1', 7, 1622513534, 1625105534);
INSERT INTO `fa_user_token` VALUES ('c0f47dd5fceec57219292b7a3e1a0194dc60e4f9', 1, 1622516307, 1625108307);
INSERT INTO `fa_user_token` VALUES ('c1d8983b7ba76edebb7354ce2c68adbaa4fc1acf', 14, 1622514024, 1625106024);
INSERT INTO `fa_user_token` VALUES ('d386c5b1e87e552a2e2964df0f3964644e181fc9', 1, 1622514576, 1625106576);
INSERT INTO `fa_user_token` VALUES ('d766f4085ec8d2dbeb43dbc2f89234b0eea9ca00', 1, 1622517088, 1625109088);
INSERT INTO `fa_user_token` VALUES ('ea7ad44e9e08fd08671fa63dbceedda00129a9e6', 1, 1622517666, 1625109666);
INSERT INTO `fa_user_token` VALUES ('f3693967c377614e117bec67387f9b59415132e2', 22, 1622514205, 1625106205);
INSERT INTO `fa_user_token` VALUES ('f422f046c72c43b1ff4f1e1052149d54a91818b7', 2, 1622512771, 1625104771);

-- ----------------------------
-- Table structure for fa_version
-- ----------------------------
DROP TABLE IF EXISTS `fa_version`;
CREATE TABLE `fa_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '强制更新',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '版本表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
