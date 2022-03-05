-- MySQL dump 10.13  Distrib 8.0.27, for macos11.6 (x86_64)
--
-- Host: localhost    Database: 471db
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Current Database: `471db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `471db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `471db`;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Account` (
  `Email_ID` varchar(45) NOT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `FName` varchar(45) DEFAULT NULL,
  `LName` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Email_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES ('bakechef@gmail.com','yummy','Boss','Man','Admin'),('carlsjr@gmail.com','yummy','Boss','Carlsjr','Admin'),('connor@gmail.com','123','Connor','McDavid','User'),('jarome@gmail.com','123','Jarome','Iginla','User'),('koreanbbq@gmail.com','yummy','Boss','Man','Admin'),('Kyrie@gmail.com','1234','Kyrie','Irving','User'),('lamelo@gmail.com','1234','Lamelo','Ball','User'),('lonzo@gmail.com','123','Lonzo','Ball','User'),('william@gmail.com','123','William','Ho','User');
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Allergy`
--

DROP TABLE IF EXISTS `Allergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Allergy` (
  `Allergy_Name` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Email_ID` varchar(45) NOT NULL,
  PRIMARY KEY (`Allergy_Name`, `Name`, `Email_ID`),
  FOREIGN KEY (`Name`) REFERENCES `Profile` (`Name`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`Email_ID`) REFERENCES `Profile` (`Email_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Allergy`
--

LOCK TABLES `Allergy` WRITE;
/*!40000 ALTER TABLE `Allergy` DISABLE KEYS */;
/*!40000 ALTER TABLE `Allergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dish`
--

DROP TABLE IF EXISTS `Dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dish` (
  `Dish_ID` int NOT NULL AUTO_INCREMENT,
  `Dish_Name` varchar(45) NOT NULL,
  `Price` decimal(5,2) DEFAULT NULL,
  `Category` varchar(45) DEFAULT NULL,
  `RestaurantID` int NOT NULL,
  PRIMARY KEY (`Dish_ID`),
  FOREIGN KEY (`RestaurantID`) REFERENCES `Restaurant` (`R_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dish`
--

LOCK TABLES `Dish` WRITE;
/*!40000 ALTER TABLE `Dish` DISABLE KEYS */;
INSERT INTO `Dish` VALUES (1,'BBQ Beef',12,'Meat',1),(2,'BBQ Chicken',15,'Meat',1);
/*!40000 ALTER TABLE `Dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredient`
--

DROP TABLE IF EXISTS `Ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ingredient` (
  `IngredientID` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) DEFAULT NULL,
  `IngredientName` varchar(45) NOT NULL,
  PRIMARY KEY (`IngredientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredient`
--

LOCK TABLES `Ingredient` WRITE;
/*!40000 ALTER TABLE `Ingredient` DISABLE KEYS */;
INSERT INTO `Ingredient` VALUES (1,'meat','beef');
INSERT INTO `Ingredient` VALUES (2,'meat','chicken');
/*!40000 ALTER TABLE `Ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Menu` (
  `Menu_ID` int NOT NULL AUTO_INCREMENT,
  `Menu_Name` varchar(45) DEFAULT NULL,
  `RestaurantID` int NOT NULL,
  PRIMARY KEY (`Menu_ID`),
  KEY `Menu_ID_idx` (`Menu_ID`),
  CONSTRAINT `RestaurantID` FOREIGN KEY (`RestaurantID`) REFERENCES `Restaurant` (`R_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` VALUES (1,'Lunch',1),(2,'Lunch',1);
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `Order_ID` int NOT NULL AUTO_INCREMENT,
  `Order_Time` datetime DEFAULT NULL,
  `Total_Price` decimal(5,2) DEFAULT NULL,
  `Email_ID` varchar(45) DEFAULT NULL,
  `Profile_Name` varchar(45) DEFAULT NULL,
  `RestaurantID` int DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  FOREIGN KEY (`Email_ID`) REFERENCES `Profile` (`Email_ID`) ON DELETE CASCADE,
  FOREIGN KEY (`Profile_Name`) REFERENCES `Profile` (`Name`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`RestaurantID`) REFERENCES `Restaurant` (`R_ID`) ON DELETE CASCADE
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
-- Table structure for table `Profile`
--

DROP TABLE IF EXISTS `Profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Profile` (
  `Email_ID` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Name`, `Email_ID`),
  CONSTRAINT `Email_ID` FOREIGN KEY (`Email_ID`) REFERENCES `Account` (`Email_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profile`
--

LOCK TABLES `Profile` WRITE;
/*!40000 ALTER TABLE `Profile` DISABLE KEYS */;
INSERT INTO `Profile` VALUES ('lonzo@gmail.com','Lonzo Ball');
/*!40000 ALTER TABLE `Profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Restaurant`
--

DROP TABLE IF EXISTS `Restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Restaurant` (
  `R_ID` int NOT NULL AUTO_INCREMENT,
  `AdminEmail_ID` varchar(45) DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`R_ID`),
  CONSTRAINT `AdminEmail_ID` FOREIGN KEY (`AdminEmail_ID`) REFERENCES `Account` (`Email_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restaurant`
--

LOCK TABLES `Restaurant` WRITE;
/*!40000 ALTER TABLE `Restaurant` DISABLE KEYS */;
INSERT INTO `Restaurant` VALUES (1,'koreanbbq@gmail.com','Calgary','Korean BBQ'),(2,'bakechef@gmail.com','Calgary','Bake Chef'),(3,'carlsjr@gmail.com','Calgary','Carls Jr');
/*!40000 ALTER TABLE `Restaurant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-11 18:36:38

DROP TABLE IF EXISTS `Amount_left`;

CREATE TABLE `Amount_left` (
  `IngredientID` int NOT NULL,
  `RestaurantID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`IngredientID`, `RestaurantID`),
  FOREIGN KEY (`IngredientID`) REFERENCES `Ingredient` (`IngredientID`) ON DELETE CASCADE,
  FOREIGN KEY (`RestaurantID`) REFERENCES `Restaurant` (`R_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `Amount_left` WRITE;
/*!40000 ALTER TABLE `Amount_left` DISABLE KEYS */;
INSERT INTO `Amount_left` VALUES (1, 1, 50), (2, 1, 40);
/*!40000 ALTER TABLE `Amount_left` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Consists_of`;

CREATE TABLE `Consists_of` (
  `Order_ID` int NOT NULL,
  `Dish_ID` int NOT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`Order_ID`, `Dish_ID`),
  FOREIGN KEY (`Order_ID`) REFERENCES `Order` (`Order_ID`) ON DELETE CASCADE,
  FOREIGN KEY (`Dish_ID`) REFERENCES `Dish` (`Dish_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `Has`;

CREATE TABLE `Has` (
  `Menu_ID` int NOT NULL,
  `Dish_ID` int NOT NULL,
  PRIMARY KEY (`Menu_ID`, `Dish_ID`),
  FOREIGN KEY (`Menu_ID`) REFERENCES `Menu` (`Menu_ID`) ON DELETE CASCADE,
  FOREIGN KEY (`Dish_ID`) REFERENCES `Dish` (`Dish_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `Needs`;

CREATE TABLE `Needs` (
  `Dish_ID` int NOT NULL,
  `IngredientID` int NOT NULL,
  `Amount_Needed` int DEFAULT NULL,
  PRIMARY KEY (`Dish_ID`, `IngredientID`),
  FOREIGN KEY (`Dish_ID`) REFERENCES `Dish` (`Dish_ID`) ON DELETE CASCADE,
  FOREIGN KEY (`IngredientID`) REFERENCES `Ingredient` (`IngredientID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `Needs` WRITE;
/*!40000 ALTER TABLE `Needs` DISABLE KEYS */;
INSERT INTO `Needs` VALUES (1, 1, 1), (2, 2, 1);
/*!40000 ALTER TABLE `Needs` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Review`;

CREATE TABLE `Review` (
  `Rating` int DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `UserEmail_ID` varchar(45) NOT NULL,
  `Date_Time` datetime NOT NULL,
  `Reply` varchar(255) DEFAULT NULL,
  `AdminEmail_ID` varchar(45) DEFAULT NULL,
  `Order_ID` int DEFAULT NULL,
  PRIMARY KEY (`UserEmail_ID`, `Date_Time`),
  KEY `Review_Date_idx` (`Date_Time`),
  FOREIGN KEY (`UserEmail_ID`) REFERENCES `Account` (`Email_ID`) ON DELETE CASCADE,
  FOREIGN KEY (`AdminEmail_ID`) REFERENCES `Account` (`Email_ID`) ON DELETE SET NULL,
  FOREIGN KEY (`Order_ID`) REFERENCES `Order` (`Order_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `History`;

CREATE TABLE `History` (
  `History_ID` int NOT NULL AUTO_INCREMENT,
  `Order_Place` varchar(45) DEFAULT NULL,
  `Total_Price` decimal(5,2) DEFAULT NULL,
  `UserEmail_ID` varchar(45) DEFAULT NULL,
  `Order_ID` int DEFAULT NULL,
  PRIMARY KEY (`History_ID`),
  FOREIGN KEY (`UserEmail_ID`) REFERENCES `Account` (`Email_ID`) ON DELETE CASCADE,
  FOREIGN KEY (`Order_ID`) REFERENCES `Order` (`Order_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
