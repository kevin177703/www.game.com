/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : game

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-04-11 19:52:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kv_brand
-- ----------------------------
DROP TABLE IF EXISTS `kv_brand`;
CREATE TABLE `kv_brand` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `name` varchar(50) NOT NULL COMMENT '品牌名称',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除,Y是，N否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='品牌列表';

-- ----------------------------
-- Records of kv_brand
-- ----------------------------
INSERT INTO `kv_brand` VALUES ('1', 'Game', '1460373364', 'N');

-- ----------------------------
-- Table structure for kv_brand_host
-- ----------------------------
DROP TABLE IF EXISTS `kv_brand_host`;
CREATE TABLE `kv_brand_host` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '品牌url id',
  `host` varchar(255) NOT NULL COMMENT 'url',
  `app` varchar(20) NOT NULL COMMENT '域名类型',
  `brand_id` int(10) NOT NULL COMMENT '品牌id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理id',
  `addtime` int(11) NOT NULL,
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除,N否，Y是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='品牌url表';

-- ----------------------------
-- Records of kv_brand_host
-- ----------------------------
INSERT INTO `kv_brand_host` VALUES ('1', 'www.game.com', 'home', '1', '0', '1460373364', 'N');
INSERT INTO `kv_brand_host` VALUES ('2', 'admin.game.com', 'admin', '1', '0', '1460373364', 'N');
