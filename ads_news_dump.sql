-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: ads_news
-- ------------------------------------------------------
-- Server version	8.0.21-0ubuntu0.20.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `userRole` int NOT NULL DEFAULT '1',
  `userStatus` int DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin@gmail.com','admin#5544',0,1),(2,'dhananjayshinde@gmail.com','solar3435',1,1),(3,'bhargavpatil@gmail.com','sinchan890',1,1),(4,'simon23@gmail.com','nobita5702',1,1),(5,'dyanamicemail@gmail.com','oggy&team@980',1,1),(6,'sandeshyadav@gmail.com','s0n!l!@3234',1,1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryId` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(100) NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'General'),(2,'Science'),(3,'Entertainment'),(4,'Politics'),(5,'Business');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_history`
--

DROP TABLE IF EXISTS `log_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_history` (
  `newsId` int NOT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `updatedFrom` varchar(1000) DEFAULT NULL,
  `updatedTo` varchar(1000) DEFAULT NULL,
  `timeStamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_history`
--

LOCK TABLES `log_history` WRITE;
/*!40000 ALTER TABLE `log_history` DISABLE KEYS */;
INSERT INTO `log_history` VALUES (34,'Title is updated','updated title4','updated title new','2020-10-05 23:06:14'),(34,'Title is updated','updated title new','updated title new2','2020-10-06 12:28:49');
/*!40000 ALTER TABLE `log_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `newsId` int NOT NULL AUTO_INCREMENT,
  `imageUrl` varchar(200) DEFAULT '/images/logo.png',
  `title` varchar(200) DEFAULT 'banner',
  `description` varchar(1000) DEFAULT 'banner',
  `source` varchar(200) DEFAULT NULL,
  `date` datetime NOT NULL,
  `categoryId` int DEFAULT '0',
  `status` int NOT NULL DEFAULT '2',
  `views` int DEFAULT '0',
  PRIMARY KEY (`newsId`),
  KEY `categoryIndex` (`categoryId`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (20,'https://www.businesstravelnewseurope.com/uploadedimages/import/bbt/2019/02/cruise_ship_new_0.jpg','Luxury cruise ships broken up in the Turkey as COVID-19 hits travel industry','Luxury cruise ships are being dismantled for scrap metal sales at a sea dock in Turkey after COVID-19 pandemic hit the travel industry. Dozens of workers stripped walls, windows, floors and railings from the cruise ships in the dock in Aliaga. Before COVID-19, Turkey\'s ship-breaking yards typically handled cargo and container ships, Chairman of the ships recycling industrialists\' association said.','https://inshorts.com/en/news/luxury-cruise-ships-broken-up-in-turkey-as-covid19-hits-travel-industry-1601804217677','2013-05-21 10:25:12',5,0,10),(21,'https://images.moneycontrol.com/static-mcnews/2020/05/natural-gas-770x433.jpg?impolicy=website&width=770&height=431','In the futures market, natural gas for October delivery touched an intraday high of Rs 187.70 and an intraday low of Rs 185.30 per mmBtu on MCX.1','Natural gas futures traded firm at Rs 186.40 per mmBtu on October 5 as participants increased their long positions as seen by the open interest. Natural gas had gained 13.97 percent last week on the NYMEX.1','https://www.moneycontrol.com/news/business/commodities/natural-gas-futures-rise-2-to-rs-186-40-per-mmbtu-on-global-cues-5924431.html','2013-05-21 10:25:12',5,1,11),(22,'https://img.etimg.com/thumb/msid-78490528,width-300,imgsize-102686,,resizemode-4,quality-100/c-s-ghosh-bandhan-bank.jpg','Bandhan Bank plan giant leap into retail lending as part of its evolution as universal bank','Kolkata: Private sector Bandhan Bank NSE 2.31 % plans a giant leap into retail lending as part of its evolution as a universal bank with a five-year business plan.','https://economictimes.indiatimes.com/industry/banking/finance/banking/bandhan-bank-plans-giant-leap-into-retail-lending-as-part-of-its-evolution-as-universal-bank/articleshow/78490388.cms','2013-05-21 10:25:12',5,1,21),(23,'https://images.mid-day.com/images/2020/oct/Bobby-Deol-pic_d.jpg','25 Years Of Barsaat: Bobby Deol, Sunny Deol And Rajkumar Santoshi Walk Down The Memory Lane','Barsaat was a story about a village boy who falls in love with a rich man\'s daughter and the challenges that they face in their union. Produced by Dharmendra and Sunny Deol\'s home banner Vijayta Films and directed by Rajkumar Santoshi.October 5, 1995, two fresh faces entered the film industry with a bang! Bobby Deol and Twinkle Khanna debuting with the romantic action film Barsaat that released exactly 25 years ago on this day. Barsaat was a story about a village boy who falls in love with a rich man\'s daughter and the challenges that they face in their union. Produced by Dharmendra and Sunny Deol\'s home banner Vijayta Films and directed by Rajkumar Santoshi. Barsaat is a timeless love story, making the audience fall in love with the lead pair. In fact, both Bobby and Twinkle had bagged the Filmfare Best Debut Awards the following year.','https://www.mid-day.com/articles/25-years-of-barsaat-bobby-deol-sunny-deol-and-rajkumar-santoshi-walk-down-the-memory-lane/23025317','2013-05-21 10:25:12',3,0,4),(24,'https://images.mid-day.com/images/2020/oct/mirzatrailer_d.jpg','Mirzapur 2: The Trailer Of The New Season All Set To Be Out On October 6','Ever since Amazon Prime Video announced the release of Mirzapur 2, fans across the world have been eagerly waiting for the release of the trailer and the wait is almost over! Prime Video is all set to release the trailer of the series tomorrow on October 6 at 1 pm.','https://www.mid-day.com/articles/mirzapur-2-the-trailer-of-the-new-season-all-set-to-be-out-on-october-6/23025328','2013-05-21 10:25:12',3,1,6),(25,'https://images.mid-day.com/images/2020/oct/amit-bachchan_d.jpg','Amitabh Bachchan Is A Pledged Organ Donor; Sports Green Ribbon On KBC Set','Amitabh Bachchan was spotted on the set of Kaun Banega Crorepati sporting a green ribbon on his suit. It signifies that the person is a pledged organ donor. Known for promoting social causes on the show, he highlighted its importance to improve the lives of others. \"I am a pledged organ donor... bearing the giving of life to another,\" said Big B.','https://www.mid-day.com/articles/amitabh-bachchan-is-a-pledged-organ-donor-sports-green-ribbon-on-kbc-set/23020236','2013-05-21 10:25:12',3,1,54),(26,'https://img.latestgkgs.com/2019/08/11/-1565504097.jpg','PM Modi is doing grave injustice to farmers: Sonia Gandhi','NEW DELHI: Congress President Son ..','https://timesofindia.indiatimes.com/politics/news/pm-modi-is-doing-grave-injustice-to-farmers-sonia-gandhi/articleshow/78441103.cms','2013-05-21 10:25:12',4,1,121),(27,'https://img.etimg.com/thumb/msid-76934575,width-1200,height-900,imgsize-329077,overlay-economictimes/photo.jpg','Home secy had warned that UP govt won\'t keep promise: Pawar  ..','PUNE: NCP chief Shard Pawar said on Friday that the then Uni ..','https://timesofindia.indiatimes.com/politics/news/home-secy-had-warned-that-up-govt-wont-keep-promise-pawar-on-babri-case/articleshow/78451440.cms','2013-05-21 10:25:12',4,1,23),(28,'https://www.sciencedaily.com/images/2020/09/200929123540_1_540x360.jpg','Validating the physics behind the new fusion experiment','Two and a half years ago, MIT entered into a research agreement with startup company Commonwealth Fusion Systems to develop a next-generation fusion research experiment, called SPARC, as a precursor to a practical, emissions-free power plant.','https://www.sciencedaily.com/releases/2020/09/200929123540.htm','2013-05-21 10:25:12',2,1,54),(29,'undefined2','test-chnaged','This is test news description.','www.google.com','2020-02-02 23:12:12',1,1,1),(30,'as','as','as','as','2020-10-05 17:30:17',1,1,66),(31,'test-image1','test-title1','This is test news description.','www.google.com','2020-10-05 17:47:42',5,1,100),(32,'test-image1','test-title1','This is test news description.','www.google.com','2020-10-05 17:49:15',1,1,34),(33,'test-image1','test-title1','This is test news description.','www.google.com','2020-10-05 17:57:00',1,1,22),(34,'test35','updated title new2','This is updated news description.3','www.google.com','2020-10-05 17:57:00',1,0,150),(35,'test-image1','test-title1','This is test news description.','www.google.com','2020-10-06 12:39:12',1,1,100);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fguyvuy`@`%`*/ /*!50003 TRIGGER `history_trigger` BEFORE UPDATE ON `news` FOR EACH ROW BEGIN
 IF (OLD.title!=NEW.title) then
	Insert into log_history values (OLD.newsId, 'Title is updated', OLD.title,NEW.title, current_timestamp());
 END IF;
 IF (OLD.description!=NEW.description) then
	Insert into log_history values (OLD.newsId, 'Description is updated', OLD.description,NEW.description, current_timestamp());
 END IF;
 IF (OLD.imageUrl!=NEW.imageUrl) then
	Insert into log_history values (OLD.newsId, 'Image is updated', OLD.imageUrl,NEW.imageUrl, current_timestamp());
 END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'ads_news'
--
/*!50003 DROP PROCEDURE IF EXISTS `getAllNews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fguyvuy`@`%` PROCEDURE `getAllNews`()
Begin
	SELECT * from news ORDER BY newsId and status=1 DESC limit 350;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCategories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fguyvuy`@`%` PROCEDURE `getCategories`()
Begin
	SELECT * from category;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCategoryDis` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fguyvuy`@`%` PROCEDURE `getCategoryDis`()
BEGIN
SELECT title,
CASE
    WHEN categoryId = 2 THEN 'Science Related News Category.'
    WHEN categoryId = 3 THEN 'Entertainment Related News Category.'
    WHEN categoryId = 4 THEN 'Politics Related News Category.'
    WHEN categoryId = 5 THEN 'Business Related News Category.'
    ELSE 'This Is General News Category.'
END AS CatInfo
FROM news;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getNewsByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fguyvuy`@`%` PROCEDURE `getNewsByCategory`(IN id int)
Begin
	IF id>5 THEN
    select 'Bad Request: Invalid CategoryID' AS Exception;
    ELSE
	SELECT * FROM news where categoryId = id and status=1 order by newsId LIMIT 100;
    End IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `low_views` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fguyvuy`@`%` PROCEDURE `low_views`(IN views_number INT)
BEGIN
	DECLARE NewsIDs varchar(1000);
	DECLARE d INT default 0;
	DECLARE v_id,v_views INT;
	DECLARE cur CURSOR FOR SELECT newsId, views from news;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET d=1;
OPEN cur;
SET NewsIDs = "";
label1: LOOP
	IF d=1 THEN
	LEAVE label1;
	END IF;
	FETCH cur INTO v_id,v_views;
	IF v_views < views_number THEN
	SET NewsIDs = CONCAT(v_id, ";", NewsIDs);
	END IF;
	END LOOP;
SELECT NewsIDs;
CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-10 22:51:04
