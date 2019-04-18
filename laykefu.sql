/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : whisper

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-03-17 15:03:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ws_admins
-- ----------------------------
DROP TABLE IF EXISTS `ws_admins`;
CREATE TABLE `ws_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '密码',
  `last_login_ip` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ws_admins
-- ----------------------------
INSERT INTO `ws_admins` VALUES ('1', 'admin', 'cbb2fc826b6cbb2305cca827529b739b', '127.0.0.1', '1521187852', '1');
INSERT INTO `ws_admins` VALUES ('2', '小白', 'cb78913de44f5a36ab63e8ffacde44b0', '', '0', '1');

-- ----------------------------
-- Table structure for ws_chat_log
-- ----------------------------
DROP TABLE IF EXISTS `ws_chat_log`;
CREATE TABLE `ws_chat_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` varchar(55) NOT NULL COMMENT '网页用户随机编号(仅为记录参考记录)',
  `from_name` varchar(255) NOT NULL COMMENT '发送者名称',
  `from_avatar` varchar(255) NOT NULL COMMENT '发送者头像',
  `to_id` varchar(55) NOT NULL COMMENT '接收方',
  `to_name` varchar(255) NOT NULL COMMENT '接受者名称',
  `content` text NOT NULL COMMENT '发送的内容',
  `time_line` int(10) NOT NULL COMMENT '记录时间',
  PRIMARY KEY (`id`),
  KEY `fromid` (`from_id`(4)) USING BTREE,
  KEY `toid` (`to_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_chat_log
-- ----------------------------
INSERT INTO `ws_chat_log` VALUES ('1', '2', '会员2', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服', '你在干嘛呢？', '1521177459');
INSERT INTO `ws_chat_log` VALUES ('2', '2', '会员2', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服', '啊大大啊阿达是', '1521177463');
INSERT INTO `ws_chat_log` VALUES ('3', 'KF1', '客服', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '2', '会员2', '嗯嗯嗯', '1521177471');
INSERT INTO `ws_chat_log` VALUES ('4', 'KF1', '客服', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '2', '会员2', '其味无穷二群翁群翁', '1521177480');
INSERT INTO `ws_chat_log` VALUES ('5', '2', '会员2', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服', '怎么解释', '1521177488');
INSERT INTO `ws_chat_log` VALUES ('6', 'KF1', '客服', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '2', '会员2', '驱蚊器二', '1521179009');
INSERT INTO `ws_chat_log` VALUES ('7', '2', '会员2', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服', '说话没法关闭', '1521179074');
INSERT INTO `ws_chat_log` VALUES ('8', '2', '会员2', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服', ' face[猪头] ', '1521179109');
INSERT INTO `ws_chat_log` VALUES ('9', 'KF1', '客服', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '2', '会员2', ' face[黑线] ', '1521179115');
INSERT INTO `ws_chat_log` VALUES ('10', '2', '会员2', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服', '你们干嘛呢？', '1521179267');
INSERT INTO `ws_chat_log` VALUES ('11', '2', '会员2', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服', '阿萨德', '1521179419');
INSERT INTO `ws_chat_log` VALUES ('12', '2', '会员2', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服', ' face[猪头] ', '1521179862');
INSERT INTO `ws_chat_log` VALUES ('13', '2', '会员2', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服', '好朋友', '1521187501');
INSERT INTO `ws_chat_log` VALUES ('14', '2', '会员2', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服', 'qwewq ', '1521188657');
INSERT INTO `ws_chat_log` VALUES ('15', '2', '会员2', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服', 'sdasd ', '1521188837');
INSERT INTO `ws_chat_log` VALUES ('16', 'KF1', '客服', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '2', '会员2', 'asda ', '1521188849');
INSERT INTO `ws_chat_log` VALUES ('17', '2', '会员2', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服', 'asdas ', '1521188868');
INSERT INTO `ws_chat_log` VALUES ('18', 'KF1', '客服', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '2', '会员2', '干么的', '1521188880');
INSERT INTO `ws_chat_log` VALUES ('19', '2', '会员2', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服', '阿达', '1521189214');
INSERT INTO `ws_chat_log` VALUES ('20', '2', '会员2', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服', '请问', '1521189860');
INSERT INTO `ws_chat_log` VALUES ('21', 'KF1', '客服', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '2', '会员2', 'AS ', '1521190128');
INSERT INTO `ws_chat_log` VALUES ('22', 'KF1', '客服', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '1', '会员1', '驱蚊器无', '1521194101');
INSERT INTO `ws_chat_log` VALUES ('23', '1', '会员1', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服', '请问', '1521194123');

-- ----------------------------
-- Table structure for ws_groups
-- ----------------------------
DROP TABLE IF EXISTS `ws_groups`;
CREATE TABLE `ws_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分组id',
  `name` varchar(255) NOT NULL COMMENT '分组名称',
  `status` tinyint(1) NOT NULL COMMENT '分组状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_groups
-- ----------------------------
INSERT INTO `ws_groups` VALUES ('1', '售前组', '1');
INSERT INTO `ws_groups` VALUES ('2', '售后组', '1');

-- ----------------------------
-- Table structure for ws_kf_config
-- ----------------------------
DROP TABLE IF EXISTS `ws_kf_config`;
CREATE TABLE `ws_kf_config` (
  `id` int(11) NOT NULL,
  `max_service` int(11) NOT NULL COMMENT '每个客服最大服务的客户数',
  `change_status` tinyint(1) NOT NULL COMMENT '是否启用转接',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_kf_config
-- ----------------------------
INSERT INTO `ws_kf_config` VALUES ('1', '5', '1');

-- ----------------------------
-- Table structure for ws_now_data
-- ----------------------------
DROP TABLE IF EXISTS `ws_now_data`;
CREATE TABLE `ws_now_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_talking` int(5) NOT NULL DEFAULT '0' COMMENT '正在咨询的人数',
  `in_queue` int(5) NOT NULL DEFAULT '0' COMMENT '排队等待的人数',
  `online_kf` int(5) NOT NULL COMMENT '在线客服数',
  `success_in` int(5) NOT NULL COMMENT '成功接入用户',
  `total_in` int(5) NOT NULL COMMENT '今日累积接入的用户',
  `now_date` varchar(10) NOT NULL COMMENT '当前日期',
  PRIMARY KEY (`id`),
  KEY `now_date` (`now_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_now_data
-- ----------------------------
INSERT INTO `ws_now_data` VALUES ('1', '1', '0', '1', '14', '14', '2018-03-16');

-- ----------------------------
-- Table structure for ws_reply
-- ----------------------------
DROP TABLE IF EXISTS `ws_reply`;
CREATE TABLE `ws_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(255) NOT NULL COMMENT '自动回复的内容',
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否自动回复',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_reply
-- ----------------------------
INSERT INTO `ws_reply` VALUES ('1', '欢迎使用whisper', '2');

-- ----------------------------
-- Table structure for ws_service_data
-- ----------------------------
DROP TABLE IF EXISTS `ws_service_data`;
CREATE TABLE `ws_service_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_talking` int(5) NOT NULL DEFAULT '0' COMMENT '正在咨询的人数',
  `in_queue` int(5) NOT NULL DEFAULT '0' COMMENT '排队等待的人数',
  `online_kf` int(5) NOT NULL COMMENT '在线客服数',
  `success_in` int(5) NOT NULL COMMENT '成功接入用户',
  `total_in` int(5) NOT NULL COMMENT '今日累积接入的用户',
  `add_date` varchar(10) NOT NULL COMMENT '写入的日期',
  `add_hour` varchar(2) NOT NULL COMMENT '写入的小时数',
  `add_minute` varchar(2) NOT NULL COMMENT '写入的分钟数',
  PRIMARY KEY (`id`),
  KEY `add_date,add_hour` (`add_date`,`add_hour`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_service_data
-- ----------------------------
INSERT INTO `ws_service_data` VALUES ('1', '2', '1', '1', '2', '4', '2018-03-15', '09', '10');
INSERT INTO `ws_service_data` VALUES ('2', '0', '0', '0', '3', '4', '2018-03-15', '10', '15');
INSERT INTO `ws_service_data` VALUES ('3', '3', '4', '1', '4', '6', '2018-03-15', '11', '20');
INSERT INTO `ws_service_data` VALUES ('4', '0', '0', '0', '0', '2', '2018-03-15', '12', '25');
INSERT INTO `ws_service_data` VALUES ('5', '0', '0', '0', '0', '2', '2018-03-15', '13', '30');
INSERT INTO `ws_service_data` VALUES ('6', '0', '1', '0', '0', '3', '2018-03-15', '14', '35');
INSERT INTO `ws_service_data` VALUES ('7', '0', '0', '0', '0', '4', '2018-03-15', '15', '40');
INSERT INTO `ws_service_data` VALUES ('8', '0', '0', '0', '0', '4', '2018-03-15', '16', '45');
INSERT INTO `ws_service_data` VALUES ('9', '0', '0', '0', '0', '4', '2018-03-15', '17', '50');
INSERT INTO `ws_service_data` VALUES ('10', '0', '0', '0', '0', '4', '2018-03-15', '18', '55');
INSERT INTO `ws_service_data` VALUES ('11', '0', '0', '0', '1', '4', '2018-03-15', '08', '05');
INSERT INTO `ws_service_data` VALUES ('12', '0', '0', '1', '99', '100', '2018-03-16', '11', '35');
INSERT INTO `ws_service_data` VALUES ('13', '0', '0', '1', '102', '103', '2018-03-16', '12', '15');
INSERT INTO `ws_service_data` VALUES ('14', '0', '0', '1', '102', '103', '2018-03-16', '12', '55');
INSERT INTO `ws_service_data` VALUES ('15', '0', '0', '1', '1', '1', '2018-03-16', '14', '37');
INSERT INTO `ws_service_data` VALUES ('16', '0', '0', '1', '1', '1', '2018-03-16', '15', '17');
INSERT INTO `ws_service_data` VALUES ('17', '0', '0', '1', '1', '1', '2018-03-16', '15', '57');
INSERT INTO `ws_service_data` VALUES ('18', '1', '0', '1', '3', '3', '2018-03-16', '17', '31');
INSERT INTO `ws_service_data` VALUES ('19', '2', '0', '1', '14', '14', '2018-03-16', '18', '11');

-- ----------------------------
-- Table structure for ws_service_log
-- ----------------------------
DROP TABLE IF EXISTS `ws_service_log`;
CREATE TABLE `ws_service_log` (
  `user_id` varchar(55) NOT NULL COMMENT '会员的id',
  `client_id` varchar(20) NOT NULL COMMENT '会员的客户端标识',
  `user_name` varchar(255) DEFAULT NULL COMMENT '会员名称',
  `user_avatar` varchar(155) NOT NULL COMMENT '会员头像',
  `user_ip` varchar(15) NOT NULL COMMENT '会员的ip',
  `kf_id` varchar(55) NOT NULL COMMENT '服务的客服id',
  `start_time` int(10) NOT NULL COMMENT '开始服务时间',
  `end_time` int(10) DEFAULT '0' COMMENT '结束服务时间',
  `group_id` int(11) NOT NULL COMMENT '服务的客服的分组id',
  KEY `user_id,client_id` (`user_id`,`client_id`) USING BTREE,
  KEY `kf_id,start_time,end_time` (`kf_id`,`start_time`,`end_time`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_service_log
-- ----------------------------

-- ----------------------------
-- Table structure for ws_users
-- ----------------------------
DROP TABLE IF EXISTS `ws_users`;
CREATE TABLE `ws_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客服id',
  `user_name` varchar(255) NOT NULL COMMENT '客服名称',
  `user_pwd` varchar(32) NOT NULL COMMENT '客服登录密码',
  `user_avatar` varchar(255) NOT NULL COMMENT '客服头像',
  `status` tinyint(1) NOT NULL COMMENT '用户状态',
  `online` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否在线',
  `group_id` int(11) DEFAULT '0' COMMENT '所属分组id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_users
-- ----------------------------
INSERT INTO `ws_users` VALUES ('1', '客服小白', 'cb78913de44f5a36ab63e8ffacde44b0', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '1', '2', '1');
INSERT INTO `ws_users` VALUES ('2', '客服小美', 'cb78913de44f5a36ab63e8ffacde44b0', '/uploads/20171024/43cb54a995b89d0926e1de31af0074fc.jpg', '1', '2', '1');

-- ----------------------------
-- Table structure for ws_words
-- ----------------------------
DROP TABLE IF EXISTS `ws_words`;
CREATE TABLE `ws_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL COMMENT '常用语内容',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `status` tinyint(1) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_words
-- ----------------------------
INSERT INTO `ws_words` VALUES ('1', '欢迎来到whisper v1.0.0', '2017-10-25 12:51:09', '1');
