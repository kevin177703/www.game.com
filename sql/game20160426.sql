/*
Navicat MySQL Data Transfer

Source Server         : 虚拟机-192.168.88.93
Source Server Version : 50617
Source Host           : 192.168.88.93:3306
Source Database       : game

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-04-26 23:58:46
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
  `status` char(1) NOT NULL DEFAULT 'Y' COMMENT '状态,Y启用，N禁用',
  `is_luck` char(1) NOT NULL DEFAULT 'N' COMMENT '锁定状态,Y锁定，N未锁定',
  `unlucktime` int(11) NOT NULL COMMENT '解锁时间',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除,Y是，N否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of kv_admin
-- ----------------------------
INSERT INTO `kv_admin` VALUES ('1', 'admin', 'c61719fc185a47d0ab80a350898a78ff', '1', '1', '0.00', '0.00', '0', 'Y', 'N', '0', '0', 'N');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理权限组';

-- ----------------------------
-- Records of kv_admin_group
-- ----------------------------
INSERT INTO `kv_admin_group` VALUES ('1', '超级管理员组', '1', '', null, null, null, 'N', 'N', 'N', 'N');

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
INSERT INTO `kv_brand` VALUES ('1', '游戏总管理', '1460373364', 'N');

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
  `template_id` varchar(50) NOT NULL DEFAULT '0' COMMENT '模板id',
  `addtime` int(11) NOT NULL,
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除,N否，Y是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='品牌url表';

-- ----------------------------
-- Records of kv_brand_host
-- ----------------------------
INSERT INTO `kv_brand_host` VALUES ('1', 'www.game.com', 'home', '1', '0', '0', '1460373364', 'N');
INSERT INTO `kv_brand_host` VALUES ('2', 'admin.game.com', 'admin', '1', '0', '1', '1460373364', 'N');

-- ----------------------------
-- Table structure for kv_brand_template
-- ----------------------------
DROP TABLE IF EXISTS `kv_brand_template`;
CREATE TABLE `kv_brand_template` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '模板',
  `is_admin` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y后台管理员,N前台会员',
  `addtime` int(11) NOT NULL,
  `del` varchar(255) NOT NULL DEFAULT 'N' COMMENT '是否已删除,N否，Y是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='网站模板';

-- ----------------------------
-- Records of kv_brand_template
-- ----------------------------
INSERT INTO `kv_brand_template` VALUES ('1', 'A2016041101', 'N', '0', 'N');
INSERT INTO `kv_brand_template` VALUES ('2', 'B2016041101', 'Y', '0', 'N');

-- ----------------------------
-- Table structure for kv_log_login
-- ----------------------------
DROP TABLE IF EXISTS `kv_log_login`;
CREATE TABLE `kv_log_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '登录帐号',
  `explain` varchar(50) NOT NULL DEFAULT '' COMMENT '登录日志说明',
  `operate_no` varchar(20) NOT NULL COMMENT '操作编码',
  `ip` varchar(50) NOT NULL COMMENT '登陆ip',
  `brand_id` int(10) NOT NULL COMMENT '品牌id',
  `is_admin` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y后台管理员,N前台会员',
  `status` char(1) NOT NULL DEFAULT 'Y' COMMENT 'Y登录成功，N登录失败',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y后台管理员,N前台会员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='会员和管理员登陆日志';

-- ----------------------------
-- Records of kv_log_login
-- ----------------------------
INSERT INTO `kv_log_login` VALUES ('4', 'abc', '账号不存在', 'd468fon3a05bw65c92', '127.0.0.1', '1', 'Y', 'N', '1461670678', 'N');
INSERT INTO `kv_log_login` VALUES ('5', 'admin', '登录成功', '19i39jb6qe9k5i4282', '127.0.0.1', '1', 'Y', 'Y', '1461670891', 'N');
INSERT INTO `kv_log_login` VALUES ('6', 'admin', '登录成功', 'jdf4864oi205dfdgx1', '127.0.0.1', '1', 'Y', 'Y', '1461670934', 'N');
INSERT INTO `kv_log_login` VALUES ('7', 'admin', '登录成功', '22jmw272329240667b', '192.168.88.90', '1', 'Y', 'Y', '1461683560', 'N');
INSERT INTO `kv_log_login` VALUES ('8', 'admin', '登录成功', 'fjxlz001v079dr5e97', '192.168.88.90', '1', 'Y', 'Y', '1461683642', 'N');
INSERT INTO `kv_log_login` VALUES ('9', 'admin', '登录成功', '8ca8qy51xu475mzc2x', '192.168.88.90', '1', 'Y', 'Y', '1461683722', 'N');
INSERT INTO `kv_log_login` VALUES ('10', 'admin', 'session错误', '163a7fd0df0dr05m5v', '192.168.88.90', '1', 'Y', 'N', '1461685609', 'N');
INSERT INTO `kv_log_login` VALUES ('11', 'admin', 'session错误', '44c5v5np297776514b', '192.168.88.90', '1', 'Y', 'N', '1461685713', 'N');
INSERT INTO `kv_log_login` VALUES ('12', 'admin', '登录失败', '89n578f768xg588af5', '192.168.88.90', '1', 'Y', 'N', '1461686162', 'N');
INSERT INTO `kv_log_login` VALUES ('13', 'admin', '登录失败', 'fwj2f470e977osit8z', '192.168.88.90', '1', 'Y', 'N', '1461686164', 'N');
INSERT INTO `kv_log_login` VALUES ('14', 'admin', '登录失败', '1af5u5a7v9ci015o55', '192.168.88.90', '1', 'Y', 'N', '1461686172', 'N');
INSERT INTO `kv_log_login` VALUES ('15', 'admin', '登录成功', 'dd751m43ez300k51t3', '192.168.88.90', '1', 'Y', 'Y', '1461686251', 'N');

-- ----------------------------
-- Table structure for kv_log_view
-- ----------------------------
DROP TABLE IF EXISTS `kv_log_view`;
CREATE TABLE `kv_log_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL COMMENT '登录帐号',
  `title` varchar(100) DEFAULT NULL COMMENT '用户浏览页面',
  `url` varchar(200) NOT NULL COMMENT 'url',
  `get` varchar(255) DEFAULT NULL COMMENT 'get值',
  `post` text COMMENT 'post值',
  `ip` varchar(50) NOT NULL COMMENT '登陆ip',
  `brand_id` int(10) NOT NULL COMMENT '品牌id',
  `is_admin` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y后台管理员,N前台会员',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y后台管理员,N前台会员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员和管理员登陆日志';

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
  `group_id` tinyint(2) DEFAULT '1' COMMENT '用户级别',
  `money` float(10,2) DEFAULT '0.00' COMMENT '账户余额',
  `transpassword` varchar(32) DEFAULT NULL COMMENT '取款密码',
  `parentid` int(11) DEFAULT '0' COMMENT '直属父类',
  `parenttree` varchar(200) DEFAULT ',' COMMENT '上级所有父类树，使用逗号分割(,1,2,3,....,n,)',
  `subordinatecount` mediumint(8) DEFAULT '0' COMMENT '直属下级会员个数',
  `status` char(1) NOT NULL DEFAULT 'Y' COMMENT '帐号状态N冻结，Y正常',
  `is_luck` char(1) NOT NULL DEFAULT 'N' COMMENT '锁定状态,Y锁定，N未锁定',
  `truname` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `birth` varchar(20) DEFAULT NULL COMMENT '出生日期Y-m-d',
  `registertime` int(11) DEFAULT NULL COMMENT '注册时间',
  `registerip` varchar(20) DEFAULT NULL COMMENT '注册ip',
  `logincount` int(11) DEFAULT '0' COMMENT '登录次数',
  `loginip` varchar(20) DEFAULT NULL COMMENT '登录ip',
  `logintime` int(11) DEFAULT NULL COMMENT '登录时间',
  `lastip` varchar(20) DEFAULT NULL COMMENT '最后一次登录ip',
  `lasttime` int(11) DEFAULT NULL COMMENT '最后一次登录时间',
  `firstmoney` float(10,2) DEFAULT '0.00' COMMENT '首存金额',
  `firsttime` int(11) DEFAULT NULL COMMENT '首存时间',
  `rebate` float(10,2) DEFAULT '0.00' COMMENT '返利总金额',
  `rebatetime` int(11) DEFAULT NULL COMMENT '最后返利时间',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除,Y是，N否',
  PRIMARY KEY (`id`),
  KEY `user_agent_key` (`username`,`brand_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of kv_member
-- ----------------------------

-- ----------------------------
-- Table structure for kv_member_monitor
-- ----------------------------
DROP TABLE IF EXISTS `kv_member_monitor`;
CREATE TABLE `kv_member_monitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(10) NOT NULL COMMENT '品牌id',
  `username` varchar(50) NOT NULL COMMENT '用户账号',
  `title` varchar(100) NOT NULL COMMENT '用户浏览页面',
  `ip` varchar(50) NOT NULL COMMENT '用户ip',
  `pc_no` varchar(50) NOT NULL COMMENT '电脑记录编号',
  `lasttime` int(11) NOT NULL COMMENT '最后时间',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除,Y是，N否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kv_member_monitor
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
  `lasttime` int(11) NOT NULL COMMENT '最后修改时间',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除,Y是，N否',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kv_session
-- ----------------------------
INSERT INTO `kv_session` VALUES ('hasek80d1d9d578qtebv12850p944g35', '{\"user\":{\"id\":\"1\",\"username\":\"admin\",\"password\":\"c61719fc185a47d0ab80a350898a78ff\",\"brand_id\":\"1\",\"group_id\":\"1\",\"maxmoney\":\"0.00\",\"operatemoney\":\"0.00\",\"operatettime\":\"0\",\"status\":\"Y\",\"is_luck\":\"N\",\"unlucktime\":\"0\",\"addtime\":\"0\",\"del\":\"N\"},\"group\":{\"id\":\"1\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\\u7ec4\",\"brand_id\":\"1\",\"menus_sel\":\"\",\"menus_add\":null,\"menus_edit\":null,\"menus_del\":null,\"menus_undo\":\"N\",\"menus_exam\":\"N\",\"menus_conf\":\"N\",\"del\":\"N\"}}', '1', 'Y', '1461686251', '1461686251', 'N');

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
