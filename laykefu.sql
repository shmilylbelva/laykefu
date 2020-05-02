/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : laykefu

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-05-02 17:45:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ws_admins`
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
INSERT INTO `ws_admins` VALUES ('1', 'admin', 'f6a3266ead53c628db1b126064854c85', '127.0.0.1', '1555922103', '1');
INSERT INTO `ws_admins` VALUES ('2', '小白', 'f6a3266ead53c628db1b126064854c85', '', '0', '1');

-- ----------------------------
-- Table structure for `ws_chat_log`
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
) ENGINE=MyISAM AUTO_INCREMENT=382 DEFAULT CHARSET=utf8;

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
INSERT INTO `ws_chat_log` VALUES ('24', '20', '会员20', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '曾多次', '1554972387');
INSERT INTO `ws_chat_log` VALUES ('25', '19', '会员19', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '你好啊', '1554972733');
INSERT INTO `ws_chat_log` VALUES ('26', '29', '会员29', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '？', '1554972742');
INSERT INTO `ws_chat_log` VALUES ('27', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '29', '会员29', '欢迎来到whisper v1.0.0', '1554972831');
INSERT INTO `ws_chat_log` VALUES ('28', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '19', '会员19', '有什么可以帮您的吗', '1554973249');
INSERT INTO `ws_chat_log` VALUES ('29', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '19', '会员19', '坎坎坷坷', '1554974294');
INSERT INTO `ws_chat_log` VALUES ('30', '19', '会员19', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '?\n ', '1554974307');
INSERT INTO `ws_chat_log` VALUES ('31', '29', '会员29', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '电饭锅', '1554975199');
INSERT INTO `ws_chat_log` VALUES ('32', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '12', '会员12', '？', '1555044840');
INSERT INTO `ws_chat_log` VALUES ('33', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '10', '会员10', '买了吗', '1555044938');
INSERT INTO `ws_chat_log` VALUES ('34', '10', '会员10', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'bhbh\n', '1555044949');
INSERT INTO `ws_chat_log` VALUES ('35', '40', '会员40', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190412/3dd3e22c882cde8d03727bb9f49e5a2f.jpg]', '1555051721');
INSERT INTO `ws_chat_log` VALUES ('36', '26', '会员26', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '才是 ', '1555062210');
INSERT INTO `ws_chat_log` VALUES ('37', '28', '会员28', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '哈哈', '1555062773');
INSERT INTO `ws_chat_log` VALUES ('38', '32', '会员32', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '？\n', '1555062910');
INSERT INTO `ws_chat_log` VALUES ('39', '22', '会员22', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '第三次', '1555063206');
INSERT INTO `ws_chat_log` VALUES ('40', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '22', '会员22', 'vvv', '1555063215');
INSERT INTO `ws_chat_log` VALUES ('41', '29', '会员29', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'fff', '1555302699');
INSERT INTO `ws_chat_log` VALUES ('42', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '29', '会员29', '厉害了', '1555302706');
INSERT INTO `ws_chat_log` VALUES ('43', '2', '会员2', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '第三方', '1555302844');
INSERT INTO `ws_chat_log` VALUES ('44', '13', '会员13', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190415/35cbff48fae474278ec4df9b4c74679c.jpg]', '1555303126');
INSERT INTO `ws_chat_log` VALUES ('45', '13', '会员13', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', ' face[可怜] ', '1555303135');
INSERT INTO `ws_chat_log` VALUES ('46', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '打的', '1555304880');
INSERT INTO `ws_chat_log` VALUES ('47', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '阿瓦尔爱我', '1555305005');
INSERT INTO `ws_chat_log` VALUES ('48', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '而威尔', '1555305014');
INSERT INTO `ws_chat_log` VALUES ('49', '25', '会员25', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '娃儿啊', '1555305027');
INSERT INTO `ws_chat_log` VALUES ('50', '25', '会员25', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '问问热', '1555305033');
INSERT INTO `ws_chat_log` VALUES ('51', '25', '会员25', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '沃尔沃确认QR', '1555305042');
INSERT INTO `ws_chat_log` VALUES ('52', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '3R ', '1555305054');
INSERT INTO `ws_chat_log` VALUES ('53', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '535', '1555305094');
INSERT INTO `ws_chat_log` VALUES ('54', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'WRW', '1555305103');
INSERT INTO `ws_chat_log` VALUES ('55', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'EW', '1555305146');
INSERT INTO `ws_chat_log` VALUES ('56', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'WE', '1555305176');
INSERT INTO `ws_chat_log` VALUES ('57', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'ASDF', '1555306228');
INSERT INTO `ws_chat_log` VALUES ('58', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '25', '25', '三个', '1555306886');
INSERT INTO `ws_chat_log` VALUES ('59', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '对对对', '1555307686');
INSERT INTO `ws_chat_log` VALUES ('60', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '对对对晚上', '1555307696');
INSERT INTO `ws_chat_log` VALUES ('61', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '对对对', '1555308661');
INSERT INTO `ws_chat_log` VALUES ('62', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '趣闻趣闻', '1555308667');
INSERT INTO `ws_chat_log` VALUES ('63', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '25', '25', 'www', '1555308679');
INSERT INTO `ws_chat_log` VALUES ('64', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '？\n', '1555309856');
INSERT INTO `ws_chat_log` VALUES ('65', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'fff', '1555309932');
INSERT INTO `ws_chat_log` VALUES ('66', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '对对对', '1555310384');
INSERT INTO `ws_chat_log` VALUES ('67', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '111', '1555310423');
INSERT INTO `ws_chat_log` VALUES ('68', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '222', '1555310538');
INSERT INTO `ws_chat_log` VALUES ('69', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190415/23cdc93564f0459d35d6fde82a83c4b2.jpg]', '1555310545');
INSERT INTO `ws_chat_log` VALUES ('70', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '为', '1555310867');
INSERT INTO `ws_chat_log` VALUES ('71', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '25', '25', 'fff', '1555310935');
INSERT INTO `ws_chat_log` VALUES ('72', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '啥啥啥', '1555310939');
INSERT INTO `ws_chat_log` VALUES ('73', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '打的\n', '1555311257');
INSERT INTO `ws_chat_log` VALUES ('74', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '对对对', '1555311468');
INSERT INTO `ws_chat_log` VALUES ('75', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '是多少', '1555311476');
INSERT INTO `ws_chat_log` VALUES ('76', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190415/a2b136ffd54fdd9594c3af8c514a03d1.jpg]', '1555311688');
INSERT INTO `ws_chat_log` VALUES ('77', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '得到', '1555313234');
INSERT INTO `ws_chat_log` VALUES ('78', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '天梯图', '1555313346');
INSERT INTO `ws_chat_log` VALUES ('79', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '得到', '1555313463');
INSERT INTO `ws_chat_log` VALUES ('80', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '？\n', '1555313469');
INSERT INTO `ws_chat_log` VALUES ('81', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '试试', '1555313588');
INSERT INTO `ws_chat_log` VALUES ('82', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '试试', '1555313593');
INSERT INTO `ws_chat_log` VALUES ('83', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '茶色的', '1555313598');
INSERT INTO `ws_chat_log` VALUES ('84', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '且', '1555313624');
INSERT INTO `ws_chat_log` VALUES ('85', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '算法', '1555313720');
INSERT INTO `ws_chat_log` VALUES ('86', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '按时', '1555313904');
INSERT INTO `ws_chat_log` VALUES ('87', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'dd', '1555315486');
INSERT INTO `ws_chat_log` VALUES ('88', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'asdad', '1555315489');
INSERT INTO `ws_chat_log` VALUES ('89', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'aaa', '1555315498');
INSERT INTO `ws_chat_log` VALUES ('90', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'qqqq', '1555315509');
INSERT INTO `ws_chat_log` VALUES ('91', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '爱的方式', '1555316101');
INSERT INTO `ws_chat_log` VALUES ('92', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '阿萨德', '1555317221');
INSERT INTO `ws_chat_log` VALUES ('93', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '阿萨', '1555317227');
INSERT INTO `ws_chat_log` VALUES ('94', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '25', '25', '是多少', '1555317508');
INSERT INTO `ws_chat_log` VALUES ('95', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '顺丰到付', '1555317604');
INSERT INTO `ws_chat_log` VALUES ('96', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '你比\n', '1555317714');
INSERT INTO `ws_chat_log` VALUES ('97', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '25', '25', 'fff', '1555317727');
INSERT INTO `ws_chat_log` VALUES ('98', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '比比比', '1555317957');
INSERT INTO `ws_chat_log` VALUES ('99', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '25', '25', '问问', '1555317963');
INSERT INTO `ws_chat_log` VALUES ('100', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '25', '25', '的', '1555317969');
INSERT INTO `ws_chat_log` VALUES ('101', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'www', '1555317973');
INSERT INTO `ws_chat_log` VALUES ('102', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '25', '25', '问问', '1555317981');
INSERT INTO `ws_chat_log` VALUES ('103', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '25', '25', '是多少', '1555318039');
INSERT INTO `ws_chat_log` VALUES ('104', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '消息', '1555318075');
INSERT INTO `ws_chat_log` VALUES ('105', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '25', '25', '呃呃呃', '1555318114');
INSERT INTO `ws_chat_log` VALUES ('106', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190415/3e295220ec71c70d32bdb0c773ea5a7f.jpg]', '1555318185');
INSERT INTO `ws_chat_log` VALUES ('107', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '25', '25', ' face[互粉] ', '1555318201');
INSERT INTO `ws_chat_log` VALUES ('108', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190415/201e8aaebe78f0b7e5928d307de9c3af.jpg]', '1555319059');
INSERT INTO `ws_chat_log` VALUES ('109', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '25', '25', ' face[微笑] ', '1555320755');
INSERT INTO `ws_chat_log` VALUES ('110', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'ew', '1555321009');
INSERT INTO `ws_chat_log` VALUES ('111', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '25', '25', '嗯嗯', '1555321018');
INSERT INTO `ws_chat_log` VALUES ('112', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'ew', '1555321021');
INSERT INTO `ws_chat_log` VALUES ('113', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'dsf', '1555321136');
INSERT INTO `ws_chat_log` VALUES ('114', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '25', '25', '丝瓜水', '1555321152');
INSERT INTO `ws_chat_log` VALUES ('115', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'erew ', '1555321154');
INSERT INTO `ws_chat_log` VALUES ('116', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '方法', '1555377765');
INSERT INTO `ws_chat_log` VALUES ('117', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '34', '会员34', '订单', '1555396347');
INSERT INTO `ws_chat_log` VALUES ('118', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '34', '会员34', '、、、', '1555397905');
INSERT INTO `ws_chat_log` VALUES ('119', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '34', '会员34', '对对对', '1555398011');
INSERT INTO `ws_chat_log` VALUES ('120', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '34', '会员34', '？', '1555398100');
INSERT INTO `ws_chat_log` VALUES ('121', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '34', '会员34', 'ccc', '1555398400');
INSERT INTO `ws_chat_log` VALUES ('122', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '34', '会员34', '消息', '1555398502');
INSERT INTO `ws_chat_log` VALUES ('123', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '34', '会员34', 'XX', '1555398519');
INSERT INTO `ws_chat_log` VALUES ('124', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '34', '会员34', '啊啊', '1555398523');
INSERT INTO `ws_chat_log` VALUES ('125', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '34', '会员34', '订单', '1555398607');
INSERT INTO `ws_chat_log` VALUES ('126', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '订单', '1555401900');
INSERT INTO `ws_chat_log` VALUES ('127', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '收到', '1555401958');
INSERT INTO `ws_chat_log` VALUES ('128', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '串串', '1555401986');
INSERT INTO `ws_chat_log` VALUES ('129', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '佛挡杀佛', '1555402006');
INSERT INTO `ws_chat_log` VALUES ('130', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '到手的', '1555402030');
INSERT INTO `ws_chat_log` VALUES ('131', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '无的放矢', '1555402083');
INSERT INTO `ws_chat_log` VALUES ('132', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '消息', '1555402273');
INSERT INTO `ws_chat_log` VALUES ('133', '', '', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '地方', '1555402344');
INSERT INTO `ws_chat_log` VALUES ('134', '34', '会员34', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '大幅度', '1555402561');
INSERT INTO `ws_chat_log` VALUES ('135', '34', '会员34', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '手动阀', '1555402695');
INSERT INTO `ws_chat_log` VALUES ('136', '34', '会员34', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '对对对', '1555403545');
INSERT INTO `ws_chat_log` VALUES ('137', '34', '会员34', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '大幅度', '1555403559');
INSERT INTO `ws_chat_log` VALUES ('138', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '34', '会员34', '方法', '1555403566');
INSERT INTO `ws_chat_log` VALUES ('139', '34', '会员34', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '大幅度', '1555403610');
INSERT INTO `ws_chat_log` VALUES ('140', '34', '会员34', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '大幅度', '1555403934');
INSERT INTO `ws_chat_log` VALUES ('141', '34', '会员34', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '胜多负少', '1555404178');
INSERT INTO `ws_chat_log` VALUES ('142', '18', '会员18', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '个人股', '1555404203');
INSERT INTO `ws_chat_log` VALUES ('143', '18', '会员18', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '反倒是', '1555404240');
INSERT INTO `ws_chat_log` VALUES ('144', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '18', '会员18', '刚刚', '1555404277');
INSERT INTO `ws_chat_log` VALUES ('145', '18', '会员18', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '婉儿', '1555404348');
INSERT INTO `ws_chat_log` VALUES ('146', '18', '会员18', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'argue', '1555404396');
INSERT INTO `ws_chat_log` VALUES ('147', '18', '会员18', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '分', '1555404841');
INSERT INTO `ws_chat_log` VALUES ('148', '18', '会员18', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '分分', '1555404852');
INSERT INTO `ws_chat_log` VALUES ('149', '18', '会员18', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '热', '1555404918');
INSERT INTO `ws_chat_log` VALUES ('150', '18', '会员18', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '让他让他', '1555404944');
INSERT INTO `ws_chat_log` VALUES ('151', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '18', '会员18', '擦擦擦', '1555404993');
INSERT INTO `ws_chat_log` VALUES ('152', '18', '会员18', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '订单', '1555405383');
INSERT INTO `ws_chat_log` VALUES ('153', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '18', '会员18', '订单', '1555405389');
INSERT INTO `ws_chat_log` VALUES ('154', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '18', '会员18', '啊啊啊', '1555405394');
INSERT INTO `ws_chat_log` VALUES ('155', '18', '会员18', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '手动阀', '1555405441');
INSERT INTO `ws_chat_log` VALUES ('156', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '18', '会员18', '撒大声地所', '1555405446');
INSERT INTO `ws_chat_log` VALUES ('157', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '18', '会员18', '而二人', '1555405559');
INSERT INTO `ws_chat_log` VALUES ('158', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '18', '会员18', '而乏味', '1555405593');
INSERT INTO `ws_chat_log` VALUES ('159', '18', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '阿达', '1555405715');
INSERT INTO `ws_chat_log` VALUES ('160', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '18', '会员18', '是多少', '1555405720');
INSERT INTO `ws_chat_log` VALUES ('161', '18', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '订单', '1555405741');
INSERT INTO `ws_chat_log` VALUES ('162', '1', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'fff', '1555405911');
INSERT INTO `ws_chat_log` VALUES ('163', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '1', '会员1', '问问', '1555405919');
INSERT INTO `ws_chat_log` VALUES ('164', '1', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '大幅度发', '1555406092');
INSERT INTO `ws_chat_log` VALUES ('165', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '1', '会员1', '是多少', '1555406097');
INSERT INTO `ws_chat_log` VALUES ('166', '1', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '问问热翁', '1555406193');
INSERT INTO `ws_chat_log` VALUES ('167', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '1', '会员1', '收到', '1555406202');
INSERT INTO `ws_chat_log` VALUES ('168', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '1', '会员1', '热热热', '1555406212');
INSERT INTO `ws_chat_log` VALUES ('169', '1', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '啊', '1555406298');
INSERT INTO `ws_chat_log` VALUES ('170', '1', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '热热热', '1555406301');
INSERT INTO `ws_chat_log` VALUES ('171', '1', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '是的分公司', '1555406699');
INSERT INTO `ws_chat_log` VALUES ('172', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '1', '会员1', '似睡非睡', '1555406706');
INSERT INTO `ws_chat_log` VALUES ('173', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '阿尔法', '1555406881');
INSERT INTO `ws_chat_log` VALUES ('174', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '28', '会员28', '娃儿啊翁人', '1555406894');
INSERT INTO `ws_chat_log` VALUES ('175', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '28', '会员28', '头条', '1555406925');
INSERT INTO `ws_chat_log` VALUES ('176', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '28', '会员28', '二二二', '1555407188');
INSERT INTO `ws_chat_log` VALUES ('177', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '士大夫', '1555407235');
INSERT INTO `ws_chat_log` VALUES ('178', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '28', '会员28', '打的', '1555407292');
INSERT INTO `ws_chat_log` VALUES ('179', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'AdA', '1555407302');
INSERT INTO `ws_chat_log` VALUES ('180', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '28', '会员28', 'WER', '1555407374');
INSERT INTO `ws_chat_log` VALUES ('181', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'ASDF \n', '1555407407');
INSERT INTO `ws_chat_log` VALUES ('182', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '28', '会员28', 'RET', '1555407417');
INSERT INTO `ws_chat_log` VALUES ('183', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '阿斯蒂芬', '1555407827');
INSERT INTO `ws_chat_log` VALUES ('184', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '暗示法S', '1555407909');
INSERT INTO `ws_chat_log` VALUES ('185', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '28', '会员28', '阿萨德发的', '1555407917');
INSERT INTO `ws_chat_log` VALUES ('186', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '嗯嗯', '1555408199');
INSERT INTO `ws_chat_log` VALUES ('187', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'asdf', '1555408431');
INSERT INTO `ws_chat_log` VALUES ('188', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'dd', '1555408458');
INSERT INTO `ws_chat_log` VALUES ('189', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'srt', '1555408507');
INSERT INTO `ws_chat_log` VALUES ('190', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'sdf', '1555408583');
INSERT INTO `ws_chat_log` VALUES ('191', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'asdf', '1555408782');
INSERT INTO `ws_chat_log` VALUES ('192', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'fff', '1555408950');
INSERT INTO `ws_chat_log` VALUES ('193', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'wre', '1555408981');
INSERT INTO `ws_chat_log` VALUES ('194', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'asdf', '1555409001');
INSERT INTO `ws_chat_log` VALUES ('195', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '订单', '1555409588');
INSERT INTO `ws_chat_log` VALUES ('196', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '手动阀', '1555409604');
INSERT INTO `ws_chat_log` VALUES ('197', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '地方', '1555409617');
INSERT INTO `ws_chat_log` VALUES ('198', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190417/28e2589d9155810a4277c61aafc3ae40.jpg]', '1555472899');
INSERT INTO `ws_chat_log` VALUES ('199', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '[qq_1]', '1555472962');
INSERT INTO `ws_chat_log` VALUES ('200', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '[qq_1]', '1555473274');
INSERT INTO `ws_chat_log` VALUES ('201', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '[来][困]', '1555475796');
INSERT INTO `ws_chat_log` VALUES ('202', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '[挤眼]', '1555475881');
INSERT INTO `ws_chat_log` VALUES ('203', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[黑线]', '1555476070');
INSERT INTO `ws_chat_log` VALUES ('204', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[哈哈]', '1555476243');
INSERT INTO `ws_chat_log` VALUES ('205', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[弱]', '1555476391');
INSERT INTO `ws_chat_log` VALUES ('206', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[睡]', '1555476449');
INSERT INTO `ws_chat_log` VALUES ('207', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[蛋糕]', '1555476838');
INSERT INTO `ws_chat_log` VALUES ('208', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '28', '会员28', ' face[囧] ', '1555476853');
INSERT INTO `ws_chat_log` VALUES ('209', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '28', '会员28', ' face[浮云] ', '1555476910');
INSERT INTO `ws_chat_log` VALUES ('210', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[吐]', '1555477067');
INSERT INTO `ws_chat_log` VALUES ('211', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[互粉]', '1555477086');
INSERT INTO `ws_chat_log` VALUES ('212', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[困]', '1555477117');
INSERT INTO `ws_chat_log` VALUES ('213', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[草泥马]', '1555477137');
INSERT INTO `ws_chat_log` VALUES ('214', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[怒骂]', '1555477187');
INSERT INTO `ws_chat_log` VALUES ('215', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[蛋糕]', '1555477264');
INSERT INTO `ws_chat_log` VALUES ('216', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[互粉]', '1555477281');
INSERT INTO `ws_chat_log` VALUES ('217', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[赞]', '1555477310');
INSERT INTO `ws_chat_log` VALUES ('218', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[蛋糕]', '1555477952');
INSERT INTO `ws_chat_log` VALUES ('219', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[草泥马]', '1555478004');
INSERT INTO `ws_chat_log` VALUES ('220', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[拜拜]', '1555478090');
INSERT INTO `ws_chat_log` VALUES ('221', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[来]', '1555478096');
INSERT INTO `ws_chat_log` VALUES ('222', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[来]', '1555479462');
INSERT INTO `ws_chat_log` VALUES ('223', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190417/26098bb86473142443ff40f40b578928.jpg]', '1555479570');
INSERT INTO `ws_chat_log` VALUES ('224', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '@是多少', '1555479631');
INSERT INTO `ws_chat_log` VALUES ('225', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[蛋糕]', '1555479905');
INSERT INTO `ws_chat_log` VALUES ('226', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190417/35c4cebea611478b1bdd2b7b49100d9b.jpg]', '1555481595');
INSERT INTO `ws_chat_log` VALUES ('227', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[左哼哼]', '1555482452');
INSERT INTO `ws_chat_log` VALUES ('228', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190417/cfd66c4adf08ded041196eff3c4bcea7.jpg]', '1555482455');
INSERT INTO `ws_chat_log` VALUES ('229', '28', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190417/7fa9151dc529fc5272ae7c89d5de7de2.jpg]', '1555482592');
INSERT INTO `ws_chat_log` VALUES ('230', '11', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190417/9757beda11398097ab822d95d77e05de.jpg]', '1555483261');
INSERT INTO `ws_chat_log` VALUES ('231', '11', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '放大', '1555487965');
INSERT INTO `ws_chat_log` VALUES ('232', '11', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '地方', '1555488027');
INSERT INTO `ws_chat_log` VALUES ('233', '11', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[衰]', '1555488482');
INSERT INTO `ws_chat_log` VALUES ('234', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '11', '会员11', '刚刚', '1555488492');
INSERT INTO `ws_chat_log` VALUES ('235', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '11', '会员11', 'img[/uploads/20190417/910a32338e3455ec970afbc166d61802.jpeg]', '1555488544');
INSERT INTO `ws_chat_log` VALUES ('236', '11', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190417/ffd3a99c4c8aeb26176774e9eb599e76.jpg]', '1555488794');
INSERT INTO `ws_chat_log` VALUES ('237', '11', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190417/c6d731682cf8029e7db41f541952dfd3.jpg]', '1555488800');
INSERT INTO `ws_chat_log` VALUES ('238', '11', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '阿福', '1555488809');
INSERT INTO `ws_chat_log` VALUES ('239', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190417/7d91800158c746d07f032ad887b42aed.jpg]', '1555488940');
INSERT INTO `ws_chat_log` VALUES ('240', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190417/793d65b2f4d4142b802c18672db2e2f2.jpg]', '1555492516');
INSERT INTO `ws_chat_log` VALUES ('241', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190417/4d8b62766792808931cee5b6ed406a51.jpg]', '1555492522');
INSERT INTO `ws_chat_log` VALUES ('242', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '撒擦', '1555492923');
INSERT INTO `ws_chat_log` VALUES ('243', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '德赛电池', '1555492927');
INSERT INTO `ws_chat_log` VALUES ('244', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '方法', '1555492996');
INSERT INTO `ws_chat_log` VALUES ('245', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '撒旦法', '1555493294');
INSERT INTO `ws_chat_log` VALUES ('246', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '阿打算', '1555493355');
INSERT INTO `ws_chat_log` VALUES ('247', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190417/5422defd927f4cbb89032b10d863915c.jpg]', '1555493358');
INSERT INTO `ws_chat_log` VALUES ('248', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '阿斯蒂芬', '1555493560');
INSERT INTO `ws_chat_log` VALUES ('249', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[来]', '1555493570');
INSERT INTO `ws_chat_log` VALUES ('250', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[白眼]', '1555493612');
INSERT INTO `ws_chat_log` VALUES ('251', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[左哼哼]', '1555493663');
INSERT INTO `ws_chat_log` VALUES ('252', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', '娃娃人', '1555493665');
INSERT INTO `ws_chat_log` VALUES ('253', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[弱]', '1555493696');
INSERT INTO `ws_chat_log` VALUES ('254', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '35', '会员35', '按时', '1555493702');
INSERT INTO `ws_chat_log` VALUES ('255', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'DSA', '1555493712');
INSERT INTO `ws_chat_log` VALUES ('256', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[奥特曼]', '1555496504');
INSERT INTO `ws_chat_log` VALUES ('257', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[酷]', '1555496510');
INSERT INTO `ws_chat_log` VALUES ('258', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'qwer', '1555550822');
INSERT INTO `ws_chat_log` VALUES ('259', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '35', '会员35', '订单', '1555550826');
INSERT INTO `ws_chat_log` VALUES ('260', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[熊猫]', '1555558243');
INSERT INTO `ws_chat_log` VALUES ('261', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '35', '会员35', ' face[兔子] ', '1555558300');
INSERT INTO `ws_chat_log` VALUES ('262', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[来]', '1555558358');
INSERT INTO `ws_chat_log` VALUES ('263', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[泪]', '1555558473');
INSERT INTO `ws_chat_log` VALUES ('264', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[失望]', '1555558637');
INSERT INTO `ws_chat_log` VALUES ('265', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[可怜]', '1555558666');
INSERT INTO `ws_chat_log` VALUES ('266', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[话筒]', '1555558692');
INSERT INTO `ws_chat_log` VALUES ('267', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '35', '会员35', '放散阀', '1555558695');
INSERT INTO `ws_chat_log` VALUES ('268', 'KF1', '客服小白', '/uploads/20171024/902b5294f41f6a7d1e1451c7c0969a21.jpg', '35', '会员35', ' face[熊猫] ', '1555558698');
INSERT INTO `ws_chat_log` VALUES ('269', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'face[浮云]', '1555559039');
INSERT INTO `ws_chat_log` VALUES ('270', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'dd ', '1555561823');
INSERT INTO `ws_chat_log` VALUES ('271', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[undefined]', '1555567315');
INSERT INTO `ws_chat_log` VALUES ('272', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[undefined]', '1555568091');
INSERT INTO `ws_chat_log` VALUES ('273', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[undefined]', '1555568777');
INSERT INTO `ws_chat_log` VALUES ('274', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[undefined]', '1555568839');
INSERT INTO `ws_chat_log` VALUES ('275', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[undefined]', '1555568948');
INSERT INTO `ws_chat_log` VALUES ('276', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[undefined]', '1555569790');
INSERT INTO `ws_chat_log` VALUES ('277', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[undefined]', '1555569830');
INSERT INTO `ws_chat_log` VALUES ('278', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[undefined]', '1555569858');
INSERT INTO `ws_chat_log` VALUES ('279', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[undefined]', '1555569899');
INSERT INTO `ws_chat_log` VALUES ('280', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[undefined]', '1555570286');
INSERT INTO `ws_chat_log` VALUES ('281', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[undefined]', '1555570453');
INSERT INTO `ws_chat_log` VALUES ('282', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[undefined]', '1555570475');
INSERT INTO `ws_chat_log` VALUES ('283', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/a78be947dc13eeedff7268fd698c3274.jpg]', '1555571058');
INSERT INTO `ws_chat_log` VALUES ('284', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/1ebe908388a03b6deb9605057aceb0d0.jpg]', '1555571076');
INSERT INTO `ws_chat_log` VALUES ('285', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/16c70fe2b130da78be5107bec503eed6.jpg]', '1555571076');
INSERT INTO `ws_chat_log` VALUES ('286', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/d7f8aee4b6bb699b7fab01c732da627f.jpg]', '1555571211');
INSERT INTO `ws_chat_log` VALUES ('287', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/32bb2e3a81fa8ec61f959888bc6664b7.jpg]', '1555571216');
INSERT INTO `ws_chat_log` VALUES ('288', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/aa8465887c11529b49e838f80794f2de.jpg]', '1555571216');
INSERT INTO `ws_chat_log` VALUES ('289', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/d1f91f5de06346c72dbf635e4a53a5d7.jpg]', '1555571234');
INSERT INTO `ws_chat_log` VALUES ('290', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/d8705faeff978c2d5e4b04a845ae29ca.jpg]', '1555571235');
INSERT INTO `ws_chat_log` VALUES ('291', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/a5a1203a52193f04d70bc610434c0b64.jpg]', '1555571235');
INSERT INTO `ws_chat_log` VALUES ('292', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/2bb14d2885294c1900e006b6c6a0d574.png]', '1555571248');
INSERT INTO `ws_chat_log` VALUES ('293', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/41b9345817d3f01d738df24f922e2d2c.png]', '1555571248');
INSERT INTO `ws_chat_log` VALUES ('294', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/26d79eb5497a3b7735e8ed0a4ed58ced.png]', '1555571248');
INSERT INTO `ws_chat_log` VALUES ('295', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/d04160036f242bc1fe4b97229a477251.png]', '1555571248');
INSERT INTO `ws_chat_log` VALUES ('296', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/56319f1fbf9eda8eaab7280d2ad93275.png]', '1555571279');
INSERT INTO `ws_chat_log` VALUES ('297', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/e2d0f04f47cb8f6eedce8bc81c11d71d.png]', '1555571279');
INSERT INTO `ws_chat_log` VALUES ('298', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/4a28c2532398b3e033966cd058ceadcf.png]', '1555571279');
INSERT INTO `ws_chat_log` VALUES ('299', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/188130ba22dfa331c4db389c7e3e25c7.png]', '1555571279');
INSERT INTO `ws_chat_log` VALUES ('300', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/a6951f3e42aa6972bb47b66eafb020a8.png]', '1555571279');
INSERT INTO `ws_chat_log` VALUES ('301', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/1fa625d548a3bf71be290ab3ad844b4c.jpg]', '1555571909');
INSERT INTO `ws_chat_log` VALUES ('302', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/76c3d053bb32cf8ac88b26dfca8277d5.jpg]', '1555572261');
INSERT INTO `ws_chat_log` VALUES ('303', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/c779878b470466286adaff9bed29d39a.jpg]', '1555572273');
INSERT INTO `ws_chat_log` VALUES ('304', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/5db5c00e19170d6b9a04feb949d041bc.jpg]', '1555573729');
INSERT INTO `ws_chat_log` VALUES ('305', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/3417ed30ab5963d6c9846cea8c1521f4.png]', '1555573733');
INSERT INTO `ws_chat_log` VALUES ('306', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/61eb241fd2451dbbc4e5515ffa3366a4.jpg]', '1555573832');
INSERT INTO `ws_chat_log` VALUES ('307', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/47a25f1e32f6d814ea50f8046c1f95e0.jpg]', '1555573836');
INSERT INTO `ws_chat_log` VALUES ('308', '35', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF1', '客服小白', 'img[/uploads/20190418/87b0d78760851fc8a90a91087f52c497.png]', '1555573856');
INSERT INTO `ws_chat_log` VALUES ('309', '32', '我', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', 'KF2', '客服小美', '对对对', '1555645612');
INSERT INTO `ws_chat_log` VALUES ('310', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '32', '会员32', '？', '1555645620');
INSERT INTO `ws_chat_log` VALUES ('311', '7', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'sxs', '1555652476');
INSERT INTO `ws_chat_log` VALUES ('312', '7', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'face[生病]', '1555652516');
INSERT INTO `ws_chat_log` VALUES ('313', '7', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'img[/uploads/20190419/5a96d788c6bdca64e237783d5584cdb2.jpg]', '1555652827');
INSERT INTO `ws_chat_log` VALUES ('314', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '7', '会员7', 'fff', '1555901905');
INSERT INTO `ws_chat_log` VALUES ('315', '7', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', '方法发顺丰单', '1555901919');
INSERT INTO `ws_chat_log` VALUES ('316', '7', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', '阿斯蒂芬', '1555901935');
INSERT INTO `ws_chat_log` VALUES ('317', '7', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', '算法', '1555901943');
INSERT INTO `ws_chat_log` VALUES ('318', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '7', '会员7', '？？', '1555901959');
INSERT INTO `ws_chat_log` VALUES ('319', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '7', '会员7', 'ZXC', '1555901975');
INSERT INTO `ws_chat_log` VALUES ('320', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '7', '会员7', '？？', '1555901992');
INSERT INTO `ws_chat_log` VALUES ('321', '7', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', '顶顶顶顶', '1555902011');
INSERT INTO `ws_chat_log` VALUES ('322', '7', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', '程序', '1555902103');
INSERT INTO `ws_chat_log` VALUES ('323', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'cxzc ', '1555902166');
INSERT INTO `ws_chat_log` VALUES ('324', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '16', '会员16', 'ZC', '1555902176');
INSERT INTO `ws_chat_log` VALUES ('325', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'ASC  ', '1555902183');
INSERT INTO `ws_chat_log` VALUES ('326', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'sdf', '1555902275');
INSERT INTO `ws_chat_log` VALUES ('327', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'asdf', '1555902322');
INSERT INTO `ws_chat_log` VALUES ('328', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'sdv', '1555902348');
INSERT INTO `ws_chat_log` VALUES ('329', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'ff', '1555902504');
INSERT INTO `ws_chat_log` VALUES ('330', '16', '会员16', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'agf', '1555902686');
INSERT INTO `ws_chat_log` VALUES ('331', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'we', '1555902921');
INSERT INTO `ws_chat_log` VALUES ('332', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'werqwer', '1555902969');
INSERT INTO `ws_chat_log` VALUES ('333', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'sdfgsd', '1555903584');
INSERT INTO `ws_chat_log` VALUES ('334', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '16', '会员16', '发给', '1555904898');
INSERT INTO `ws_chat_log` VALUES ('335', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '16', '会员16', '手动阀', '1555904928');
INSERT INTO `ws_chat_log` VALUES ('336', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'xx', '1555905725');
INSERT INTO `ws_chat_log` VALUES ('337', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'xcxc', '1555911349');
INSERT INTO `ws_chat_log` VALUES ('338', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '16', '会员16', '啊擦擦', '1555911358');
INSERT INTO `ws_chat_log` VALUES ('339', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'ADA', '1555911386');
INSERT INTO `ws_chat_log` VALUES ('340', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '16', '会员16', 'ADADSDD', '1555911393');
INSERT INTO `ws_chat_log` VALUES ('341', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '16', '会员16', 'SSSS', '1555911400');
INSERT INTO `ws_chat_log` VALUES ('342', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '16', '会员16', 'AAAA', '1555911403');
INSERT INTO `ws_chat_log` VALUES ('343', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '16', '会员16', '啥啥啥', '1555911514');
INSERT INTO `ws_chat_log` VALUES ('344', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '16', '会员16', '暗室逢灯ASDF', '1555911569');
INSERT INTO `ws_chat_log` VALUES ('345', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'DD', '1555911584');
INSERT INTO `ws_chat_log` VALUES ('346', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '16', '会员16', 'DDDSS', '1555911587');
INSERT INTO `ws_chat_log` VALUES ('347', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'asdf', '1555911693');
INSERT INTO `ws_chat_log` VALUES ('348', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '16', '会员16', '啥啥啥', '1555911698');
INSERT INTO `ws_chat_log` VALUES ('349', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'werwe', '1555911796');
INSERT INTO `ws_chat_log` VALUES ('350', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'xxx', '1555911896');
INSERT INTO `ws_chat_log` VALUES ('351', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'ddd', '1555912220');
INSERT INTO `ws_chat_log` VALUES ('352', '16', '会员16', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'ddd', '1555912265');
INSERT INTO `ws_chat_log` VALUES ('353', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'ddd', '1555913525');
INSERT INTO `ws_chat_log` VALUES ('354', '16', '我', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'dfd', '1555915282');
INSERT INTO `ws_chat_log` VALUES ('355', '16', '会员16', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'lkl', '1555917460');
INSERT INTO `ws_chat_log` VALUES ('356', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '16', '会员16', '辣妈辣妹', '1555917470');
INSERT INTO `ws_chat_log` VALUES ('357', '16', '会员16', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'jjj', '1555917475');
INSERT INTO `ws_chat_log` VALUES ('358', '16', '会员16', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', ',,,', '1555917705');
INSERT INTO `ws_chat_log` VALUES ('359', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '16', '会员16', ' face[熊猫] ', '1555917716');
INSERT INTO `ws_chat_log` VALUES ('360', '24', '会员24', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', '你好', '1555923630');
INSERT INTO `ws_chat_log` VALUES ('361', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '24', '会员24', '会员你好', '1555923641');
INSERT INTO `ws_chat_log` VALUES ('362', '24', '会员24', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'face[微笑]', '1555923646');
INSERT INTO `ws_chat_log` VALUES ('363', '24', '会员24', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'img[/uploads/20190422/c711483ed9f45440c21e53f4c7045f1d.jpg]', '1555923649');
INSERT INTO `ws_chat_log` VALUES ('364', '24', '会员24', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', '哈哈，小美', '1556069806');
INSERT INTO `ws_chat_log` VALUES ('365', '24', '会员24', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'face[泪]', '1556069864');
INSERT INTO `ws_chat_log` VALUES ('366', '24', '会员24', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'img[/uploads/20190424/3cc3b93fabe10ca3a1d37d4c1c9efff0.jpg]', '1556071532');
INSERT INTO `ws_chat_log` VALUES ('367', '24', '会员24', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'face[哈哈]', '1556071540');
INSERT INTO `ws_chat_log` VALUES ('368', '24', '会员24', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'img[/uploads/20190424/c12a9595e42e56df1396d5a92e5881cb.jpg]', '1556074762');
INSERT INTO `ws_chat_log` VALUES ('369', '24', '会员24', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'face[爱你]', '1556074768');
INSERT INTO `ws_chat_log` VALUES ('370', '29', '会员29', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', '你好', '1556075968');
INSERT INTO `ws_chat_log` VALUES ('371', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '29', '会员29', '是不是农村', '1556075980');
INSERT INTO `ws_chat_log` VALUES ('372', '24', '会员24', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'xxx', '1556085611');
INSERT INTO `ws_chat_log` VALUES ('373', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '24', '会员24', '学习小组', '1556085622');
INSERT INTO `ws_chat_log` VALUES ('374', '02164224341', '会员02164224341', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', '12', '1588410068');
INSERT INTO `ws_chat_log` VALUES ('375', '02164224341', '会员02164224341', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'wert', '1588410121');
INSERT INTO `ws_chat_log` VALUES ('376', '02164224341', '会员02164224341', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', '去微软', '1588410526');
INSERT INTO `ws_chat_log` VALUES ('377', '02164224341', '会员02164224341', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', '的风格', '1588410635');
INSERT INTO `ws_chat_log` VALUES ('378', '02164224341', '会员02164224341', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', '水水', '1588410754');
INSERT INTO `ws_chat_log` VALUES ('379', '02172256291', '会员02172256291', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'gfh', '1588411549');
INSERT INTO `ws_chat_log` VALUES ('380', '02172256291', '会员02172256291', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', 'KF2', '客服小美', 'tgfh', '1588411600');
INSERT INTO `ws_chat_log` VALUES ('381', 'KF2', '客服小美', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '02172256291', '会员02172256291', 'wer', '1588412502');

-- ----------------------------
-- Table structure for `ws_config`
-- ----------------------------
DROP TABLE IF EXISTS `ws_config`;
CREATE TABLE `ws_config` (
  `id` int(11) NOT NULL,
  `max_service` int(11) NOT NULL COMMENT '每个客服最大服务的客户数',
  `change_status` tinyint(1) NOT NULL COMMENT '是否启用转接',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_config
-- ----------------------------
INSERT INTO `ws_config` VALUES ('1', '5', '1');

-- ----------------------------
-- Table structure for `ws_groups`
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
-- Table structure for `ws_now_data`
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
INSERT INTO `ws_now_data` VALUES ('1', '0', '0', '1', '1', '1', '2020-05-02');

-- ----------------------------
-- Table structure for `ws_reply`
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
INSERT INTO `ws_reply` VALUES ('1', '欢迎使用laykefu', '2');

-- ----------------------------
-- Table structure for `ws_service_data`
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
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

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
INSERT INTO `ws_service_data` VALUES ('20', '2', '0', '1', '1', '1', '2019-04-11', '17', '25');
INSERT INTO `ws_service_data` VALUES ('21', '1', '0', '1', '1', '1', '2019-04-12', '13', '32');
INSERT INTO `ws_service_data` VALUES ('22', '0', '0', '1', '1', '1', '2019-04-12', '14', '12');
INSERT INTO `ws_service_data` VALUES ('23', '1', '0', '1', '1', '1', '2019-04-12', '14', '52');
INSERT INTO `ws_service_data` VALUES ('24', '0', '0', '1', '1', '1', '2019-04-12', '15', '32');
INSERT INTO `ws_service_data` VALUES ('25', '0', '0', '1', '1', '1', '2019-04-12', '16', '12');
INSERT INTO `ws_service_data` VALUES ('26', '0', '0', '1', '1', '1', '2019-04-12', '16', '52');
INSERT INTO `ws_service_data` VALUES ('27', '0', '0', '1', '1', '1', '2019-04-12', '17', '32');
INSERT INTO `ws_service_data` VALUES ('28', '0', '0', '0', '0', '1', '2019-04-15', '10', '06');
INSERT INTO `ws_service_data` VALUES ('29', '0', '0', '0', '0', '1', '2019-04-15', '10', '46');
INSERT INTO `ws_service_data` VALUES ('30', '0', '0', '0', '0', '1', '2019-04-15', '11', '26');
INSERT INTO `ws_service_data` VALUES ('31', '0', '0', '1', '0', '1', '2019-04-15', '12', '06');
INSERT INTO `ws_service_data` VALUES ('32', '1', '0', '1', '1', '1', '2019-04-15', '12', '46');
INSERT INTO `ws_service_data` VALUES ('33', '1', '0', '1', '1', '1', '2019-04-15', '13', '26');
INSERT INTO `ws_service_data` VALUES ('34', '0', '0', '1', '1', '1', '2019-04-15', '14', '06');
INSERT INTO `ws_service_data` VALUES ('35', '1', '0', '1', '1', '1', '2019-04-15', '15', '26');
INSERT INTO `ws_service_data` VALUES ('36', '1', '0', '1', '1', '1', '2019-04-15', '16', '06');
INSERT INTO `ws_service_data` VALUES ('37', '1', '0', '1', '1', '1', '2019-04-15', '16', '46');
INSERT INTO `ws_service_data` VALUES ('38', '1', '0', '1', '1', '1', '2019-04-15', '17', '26');
INSERT INTO `ws_service_data` VALUES ('39', '1', '0', '1', '1', '1', '2019-04-15', '18', '06');
INSERT INTO `ws_service_data` VALUES ('40', '1', '0', '1', '0', '0', '2019-04-16', '09', '18');
INSERT INTO `ws_service_data` VALUES ('41', '1', '0', '1', '1', '1', '2019-04-16', '10', '05');
INSERT INTO `ws_service_data` VALUES ('42', '1', '0', '1', '1', '1', '2019-04-16', '10', '45');
INSERT INTO `ws_service_data` VALUES ('43', '0', '0', '1', '1', '1', '2019-04-16', '11', '25');
INSERT INTO `ws_service_data` VALUES ('44', '0', '0', '1', '1', '1', '2019-04-16', '12', '05');
INSERT INTO `ws_service_data` VALUES ('45', '0', '0', '1', '1', '1', '2019-04-16', '12', '45');
INSERT INTO `ws_service_data` VALUES ('46', '0', '0', '1', '1', '1', '2019-04-16', '13', '25');
INSERT INTO `ws_service_data` VALUES ('47', '0', '0', '1', '1', '1', '2019-04-16', '14', '05');
INSERT INTO `ws_service_data` VALUES ('48', '1', '0', '1', '1', '1', '2019-04-16', '14', '45');
INSERT INTO `ws_service_data` VALUES ('49', '1', '0', '1', '1', '1', '2019-04-16', '15', '18');
INSERT INTO `ws_service_data` VALUES ('50', '1', '0', '1', '1', '1', '2019-04-16', '15', '25');
INSERT INTO `ws_service_data` VALUES ('51', '0', '0', '1', '1', '1', '2019-04-16', '15', '58');
INSERT INTO `ws_service_data` VALUES ('52', '1', '0', '1', '1', '1', '2019-04-16', '16', '05');
INSERT INTO `ws_service_data` VALUES ('53', '1', '0', '1', '1', '1', '2019-04-16', '16', '38');
INSERT INTO `ws_service_data` VALUES ('54', '1', '0', '1', '1', '1', '2019-04-16', '16', '45');
INSERT INTO `ws_service_data` VALUES ('55', '1', '0', '1', '0', '0', '2019-04-17', '09', '01');
INSERT INTO `ws_service_data` VALUES ('56', '1', '0', '1', '0', '0', '2019-04-17', '09', '41');
INSERT INTO `ws_service_data` VALUES ('57', '1', '0', '1', '0', '0', '2019-04-17', '10', '21');
INSERT INTO `ws_service_data` VALUES ('58', '1', '0', '1', '0', '0', '2019-04-17', '11', '01');
INSERT INTO `ws_service_data` VALUES ('59', '0', '0', '1', '1', '1', '2019-04-17', '11', '41');
INSERT INTO `ws_service_data` VALUES ('60', '1', '0', '1', '1', '1', '2019-04-17', '12', '21');
INSERT INTO `ws_service_data` VALUES ('61', '1', '0', '1', '1', '1', '2019-04-17', '13', '01');
INSERT INTO `ws_service_data` VALUES ('62', '1', '0', '1', '1', '1', '2019-04-17', '13', '41');
INSERT INTO `ws_service_data` VALUES ('63', '1', '0', '1', '1', '1', '2019-04-17', '14', '21');
INSERT INTO `ws_service_data` VALUES ('64', '1', '0', '1', '1', '1', '2019-04-17', '15', '01');
INSERT INTO `ws_service_data` VALUES ('65', '1', '0', '1', '1', '1', '2019-04-17', '15', '41');
INSERT INTO `ws_service_data` VALUES ('66', '1', '0', '1', '1', '1', '2019-04-17', '16', '21');
INSERT INTO `ws_service_data` VALUES ('67', '1', '0', '1', '1', '1', '2019-04-17', '17', '01');
INSERT INTO `ws_service_data` VALUES ('68', '1', '0', '1', '1', '1', '2019-04-17', '17', '41');
INSERT INTO `ws_service_data` VALUES ('69', '1', '0', '1', '1', '1', '2019-04-17', '18', '21');
INSERT INTO `ws_service_data` VALUES ('70', '1', '0', '1', '0', '0', '2019-04-18', '09', '07');
INSERT INTO `ws_service_data` VALUES ('71', '1', '0', '1', '1', '1', '2019-04-18', '09', '47');
INSERT INTO `ws_service_data` VALUES ('72', '0', '0', '1', '1', '1', '2019-04-18', '10', '27');
INSERT INTO `ws_service_data` VALUES ('73', '1', '0', '1', '1', '1', '2019-04-18', '11', '07');
INSERT INTO `ws_service_data` VALUES ('74', '1', '0', '1', '1', '1', '2019-04-18', '11', '47');
INSERT INTO `ws_service_data` VALUES ('75', '1', '0', '1', '1', '1', '2019-04-18', '12', '27');
INSERT INTO `ws_service_data` VALUES ('76', '1', '0', '1', '1', '1', '2019-04-18', '13', '07');
INSERT INTO `ws_service_data` VALUES ('77', '1', '0', '1', '1', '1', '2019-04-18', '13', '47');
INSERT INTO `ws_service_data` VALUES ('78', '1', '0', '1', '1', '1', '2019-04-18', '14', '27');
INSERT INTO `ws_service_data` VALUES ('79', '1', '0', '1', '1', '1', '2019-04-18', '15', '07');
INSERT INTO `ws_service_data` VALUES ('80', '1', '0', '1', '1', '1', '2019-04-18', '16', '19');
INSERT INTO `ws_service_data` VALUES ('81', '0', '0', '0', '0', '0', '2019-04-19', '10', '14');
INSERT INTO `ws_service_data` VALUES ('82', '0', '0', '0', '0', '1', '2019-04-19', '11', '40');
INSERT INTO `ws_service_data` VALUES ('83', '1', '0', '1', '1', '1', '2019-04-19', '12', '24');
INSERT INTO `ws_service_data` VALUES ('84', '1', '0', '1', '1', '1', '2019-04-19', '13', '04');
INSERT INTO `ws_service_data` VALUES ('85', '1', '0', '1', '1', '1', '2019-04-19', '13', '44');
INSERT INTO `ws_service_data` VALUES ('86', '1', '0', '1', '1', '1', '2019-04-19', '14', '24');
INSERT INTO `ws_service_data` VALUES ('87', '1', '0', '1', '1', '1', '2019-04-22', '11', '21');
INSERT INTO `ws_service_data` VALUES ('88', '0', '1', '1', '0', '1', '2019-04-22', '13', '13');
INSERT INTO `ws_service_data` VALUES ('89', '1', '0', '1', '1', '1', '2019-04-22', '13', '53');
INSERT INTO `ws_service_data` VALUES ('90', '1', '0', '1', '1', '1', '2019-04-22', '14', '33');
INSERT INTO `ws_service_data` VALUES ('91', '1', '0', '1', '1', '1', '2019-04-22', '15', '13');
INSERT INTO `ws_service_data` VALUES ('92', '0', '1', '1', '0', '1', '2019-04-22', '17', '49');
INSERT INTO `ws_service_data` VALUES ('93', '1', '0', '1', '1', '1', '2019-04-24', '10', '16');
INSERT INTO `ws_service_data` VALUES ('94', '1', '0', '1', '1', '1', '2019-04-24', '10', '56');
INSERT INTO `ws_service_data` VALUES ('95', '1', '0', '1', '1', '1', '2019-04-24', '11', '36');
INSERT INTO `ws_service_data` VALUES ('96', '1', '0', '1', '1', '1', '2019-04-24', '12', '16');
INSERT INTO `ws_service_data` VALUES ('97', '1', '0', '1', '1', '1', '2019-04-24', '15', '54');
INSERT INTO `ws_service_data` VALUES ('98', '1', '0', '1', '1', '1', '2019-04-24', '16', '34');

-- ----------------------------
-- Table structure for `ws_service_log`
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
  KEY `ws_id,start_time,end_time` (`kf_id`,`start_time`,`end_time`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_service_log
-- ----------------------------
INSERT INTO `ws_service_log` VALUES ('', '7f00000108fc0000003c', 'null', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', '127.0.0.1', '1', '1555304463', '1555473573', '1');
INSERT INTO `ws_service_log` VALUES ('', '7f00000108fc0000003d', 'null', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', '127.0.0.1', '1', '1555304481', '1555473744', '1');
INSERT INTO `ws_service_log` VALUES ('', '7f00000108fc0000003e', 'null', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', '127.0.0.1', '1', '1555304482', '1555473815', '1');
INSERT INTO `ws_service_log` VALUES ('', '7f00000108fc00000040', 'null', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', '127.0.0.1', '1', '1555304542', '1555473917', '1');
INSERT INTO `ws_service_log` VALUES ('', '7f00000108fc00000042', 'null', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', '127.0.0.1', '1', '1555304553', '1555473960', '1');
INSERT INTO `ws_service_log` VALUES ('', '7f00000108fc00000043', 'null', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', '127.0.0.1', '1', '1555304555', '1555473978', '1');
INSERT INTO `ws_service_log` VALUES ('', '7f00000108fc00000044', 'null', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', '127.0.0.1', '1', '1555304556', '1555474034', '1');
INSERT INTO `ws_service_log` VALUES ('', '7f00000108fc00000045', 'null', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', '127.0.0.1', '1', '1555304557', '1555475770', '1');
INSERT INTO `ws_service_log` VALUES ('', '7f00000108fc00000046', 'null', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', '127.0.0.1', '1', '1555304611', '1555475784', '1');
INSERT INTO `ws_service_log` VALUES ('', '7f00000108fc00000047', 'null', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', '127.0.0.1', '1', '1555304623', '1555475939', '1');
INSERT INTO `ws_service_log` VALUES ('', '7f00000108fc00000021', 'null', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', '127.0.0.1', '1', '1555396071', '1556074482', '1');
INSERT INTO `ws_service_log` VALUES ('35', '7f00000108fc000001f8', '会员35', 'http://wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg', '127.0.0.1', '1', '1555573125', '0', '1');
INSERT INTO `ws_service_log` VALUES ('24', '7f00000108fc0000003c', '会员24', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', '127.0.0.1', '2', '1556077919', '0', '1');
INSERT INTO `ws_service_log` VALUES ('24', '7f00000108fc00000004', '会员24', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', '127.0.0.1', '2', '1556085606', '0', '1');
INSERT INTO `ws_service_log` VALUES ('02172256291', '7f00000108fc00000008', '会员02172256291', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', '127.0.0.1', '2', '1588412495', '0', '1');
INSERT INTO `ws_service_log` VALUES ('24', '7f00000108fc00000006', '会员24', 'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg', '127.0.0.1', '2', '1556092283', '0', '1');

-- ----------------------------
-- Table structure for `ws_users`
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
INSERT INTO `ws_users` VALUES ('1', '客服小丽', '25223254e8e05e5bbbebb35d407be478', '/uploads/20190419/84666a987327fe8a5d37ed4809a529cb.jpg', '1', '2', '2');
INSERT INTO `ws_users` VALUES ('2', '客服小美', '25223254e8e05e5bbbebb35d407be478', '/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg', '1', '2', '1');

-- ----------------------------
-- Table structure for `ws_words`
-- ----------------------------
DROP TABLE IF EXISTS `ws_words`;
CREATE TABLE `ws_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL COMMENT '常用语内容',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `status` tinyint(1) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_words
-- ----------------------------
INSERT INTO `ws_words` VALUES ('1', '欢迎来到laykefu v1.0.1', '2019-10-25 12:51:09', '1');
INSERT INTO `ws_words` VALUES ('3', '有什么可以帮您的吗', '2019-04-11 17:00:09', '1');
