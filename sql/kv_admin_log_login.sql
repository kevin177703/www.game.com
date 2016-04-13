/*
Navicat MySQL Data Transfer

Source Server         : 测试-59.188.196.238
Source Server Version : 50173
Source Host           : 59.188.196.238:3306
Source Database       : kevin

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-04-13 19:30:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kv_admin_log_login
-- ----------------------------
DROP TABLE IF EXISTS `kv_admin_log_login`;
CREATE TABLE `kv_admin_log_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户uid',
  `username` varchar(32) NOT NULL COMMENT '登录帐号',
  `type` tinyint(2) NOT NULL COMMENT '操作类型，1登录，2修改密码',
  `status` char(1) NOT NULL COMMENT '状态，成功Y,失败N',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='管理员登录和修改密码操作记录';
