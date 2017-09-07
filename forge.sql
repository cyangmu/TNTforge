/*
Navicat MySQL Data Transfer

Source Server         : 管理员登录
Source Server Version : 50200
Source Host           : localhost:3306
Source Database       : forge

Target Server Type    : MYSQL
Target Server Version : 50200
File Encoding         : 65001

Date: 2017-08-31 10:36:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminid` int(11) DEFAULT NULL,
  `adminname` varchar(255) NOT NULL,
  `adminpassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456');
INSERT INTO `admin` VALUES ('2', 'Buyer', '123456');
INSERT INTO `admin` VALUES ('3', 'users', '123456');

-- ----------------------------
-- Table structure for orderform
-- ----------------------------
DROP TABLE IF EXISTS `orderform`;
CREATE TABLE `orderform` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `ordertimes` date DEFAULT NULL,
  `orderstates` varchar(10) DEFAULT NULL,
  `ordertotal` decimal(10,2) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `FK_f_orderform_aid` (`aid`),
  KEY `FK_f_orderform_uid` (`uid`),
  CONSTRAINT `FK_f_orderform_aid` FOREIGN KEY (`aid`) REFERENCES `useraddress` (`aid`),
  CONSTRAINT `FK_f_orderform_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderform
-- ----------------------------
INSERT INTO `orderform` VALUES ('1', '2017-04-12', 'WaitPaid', '1752.00', '1', '2');
INSERT INTO `orderform` VALUES ('2', '2017-08-16', 'ReadyPaid', '123.00', '1', '1');
INSERT INTO `orderform` VALUES ('3', '2017-06-13', 'DealDone', '12313.00', '2', '2');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `oitemid` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oitemid`),
  KEY `FK_f_orderitem_orderid` (`orderid`),
  KEY `FK_f_orderitem_pid` (`pid`),
  CONSTRAINT `FK_f_orderitem_orderid` FOREIGN KEY (`orderid`) REFERENCES `orderform` (`orderid`),
  CONSTRAINT `FK_f_orderitem_pid` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('1', '2', '123.00', '2', '1');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(100) DEFAULT NULL,
  `pprice` int(11) DEFAULT NULL,
  `pcount` int(11) DEFAULT NULL,
  `pimg` varchar(255) NOT NULL,
  `pdescript` varchar(200) DEFAULT NULL,
  `psortid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FK_f_products_psortid` (`psortid`),
  CONSTRAINT `FK_f_products_psortid` FOREIGN KEY (`psortid`) REFERENCES `productssort` (`psortid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'Eletria ostma', '188', '52', '', 'very cool', null);
INSERT INTO `products` VALUES ('2', 'TTletria postma', '199', '25', '/Users/liyunjian/Users/liyunjian/Downloads/eclipseProcedure/forge/WebContent/images/onloadproduct/20170825083500005.jpg', 'very beautful', null);
INSERT INTO `products` VALUES ('3', 'Celletria ostma', '299', '25', '/Users/liyunjian/Users/liyunjian/Downloads/eclipseProcedure/forge/WebContent/images/onloadproduct/20170825083700043.jpg', 'very so cool', null);
INSERT INTO `products` VALUES ('4', 'Montria jastma', '399', '22', '', 'very so quit', null);
INSERT INTO `products` VALUES ('5', 'tt', '144', '33', '', 'itrew', null);
INSERT INTO `products` VALUES ('6', 'Tletria postma', '122', '11', '', 'it is nice!', null);
INSERT INTO `products` VALUES ('7', 'Teletria ostma', '133', '4', '', 'it is good!', null);
INSERT INTO `products` VALUES ('58', '6', '6', '6', '6', '6', null);
INSERT INTO `products` VALUES ('59', '7', '7', '7', '7', '7', null);
INSERT INTO `products` VALUES ('61', '8', '8', '8', '8', '8', null);
INSERT INTO `products` VALUES ('62', '8', '8', '8', '8', '8', null);
INSERT INTO `products` VALUES ('63', '8', '8', '8', '8', '8', null);
INSERT INTO `products` VALUES ('64', '12', '12', '12', '12', '12', null);
INSERT INTO `products` VALUES ('65', '44', '44', '44', '/Users/liyunjian/Users/liyunjian/Downloads/eclipseProcedure/forge/WebContent/images/onloadproduct/20170828095800001.jpg', '44', null);
INSERT INTO `products` VALUES ('66', '44', '44', '44', '/Users/liyunjian/Users/liyunjian/Downloads/eclipseProcedure/forge/WebContent/images/onloadproduct/20170828095800001.jpg', '44', null);

-- ----------------------------
-- Table structure for productssort
-- ----------------------------
DROP TABLE IF EXISTS `productssort`;
CREATE TABLE `productssort` (
  `psortid` int(11) NOT NULL,
  `psorname` varchar(20) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`psortid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productssort
-- ----------------------------
INSERT INTO `productssort` VALUES ('1', '全部商品', '0');
INSERT INTO `productssort` VALUES ('2', '衣服', '1');
INSERT INTO `productssort` VALUES ('3', '饰品', '1');
INSERT INTO `productssort` VALUES ('4', '上衣', '2');
INSERT INTO `productssort` VALUES ('5', '裤子', '2');
INSERT INTO `productssort` VALUES ('6', '手提包', '3');
INSERT INTO `productssort` VALUES ('7', '鞋子', '1');
INSERT INTO `productssort` VALUES ('8', '运动鞋', '7');
INSERT INTO `productssort` VALUES ('9', '篮球鞋', '8');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `upassword` varchar(32) NOT NULL,
  `ubirthday` varchar(18) DEFAULT NULL,
  `ugender` varchar(10) DEFAULT NULL,
  `utel` varchar(50) DEFAULT NULL,
  `uemail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`,`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'tom', '123', '2017-08-01', 'Male', '17856476534', '1041259750@qq.com');
INSERT INTO `user` VALUES ('2', 'jane', 'e10adc3949ba59abbe56e057f20f883e', '1995-09-13', 'Female', '13210868396', '506181880@qq.com');
INSERT INTO `user` VALUES ('3', 'kangkang', 'e10adc3949ba59abbe56e057f20f883e', '2016-12-01', 'NotClear', '17854264915', '1234@qq.com');
INSERT INTO `user` VALUES ('4', 'tttt', 'b59c67bf196a4758191e42f76670ceba', '2016-12-01', 'Male', '17854264915', '506181880@qq.com');
INSERT INTO `user` VALUES ('5', '852866899mxm', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-29', 'Male', '13209910923', '852866899@qq.com');
INSERT INTO `user` VALUES ('6', 'Decent', 'e10adc3949ba59abbe56e057f20f883e', '1998-02-11', 'Male', '17845678974', '112313131@12313.com');
INSERT INTO `user` VALUES ('8', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', null, '', '');
INSERT INTO `user` VALUES ('9', 'lee', '202cb962ac59075b964b07152d234b70', '2017-08-26', 'Male', '13566666666', 'yes');
INSERT INTO `user` VALUES ('10', 'mrli', '202cb962ac59075b964b07152d234b70', '1996-08-08', 'Male', '13210868396', '1004975589@qq.com');

-- ----------------------------
-- Table structure for useraddress
-- ----------------------------
DROP TABLE IF EXISTS `useraddress`;
CREATE TABLE `useraddress` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `county` varchar(255) NOT NULL,
  `extra` varchar(50) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `receiver` varchar(50) NOT NULL,
  `receivertel` varchar(50) NOT NULL,
  `tag` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `FK_f_useraddress_uid` (`uid`),
  CONSTRAINT `FK_f_useraddress_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useraddress
-- ----------------------------
INSERT INTO `useraddress` VALUES ('1', '北京市', '北京市', '大兴区', '凉水河二街', '1', '', '', '');
INSERT INTO `useraddress` VALUES ('2', '2', '36', '389', 'æå¾·è¨å¤§æå¤', null, 'èè', '11111111111', '');
INSERT INTO `useraddress` VALUES ('93', 'å¤©æ´¥', 'å¤©æ´¥å¸', 'æ²³ä¸åº', '123', null, 'asdcf', '12312312312', '123');
