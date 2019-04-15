/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : db_blog

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-04-15 14:37:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_blog
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog`;
CREATE TABLE `tb_blog` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '博客ID',
  `BLOG_TYPE` char(1) DEFAULT NULL COMMENT '博客类型',
  `BLOG_TITLE` varchar(255) DEFAULT NULL COMMENT '博客标题',
  `BLOG_CONTENT` longtext COMMENT '博客内容',
  `BLOG_AUTHOR` varchar(255) DEFAULT NULL COMMENT '作者',
  `BLOG_STATE` char(1) DEFAULT NULL COMMENT '博客状态 ‘0’全部 ‘1’草稿，‘2’公开，‘3’私密',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '删除状态，‘1’未删除，‘0’删除',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
