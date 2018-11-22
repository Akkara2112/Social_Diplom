-- MySQL dump 10.13  Distrib 5.6.26, for Win64 (x86_64)
--
-- Host: localhost    Database: db_a3cf84_akkara2
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_of` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Бобруйск'),(2,'Бобруйск'),(3,'Барановичи'),(4,'Борисов'),(5,'Барань'),(6,'Белоозерск'),(7,'Береза'),(8,'Березино'),(9,'Березовка'),(10,'Браслав'),(11,'Брест'),(12,'Буда-Кошелево'),(13,'Быхов'),(14,'Василевичи'),(15,'Верхнедвинск'),(16,'Ветка'),(17,'Вилейка'),(18,'Витебск'),(19,'Волковыск'),(20,'Воложин'),(21,'Высокое'),(22,'Ганцевичи'),(23,'Глубокое'),(24,'Гомель'),(25,'Горки'),(26,'Городок'),(27,'Гродно'),(28,'Давид-Городок'),(29,'Дзержинск'),(30,'Дисна'),(31,'Добруш'),(32,'Докшицы'),(33,'Дрогичин'),(34,'Дубровно'),(35,'Дятлово'),(36,'Ельск'),(37,'Жодино'),(38,'Жабинка'),(39,'Житковичи'),(40,'Жлобин'),(41,'Заславль'),(42,'Иваново'),(43,'Ивацевичи'),(44,'Ивье'),(45,'Калинковичи'),(46,'Каменец'),(47,'Кировск'),(48,'Клецк'),(49,'Климовичи'),(50,'Кличев'),(51,'Кобрин'),(52,'Копыль'),(53,'Коссово'),(54,'Костюковичи'),(55,'Кричев'),(56,'Крупки'),(57,'Лида'),(58,'Логойск'),(59,'Лунинец'),(60,'Любань'),(61,'Ляховичи'),(62,'Мозырь'),(63,'Малорита'),(64,'Марьина Горка'),(65,'Микашевичи'),(66,'Минск'),(67,'Миоры'),(68,'Могилев'),(69,'Молодечно'),(70,'Мосты'),(71,'Мстиславль'),(72,'Мядель'),(73,'Новополоцк'),(74,'Наровля'),(75,'Несвиж'),(76,'Новогрудок'),(77,'Новолукомль'),(78,'Орша'),(79,'Осиповичи'),(80,'Ошмяны'),(81,'Пинск'),(82,'Полоцк'),(83,'Петриков'),(84,'Поставы'),(85,'Пружаны'),(86,'Речица'),(87,'Рогачев'),(88,'Светлогорск'),(89,'Свислочь'),(90,'Сенно'),(91,'Скидель'),(92,'Славгород'),(93,'Слоним'),(94,'Слуцк'),(95,'Смолевичи'),(96,'Сморгонь'),(97,'Солигорск'),(98,'Старые Дороги'),(99,'Столбцы'),(100,'Столин'),(101,'Толочин'),(102,'Туров'),(103,'Узда'),(104,'Фаниполь'),(105,'Хойники'),(106,'Чаусы'),(107,'Чашники'),(108,'Червень'),(109,'Чериков'),(110,'Чечерск'),(111,'Шклов'),(112,'Щучин');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complete_task`
--

DROP TABLE IF EXISTS `complete_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complete_task` (
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `time_of_complete` varchar(32) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `complete_task_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_open_information` (`id`),
  CONSTRAINT `complete_task_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complete_task`
--

LOCK TABLES `complete_task` WRITE;
/*!40000 ALTER TABLE `complete_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `complete_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_information`
--

DROP TABLE IF EXISTS `contact_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_information` (
  `user_id` int(11) NOT NULL,
  `contact_type_id` int(11) NOT NULL,
  `information` varchar(32) NOT NULL,
  KEY `contact_type_id` (`contact_type_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `contact_information_ibfk_1` FOREIGN KEY (`contact_type_id`) REFERENCES `contact_type` (`id`),
  CONSTRAINT `contact_information_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_open_information` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_information`
--

LOCK TABLES `contact_information` WRITE;
/*!40000 ALTER TABLE `contact_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_type`
--

DROP TABLE IF EXISTS `contact_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_of` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_type`
--

LOCK TABLES `contact_type` WRITE;
/*!40000 ALTER TABLE `contact_type` DISABLE KEYS */;
INSERT INTO `contact_type` VALUES (1,'Mail'),(2,'Skype'),(3,'Instagram'),(4,'Twitter'),(5,'Google+'),(6,'Facebook'),(7,'Вконтакте'),(8,'Tumblr');
/*!40000 ALTER TABLE `contact_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_list`
--

DROP TABLE IF EXISTS `friend_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_list` (
  `I_user_id` int(11) NOT NULL,
  `friend_user_id` int(11) NOT NULL,
  KEY `I_user_id` (`I_user_id`),
  KEY `friend_user_id` (`friend_user_id`),
  CONSTRAINT `friend_list_ibfk_1` FOREIGN KEY (`I_user_id`) REFERENCES `user_open_information` (`id`),
  CONSTRAINT `friend_list_ibfk_2` FOREIGN KEY (`friend_user_id`) REFERENCES `user_open_information` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_list`
--

LOCK TABLES `friend_list` WRITE;
/*!40000 ALTER TABLE `friend_list` DISABLE KEYS */;
INSERT INTO `friend_list` VALUES (1,2),(1,3),(2,1),(3,1),(2,3),(3,2),(1,10),(10,1),(1,73),(73,1),(77,78),(78,77),(77,79),(79,77),(78,79),(79,78),(79,80),(80,79),(78,80),(80,78),(77,80),(80,77);
/*!40000 ALTER TABLE `friend_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_post`
--

DROP TABLE IF EXISTS `group_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) NOT NULL,
  `photo_path` varchar(100) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `date_of_creation` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `group_post_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_post`
--

LOCK TABLES `group_post` WRITE;
/*!40000 ALTER TABLE `group_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_post_сomment`
--

DROP TABLE IF EXISTS `group_post_сomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_post_сomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_post_id` int(11) NOT NULL,
  `user_text` varchar(300) NOT NULL,
  `sending_time` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `group_post_id` (`group_post_id`),
  CONSTRAINT `group_post_сomment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_open_information` (`id`),
  CONSTRAINT `group_post_сomment_ibfk_2` FOREIGN KEY (`group_post_id`) REFERENCES `group_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_post_сomment`
--

LOCK TABLES `group_post_сomment` WRITE;
/*!40000 ALTER TABLE `group_post_сomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_post_сomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_status`
--

DROP TABLE IF EXISTS `group_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_of` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_status`
--

LOCK TABLES `group_status` WRITE;
/*!40000 ALTER TABLE `group_status` DISABLE KEYS */;
INSERT INTO `group_status` VALUES (1,'Открытая'),(2,'Официальная');
/*!40000 ALTER TABLE `group_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_of` varchar(50) NOT NULL,
  `about_group` varchar(500) DEFAULT NULL,
  `group_status_id` int(11) NOT NULL,
  `date_of_creation` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_status_id` (`group_status_id`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`group_status_id`) REFERENCES `group_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `talk_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_text` varchar(200) NOT NULL,
  `sending_time` datetime NOT NULL,
  `message_status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `talk_id` (`talk_id`),
  KEY `message_status_id` (`message_status_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_open_information` (`id`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`talk_id`) REFERENCES `talk` (`id`),
  CONSTRAINT `message_ibfk_3` FOREIGN KEY (`message_status_id`) REFERENCES `message_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (4,8,1,'lol','2018-05-26 00:13:49',NULL),(5,8,1,'lol','2018-05-26 00:18:15',NULL),(6,8,1,'lalka','2018-05-26 00:18:44',NULL),(7,8,1,'lol','2018-05-26 00:19:05',NULL),(8,2,1,'lol','2018-05-26 00:20:16',NULL),(9,1,1,'lol','2018-05-26 00:20:33',NULL),(10,1,1,'lol','2018-05-26 00:20:52',NULL),(11,1,1,'lol','2018-05-26 00:21:33',NULL),(12,9,1,'ты не ты , когда голоден','2018-05-26 00:25:48',NULL),(13,9,1,'lalka','2018-05-26 00:27:31',NULL),(14,1,1,'123','2018-06-02 00:04:05',NULL),(15,10,73,'456123','2018-06-02 16:50:55',NULL),(16,10,73,'456487adfsdfasdf','2018-06-02 16:51:17',NULL),(17,11,20,'hello','2018-06-02 16:58:39',NULL),(18,12,78,'Привет','2018-06-21 14:28:47',NULL),(19,12,78,'вапав','2018-06-21 14:33:25',NULL),(20,13,79,'Привет!','2018-06-23 11:30:50',NULL),(21,14,79,'Как дела?','2018-06-23 11:31:54',NULL),(22,15,80,'ты тут?','2018-06-23 11:36:19',NULL),(23,12,78,'ты писала по поводу кода. Я могу помочь','2018-06-23 11:37:30',NULL);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_status`
--

DROP TABLE IF EXISTS `message_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_of` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_status`
--

LOCK TABLES `message_status` WRITE;
/*!40000 ALTER TABLE `message_status` DISABLE KEYS */;
INSERT INTO `message_status` VALUES (1,'Отправлено'),(2,'Не отправлено');
/*!40000 ALTER TABLE `message_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profession`
--

DROP TABLE IF EXISTS `profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_of` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profession`
--

LOCK TABLES `profession` WRITE;
/*!40000 ALTER TABLE `profession` DISABLE KEYS */;
INSERT INTO `profession` VALUES (1,'Программист'),(2,'Фармацевт'),(3,'Психолог');
/*!40000 ALTER TABLE `profession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sex`
--

DROP TABLE IF EXISTS `sex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_of` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sex`
--

LOCK TABLES `sex` WRITE;
/*!40000 ALTER TABLE `sex` DISABLE KEYS */;
INSERT INTO `sex` VALUES (1,'Мужской'),(2,'Женский');
/*!40000 ALTER TABLE `sex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talk`
--

DROP TABLE IF EXISTS `talk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_of_creation` varchar(32) NOT NULL,
  `name_of` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talk`
--

LOCK TABLES `talk` WRITE;
/*!40000 ALTER TABLE `talk` DISABLE KEYS */;
INSERT INTO `talk` VALUES (1,'20.04.2018 1:42:17','тест'),(2,'20.04.2018 1:42:21','лол'),(3,'20.04.2018 1:42:27','это просто'),(5,'26.05.2018 0:09:42','hdghfg, ghjkl'),(8,'26.05.2018 0:13:49','hdghfg, ghjkl'),(9,'26.05.2018 0:25:47','hdghfg, Alex'),(10,'02.06.2018 16:50:54','Saitas, hdghfg'),(11,'02.06.2018 16:58:38','jhkjhkjhjk, hdghfg'),(12,'6/21/2018 2:28:46 PM','Саморядов, Лебедева'),(13,'6/23/2018 11:30:50 AM','Василевск, Лебедева'),(14,'6/23/2018 11:31:54 AM','Василевск, Саморядов'),(15,'6/23/2018 11:36:19 AM','Дятко, Саморядов');
/*!40000 ALTER TABLE `talk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profession_id` int(11) NOT NULL,
  `task_path` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profession_id` (`profession_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`profession_id`) REFERENCES `profession` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_close_information`
--

DROP TABLE IF EXISTS `user_close_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_close_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(16) NOT NULL,
  `user_pasword` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_close_information`
--

LOCK TABLES `user_close_information` WRITE;
/*!40000 ALTER TABLE `user_close_information` DISABLE KEYS */;
INSERT INTO `user_close_information` VALUES (1,'stasia','4122'),(2,'akkara','4122'),(3,'stasia_akkara','4122'),(10,'lolollol','1234'),(11,'stasia1','9253598s'),(12,'test2','4122'),(18,'stasia3','9253598s'),(19,'stasia4','4122'),(20,'stasia5','4122'),(21,'stasia6','4122'),(22,'stasia7','4122'),(23,'stasia8','4122'),(24,'stasia11','4122'),(25,'admin','Aa123+'),(26,'admin1','Aa123+'),(27,'admin2','Aa123+'),(28,'admin4','123'),(30,'lol','lalka'),(31,'asd','asd'),(32,'asdd','asdd'),(34,'qerqwer','qwerqwer'),(36,'stasia111','4122'),(38,'stasia1111','4122'),(39,'test11','4122'),(41,'ASDD','ASDD'),(42,'asddfdsgdfg','asdd'),(43,'asddfdsgdfgа','12345'),(44,'asddfa','4122'),(45,'ksjdlfkj','4122'),(47,'FirstNameField','FirstNameField'),(48,'wwww','wwww'),(49,'vertex','vertex'),(50,'debug','debug'),(51,'oleg','oleg'),(52,'gold','gold'),(53,'dfdfdfd','dfdfdfd'),(54,'fffffff','fffffff'),(55,'хммм','какой же пароль'),(56,'asdasd','asdd'),(57,'sagadf','asdd'),(58,'sdhfsd','asdd'),(59,'asfsdga','asdd'),(60,'fsdf','asdd'),(61,'asfsdf','asdd'),(62,'ASFSD','ASDD'),(63,'sdgs','asdd'),(64,'оооо','1111'),(65,'11111','1111'),(66,'alert','alert(\"FFFFF\");'),(67,'RegistrationForm','RegistrationForm'),(68,'asdfw','asdfw'),(69,'asdfw','asdfw'),(70,'asdfw','asdfw'),(71,'asdfw','asdfw'),(72,'asdfq','asdfw'),(73,'akkara2112','4122'),(74,'test22','4122'),(75,'admin_adminovich','adminn'),(76,'hello','4122'),(77,'ylechka','lebedeva'),(78,'samorad','1234'),(79,'horosiilog','4122'),(80,'kolonka45','4122');
/*!40000 ALTER TABLE `user_close_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_in_talk`
--

DROP TABLE IF EXISTS `user_in_talk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_in_talk` (
  `user_id` int(11) NOT NULL,
  `talk_id` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `talk_id` (`talk_id`),
  CONSTRAINT `user_in_talk_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_open_information` (`id`),
  CONSTRAINT `user_in_talk_ibfk_2` FOREIGN KEY (`talk_id`) REFERENCES `talk` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_in_talk`
--

LOCK TABLES `user_in_talk` WRITE;
/*!40000 ALTER TABLE `user_in_talk` DISABLE KEYS */;
INSERT INTO `user_in_talk` VALUES (1,1),(2,1),(1,8),(10,8),(1,9),(25,9),(1,10),(73,10),(1,11),(20,11),(77,12),(78,12),(77,13),(79,13),(78,14),(79,14),(78,15),(80,15);
/*!40000 ALTER TABLE `user_in_talk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_open_information`
--

DROP TABLE IF EXISTS `user_open_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_open_information` (
  `id` int(11) NOT NULL,
  `sex_id` int(11) NOT NULL,
  `about_youself` varchar(500) DEFAULT NULL,
  `profession_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `user_status_id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `avatar_path` varchar(100) NOT NULL,
  `user_quote` varchar(32) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `first_name` varchar(16) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `patronymic` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sex_id` (`sex_id`),
  KEY `profession_id` (`profession_id`),
  KEY `user_status_id` (`user_status_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `user_open_information_ibfk_1` FOREIGN KEY (`sex_id`) REFERENCES `sex` (`id`),
  CONSTRAINT `user_open_information_ibfk_2` FOREIGN KEY (`id`) REFERENCES `user_close_information` (`id`),
  CONSTRAINT `user_open_information_ibfk_3` FOREIGN KEY (`profession_id`) REFERENCES `profession` (`id`),
  CONSTRAINT `user_open_information_ibfk_4` FOREIGN KEY (`user_status_id`) REFERENCES `user_status` (`id`),
  CONSTRAINT `user_open_information_ibfk_5` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_open_information`
--

LOCK TABLES `user_open_information` WRITE;
/*!40000 ALTER TABLE `user_open_information` DISABLE KEYS */;
INSERT INTO `user_open_information` VALUES (1,1,'тролололо я достала тролололо',1,9999,1,1,'/Images/users/useravatarHeroes-of-the-Storm-Malthael.jpg','кек',NULL,'jhhjk','hdghfg',NULL),(2,1,'111',1,999,1,1,'null','111','2021-12-20','lol','olo','kek'),(3,1,'111',1,999,1,1,'null','111','2021-12-20','lol','olo','kek'),(10,2,'gsdfgdfgsdfgsdfg',1,0,1,14,'','asgsdfgsdf','2009-02-27','gjhbknlm','ghjkl','jsdhfjkh'),(11,2,'sdfdfklklkjhgfdh',1,0,1,35,'','sdfdfgfg','2000-06-08','sdfsdfsdf','sfsdfa','sdfsdfsdf'),(12,2,'jkshdfjkhsdjkfh',1,0,1,14,'','hskldfjsdhf','1996-12-25','ghjkjh','fghjkl','hgjhgjhg'),(18,2,'jksdhkfjhskjdfh',1,0,1,18,'','dasfjshdfjkh','2007-09-29','jkhjkhkjh','ghjkjh','jhjkhkjh'),(19,2,'klsdjflkjsdlkfjslkdjf',1,0,1,14,'','dsfjskldjflksjdflk','2013-05-25','jkhkjhkjh','jhjkhjkh','jkhjkh'),(20,2,'sdfkljsdklfjlksjdf',1,0,1,21,'','fsdffffffff','2008-04-26','hjkhjkhjkh','jhkjhkjhjk','jkhjkhkjh'),(21,2,'jhskdjfhskjdfh',1,0,1,18,'','jhsdjkfhskjdfh','2003-05-23','kjhkjhkjh','jkhjkhkjh','jkhjkhkjh'),(22,2,'dfsdfsdfsdf',1,0,1,16,'','dfsdsfd','2008-04-24','kjhkjhkjh','jhkjhkjhk','jkhkjhjkh'),(23,2,'dfsdfsdfsdf',1,0,1,16,'','dfsdsfd','2008-04-24','kjhkjhkjh','jhkjhkjhk','jkhkjhjkh'),(24,2,'ksklgjsldkfjg',1,0,1,28,'','sfkjlkdfjlk`klj','2005-05-25','lkjlkjlkj','kjlkjlkj','klsdjfkljsldfkj'),(25,2,'j ct,t',1,0,1,66,'','cnfnec','2011-11-11','Alex','Alex',''),(26,2,'j ct,t',1,0,1,66,'','cnfnec','2011-11-11','Alex','Alex',''),(27,2,'j ct,t',1,0,1,66,'','cnfnec','2011-11-11','Alex','Alex',''),(28,2,'j ct,t',1,0,1,66,'','cnfnec','2011-11-11','Alex','Alex',''),(30,1,'',1,0,1,66,'','ЙА БОГ','0003-02-13','Mihail','Dyatko','none'),(31,1,'',1,0,1,1,'','asd','2018-04-05','asd','asd','asd'),(32,2,'asd',1,0,1,15,'','asd','2010-03-11','asd','asd','asd'),(34,2,'qwerqwer',1,0,1,107,'','qwerqwer','2011-07-23','qewrqwer','qwerqwer','qwerqre'),(36,2,'lkkljlkjdf',1,0,1,17,'','kjlkjlkjlkj','2003-09-27','asdasd','dasdasd','asdasd'),(38,2,'asdasd',1,0,1,13,'','dasda','2014-03-13','asdasdasd','dasdasd','sadasdasd'),(39,1,'лдовадлыовдалоывлдао',1,0,1,27,'','фвылофлдыовдло','2003-05-22','4122','4122','4122'),(41,2,'',1,0,1,1,'','SDF','0324-04-23','ASDD','ASDD','ASDD'),(42,1,'sgdsgf',1,0,1,1,'','sadf','0023-04-23','asdd','asdd','asdd'),(43,1,'sgdsgf',1,0,1,1,'','sadf','0023-04-23','asdd','asdd','asdd'),(44,1,'sgdsgf',1,0,1,1,'','sadf','0023-04-23','asdd','asdd','asdd'),(45,2,'sdffsd',1,0,1,12,'','sdfsdf','2011-05-24','jksjkfhsdjkf','fsjkdfjkh','jksdjkfhskj'),(47,1,'FirstNameField',1,0,1,15,'','FirstNameField','2018-05-04','FirstNameField','FirstNameField','FirstNameField'),(48,1,'qweqwe',1,0,1,20,'','qweqwqwe','1997-10-17','qwe','qwe','qwe'),(49,1,'vertex',1,0,1,15,'','vertex','2018-05-18','vertex','vertex','vertex'),(50,1,'debug',1,0,1,15,'','debug','2018-05-25','debug','debug','debug'),(51,1,'oleg',1,0,1,16,'','oleg','2018-05-10','oleg','oleg','oleg'),(52,1,'gold',1,0,1,3,'','gold','2018-05-09','gold','gold','gold'),(53,1,'dfdfdfd',1,0,1,17,'','dfdfdfd','2018-05-18','dfdfdfd','dfdfdfd','dfdfdfd'),(54,1,'fffffff',1,0,1,14,'','fffffff','2018-05-25','fffffff','fffffff','fffffff'),(55,1,'',1,0,1,16,'','авправрв','0043-03-12','аываыв','упсыв','аываыв'),(56,1,'',1,0,1,1,'','fsdf','2345-04-12','asdd','asdd','asdd'),(57,1,'',1,0,1,1,'','SDFHFHD','3465-05-31','gsdfhb','sghsdf','fvdsfb'),(58,1,'',1,0,1,1,'','fdgdfg','2235-03-24','asdd','asdd','asdd'),(59,1,'',1,0,1,1,'','agdas','0235-04-12','dsgasd','sdgsdfghsdf','fdsg'),(60,1,'',1,0,1,1,'','sdh','0032-04-21','gfdsg','dgsd','sddg'),(61,1,'',1,0,1,1,'','SDGASDG','4534-04-23','dfgsad','asdd','fdg'),(62,1,'',1,0,1,1,'','SDFGSDGS','0023-04-21','SDFGSD','ASDGF','DSGSD'),(63,1,'',1,0,1,2,'','safas','5765-06-07','gkjg','jhg','kjhgjkg'),(64,1,'оооо',1,0,1,1,'','оооо','2018-05-17','оооо','оооо','оооо'),(65,1,'',1,0,1,6,'','11111111','2002-08-19','11','11','11'),(66,1,'alert(\"FFFFF\");',1,0,1,13,'','alert(\"FFFFF\");','2018-05-23','alert(\"FFFFF\");','alert(\"FFFFF\");','alert(\"FFFFF\");'),(67,1,'RegistrationForm',1,0,1,13,'','RegistrationForm','2018-05-23','RegistrationForm','RegistrationForm','RegistrationForm'),(68,1,'asdfw',1,0,1,15,'','asdfw','2018-05-08','asdfw','asdfw','asdfw'),(69,1,'asdfw',1,0,1,15,'','asdfw','2018-05-08','asdfw','asdfw','asdfw'),(70,1,'asdfw',1,0,1,15,'','asdfw','2018-05-08','asdfw','asdfw','asdfw'),(71,1,'asdfw',1,0,1,15,'','asdfw','2018-05-08','asdfw','asdfw','asdfw'),(72,1,'asdfw',1,0,1,15,'','asdfw','2018-05-08','asdfw','asdfw','asdfw'),(73,2,'kek :3',1,0,1,66,'','It\'s mine profile','1998-12-21','Akkara','Saitas',''),(74,1,'sdjfhksjdhfkjsdhfj',1,0,1,21,'','sfjshdjkfhkjsdfhk','1999-12-19','LK:LK','LK:LAKD','JHJKHKJ'),(75,1,'',1,0,1,1,'','admin!','3243-04-12','admin','admin','admin'),(76,1,'sdfsdfs',1,0,1,85,'','sdfsdf','1989-03-24','hi','hi','hi'),(77,2,'',1,1212,1,104,'/Images/users/useravatar20150926_175358.jpg','','1999-06-15','Ульяна','Лебедева','Александровна'),(78,1,'Позитив',1,1000,1,66,'/Images/users/useravatarРУВД.jpg','Все норм','2016-02-16','Юрий','Саморядов','Александрович'),(79,1,'',1,0,1,106,'/Images/users/useravatar20151025_145518.jpg','Я помогу Вам с Вашей проблемой!','1989-03-20','Леонид','Василевск',''),(80,1,'Я ботан',1,0,1,66,'/Images/users/useravatarBblcI4dS16I.jpg','В активном поиске','1999-10-15','Михаил','Дятко','Сергеевич');
/*!40000 ALTER TABLE `user_open_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_post`
--

DROP TABLE IF EXISTS `user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `photo_path` varchar(100) DEFAULT NULL,
  `date_of_creation` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_open_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_post`
--

LOCK TABLES `user_post` WRITE;
/*!40000 ALTER TABLE `user_post` DISABLE KEYS */;
INSERT INTO `user_post` VALUES (1,1,'sdfgsdfg','/Images/users/userposts/IMG_20150531_204905.JPG','11.05.2018 17:43:40'),(2,75,'вапрапрвпр',NULL,'5/21/2018 8:48:42 AM'),(3,75,'пваыпвап',NULL,'5/21/2018 8:52:26 AM'),(4,75,'аываыва',NULL,'5/21/2018 8:52:30 AM'),(5,1,'lalka','/Images/users/userposts/004.jpg','5/23/2018 2:53:50 PM'),(6,1,'горох\r\n','/Images/users/userposts/пара2.jpg','5/24/2018 5:11:51 PM'),(7,1,'jsfppgsgig','/Images/users/userposts/BeautyPlus_20180421011854_save.jpg','26.05.2018 18:17:58'),(8,1,'/(*<*)\\','/Images/users/userposts/4580702.jpg','6/8/2018 9:31:14 PM'),(9,78,'Моя группа)\r\n','/Images/users/userposts/группа.jpg','6/21/2018 2:30:05 PM'),(10,78,'Нужно добиваться успеха во всём!','/Images/users/userposts/Aion0003 (3).jpg','6/21/2018 2:37:20 PM'),(11,78,'класс)',NULL,'6/21/2018 2:37:51 PM'),(12,78,'мне нравится)',NULL,'6/21/2018 2:37:59 PM');
/*!40000 ALTER TABLE `user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_post_сomment`
--

DROP TABLE IF EXISTS `user_post_сomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_post_сomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_post_id` int(11) NOT NULL,
  `user_text` varchar(300) NOT NULL,
  `sending_time` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_post_id` (`user_post_id`),
  CONSTRAINT `user_post_сomment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_open_information` (`id`),
  CONSTRAINT `user_post_сomment_ibfk_2` FOREIGN KEY (`user_post_id`) REFERENCES `user_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_post_сomment`
--

LOCK TABLES `user_post_сomment` WRITE;
/*!40000 ALTER TABLE `user_post_сomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_post_сomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_status`
--

DROP TABLE IF EXISTS `user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_of` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_status`
--

LOCK TABLES `user_status` WRITE;
/*!40000 ALTER TABLE `user_status` DISABLE KEYS */;
INSERT INTO `user_status` VALUES (1,'Пользователь'),(2,'Куратор');
/*!40000 ALTER TABLE `user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_in_group`
--

DROP TABLE IF EXISTS `users_in_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_in_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `users_in_group_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_open_information` (`id`),
  CONSTRAINT `users_in_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_in_group`
--

LOCK TABLES `users_in_group` WRITE;
/*!40000 ALTER TABLE `users_in_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_in_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_a3cf84_akkara2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-30 19:02:26
