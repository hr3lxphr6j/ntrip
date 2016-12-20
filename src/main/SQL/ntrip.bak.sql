-- MySQL dump 10.16  Distrib 10.1.20-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.20-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `city_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '城市ID',
  `name` varchar(100) NOT NULL COMMENT '城市名字',
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1039 DEFAULT CHARSET=utf8 COMMENT='城市表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1001,'上海'),(1027,'东莞'),(1032,'佛山'),(1000,'北京'),(1007,'南京'),(1034,'南宁'),(1030,'南昌'),(1019,'厦门'),(1026,'合肥'),(1029,'呼和浩特'),(1023,'哈尔滨'),(1014,'大连'),(1010,'天津'),(1016,'宁波'),(1022,'常州'),(1002,'广州'),(1004,'成都'),(1018,'无锡'),(1025,'昆明'),(1006,'杭州'),(1011,'武汉'),(1008,'沈阳'),(1038,'河北'),(1037,'河南'),(1015,'济南'),(1003,'深圳'),(1031,'温州'),(1028,'石家庄'),(1024,'福州'),(1009,'苏州'),(1012,'西安'),(1033,'贵阳'),(1020,'郑州'),(1005,'重庆'),(1021,'长春'),(1013,'长沙'),(1017,'青岛'),(1036,'黑河');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `ticket_id` bigint(20) unsigned NOT NULL COMMENT '所定票ID',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '预定用户ID',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单时间',
  PRIMARY KEY (`order_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (6,1004,1000,'2016-12-20 05:50:34'),(7,1000,1000,'2016-12-20 05:50:47'),(8,1001,1000,'2016-12-20 05:52:22'),(9,1002,1000,'2016-12-20 15:12:15'),(10,1003,1021,'2016-12-20 15:12:58');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `route_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '线路ID',
  `name` varchar(100) NOT NULL COMMENT '线路名字',
  `start_city_id` bigint(20) unsigned NOT NULL COMMENT '始发城市ID',
  `end_city_id` bigint(20) unsigned NOT NULL COMMENT '终点城市ID',
  `start_time` time NOT NULL COMMENT '出发时间',
  `end_time` time NOT NULL COMMENT '到站时间',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`route_id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_route_name` (`name`),
  KEY `start_city_id` (`start_city_id`),
  KEY `end_city_id` (`end_city_id`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`start_city_id`) REFERENCES `city` (`city_id`),
  CONSTRAINT `route_ibfk_2` FOREIGN KEY (`end_city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1023 DEFAULT CHARSET=utf8 COMMENT='线路表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1000,'东方航空MU3613',1023,1000,'08:00:00','10:00:00',0),(1001,'南方航空CZ6201',1023,1000,'08:00:00','10:00:00',0),(1002,'中国国航CA1640',1023,1000,'08:30:00','10:35:00',0),(1003,'东方航空MU3924',1001,1000,'06:35:00','08:50:00',0),(1004,'吉祥航空HO1252',1001,1000,'06:35:00','08:50:00',0),(1015,'东方航空MU5613',1023,1036,'12:35:00','13:50:00',0),(1016,'中国国航CA1578',1030,1000,'19:35:00','22:00:00',0),(1017,'深圳航空ZH1578',1030,1000,'19:35:00','22:00:00',0),(1018,'东方航空MU5175',1030,1000,'19:50:00','22:15:00',0),(1019,'春秋航空9C8835',1001,1032,'07:25:00','10:00:00',0),(1020,'中国联航KN2365',1001,1032,'09:35:00','12:15:00',0),(1021,'厦门航空MF8104',1000,1019,'06:45:00','09:45:00',0),(1022,'南方航空CZ5056',1000,1019,'06:45:00','09:45:00',0);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `ticket_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '票ID',
  `route_id` bigint(20) unsigned NOT NULL COMMENT '所属线路ID',
  `price` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `seat` int(11) NOT NULL COMMENT '座位号',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态号',
  PRIMARY KEY (`ticket_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1064 DEFAULT CHARSET=utf8 COMMENT='票表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1000,1002,550.00,1,1),(1001,1002,550.00,2,1),(1002,1002,550.00,3,1),(1003,1002,550.00,4,1),(1004,1002,550.00,5,1),(1005,1002,550.00,6,0),(1006,1002,550.00,7,0),(1007,1002,550.00,8,0),(1008,1002,550.00,9,0),(1009,1002,550.00,10,0),(1010,1002,550.00,11,0),(1011,1002,550.00,12,0),(1012,1000,660.00,1,0),(1013,1000,660.00,2,0),(1014,1000,660.00,3,0),(1015,1000,660.00,4,0),(1016,1000,660.00,5,0),(1017,1000,660.00,6,0),(1018,1000,660.00,6,0),(1019,1000,660.00,7,0),(1020,1000,660.00,8,0),(1021,1000,660.00,9,0),(1022,1000,660.00,10,0),(1023,1000,660.00,11,0),(1024,1000,660.00,12,0),(1025,1001,660.00,1,0),(1026,1001,660.00,2,0),(1027,1001,660.00,3,0),(1028,1001,660.00,4,0),(1029,1001,660.00,5,0),(1030,1001,660.00,6,0),(1031,1001,660.00,6,0),(1032,1001,660.00,7,0),(1033,1001,660.00,8,0),(1034,1001,660.00,9,0),(1035,1001,660.00,10,0),(1036,1001,660.00,11,0),(1037,1001,660.00,12,0),(1038,1003,660.00,1,0),(1039,1003,660.00,2,0),(1040,1003,660.00,3,0),(1041,1003,660.00,4,0),(1042,1003,660.00,5,0),(1043,1003,660.00,6,0),(1044,1003,660.00,6,0),(1045,1003,660.00,7,0),(1046,1003,660.00,8,0),(1047,1003,660.00,9,0),(1048,1003,660.00,10,0),(1049,1003,660.00,11,0),(1050,1003,660.00,12,0),(1051,1004,540.00,1,0),(1052,1004,540.00,2,0),(1053,1004,540.00,3,0),(1054,1004,540.00,4,0),(1055,1004,540.00,5,0),(1056,1004,540.00,6,0),(1057,1004,540.00,6,0),(1058,1004,540.00,7,0),(1059,1004,540.00,8,0),(1060,1004,540.00,9,0),(1061,1004,540.00,10,0),(1062,1004,540.00,11,0),(1063,1004,540.00,12,0);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `phone_number` varchar(100) DEFAULT '' COMMENT '电话号码',
  `email` varchar(100) DEFAULT '' COMMENT '电子邮件地址',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1022 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1000,'hr3lxphr6j','58d58ab8364da5b149bdf48afc158ab9','','243313634@qq.com',NULL,'2016-12-11 04:24:34'),(1001,'chigusa','9ed97cff8910fec78986359f7b8c5deb','','',NULL,'2016-12-11 04:24:34'),(1002,'ZhangSan','e10adc3949ba59abbe56e057f20f883e','','',NULL,'2016-12-11 04:24:34'),(1003,'Lisi','e35cf7b66449df565f93c607d5a81d09','','',NULL,'2016-12-11 04:24:34'),(1004,'WangWu','6cf82ee1020caef069e753c67a97a70d','','',NULL,'2016-12-11 04:24:34'),(1005,'ZhaoSi','3cf82a1cb41795ab8b2b9dd11d8c3f64','','',NULL,'2016-12-11 04:24:34'),(1006,'LiuNeng','18d2a05695cb8491914a5c806de39c94','','',NULL,'2016-12-11 04:24:34'),(1007,'ErGou','f566d9d0c22fe0a558b8906392b75003','','',NULL,'2016-12-11 04:24:34'),(1008,'ZhangZhe','bc1a27ca835fac157130fe8a8b6c3862','','',NULL,'2016-12-11 04:24:34'),(1009,'admin','21232f297a57a5a743894a0e4a801fc3','','',NULL,'2016-12-11 04:24:34'),(1010,'SpringTest','e10adc3949ba59abbe56e057f20f883e','','',NULL,'2016-12-11 18:55:52'),(1011,'SpringBootTest','e10adc3949ba59abbe56e057f20f883e','','',NULL,'2016-12-11 18:57:59'),(1014,'BootTest','e10adc3949ba59abbe56e057f20f883e','','',NULL,'2016-12-11 20:01:47'),(1015,'c02110210610204','58d58ab8364da5b149bdf48afc158ab9','','',NULL,'2016-12-15 01:21:28'),(1018,'MCSaozhu','e10adc3949ba59abbe56e057f20f883e','','',NULL,'2016-12-15 01:49:07'),(1020,'123456','e10adc3949ba59abbe56e057f20f883e','','',NULL,'2016-12-16 06:33:16'),(1021,'brainpower','b2c2e589e099cabda60b19926d9d0944','','',NULL,'2016-12-16 06:37:47');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-20 23:33:51
