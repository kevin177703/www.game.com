/*
Navicat MySQL Data Transfer

Source Server         : 测试-59.188.196.238
Source Server Version : 50173
Source Host           : 59.188.196.238:3306
Source Database       : kevin

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-04-13 19:25:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kv_setting
-- ----------------------------
DROP TABLE IF EXISTS `kv_setting`;
CREATE TABLE `kv_setting` (
  `kvkey` varchar(50) NOT NULL COMMENT 'key字段',
  `kvvalue` text COMMENT '值',
  `type` varchar(20) DEFAULT 'default' COMMENT '设置类型',
  PRIMARY KEY (`kvkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';
