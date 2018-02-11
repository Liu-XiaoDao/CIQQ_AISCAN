/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : mqq

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-02-11 19:46:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for apiorder
-- ----------------------------
DROP TABLE IF EXISTS `apiorder`;
CREATE TABLE `apiorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_trade_no` varchar(255) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `aname` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `money` decimal(10,0) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `qqs` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apiorder
-- ----------------------------

-- ----------------------------
-- Table structure for apiuser
-- ----------------------------
DROP TABLE IF EXISTS `apiuser`;
CREATE TABLE `apiuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `isactive` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apiuser
-- ----------------------------
INSERT INTO `apiuser` VALUES ('1', '111111', 'e11170b8cbd2d74102651cb967fa28e5', '0');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tid` int(11) NOT NULL COMMENT '所属分类',
  `qqnum` char(15) NOT NULL COMMENT 'QQ号',
  `qqpw` varchar(50) NOT NULL COMMENT 'QQ号密码',
  `is_sell` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否已销售0未1已',
  `addtime` datetime DEFAULT NULL COMMENT 'QQ添加时间',
  `endtime` datetime DEFAULT NULL COMMENT 'QQ卖出时间',
  `code` varchar(255) NOT NULL COMMENT '号码改密码用的令牌',
  `phone` char(11) NOT NULL COMMENT '号码绑定的手机号',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '8', '957419420', '123456', '0', '2017-06-15 00:00:00', null, '', '');
INSERT INTO `goods` VALUES ('2', '6', '498660833', '7721628lcl', '0', '2017-06-15 00:00:00', null, '', '');
INSERT INTO `goods` VALUES ('3', '9', '3381886658', '7721628lcl', '0', '2017-06-15 11:13:28', null, '', '');

-- ----------------------------
-- Table structure for shua_api
-- ----------------------------
DROP TABLE IF EXISTS `shua_api`;
CREATE TABLE `shua_api` (
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `sort` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT NULL,
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shua_api
-- ----------------------------
INSERT INTO `shua_api` VALUES ('月亮', '100.00', '1', '10', '1', '1');

-- ----------------------------
-- Table structure for shua_config
-- ----------------------------
DROP TABLE IF EXISTS `shua_config`;
CREATE TABLE `shua_config` (
  `k` varchar(32) NOT NULL,
  `v` text,
  PRIMARY KEY (`k`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shua_config
-- ----------------------------
INSERT INTO `shua_config` VALUES ('cache', 'a:34:{s:7:\"version\";s:4:\"1001\";s:10:\"admin_user\";s:5:\"admin\";s:9:\"admin_pwd\";s:6:\"123456\";s:10:\"alipay_api\";s:1:\"2\";s:10:\"tenpay_api\";s:1:\"2\";s:9:\"qqpay_api\";s:1:\"2\";s:9:\"wxpay_api\";s:1:\"2\";s:5:\"style\";s:1:\"1\";s:8:\"sitename\";s:13:\"第一营销 \";s:8:\"keywords\";s:48:\"QQ空间业务自助下单平台www.12580sky.com\";s:11:\"description\";s:48:\"QQ空间业务自助下单平台www.12580sky.com\";s:4:\"kfqq\";s:9:\"123456789\";s:7:\"anounce\";s:368:\"<h4>下单注意事项</h4><font color=blue>请勿重复下单，之前的单子刷完才能继续下单，重复下单是不会刷的！<br/>21点前添加当天开刷，21点之后添加次日开刷，每天只能提交一次。<br/>本站代挂业务所有都会完成，由于限制时间会比较慢，不过都会刷完，最终解释权归本站所有。</font>\";s:5:\"kaurl\";s:23:\"http://www.12580sky.com\";s:5:\"modal\";s:44:\"欢迎使用QQ空间业务自助下单平台\";s:5:\"title\";s:0:\"\";s:10:\"alipay_pid\";s:0:\"\";s:10:\"alipay_key\";s:0:\"\";s:14:\"alipay_account\";s:0:\"\";s:11:\"alipay2_api\";s:1:\"1\";s:10:\"tenpay_pid\";s:0:\"\";s:10:\"tenpay_key\";s:0:\"\";s:9:\"qqpay_pid\";s:0:\"\";s:9:\"qqpay_key\";s:0:\"\";s:8:\"epay_pid\";s:4:\"1332\";s:8:\"epay_key\";s:32:\"nsMMFTIuu2Ffnwf929FzvuH0IGiRIgsN\";s:7:\"marquee\";s:4:\"1111\";s:6:\"point1\";s:2:\"11\";s:6:\"point2\";s:2:\"22\";s:6:\"point3\";s:2:\"33\";s:6:\"point4\";s:2:\"44\";s:6:\"point5\";s:2:\"55\";s:6:\"point6\";s:2:\"66\";s:11:\"middlepoint\";s:18:\"下单上面提示\";}');
INSERT INTO `shua_config` VALUES ('version', '1001');
INSERT INTO `shua_config` VALUES ('admin_user', 'admin');
INSERT INTO `shua_config` VALUES ('admin_pwd', '123456');
INSERT INTO `shua_config` VALUES ('alipay_api', '2');
INSERT INTO `shua_config` VALUES ('tenpay_api', '2');
INSERT INTO `shua_config` VALUES ('qqpay_api', '2');
INSERT INTO `shua_config` VALUES ('wxpay_api', '2');
INSERT INTO `shua_config` VALUES ('style', '1');
INSERT INTO `shua_config` VALUES ('sitename', '第一营销 ');
INSERT INTO `shua_config` VALUES ('keywords', 'QQ空间业务自助下单平台www.12580sky.com');
INSERT INTO `shua_config` VALUES ('description', 'QQ空间业务自助下单平台www.12580sky.com');
INSERT INTO `shua_config` VALUES ('kfqq', '123456789');
INSERT INTO `shua_config` VALUES ('anounce', '<h4>下单注意事项</h4><font color=blue>请勿重复下单，之前的单子刷完才能继续下单，重复下单是不会刷的！<br/>21点前添加当天开刷，21点之后添加次日开刷，每天只能提交一次。<br/>本站代挂业务所有都会完成，由于限制时间会比较慢，不过都会刷完，最终解释权归本站所有。</font>');
INSERT INTO `shua_config` VALUES ('kaurl', 'http://www.12580sky.com');
INSERT INTO `shua_config` VALUES ('modal', '欢迎使用QQ空间业务自助下单平台');
INSERT INTO `shua_config` VALUES ('title', '');
INSERT INTO `shua_config` VALUES ('alipay_pid', '');
INSERT INTO `shua_config` VALUES ('alipay_key', '');
INSERT INTO `shua_config` VALUES ('alipay_account', '');
INSERT INTO `shua_config` VALUES ('alipay2_api', '1');
INSERT INTO `shua_config` VALUES ('tenpay_pid', '');
INSERT INTO `shua_config` VALUES ('tenpay_key', '');
INSERT INTO `shua_config` VALUES ('qqpay_pid', '');
INSERT INTO `shua_config` VALUES ('qqpay_key', '');
INSERT INTO `shua_config` VALUES ('epay_pid', '1332');
INSERT INTO `shua_config` VALUES ('epay_key', 'nsMMFTIuu2Ffnwf929FzvuH0IGiRIgsN');
INSERT INTO `shua_config` VALUES ('marquee', '1111');
INSERT INTO `shua_config` VALUES ('point1', '11');
INSERT INTO `shua_config` VALUES ('point2', '22');
INSERT INTO `shua_config` VALUES ('point3', '33');
INSERT INTO `shua_config` VALUES ('point4', '44');
INSERT INTO `shua_config` VALUES ('point5', '55');
INSERT INTO `shua_config` VALUES ('point6', '66');
INSERT INTO `shua_config` VALUES ('middlepoint', '下单上面提示');

-- ----------------------------
-- Table structure for shua_kms
-- ----------------------------
DROP TABLE IF EXISTS `shua_kms`;
CREATE TABLE `shua_kms` (
  `kid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `km` varchar(255) NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  `addtime` timestamp NULL DEFAULT NULL,
  `user` varchar(20) NOT NULL DEFAULT '0',
  `usetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shua_kms
-- ----------------------------
INSERT INTO `shua_kms` VALUES ('1', '6', '2LFdP0d1hSQQnmNGbF', '1000', '2017-06-14 21:06:13', '0', null);
INSERT INTO `shua_kms` VALUES ('2', '6', '36CYqySYoA6fBCQtgY', '1000', '2017-06-14 21:06:13', '0', null);
INSERT INTO `shua_kms` VALUES ('3', '6', 'CzaTTERmyXynjhMxPn', '1000', '2017-06-14 21:06:13', '0', null);
INSERT INTO `shua_kms` VALUES ('4', '6', '3UcQzffBkEmiSgjcfq', '1000', '2017-06-14 21:06:13', '0', null);
INSERT INTO `shua_kms` VALUES ('5', '6', 'j5ckSqiitPtWdjTxUo', '1000', '2017-06-14 21:06:13', '0', null);
INSERT INTO `shua_kms` VALUES ('6', '7', 'dkZkeNCHVVQPkODJf4', '1000', '2017-06-14 21:06:19', '0', null);
INSERT INTO `shua_kms` VALUES ('7', '7', 'iNRbiGy0Ni41rCSI9e', '1000', '2017-06-14 21:06:19', '0', null);
INSERT INTO `shua_kms` VALUES ('8', '7', '5sHA2HmPPBtO0rkIRT', '1000', '2017-06-14 21:06:19', '0', null);
INSERT INTO `shua_kms` VALUES ('9', '7', 'YrTMejynvhHq5MXMzn', '1000', '2017-06-14 21:06:19', '0', null);
INSERT INTO `shua_kms` VALUES ('10', '7', 'ARjN7JuhYBOQ3ZYrXe', '1000', '2017-06-14 21:06:19', '0', null);
INSERT INTO `shua_kms` VALUES ('11', '8', 's4cseSrbfVU8sBaKit', '1000', '2017-06-14 21:06:34', '0', null);
INSERT INTO `shua_kms` VALUES ('12', '8', 'yK0iiGFa67pyZLTk9J', '1000', '2017-06-14 21:06:34', '0', null);
INSERT INTO `shua_kms` VALUES ('13', '8', 'SUraDLYvhefdPfOsPh', '1000', '2017-06-14 21:06:34', '498660833', '2017-06-14 21:08:17');
INSERT INTO `shua_kms` VALUES ('14', '8', 'Y9PiL1iRJeJypLBWgL', '1000', '2017-06-14 21:06:34', '0', null);
INSERT INTO `shua_kms` VALUES ('15', '8', 'QASXQTxoAFPi2U62xc', '1000', '2017-06-14 21:06:34', '0', null);
INSERT INTO `shua_kms` VALUES ('16', '6', 'YW959PUzzH68XUtoUr', '1000', '2017-06-14 21:06:41', '0', null);
INSERT INTO `shua_kms` VALUES ('17', '6', '1FWA1gwbEBM9fOqXOg', '1000', '2017-06-14 21:06:41', '0', null);
INSERT INTO `shua_kms` VALUES ('18', '6', 'IdNLX74RtQPAFvol3D', '1000', '2017-06-14 21:06:41', '0', null);
INSERT INTO `shua_kms` VALUES ('19', '6', '3LypYjcmiI5vr6btI5', '1000', '2017-06-14 21:06:41', '0', null);
INSERT INTO `shua_kms` VALUES ('20', '6', 'rHCK59ODp6TCb3wrqR', '1000', '2017-06-14 21:06:41', '0', null);
INSERT INTO `shua_kms` VALUES ('21', '6', 'RVBcB5hXmywc5XiQp4', '1000', '2017-06-14 21:06:50', '0', null);
INSERT INTO `shua_kms` VALUES ('22', '6', 'B2O3LSnefSdZCV8fVx', '1000', '2017-06-14 21:06:50', '0', null);
INSERT INTO `shua_kms` VALUES ('23', '6', 'kquqmNtRWGPDTyr0mM', '1000', '2017-06-14 21:06:50', '0', null);
INSERT INTO `shua_kms` VALUES ('24', '6', 'BNUkeQJ8ds9CQPAdPq', '1000', '2017-06-14 21:06:50', '0', null);
INSERT INTO `shua_kms` VALUES ('25', '6', 'AcZzowL0iYriWK3vY1', '1000', '2017-06-14 21:06:50', '0', null);
INSERT INTO `shua_kms` VALUES ('26', '6', 'iI8RUKtTBIRkmhv1o2', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('27', '6', 'ywrAf0uUleZJiwsuKL', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('28', '6', 'xCRvIakZH63TMetrwv', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('29', '6', '4UarCBDqEHuCTU2tyk', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('30', '6', 'TEY4EACigS6hkuFnLB', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('31', '6', 'HKqKY2PUUnY8IjdNOM', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('32', '6', 'CRJ62U9lPoqe3WuJ1B', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('33', '6', 'lqKmOREvJlUMC4t4jo', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('34', '6', 'c48eRiJBLUzhXKbhHL', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('35', '6', 'g56HXRX0EotOLLyS52', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('36', '6', 'ZLS9H975WEk8m4FcV5', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('37', '6', 'KUgKuu8O7ocp40InH2', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('38', '6', 'AQcns3ddCaSfeTDTzL', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('39', '6', 'S95joXhzphmUbVOoFA', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('40', '6', 'BtIU17iPpXRcaE04iN', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('41', '6', 'j6RrNqSK8RvNN8kw38', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('42', '6', 'rr4o8PBbHNOv0p2WgH', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('43', '6', 'pc7OsI1Hwv28LcorDK', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('44', '6', 'apvJwQNXstyMd9p3yB', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('45', '6', 'sj6IYv8bRV95sUdNfU', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('46', '6', 'GVHYhKkN62bFFFpPcH', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('47', '6', 'FORlOCb3ygmyEx5cLy', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('48', '6', 'aJwZ6quI2jAGnbf4WH', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('49', '6', 'rP7LjTck4Vip0Z9Zep', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('50', '6', 'jvJ9A54L5CS6CMnSFK', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('51', '6', '0kHnCzY9I5SC1W9e5d', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('52', '6', 'a3Vta9Zh0V20iF8i1Y', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('53', '6', 'w68FAiP1PwWWW0XkpU', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('54', '6', 'VhGYbX2pfFNlKN77lW', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('55', '6', 'cMMhck3yq09EJxafsT', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('56', '6', 'DCvKGGGwdu3lLnOKC5', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('57', '6', 'vL4cXkYYs1QTdbvQ1a', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('58', '6', 'nLn8i2ZdIKe6vIdJRM', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('59', '6', 'k1a12kSFeQoLtqyL58', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('60', '6', 'nbLcLLLDPv7zCy8Zyx', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('61', '6', 'BAapcGILlY5WP6e7fR', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('62', '6', 'QUFGuXhRX8Z9UO8SLv', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('63', '6', 'Gsce0rj69yC90kYdTI', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('64', '6', 'hBsYgPshmLv6I9WOaj', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('65', '6', '3hb2mu4Pmv9qwbefpV', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('66', '6', '0R0HQvgNVqSVPZ02ee', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('67', '6', 'gmPwPMYiOoGF0wrm58', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('68', '6', '8FgmpHsuHCFpGoLgSX', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('69', '6', 'g42HnVHClJjwyAF6oY', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('70', '6', 'ASv6Y1CW6tza6tBbBN', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('71', '6', 'GciL8zQjkgdHEWVfuZ', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('72', '6', 'cZ9MZgDdrvGpQXatHZ', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('73', '6', 'QVsULU0eRA3BmLFzjc', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('74', '6', 'i9YpJDvB8y10vAawjU', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('75', '6', 'x4srWQSiKUWb3qbEZV', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('76', '6', '3C7WkIulOa4XwtMmxp', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('77', '6', 'IuePHzQqKcD8iGnlAI', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('78', '6', '1gY41Z1aYbhPVoWAxs', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('79', '6', 'kuTh5MD4CgRHyFa7LA', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('80', '6', 'd1CRYFrEnpPiKa9yNZ', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('81', '6', 'USWXoZnHbzBfBTwmcG', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('82', '6', '0HFlmZ2xQjHFIVbCOJ', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('83', '6', 'vLEKp52913Kq1nROrK', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('84', '6', 'b1Jb1RN0RZda1rfwzB', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('85', '6', '7jcHQRvJdZmEgHqg4a', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('86', '6', 'pDmpIPg9dklcBfk0kp', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('87', '6', 'C0ONvvpSYVCMuNlQKe', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('88', '6', 'STmyL6r7kjlhFbhaFY', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('89', '6', 'BsmpAjMo3CeNTPqmsN', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('90', '6', 'w7FSzrv4u2R9pPNc2f', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('91', '6', 'rTzRIsDLTFFcUqCJcl', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('92', '6', '8QE7ZwV122omCmRowb', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('93', '6', 'OFEf8QAzlivlgnJsYV', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('94', '6', 'yTm4LSRwYcT2Hf0rjr', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('95', '6', 'lewVLUtv07hDx4Vrjl', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('96', '6', '0gir42aimo5tw62wHq', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('97', '6', 'JUjyCQpmLfnkRqBifz', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('98', '6', 'fxFUmdhFBLFBmWXcZp', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('99', '6', 'pbdD21HPDt6a5bG8ic', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('100', '6', 'An5hDuxrnEcNBBBMbp', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('101', '6', 'UtnyFVIL2gdtTmYN0V', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('102', '6', 'Yz1sYGYvTu8VKmXCmr', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('103', '6', 'w1RgyacBAshlX09Zce', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('104', '6', '11Uzn3Ylnf8jtp9a7P', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('105', '6', 'OPErWKBuxkCnkoMhCC', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('106', '6', '0AxaJKdHm8Z95PQ7YJ', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('107', '6', 'sWNOcOawG0KIk5qd87', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('108', '6', 'QDAIWgT5ZFFU13Kbc9', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('109', '6', 'kforgtO1qebbsq7wXt', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('110', '6', 'O52Wvxg4chJ79wvGNp', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('112', '6', '3jUQRTUYB1mwzP8VhU', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('113', '6', 'rZQr1kJLrXfaJT6bJr', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('114', '6', 'TGO97rPtOI0KtJtSQz', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('115', '6', 'Vg1MfpxrEJoztZpmGR', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('116', '6', '0WID2hBCOAtqFcVukC', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('117', '6', '7Djil2ZKTA0wzNYJpJ', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('118', '6', 'pRxWnmgJgD9D8VkZHG', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('119', '6', 'jDggrPPWSIepngMq5g', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('120', '6', 'GeWyGejJ67VHPXOZsG', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('121', '6', 'jRjZcORu1Lk4zkVFX8', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('122', '6', 'NwhkY1KWKL6Dw9BYGN', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('123', '6', 'mX9Z7mAsnZXv6pmira', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('124', '6', 'XWTLcmvRkrm8HMWSTi', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('125', '6', '9pUJux3ok6Sm4b5hy0', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('126', '6', 'sPOTwUY01MlK6ouv3f', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('127', '6', 'fLCwm8Q6NpjEubzD9x', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('128', '6', 'e8DhBdmSCfvP501HUh', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('129', '6', 'C0a6d30emcW74dHhMW', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('130', '6', 'Em1j1Jczwif0DahYEJ', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('131', '6', 'lrMCjzRKQHDh9bmhwo', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('132', '6', 'BZLGRD3jpM8EmaZKd9', '1000', '2017-06-14 21:06:59', '0', null);
INSERT INTO `shua_kms` VALUES ('135', '6', 'GBva3w5doSENIq20zG', '1000', '2017-06-14 21:06:59', '498660833', '2017-06-14 21:07:37');

-- ----------------------------
-- Table structure for shua_orders
-- ----------------------------
DROP TABLE IF EXISTS `shua_orders`;
CREATE TABLE `shua_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `zid` int(11) NOT NULL DEFAULT '0',
  `qq` varchar(20) NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(32) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shua_orders
-- ----------------------------
INSERT INTO `shua_orders` VALUES ('1', '6', '0', '498660833', '1000', '1', null, '2017-06-14 21:07:37', null);
INSERT INTO `shua_orders` VALUES ('2', '8', '0', '498660833', '1000', '1', null, '2017-06-14 21:08:17', null);

-- ----------------------------
-- Table structure for shua_pay
-- ----------------------------
DROP TABLE IF EXISTS `shua_pay`;
CREATE TABLE `shua_pay` (
  `trade_no` varchar(64) NOT NULL COMMENT '订单号',
  `type` varchar(20) DEFAULT NULL,
  `tid` int(11) NOT NULL COMMENT '商品ID',
  `qq` varchar(20) NOT NULL COMMENT '购买者QQ',
  `addtime` datetime NOT NULL COMMENT '订单添加时间',
  `endtime` datetime DEFAULT NULL COMMENT '订单完成时间',
  `name` varchar(64) DEFAULT NULL COMMENT '商品名',
  `count` int(11) NOT NULL,
  `money` decimal(10,2) NOT NULL COMMENT '订单价格',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `info` varchar(255) DEFAULT NULL COMMENT '备注',
  `uid` int(11) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`trade_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shua_pay
-- ----------------------------
INSERT INTO `shua_pay` VALUES ('20170614222520915', null, '6', '11111', '2017-06-14 22:25:20', null, '一个月亮', '0', '5.00', '0', null, null, null);
INSERT INTO `shua_pay` VALUES ('20170614230232442', null, '6', 'q12345', '2017-06-14 23:02:32', null, '一个月亮', '34', '170.00', '0', '1212121', null, null);
INSERT INTO `shua_pay` VALUES ('20170614230706952', null, '6', 'q5678', '2017-06-14 23:07:06', null, '一个月亮', '12', '60.00', '0', 'info:123456', null, null);
INSERT INTO `shua_pay` VALUES ('20170614232809644', null, '9', 'Q123456', '2017-06-14 23:28:09', null, '星', '1', '0.00', '0', 'zxcv', null, null);
INSERT INTO `shua_pay` VALUES ('20170614234919933', null, '9', 'Q123456', '2017-06-14 23:49:19', null, '星', '1', '0.00', '0', 'zxcv', null, null);
INSERT INTO `shua_pay` VALUES ('20170614235320646', null, '10', 'Q5678', '2017-06-14 23:53:20', null, '2星', '1', '1.00', '0', '加你的', null, null);
INSERT INTO `shua_pay` VALUES ('20170614235339715', null, '10', 'Q5678', '2017-06-14 23:53:39', null, '2星', '1', '1.00', '0', '加你的', null, null);
INSERT INTO `shua_pay` VALUES ('20170615111631411', null, '7', '498660833', '2017-06-15 11:16:31', null, '星号', '10', '0.00', '0', '23', null, null);
INSERT INTO `shua_pay` VALUES ('20170615111731763', null, '9', '9876536', '2017-06-15 11:17:31', null, '星', '10', '1.00', '0', '你好', null, null);
INSERT INTO `shua_pay` VALUES ('20170615114739662', null, '6', '11111', '2017-06-15 11:47:39', null, '一个月亮', '1111', '5555.00', '0', '11111', null, null);
INSERT INTO `shua_pay` VALUES ('20170615114813384', null, '7', '1111111', '2017-06-15 11:48:13', null, '星号', '1', '0.50', '0', '11111', null, null);
INSERT INTO `shua_pay` VALUES ('20170615114855402', null, '9', '11111', '2017-06-15 11:48:55', null, '星', '1', '0.10', '0', '11111', null, null);
INSERT INTO `shua_pay` VALUES ('20170615114912702', null, '6', '444444', '2017-06-15 11:49:12', null, '一个月亮', '4', '20.00', '0', '444444', null, null);
INSERT INTO `shua_pay` VALUES ('20170615115022412', null, '6', '1111111', '2017-06-15 11:50:22', null, '一个月亮', '11111', '55555.00', '0', '1111111', null, null);
INSERT INTO `shua_pay` VALUES ('20170615115232705', null, '10', '11111', '2017-06-15 11:52:32', null, '2星', '1', '1.00', '0', '11111', null, null);
INSERT INTO `shua_pay` VALUES ('20170615211621757', null, '6', '11111', '2017-06-15 21:16:21', null, '一个月亮', '1222', '6110.00', '0', '11111', null, null);
INSERT INTO `shua_pay` VALUES ('20170615211946662', null, '6', '11111', '2017-06-15 21:19:46', null, '一个月亮', '11', '55.00', '0', '11111', null, null);
INSERT INTO `shua_pay` VALUES ('20170615212052735', null, '6', '11111', '2017-06-15 21:20:51', null, '一个月亮', '1', '5.00', '0', '1111', null, null);

-- ----------------------------
-- Table structure for shua_tools
-- ----------------------------
DROP TABLE IF EXISTS `shua_tools`;
CREATE TABLE `shua_tools` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) NOT NULL DEFAULT '10',
  `name` varchar(255) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `count` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(2) NOT NULL DEFAULT '0',
  `stock` int(255) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shua_tools
-- ----------------------------
INSERT INTO `shua_tools` VALUES ('10', '10', '2星', '101', '1.00', '0', '1', null);
INSERT INTO `shua_tools` VALUES ('7', '10', '星号', '121', '0.50', '0', '1', null);
INSERT INTO `shua_tools` VALUES ('8', '12', '太阳号', '111', '10.00', '0', '1', null);
INSERT INTO `shua_tools` VALUES ('9', '10', '星', '13', '0.10', '0', '1', null);
INSERT INTO `shua_tools` VALUES ('6', '5', '一个月亮', '1001', '5.00', '0', '1', null);
INSERT INTO `shua_tools` VALUES ('11', '10', '反反复复', '1', '10.00', '0', '1', null);

-- ----------------------------
-- Table structure for system_logs
-- ----------------------------
DROP TABLE IF EXISTS `system_logs`;
CREATE TABLE `system_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `controller_name` varchar(255) DEFAULT NULL,
  `action_name` varchar(255) DEFAULT NULL,
  `addtime` datetime NOT NULL,
  `content` text,
  `style` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_logs
-- ----------------------------
INSERT INTO `system_logs` VALUES ('1', '游客', '', 'welcome', 'index', '2017-10-19 21:18:48', 'SELECT * FROM shua_tools WHERE 1 order by sort asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('2', '游客', '', 'welcome', 'index', '2017-10-19 21:22:03', 'SELECT * FROM shua_tools WHERE 1 order by sort asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('3', '游客', '', 'welcome', 'index', '2017-10-19 21:24:26', 'SELECT * FROM shua_tools WHERE 1 order by sort asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('4', '游客', '', 'welcome', 'index', '2017-10-19 21:24:26', 'SELECT * FROM shua_api WHERE 1 order by sort asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('5', '游客', '', 'welcome', 'index', '2017-10-19 21:24:26', 'SELECT count(*) as count1 from shua_orders<br/>', '4');
INSERT INTO `system_logs` VALUES ('6', '游客', '', 'welcome', 'index', '2017-10-19 21:24:26', 'SELECT count(*) as count2 from shua_orders where status=1<br/>', '4');
INSERT INTO `system_logs` VALUES ('7', '游客', '', 'welcome', 'index', '2017-10-19 21:24:26', 'select VERSION() as version<br/>', '4');
INSERT INTO `system_logs` VALUES ('8', '游客', '', 'welcome', 'index', '2017-10-19 21:28:43', 'SELECT * FROM shua_tools WHERE 1 order by sort asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('9', '游客', '', 'welcome', 'index', '2017-10-19 21:28:43', 'SELECT * FROM shua_api WHERE 1 order by sort asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('10', '游客', '', 'welcome', 'index', '2017-10-19 21:28:43', 'SELECT count(*) as count1 from shua_orders<br/>', '4');
INSERT INTO `system_logs` VALUES ('11', '游客', '', 'welcome', 'index', '2017-10-19 21:28:43', 'SELECT count(*) as count2 from shua_orders where status=1<br/>', '4');
INSERT INTO `system_logs` VALUES ('12', '游客', '', 'welcome', 'index', '2017-10-19 21:28:43', 'select VERSION() as version<br/>', '4');
INSERT INTO `system_logs` VALUES ('13', '游客', 'admin', 'login', 'loginme', '2017-10-19 21:30:29', 'update shua_config set v=\\\'a:26:{s:7:\\\\\\\"version\\\\\\\";s:4:\\\\\\\"1001\\\\\\\";s:10:\\\\\\\"admin_user\\\\\\\";s:5:\\\\\\\"admin\\\\\\\";s:9:\\\\\\\"admin_pwd\\\\\\\";s:6:\\\\\\\"123456\\\\\\\";s:10:\\\\\\\"alipay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:10:\\\\\\\"tenpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:9:\\\\\\\"qqpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:9:\\\\\\\"wxpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:5:\\\\\\\"style\\\\\\\";s:1:\\\\\\\"1\\\\\\\";s:8:\\\\\\\"sitename\\\\\\\";s:13:\\\\\\\"第一营销 \\\\\\\";s:8:\\\\\\\"keywords\\\\\\\";s:48:\\\\\\\"QQ空间业务自助下单平台www.12580sky.com\\\\\\\";s:11:\\\\\\\"description\\\\\\\";s:48:\\\\\\\"QQ空间业务自助下单平台www.12580sky.com\\\\\\\";s:4:\\\\\\\"kfqq\\\\\\\";s:9:\\\\\\\"123456789\\\\\\\";s:7:\\\\\\\"anounce\\\\\\\";s:368:\\\\\\\"<h4>下单注意事项</h4><font color=blue>请勿重复下单，之前的单子刷完才能继续下单，重复下单是不会刷的！<br/>21点前添加当天开刷，21点之后添加次日开刷，每天只能提交一次。<br/>本站代挂业务所有都会完成，由于限制时间会比较慢，不过都会刷完，最终解释权归本站所有。</font>\\\\\\\";s:5:\\\\\\\"kaurl\\\\\\\";s:23:\\\\\\\"http://www.12580sky.com\\\\\\\";s:5:\\\\\\\"modal\\\\\\\";s:44:\\\\\\\"欢迎使用QQ空间业务自助下单平台\\\\\\\";s:5:\\\\\\\"title\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"alipay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"alipay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:14:\\\\\\\"alipay_account\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:11:\\\\\\\"alipay2_api\\\\\\\";s:1:\\\\\\\"1\\\\\\\";s:10:\\\\\\\"tenpay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"tenpay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:9:\\\\\\\"qqpay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:9:\\\\\\\"qqpay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:8:\\\\\\\"epay_pid\\\\\\\";s:4:\\\\\\\"1332\\\\\\\";s:8:\\\\\\\"epay_key\\\\\\\";s:32:\\\\\\\"nsMMFTIuu2Ffnwf929FzvuH0IGiRIgsN\\\\\\\";}\\\' where k=\\\'cache\\\'<br/>', '4');
INSERT INTO `system_logs` VALUES ('14', '系统管理员', 'admin', 'home', 'index', '2017-10-19 21:30:30', 'SELECT count(*) as count1 from shua_orders<br/>', '4');
INSERT INTO `system_logs` VALUES ('15', '系统管理员', 'admin', 'home', 'index', '2017-10-19 21:30:30', 'SELECT count(*) as count2 from shua_orders where status=1<br/>', '4');
INSERT INTO `system_logs` VALUES ('16', '系统管理员', 'admin', 'home', 'index', '2017-10-19 21:30:30', 'select VERSION() as version<br/>', '4');
INSERT INTO `system_logs` VALUES ('17', '系统管理员', 'admin', 'home', 'index', '2017-10-19 21:30:40', 'SELECT count(*) as count1 from shua_orders<br/>', '4');
INSERT INTO `system_logs` VALUES ('18', '系统管理员', 'admin', 'home', 'index', '2017-10-19 21:30:40', 'SELECT count(*) as count2 from shua_orders where status=1<br/>', '4');
INSERT INTO `system_logs` VALUES ('19', '系统管理员', 'admin', 'home', 'index', '2017-10-19 21:30:40', 'select VERSION() as version<br/>', '4');
INSERT INTO `system_logs` VALUES ('20', '系统管理员', 'admin', 'home', 'index', '2017-10-19 21:32:40', 'SELECT count(*) as count1 from shua_orders<br/>', '4');
INSERT INTO `system_logs` VALUES ('21', '系统管理员', 'admin', 'home', 'index', '2017-10-19 21:32:40', 'SELECT count(*) as count2 from shua_orders where status=1<br/>', '4');
INSERT INTO `system_logs` VALUES ('22', '系统管理员', 'admin', 'home', 'index', '2017-10-19 21:32:40', 'select VERSION() as version<br/>', '4');
INSERT INTO `system_logs` VALUES ('23', '系统管理员', 'front', 'regisn', 'set', '2017-10-19 21:37:53', 'insert into users (username,password,nick,age,phone,mail,qq,account,isable) values(\\\'xiaodao\\\',\\\'96e79218965eb72c92a549dd5a330112\\\',\\\'xiaodao\\\',18,\\\'18106322292\\\',\\\'957419420@qq.com\\\',\\\'957419420\\\',0,1)<br/>', '1');
INSERT INTO `system_logs` VALUES ('24', '系统管理员', 'admin', 'home', 'index', '2017-10-19 21:38:05', 'SELECT count(*) as count1 from shua_orders<br/>', '4');
INSERT INTO `system_logs` VALUES ('25', '系统管理员', 'admin', 'home', 'index', '2017-10-19 21:38:05', 'SELECT count(*) as count2 from shua_orders where status=1<br/>', '4');
INSERT INTO `system_logs` VALUES ('26', '系统管理员', 'admin', 'home', 'index', '2017-10-19 21:38:05', 'select VERSION() as version<br/>', '4');
INSERT INTO `system_logs` VALUES ('27', '系统管理员', 'admin', 'user', 'index', '2017-10-19 21:38:06', 'SELECT count(*) as usercount FROM users<br/>', '4');
INSERT INTO `system_logs` VALUES ('28', '系统管理员', 'admin', 'user', 'index', '2017-10-19 21:38:06', 'SELECT * FROM users  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('29', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:38:11', 'SELECT * FROM shua_tools WHERE 1 order by sort asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('30', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:38:11', 'SELECT count(*) as numrows from shua_pay<br/>', '4');
INSERT INTO `system_logs` VALUES ('31', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:38:11', 'select count(*) as wcount from shua_pay where status=1<br/>', '4');
INSERT INTO `system_logs` VALUES ('32', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:38:11', 'SELECT * FROM shua_pay WHERE 1 order by addtime asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('33', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:38:32', 'SELECT * FROM shua_tools WHERE 1 order by sort asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('34', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:38:32', 'SELECT count(*) as numrows from shua_pay<br/>', '4');
INSERT INTO `system_logs` VALUES ('35', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:38:32', 'select count(*) as wcount from shua_pay where status=1<br/>', '4');
INSERT INTO `system_logs` VALUES ('36', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:38:32', 'SELECT * FROM shua_pay WHERE 1 order by addtime asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('37', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:41:28', 'SELECT * FROM shua_tools WHERE 1 order by sort asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('38', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:41:28', 'SELECT count(*) as numrows from shua_pay<br/>', '4');
INSERT INTO `system_logs` VALUES ('39', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:41:28', 'select count(*) as wcount from shua_pay where status=1<br/>', '4');
INSERT INTO `system_logs` VALUES ('40', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:41:28', 'SELECT * FROM shua_pay WHERE 1 order by addtime asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('41', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:41:35', 'SELECT * FROM shua_tools WHERE 1 order by sort asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('42', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:41:35', 'SELECT count(*) as numrows from shua_pay<br/>', '4');
INSERT INTO `system_logs` VALUES ('43', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:41:35', 'select count(*) as wcount from shua_pay where status=1<br/>', '4');
INSERT INTO `system_logs` VALUES ('44', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:41:35', 'SELECT * FROM shua_pay WHERE 1 order by addtime asc  limit 10,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('45', '系统管理员', 'admin', 'user', 'index', '2017-10-19 21:41:39', 'SELECT count(*) as usercount FROM users<br/>', '4');
INSERT INTO `system_logs` VALUES ('46', '系统管理员', 'admin', 'user', 'index', '2017-10-19 21:41:39', 'SELECT * FROM users  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('47', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:41:41', 'SELECT * FROM shua_tools WHERE 1 order by sort asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('48', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:41:41', 'SELECT count(*) as numrows from shua_pay<br/>', '4');
INSERT INTO `system_logs` VALUES ('49', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:41:41', 'select count(*) as wcount from shua_pay where status=1<br/>', '4');
INSERT INTO `system_logs` VALUES ('50', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:41:41', 'SELECT * FROM shua_pay WHERE 1 order by addtime asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('51', '系统管理员', 'admin', 'setwebinfo', 'index', '2017-10-19 21:41:46', 'update shua_config set v=\\\'a:26:{s:7:\\\\\\\"version\\\\\\\";s:4:\\\\\\\"1001\\\\\\\";s:10:\\\\\\\"admin_user\\\\\\\";s:5:\\\\\\\"admin\\\\\\\";s:9:\\\\\\\"admin_pwd\\\\\\\";s:6:\\\\\\\"123456\\\\\\\";s:10:\\\\\\\"alipay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:10:\\\\\\\"tenpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:9:\\\\\\\"qqpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:9:\\\\\\\"wxpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:5:\\\\\\\"style\\\\\\\";s:1:\\\\\\\"1\\\\\\\";s:8:\\\\\\\"sitename\\\\\\\";s:13:\\\\\\\"第一营销 \\\\\\\";s:8:\\\\\\\"keywords\\\\\\\";s:48:\\\\\\\"QQ空间业务自助下单平台www.12580sky.com\\\\\\\";s:11:\\\\\\\"description\\\\\\\";s:48:\\\\\\\"QQ空间业务自助下单平台www.12580sky.com\\\\\\\";s:4:\\\\\\\"kfqq\\\\\\\";s:9:\\\\\\\"123456789\\\\\\\";s:7:\\\\\\\"anounce\\\\\\\";s:368:\\\\\\\"<h4>下单注意事项</h4><font color=blue>请勿重复下单，之前的单子刷完才能继续下单，重复下单是不会刷的！<br/>21点前添加当天开刷，21点之后添加次日开刷，每天只能提交一次。<br/>本站代挂业务所有都会完成，由于限制时间会比较慢，不过都会刷完，最终解释权归本站所有。</font>\\\\\\\";s:5:\\\\\\\"kaurl\\\\\\\";s:23:\\\\\\\"http://www.12580sky.com\\\\\\\";s:5:\\\\\\\"modal\\\\\\\";s:44:\\\\\\\"欢迎使用QQ空间业务自助下单平台\\\\\\\";s:5:\\\\\\\"title\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"alipay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"alipay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:14:\\\\\\\"alipay_account\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:11:\\\\\\\"alipay2_api\\\\\\\";s:1:\\\\\\\"1\\\\\\\";s:10:\\\\\\\"tenpay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"tenpay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:9:\\\\\\\"qqpay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:9:\\\\\\\"qqpay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:8:\\\\\\\"epay_pid\\\\\\\";s:4:\\\\\\\"1332\\\\\\\";s:8:\\\\\\\"epay_key\\\\\\\";s:32:\\\\\\\"nsMMFTIuu2Ffnwf929FzvuH0IGiRIgsN\\\\\\\";}\\\' where k=\\\'cache\\\'<br/>', '4');
INSERT INTO `system_logs` VALUES ('52', '系统管理员', 'admin', 'setwebinfo', 'index', '2017-10-19 21:41:59', 'update shua_config set v=\\\'a:26:{s:7:\\\\\\\"version\\\\\\\";s:4:\\\\\\\"1001\\\\\\\";s:10:\\\\\\\"admin_user\\\\\\\";s:5:\\\\\\\"admin\\\\\\\";s:9:\\\\\\\"admin_pwd\\\\\\\";s:6:\\\\\\\"123456\\\\\\\";s:10:\\\\\\\"alipay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:10:\\\\\\\"tenpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:9:\\\\\\\"qqpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:9:\\\\\\\"wxpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:5:\\\\\\\"style\\\\\\\";s:1:\\\\\\\"1\\\\\\\";s:8:\\\\\\\"sitename\\\\\\\";s:13:\\\\\\\"第一营销 \\\\\\\";s:8:\\\\\\\"keywords\\\\\\\";s:48:\\\\\\\"QQ空间业务自助下单平台www.12580sky.com\\\\\\\";s:11:\\\\\\\"description\\\\\\\";s:48:\\\\\\\"QQ空间业务自助下单平台www.12580sky.com\\\\\\\";s:4:\\\\\\\"kfqq\\\\\\\";s:9:\\\\\\\"123456789\\\\\\\";s:7:\\\\\\\"anounce\\\\\\\";s:368:\\\\\\\"<h4>下单注意事项</h4><font color=blue>请勿重复下单，之前的单子刷完才能继续下单，重复下单是不会刷的！<br/>21点前添加当天开刷，21点之后添加次日开刷，每天只能提交一次。<br/>本站代挂业务所有都会完成，由于限制时间会比较慢，不过都会刷完，最终解释权归本站所有。</font>\\\\\\\";s:5:\\\\\\\"kaurl\\\\\\\";s:23:\\\\\\\"http://www.12580sky.com\\\\\\\";s:5:\\\\\\\"modal\\\\\\\";s:44:\\\\\\\"欢迎使用QQ空间业务自助下单平台\\\\\\\";s:5:\\\\\\\"title\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"alipay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"alipay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:14:\\\\\\\"alipay_account\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:11:\\\\\\\"alipay2_api\\\\\\\";s:1:\\\\\\\"1\\\\\\\";s:10:\\\\\\\"tenpay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"tenpay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:9:\\\\\\\"qqpay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:9:\\\\\\\"qqpay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:8:\\\\\\\"epay_pid\\\\\\\";s:4:\\\\\\\"1332\\\\\\\";s:8:\\\\\\\"epay_key\\\\\\\";s:32:\\\\\\\"nsMMFTIuu2Ffnwf929FzvuH0IGiRIgsN\\\\\\\";}\\\' where k=\\\'cache\\\'<br/>', '4');
INSERT INTO `system_logs` VALUES ('53', '系统管理员', 'admin', 'setwebinfo', 'index', '2017-10-19 21:42:33', 'update shua_config set v=\\\'a:26:{s:7:\\\\\\\"version\\\\\\\";s:4:\\\\\\\"1001\\\\\\\";s:10:\\\\\\\"admin_user\\\\\\\";s:5:\\\\\\\"admin\\\\\\\";s:9:\\\\\\\"admin_pwd\\\\\\\";s:6:\\\\\\\"123456\\\\\\\";s:10:\\\\\\\"alipay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:10:\\\\\\\"tenpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:9:\\\\\\\"qqpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:9:\\\\\\\"wxpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:5:\\\\\\\"style\\\\\\\";s:1:\\\\\\\"1\\\\\\\";s:8:\\\\\\\"sitename\\\\\\\";s:13:\\\\\\\"第一营销 \\\\\\\";s:8:\\\\\\\"keywords\\\\\\\";s:48:\\\\\\\"QQ空间业务自助下单平台www.12580sky.com\\\\\\\";s:11:\\\\\\\"description\\\\\\\";s:48:\\\\\\\"QQ空间业务自助下单平台www.12580sky.com\\\\\\\";s:4:\\\\\\\"kfqq\\\\\\\";s:9:\\\\\\\"123456789\\\\\\\";s:7:\\\\\\\"anounce\\\\\\\";s:368:\\\\\\\"<h4>下单注意事项</h4><font color=blue>请勿重复下单，之前的单子刷完才能继续下单，重复下单是不会刷的！<br/>21点前添加当天开刷，21点之后添加次日开刷，每天只能提交一次。<br/>本站代挂业务所有都会完成，由于限制时间会比较慢，不过都会刷完，最终解释权归本站所有。</font>\\\\\\\";s:5:\\\\\\\"kaurl\\\\\\\";s:23:\\\\\\\"http://www.12580sky.com\\\\\\\";s:5:\\\\\\\"modal\\\\\\\";s:44:\\\\\\\"欢迎使用QQ空间业务自助下单平台\\\\\\\";s:5:\\\\\\\"title\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"alipay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"alipay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:14:\\\\\\\"alipay_account\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:11:\\\\\\\"alipay2_api\\\\\\\";s:1:\\\\\\\"1\\\\\\\";s:10:\\\\\\\"tenpay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"tenpay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:9:\\\\\\\"qqpay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:9:\\\\\\\"qqpay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:8:\\\\\\\"epay_pid\\\\\\\";s:4:\\\\\\\"1332\\\\\\\";s:8:\\\\\\\"epay_key\\\\\\\";s:32:\\\\\\\"nsMMFTIuu2Ffnwf929FzvuH0IGiRIgsN\\\\\\\";}\\\' where k=\\\'cache\\\'<br/>', '4');
INSERT INTO `system_logs` VALUES ('54', '系统管理员', 'admin', 'sethomeinfo', 'set', '2017-10-19 21:45:09', 'REPLACE INTO shua_config SET v=\\\'1111\\\',k=\\\'marquee\\\'<br/>REPLACE INTO shua_config SET v=\\\'<div style=\\\',k=\\\'point1\\\'<br/>REPLACE INTO shua_config SET v=\\\'<div style=\\\',k=\\\'point2\\\'<br/>REPLACE INTO shua_config SET v=\\\'<div style=\\\',k=\\\'point3\\\'<br/>REPLACE INTO shua_config SET v=\\\'<div style=\\\',k=\\\'point4\\\'<br/>REPLACE INTO shua_config SET v=\\\'<div style=\\\',k=\\\'point5\\\'<br/>REPLACE INTO shua_config SET v=\\\'<div style=\\\',k=\\\'point6\\\'<br/>REPLACE INTO shua_config SET v=\\\'<div style=\\\',k=\\\'middlepoint\\\'<br/>', '3');
INSERT INTO `system_logs` VALUES ('55', '系统管理员', 'admin', 'sethomeinfo', 'set', '2017-10-19 21:45:09', 'update shua_config set v=\\\'\\\' where k=\\\'cache\\\'<br/>', '2');
INSERT INTO `system_logs` VALUES ('56', '系统管理员', 'admin', 'sethomeinfo', 'set', '2017-10-19 21:45:39', 'REPLACE INTO shua_config SET v=\\\'1111\\\',k=\\\'marquee\\\'<br/>REPLACE INTO shua_config SET v=\\\'11\\\',k=\\\'point1\\\'<br/>REPLACE INTO shua_config SET v=\\\'22\\\',k=\\\'point2\\\'<br/>REPLACE INTO shua_config SET v=\\\'33\\\',k=\\\'point3\\\'<br/>REPLACE INTO shua_config SET v=\\\'44\\\',k=\\\'point4\\\'<br/>REPLACE INTO shua_config SET v=\\\'55\\\',k=\\\'point5\\\'<br/>REPLACE INTO shua_config SET v=\\\'66\\\',k=\\\'point6\\\'<br/>REPLACE INTO shua_config SET v=\\\'下单上面提示\\\',k=\\\'middlepoint\\\'<br/>', '3');
INSERT INTO `system_logs` VALUES ('57', '系统管理员', 'admin', 'sethomeinfo', 'set', '2017-10-19 21:45:39', 'update shua_config set v=\\\'\\\' where k=\\\'cache\\\'<br/>', '2');
INSERT INTO `system_logs` VALUES ('58', '系统管理员', '', 'welcome', 'index', '2017-10-19 21:45:53', 'SELECT * FROM shua_tools WHERE 1 order by sort asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('59', '系统管理员', '', 'welcome', 'index', '2017-10-19 21:45:53', 'SELECT * FROM shua_api WHERE 1 order by sort asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('60', '系统管理员', '', 'welcome', 'index', '2017-10-19 21:45:53', 'SELECT count(*) as count1 from shua_orders<br/>', '4');
INSERT INTO `system_logs` VALUES ('61', '系统管理员', '', 'welcome', 'index', '2017-10-19 21:45:53', 'SELECT count(*) as count2 from shua_orders where status=1<br/>', '4');
INSERT INTO `system_logs` VALUES ('62', '系统管理员', '', 'welcome', 'index', '2017-10-19 21:45:53', 'select VERSION() as version<br/>', '4');
INSERT INTO `system_logs` VALUES ('63', '系统管理员', 'admin', 'setwebinfo', 'index', '2017-10-19 21:46:04', 'update shua_config set v=\\\'a:34:{s:7:\\\\\\\"version\\\\\\\";s:4:\\\\\\\"1001\\\\\\\";s:10:\\\\\\\"admin_user\\\\\\\";s:5:\\\\\\\"admin\\\\\\\";s:9:\\\\\\\"admin_pwd\\\\\\\";s:6:\\\\\\\"123456\\\\\\\";s:10:\\\\\\\"alipay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:10:\\\\\\\"tenpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:9:\\\\\\\"qqpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:9:\\\\\\\"wxpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:5:\\\\\\\"style\\\\\\\";s:1:\\\\\\\"1\\\\\\\";s:8:\\\\\\\"sitename\\\\\\\";s:13:\\\\\\\"第一营销 \\\\\\\";s:8:\\\\\\\"keywords\\\\\\\";s:48:\\\\\\\"QQ空间业务自助下单平台www.12580sky.com\\\\\\\";s:11:\\\\\\\"description\\\\\\\";s:48:\\\\\\\"QQ空间业务自助下单平台www.12580sky.com\\\\\\\";s:4:\\\\\\\"kfqq\\\\\\\";s:9:\\\\\\\"123456789\\\\\\\";s:7:\\\\\\\"anounce\\\\\\\";s:368:\\\\\\\"<h4>下单注意事项</h4><font color=blue>请勿重复下单，之前的单子刷完才能继续下单，重复下单是不会刷的！<br/>21点前添加当天开刷，21点之后添加次日开刷，每天只能提交一次。<br/>本站代挂业务所有都会完成，由于限制时间会比较慢，不过都会刷完，最终解释权归本站所有。</font>\\\\\\\";s:5:\\\\\\\"kaurl\\\\\\\";s:23:\\\\\\\"http://www.12580sky.com\\\\\\\";s:5:\\\\\\\"modal\\\\\\\";s:44:\\\\\\\"欢迎使用QQ空间业务自助下单平台\\\\\\\";s:5:\\\\\\\"title\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"alipay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"alipay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:14:\\\\\\\"alipay_account\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:11:\\\\\\\"alipay2_api\\\\\\\";s:1:\\\\\\\"1\\\\\\\";s:10:\\\\\\\"tenpay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"tenpay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:9:\\\\\\\"qqpay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:9:\\\\\\\"qqpay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:8:\\\\\\\"epay_pid\\\\\\\";s:4:\\\\\\\"1332\\\\\\\";s:8:\\\\\\\"epay_key\\\\\\\";s:32:\\\\\\\"nsMMFTIuu2Ffnwf929FzvuH0IGiRIgsN\\\\\\\";s:7:\\\\\\\"marquee\\\\\\\";s:4:\\\\\\\"1111\\\\\\\";s:6:\\\\\\\"point1\\\\\\\";s:2:\\\\\\\"11\\\\\\\";s:6:\\\\\\\"point2\\\\\\\";s:2:\\\\\\\"22\\\\\\\";s:6:\\\\\\\"point3\\\\\\\";s:2:\\\\\\\"33\\\\\\\";s:6:\\\\\\\"point4\\\\\\\";s:2:\\\\\\\"44\\\\\\\";s:6:\\\\\\\"point5\\\\\\\";s:2:\\\\\\\"55\\\\\\\";s:6:\\\\\\\"point6\\\\\\\";s:2:\\\\\\\"66\\\\\\\";s:11:\\\\\\\"middlepoint\\\\\\\";s:18:\\\\\\\"下单上面提示\\\\\\\";}\\\' where k=\\\'cache\\\'<br/>', '4');
INSERT INTO `system_logs` VALUES ('64', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:46:14', 'SELECT * FROM shua_tools WHERE 1 order by sort asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('65', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:46:14', 'SELECT count(*) as numrows from shua_pay<br/>', '4');
INSERT INTO `system_logs` VALUES ('66', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:46:14', 'select count(*) as wcount from shua_pay where status=1<br/>', '4');
INSERT INTO `system_logs` VALUES ('67', '系统管理员', 'admin', 'order', 'index', '2017-10-19 21:46:14', 'SELECT * FROM shua_pay WHERE 1 order by addtime asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('68', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:46:30', 'SELECT count(*) as numrows from shua_api<br/>', '4');
INSERT INTO `system_logs` VALUES ('69', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:46:30', 'SELECT * FROM shua_api WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('70', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:46:37', 'SELECT count(*) as numrows from shua_api<br/>', '4');
INSERT INTO `system_logs` VALUES ('71', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:46:37', 'SELECT * FROM shua_api WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('72', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:46:40', 'SELECT count(*) as numrows from shua_api<br/>', '4');
INSERT INTO `system_logs` VALUES ('73', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:46:40', 'SELECT * FROM shua_api WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('74', '系统管理员', 'admin', 'apigoods', 'add', '2017-10-19 21:47:03', 'insert into `shua_api` (`name`,`price`,`level`,`sort`,`active`) values (\\\'月亮\\\',\\\'100\\\',\\\'1\\\',\\\'10\\\',\\\'1\\\')<br/>', '1');
INSERT INTO `system_logs` VALUES ('75', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:47:04', 'SELECT count(*) as numrows from shua_api<br/>', '4');
INSERT INTO `system_logs` VALUES ('76', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:47:04', 'SELECT * FROM shua_api WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('77', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:49:49', 'SELECT count(*) as numrows from shua_api<br/>', '4');
INSERT INTO `system_logs` VALUES ('78', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:49:49', 'SELECT * FROM shua_api WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('79', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:50:39', 'SELECT count(*) as numrows from shua_api<br/>', '4');
INSERT INTO `system_logs` VALUES ('80', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:50:39', 'SELECT * FROM shua_api WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('81', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:50:41', 'SELECT count(*) as numrows from shua_api<br/>', '4');
INSERT INTO `system_logs` VALUES ('82', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:50:41', 'SELECT * FROM shua_api WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('83', '系统管理员', 'admin', 'apiuser', 'index', '2017-10-19 21:53:05', 'SELECT count(*) as count FROM apiuser WHERE 1 <br/>', '4');
INSERT INTO `system_logs` VALUES ('84', '系统管理员', 'admin', 'apiuser', 'index', '2017-10-19 21:53:05', 'SELECT * FROM apiuser WHERE 1 order by id asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('85', '系统管理员', 'admin', 'apiuser', 'index', '2017-10-19 21:53:24', 'SELECT count(*) as count FROM apiuser WHERE 1 <br/>', '4');
INSERT INTO `system_logs` VALUES ('86', '系统管理员', 'admin', 'apiuser', 'index', '2017-10-19 21:53:24', 'SELECT * FROM apiuser WHERE 1 order by id asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('87', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:53:31', 'SELECT count(*) as numrows from shua_api<br/>', '4');
INSERT INTO `system_logs` VALUES ('88', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:53:31', 'SELECT * FROM shua_api WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('89', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:53:35', 'SELECT count(*) as numrows from shua_api<br/>', '4');
INSERT INTO `system_logs` VALUES ('90', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:53:35', 'SELECT * FROM shua_api WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('91', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:54:43', 'SELECT count(*) as numrows from shua_api<br/>', '4');
INSERT INTO `system_logs` VALUES ('92', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:54:43', 'SELECT * FROM shua_api WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('93', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:55:54', 'SELECT count(*) as numrows from shua_api<br/>', '4');
INSERT INTO `system_logs` VALUES ('94', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:55:54', 'SELECT * FROM shua_api WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('95', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:56:55', 'SELECT count(*) as numrows from shua_api<br/>', '4');
INSERT INTO `system_logs` VALUES ('96', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:56:55', 'SELECT * FROM shua_api WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('97', '系统管理员', 'admin', 'apiuser', 'index', '2017-10-19 21:56:59', 'SELECT count(*) as count FROM apiuser WHERE 1 <br/>', '4');
INSERT INTO `system_logs` VALUES ('98', '系统管理员', 'admin', 'apiuser', 'index', '2017-10-19 21:56:59', 'SELECT * FROM apiuser WHERE 1 order by id asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('99', '系统管理员', 'admin', 'apiuser', 'index', '2017-10-19 21:57:09', 'SELECT count(*) as count FROM apiuser WHERE 1 <br/>', '4');
INSERT INTO `system_logs` VALUES ('100', '系统管理员', 'admin', 'apiuser', 'index', '2017-10-19 21:57:09', 'SELECT * FROM apiuser WHERE 1 order by id asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('101', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:57:17', 'SELECT count(*) as numrows from shua_api<br/>', '4');
INSERT INTO `system_logs` VALUES ('102', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 21:57:17', 'SELECT * FROM shua_api WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('103', '系统管理员', 'admin', 'apiorder', 'index', '2017-10-19 22:01:01', 'SELECT count(*) as numrows from apiorder<br/>', '4');
INSERT INTO `system_logs` VALUES ('104', '系统管理员', 'admin', 'apiorder', 'index', '2017-10-19 22:01:01', 'select count(*) as wcount from apiorder where status=2<br/>', '4');
INSERT INTO `system_logs` VALUES ('105', '系统管理员', 'admin', 'apiorder', 'index', '2017-10-19 22:01:01', 'SELECT * FROM apiorder WHERE 1 order by addtime desc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('106', '系统管理员', 'admin', 'apiorder', 'index', '2017-10-19 22:01:04', 'SELECT count(*) as numrows from apiorder<br/>', '4');
INSERT INTO `system_logs` VALUES ('107', '系统管理员', 'admin', 'apiorder', 'index', '2017-10-19 22:01:04', 'select count(*) as wcount from apiorder where status=2<br/>', '4');
INSERT INTO `system_logs` VALUES ('108', '系统管理员', 'admin', 'apiorder', 'index', '2017-10-19 22:01:04', 'SELECT * FROM apiorder WHERE 1 order by addtime desc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('109', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 22:01:06', 'SELECT count(*) as numrows from shua_api<br/>', '4');
INSERT INTO `system_logs` VALUES ('110', '系统管理员', 'admin', 'apigoods', 'index', '2017-10-19 22:01:06', 'SELECT * FROM shua_api WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('111', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:01:08', 'SELECT count(*) as numrows from shua_tools<br/>', '4');
INSERT INTO `system_logs` VALUES ('112', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:01:08', 'SELECT * FROM shua_tools WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('113', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:01:11', 'SELECT count(*) as numrows from goods<br/>', '4');
INSERT INTO `system_logs` VALUES ('114', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:01:11', 'SELECT * FROM goods WHERE 1  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('115', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:01:11', 'select * from shua_tools where tid=\\\'8\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('116', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:01:11', 'select * from shua_tools where tid=\\\'6\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('117', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:01:11', 'select * from shua_tools where tid=\\\'9\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('118', '系统管理员', 'admin', 'setwebinfo', 'index', '2017-10-19 22:01:14', 'update shua_config set v=\\\'a:34:{s:7:\\\\\\\"version\\\\\\\";s:4:\\\\\\\"1001\\\\\\\";s:10:\\\\\\\"admin_user\\\\\\\";s:5:\\\\\\\"admin\\\\\\\";s:9:\\\\\\\"admin_pwd\\\\\\\";s:6:\\\\\\\"123456\\\\\\\";s:10:\\\\\\\"alipay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:10:\\\\\\\"tenpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:9:\\\\\\\"qqpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:9:\\\\\\\"wxpay_api\\\\\\\";s:1:\\\\\\\"2\\\\\\\";s:5:\\\\\\\"style\\\\\\\";s:1:\\\\\\\"1\\\\\\\";s:8:\\\\\\\"sitename\\\\\\\";s:13:\\\\\\\"第一营销 \\\\\\\";s:8:\\\\\\\"keywords\\\\\\\";s:48:\\\\\\\"QQ空间业务自助下单平台www.12580sky.com\\\\\\\";s:11:\\\\\\\"description\\\\\\\";s:48:\\\\\\\"QQ空间业务自助下单平台www.12580sky.com\\\\\\\";s:4:\\\\\\\"kfqq\\\\\\\";s:9:\\\\\\\"123456789\\\\\\\";s:7:\\\\\\\"anounce\\\\\\\";s:368:\\\\\\\"<h4>下单注意事项</h4><font color=blue>请勿重复下单，之前的单子刷完才能继续下单，重复下单是不会刷的！<br/>21点前添加当天开刷，21点之后添加次日开刷，每天只能提交一次。<br/>本站代挂业务所有都会完成，由于限制时间会比较慢，不过都会刷完，最终解释权归本站所有。</font>\\\\\\\";s:5:\\\\\\\"kaurl\\\\\\\";s:23:\\\\\\\"http://www.12580sky.com\\\\\\\";s:5:\\\\\\\"modal\\\\\\\";s:44:\\\\\\\"欢迎使用QQ空间业务自助下单平台\\\\\\\";s:5:\\\\\\\"title\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"alipay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"alipay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:14:\\\\\\\"alipay_account\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:11:\\\\\\\"alipay2_api\\\\\\\";s:1:\\\\\\\"1\\\\\\\";s:10:\\\\\\\"tenpay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:10:\\\\\\\"tenpay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:9:\\\\\\\"qqpay_pid\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:9:\\\\\\\"qqpay_key\\\\\\\";s:0:\\\\\\\"\\\\\\\";s:8:\\\\\\\"epay_pid\\\\\\\";s:4:\\\\\\\"1332\\\\\\\";s:8:\\\\\\\"epay_key\\\\\\\";s:32:\\\\\\\"nsMMFTIuu2Ffnwf929FzvuH0IGiRIgsN\\\\\\\";s:7:\\\\\\\"marquee\\\\\\\";s:4:\\\\\\\"1111\\\\\\\";s:6:\\\\\\\"point1\\\\\\\";s:2:\\\\\\\"11\\\\\\\";s:6:\\\\\\\"point2\\\\\\\";s:2:\\\\\\\"22\\\\\\\";s:6:\\\\\\\"point3\\\\\\\";s:2:\\\\\\\"33\\\\\\\";s:6:\\\\\\\"point4\\\\\\\";s:2:\\\\\\\"44\\\\\\\";s:6:\\\\\\\"point5\\\\\\\";s:2:\\\\\\\"55\\\\\\\";s:6:\\\\\\\"point6\\\\\\\";s:2:\\\\\\\"66\\\\\\\";s:11:\\\\\\\"middlepoint\\\\\\\";s:18:\\\\\\\"下单上面提示\\\\\\\";}\\\' where k=\\\'cache\\\'<br/>', '4');
INSERT INTO `system_logs` VALUES ('119', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:01:16', 'SELECT count(*) as numrows from shua_tools<br/>', '4');
INSERT INTO `system_logs` VALUES ('120', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:01:16', 'SELECT * FROM shua_tools WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('121', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:02:50', 'SELECT count(*) as numrows from goods<br/>', '4');
INSERT INTO `system_logs` VALUES ('122', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:02:50', 'SELECT * FROM goods WHERE 1  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('123', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:02:50', 'select * from shua_tools where tid=\\\'8\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('124', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:02:50', 'select * from shua_tools where tid=\\\'6\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('125', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:02:50', 'select * from shua_tools where tid=\\\'9\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('126', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:02:59', 'SELECT count(*) as numrows from shua_tools<br/>', '4');
INSERT INTO `system_logs` VALUES ('127', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:02:59', 'SELECT * FROM shua_tools WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('128', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:09:08', 'SELECT count(*) as numrows from shua_tools<br/>', '4');
INSERT INTO `system_logs` VALUES ('129', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:09:08', 'SELECT * FROM shua_tools WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('130', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:09:11', 'SELECT count(*) as numrows from goods<br/>', '4');
INSERT INTO `system_logs` VALUES ('131', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:09:11', 'SELECT * FROM goods WHERE 1  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('132', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:09:11', 'select * from shua_tools where tid=\\\'8\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('133', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:09:11', 'select * from shua_tools where tid=\\\'6\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('134', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:09:11', 'select * from shua_tools where tid=\\\'9\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('135', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:09:13', 'SELECT count(*) as numrows from goods<br/>', '4');
INSERT INTO `system_logs` VALUES ('136', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:09:13', 'SELECT * FROM goods WHERE 1  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('137', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:09:13', 'select * from shua_tools where tid=\\\'8\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('138', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:09:13', 'select * from shua_tools where tid=\\\'6\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('139', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:09:13', 'select * from shua_tools where tid=\\\'9\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('140', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:09:14', 'SELECT count(*) as numrows from shua_tools<br/>', '4');
INSERT INTO `system_logs` VALUES ('141', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:09:14', 'SELECT * FROM shua_tools WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('142', '系统管理员', 'admin', 'apiuser', 'index', '2017-10-19 22:09:21', 'SELECT count(*) as count FROM apiuser WHERE 1 <br/>', '4');
INSERT INTO `system_logs` VALUES ('143', '系统管理员', 'admin', 'apiuser', 'index', '2017-10-19 22:09:21', 'SELECT * FROM apiuser WHERE 1 order by id asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('144', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:15:27', 'SELECT count(*) as numrows from shua_tools<br/>', '4');
INSERT INTO `system_logs` VALUES ('145', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:15:27', 'SELECT * FROM shua_tools WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('146', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:15:29', 'SELECT count(*) as numrows from goods<br/>', '4');
INSERT INTO `system_logs` VALUES ('147', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:15:29', 'SELECT * FROM goods WHERE 1  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('148', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:15:29', 'select * from shua_tools where tid=\\\'8\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('149', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:15:29', 'select * from shua_tools where tid=\\\'6\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('150', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:15:29', 'select * from shua_tools where tid=\\\'9\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('151', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:15:33', 'SELECT count(*) as numrows from shua_tools<br/>', '4');
INSERT INTO `system_logs` VALUES ('152', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:15:33', 'SELECT * FROM shua_tools WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('153', '游客', '', 'welcome', 'index', '2017-10-19 22:20:23', 'SELECT * FROM shua_tools WHERE 1 order by sort asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('154', '游客', '', 'welcome', 'index', '2017-10-19 22:20:23', 'SELECT * FROM shua_api WHERE 1 order by sort asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('155', '游客', '', 'welcome', 'index', '2017-10-19 22:20:23', 'SELECT count(*) as count1 from shua_orders<br/>', '4');
INSERT INTO `system_logs` VALUES ('156', '游客', '', 'welcome', 'index', '2017-10-19 22:20:23', 'SELECT count(*) as count2 from shua_orders where status=1<br/>', '4');
INSERT INTO `system_logs` VALUES ('157', '游客', '', 'welcome', 'index', '2017-10-19 22:20:23', 'select VERSION() as version<br/>', '4');
INSERT INTO `system_logs` VALUES ('158', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:24:18', 'SELECT count(*) as numrows from goods<br/>', '4');
INSERT INTO `system_logs` VALUES ('159', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:24:18', 'SELECT * FROM goods WHERE 1  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('160', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:24:18', 'select * from shua_tools where tid=\\\'8\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('161', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:24:18', 'select * from shua_tools where tid=\\\'6\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('162', '系统管理员', 'admin', 'gres', 'index', '2017-10-19 22:24:18', 'select * from shua_tools where tid=\\\'9\\\' limit 1<br/>', '4');
INSERT INTO `system_logs` VALUES ('163', '系统管理员', 'admin', 'gres', 'add', '2017-10-19 22:26:10', 'SELECT * FROM shua_tools order by tid asc<br/>', '4');
INSERT INTO `system_logs` VALUES ('164', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:43:09', 'SELECT count(*) as numrows from shua_tools<br/>', '4');
INSERT INTO `system_logs` VALUES ('165', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:43:09', 'SELECT * FROM shua_tools WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('166', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:43:19', 'SELECT count(*) as numrows from shua_tools<br/>', '4');
INSERT INTO `system_logs` VALUES ('167', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-19 22:43:19', 'SELECT * FROM shua_tools WHERE 1 order by sort asc  limit 0,10<br/>', '4');
INSERT INTO `system_logs` VALUES ('168', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-20 00:19:45', 'SELECT count(*) as numrows from shua_tools<br/>', '4');
INSERT INTO `system_logs` VALUES ('169', '系统管理员', 'admin', 'gmanege', 'index', '2017-10-20 00:19:45', 'SELECT * FROM shua_tools WHERE 1 order by sort asc  limit 0,10<br/>', '4');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `account` int(255) DEFAULT NULL,
  `isable` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'xiaodao', '96e79218965eb72c92a549dd5a330112', 'xiaodao', '18', '18106322292', '957419420@qq.com', '957419420', '0', '1');
