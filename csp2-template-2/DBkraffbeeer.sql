-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.21-MariaDB

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
-- Table structure for table `tbcategory`
--

DROP TABLE IF EXISTS `tbcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CategoryName` (`CategoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcategory`
--

LOCK TABLES `tbcategory` WRITE;
/*!40000 ALTER TABLE `tbcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbcustomerprofile`
--

DROP TABLE IF EXISTS `tbcustomerprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbcustomerprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RefUsername` int(11) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `Image` varchar(128) DEFAULT NULL,
  `FName` varchar(64) NOT NULL,
  `LName` varchar(64) NOT NULL,
  `Address1` varchar(64) DEFAULT NULL,
  `Address2` varchar(64) DEFAULT NULL,
  `City` varchar(32) DEFAULT NULL,
  `Province` varchar(32) DEFAULT NULL,
  `ZIP` varchar(4) DEFAULT NULL,
  `ContactNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `RefUsername` (`RefUsername`),
  CONSTRAINT `tbcustomerprofile_ibfk_1` FOREIGN KEY (`RefUsername`) REFERENCES `tbusernames` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcustomerprofile`
--

LOCK TABLES `tbcustomerprofile` WRITE;
/*!40000 ALTER TABLE `tbcustomerprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbcustomerprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbemployeeprofile`
--

DROP TABLE IF EXISTS `tbemployeeprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbemployeeprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RefUsername` int(11) NOT NULL,
  `Password` int(11) NOT NULL,
  `FName` int(11) NOT NULL,
  `LName` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `RefUsername` (`RefUsername`),
  CONSTRAINT `tbemployeeprofile_ibfk_1` FOREIGN KEY (`RefUsername`) REFERENCES `tbusernames` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbemployeeprofile`
--

LOCK TABLES `tbemployeeprofile` WRITE;
/*!40000 ALTER TABLE `tbemployeeprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbemployeeprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbitems`
--

DROP TABLE IF EXISTS `tbitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Description` text,
  `Price` decimal(10,0) NOT NULL,
  `RefCategory` int(11) NOT NULL,
  `Image` varchar(128) DEFAULT NULL,
  `StockQty` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Name` (`Name`),
  KEY `RefCategory` (`RefCategory`),
  CONSTRAINT `tbitems_ibfk_1` FOREIGN KEY (`RefCategory`) REFERENCES `tbcategory` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbitems`
--

LOCK TABLES `tbitems` WRITE;
/*!40000 ALTER TABLE `tbitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tborderitems`
--

DROP TABLE IF EXISTS `tborderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tborderitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RefItem` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `ValueSubTotal` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `RefItem` (`RefItem`),
  CONSTRAINT `tborderitems_ibfk_1` FOREIGN KEY (`RefItem`) REFERENCES `tbitems` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tborderitems`
--

LOCK TABLES `tborderitems` WRITE;
/*!40000 ALTER TABLE `tborderitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `tborderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbordermain`
--

DROP TABLE IF EXISTS `tbordermain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbordermain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RefOrderReferences` int(11) NOT NULL,
  `RefOrderStatus` int(11) NOT NULL,
  `Receipt` int(11) NOT NULL,
  `RefOrderItems` int(11) NOT NULL,
  `ValueTotal` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Receipt` (`Receipt`),
  KEY `RefOrderReferences` (`RefOrderReferences`),
  KEY `RefOrderStatus` (`RefOrderStatus`),
  KEY `RefOrderItems` (`RefOrderItems`),
  CONSTRAINT `tbordermain_ibfk_1` FOREIGN KEY (`RefOrderReferences`) REFERENCES `tborderref` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `tbordermain_ibfk_2` FOREIGN KEY (`RefOrderStatus`) REFERENCES `tborderstatus` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `tbordermain_ibfk_3` FOREIGN KEY (`RefOrderItems`) REFERENCES `tborderitems` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbordermain`
--

LOCK TABLES `tbordermain` WRITE;
/*!40000 ALTER TABLE `tbordermain` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbordermain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tborderref`
--

DROP TABLE IF EXISTS `tborderref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tborderref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RefCustomer` int(11) DEFAULT NULL,
  `RefEmployee` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `RefCustomer` (`RefCustomer`),
  KEY `RefEmployee` (`RefEmployee`),
  CONSTRAINT `tborderref_ibfk_1` FOREIGN KEY (`RefCustomer`) REFERENCES `tbcustomerprofile` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `tborderref_ibfk_2` FOREIGN KEY (`RefEmployee`) REFERENCES `tbemployeeprofile` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tborderref`
--

LOCK TABLES `tborderref` WRITE;
/*!40000 ALTER TABLE `tborderref` DISABLE KEYS */;
/*!40000 ALTER TABLE `tborderref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tborderstatus`
--

DROP TABLE IF EXISTS `tborderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tborderstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StatusName` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `StatusName` (`StatusName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tborderstatus`
--

LOCK TABLES `tborderstatus` WRITE;
/*!40000 ALTER TABLE `tborderstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `tborderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbroles`
--

DROP TABLE IF EXISTS `tbroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbroles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AccountRoleName` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbroles`
--

LOCK TABLES `tbroles` WRITE;
/*!40000 ALTER TABLE `tbroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbusernames`
--

DROP TABLE IF EXISTS `tbusernames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbusernames` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(32) NOT NULL,
  `Email` varchar(128) NOT NULL,
  `RefAccountRole` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`),
  KEY `RefAccountRole` (`RefAccountRole`),
  CONSTRAINT `tbusernames_ibfk_1` FOREIGN KEY (`RefAccountRole`) REFERENCES `tbroles` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbusernames`
--

LOCK TABLES `tbusernames` WRITE;
/*!40000 ALTER TABLE `tbusernames` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbusernames` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-07 21:30:44
