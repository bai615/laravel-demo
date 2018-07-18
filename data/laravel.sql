/*
Navicat MySQL Data Transfer

Source Server         : mysql-local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : laravel

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-07-18 14:24:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'DarrionHuel', '$2y$10$334NBgsJzCOl/hRGAZ9CqeStl/8g/ASkISvmL9C5BWq/iwm08Th7W', 'rba2WrpFl4w2Qxxr6DPK0VnG18EwNxjY3eMnVFVMBlwroABpR5teRmipZAUg', '2018-07-12 06:19:32', '2018-07-12 06:19:32');
INSERT INTO `admins` VALUES ('2', 'Kim Bashirian II', '$2y$10$334NBgsJzCOl/hRGAZ9CqeStl/8g/ASkISvmL9C5BWq/iwm08Th7W', 'CvtV46hXbO', '2018-07-12 06:19:32', '2018-07-12 06:19:32');
INSERT INTO `admins` VALUES ('3', 'Kiley Thiel', '$2y$10$334NBgsJzCOl/hRGAZ9CqeStl/8g/ASkISvmL9C5BWq/iwm08Th7W', 'Duqf31ZbypSSYEfu3xTP4WAfJYHVf7buS9DxuG4N2spUmXYKhA7Nj6vpgYTo', '2018-07-12 06:19:32', '2018-07-12 06:19:32');

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '1', 'Index', 'fa-bar-chart', '/', null, null);
INSERT INTO `admin_menu` VALUES ('2', '0', '2', 'Admin', 'fa-tasks', '', null, null);
INSERT INTO `admin_menu` VALUES ('3', '2', '3', 'Users', 'fa-users', 'auth/users', null, null);
INSERT INTO `admin_menu` VALUES ('4', '2', '4', 'Roles', 'fa-user', 'auth/roles', null, null);
INSERT INTO `admin_menu` VALUES ('5', '2', '5', 'Permission', 'fa-ban', 'auth/permissions', null, null);
INSERT INTO `admin_menu` VALUES ('6', '2', '6', 'Menu', 'fa-bars', 'auth/menu', null, null);
INSERT INTO `admin_menu` VALUES ('7', '2', '7', 'Operation log', 'fa-history', 'auth/logs', null, null);
INSERT INTO `admin_menu` VALUES ('8', '0', '0', 'Members', 'fa-users', '/users', '2018-07-06 02:16:11', '2018-07-06 02:17:19');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `input` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES ('1', '1', 'admin', 'GET', '127.0.0.1', '[]', '2018-07-06 02:05:14', '2018-07-06 02:05:14');
INSERT INTO `admin_operation_log` VALUES ('2', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-06 02:05:29', '2018-07-06 02:05:29');
INSERT INTO `admin_operation_log` VALUES ('3', '1', 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-06 02:05:35', '2018-07-06 02:05:35');
INSERT INTO `admin_operation_log` VALUES ('4', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-06 02:05:45', '2018-07-06 02:05:45');
INSERT INTO `admin_operation_log` VALUES ('5', '1', 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-06 02:08:30', '2018-07-06 02:08:30');
INSERT INTO `admin_operation_log` VALUES ('6', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-06 02:08:46', '2018-07-06 02:08:46');
INSERT INTO `admin_operation_log` VALUES ('7', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-06 02:09:05', '2018-07-06 02:09:05');
INSERT INTO `admin_operation_log` VALUES ('8', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-06 02:12:02', '2018-07-06 02:12:02');
INSERT INTO `admin_operation_log` VALUES ('9', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2018-07-06 02:15:18', '2018-07-06 02:15:18');
INSERT INTO `admin_operation_log` VALUES ('10', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-06 02:15:22', '2018-07-06 02:15:22');
INSERT INTO `admin_operation_log` VALUES ('11', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-06 02:15:25', '2018-07-06 02:15:25');
INSERT INTO `admin_operation_log` VALUES ('12', '1', 'admin/auth/menu/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-06 02:15:44', '2018-07-06 02:15:44');
INSERT INTO `admin_operation_log` VALUES ('13', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Members\",\"icon\":\"fa-users\",\"uri\":\"users\",\"roles\":[null],\"_token\":\"ftMEiCU82qPhMS57GiKfhYTHmqlu9QXyzhKD4Kc3\"}', '2018-07-06 02:16:11', '2018-07-06 02:16:11');
INSERT INTO `admin_operation_log` VALUES ('14', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2018-07-06 02:16:11', '2018-07-06 02:16:11');
INSERT INTO `admin_operation_log` VALUES ('15', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2018-07-06 02:16:18', '2018-07-06 02:16:18');
INSERT INTO `admin_operation_log` VALUES ('16', '1', 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-06 02:17:11', '2018-07-06 02:17:11');
INSERT INTO `admin_operation_log` VALUES ('17', '1', 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Members\",\"icon\":\"fa-users\",\"uri\":\"\\/users\",\"roles\":[null],\"_token\":\"ftMEiCU82qPhMS57GiKfhYTHmqlu9QXyzhKD4Kc3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/demo.laravelblog.com\\/admin\\/auth\\/menu\"}', '2018-07-06 02:17:19', '2018-07-06 02:17:19');
INSERT INTO `admin_operation_log` VALUES ('18', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2018-07-06 02:17:19', '2018-07-06 02:17:19');
INSERT INTO `admin_operation_log` VALUES ('19', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2018-07-06 02:17:31', '2018-07-06 02:17:31');
INSERT INTO `admin_operation_log` VALUES ('20', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2018-07-06 02:18:39', '2018-07-06 02:18:39');
INSERT INTO `admin_operation_log` VALUES ('21', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-06 02:18:49', '2018-07-06 02:18:49');
INSERT INTO `admin_operation_log` VALUES ('22', '1', 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-06 02:18:57', '2018-07-06 02:18:57');
INSERT INTO `admin_operation_log` VALUES ('23', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-06 02:19:01', '2018-07-06 02:19:01');
INSERT INTO `admin_operation_log` VALUES ('24', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-06 02:19:12', '2018-07-06 02:19:12');
INSERT INTO `admin_operation_log` VALUES ('25', '1', 'admin', 'GET', '127.0.0.1', '[]', '2018-07-18 06:19:15', '2018-07-18 06:19:15');
INSERT INTO `admin_operation_log` VALUES ('26', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:19:28', '2018-07-18 06:19:28');
INSERT INTO `admin_operation_log` VALUES ('27', '1', 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:19:31', '2018-07-18 06:19:31');
INSERT INTO `admin_operation_log` VALUES ('28', '1', 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:19:32', '2018-07-18 06:19:32');
INSERT INTO `admin_operation_log` VALUES ('29', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:19:34', '2018-07-18 06:19:34');
INSERT INTO `admin_operation_log` VALUES ('30', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:19:47', '2018-07-18 06:19:47');
INSERT INTO `admin_operation_log` VALUES ('31', '1', 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:19:58', '2018-07-18 06:19:58');
INSERT INTO `admin_operation_log` VALUES ('32', '1', 'admin/auth/permissions/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:20:01', '2018-07-18 06:20:01');
INSERT INTO `admin_operation_log` VALUES ('33', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:20:06', '2018-07-18 06:20:06');
INSERT INTO `admin_operation_log` VALUES ('34', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:20:10', '2018-07-18 06:20:10');
INSERT INTO `admin_operation_log` VALUES ('35', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:20:13', '2018-07-18 06:20:13');
INSERT INTO `admin_operation_log` VALUES ('36', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:20:36', '2018-07-18 06:20:36');
INSERT INTO `admin_operation_log` VALUES ('37', '1', 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:20:41', '2018-07-18 06:20:41');
INSERT INTO `admin_operation_log` VALUES ('38', '1', 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:20:46', '2018-07-18 06:20:46');
INSERT INTO `admin_operation_log` VALUES ('39', '1', 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:20:53', '2018-07-18 06:20:53');
INSERT INTO `admin_operation_log` VALUES ('40', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:20:56', '2018-07-18 06:20:56');
INSERT INTO `admin_operation_log` VALUES ('41', '1', 'admin/auth/menu/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:21:01', '2018-07-18 06:21:01');
INSERT INTO `admin_operation_log` VALUES ('42', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-18 06:21:05', '2018-07-18 06:21:05');
INSERT INTO `admin_operation_log` VALUES ('43', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":null,\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"_token\":\"Huj5YXjAvTNK2NcQBjzd0ma1sKtt3vEyuNkgHyil\"}', '2018-07-18 06:21:13', '2018-07-18 06:21:13');
INSERT INTO `admin_operation_log` VALUES ('44', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2018-07-18 06:21:13', '2018-07-18 06:21:13');
INSERT INTO `admin_operation_log` VALUES ('45', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":null,\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"_token\":\"Huj5YXjAvTNK2NcQBjzd0ma1sKtt3vEyuNkgHyil\"}', '2018-07-18 06:21:17', '2018-07-18 06:21:17');
INSERT INTO `admin_operation_log` VALUES ('46', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2018-07-18 06:21:17', '2018-07-18 06:21:17');
INSERT INTO `admin_operation_log` VALUES ('47', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":null,\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"_token\":\"Huj5YXjAvTNK2NcQBjzd0ma1sKtt3vEyuNkgHyil\"}', '2018-07-18 06:21:19', '2018-07-18 06:21:19');
INSERT INTO `admin_operation_log` VALUES ('48', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2018-07-18 06:21:19', '2018-07-18 06:21:19');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `http_method` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'All permission', '*', '', '*', null, null);
INSERT INTO `admin_permissions` VALUES ('2', 'Dashboard', 'dashboard', 'GET', '/', null, null);
INSERT INTO `admin_permissions` VALUES ('3', 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', null, null);
INSERT INTO `admin_permissions` VALUES ('4', 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', null, null);
INSERT INTO `admin_permissions` VALUES ('5', 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', null, null);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'Administrator', 'administrator', '2018-07-06 01:54:48', '2018-07-06 01:54:48');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES ('1', '2', null, null);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$iD.Zd4Mn9rbMXOi.wdWsU.XuRiDZ1tbQkvm4DN7XzxDjbNwZBkoVy', 'Administrator', null, null, '2018-07-06 01:54:48', '2018-07-06 01:54:48');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('1', 'Nihil pariatur et officiis dolores natus.', 'Quis amet beatae velit accusamus nobis ut. Cum consequatur quas est dolore ipsam temporibus sit.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('2', 'Omnis sapiente porro et aspernatur.', 'Magni non esse excepturi voluptatem quos rerum assumenda. Mollitia nesciunt sit enim quia ex in ipsum. Dolor qui quo nobis dolorum harum. Sint amet ex illo dignissimos voluptas ducimus.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('3', 'Unde enim ut aperiam iure natus deleniti cupiditate.', 'Consequatur quaerat aut error beatae eveniet quasi deleniti. Enim tenetur et reprehenderit in quidem ea harum. Cumque ex veritatis sed et dolorem odio. Rerum ipsum voluptas vel modi.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('4', 'Et qui est quas sint.', 'Iusto neque dolores inventore quo commodi id qui. Qui animi nisi rerum perspiciatis magnam animi delectus. Eligendi assumenda excepturi deleniti ratione error officiis laborum tenetur.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('5', 'Laborum inventore numquam nam ut nostrum consectetur cumque.', 'Inventore laboriosam qui labore. Nam quia et in atque sunt aut. Dolor harum et facilis unde sit. Quaerat reprehenderit blanditiis fugiat quos mollitia provident.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('6', 'Corrupti aut recusandae delectus in voluptatem.', 'Maiores dolor natus ipsa eum in. Nesciunt dolores quaerat magnam nostrum quia omnis officiis odit. Quos sed amet possimus quidem suscipit voluptas in odio.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('7', 'Est porro ad fugiat similique reprehenderit totam molestiae mollitia.', 'Ducimus consequatur labore dolores enim voluptatem et. Molestiae debitis quia est sint non.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('8', 'Voluptatibus nihil est tempore et sequi praesentium delectus consequuntur.', 'Fugiat praesentium optio ex mollitia officiis laborum delectus. Non vitae voluptatem repellat eaque. Neque aliquam doloribus molestias tempore vitae. Necessitatibus sed nisi nemo velit.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('9', 'Itaque pariatur aut veritatis in aut ipsam.', 'Occaecati dolor in velit ab ipsum. Architecto nemo voluptatum asperiores rem dolores quas alias. Consequatur nisi iste dicta sed numquam quidem.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('10', 'Perferendis sunt ut possimus iure et.', 'Pariatur et aliquam vitae soluta consequatur a. Et totam recusandae nisi iure illum pariatur impedit.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('11', 'Quidem quaerat modi dolor ex facere.', 'Dolorem quam labore velit minus alias. Aut facilis accusamus enim soluta voluptas non. In hic vel eum mollitia tenetur illum fugit.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('12', 'Ea hic rerum quidem harum iusto nulla facere.', 'Eius omnis iste aut sed debitis. Possimus ipsa sed animi aut. Ullam recusandae praesentium velit totam est incidunt. Saepe laboriosam fuga est possimus.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('13', 'Ut numquam est id fugit quibusdam voluptatem ut.', 'Aut dolorem impedit eum est et voluptatibus alias. Beatae officiis qui assumenda perferendis. Tempora aliquid ipsam amet autem. Tenetur et itaque illo fugiat corrupti ut sint.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('14', 'Qui consequatur dolorem ea quidem ipsa tenetur vel.', 'Consequatur doloribus iure iusto occaecati odio amet. Nihil et odit id. Sequi illo itaque voluptatem illum quasi.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('15', 'Ipsa impedit et quo.', 'Deserunt ullam voluptas officia saepe expedita quia. Id voluptatem consectetur natus reiciendis est est. Aut id cumque in corporis. Ea dolores ut amet quia eligendi magnam. Rem nemo et aperiam deserunt.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('16', 'Cum dolorem aperiam reiciendis dolor.', 'Illo quod error necessitatibus nihil. Minus maiores est unde ea libero ut laudantium omnis. Occaecati sit et repellendus aut.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('17', 'Sunt harum quam omnis laboriosam magni.', 'Suscipit est labore non vel quia rerum tempore dolorum. Corporis quasi amet tempora odit. Praesentium officia error et debitis. Voluptas rerum sed nemo.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('18', 'Provident minima assumenda maxime dignissimos odit.', 'Voluptatem cupiditate aut delectus ipsum est officia aut ut. Eum voluptas voluptas occaecati nihil enim eos eos quidem. Vel quaerat tenetur culpa in deleniti fuga odio.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('19', 'Doloribus dolorem sint aperiam aut quos.', 'Asperiores est possimus repellendus quo est ratione aut. Ullam ratione eius libero vel inventore voluptatem voluptatem. Similique impedit pariatur deleniti enim facilis consectetur voluptatum.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('20', 'Voluptatibus id necessitatibus et pariatur sint.', 'Molestias qui veritatis dolorem quaerat. Qui sed id maiores tempore voluptatibus qui. Quia in vitae adipisci recusandae.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('21', 'Iure rem voluptatem ipsum.', 'Eum repellat natus nihil explicabo iste. Voluptas id doloremque nihil cum necessitatibus pariatur tempore.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('22', 'Officiis corporis quis illum in.', 'Tenetur non eos cum quidem ipsa laborum dolorum. Officia quisquam pariatur aut voluptatum voluptas corrupti veniam. Dicta numquam illum natus veniam consequatur.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('23', 'Quia sit voluptatibus eos veritatis et ad.', 'Ut nulla aut voluptas error dolorem aspernatur qui. Eum magni et quia labore quam ut sint. Ipsam necessitatibus consectetur reiciendis. Error culpa voluptatem eum aliquam.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('24', 'Eius quia distinctio in illum.', 'Est quaerat sequi est dolorem. Aut qui nobis magni maxime dolorum voluptate. Quidem eos libero quia quo. Aut voluptatum et voluptate veniam. Quam magnam nemo quia inventore ab voluptas.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('25', 'Nihil mollitia fugit earum praesentium ipsam beatae.', 'Facilis suscipit porro id autem sequi. Hic veritatis expedita rem eum soluta quaerat in voluptate. Vitae maiores consequatur ea sunt commodi quis officia cum. Reiciendis minus eius saepe et temporibus. Magnam aut dolorem placeat ab ex.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('26', 'Nostrum non provident quaerat.', 'Vel vero corrupti aut. Quibusdam voluptas ab nostrum ut culpa ut iusto. Adipisci eum repellendus perspiciatis et nam quo. Aliquid sit quae aut temporibus cupiditate at.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('27', 'Fuga inventore libero voluptatem sit.', 'Nihil commodi ut facilis delectus veniam iusto nemo possimus. Voluptatem tempore ut molestias cum odit culpa. Fugit doloribus porro veritatis repudiandae voluptatum id et. Laudantium vel quidem suscipit ad exercitationem.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('28', 'Omnis sed unde autem occaecati.', 'Eum dolores officia doloremque delectus recusandae accusantium porro. Modi hic qui perferendis quia nam delectus. Quo alias est repellat saepe. Cum sapiente nobis quia ut.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('29', 'Soluta perferendis voluptatem nemo libero.', 'Iure et illum voluptas sint. Nihil et quo assumenda dolore distinctio. Natus ipsum eius perspiciatis voluptas.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('30', 'Molestiae rerum repellendus error quia quia.', 'Error aut placeat eos neque a labore rerum. Repellendus distinctio suscipit aut dolor quidem doloremque. Enim minima ab laborum molestiae doloremque aspernatur quo.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('31', 'Est qui eos numquam est temporibus modi.', 'Qui perferendis adipisci eos eos consequatur. Doloribus culpa maxime est quis velit consequatur eaque. Odio sit doloremque cumque.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('32', 'Ut qui unde sunt.', 'Perferendis voluptate est vero. Sapiente quos est explicabo enim quia non. Velit aliquid ut voluptatibus consequatur iure quo modi ut.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('33', 'Labore error autem dicta officia natus rerum.', 'Et nisi consequuntur quasi perferendis facere velit aliquid. Sint cupiditate aperiam facilis dicta. Culpa dolorum fugiat qui qui ex.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('34', 'Totam velit doloribus sunt non rerum accusantium autem.', 'Ut voluptatem voluptatibus dolorum est asperiores fugit. Similique dignissimos error inventore sed suscipit. Est velit quo quo aut. Nemo repellat vero mollitia quo rerum distinctio architecto.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('35', 'Illum expedita sit ad eum.', 'Excepturi tempore nostrum omnis minima porro. Aliquam eaque consequatur vero voluptas consequatur. Dicta aut aperiam fugit facere eum vel et. Aut non ab assumenda.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('36', 'Quia omnis temporibus sed sunt error et id.', 'Aliquid repellat quae commodi porro distinctio. Quasi voluptas est eos aut. Tempora et molestias quia vitae velit. Pariatur dolorum distinctio facilis est sed quia.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('37', 'Recusandae omnis delectus eos aperiam veniam.', 'Et eos autem rem sunt perferendis ut deleniti. Et iste maiores fugiat voluptatibus. Voluptatem ullam deleniti et ea. Necessitatibus ut esse et sit labore.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('38', 'Sit aperiam enim distinctio et hic iste.', 'Ducimus expedita error labore nostrum illum. Dolores et possimus similique iste molestiae architecto sunt. Ut dolorem delectus architecto molestiae.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('39', 'Amet ipsa iusto ea enim quasi laboriosam.', 'Animi nesciunt quasi et. Illo velit adipisci consectetur et. Deleniti quos quod labore unde ut. Quod et aut quia ut officiis nisi.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('40', 'Dignissimos saepe velit similique corporis saepe sed cum.', 'Qui nam quam quia error. Dicta ratione sit tenetur eaque dignissimos et. Non consequatur corrupti consectetur ut libero.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('41', 'Alias velit dolorem natus non aut sed nemo.', 'Est ab odit qui pariatur ut. Libero non provident quo enim. Autem quidem dolor iure fugiat natus quisquam commodi. Sint rerum qui dolores sit quis qui minima ut.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('42', 'Molestiae ullam sit aut voluptatum dolorem.', 'Est optio et consequatur omnis velit consequuntur ducimus. Aut ut enim sint nihil. Exercitationem pariatur qui laudantium earum magni illo.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('43', 'Necessitatibus dolor tempora ea ad sit velit qui.', 'Quaerat quo minima quibusdam eligendi. Repudiandae aut minus omnis ratione quidem enim sit. Deleniti enim et enim sit iste. Nulla aut deserunt corrupti sit voluptas cum blanditiis. Asperiores qui sequi repudiandae nesciunt.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('44', 'Quia ducimus non qui quis.', 'Qui sapiente molestiae explicabo eligendi deserunt voluptas. Vel natus praesentium aut perspiciatis quos deleniti enim. Tenetur eos dolorem consectetur quaerat delectus. Assumenda maiores dolorem consectetur natus nemo nulla.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('45', 'Quam similique omnis quibusdam laudantium.', 'Molestias consequatur ipsam dicta exercitationem. Suscipit provident dolor facere quod. Autem quo quibusdam quia.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('46', 'Numquam placeat beatae illum doloremque occaecati nobis.', 'Laborum amet atque rerum fugiat ab dolor vel ut. Earum voluptatum nulla veritatis consequatur voluptate est itaque. Unde dolores dolorem sed quis.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('47', 'Animi fugit et voluptatem eum repellat aspernatur.', 'Exercitationem voluptatem sit placeat architecto sit. Dicta totam nemo sint provident neque. Qui illum nam maiores rerum. Consequatur incidunt eveniet harum id.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('48', 'Occaecati voluptates corporis aut aliquam non non distinctio.', 'Tenetur et et commodi sapiente et laborum. Impedit quia iusto ea voluptatem et consequuntur accusamus. Quaerat sit cum sed sunt necessitatibus ipsam deserunt. Est quis voluptatem exercitationem consequatur aliquam qui officia.', '2018-07-14 14:23:21', '2018-07-14 14:23:21');
INSERT INTO `articles` VALUES ('49', 'Enim assumenda consequatur assumenda ullam.', 'Vel et non nostrum voluptatem itaque quia. Laborum tempora consequatur culpa.', '2018-07-14 14:23:22', '2018-07-14 14:23:22');
INSERT INTO `articles` VALUES ('50', 'Qui nam labore sapiente natus velit.', 'Animi omnis sed dicta quisquam perferendis aperiam ut. Quis harum ut voluptatem quasi.', '2018-07-14 14:23:22', '2018-07-14 14:23:22');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('2', '123', '1', '1', '2018-07-16 14:15:22', '2018-07-16 14:15:25');
INSERT INTO `comments` VALUES ('3', '456', '4', '1', '2018-07-16 14:15:45', '2018-07-16 14:15:50');

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_01_04_173148_create_admin_tables', '2');
INSERT INTO `migrations` VALUES ('4', '2018_07_06_060036_create_posts_table', '3');
INSERT INTO `migrations` VALUES ('5', '2018_07_06_060322_add_votes_to_users_table', '3');
INSERT INTO `migrations` VALUES ('6', '2018_07_06_062457_create_products_table', '4');
INSERT INTO `migrations` VALUES ('7', '2018_07_06_064200_update_products_table', '5');
INSERT INTO `migrations` VALUES ('8', '2018_07_06_071708_create_specs_table', '6');
INSERT INTO `migrations` VALUES ('9', '2018_07_06_080205_update_products_table', '6');
INSERT INTO `migrations` VALUES ('10', '2018_07_06_093817_create_comments_table', '7');
INSERT INTO `migrations` VALUES ('11', '2018_07_06_094116_update_posts_table', '7');
INSERT INTO `migrations` VALUES ('12', '2018_07_06_094733_create_phones_table', '8');
INSERT INTO `migrations` VALUES ('13', '2018_07_12_060927_create_admins_table', '9');
INSERT INTO `migrations` VALUES ('14', '2016_06_01_000001_create_oauth_auth_codes_table', '10');
INSERT INTO `migrations` VALUES ('15', '2016_06_01_000002_create_oauth_access_tokens_table', '10');
INSERT INTO `migrations` VALUES ('16', '2016_06_01_000003_create_oauth_refresh_tokens_table', '10');
INSERT INTO `migrations` VALUES ('17', '2016_06_01_000004_create_oauth_clients_table', '10');
INSERT INTO `migrations` VALUES ('18', '2016_06_01_000005_create_oauth_personal_access_clients_table', '10');
INSERT INTO `migrations` VALUES ('19', '2018_07_13_081637_create_jobs_table', '11');
INSERT INTO `migrations` VALUES ('20', '2018_07_13_092242_create_notifications_table', '12');
INSERT INTO `migrations` VALUES ('21', '2018_07_14_140254_create_articles_table', '13');
INSERT INTO `migrations` VALUES ('22', '2018_07_15_025015_adds_api_token_to_users_table', '14');
INSERT INTO `migrations` VALUES ('23', '2018_07_16_084543_create_permission_tables', '15');

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES ('1', '23', 'App\\User');

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of notifications
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------
INSERT INTO `oauth_access_tokens` VALUES ('65eafe011c7692cc5f12bc3ee4e5e22fdb80812d6efcdfff1440130cd2ec205ebb4f79841f346281', '4', '3', null, '[]', '0', '2018-07-12 09:24:28', '2018-07-12 09:24:28', '2018-07-27 09:24:28');

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of oauth_auth_codes
-- ----------------------------
INSERT INTO `oauth_auth_codes` VALUES ('0ea86fb25f417cc9e0686e3f1a8222f295613abf59ce1ecc616bdaaaca61d2b63e2787d2db0c186d', '4', '3', '[]', '0', '2018-07-12 09:30:17');
INSERT INTO `oauth_auth_codes` VALUES ('1b7bea8d8dfd346a8539c9f7ff88ec5787e9cdef407b8fde68714d23f5aaf25c349dfe0b36095acf', '4', '3', '[]', '1', '2018-07-12 09:34:27');
INSERT INTO `oauth_auth_codes` VALUES ('1cf6cb0f5ec6466895911283017aeb6d7cd9b8f7f38f510b2a39b7af52998f332d1c3f27353068ab', '4', '3', '[]', '0', '2018-07-12 09:27:14');
INSERT INTO `oauth_auth_codes` VALUES ('24f3610972048a24932ef0e262ff7143390bd45744ec05f03f60367af9decd4301ab2773167c9caf', '4', '3', '[]', '0', '2018-07-12 09:09:13');
INSERT INTO `oauth_auth_codes` VALUES ('3d66254a109a0b756dfbcfa627d55d3ec99693bc3f43a747ef5928dd6fc46f96ca4891ce9923bbc9', '4', '3', '[]', '0', '2018-07-12 09:23:46');
INSERT INTO `oauth_auth_codes` VALUES ('6aa8fbc5ca74a81a7a05c7546216e8a8b6dbcf04128134d1c03911ed3129f937e8a3a3d675460770', '4', '3', '[]', '0', '2018-07-12 09:28:53');
INSERT INTO `oauth_auth_codes` VALUES ('79f3a87b8cc12ca971bcbe8960df41e68efc58c11d2ec16637a5190fdddf0ce60cc336fe5e21aa1b', '4', '3', '[]', '0', '2018-07-12 09:13:20');
INSERT INTO `oauth_auth_codes` VALUES ('b6435a3d8cc41efda21a7c2a589ca564372d3f6fbc39fdf89cb23dff6c5a66e064b72f6549753223', '4', '3', '[]', '0', '2018-07-12 09:25:11');
INSERT INTO `oauth_auth_codes` VALUES ('f35b686a47c7102fc70ceba01a15b14b4a619e983e98a45f96b085f58fc86324822f9c7c7be9aae8', '4', '3', '[]', '0', '2018-07-12 09:20:54');

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
INSERT INTO `oauth_clients` VALUES ('1', null, 'Laravel Personal Access Client', 'HVBotBYDEz7azOQxm5j5fNpNZIlbtxVaX1NbRHuG', 'http://localhost', '1', '0', '0', '2018-07-12 08:31:26', '2018-07-12 08:31:26');
INSERT INTO `oauth_clients` VALUES ('2', null, 'Laravel Password Grant Client', 'U3jR2EkiM3LwLKzAjeEnntJG2VaCS7W9cuuTIDay', 'http://localhost', '0', '1', '0', '2018-07-12 08:31:27', '2018-07-12 08:31:27');
INSERT INTO `oauth_clients` VALUES ('3', '1', 'Laravel Test Access Client', 'Suw67fagA8dF8zbKuaoipIWZqPcaqAuSP3ymAT72', 'http://demo.laravelblog.com/auth/callback', '0', '0', '0', '2018-07-12 08:47:04', '2018-07-12 08:47:04');
INSERT INTO `oauth_clients` VALUES ('4', '4', 'Laravel Test Password Client', 'eGv7w4XPrHeXTwQvE1YypBmvRHgS0w2fbZkIGZAo', 'http://localhost/auth/callback', '0', '1', '0', '2018-07-12 09:39:55', '2018-07-12 09:39:55');

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------
INSERT INTO `oauth_personal_access_clients` VALUES ('1', '1', '2018-07-12 08:31:27', '2018-07-12 08:31:27');

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------
INSERT INTO `oauth_refresh_tokens` VALUES ('6a89d601f5f1539379ca6aaff4a8c9f3d4efb03ef8cb2876a383739aaf02844f8c299ecf884454df', '65eafe011c7692cc5f12bc3ee4e5e22fdb80812d6efcdfff1440130cd2ec205ebb4f79841f346281', '0', '2018-08-11 09:24:28');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
INSERT INTO `password_resets` VALUES ('baihua_2011@163.com', '$2y$10$934kaS3/b522jU.AQMfP4.T9Wy0DMpPQRc1MTenMGIgQdjDW6UaYO', '2018-07-13 06:19:45');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', 'Create Post', 'web', '2018-07-16 10:06:44', '2018-07-16 10:06:44');
INSERT INTO `permissions` VALUES ('2', 'Edit Post', 'web', '2018-07-18 05:37:27', '2018-07-18 05:37:27');
INSERT INTO `permissions` VALUES ('3', 'Delete Post', 'web', '2018-07-18 05:37:37', '2018-07-18 05:37:37');
INSERT INTO `permissions` VALUES ('4', 'Administer roles & permissions', 'web', '2018-07-18 05:37:47', '2018-07-18 05:37:47');

-- ----------------------------
-- Table structure for phones
-- ----------------------------
DROP TABLE IF EXISTS `phones`;
CREATE TABLE `phones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phones_user_id_foreign` (`user_id`),
  CONSTRAINT `phones_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of phones
-- ----------------------------
INSERT INTO `phones` VALUES ('1', '小米 8', '1', '2018-07-06 17:49:26', '2018-07-06 17:49:29');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', 'post title one', 'post content one', '2018-07-06 17:44:40', '2018-07-06 17:44:43');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名称',
  `summary` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品简介',
  `detail` text COLLATE utf8_unicode_ci NOT NULL COMMENT '商品详情',
  `status` int(11) NOT NULL COMMENT '状态',
  `sort` int(11) NOT NULL COMMENT '排序序号',
  `remark` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'goods01', 'summary', 'detail', '1', '1', 'remarks', '2018-07-06 15:22:48', '2018-07-06 15:22:51', '2018-07-06 08:13:34');
INSERT INTO `products` VALUES ('2', 'goods02', 'summary', 'detail', '1', '2', 'reamrks', '2018-07-06 16:14:27', '2018-07-06 16:14:30', null);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'Admin', 'web', '2018-07-18 05:38:37', '2018-07-18 05:38:37');
INSERT INTO `roles` VALUES ('2', 'Editor', 'web', '2018-07-18 05:38:49', '2018-07-18 05:38:49');

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES ('1', '2');
INSERT INTO `role_has_permissions` VALUES ('2', '2');
INSERT INTO `role_has_permissions` VALUES ('4', '1');

-- ----------------------------
-- Table structure for specs
-- ----------------------------
DROP TABLE IF EXISTS `specs`;
CREATE TABLE `specs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of specs
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'John', 'EUZKl5p0Qk@laravel.com', '$2y$10$dwLyI0cQP94eSrHyghjV5O9d9aqFG4Fxi3HEoya24J/ocfPqckiIq', null, '2018-07-18 13:41:30', '2018-07-18 13:41:43', null);
INSERT INTO `users` VALUES ('2', 'test', 'test@test.com', '123', 'aMq9YsVaNob6hGA0ydZdquEaI3mwBMVZJAlSQr1U9IeD6W49ybl3zYYQJc4t', '2018-07-18 13:41:34', '2018-07-18 13:41:45', null);
INSERT INTO `users` VALUES ('3', 'test03', 'test03@test.com', '345', null, '2018-07-18 13:41:39', '2018-07-18 13:41:49', null);
INSERT INTO `users` VALUES ('4', 'auth01', 'auth01@test.com', '$2y$10$e2QCVxBa2Z2vcn99HAaemecxy/Amm2QylvcA.7p8llrwTDwPxyyJu', 'OodpwwZqZpdMQT0A8L9Z6T216Tfk8YUSAjr3mGGJhU6BNgVhhUmCTWs5wZES', '2018-07-09 08:32:23', '2018-07-09 08:32:23', null);
INSERT INTO `users` VALUES ('5', 'bai615', 'baihua_2011@163.com', '$2y$10$yvlV/yaWkQIFR.ma1cBIUuSvMaw/OKrpB0QhdyjNIMaJbGgR5b.Ke', 'JeNxIjvfMSyE66NfDGE0M6JqvJ0K5SJY75hWnWZsLhW4sjSx1iuhxckAL7JN', '2018-07-13 06:17:54', '2018-07-13 06:17:54', null);
INSERT INTO `users` VALUES ('6', 'Administrator', 'Administrator@test.com', '$2y$10$UPPgY.4hqHXdcf2EZ8x7xuI63T5RYkT1LTTl0vVUxAuCW8iSHtvnS', null, '2018-07-14 14:22:29', '2018-07-14 14:22:29', null);
INSERT INTO `users` VALUES ('7', 'Birdie Lind', 'jo.lubowitz@hotmail.com', '$2y$10$UPPgY.4hqHXdcf2EZ8x7xuI63T5RYkT1LTTl0vVUxAuCW8iSHtvnS', null, '2018-07-14 14:22:29', '2018-07-14 14:22:29', null);
INSERT INTO `users` VALUES ('8', 'Bailey Murphy', 'telly.weber@gmail.com', '$2y$10$UPPgY.4hqHXdcf2EZ8x7xuI63T5RYkT1LTTl0vVUxAuCW8iSHtvnS', null, '2018-07-14 14:22:29', '2018-07-14 14:22:29', null);
INSERT INTO `users` VALUES ('9', 'Dr. Presley Jacobson V', 'ghomenick@morar.com', '$2y$10$UPPgY.4hqHXdcf2EZ8x7xuI63T5RYkT1LTTl0vVUxAuCW8iSHtvnS', null, '2018-07-14 14:22:29', '2018-07-14 14:22:29', null);
INSERT INTO `users` VALUES ('10', 'Dr. Leopoldo Schulist Sr.', 'windler.judy@hauck.com', '$2y$10$UPPgY.4hqHXdcf2EZ8x7xuI63T5RYkT1LTTl0vVUxAuCW8iSHtvnS', null, '2018-07-14 14:22:29', '2018-07-14 14:22:29', null);
INSERT INTO `users` VALUES ('11', 'Haskell Cremin', 'claude.sawayn@yahoo.com', '$2y$10$UPPgY.4hqHXdcf2EZ8x7xuI63T5RYkT1LTTl0vVUxAuCW8iSHtvnS', null, '2018-07-14 14:22:29', '2018-07-14 14:22:29', null);
INSERT INTO `users` VALUES ('12', 'Annette Schumm', 'naomie81@bednar.com', '$2y$10$UPPgY.4hqHXdcf2EZ8x7xuI63T5RYkT1LTTl0vVUxAuCW8iSHtvnS', null, '2018-07-14 14:22:29', '2018-07-14 14:22:29', null);
INSERT INTO `users` VALUES ('13', 'Nichole Brown', 'federico.larkin@yahoo.com', '$2y$10$UPPgY.4hqHXdcf2EZ8x7xuI63T5RYkT1LTTl0vVUxAuCW8iSHtvnS', null, '2018-07-14 14:22:29', '2018-07-14 14:22:29', null);
INSERT INTO `users` VALUES ('14', 'Fredrick Powlowski', 'amelie.hayes@yahoo.com', '$2y$10$UPPgY.4hqHXdcf2EZ8x7xuI63T5RYkT1LTTl0vVUxAuCW8iSHtvnS', null, '2018-07-14 14:22:29', '2018-07-14 14:22:29', null);
INSERT INTO `users` VALUES ('15', 'Mr. Mustafa Green', 'sklocko@bailey.com', '$2y$10$UPPgY.4hqHXdcf2EZ8x7xuI63T5RYkT1LTTl0vVUxAuCW8iSHtvnS', null, '2018-07-14 14:22:29', '2018-07-14 14:22:29', null);
INSERT INTO `users` VALUES ('16', 'Nathanael Marquardt', 'mike.kiehn@hotmail.com', '$2y$10$UPPgY.4hqHXdcf2EZ8x7xuI63T5RYkT1LTTl0vVUxAuCW8iSHtvnS', null, '2018-07-14 14:22:29', '2018-07-14 14:22:29', null);
INSERT INTO `users` VALUES ('18', '学院君', 'admin@laravelacademy.org', '$2y$10$Hz4yJiSfvprAYr9X3eYXc.ReRr5fz5AqMK9wFSk3Rg.mwwPJMWdwC', null, '2018-07-15 03:24:29', '2018-07-15 03:31:33', 'PKCBvuChLRcCLFy4rCZgYt9xoa2ccnZRn5o9BQ45T4F1luCWsKcZhRX2DM7n');
INSERT INTO `users` VALUES ('19', 'user01', 'user01@test.com', '$2y$10$OdrPs8V79DAvCglDqh2uv.wXu6WfXDFqN7IpnN.yE37HWIi2YRYOC', '91jtfKVMFrLhLvTXXCsTzpNI4Q2pLLmwWaxiKr60hmkfkvBHv7iYCAm3M9Br', '2018-07-15 03:32:29', '2018-07-15 03:32:58', 'wvGyu2oqv8UNCuBdmeXKlOhrmsvsUMnmzyskdfmXLIAhibAG1plFOUCpnjD0');
INSERT INTO `users` VALUES ('20', '学院君1', 'admin1@laravelacademy.org', '$2y$10$fsyB0TbVkPFVKdfL5QE.ae0tTq0BF1LCYjbFNdVrEdL2AuqkC1t7u', null, '2018-07-15 03:36:24', '2018-07-15 03:52:00', 'JUGMe8wcw4HQSh29hP26YlhJhTVYvceK2x6mFCVYNZ8x07kPiW6UlWEfm7HI');
INSERT INTO `users` VALUES ('21', 'user02', 'user02@test.com', '$2y$10$mydOt3cGOFXGiCPsrIcszuNwLcS2uq00MgXoIy8K.f6Y00m2TDXBa', 'eyPKCoZkVdtjhBUObtwlaJMKLnFA1HiZ73alcLnVjTHJfk5B2DyGZUzZH1EU', '2018-07-15 03:37:24', '2018-07-15 03:37:24', null);
INSERT INTO `users` VALUES ('22', 'user03', 'user03@test.com', '$2y$10$3J2CdbZnn9eQTUKVGONLiuoac6VqGu2JvNnaHvb/xd/i9AQyLgVwO', 'j8OJw3SGV1FSI2pUR33hKeggS0s55jZ1fmXrS7j1ml05MlRjAGkhnjI8Q1uT', '2018-07-15 08:24:09', '2018-07-15 08:24:09', null);
INSERT INTO `users` VALUES ('23', 'admin', 'admin@admin.com', '$2y$10$iD.Zd4Mn9rbMXOi.wdWsU.XuRiDZ1tbQkvm4DN7XzxDjbNwZBkoVy', 'HMHkqsQtwShnUtsfhzFS0LQLF2kPwNpp7zQEn5E9M1xnyEUsrRrKQNvQHbnw', '2018-07-18 05:39:56', '2018-07-18 05:39:56', null);
