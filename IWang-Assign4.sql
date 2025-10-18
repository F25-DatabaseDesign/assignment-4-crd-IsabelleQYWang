-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: unitedhelpers
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `volunteerId` int NOT NULL,
  `taskCode` int NOT NULL,
  `startDateTime` datetime DEFAULT NULL,
  `endDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`volunteerId`,`taskCode`),
  KEY `taskCode` (`taskCode`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`volunteerId`) REFERENCES `volunteer` (`volunteerId`),
  CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,1,'2025-10-01 08:00:00','2025-10-01 12:00:00'),(1,4,'2025-10-04 08:00:00','2025-10-04 11:30:00'),(2,2,'2025-10-02 09:00:00','2025-10-02 13:30:00'),(2,3,'2025-10-07 13:00:00','2025-10-07 17:30:00'),(3,3,'2025-10-03 10:15:00','2025-10-03 14:45:00'),(4,1,'2025-10-05 07:45:00','2025-10-05 12:00:00'),(5,2,'2025-10-06 09:30:00','2025-10-06 13:00:00'),(6,4,'2025-10-08 14:15:00','2025-10-08 18:00:00'),(7,5,'2025-10-09 10:00:00','2025-10-09 15:00:00'),(8,6,'2025-10-10 11:00:00','2025-10-10 14:30:00');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemId` int NOT NULL AUTO_INCREMENT,
  `itemDescription` varchar(255) DEFAULT NULL,
  `itemValue` decimal(10,2) DEFAULT NULL,
  `quantityOnHand` int DEFAULT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Soap',1.00,1000),(2,'Toothbrush',0.50,800),(3,'Bandage',0.20,1200),(4,'Rice',1.20,2000),(5,'Beans',1.00,1800),(6,'Toy',2.00,600),(7,'Towel',1.50,700),(8,'Sanitizer',1.10,900),(9,'Pasta',1.30,1700),(10,'Diaper',0.40,1000);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `taskCode` int DEFAULT NULL,
  `packageTypeId` int DEFAULT NULL,
  `packageCreateDate` date DEFAULT NULL,
  `packageWeight` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`packageId`),
  KEY `taskCode` (`taskCode`),
  KEY `packageTypeId` (`packageTypeId`),
  CONSTRAINT `package_ibfk_1` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `package_ibfk_2` FOREIGN KEY (`packageTypeId`) REFERENCES `package_type` (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,1,1,'2025-10-01',3.00),(2,1,2,'2025-10-01',3.10),(3,2,3,'2025-10-02',4.50),(4,2,4,'2025-10-02',4.60),(5,3,5,'2025-10-03',2.00),(6,3,6,'2025-10-03',2.10),(7,1,7,'2025-10-01',2.50),(8,1,8,'2025-10-01',2.70),(9,2,9,'2025-10-02',5.00),(10,2,10,'2025-10-02',5.20),(11,2,1,'2025-10-02',4.80),(12,3,2,'2025-10-03',1.50),(13,3,3,'2025-10-03',1.60);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_contents`
--

DROP TABLE IF EXISTS `package_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_contents` (
  `itemId` int NOT NULL,
  `packageId` int NOT NULL,
  `itemQuantity` int DEFAULT NULL,
  PRIMARY KEY (`itemId`,`packageId`),
  KEY `packageId` (`packageId`),
  CONSTRAINT `package_contents_ibfk_1` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `package_contents_ibfk_2` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_contents`
--

LOCK TABLES `package_contents` WRITE;
/*!40000 ALTER TABLE `package_contents` DISABLE KEYS */;
INSERT INTO `package_contents` VALUES (1,1,1000),(1,4,2000),(2,1,3000),(3,4,500),(3,5,200),(4,3,100),(4,5,700),(5,3,2000),(6,2,1000),(6,5,1500),(9,3,750),(10,2,300);
/*!40000 ALTER TABLE `package_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_type` (
  `packageTypeId` int NOT NULL AUTO_INCREMENT,
  `packageTypeName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type`
--

LOCK TABLES `package_type` WRITE;
/*!40000 ALTER TABLE `package_type` DISABLE KEYS */;
INSERT INTO `package_type` VALUES (1,'Basic Medical'),(2,'Child-Care'),(3,'Food'),(4,'Medium Medical'),(5,'Teenager Care'),(6,'Drink'),(7,'Nutrient solution'),(8,'Medicine'),(9,'Plates'),(10,'Cups');
/*!40000 ALTER TABLE `package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `packingListId` int NOT NULL AUTO_INCREMENT,
  `packingListName` varchar(100) DEFAULT NULL,
  `packingListDescription` text,
  PRIMARY KEY (`packingListId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
INSERT INTO `packing_list` VALUES (1,'Basic Kit','Bandages and sanitizer'),(2,'Food Box','Bread'),(3,'Toy Pack','Toys for children'),(4,'Hygiene Kit','Soap and toothbrush'),(5,'Food Box 2','Rice and beans'),(6,'Emergency Pack','Flashlight'),(7,'Water','Bottle of water'),(8,'Snack','Chips'),(9,'Clothes','T-shirt'),(10,'Pet Kit','Pet food');
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `taskCode` int NOT NULL AUTO_INCREMENT,
  `packingListId` int DEFAULT NULL,
  `taskTypeId` int DEFAULT NULL,
  `taskStatusId` int DEFAULT NULL,
  `taskDescription` text,
  PRIMARY KEY (`taskCode`),
  KEY `packingListId` (`packingListId`),
  KEY `taskTypeId` (`taskTypeId`),
  KEY `taskStatusId` (`taskStatusId`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`packingListId`) REFERENCES `packing_list` (`packingListId`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`taskTypeId`) REFERENCES `task_type` (`taskTypeId`),
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`taskStatusId`) REFERENCES `task_status` (`taskStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,1,1,1,'Make basic kits'),(2,2,1,1,'Pack food'),(3,3,1,1,'Pack toys'),(4,NULL,6,2,'Answer phones'),(5,NULL,2,2,'Drive truck'),(6,NULL,3,1,'Load truck'),(7,NULL,4,1,'Sort supplies'),(8,NULL,9,3,'Train volunteers'),(9,NULL,3,2,'Clean warehouse'),(10,NULL,5,1,'Help with delivery');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_status` (
  `taskStatusId` int NOT NULL AUTO_INCREMENT,
  `taskStatusName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`taskStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
INSERT INTO `task_status` VALUES (1,'Open'),(2,'Ongoing'),(3,'Complete'),(4,'Open'),(5,'Ongoing'),(6,'Complete'),(7,'Open'),(8,'Complete'),(9,'Complete'),(10,'Complete'),(11,'Ongoing');
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_type`
--

DROP TABLE IF EXISTS `task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_type` (
  `taskTypeId` int NOT NULL AUTO_INCREMENT,
  `taskTypeName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`taskTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_type`
--

LOCK TABLES `task_type` WRITE;
/*!40000 ALTER TABLE `task_type` DISABLE KEYS */;
INSERT INTO `task_type` VALUES (1,'Packing'),(2,'Recurring'),(3,'Logistics'),(4,'Distribution'),(5,'Transportation'),(6,'Phone_Support'),(7,'Medical_Assistance'),(8,'Food_Prep'),(9,'Volunteer_Training'),(10,'Emotion_Support');
/*!40000 ALTER TABLE `task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `volunteerId` int NOT NULL AUTO_INCREMENT,
  `volunteerName` varchar(100) DEFAULT NULL,
  `volunteerAddress` varchar(255) DEFAULT NULL,
  `volunteerTelephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`volunteerId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (1,'Alice John','123 White Street','555-1234'),(2,'Jack Smith','456 Center Avenue','555-5678'),(3,'Celina Zhou','789 Center Blvd','555-1235'),(4,'Frank Kim','321 Good Rd','555-1236'),(5,'Eva Brown','654 3rd St','555-0000'),(6,'David Wu','111 5th St','555-1111'),(7,'Grace Lee','222 7th Ave','555-2222'),(8,'Bob Dong','333 9th Street','555-3333'),(9,'Amy Chen','444 Broadway St','555-4444'),(10,'Elsa White','555 Black St','555-5555');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-17 20:57:51
