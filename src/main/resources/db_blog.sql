/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50533
Source Host           : localhost:3306
Source Database       : db_blog

Target Server Type    : MYSQL
Target Server Version : 50533
File Encoding         : 65001

Date: 2019-04-22 22:25:25
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
INSERT INTO `tb_blog_page_img` VALUES ('1', '欢迎来到我的个人博客', '9ac0bf6cf7b888b4fc611ed767fd912b.jpg');
INSERT INTO `tb_blog_page_img` VALUES ('2', 'Welcome to my personal blog', '58b8d8c7c2500.jpg');
INSERT INTO `tb_blog_page_img` VALUES ('3', '生活就是如此<br>Life is real', '28531549_1384159005321.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_blog_type
-- ----------------------------
INSERT INTO `tb_blog_type` VALUES ('12', '生活娱乐', '30.jpg', 'aaa');
