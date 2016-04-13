/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : game

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-04-13 19:56:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kv_admin
-- ----------------------------
DROP TABLE IF EXISTS `kv_admin`;
CREATE TABLE `kv_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'uid',
  `username` varchar(32) NOT NULL COMMENT '帐号',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `brand_id` mediumint(10) NOT NULL COMMENT '品牌id',
  `group_id` tinyint(3) NOT NULL DEFAULT '1' COMMENT '分组id',
  `maxmoney` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '管理员组，每天最大金额操作',
  `operatemoney` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '操作金额',
  `operatettime` int(11) NOT NULL DEFAULT '0' COMMENT '最后操作时间',
  `logintime` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `errorcount` smallint(2) DEFAULT '0' COMMENT '登录错误次数',
  `errortime` int(11) DEFAULT '0' COMMENT '登录错误日期',
  `status` char(1) NOT NULL DEFAULT 'Y' COMMENT '状态,Y启用，N禁用',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除,Y是，N否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of kv_admin
-- ----------------------------

-- ----------------------------
-- Table structure for kv_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `kv_admin_group`;
CREATE TABLE `kv_admin_group` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '组名',
  `brand_id` mediumint(10) NOT NULL COMMENT '品牌id',
  `menus_sel` varchar(255) DEFAULT NULL COMMENT '查看权限，菜单id,用逗号分割',
  `menus_add` varchar(255) DEFAULT NULL COMMENT '添加权限，菜单id,用逗号分割',
  `menus_edit` varchar(255) DEFAULT NULL COMMENT '编辑权限，菜单id,用逗号分割',
  `menus_del` varchar(255) DEFAULT NULL COMMENT '删除权限，菜单id,用逗号分割',
  `menus_undo` char(1) DEFAULT 'N' COMMENT '冲正负,Y有，N无',
  `menus_exam` char(1) DEFAULT 'N' COMMENT '资金审核,Y有，N无',
  `menus_conf` char(1) DEFAULT 'N' COMMENT '资金确认,Y有，N无',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除,Y是，N否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='管理权限组';

-- ----------------------------
-- Records of kv_admin_group
-- ----------------------------

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

-- ----------------------------
-- Records of kv_log_login
-- ----------------------------

-- ----------------------------
-- Table structure for kv_log_view
-- ----------------------------
DROP TABLE IF EXISTS `kv_log_view`;
CREATE TABLE `kv_log_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL COMMENT '登录帐号',
  `url` varchar(200) NOT NULL COMMENT 'url',
  `get` varchar(255) DEFAULT NULL COMMENT 'get值',
  `post` text COMMENT 'post值',
  `ip` varchar(50) NOT NULL COMMENT '登陆ip',
  `brand_id` int(10) NOT NULL COMMENT '品牌id',
  `is_admin` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y后台管理员,N前台会员',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y后台管理员,N前台会员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='会员和管理员登陆日志';

-- ----------------------------
-- Records of kv_log_view
-- ----------------------------

-- ----------------------------
-- Table structure for kv_member
-- ----------------------------
DROP TABLE IF EXISTS `kv_member`;
CREATE TABLE `kv_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '登录帐号',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `brand_id` mediumint(10) NOT NULL COMMENT '品牌id',
  `money` float(10,2) DEFAULT '0.00' COMMENT '账户余额',
  `group_id` tinyint(2) DEFAULT '1' COMMENT '用户级别',
  `transpassword` varchar(32) DEFAULT NULL COMMENT '取款密码',
  `parentid` int(11) DEFAULT '0' COMMENT '直属父类',
  `parenttree` varchar(200) DEFAULT ',' COMMENT '上级所有父类树，使用逗号分割(,1,2,3,....,n,)',
  `subordinatecount` mediumint(8) DEFAULT '0' COMMENT '直属下级会员个数',
  `status` char(1) NOT NULL DEFAULT 'Y' COMMENT '帐号状态N冻结，Y正常',
  `truname` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `birth` varchar(20) DEFAULT NULL COMMENT '出生日期',
  `registertime` int(11) DEFAULT NULL COMMENT '注册时间',
  `registerip` varchar(20) DEFAULT NULL COMMENT '注册ip',
  `logincount` int(11) DEFAULT '0' COMMENT '登录次数',
  `loginip` varchar(20) DEFAULT NULL COMMENT '登录ip',
  `logintime` int(11) DEFAULT NULL COMMENT '登录时间',
  `lastip` varchar(20) DEFAULT NULL COMMENT '上一次登录ip',
  `lasttime` int(11) DEFAULT NULL COMMENT '上一次登录时间',
  `firstmoney` float(10,2) DEFAULT '0.00' COMMENT '首存金额',
  `firsttime` int(11) DEFAULT NULL COMMENT '首存时间',
  `rebate` float(10,2) DEFAULT '0.00' COMMENT '返利总金额',
  `rebatetime` int(11) DEFAULT NULL COMMENT '最后返利时间',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除,Y是，N否',
  PRIMARY KEY (`id`),
  KEY `user_agent_key` (`username`,`brand_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of kv_member
-- ----------------------------

-- ----------------------------
-- Table structure for kv_session
-- ----------------------------
DROP TABLE IF EXISTS `kv_session`;
CREATE TABLE `kv_session` (
  `token` varchar(40) NOT NULL COMMENT 'cookie',
  `session` text NOT NULL COMMENT 'session',
  `uid` int(11) NOT NULL COMMENT '用户uid，用户或管理员',
  `is_admin` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y后台管理员,N前台会员',
  `updatetime` int(11) NOT NULL COMMENT '最后修改时间',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除,Y是，N否',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kv_session
-- ----------------------------

-- ----------------------------
-- Table structure for kv_setting
-- ----------------------------
DROP TABLE IF EXISTS `kv_setting`;
CREATE TABLE `kv_setting` (
  `kvkey` varchar(50) NOT NULL COMMENT 'key字段',
  `kvvalue` text COMMENT '值',
  `type` varchar(20) DEFAULT 'default' COMMENT '设置类型',
  `brand_id` int(10) NOT NULL COMMENT '品牌id',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除,Y是，N否',
  PRIMARY KEY (`kvkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of kv_setting
-- ----------------------------
