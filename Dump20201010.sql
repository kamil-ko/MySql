-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: rental_db
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `reg_number` varchar(9) NOT NULL,
  `mark` varchar(15) NOT NULL,
  `model` varchar(15) NOT NULL,
  `rate` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`reg_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES ('NE 23458','renault','megane',1),('SI 60606','Fiat','126p',2),('SJ 00001','Fiat','125p',2),('SK 12345','Toyota','Yaris',4),('SL 234455','Opel','Astra',8);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cust_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `address` varchar(30) NOT NULL,
  `postal_code` varchar(6) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Adam','Nowak','Malinowa 15','40-101','adam.nowak@o2.pl'),(2,'Ewa','Zabawa','Agrestowa 1','41-100','ewa.zabawa@wp.pl'),(3,'Leszek','Szczotka','Mieszka 1','41-130','leszek.szczotka@o3.pl '),(4,'Celina','Kowal','Centralna 10','41-111','celina.kowal@gmail.pl');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_rents`
--

DROP TABLE IF EXISTS `customer_rents`;
/*!50001 DROP VIEW IF EXISTS `customer_rents`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_rents` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `reg_number`,
 1 AS `rent_date`,
 1 AS `return_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rent`
--

DROP TABLE IF EXISTS `rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rent` (
  `rent_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `cust_id` smallint unsigned NOT NULL,
  `reg_number` varchar(9) NOT NULL,
  `rent_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`rent_id`),
  KEY `reg_number` (`reg_number`),
  KEY `rent_ibfk_1` (`cust_id`),
  CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `rent_ibfk_2` FOREIGN KEY (`reg_number`) REFERENCES `car` (`reg_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent`
--

LOCK TABLES `rent` WRITE;
/*!40000 ALTER TABLE `rent` DISABLE KEYS */;
INSERT INTO `rent` VALUES (1,1,'SK 12345','2015-01-01','2015-02-03'),(2,1,'SL 234455','2015-02-05',NULL),(3,2,'SI 60606','2015-03-07','2016-03-08'),(4,3,'SL 234455','2014-03-05','2015-02-01'),(6,3,'SL 234455','2017-12-02',NULL);
/*!40000 ALTER TABLE `rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent_log`
--

DROP TABLE IF EXISTS `rent_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rent_log` (
  `log_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `log_date` timestamp NOT NULL DEFAULT (now()),
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent_log`
--

LOCK TABLES `rent_log` WRITE;
/*!40000 ALTER TABLE `rent_log` DISABLE KEYS */;
INSERT INTO `rent_log` VALUES (1,'2020-10-04 11:49:55','Nowy samochód o nr rejestracyjnym: NE 23458');
/*!40000 ALTER TABLE `rent_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `customer_rents`
--

/*!50001 DROP VIEW IF EXISTS `customer_rents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_rents` AS select `c`.`first_name` AS `first_name`,`c`.`last_name` AS `last_name`,`r`.`reg_number` AS `reg_number`,`r`.`rent_date` AS `rent_date`,`r`.`return_date` AS `return_date` from (`customer` `c` join `rent` `r` on((`c`.`cust_id` = `r`.`cust_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-10  9:27:42
