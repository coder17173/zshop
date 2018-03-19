-- MySQL dump 10.13  Distrib 5.5.28, for Win64 (x86)
--
-- Host: localhost    Database: zshop
-- ------------------------------------------------------
-- Server version	5.5.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id`        INT(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(255)     DEFAULT NULL,
  `password`  VARCHAR(255)     DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 14
  DEFAULT CHARSET = utf8
  COMMENT ='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin`
  DISABLE KEYS */;
INSERT INTO `admin`
VALUES (1, 'seller', '981c57a5cfb0f868e064904b8745766f'), (2, 'dudu', '123123'), (3, 'asasd', '123123'),
  (4, '张航', '666666'), (5, 'coco', '123123'), (6, 'seller', 'relles'), (8, '管理员', '735a8d76c0bbd0354fc2cb2aafab5aa8'),
  (9, '逆非', 'f379eaf3c831b04de153469d1bec345e'), (10, '张航', 'f379eaf3c831b04de153469d1bec345e'),
  (11, 'seller', '981c57a5cfb0f868e064904b8745766f'), (12, 'seller', '981c57a5cfb0f868e064904b8745766f'),
  (13, 'seller', '981c57a5cfb0f868e064904b8745766f');
/*!40000 ALTER TABLE `admin`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cid`   INT(11) NOT NULL AUTO_INCREMENT,
  `cname` VARCHAR(255)     DEFAULT NULL,
  PRIMARY KEY (`cid`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8
  COMMENT ='商品一级类目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category`
  DISABLE KEYS */;
INSERT INTO `category` VALUES (1, '电脑'), (2, '图书'), (3, '手机'), (4, '家电'), (5, '男装'), (6, '女装');
/*!40000 ALTER TABLE `category`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorysecond`
--

DROP TABLE IF EXISTS `categorysecond`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorysecond` (
  `csid`   INT(11) NOT NULL AUTO_INCREMENT,
  `csname` VARCHAR(255)     DEFAULT NULL,
  `cid`    INT(11)          DEFAULT NULL,
  PRIMARY KEY (`csid`),
  KEY `categorysecond_category_cid` (`cid`),
  CONSTRAINT `categorysecond_category_cid_fk` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 21
  DEFAULT CHARSET = utf8
  COMMENT ='商品二级类目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorysecond`
--

LOCK TABLES `categorysecond` WRITE;
/*!40000 ALTER TABLE `categorysecond`
  DISABLE KEYS */;
INSERT INTO `categorysecond`
VALUES (1, '笔记本', 1), (3, '游戏本', 1), (4, '平板电脑', 1), (5, '台式机', 1), (6, 'Java', 2), (7, 'C语言', 2), (8, 'C++', 2),
  (9, 'Python', 2), (10, '数据挖掘', 2), (11, '机器学习', 2), (12, '华为', 3), (13, '苹果', 3), (14, '小米', 3), (15, '电视', 4),
  (16, '空调', 4), (17, '洗衣机', 4), (18, 'T恤', 5), (19, '牛仔裤', 5), (20, '连衣裙', 6);
/*!40000 ALTER TABLE `categorysecond`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitems` (
  `itemid`    INT(11) NOT NULL AUTO_INCREMENT,
  `count`     INT(11)          DEFAULT NULL,
  `sub_total` FLOAT            DEFAULT NULL,
  `oid`       INT(11)          DEFAULT NULL,
  `pid`       INT(11)          DEFAULT NULL,
  `buy_price` FLOAT            DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `orderitems_orders_oid` (`oid`),
  KEY `orderitems_product_pid` (`pid`),
  CONSTRAINT `orderitems_orders_oid_fk` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `orderitems_product_pid_fk` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 20
  DEFAULT CHARSET = utf8
  COMMENT ='订单详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems`
  DISABLE KEYS */;
INSERT INTO `orderitems`
VALUES (1, 10, 500, 1, 1, 80), (2, 10, 500, 1, 2, 40), (3, 2, 177.4, NULL, 1, 88.7), (4, 2, 99.6, NULL, 2, 49.8),
  (5, 2, 153.8, NULL, 5, 76.9), (6, 2, 90.8, NULL, 6, 45.4), (7, 3, 266.1, 15, 1, 88.7), (8, 3, 149.4, 15, 2, 49.8),
  (9, 3, 230.7, 15, 5, 76.9), (10, 3, 136.2, 15, 6, 45.4), (11, 3, 230.4, 15, 11, 76.8), (12, 1, 88.7, 16, 1, 88.7),
  (13, 3, 149.4, 16, 2, 49.8), (14, 3, 230.7, 16, 5, 76.9), (15, 4, 181.6, 16, 6, 45.4), (16, 5, 190.5, 16, 8, 38.1),
  (17, 7, 537.6, 16, 11, 76.8), (18, 7, 317.8, 17, 6, 45.4), (19, 1, 9999, 18, 13, 9999);
/*!40000 ALTER TABLE `orderitems`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `oid`          INT(11) NOT NULL AUTO_INCREMENT,
  `create_time`  DATETIME         DEFAULT NULL,
  `name`         VARCHAR(255)     DEFAULT NULL,
  `phone`        VARCHAR(255)     DEFAULT NULL,
  `addr`         VARCHAR(255)     DEFAULT NULL,
  `state`        TINYINT(1)       DEFAULT '1',
  `total`        FLOAT            DEFAULT NULL,
  `uid`          INT(11)          DEFAULT NULL,
  `order_number` VARCHAR(255)     DEFAULT NULL,
  `zipcode`      VARCHAR(255)     DEFAULT NULL,
  `pay_time`     DATETIME         DEFAULT NULL,
  `ship_time`    DATETIME         DEFAULT NULL,
  `confirm_time` DATETIME         DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `orders_user_uid` (`uid`),
  CONSTRAINT `orders_user_uid_fk` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 19
  DEFAULT CHARSET = utf8
  COMMENT ='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders`
  DISABLE KEYS */;
INSERT INTO `orders` VALUES
  (1, '2018-02-21 20:10:22', '张航', '18251955137', '江苏省南京市', 4, 1000, 2, '4323423234', '210000', '2018-02-21 20:10:22',
   '2018-02-21 20:10:22', NULL),
  (3, '2018-02-24 20:00:13', '酱油之星', '12312312312', '江苏省南京市玄武区', 2, 1200, 2, '3242342342', '210000', NULL, NULL, NULL),
  (4, '2018-02-24 19:49:38', '酱油', '18260347122', '江苏省宿迁市宿城区香榭里明珠', 0, 1300, 2, '4571242381', '223800', NULL, NULL, NULL),
  (5, '2018-02-26 14:43:46', '张航', NULL, NULL, 1, 100, 2, NULL, NULL, NULL, NULL, NULL),
  (6, '2018-02-26 14:44:21', '张航', NULL, NULL, 0, 100, 2, NULL, NULL, NULL, NULL, NULL),
  (7, '2018-02-26 14:44:44', '张航', NULL, NULL, 4, 100, 2, NULL, NULL, NULL, NULL, NULL),
  (8, '2018-02-26 14:45:02', '张航', NULL, NULL, 3, NULL, 2, NULL, NULL, NULL, NULL, NULL),
  (9, '2018-02-26 14:45:23', '张航', NULL, NULL, 2, 1, 2, NULL, NULL, NULL, NULL, NULL),
  (10, '2018-02-26 14:45:38', '张航', '', NULL, 3, 2, 2, NULL, NULL, NULL, NULL, NULL),
  (11, '2018-02-26 14:45:49', '张航', NULL, NULL, 0, 100, 2, NULL, NULL, NULL, NULL, NULL),
  (12, '2018-02-26 14:46:04', '张航', '', NULL, 4, 100, 2, NULL, NULL, NULL, NULL, NULL),
  (13, '2018-02-26 14:46:15', '张航', NULL, NULL, 2, 1000, 2, NULL, NULL, NULL, NULL, NULL),
  (14, '2018-03-03 17:05:57', '张航', '18251955137', '江苏省宿迁市宿城区香榭里明珠', 3, 521.6, 2, '20180303170557', '223800', NULL,
   NULL, NULL),
  (15, '2018-03-03 17:22:42', '张振学', '15150756598', '江苏省宿迁市宿城区香榭里明珠', 4, 1012.8, 2, '20180303172242', '223800',
       '2018-03-03 17:40:27', NULL, '2018-03-03 19:20:24'),
  (16, '2018-03-04 20:46:42', '曹苏梅', '15151136810', '江苏省宿迁市宿城区香榭里明珠', 4, 1378.5, 7, '20180304204642', '223800',
       '2018-03-04 20:46:51', NULL, '2018-03-04 20:48:15'),
  (17, '2018-03-04 20:53:33', '张振学', '15150756598', '江苏省宿迁市宿城区香榭里明珠', 4, 317.8, 7, '20180304205333', '223800',
       '2018-03-04 20:54:06', '2018-03-04 20:54:21', '2018-03-04 20:54:36'),
  (18, '2018-03-19 15:20:33', '张航', '18251955137', '江苏省南京市玄武区', 2, 9999, 7, '20180319152033', '223800',
       '2018-03-19 15:21:05', '2018-03-19 15:21:23', NULL);
/*!40000 ALTER TABLE `orders`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pid`         INT(11) NOT NULL AUTO_INCREMENT,
  `pname`       VARCHAR(255)     DEFAULT NULL,
  `price`       FLOAT            DEFAULT NULL,
  `inventory`   INT(5)  NOT NULL,
  `image`       VARCHAR(255)     DEFAULT NULL,
  `comment`     VARCHAR(255)     DEFAULT NULL,
  `create_time` DATETIME         DEFAULT NULL,
  `csid`        INT(11)          DEFAULT NULL,
  `state`       TINYINT(1)       DEFAULT '1'
  COMMENT '商品状态：0下架1上架',
  `buy_price`   FLOAT            DEFAULT NULL,
  `code`        VARCHAR(255)     DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `product_categorysecond_csid` (`csid`),
  CONSTRAINT `product_categorysecond_csid_fk` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 25
  DEFAULT CHARSET = utf8
  COMMENT ='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product`
  DISABLE KEYS */;
INSERT INTO `product` VALUES (1, 'Java编程思想（第4版）', 88.7, 150, '/images/1519185447886.jpg',
                                 '《计算机科学丛书：Java编程思想（第4版）》赢得了全球程序员的广泛赞誉，即使是晦涩的概念，在BruceEckel的文字亲和力和小而直接的编程示例面前也会化解于无形。从Java的基础语法到高级特性（深入的面向对象概念、多线程、自动项目构建、单元测试和调试等），本书都能逐步指导你轻松掌握。',
                                 NULL, 6, 1, NULL, '36547915'),
  (2, 'JAVA从入门到精通', 49.8, 90, '/images/1519185550348.jpg', 'java入门经典书持续八年畅销累计63次重印 32小时视频 732个经典实例 369项面试真题 616项测试 30个模块及案例 PPT电子课件 入门 范例 项目实战全覆盖 随书附赠小白手册电子版。', NULL, 6, 1, NULL, '84714936'),
  (3, 'Java实战开发', 37.4, 50, '/images/1519185654567.jpg', '详细介绍了Java开发中的各项实例，适合有一定开发经验的同学学习。', '2018-02-18 16:09:13', 6, 0, NULL, '73651803'),
  (4, '深入理解Java虚拟机：JVM高级特性与最佳实践', 62.4, 150, '/images/1519184754188.jpg', '基于JDK1.7，围绕内存管理、执行子系统、程序编译与优化、高效并发等核心主题对JVM进行全面而深入的分析，深刻揭示JVM的工作原理。', '2018-02-20 13:50:37', 6, 0, NULL, '64543246'),
  (5, '疯狂JAVA讲义（第四版）', 76.9, 200, '/images/1519527539214.jpg', '十年原创经典，基于Java 9抢先升级面世，李刚作品成为海峡两岸50万读者之选，赠送包含1500分钟课程讲解的视频、源代码、电子书、课件、面试题，提供微信+QQ答疑群，配套学习交流网站。', '2018-02-21 12:03:27', 6, 1, NULL, '73591035'),
  (6, 'Java并发编程的艺术', 45.4, 200, '/images/1519185889456.jpg', '阿里巴巴技术专家/Java并发编程领域领军人物撰写，从JDK源码、JVM、CPU多角度剖析并发编程原理和核心技术。', '2018-02-21 12:04:49', 6, 1, NULL, '73492570'),
  (7, '第一行代码 Java 视频讲解版', 70.2, 100, '/images/1519185968347.jpg', 'Java从入门到精通书籍 国内原创经典Java入门书 Java教学名师视频教学 程序员笔试面试宝典 超过60小时教学视频 600多个实例 200余道常见面试题 400多个提示', '2018-02-21 12:06:08', 6, 0, NULL, '76459337'),
  (8, 'Java程序员面试笔试宝典', 38.1, 150, '/images/1519186026327.jpg', '程序员求职面试笔试必备图书', '2018-02-21 12:07:06', 6, 1, NULL, '834671'),
  (9, 'Java微服务实战', 54.2, 50, '/images/1519186120457.jpg', 'Java微服务实战', '2018-02-21 12:08:40', 6, 0, NULL, '64269026'),
  (10, 'Head First设计模式（中文版）', 67.6, 50, '/images/1519186565215.jpg', '畅销十年，累计印刷30余次，荣获2005年第十五届Jolt通用类图书震撼大奖', '2018-02-21 12:16:05', 6, 1, NULL, '64179024'),
  (11, 'Java开发实战1200例（第1卷）', 76.8, 100, '/images/1519186666495.jpg', '“编程实例”类图书，代码分析、实例速查、练习巩固的绝好帮手', '2018-02-21 12:17:46', 6, 1, NULL, '56921560'),
  (12, '利用Python进行数据分析 [Python for Data Analysis]', 58.7, 100, '/images/1519524462988.jpg', '', '2018-02-25 10:07:43', 9, 1, NULL, '87431083'),
  (13, '戴尔DELL XPS13.3英寸超轻薄窄边框笔记本电脑', 9999, 500, '/images/1521423347842.jpg', '戴尔DELL XPS13.3英寸超轻薄窄边框笔记本电脑(i5-8250U 8G 256GSSD IPS Win10)无忌银', '2018-03-19 09:34:55', 1, 1, NULL, '36935017'),
  (14, 'Apple MacBook Pro 13.3英寸笔记本电脑 深空灰色', 12799, 500, '/images/1521423475066.jpg', 'Apple MacBook Pro 13.3英寸笔记本电脑 深空灰色（2017新款Multi-Touch Bar/Core i5/8GB/256GB MPXV2CH/A）', '2018-03-19 09:37:55', 1, 1, NULL, '83104792'),
  (15, 'ThinkPad 联想 X1 Carbon 2018', 13999, 500, '/images/1521423595884.jpg', 'ThinkPad 联想 X1 Carbon 2018（0JCD）14英寸轻薄笔记本电脑 （ i7-8550u 8G内存 512G 固态硬盘 FHD Win10 Office）', '2018-03-19 09:39:55', 1, 1, NULL, '58215693'),
  (16, '联想(Lenovo)Ideapad 15.6英寸轻薄窄边笔记本电脑', 3999, 500, '/images/1521423766579.jpg', '联想(Lenovo)Ideapad320S 15.6英寸轻薄窄边笔记本电脑(i5-7200U 4G 1T 920MX 2G 正版Office2016)银', '2018-03-19 09:42:46', 1, 1, NULL, '34513670'),
  (17, '联想(Lenovo)拯救者 15.6英寸大屏游戏笔记本电脑', 6399, 500, '/images/1521423863740.jpg', '联想(Lenovo)拯救者R720 15.6英寸大屏游戏笔记本电脑(i5-7300HQ 8G 1T+128G SSD GTX1050Ti 4G IPS 黑金)', '2018-03-19 09:44:23', 3, 1, NULL, '35167925'),
  (18, '戴尔DELL灵越游匣15.6英寸游戏笔记本电脑', 6699, 500, '/images/1521423976390.jpg', '戴尔DELL灵越游匣15.6英寸游戏笔记本电脑(i7-7700HQ 8G 128GSSD+1T GTX1050 4G独显 IPS)黑', '2018-03-19 09:46:16', 3, 1, NULL, '46282586'),
  (19, '微星 MSI 15.6英寸游戏笔记本电脑', 5599, 500, '/images/1521424039495.jpg', '微星 MSI GL62M 7RDX-2600CN 15.6英寸游戏笔记本电脑(i7-7700HQ 8G 1T GTX1050 4G 背光)黑', '2018-03-19 09:47:19', 3, 1, NULL, '42467802'),
  (20, '神舟(HASEE)战神 15.6英寸游戏笔记本电脑', 6999, 500, '/images/1521443268500.jpg', '神舟(HASEE)战神Z7-KP7GT GTX1060 6G独显 15.6英寸游戏笔记本电脑(i7-7700HQ 8G 1T+128G SSD 1080P)黑色', '2018-03-19 15:07:48', 3, 1, NULL, '35162840'),
  (21, 'Apple iPad 平板电脑 9.7英寸 金色', 3189, 1000, '/images/1521443412819.jpg', 'Apple iPad 平板电脑 9.7英寸（128G WLAN版/A9 芯片/Retina显示屏/Touch ID技术 MPGW2CH/A）金色', '2018-03-19 15:10:12', 4, 1, NULL, '42793519'),
  (22, '微软（Microsoft）新Surface Pro 二合一平板电脑 12.3英寸', 4888, 1000, '/images/1521443501120.jpg',
       '微软（Microsoft）新Surface Pro 二合一平板电脑 12.3英寸（Core M3 4G内存 128G存储 ）3 4G内存 128G存储 ）', '2018-03-19 15:11:41', 4, 1,
       NULL, '31643925'), (23, '华为(HUAWEI) M3 青春版 10.1英寸 平板电脑 流光金', 2488, 1000, '/images/1521443558010.jpg',
                               '华为(HUAWEI) M3 青春版 10.1英寸 平板电脑（哈曼卡顿音效 4G内存/64G存储 全网通) 流光金', '2018-03-19 15:12:38', 4, 1,
                               NULL, '15672451'),
  (24, '联想 Miix520 尊享版二合一平板电脑12英寸 星际灰', 5699, 1000, '/images/1521443620577.jpg',
       '联想 Miix520 尊享版二合一平板电脑12英寸（i5-8250U 8G内存/256G/Win10 /背光键盘/Office/指纹识别)星际灰', '2018-03-19 15:13:40', 4, 1, NULL,
       '41638594');
/*!40000 ALTER TABLE `product`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid`       INT(11) NOT NULL AUTO_INCREMENT,
  `nick_name` VARCHAR(255)     DEFAULT NULL,
  `password`  VARCHAR(255)     DEFAULT NULL,
  `real_name` VARCHAR(255)     DEFAULT NULL,
  `email`     VARCHAR(255)     DEFAULT NULL,
  `phone`     VARCHAR(255)     DEFAULT NULL,
  `age`       INT(5)           DEFAULT NULL,
  `addr`      VARCHAR(255)     DEFAULT NULL,
  `zip_code`  VARCHAR(6)       DEFAULT NULL,
  PRIMARY KEY (`uid`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8
  COMMENT ='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user`
  DISABLE KEYS */;
INSERT INTO `user` VALUES (1, 'buyer', 'reyub', 'buyer', '1033831484@qq.com', '18251955137', 25, '江苏省南京市玄武区', '210000'),
  (2, 'coco', 'coco', '逆非', '1033831484@qq.com', '18251955137', 25, '江苏省南京市玄武区', '210000'),
  (3, '张航', '666666', '张航', '1033831484@qq.com', '18251955137', 25, '江苏省宿迁市宿城区', '223800'),
  (4, 'ddd', 'ddd', NULL, NULL, NULL, NULL, NULL, NULL),
  (6, '小明', '735a8d76c0bbd0354fc2cb2aafab5aa8', NULL, NULL, NULL, NULL, NULL, NULL),
  (7, '小强', '735a8d76c0bbd0354fc2cb2aafab5aa8', '小强', '1033831484@qq.com', '18251955137', 25, '江苏省南京市', '210000'),
  (8, 'buyer', '37254660e226ea65ce6f1efd54233424', NULL, '1033831484@qq.com', '18251955137', NULL, NULL, NULL),
  (9, 'buyer', '37254660e226ea65ce6f1efd54233424', NULL, '1033831484@qq.com', '18251955137', NULL, NULL, NULL),
  (10, 'buyer', '37254660e226ea65ce6f1efd54233424', NULL, '1033831484@qq.com', '18251955137', NULL, NULL, NULL);
/*!40000 ALTER TABLE `user`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraddress`
--

DROP TABLE IF EXISTS `useraddress`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraddress` (
  `id`      INT(11) NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255)     DEFAULT NULL,
  `name`    VARCHAR(255)     DEFAULT NULL,
  `phone`   VARCHAR(255)     DEFAULT NULL,
  `zipcode` VARCHAR(255)     DEFAULT NULL,
  `user_id` INT(11)          DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `useraddress_user_uid_fk` (`user_id`),
  CONSTRAINT `useraddress_user_uid_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`uid`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraddress`
--

LOCK TABLES `useraddress` WRITE;
/*!40000 ALTER TABLE `useraddress`
  DISABLE KEYS */;
INSERT INTO `useraddress` VALUES (3, '江苏省宿迁市宿城区香榭里明珠', '曹苏梅', '18260347122', '223800', 2),
  (4, '江苏省宿迁市宿城区香榭里明珠', '张航', '18251955137', '223800', 2), (5, '江苏省宿迁市宿城区香榭里明珠', '张振学', '15150756598', '223800', 2),
  (6, '江苏省南京市玄武区', '张航', '18251955137', '223800', 7), (7, '江苏省宿迁市宿城区香榭里明珠', '曹苏梅', '15151136810', '223800', 7),
  (8, '江苏省宿迁市宿城区香榭里明珠', '张振学', '15150756598', '223800', 7);
/*!40000 ALTER TABLE `useraddress`
  ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2018-03-19 22:00:25
