-- MySQL dump 10.13  Distrib 5.7.44, for osx10.19 (x86_64)
--
-- Host: localhost    Database: Fish_Shop_Database
-- ------------------------------------------------------
-- Server version	5.7.43

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
-- Table structure for table `Customer_Information`
--

DROP TABLE IF EXISTS `Customer_Information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer_Information` (
  `Customer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Location_ID` int(11) DEFAULT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  KEY `Location_ID` (`Location_ID`),
  CONSTRAINT `customer_information_ibfk_1` FOREIGN KEY (`Location_ID`) REFERENCES `Customer_Location` (`Location_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Information`
--

LOCK TABLES `Customer_Information` WRITE;
/*!40000 ALTER TABLE `Customer_Information` DISABLE KEYS */;
INSERT INTO `Customer_Information` VALUES (501,301,'Barry','Smith'),(502,302,'Marco','Polo'),(503,303,'Jerry','Johnson'),(504,304,'Berry','Donacian');
/*!40000 ALTER TABLE `Customer_Information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Location`
--

DROP TABLE IF EXISTS `Customer_Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer_Location` (
  `Location_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_City` varchar(255) NOT NULL,
  `Customer_Postcode` varchar(7) NOT NULL,
  `Customer_Country` varchar(255) NOT NULL,
  `Customer_HouseNumber` int(11) NOT NULL,
  PRIMARY KEY (`Location_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Location`
--

LOCK TABLES `Customer_Location` WRITE;
/*!40000 ALTER TABLE `Customer_Location` DISABLE KEYS */;
INSERT INTO `Customer_Location` VALUES (301,'Norwich','NR4 3P5','England',42),(302,'Ipswich','IP5 6N3','England',53),(303,'Chelmsford','CM6 7Y3','England',127),(304,'Chelmsford','CM2 7f3','England',12);
/*!40000 ALTER TABLE `Customer_Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_Information`
--

DROP TABLE IF EXISTS `Employee_Information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee_Information` (
  `Employee_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date_Of_Birth` date NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Emergency_Contact_Number` bigint(20) NOT NULL,
  `Working_Productivity` decimal(5,2) NOT NULL,
  `Packaging_Efficiency` decimal(5,2) NOT NULL,
  PRIMARY KEY (`Employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_Information`
--

LOCK TABLES `Employee_Information` WRITE;
/*!40000 ALTER TABLE `Employee_Information` DISABLE KEYS */;
INSERT INTO `Employee_Information` VALUES (401,'1990-01-15','Barry','Ortiz',7646876463,0.50,0.50),(402,'1985-03-20','Dave','Reed',8463759382,0.72,0.36),(403,'1992-01-11','Steve','Tyson',9403726475,0.91,0.82),(404,'1981-07-20','Micheal','Lineker',1527693746,0.59,0.41);
/*!40000 ALTER TABLE `Employee_Information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fish_in_Stock`
--

DROP TABLE IF EXISTS `Fish_in_Stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fish_in_Stock` (
  `Stock_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Stock_Quantity` int(11) NOT NULL,
  `Species` varchar(255) NOT NULL,
  `Price` decimal(9,2) NOT NULL,
  `Freshwater` tinyint(1) NOT NULL,
  `Saltwater` tinyint(1) NOT NULL,
  PRIMARY KEY (`Stock_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fish_in_Stock`
--

LOCK TABLES `Fish_in_Stock` WRITE;
/*!40000 ALTER TABLE `Fish_in_Stock` DISABLE KEYS */;
INSERT INTO `Fish_in_Stock` VALUES (201,100,'Clownfish',10.99,0,1),(202,50,'Goldfish',15.99,1,0),(203,75,'Pufferfish',8.99,1,1);
/*!40000 ALTER TABLE `Fish_in_Stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Information`
--

DROP TABLE IF EXISTS `Order_Information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_Information` (
  `Order_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_ID` int(11) DEFAULT NULL,
  `Employee_ID` int(11) DEFAULT NULL,
  `Order_Date` date NOT NULL,
  `Order_Time` datetime NOT NULL,
  `Purchase_Total` decimal(9,2) NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `order_information_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `Customer_Information` (`Customer_ID`),
  CONSTRAINT `order_information_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee_Information` (`Employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=604 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Information`
--

LOCK TABLES `Order_Information` WRITE;
/*!40000 ALTER TABLE `Order_Information` DISABLE KEYS */;
INSERT INTO `Order_Information` VALUES (601,501,403,'2023-11-06','2023-11-09 10:08:31',17.98),(602,502,401,'2023-11-04','2023-11-09 10:08:31',15.99),(603,503,404,'2023-11-01','2023-11-09 10:08:31',29.97);
/*!40000 ALTER TABLE `Order_Information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Items`
--

DROP TABLE IF EXISTS `Order_Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_Items` (
  `Stock_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Order_Quantity` int(11) NOT NULL,
  PRIMARY KEY (`Stock_ID`,`Order_ID`),
  KEY `Order_ID` (`Order_ID`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`Stock_ID`) REFERENCES `Fish_in_Stock` (`Stock_ID`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`Order_ID`) REFERENCES `Order_Information` (`Order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Items`
--

LOCK TABLES `Order_Items` WRITE;
/*!40000 ALTER TABLE `Order_Items` DISABLE KEYS */;
INSERT INTO `Order_Items` VALUES (201,603,3),(202,602,1),(203,601,2);
/*!40000 ALTER TABLE `Order_Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shipping_Information`
--

DROP TABLE IF EXISTS `Shipping_Information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shipping_Information` (
  `Shipment_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Shipment_Date` date NOT NULL,
  `Shipment_Time` datetime NOT NULL,
  `Shipping_Status` varchar(255) NOT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Location_ID` int(11) DEFAULT NULL,
  `Order_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Shipment_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Location_ID` (`Location_ID`),
  KEY `Order_ID` (`Order_ID`),
  CONSTRAINT `shipping_information_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `Customer_Information` (`Customer_ID`),
  CONSTRAINT `shipping_information_ibfk_2` FOREIGN KEY (`Location_ID`) REFERENCES `Customer_Location` (`Location_ID`),
  CONSTRAINT `shipping_information_ibfk_3` FOREIGN KEY (`Order_ID`) REFERENCES `Order_Information` (`Order_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=704 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shipping_Information`
--

LOCK TABLES `Shipping_Information` WRITE;
/*!40000 ALTER TABLE `Shipping_Information` DISABLE KEYS */;
INSERT INTO `Shipping_Information` VALUES (701,'2023-11-07','2023-11-09 10:08:31','Shipped',502,301,601),(702,'2023-11-06','2023-11-09 10:08:31','Shipped',501,302,602),(703,'2023-11-07','2023-11-09 10:08:31','Completed',503,303,603);
/*!40000 ALTER TABLE `Shipping_Information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier_Information`
--

DROP TABLE IF EXISTS `Supplier_Information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier_Information` (
  `Supplier_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Stock_ID` int(11) DEFAULT NULL,
  `Supplier_Postcode` varchar(7) NOT NULL,
  `Supplier_Country` varchar(255) NOT NULL,
  `Supplier_City` varchar(255) NOT NULL,
  `Min_Order_QTY` int(11) NOT NULL,
  `Contact_Email` varchar(255) NOT NULL,
  PRIMARY KEY (`Supplier_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=804 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier_Information`
--

LOCK TABLES `Supplier_Information` WRITE;
/*!40000 ALTER TABLE `Supplier_Information` DISABLE KEYS */;
INSERT INTO `Supplier_Information` VALUES (801,201,'IP6 2WA','England','Ipswich',10,'Clownfishproviders@example.com'),(802,202,'CM6 4RD','England','Chelmsford',20,'Goldfishextraction@example.com'),(803,203,'CO7 9EW','England','Colchester',30,'Pufferfishandpals@example.com');
/*!40000 ALTER TABLE `Supplier_Information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `emergency_workplace_accident`
--

DROP TABLE IF EXISTS `emergency_workplace_accident`;
/*!50001 DROP VIEW IF EXISTS `emergency_workplace_accident`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `emergency_workplace_accident` AS SELECT 
 1 AS `First_Name`,
 1 AS `Last_Name`,
 1 AS `Emergency_Contact_Number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `entitled_bonus`
--

DROP TABLE IF EXISTS `entitled_bonus`;
/*!50001 DROP VIEW IF EXISTS `entitled_bonus`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `entitled_bonus` AS SELECT 
 1 AS `First_Name`,
 1 AS `Last_Name`,
 1 AS `Working_Productivity`,
 1 AS `Packaging_Efficiency`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `emergency_workplace_accident`
--

/*!50001 DROP VIEW IF EXISTS `emergency_workplace_accident`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `emergency_workplace_accident` AS select `employee_information`.`First_Name` AS `First_Name`,`employee_information`.`Last_Name` AS `Last_Name`,`employee_information`.`Emergency_Contact_Number` AS `Emergency_Contact_Number` from `employee_information` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `entitled_bonus`
--

/*!50001 DROP VIEW IF EXISTS `entitled_bonus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `entitled_bonus` AS select `employee_information`.`First_Name` AS `First_Name`,`employee_information`.`Last_Name` AS `Last_Name`,`employee_information`.`Working_Productivity` AS `Working_Productivity`,`employee_information`.`Packaging_Efficiency` AS `Packaging_Efficiency` from `employee_information` where ((`employee_information`.`Working_Productivity` >= 0.5) and (`employee_information`.`Packaging_Efficiency` >= 0.7)) order by (`employee_information`.`Working_Productivity` + `employee_information`.`Packaging_Efficiency`) desc */;
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

-- Dump completed on 2023-11-22 10:06:48
