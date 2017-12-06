-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: ViwersCafe_development
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.17.04.1

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2017-08-23 10:32:44','2017-08-23 10:32:44');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `commentor_id` bigint(20) DEFAULT NULL,
  `body` text,
  `comments_id` bigint(20) DEFAULT NULL,
  `video_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_commentor_id` (`commentor_id`),
  KEY `index_comments_on_comments_id` (`comments_id`),
  KEY `index_comments_on_video_id` (`video_id`),
  CONSTRAINT `fk_rails_3c613142db` FOREIGN KEY (`commentor_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_757d4d369c` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`),
  CONSTRAINT `fk_rails_d11b95f46a` FOREIGN KEY (`comments_id`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dislikes`
--

DROP TABLE IF EXISTS `dislikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dislikes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `disliker_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `video_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_dislikes_on_disliker_id` (`disliker_id`),
  KEY `index_dislikes_on_video_id` (`video_id`),
  CONSTRAINT `fk_rails_4a0abd67f7` FOREIGN KEY (`disliker_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_a2bcee5f38` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dislikes`
--

LOCK TABLES `dislikes` WRITE;
/*!40000 ALTER TABLE `dislikes` DISABLE KEYS */;
INSERT INTO `dislikes` VALUES (3,12,'2017-11-21 16:59:19','2017-11-21 16:59:19',52);
/*!40000 ALTER TABLE `dislikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liker_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `video_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_likes_on_liker_id` (`liker_id`),
  KEY `index_likes_on_video_id` (`video_id`),
  CONSTRAINT `fk_rails_abaf7be654` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`),
  CONSTRAINT `fk_rails_ad8161ed3a` FOREIGN KEY (`liker_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20170823103102'),('20170823170628'),('20170823170902'),('20170823171335'),('20170823172113'),('20170823172636'),('20170823173225'),('20170823180517'),('20170823194721'),('20170823195158'),('20170824044556'),('20170824125445'),('20170829160710'),('20171017101224'),('20171018094559'),('20171109164156'),('20171116103525');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `occurence` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (18,'Sarthak',10,'2017-10-19 12:17:04','2017-11-10 07:10:27'),(19,'Birla',5,'2017-10-19 12:17:04','2017-11-20 09:42:47'),(22,'',1,'2017-10-23 06:35:21','2017-11-21 15:46:41'),(23,'I ',3,'2017-10-23 06:35:21','2017-11-09 13:02:39'),(24,'Love',2,'2017-10-23 06:35:21','2017-11-09 11:14:47'),(25,'You',1,'2017-10-23 06:35:21','2017-10-23 06:35:21'),(26,'am',1,'2017-10-23 06:35:22','2017-10-23 06:35:22'),(27,'in',1,'2017-10-23 06:35:22','2017-10-23 06:35:22'),(28,'Sample',6,'2017-10-23 06:35:22','2017-11-09 13:10:07'),(29,'One',2,'2017-10-23 06:35:22','2017-11-09 13:06:34'),(30,'Last',2,'2017-10-23 06:35:22','2017-11-09 12:28:31'),(31,'Try',1,'2017-10-23 06:35:22','2017-10-23 06:35:22'),(32,'Sample2',2,'2017-10-23 06:41:15','2017-11-09 12:30:29'),(33,'U',1,'2017-10-23 06:41:15','2017-10-23 06:41:15'),(34,'R',1,'2017-10-23 06:41:15','2017-10-23 06:41:15'),(35,'My',1,'2017-10-23 06:41:16','2017-10-23 06:41:16'),(36,'Everything',3,'2017-10-23 06:41:16','2017-11-09 11:21:35'),(37,'Nothing',2,'2017-11-01 10:14:11','2017-11-09 12:24:04'),(38,'Retry',1,'2017-11-01 11:07:59','2017-11-01 11:07:59'),(39,'Lol',1,'2017-11-09 13:02:39','2017-11-09 13:02:39'),(40,'Don\'t',1,'2017-11-09 13:02:39','2017-11-09 13:02:39'),(41,'\'t',1,'2017-11-09 13:06:34','2017-11-09 13:06:34'),(42,'Asdasd',1,'2017-11-10 07:10:27','2017-11-10 07:10:27'),(43,'Let',1,'2017-11-10 07:10:27','2017-11-10 07:10:27'),(44,'It',1,'2017-11-10 07:10:27','2017-11-10 07:10:27'),(45,'Begin',1,'2017-11-10 07:10:27','2017-11-10 07:10:27'),(46,'Hello',1,'2017-11-21 16:03:09','2017-11-21 16:03:09'),(47,'Everyone',1,'2017-11-21 16:03:09','2017-11-21 16:03:09');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_videos`
--

DROP TABLE IF EXISTS `tags_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_videos` (
  `video_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_videos`
--

LOCK TABLES `tags_videos` WRITE;
/*!40000 ALTER TABLE `tags_videos` DISABLE KEYS */;
INSERT INTO `tags_videos` VALUES (52,46),(52,47);
/*!40000 ALTER TABLE `tags_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `firebase_id` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`),
  KEY `index_users_on_first_name` (`first_name`),
  KEY `index_users_on_last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (11,'Shubham','Kalra',NULL,'2020-11-07',NULL,'sample.23@gmail.com','$2a$11$LoRfTMsJYUOSADlmfQjy/.rnMDM1Bh319XFMSdM.WwutwXhGFOUfy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'Js1PfkSBKexZsNgAB_97',NULL,'2017-09-11 17:11:27',NULL,'2017-09-11 17:11:27','2017-09-11 17:11:27',NULL,NULL,NULL),(12,'Sarthak','Birla',NULL,NULL,NULL,'sarthak23birla@gmail.com','$2a$11$COyithbws6UJAAsYTsofTePTau0PwGgqp4ToXSV6SQnAl.R93wJR6',NULL,NULL,NULL,36,'2017-11-21 16:01:35','2017-11-21 15:35:46','127.0.0.1','127.0.0.1','pjVhrs-crZHs9geyCxZp','2017-09-12 04:25:36','2017-09-12 04:22:08',NULL,'2017-09-12 04:22:08','2017-11-21 16:01:35','10342963_861742180553150_9067354109362700796_n.jpg','facebook','1526619167398778'),(13,'Sanidhya','Sharma',NULL,NULL,NULL,'sanidhya.sharma1795@gmail.com','$2a$11$hVdpB9Hc8x63tHadYM0oQOsG1VJ4kHxnEfn4M6QTUHd6tcg5Tx1NO',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'7sbuJs5StXg7_pUxwmPk',NULL,'2017-09-12 09:44:00',NULL,'2017-09-12 09:44:00','2017-09-12 09:44:00','photo.jpg','google_oauth2','102771299174508888953'),(15,'Kanishka','Sharma',NULL,NULL,NULL,'sharma.kanishka03@gmail.com','$2a$11$33PBSMrgKNsg0rm4zwn/K.t.0sPvNH/mJBiMDbkgFnVf.AyaaZqiO',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'6FpVWgNimNwTTWaR7vj9',NULL,'2017-11-18 06:19:17',NULL,'2017-11-18 06:19:17','2017-11-18 06:19:17','12541115_809067459220598_348999345663156425_n.jpg','facebook','1357235151070490'),(16,'LOL','Something',NULL,'2017-11-19',NULL,'snigdha30birla@gmail.com','$2a$11$3UxwRPqt1ZUXokS5xu65pu/okPYTjN8GkkkXiFXk5gOrFV4g10ZDe',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'RxjtFZ_UD91hbYUSsY2V','2017-11-20 03:58:14','2017-11-20 03:46:03',NULL,'2017-11-20 03:46:03','2017-11-20 03:58:14','Modeliing_Part2.png',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `uploader_id` bigint(20) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `preview_images` json DEFAULT NULL,
  `movie` varchar(255) DEFAULT NULL,
  `tag_name` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_videos_on_uploader_id` (`uploader_id`),
  KEY `index_videos_on_title` (`title`),
  KEY `index_videos_on_tag_name` (`tag_name`),
  CONSTRAINT `fk_rails_029f10d7a7` FOREIGN KEY (`uploader_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (52,'Sample1','This is a new Try',12,1,'2017-11-21 16:03:09','2017-11-21 16:59:18','[\"AI1.png\"]','Scrat_No_Time_For_Nuts.mp4','Hello,Everyone',4);
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `viewer_id` bigint(20) DEFAULT NULL,
  `video_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_views_on_viewer_id` (`viewer_id`),
  KEY `index_views_on_video_id` (`video_id`),
  CONSTRAINT `fk_rails_2a3e015328` FOREIGN KEY (`viewer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_db851f8a3c` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-22 16:41:03
