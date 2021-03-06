/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : game

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-05-04 19:39:52
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
  `lucktime` int(11) DEFAULT NULL COMMENT '账号被锁定时间',
  `unlucktime` int(11) DEFAULT NULL COMMENT '解锁时间',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除,Y是，N否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of kv_admin
-- ----------------------------
INSERT INTO `kv_admin` VALUES ('1', 'admin', 'b602ae29c6725b4f1aee7334f153937c', '1', '1', '0.00', '0.00', '0', 'Y', 'Y', '1462360508', '1462360508', '0', 'N');

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
-- Table structure for kv_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `kv_admin_menu`;
CREATE TABLE `kv_admin_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '菜单名称',
  `url` varchar(100) DEFAULT NULL COMMENT '菜单链接',
  `parent_id` int(10) DEFAULT '0' COMMENT '父类id',
  `sort` smallint(4) DEFAULT '0' COMMENT '从大到小',
  `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '菜单级别',
  `status` char(1) NOT NULL DEFAULT 'Y' COMMENT 'Y启用，N关闭',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除，Y已删除，N未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of kv_admin_menu
-- ----------------------------
INSERT INTO `kv_admin_menu` VALUES ('1', '系统设置', '', '0', '20', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('2', '菜单设置', '/setting-menu.html', '1', '99', '0', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('3', '会员管理', '', '0', '99', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('4', '会员列表', '/users-list.html', '3', '99', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('18', '管理组管理', '/setting-group.html', '1', '97', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('19', '管理员管理', '/setting-manager.html', '1', '96', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('23', '代理管理', '', '0', '93', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('24', '代理列表', '/agent-list.html', '23', '99', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('25', '会员级别', '/users-group.html', '3', '97', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('27', '资金管理', '', '0', '97', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('28', '资金记录', '/money-note.html', '27', '99', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('29', '资金类型', '/money-type.html', '27', '97', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('30', '日志记录', '', '0', '10', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('31', '操作记录', '/log-operate.html', '30', '99', '0', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('32', '管理登录', '/log-login_admin.html', '30', '97', '1', 'Y', 'Y');
INSERT INTO `kv_admin_menu` VALUES ('33', '会员登录', '/log-login_users.html', '30', '95', '1', 'Y', 'Y');
INSERT INTO `kv_admin_menu` VALUES ('34', '代理登录', '/log-login_agent.html', '30', '93', '1', 'Y', 'Y');
INSERT INTO `kv_admin_menu` VALUES ('35', '游戏记录', '', '0', '95', '1', 'Y', 'Y');
INSERT INTO `kv_admin_menu` VALUES ('36', '环球游戏-列表', '/game-hq-list.html', '35', '99', '1', 'Y', 'Y');
INSERT INTO `kv_admin_menu` VALUES ('37', '环球游戏-统计', '/game-hq-count.html', '35', '98', '1', 'Y', 'Y');
INSERT INTO `kv_admin_menu` VALUES ('38', '推广管理', '', '0', '91', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('39', '推广统计', '', '38', '99', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('40', '来源统计', '', '38', '97', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('41', '好友推荐', '', '38', '95', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('42', '活动管理', '', '0', '89', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('43', '优惠活动', '', '42', '99', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('44', '信息管理', '', '0', '87', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('45', '运营公告', '', '44', '99', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('46', '系统通知', '', '44', '97', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('47', '站内信息', '', '44', '95', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('48', '短信发送', '', '44', '93', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('49', '用户留言', '', '44', '91', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('50', '资金记录', '/log-money.html', '30', '91', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('51', '银行卡管理', '/money-bank.html', '27', '95', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('55', '管理登录', '/log-login_admin.html', '30', '96', '1', 'Y', 'Y');
INSERT INTO `kv_admin_menu` VALUES ('58', 'IP黑白名单', '/setting-ip.html', '1', '93', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('59', 'API设置', '/setting-api.html', '1', '91', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('60', '网站设置', '/setting-web.html', '1', '89', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('61', 'URL管理', '', '0', '30', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('62', 'URL设置', '/url-setting.html', '61', '99', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('63', 'URL列表', '/url-list.html', '61', '97', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('64', '会员银行卡', '/users-bank.html', '3', '95', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('65', '游戏管理', '', '0', '42', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('66', '游戏类型', '/game-type.html', '65', '99', '0', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('67', '代理设置', '/agent-host.html', '23', '97', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('68', '网站版本', '/agent-version.html', '23', '93', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('69', '游戏设置', '/agent-game.html', '23', '97', '1', 'Y', 'Y');
INSERT INTO `kv_admin_menu` VALUES ('70', '服务器设置', '/setting-server.html', '1', '98', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('71', '优惠设置', '/setting-sale.html', '1', '89', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('72', '网站管理', '', '0', '89', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('73', '网站域名', '/web-list.html', '72', '99', '1', 'Y', 'N');
INSERT INTO `kv_admin_menu` VALUES ('74', '浏览记录', '/log-view.html', '30', '96', '0', 'Y', 'N');

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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='会员和管理员登陆日志';

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
INSERT INTO `kv_log_login` VALUES ('16', 'admin', '登录成功', 'jffda0tc58q26tf4c9', '127.0.0.1', '1', 'Y', 'Y', '1462182407', 'N');
INSERT INTO `kv_log_login` VALUES ('17', 'admin', '登录成功', 'ltdie9e9oo7w2s4954', '127.0.0.1', '1', 'Y', 'Y', '1462182425', 'N');
INSERT INTO `kv_log_login` VALUES ('18', 'admin', '登录失败', 'e8dta5q48v2w3n234z', '127.0.0.1', '1', 'Y', 'N', '1462188115', 'N');
INSERT INTO `kv_log_login` VALUES ('19', 'admin', '登录失败', 'fbe113c803k7sb95qf', '127.0.0.1', '1', 'Y', 'N', '1462188118', 'N');
INSERT INTO `kv_log_login` VALUES ('20', 'admin', '登录失败', '4cwv29019yf606f538', '127.0.0.1', '1', 'Y', 'N', '1462188123', 'N');
INSERT INTO `kv_log_login` VALUES ('21', 'admin', '登录成功', '1gah25a4of15by0ac5', '127.0.0.1', '1', 'Y', 'Y', '1462258847', 'N');
INSERT INTO `kv_log_login` VALUES ('22', 'admin', '登录成功', 'ahb126v9i0bk50t579', '127.0.0.1', '1', 'Y', 'Y', '1462259550', 'N');
INSERT INTO `kv_log_login` VALUES ('23', 'admin', '登录成功', '8e0x5n07t6745fi8rs', '127.0.0.1', '1', 'Y', 'Y', '1462272541', 'N');
INSERT INTO `kv_log_login` VALUES ('24', 'admin', '登录成功', '44c127b886lsq55536', '127.0.0.1', '1', 'Y', 'Y', '1462335907', 'N');
INSERT INTO `kv_log_login` VALUES ('25', 'admin', '密码错误', 'habm5635u5y8zu2d8c', '127.0.0.1', '1', 'Y', 'N', '1462355042', 'N');
INSERT INTO `kv_log_login` VALUES ('26', 'admin', '密码错误', '10303dlfak004w53fl', '127.0.0.1', '1', 'Y', 'N', '1462356605', 'N');
INSERT INTO `kv_log_login` VALUES ('27', 'admin', '密码错误', 'b4n5497c32c29an3dq', '127.0.0.1', '1', 'Y', 'N', '1462356608', 'N');
INSERT INTO `kv_log_login` VALUES ('28', 'admin', '密码错误', '13b928e971165321gk', '127.0.0.1', '1', 'Y', 'N', '1462356612', 'N');
INSERT INTO `kv_log_login` VALUES ('29', 'admin', '密码错误', '994tvd0ep081555n43', '127.0.0.1', '1', 'Y', 'N', '1462356615', 'N');
INSERT INTO `kv_log_login` VALUES ('30', 'admin', '密码错误', '6vb7acfe2u6h87t4ka', '127.0.0.1', '1', 'Y', 'N', '1462356617', 'N');
INSERT INTO `kv_log_login` VALUES ('31', 'admin', '密码错误', 'r1862885pexnos4r45', '127.0.0.1', '1', 'Y', 'N', '1462356619', 'N');
INSERT INTO `kv_log_login` VALUES ('32', 'admin', '密码错误', '7d0nhaebkfb9bu56cd', '127.0.0.1', '1', 'Y', 'N', '1462356621', 'N');
INSERT INTO `kv_log_login` VALUES ('33', 'admin', '密码错误', 'v46x432c9o154fbl2t', '127.0.0.1', '1', 'Y', 'N', '1462356873', 'N');
INSERT INTO `kv_log_login` VALUES ('34', 'admin', '密码错误', '73e38ccsfy7rc9571v', '127.0.0.1', '1', 'Y', 'N', '1462359881', 'N');
INSERT INTO `kv_log_login` VALUES ('35', 'admin', '密码错误', 't001zzdt7nq09gm945', '127.0.0.1', '1', 'Y', 'N', '1462359983', 'N');
INSERT INTO `kv_log_login` VALUES ('36', 'admin', '登录失败', 'x2265kd72y77059279', '127.0.0.1', '1', 'Y', 'N', '1462360026', 'N');
INSERT INTO `kv_log_login` VALUES ('37', 'admin', '登录失败', '1794508zc3yev7n87c', '127.0.0.1', '1', 'Y', 'N', '1462360029', 'N');
INSERT INTO `kv_log_login` VALUES ('38', 'admin', '登录失败', '8dbook81j7h4b4w4m9', '127.0.0.1', '1', 'Y', 'N', '1462360035', 'N');
INSERT INTO `kv_log_login` VALUES ('39', 'admin', '登录失败', '2766g0ix0a32bdfo4d', '127.0.0.1', '1', 'Y', 'N', '1462360096', 'N');
INSERT INTO `kv_log_login` VALUES ('40', 'admin', '登录失败', '939244ovsks0y0298a', '127.0.0.1', '1', 'Y', 'N', '1462360099', 'N');
INSERT INTO `kv_log_login` VALUES ('41', 'admin', '登录失败', '02nqua427621z3d989', '127.0.0.1', '1', 'Y', 'N', '1462360102', 'N');
INSERT INTO `kv_log_login` VALUES ('42', 'admin', '登录失败', 'v714b2ue6f58ot8543', '127.0.0.1', '1', 'Y', 'N', '1462360132', 'N');
INSERT INTO `kv_log_login` VALUES ('43', 'admin', '密码错误', '9cueck9rx821b41l9m', '127.0.0.1', '1', 'Y', 'N', '1462360149', 'N');
INSERT INTO `kv_log_login` VALUES ('44', 'admin', '密码错误', '47e348u05c40cw4p1z', '127.0.0.1', '1', 'Y', 'N', '1462360156', 'N');
INSERT INTO `kv_log_login` VALUES ('45', 'admin', '密码错误', 'b3ky70d7c6163c6qh4', '127.0.0.1', '1', 'Y', 'N', '1462360158', 'N');
INSERT INTO `kv_log_login` VALUES ('46', 'admin', '密码错误', '95bbn740afiz549cje', '127.0.0.1', '1', 'Y', 'N', '1462360202', 'N');
INSERT INTO `kv_log_login` VALUES ('47', 'admin', '密码错误', 'j71f8v8ay6d3i7706u', '127.0.0.1', '1', 'Y', 'N', '1462360213', 'N');
INSERT INTO `kv_log_login` VALUES ('48', 'admin', '登录失败', '8f5f8bdq0z1e378p0b', '127.0.0.1', '1', 'Y', 'N', '1462360300', 'N');
INSERT INTO `kv_log_login` VALUES ('49', 'admin', '密码错误', 'd9748eh5b5g57c5942', '127.0.0.1', '1', 'Y', 'N', '1462360372', 'N');
INSERT INTO `kv_log_login` VALUES ('50', 'admin', '密码错误', '2po358vmk6019ta01g', '127.0.0.1', '1', 'Y', 'N', '1462360390', 'N');
INSERT INTO `kv_log_login` VALUES ('51', 'admin', '密码错误', '6a2au974v5ci329o1c', '127.0.0.1', '1', 'Y', 'N', '1462360443', 'N');
INSERT INTO `kv_log_login` VALUES ('52', 'admin', '密码错误', 'fd711m7b1z582kfeta', '127.0.0.1', '1', 'Y', 'N', '1462360477', 'N');
INSERT INTO `kv_log_login` VALUES ('53', 'admin', '密码错误', '974o69lw0rs13c6730', '127.0.0.1', '1', 'Y', 'N', '1462360490', 'N');
INSERT INTO `kv_log_login` VALUES ('54', 'admin', '密码错误', 'a9f588629s6i5c163v', '127.0.0.1', '1', 'Y', 'N', '1462360493', 'N');
INSERT INTO `kv_log_login` VALUES ('55', 'admin', '密码错误', '9811a61c52x6f5n258', '127.0.0.1', '1', 'Y', 'N', '1462360503', 'N');
INSERT INTO `kv_log_login` VALUES ('56', 'admin', '密码错误', 'e2j170n26por23aajd', '127.0.0.1', '1', 'Y', 'N', '1462360506', 'N');
INSERT INTO `kv_log_login` VALUES ('57', 'admin', '登录失败', 'f0285p3jeh9d7hc957', '127.0.0.1', '1', 'Y', 'N', '1462360508', 'N');
INSERT INTO `kv_log_login` VALUES ('58', 'admin', '登录失败', '3304a7pj973d767ga6', '127.0.0.1', '1', 'Y', 'N', '1462360511', 'N');

-- ----------------------------
-- Table structure for kv_log_notes
-- ----------------------------
DROP TABLE IF EXISTS `kv_log_notes`;
CREATE TABLE `kv_log_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(10) NOT NULL COMMENT '品牌id',
  `uid` int(11) NOT NULL COMMENT '操作人uid',
  `operator` varchar(100) NOT NULL COMMENT '操作人',
  `content` varchar(200) NOT NULL COMMENT '操作内容',
  `ip` varchar(50) NOT NULL COMMENT '操作ip',
  `is_admin` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y后台管理员,N前台会员',
  `addtime` int(11) NOT NULL COMMENT '操作时间',
  `del` char(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除,Y是，N否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_log_notes_brand_search` (`brand_id`,`is_admin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='操作记录表';

-- ----------------------------
-- Records of kv_log_notes
-- ----------------------------
INSERT INTO `kv_log_notes` VALUES ('1', '1', '1', '<span class=\'red\'>[超]</span>[超级管理员组]admin', '修改登录密码', '127.0.0.1', 'N', '1462339062', 'N');

-- ----------------------------
-- Table structure for kv_log_view
-- ----------------------------
DROP TABLE IF EXISTS `kv_log_view`;
CREATE TABLE `kv_log_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(10) NOT NULL COMMENT '品牌id',
  `uid` int(11) DEFAULT NULL COMMENT '用户ui',
  `username` varchar(32) DEFAULT NULL COMMENT '登录帐号',
  `content` varchar(100) DEFAULT NULL COMMENT '浏览记录',
  `ip` varchar(50) NOT NULL COMMENT '登陆ip',
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
INSERT INTO `kv_session` VALUES ('43s266104x72idf1qk437f7aj835l9k3', '{\"user\":{\"id\":\"1\",\"username\":\"admin\",\"brand_id\":\"1\",\"group_id\":\"1\",\"maxmoney\":\"0.00\",\"operatemoney\":\"0.00\",\"operatettime\":\"0\",\"status\":\"Y\",\"is_luck\":\"N\",\"unlucktime\":\"0\",\"addtime\":\"0\",\"del\":\"N\"},\"group\":{\"id\":\"1\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\\u7ec4\",\"brand_id\":\"1\",\"menus_sel\":\"\",\"menus_add\":null,\"menus_edit\":null,\"menus_del\":null,\"menus_undo\":\"N\",\"menus_exam\":\"N\",\"menus_conf\":\"N\",\"del\":\"N\"}}', '1', 'Y', '1462272346', '1462259550', 'N');
INSERT INTO `kv_session` VALUES ('9h4ks85f4r79b60f7va18qn8lwm8j22s', '{\"user\":{\"id\":\"1\",\"username\":\"admin\",\"brand_id\":\"1\",\"group_id\":\"1\",\"maxmoney\":\"0.00\",\"operatemoney\":\"0.00\",\"operatettime\":\"0\",\"status\":\"Y\",\"is_luck\":\"N\",\"unlucktime\":\"0\",\"addtime\":\"0\",\"del\":\"N\"},\"group\":{\"id\":\"1\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\\u7ec4\",\"brand_id\":\"1\",\"menus_sel\":\"\",\"menus_add\":null,\"menus_edit\":null,\"menus_del\":null,\"menus_undo\":\"N\",\"menus_exam\":\"N\",\"menus_conf\":\"N\",\"del\":\"N\"}}', '1', 'Y', '1462258784', '1462182425', 'N');
INSERT INTO `kv_session` VALUES ('b64wd8du6a71n0grtf85xg81kb9hlf4l', '{\"user\":{\"id\":\"1\",\"username\":\"admin\",\"brand_id\":\"1\",\"group_id\":\"1\",\"maxmoney\":\"0.00\",\"operatemoney\":\"0.00\",\"operatettime\":\"0\",\"status\":\"Y\",\"is_luck\":\"N\",\"unlucktime\":\"0\",\"addtime\":\"0\",\"del\":\"N\"},\"group\":{\"id\":\"1\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\\u7ec4\",\"brand_id\":\"1\",\"menus_sel\":\"\",\"menus_add\":null,\"menus_edit\":null,\"menus_del\":null,\"menus_undo\":\"N\",\"menus_exam\":\"N\",\"menus_conf\":\"N\",\"del\":\"N\"}}', '1', 'Y', '1462355022', '1462335907', 'N');
INSERT INTO `kv_session` VALUES ('rzle863h549efcx52174c54fu9ptaa27', '{\"user\":{\"id\":\"1\",\"username\":\"admin\",\"brand_id\":\"1\",\"group_id\":\"1\",\"maxmoney\":\"0.00\",\"operatemoney\":\"0.00\",\"operatettime\":\"0\",\"status\":\"Y\",\"is_luck\":\"N\",\"unlucktime\":\"0\",\"addtime\":\"0\",\"del\":\"N\"},\"group\":{\"id\":\"1\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\\u7ec4\",\"brand_id\":\"1\",\"menus_sel\":\"\",\"menus_add\":null,\"menus_edit\":null,\"menus_del\":null,\"menus_undo\":\"N\",\"menus_exam\":\"N\",\"menus_conf\":\"N\",\"del\":\"N\"}}', '1', 'Y', '1462259505', '1462258847', 'N');
INSERT INTO `kv_session` VALUES ('v46e5883ad100pgx5256fyc6wc85r317', '{\"user\":{\"id\":\"1\",\"username\":\"admin\",\"brand_id\":\"1\",\"group_id\":\"1\",\"maxmoney\":\"0.00\",\"operatemoney\":\"0.00\",\"operatettime\":\"0\",\"status\":\"Y\",\"is_luck\":\"N\",\"unlucktime\":\"0\",\"addtime\":\"0\",\"del\":\"N\"},\"group\":{\"id\":\"1\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\\u7ec4\",\"brand_id\":\"1\",\"menus_sel\":\"\",\"menus_add\":null,\"menus_edit\":null,\"menus_del\":null,\"menus_undo\":\"N\",\"menus_exam\":\"N\",\"menus_conf\":\"N\",\"del\":\"N\"}}', '1', 'Y', '1462274238', '1462272541', 'N');

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
