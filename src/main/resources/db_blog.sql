/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : db_blog

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-04-23 15:49:11
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_blog
-- ----------------------------
INSERT INTO `tb_blog` VALUES ('4', '1', '打', '<p>asd啊爱上</p>', null, '2', '2019-04-15 13:00:10', null, '1');
INSERT INTO `tb_blog` VALUES ('5', '1', '打打打打打打打打打打打打打打打打打打打打打打打打打打打打打打打打', '<p>asd啊爱上 打啊啊打算</p>', null, '2', '2019-04-16 13:00:17', '2019-04-19 13:42:39', '1');
INSERT INTO `tb_blog` VALUES ('6', '1', '硕大的啊', '<p>打大蛇</p>', null, '2', '2019-04-15 15:01:30', null, '0');
INSERT INTO `tb_blog` VALUES ('7', '1', '硕大的啊', '<p>打大蛇</p>', null, '2', '2019-04-15 15:01:34', null, '1');
INSERT INTO `tb_blog` VALUES ('8', '1', '硕大的啊', '<p>打大蛇</p>', null, '2', '2019-04-15 15:01:37', null, '1');
INSERT INTO `tb_blog` VALUES ('9', '5', '美好的一天', '<h1 style=\"font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;\"><span style=\"color: rgb(0, 0, 0);\"></span>美好的一天<br/></h1><p>&nbsp;&nbsp;&nbsp;&nbsp;哈哈哈</p><p><span style=\"color: rgb(0, 0, 0);\">正常的黑色</span><span style=\"color: rgb(0, 0, 0);\">，黑色，<span style=\"color: rgb(0, 0, 0);\">黑色，不正常，红色<span style=\"color: rgb(192, 80, 77);\">，红色，</span></span></span></p><p style=\"text-align:center\"><img src=\"/ueditor/jsp/upload/image/20190419/1555639003149002582.jpg\" title=\"1555639003149002582.jpg\" alt=\"a.jpg\"/></p><p><br/></p>', null, '2', '2019-04-17 15:01:41', '2019-04-19 11:23:16', '1');
INSERT INTO `tb_blog` VALUES ('10', '1', '打的', '<h1 style=\"font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;\">哈哈哈<br/></h1><h1>哎哎哎：<br/></h1><p>&nbsp;&nbsp;&nbsp;&nbsp;哈哈，<br/></p><h2><span style=\"font-family: 隶书, SimLi;\">大蛇</span><br/></h2><p><span style=\"font-family: 隶书, SimLi;\">大萨达<span style=\"font-family: 宋体, SimSun;\"></span><br/></span></p><p><span style=\"font-family: 隶书, SimLi;\"><span style=\"font-family: 宋体, SimSun;\">大蛇昂昂</span></span></p>', null, '2', '2019-04-15 16:35:08', null, '1');
INSERT INTO `tb_blog` VALUES ('11', '1', '大蛇a', '<h1 style=\"font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;\">&nbsp;asd打</h1><p>大蛇<span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">打发</span><br/></p><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">规范非法</span></p><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\"><img src=\"/ueditor/jsp/upload/image/20190415/1555317350620074900.jpg\" title=\"1555317350620074900.jpg\" alt=\"welcome.jpg\"/>哈</span></p><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">哈哈哈</span></p>', null, '2', '2019-04-15 16:35:58', null, '1');
INSERT INTO `tb_blog` VALUES ('12', '1', '大蛇', '<p><img src=\"/ueditor/jsp/upload/image/20190415/1555318070384053834.png\" title=\"1555318070384053834.png\" alt=\"welcome - Copy.png\"/>哈哈哈啊哈哈哈哈啊啊哈哈哈哈啊哈哈哈</p>', null, '2', '2019-04-15 16:48:11', null, '1');
INSERT INTO `tb_blog` VALUES ('13', '1', '我的小熊猫', '<h1 style=\"font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;\">我的小熊猫<br/></h1><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;哈哈，我的小熊猫</p><p><img src=\"/ueditor/jsp/upload/image/20190416/1555374206548080237.jpg\" title=\"1555374206548080237.jpg\" width=\"331\" height=\"307\"/><img src=\"/ueditor/jsp/upload/image/20190416/1555374206549090262.jpg\" title=\"1555374206549090262.jpg\" width=\"206\" height=\"325\"/>&nbsp; &nbsp; <br/></p>', null, '2', '2019-04-16 08:24:41', '2019-04-16 08:41:14', '1');
INSERT INTO `tb_blog` VALUES ('14', '1', '大蛇', '<p>大蛇</p>', null, '2', '2019-04-16 08:37:24', null, '1');
INSERT INTO `tb_blog` VALUES ('15', '1', '大蛇', '', null, '2', '2019-04-16 08:38:23', null, '1');
INSERT INTO `tb_blog` VALUES ('16', '1', 'asd', '<p>打</p>', null, '2', '2019-04-17 09:48:21', '2019-04-19 13:42:33', '1');
INSERT INTO `tb_blog` VALUES ('17', '6', '哎哎哎', '<p>大萨达</p>', null, '2', '2019-04-19 15:36:45', null, '1');
INSERT INTO `tb_blog` VALUES ('18', '1', 'aaa', '<h1 style=\"font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;\">aaa<br/></h1><p><img src=\"/ueditor/jsp/upload/image/20190422/1555919418613035852.jpg\" title=\"1555919418613035852.jpg\" alt=\"timg (3).jpg\" width=\"1631\" height=\"959\"/></p>', null, '2', '2019-04-22 15:50:45', '2019-04-22 16:27:13', '1');
INSERT INTO `tb_blog` VALUES ('19', '10', 'dd', '<p>dd<br/></p>', null, '1', '2019-04-22 15:51:26', null, '1');
INSERT INTO `tb_blog` VALUES ('20', '6', 'ddds', '<p>dd</p>', null, '2', '2019-04-22 16:00:33', null, '1');
INSERT INTO `tb_blog` VALUES ('21', '1', 'da', '<p>dd</p>', null, '2', '2019-04-22 16:00:54', null, '1');

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
INSERT INTO `tb_blog_page_img` VALUES ('1', '欢迎来到我的个人博客', '58e745a68d631.jpg');
INSERT INTO `tb_blog_page_img` VALUES ('2', 'Welcome to my personal blog', '58e7459b95c2e.jpg');
INSERT INTO `tb_blog_page_img` VALUES ('3', '生活就是如此<br>Life is real', '58e745a13cab3.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_blog_type
-- ----------------------------
INSERT INTO `tb_blog_type` VALUES ('1', '生活娱乐', '1544433424305.jpg', '生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐生活娱乐');
INSERT INTO `tb_blog_type` VALUES ('2', '学术技术', 'a.jpg', '学术技术');
INSERT INTO `tb_blog_type` VALUES ('5', '放飞自我', 'aaa (1).png', '放飞自我');
INSERT INTO `tb_blog_type` VALUES ('6', 'dd', '58e745a13cab3.jpg', 'aaa');
INSERT INTO `tb_blog_type` VALUES ('7', 'da的', '58e7459b95c2e.jpg', 'ddd');
INSERT INTO `tb_blog_type` VALUES ('8', 'das', '58e745a68d631.jpg', 'sad');
INSERT INTO `tb_blog_type` VALUES ('9', 'daf', '56e62bf27ded5.jpg', 'fs');
INSERT INTO `tb_blog_type` VALUES ('10', 'fff', '1970eda4e0761c74!500x500.jpg', 'fff');
INSERT INTO `tb_blog_type` VALUES ('11', 'gg', '7f9c8c4a2d83291e0c0f1305e4323ff.png', 'gg');

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
