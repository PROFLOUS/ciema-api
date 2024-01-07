CREATE DATABASE  IF NOT EXISTS `cenima_booking` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cenima_booking`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cenima_booking
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `ApplicableCustomer`
--

DROP TABLE IF EXISTS `ApplicableCustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApplicableCustomer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rank_id` bigint DEFAULT NULL,
  `promotionHeader_id` bigint DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rank_id` (`rank_id`),
  KEY `promotionHeader_id` (`promotionHeader_id`),
  CONSTRAINT `ApplicableCustomer_ibfk_41` FOREIGN KEY (`rank_id`) REFERENCES `Rank` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ApplicableCustomer_ibfk_42` FOREIGN KEY (`promotionHeader_id`) REFERENCES `PromotionHeader` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ApplicableCustomer`
--

LOCK TABLES `ApplicableCustomer` WRITE;
/*!40000 ALTER TABLE `ApplicableCustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `ApplicableCustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategoryMovie`
--

DROP TABLE IF EXISTS `CategoryMovie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CategoryMovie` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nameCategory` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoryMovie`
--

LOCK TABLES `CategoryMovie` WRITE;
/*!40000 ALTER TABLE `CategoryMovie` DISABLE KEYS */;
/*!40000 ALTER TABLE `CategoryMovie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cinema`
--

DROP TABLE IF EXISTS `Cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cinema` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codeCinema` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `descCinemaHall` varchar(100) DEFAULT NULL,
  `city_id` varchar(50) NOT NULL,
  `district_id` varchar(50) NOT NULL,
  `ward_id` varchar(50) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `address` varchar(200) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cinema`
--

LOCK TABLES `Cinema` WRITE;
/*!40000 ALTER TABLE `Cinema` DISABLE KEYS */;
INSERT INTO `Cinema` VALUES (1,'CIN10004','DAA',NULL,'2','27','772',NULL,0,'Xã Thượng Phùng/Huyện Mèo Vạc/Tỉnh Hà Giang','2023-11-09 17:13:41','2023-11-09 17:13:41');
/*!40000 ALTER TABLE `Cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CinemaHall`
--

DROP TABLE IF EXISTS `CinemaHall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CinemaHall` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `totalSeats` int NOT NULL,
  `type` varchar(10) NOT NULL COMMENT 'Type_2D or Type_3D',
  `cinema_id` bigint NOT NULL,
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_id` (`cinema_id`),
  CONSTRAINT `CinemaHall_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `Cinema` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CinemaHall`
--

LOCK TABLES `CinemaHall` WRITE;
/*!40000 ALTER TABLE `CinemaHall` DISABLE KEYS */;
INSERT INTO `CinemaHall` VALUES (1,'B2',81,'2D',1,1,'2023-11-09 17:14:09','2023-11-09 17:27:16'),(2,'DAA',81,'2D',1,0,'2023-11-09 17:29:35','2023-11-09 17:29:35');
/*!40000 ALTER TABLE `CinemaHall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CinemaHallSeat`
--

DROP TABLE IF EXISTS `CinemaHallSeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CinemaHallSeat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `seatColumn` varchar(2) NOT NULL,
  `seatRow` int NOT NULL,
  `statusSeat` tinyint(1) NOT NULL DEFAULT '0',
  `idCinemaHall` bigint NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `idProduct` bigint DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCinemaHall` (`idCinemaHall`),
  KEY `idProduct` (`idProduct`),
  CONSTRAINT `CinemaHallSeat_ibfk_47` FOREIGN KEY (`idCinemaHall`) REFERENCES `CinemaHall` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `CinemaHallSeat_ibfk_48` FOREIGN KEY (`idProduct`) REFERENCES `Product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CinemaHallSeat`
--

LOCK TABLES `CinemaHallSeat` WRITE;
/*!40000 ALTER TABLE `CinemaHallSeat` DISABLE KEYS */;
INSERT INTO `CinemaHallSeat` VALUES (2,'B',1,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(3,'C',1,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(4,'D',1,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(5,'E',1,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(6,'F',1,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(7,'G',1,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(8,'H',1,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(9,'I',1,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(10,'K',1,0,2,1,3,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(11,'B',2,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(12,'C',2,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(13,'D',2,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(14,'E',2,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(15,'F',2,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(16,'G',2,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(17,'H',2,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(18,'I',2,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(19,'K',2,0,2,1,3,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(20,'B',3,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(21,'C',3,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(22,'D',3,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(23,'E',3,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(24,'F',3,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(25,'G',3,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(26,'H',3,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(27,'I',3,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(28,'K',3,0,2,1,3,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(29,'B',4,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(30,'C',4,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(31,'D',4,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(32,'E',4,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(33,'F',4,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(34,'G',4,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(35,'H',4,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(36,'I',4,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(37,'K',4,0,2,1,3,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(38,'B',5,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(39,'C',5,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(40,'D',5,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(41,'E',5,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(42,'F',5,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(43,'G',5,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(44,'H',5,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(45,'I',5,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(46,'K',5,0,2,1,3,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(47,'B',6,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(48,'C',6,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(49,'D',6,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(50,'E',6,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(51,'F',6,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(52,'G',6,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(53,'H',6,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(54,'I',6,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(55,'K',6,0,2,1,3,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(56,'B',7,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(57,'C',7,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(58,'D',7,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(59,'E',7,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(60,'F',7,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(61,'G',7,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(62,'H',7,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(63,'I',7,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(64,'K',7,0,2,1,3,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(65,'B',8,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(66,'C',8,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(67,'D',8,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(68,'E',8,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(69,'F',8,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(70,'G',8,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(71,'H',8,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(72,'I',8,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(73,'K',8,0,2,1,3,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(74,'B',9,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(75,'C',9,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(76,'D',9,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(77,'E',9,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(78,'F',9,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(79,'G',9,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(80,'H',9,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(81,'I',9,0,2,1,1,'2023-11-09 17:29:35','2023-11-09 17:29:35'),(82,'K',9,0,2,1,3,'2023-11-09 17:29:35','2023-11-09 17:29:35');
/*!40000 ALTER TABLE `CinemaHallSeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CinemaMovie`
--

DROP TABLE IF EXISTS `CinemaMovie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CinemaMovie` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idCinema` bigint NOT NULL,
  `idMovie` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCinema` (`idCinema`),
  KEY `idMovie` (`idMovie`),
  CONSTRAINT `CinemaMovie_ibfk_43` FOREIGN KEY (`idCinema`) REFERENCES `Cinema` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `CinemaMovie_ibfk_44` FOREIGN KEY (`idMovie`) REFERENCES `Movie` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CinemaMovie`
--

LOCK TABLES `CinemaMovie` WRITE;
/*!40000 ALTER TABLE `CinemaMovie` DISABLE KEYS */;
/*!40000 ALTER TABLE `CinemaMovie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `isActivated` tinyint(1) DEFAULT NULL,
  `phone` varchar(10) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `city_id` varchar(50) DEFAULT NULL,
  `district_id` varchar(50) DEFAULT NULL,
  `ward_id` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `rank_id` bigint DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `address` varchar(200) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rank_id` (`rank_id`),
  CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`rank_id`) REFERENCES `Rank` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (2,'CUS00002','cuctrau159@gmail.com','$2b$10$889.uTKfwkIqhso4YMpy..SYyruZaePZelRoT32vvDqPF6HYZQsve',0,'0943220476','Dang','',NULL,NULL,NULL,NULL,NULL,'$2b$10$889.uTKfwkIqhso4YMpy..',NULL,1,NULL,0,NULL,'2023-11-16 15:22:05','2023-11-16 15:22:05'),(36,NULL,NULL,NULL,NULL,'0000000009','any','any',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,0,NULL,'2023-10-27 00:00:00','2023-10-27 00:00:00');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberShip`
--

DROP TABLE IF EXISTS `MemberShip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MemberShip` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `menberShipCode` varchar(10) NOT NULL,
  `currentPoint` int NOT NULL DEFAULT '0',
  `desc` varchar(50) DEFAULT NULL,
  `idCustomer` bigint NOT NULL,
  `idRank` bigint NOT NULL,
  `startDate` date NOT NULL,
  `total_spending_month` double NOT NULL DEFAULT '0',
  `CustomerId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idCustomer` (`idCustomer`),
  KEY `idRank` (`idRank`),
  KEY `CustomerId` (`CustomerId`),
  CONSTRAINT `MemberShip_ibfk_49` FOREIGN KEY (`idCustomer`) REFERENCES `Customer` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `MemberShip_ibfk_50` FOREIGN KEY (`idRank`) REFERENCES `Rank` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `MemberShip_ibfk_51` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberShip`
--

LOCK TABLES `MemberShip` WRITE;
/*!40000 ALTER TABLE `MemberShip` DISABLE KEYS */;
INSERT INTO `MemberShip` VALUES (1,'MS663793',0,NULL,2,1,'2023-11-16',0,NULL);
/*!40000 ALTER TABLE `MemberShip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movie` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nameMovie` varchar(50) NOT NULL,
  `codeMovie` varchar(50) NOT NULL,
  `cast` varchar(50) DEFAULT NULL,
  `director` varchar(50) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `classify` varchar(50) DEFAULT NULL,
  `duration` int NOT NULL,
  `releaseDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `linkTrailer` varchar(50) DEFAULT NULL,
  `idCategoryMovie` bigint NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `idCinema` bigint DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCategoryMovie` (`idCategoryMovie`),
  KEY `idCinema` (`idCinema`),
  FULLTEXT KEY `text_idx` (`nameMovie`),
  CONSTRAINT `Movie_ibfk_45` FOREIGN KEY (`idCategoryMovie`) REFERENCES `CategoryMovie` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `Movie_ibfk_46` FOREIGN KEY (`idCinema`) REFERENCES `Cinema` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie`
--

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `paymentMethod` tinyint(1) NOT NULL,
  `note` text,
  `refundDate` datetime DEFAULT NULL,
  `totalPrice` double NOT NULL,
  `idShowMovie` bigint NOT NULL,
  `idCustomer` bigint NOT NULL,
  `idStaff` bigint DEFAULT NULL,
  `totalDiscount` double NOT NULL,
  `numberSeat` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idShowMovie` (`idShowMovie`),
  KEY `idCustomer` (`idCustomer`),
  KEY `idStaff` (`idStaff`),
  CONSTRAINT `Order_ibfk_61` FOREIGN KEY (`idShowMovie`) REFERENCES `ShowMovie` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `Order_ibfk_62` FOREIGN KEY (`idCustomer`) REFERENCES `Customer` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `Order_ibfk_63` FOREIGN KEY (`idStaff`) REFERENCES `Staff` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDetail`
--

DROP TABLE IF EXISTS `OrderDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderDetail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `idSeat` bigint DEFAULT NULL,
  `idProduct` bigint DEFAULT NULL,
  `qtyProduct` int DEFAULT NULL,
  `priceProduct` double DEFAULT NULL,
  `idProductReceived` bigint DEFAULT NULL,
  `qtyProductReceived` int DEFAULT NULL,
  `priceProductReceived` double DEFAULT NULL,
  `idOrder` bigint NOT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idSeat` (`idSeat`),
  KEY `idProduct` (`idProduct`),
  KEY `idOrder` (`idOrder`),
  CONSTRAINT `OrderDetail_ibfk_61` FOREIGN KEY (`idSeat`) REFERENCES `CinemaHallSeat` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `OrderDetail_ibfk_62` FOREIGN KEY (`idProduct`) REFERENCES `Product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `OrderDetail_ibfk_63` FOREIGN KEY (`idOrder`) REFERENCES `Order` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDetail`
--

LOCK TABLES `OrderDetail` WRITE;
/*!40000 ALTER TABLE `OrderDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PriceHeader`
--

DROP TABLE IF EXISTS `PriceHeader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PriceHeader` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `note` text,
  `userCreate` bigint DEFAULT NULL,
  `userUpdate` bigint DEFAULT NULL,
  `priceCode` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userCreate` (`userCreate`),
  KEY `userUpdate` (`userUpdate`),
  CONSTRAINT `PriceHeader_ibfk_1` FOREIGN KEY (`userCreate`) REFERENCES `Staff` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `PriceHeader_ibfk_2` FOREIGN KEY (`userUpdate`) REFERENCES `Staff` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PriceHeader`
--

LOCK TABLES `PriceHeader` WRITE;
/*!40000 ALTER TABLE `PriceHeader` DISABLE KEYS */;
/*!40000 ALTER TABLE `PriceHeader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PriceLine`
--

DROP TABLE IF EXISTS `PriceLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PriceLine` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `idProduct` bigint NOT NULL,
  `idPriceHeader` bigint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idProduct` (`idProduct`),
  KEY `idPriceHeader` (`idPriceHeader`),
  CONSTRAINT `PriceLine_ibfk_41` FOREIGN KEY (`idProduct`) REFERENCES `Product` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `PriceLine_ibfk_42` FOREIGN KEY (`idPriceHeader`) REFERENCES `PriceHeader` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PriceLine`
--

LOCK TABLES `PriceLine` WRITE;
/*!40000 ALTER TABLE `PriceLine` DISABLE KEYS */;
/*!40000 ALTER TABLE `PriceLine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `productCode` varchar(10) NOT NULL,
  `productName` varchar(50) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `typeSeat` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'GHE','2222','SINGLE',NULL,NULL,1,'2023-11-10 00:00:00','2023-11-10 00:00:00'),(3,'GHE','1234','DOUBLE',NULL,NULL,3,'2023-11-10 00:00:00','2023-11-10 00:00:00');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PromotionDetail`
--

DROP TABLE IF EXISTS `PromotionDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PromotionDetail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `IdProduct_buy` bigint DEFAULT NULL,
  `IdProduct_receive` bigint DEFAULT NULL,
  `qty_buy` int DEFAULT NULL,
  `qty_receive` int DEFAULT NULL,
  `total_purchase_amount` double DEFAULT NULL,
  `money_received` double DEFAULT NULL,
  `percent_reduction` int DEFAULT NULL,
  `max_money_reduction` double DEFAULT NULL,
  `idPromotionLine` bigint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IdProduct_buy` (`IdProduct_buy`),
  KEY `IdProduct_receive` (`IdProduct_receive`),
  KEY `idPromotionLine` (`idPromotionLine`),
  CONSTRAINT `PromotionDetail_ibfk_61` FOREIGN KEY (`IdProduct_buy`) REFERENCES `Product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `PromotionDetail_ibfk_62` FOREIGN KEY (`IdProduct_receive`) REFERENCES `Product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `PromotionDetail_ibfk_63` FOREIGN KEY (`idPromotionLine`) REFERENCES `PromotionLine` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PromotionDetail`
--

LOCK TABLES `PromotionDetail` WRITE;
/*!40000 ALTER TABLE `PromotionDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `PromotionDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PromotionHeader`
--

DROP TABLE IF EXISTS `PromotionHeader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PromotionHeader` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `namePromotion` varchar(50) NOT NULL,
  `desc` longtext,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `statusPromotion` tinyint(1) NOT NULL DEFAULT '0',
  `promotionCode` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PromotionHeader`
--

LOCK TABLES `PromotionHeader` WRITE;
/*!40000 ALTER TABLE `PromotionHeader` DISABLE KEYS */;
/*!40000 ALTER TABLE `PromotionHeader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PromotionLine`
--

DROP TABLE IF EXISTS `PromotionLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PromotionLine` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `promotionCode` varchar(20) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `max_qty` int DEFAULT '1000000',
  `max_qty_per_customer_per_day` int DEFAULT '1000000',
  `budget` double NOT NULL,
  `promotionHeaderId` bigint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promotionHeaderId` (`promotionHeaderId`),
  CONSTRAINT `PromotionLine_ibfk_1` FOREIGN KEY (`promotionHeaderId`) REFERENCES `PromotionHeader` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PromotionLine`
--

LOCK TABLES `PromotionLine` WRITE;
/*!40000 ALTER TABLE `PromotionLine` DISABLE KEYS */;
/*!40000 ALTER TABLE `PromotionLine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PromotionResult`
--

DROP TABLE IF EXISTS `PromotionResult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PromotionResult` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `note` varchar(50) DEFAULT NULL,
  `idProductRecive` bigint DEFAULT NULL,
  `qtyRecive` int DEFAULT NULL,
  `moneyDiscount` double DEFAULT NULL,
  `idPromotionLine` bigint NOT NULL,
  `idOrder` bigint NOT NULL,
  `idCustomer` bigint NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `dateUsed` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idPromotionLine` (`idPromotionLine`),
  KEY `idOrder` (`idOrder`),
  CONSTRAINT `PromotionResult_ibfk_41` FOREIGN KEY (`idPromotionLine`) REFERENCES `PromotionLine` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `PromotionResult_ibfk_42` FOREIGN KEY (`idOrder`) REFERENCES `Order` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PromotionResult`
--

LOCK TABLES `PromotionResult` WRITE;
/*!40000 ALTER TABLE `PromotionResult` DISABLE KEYS */;
/*!40000 ALTER TABLE `PromotionResult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rank`
--

DROP TABLE IF EXISTS `Rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rank` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nameRank` varchar(20) NOT NULL,
  `point` int NOT NULL,
  `desc` varchar(50) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rank`
--

LOCK TABLES `Rank` WRITE;
/*!40000 ALTER TABLE `Rank` DISABLE KEYS */;
INSERT INTO `Rank` VALUES (1,'ANY',99999,'any',NULL),(2,'GOOD',50,'good',NULL);
/*!40000 ALTER TABLE `Rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nameRole` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'STAFF','staff'),(3,'ADMIN','admin');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Show`
--

DROP TABLE IF EXISTS `Show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Show` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `idCinemaHall` bigint NOT NULL,
  `idMovie` bigint NOT NULL,
  `idCinema` bigint NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `code` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCinemaHall` (`idCinemaHall`),
  KEY `idMovie` (`idMovie`),
  KEY `idCinema` (`idCinema`),
  CONSTRAINT `Show_ibfk_64` FOREIGN KEY (`idCinemaHall`) REFERENCES `CinemaHall` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `Show_ibfk_65` FOREIGN KEY (`idMovie`) REFERENCES `Movie` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `Show_ibfk_66` FOREIGN KEY (`idCinema`) REFERENCES `Cinema` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Show`
--

LOCK TABLES `Show` WRITE;
/*!40000 ALTER TABLE `Show` DISABLE KEYS */;
/*!40000 ALTER TABLE `Show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowMovie`
--

DROP TABLE IF EXISTS `ShowMovie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ShowMovie` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idShow` bigint NOT NULL,
  `idShowTime` bigint NOT NULL,
  `showDate` date NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `statusDate` tinyint(1) DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idShow` (`idShow`),
  KEY `idShowTime` (`idShowTime`),
  CONSTRAINT `ShowMovie_ibfk_43` FOREIGN KEY (`idShow`) REFERENCES `Show` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ShowMovie_ibfk_44` FOREIGN KEY (`idShowTime`) REFERENCES `ShowTime` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowMovie`
--

LOCK TABLES `ShowMovie` WRITE;
/*!40000 ALTER TABLE `ShowMovie` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowMovie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowTime`
--

DROP TABLE IF EXISTS `ShowTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ShowTime` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `showTime` varchar(10) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowTime`
--

LOCK TABLES `ShowTime` WRITE;
/*!40000 ALTER TABLE `ShowTime` DISABLE KEYS */;
INSERT INTO `ShowTime` VALUES (62,'9:00','2023-10-26 16:21:45','2023-10-26 16:21:45'),(63,'12:00','2023-10-26 16:21:45','2023-10-26 16:21:45'),(64,'11:00','2023-10-26 16:21:45','2023-10-26 16:21:45'),(65,'13:00','2023-10-26 16:21:45','2023-10-26 16:21:45'),(66,'16:00','2023-10-26 16:21:45','2023-10-26 16:21:45'),(67,'15:00','2023-10-26 16:21:45','2023-10-26 16:21:45'),(68,'17:00','2023-10-26 16:21:45','2023-10-26 16:21:45'),(69,'18:00','2023-10-26 16:21:45','2023-10-26 16:21:45'),(70,'19:00','2023-10-26 16:21:45','2023-10-26 16:21:45'),(71,'20:00','2023-10-26 16:21:45','2023-10-26 16:21:45'),(72,'22:00','2023-10-26 16:21:45','2023-10-26 16:21:45'),(73,'23:00','2023-10-26 16:21:45','2023-10-26 16:21:45');
/*!40000 ALTER TABLE `ShowTime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `isVerify` varchar(50) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `isActivated` tinyint(1) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `position` bigint NOT NULL,
  `manager_id` bigint DEFAULT NULL,
  `cinema_id` bigint DEFAULT NULL,
  `salt` varchar(60) DEFAULT NULL,
  `city_id` varchar(50) DEFAULT NULL,
  `district_id` varchar(50) DEFAULT NULL,
  `ward_id` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `is_super_user` tinyint(1) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `position` (`position`),
  KEY `manager_id` (`manager_id`),
  KEY `cinema_id` (`cinema_id`),
  CONSTRAINT `Staff_ibfk_79` FOREIGN KEY (`position`) REFERENCES `Role` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `Staff_ibfk_80` FOREIGN KEY (`manager_id`) REFERENCES `Staff` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Staff_ibfk_81` FOREIGN KEY (`cinema_id`) REFERENCES `Cinema` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES (1,'cuctrau159@gmail.com','2023','$2b$10$BUm4L7X0XyDzPiMFKzdPyer6dA45gpvJKnq4Cs7dUxucFiQKHWI72',1,'0900000000','dang','le',NULL,NULL,'2023-10-27 00:00:00','1',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-10-27 00:00:00','2023-10-27 00:00:00');
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-07 21:54:33
