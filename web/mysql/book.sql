/*
 Navicat Premium Data Transfer

 Source Server         : text
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : bookmall

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 01/07/2020 20:38:31
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '斗破苍穹', '玄幻', '这里是属于斗气的世界，\r\n                没有花俏艳丽的魔法，\r\n                有的，仅仅是繁衍到巅峰的斗气！--天蚕土豆', 68, 11, '\"image/book_image/DouPoCangQong.jpg\"', 0);
INSERT INTO `book` VALUES (2, '帝霸', '玄幻', '千万年前，李七夜栽下一株翠竹。 　　\r\n                八百万年前，李七夜养了一条鲤鱼。 　　\r\n                五百万年前，李七夜收养一个小女孩。 　　\r\n                今天，李七夜一觉醒来，\r\n                翠竹修练成神灵，鲤鱼化作金龙，\r\n                小女孩成为九界女帝。--厌笔萧生', 50, 10, '\"image/book_image/DiBa.jpg\"', 0);
INSERT INTO `book` VALUES (3, '仙逆', '玄幻', '顺为凡，逆则仙，只在心中一念间…… --耳根', 70, 10, '\"image/book_image/XianNi.jpg\"', 0);
INSERT INTO `book` VALUES (4, '遮天', '玄幻', '冰冷与黑暗并存的宇宙深处，九具庞大的龙尸拉着一口青铜古棺，\r\n                亘古长存。\r\n                这是太空探测器在枯寂的宇宙中捕捉到的一幅极其震撼的画面。\r\n                九龙拉棺，究竟是回到了上古，还是来到了星空的彼... --辰东', 108, 12, '\"image/book_image/ZheTian.jpg\"', 0);
INSERT INTO `book` VALUES (5, '学霸的黑科技系统', '科幻', '“系统，积分能兑钱吗？”\r\n “不能。”\r\n “那我要你何用！”\r\n “本系统能让你当上学霸，你还要钱干啥？”', 90, 0, '\"image/book_image/xuebadeheikejixitong.jpg\"', 1);
INSERT INTO `book` VALUES (6, '倚天屠龙记', '武侠', '元朝末年，群雄纷起，武林动荡。江湖传闻，得到屠龙刀倚天剑者，可以成为武林至尊，号令天下，莫敢不从。--金庸', 80, 0, '\"image/book_image/yitiantulongji.jpg\"', 0);

SET FOREIGN_KEY_CHECKS = 1;
