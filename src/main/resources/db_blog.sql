/*
Navicat MySQL Data Transfer

Source Server         : GG
Source Server Version : 50644
Source Host           : 39.106.76.35:3306
Source Database       : db_blog

Target Server Type    : MYSQL
Target Server Version : 50644
File Encoding         : 65001

Date: 2019-04-28 20:42:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_access
-- ----------------------------
DROP TABLE IF EXISTS `tb_access`;
CREATE TABLE `tb_access` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `ACCESS_TIME` datetime DEFAULT NULL COMMENT '访问时间',
  `ACCESS_IP` varchar(255) DEFAULT NULL COMMENT '来访者IP',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_access
-- ----------------------------
INSERT INTO `tb_access` VALUES ('1', '2019-04-26 09:45:46', null);
INSERT INTO `tb_access` VALUES ('2', '2019-04-26 09:55:50', null);
INSERT INTO `tb_access` VALUES ('3', '2019-04-26 10:02:59', null);
INSERT INTO `tb_access` VALUES ('4', '2019-04-26 10:51:12', '127.0.0.1');
INSERT INTO `tb_access` VALUES ('5', '2019-04-26 10:54:22', '10.10.3.18');
INSERT INTO `tb_access` VALUES ('6', '2019-04-26 11:20:13', '127.0.0.1');
INSERT INTO `tb_access` VALUES ('7', '2019-04-26 11:31:03', '127.0.0.1');
INSERT INTO `tb_access` VALUES ('8', '2019-04-26 13:21:24', '153.37.89.22');
INSERT INTO `tb_access` VALUES ('9', '2019-04-26 13:35:02', '153.37.89.22');
INSERT INTO `tb_access` VALUES ('10', '2019-04-26 13:46:40', '122.192.14.227');
INSERT INTO `tb_access` VALUES ('11', '2019-04-26 13:47:41', '101.227.139.161');
INSERT INTO `tb_access` VALUES ('12', '2019-04-26 13:56:11', '101.89.239.120');
INSERT INTO `tb_access` VALUES ('13', '2019-04-26 14:02:48', '127.0.0.1');
INSERT INTO `tb_access` VALUES ('14', '2019-04-26 14:15:46', '127.0.0.1');
INSERT INTO `tb_access` VALUES ('15', '2019-04-26 14:45:23', '122.192.14.227');
INSERT INTO `tb_access` VALUES ('16', '2019-04-26 14:45:51', '153.37.89.22');
INSERT INTO `tb_access` VALUES ('17', '2019-04-26 14:46:21', '61.151.178.163');
INSERT INTO `tb_access` VALUES ('18', '2019-04-26 14:58:06', '127.0.0.1');
INSERT INTO `tb_access` VALUES ('19', '2019-04-26 15:03:31', '153.37.89.22');
INSERT INTO `tb_access` VALUES ('20', '2019-04-26 15:04:00', '122.192.14.227');
INSERT INTO `tb_access` VALUES ('21', '2019-04-26 15:04:38', '122.192.14.227');
INSERT INTO `tb_access` VALUES ('22', '2019-04-26 15:05:00', '61.129.6.227');
INSERT INTO `tb_access` VALUES ('23', '2019-04-26 16:18:48', '127.0.0.1');
INSERT INTO `tb_access` VALUES ('24', '2019-04-26 17:06:03', '61.129.8.179');
INSERT INTO `tb_access` VALUES ('25', '2019-04-26 17:15:59', '127.0.0.1');
INSERT INTO `tb_access` VALUES ('26', '2019-04-26 17:22:04', '122.192.14.227');
INSERT INTO `tb_access` VALUES ('27', '2019-04-26 17:23:01', '101.91.60.105');
INSERT INTO `tb_access` VALUES ('28', '2019-04-26 17:25:41', '127.0.0.1');
INSERT INTO `tb_access` VALUES ('29', '2019-04-26 17:25:41', '127.0.0.1');
INSERT INTO `tb_access` VALUES ('30', '2019-04-27 10:49:09', '180.106.215.200');
INSERT INTO `tb_access` VALUES ('31', '2019-04-27 11:43:20', '79.107.97.0');
INSERT INTO `tb_access` VALUES ('32', '2019-04-27 12:09:45', '31.169.24.158');
INSERT INTO `tb_access` VALUES ('33', '2019-04-27 12:09:46', '216.201.240.245');
INSERT INTO `tb_access` VALUES ('34', '2019-04-27 12:56:27', '187.32.39.210');
INSERT INTO `tb_access` VALUES ('35', '2019-04-27 14:00:57', '189.186.87.119');
INSERT INTO `tb_access` VALUES ('36', '2019-04-27 14:53:47', '185.173.35.21');
INSERT INTO `tb_access` VALUES ('37', '2019-04-27 16:34:04', '185.254.122.34');
INSERT INTO `tb_access` VALUES ('38', '2019-04-27 17:08:07', '101.132.177.14');
INSERT INTO `tb_access` VALUES ('39', '2019-04-27 18:00:40', '177.105.235.76');
INSERT INTO `tb_access` VALUES ('40', '2019-04-27 18:24:28', '125.163.143.26');
INSERT INTO `tb_access` VALUES ('41', '2019-04-27 19:41:03', '103.227.145.114');
INSERT INTO `tb_access` VALUES ('42', '2019-04-27 19:51:24', '190.114.237.250');
INSERT INTO `tb_access` VALUES ('43', '2019-04-27 20:28:13', '106.42.116.38');
INSERT INTO `tb_access` VALUES ('44', '2019-04-27 23:08:17', '122.228.19.79');
INSERT INTO `tb_access` VALUES ('45', '2019-04-28 01:05:05', '82.132.118.90, 161.53.180.21');
INSERT INTO `tb_access` VALUES ('46', '2019-04-28 02:31:42', '177.11.136.23');
INSERT INTO `tb_access` VALUES ('47', '2019-04-28 03:11:54', '188.43.227.101');
INSERT INTO `tb_access` VALUES ('48', '2019-04-28 03:19:43', '177.85.88.188');
INSERT INTO `tb_access` VALUES ('49', '2019-04-28 04:53:05', '60.191.38.78');
INSERT INTO `tb_access` VALUES ('50', '2019-04-28 05:19:12', '47.101.195.242');
INSERT INTO `tb_access` VALUES ('51', '2019-04-28 05:52:24', '39.107.154.16');
INSERT INTO `tb_access` VALUES ('52', '2019-04-28 07:08:43', '47.52.210.105');
INSERT INTO `tb_access` VALUES ('53', '2019-04-28 07:15:18', '170.79.202.112');
INSERT INTO `tb_access` VALUES ('54', '2019-04-28 07:37:12', '36.81.246.182');
INSERT INTO `tb_access` VALUES ('55', '2019-04-28 07:57:38', '47.92.141.208');
INSERT INTO `tb_access` VALUES ('56', '2019-04-28 08:17:46', '39.106.76.35:80, 111.173.191.222');
INSERT INTO `tb_access` VALUES ('57', '2019-04-28 08:24:28', '85.112.70.2, 5.57.6.32');
INSERT INTO `tb_access` VALUES ('58', '2019-04-28 08:25:25', '127.0.0.1');
INSERT INTO `tb_access` VALUES ('59', '2019-04-28 08:28:44', '42.236.10.125');
INSERT INTO `tb_access` VALUES ('60', '2019-04-28 08:29:11', '180.163.220.5');
INSERT INTO `tb_access` VALUES ('61', '2019-04-28 08:34:47', '153.37.89.22');

-- ----------------------------
-- Table structure for tb_blog
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog`;
CREATE TABLE `tb_blog` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '博客ID',
  `BLOG_TYPE` bigint(20) NOT NULL COMMENT '博客类型',
  `BLOG_TITLE` varchar(255) NOT NULL COMMENT '博客标题',
  `BLOG_CONTENT` longtext COMMENT '博客内容',
  `BLOG_AUTHOR` varchar(255) DEFAULT NULL COMMENT '作者',
  `BLOG_STATE` char(1) NOT NULL COMMENT '博客状态 ‘0’全部 ‘1’草稿，‘2’公开，‘3’私密',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '删除状态，‘1’未删除，‘0’删除',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_blog
-- ----------------------------

-- ----------------------------
-- Table structure for tb_blog_page_img
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_page_img`;
CREATE TABLE `tb_blog_page_img` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '页面滚动图ID',
  `IMG_TITLE` varchar(255) DEFAULT NULL COMMENT '页面滚动图标题',
  `IMG_URL` varchar(255) DEFAULT NULL COMMENT '页面滚动图片名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_blog_page_img
-- ----------------------------
INSERT INTO `tb_blog_page_img` VALUES ('1', '欢迎来到我的个人博客', '页面滚动图1.jpg');
INSERT INTO `tb_blog_page_img` VALUES ('2', 'Welcome to my personal blog', '页面滚动图2.jpg');
INSERT INTO `tb_blog_page_img` VALUES ('3', '生活就是如此<br>Life is real', '页面滚动图3.jpg');

-- ----------------------------
-- Table structure for tb_blog_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_type`;
CREATE TABLE `tb_blog_type` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '博客类型ID',
  `BLOGTYPE_NAME` varchar(255) DEFAULT NULL COMMENT '博客类型名称',
  `BLOGTYPE_IMG` varchar(255) DEFAULT NULL COMMENT '博客类型图片路径',
  `BLOGTYPE_DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '博客类型描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_blog_type
-- ----------------------------

-- ----------------------------
-- Table structure for tb_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_message`;
CREATE TABLE `tb_message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '留言ID',
  `MESSAGE_NAME` varchar(255) DEFAULT NULL COMMENT '留言昵称',
  `MESSAGE_CONTENT` varchar(255) DEFAULT NULL COMMENT '留言内容',
  `MESSAGE_PHONE` bigint(11) DEFAULT NULL COMMENT '留言手机',
  `MESSAGE_EMAIL` varchar(255) DEFAULT NULL COMMENT '留言邮箱',
  `REPLY_ID` bigint(20) DEFAULT NULL COMMENT '回复ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '留言时间',
  `DELETE_FLAG` varchar(1) DEFAULT NULL COMMENT '删除状态,''0''已删除,''1''未删除',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_message
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USERNAME` varchar(255) DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'gang', '108999gg');
