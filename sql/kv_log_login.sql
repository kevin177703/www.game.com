/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : game

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-04-13 19:40:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kv_log_login
-- ----------------------------
DROP TABLE IF EXISTS `kv_log_login`;
CREATE TABLE `kv_log_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '登录帐号',
  `explain` varchar(200) NOT NULL DEFAULT '成功' COMMENT '状态说明',
  `ip` varchar(50) NOT NULL COMMENT '登陆ip',
  `brand_id` int(10) NOT NULL COMMENT '品牌id',
  `is_admin` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y后台管理员,N前台会员',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y后台管理员,N前台会员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='会员和管理员登陆日志';
