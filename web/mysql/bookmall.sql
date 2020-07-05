/*
 user表 和 book表
 Navicat Premium Data Transfer

 Source Server         : text
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : bookmall

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 05/07/2020 08:43:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `bookid` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书id',
  `bookname` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书名',
  `booktype` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `bookintro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `bookmoney` double(12, 0) NOT NULL COMMENT '价格',
  `bookvolume` int(11) NOT NULL COMMENT '销量',
  `bookpath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面',
  `bookuserid` int(11) NOT NULL COMMENT '上架用户id',
  PRIMARY KEY (`bookid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '斗破苍穹', '玄幻', '这里是属于斗气的世界，\r\n                没有花俏艳丽的魔法，\r\n                有的，仅仅是繁衍到巅峰的斗气！--天蚕土豆', 68, 11, '\"image/book_image/DouPoCangQong.jpg\"', 0);
INSERT INTO `book` VALUES (2, '帝霸', '玄幻', '千万年前，李七夜栽下一株翠竹。 　　\r\n                八百万年前，李七夜养了一条鲤鱼。 　　\r\n                五百万年前，李七夜收养一个小女孩。 　　\r\n                今天，李七夜一觉醒来，\r\n                翠竹修练成神灵，鲤鱼化作金龙，\r\n                小女孩成为九界女帝。--厌笔萧生', 50, 10, '\"image/book_image/DiBa.jpg\"', 0);
INSERT INTO `book` VALUES (3, '仙逆', '玄幻', '顺为凡，逆则仙，只在心中一念间…… --耳根', 70, 9, '\"image/book_image/XianNi.jpg\"', 0);
INSERT INTO `book` VALUES (4, '遮天', '玄幻', '冰冷与黑暗并存的宇宙深处，九具庞大的龙尸拉着一口青铜古棺，\r\n                亘古长存。\r\n                这是太空探测器在枯寂的宇宙中捕捉到的一幅极其震撼的画面。\r\n                九龙拉棺，究竟是回到了上古，还是来到了星空的彼... --辰东', 108, 8, '\"image/book_image/ZheTian.jpg\"', 0);
INSERT INTO `book` VALUES (6, '倚天屠龙记', '武侠', '元朝末年，群雄纷起，武林动荡。江湖传闻，得到屠龙刀倚天剑者，可以成为武林至尊，号令天下，莫敢不从。--金庸', 80, 0, '\"image/book_image/yitiantulongji.jpg\"', 0);
INSERT INTO `book` VALUES (10, '三体', '科幻', '文化大革命如火如荼地进行，天文学家叶文洁在其间历经劫难，被带到军方绝秘计划“红岸工程”。 --刘慈欣', 100, 0, '\"image/book_image/santi_one.jpg\"', 0);
INSERT INTO `book` VALUES (11, '三体Ⅱ·黑暗森林', '科幻', '三体人在利用科技锁死了地球人的科学之后，出动庞大的宇宙舰队直扑太阳系，面对地球文明前所未有的危局，人类组建起同样庞大的太空舰队，同时（PDC）利用三体人思维透明的致命缺陷，制订了“面壁计划”。 --刘慈欣', 110, 0, '\"image/book_image/santi_tow.jpg\"', 0);
INSERT INTO `book` VALUES (12, '三体Ⅲ·死神永生', '科幻', '身患绝症的云天明买下一颗星星送给暗恋着的大学同学程心，而程心因参与（PIA）向三体舰队发射探测器的工作，却想让航天专业背景的他放弃安乐死，作为被执行人将大脑捐献给阶梯计划。 --刘慈欣', 120, 0, '\"image/book_image/santi_three.jpg\"', 0);
INSERT INTO `book` VALUES (30, '大主宰', '玄幻', '大千世界，位面交汇，万族林立，群雄荟萃，一位位来自下位面的天之至尊，在这无尽世界，演绎着令人向往的传奇，追求着那主宰之路。\r\n 　　无尽火域，炎帝执掌，万火焚苍穹。\r\n 　　武境之内，武祖之威，震慑乾... --天蚕土豆', 90, 0, '\"image/book_image/dazhuzai.jpg\"', 0);
INSERT INTO `book` VALUES (31, '还有比你更废的系统吗', '都市', '我为什么要干那种只有弱智才会干的事情，一切还要从我被冻豆腐砸死那天说起…… --七勾八勒', 90, 0, '\"image/book_image/xitong.jpeg\"', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `userpassword` varchar(14) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '密码',
  `usereamil` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '邮箱',
  `userstatus` int(1) NOT NULL COMMENT '身份',
  `userid` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `usermoney` double(20, 0) NOT NULL COMMENT '金额',
  `userbook` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户图书',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin0', '12345', '0@qq.com', 1, 1, 10000, '2');
INSERT INTO `user` VALUES ('admin1', '12345', '1@qq.com', 1, 2, 10000, '2');

SET FOREIGN_KEY_CHECKS = 1;
