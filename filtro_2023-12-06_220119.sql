-- MySQL dump 10.13  Distrib 8.2.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: filtro
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `buses`
--

DROP TABLE IF EXISTS `buses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buses` (
  `id_bus` int NOT NULL AUTO_INCREMENT,
  `placa` varchar(50) NOT NULL,
  PRIMARY KEY (`id_bus`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buses`
--

/*!40000 ALTER TABLE `buses` DISABLE KEYS */;
INSERT INTO `buses` VALUES (1,'XVH345'),(2,'XDL965'),(3,'XFG847'),(4,'XRJ452'),(5,'XDF459'),(6,'XET554'),(7,'XKL688'),(8,'XXL757');
/*!40000 ALTER TABLE `buses` ENABLE KEYS */;

--
-- Table structure for table `conductor`
--

DROP TABLE IF EXISTS `conductor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conductor` (
  `id_conductor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_conductor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conductor`
--

/*!40000 ALTER TABLE `conductor` DISABLE KEYS */;
INSERT INTO `conductor` VALUES (1,'Andrés Manuel López Obrador'),(2,'Nicolás Maduro Moros'),(3,'Alberto Fernández'),(4,'Luiz Inácio Lula da Silva'),(5,'Gabriel Boric'),(6,'Miguel Díaz-Canel'),(7,'Daniel Ortega'),(8,'Gustavo Petro Urrego'),(9,'Luis Arce'),(10,'Xiomara Castro');
/*!40000 ALTER TABLE `conductor` ENABLE KEYS */;

--
-- Table structure for table `estacion`
--

DROP TABLE IF EXISTS `estacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estacion` (
  `id_estacion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estacion`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacion`
--

/*!40000 ALTER TABLE `estacion` DISABLE KEYS */;
INSERT INTO `estacion` VALUES (1,'Colseguros'),(2,'Clínica Chicamocha'),(3,'Plaza Guarín'),(4,'Mega Mall'),(5,'UIS'),(6,'UDI'),(7,'Santo Tomás'),(8,'Boulevard Santander'),(9,'Búcaros'),(10,'Rosita'),(11,'Puerta del Sol'),(12,'Cacique'),(13,'Plaza Satélite'),(14,'La Sirena'),(15,'Provenza'),(16,'Fontana'),(17,'Gibraltar'),(18,'Terminal'),(19,'Mutis'),(20,'Plaza Real');
/*!40000 ALTER TABLE `estacion` ENABLE KEYS */;

--
-- Table structure for table `estacion_ruta`
--

DROP TABLE IF EXISTS `estacion_ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estacion_ruta` (
  `id_estacion` int DEFAULT NULL,
  `id_ruta` int DEFAULT NULL,
  KEY `id_estacion` (`id_estacion`),
  KEY `id_ruta` (`id_ruta`),
  CONSTRAINT `estacion_ruta_ibfk_1` FOREIGN KEY (`id_estacion`) REFERENCES `estacion` (`id_estacion`),
  CONSTRAINT `estacion_ruta_ibfk_2` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id_ruta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacion_ruta`
--

/*!40000 ALTER TABLE `estacion_ruta` DISABLE KEYS */;
INSERT INTO `estacion_ruta` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,3),(9,3),(10,3),(11,3),(12,3),(13,4),(14,4),(15,4),(16,5),(17,5),(18,8),(19,8),(20,8);
/*!40000 ALTER TABLE `estacion_ruta` ENABLE KEYS */;

--
-- Table structure for table `recorrido`
--

DROP TABLE IF EXISTS `recorrido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recorrido` (
  `id_conductor` int DEFAULT NULL,
  `id_bus` int DEFAULT NULL,
  `dia` enum('1','2','3','4','5','6','7') NOT NULL,
  `id_ruta` int DEFAULT NULL,
  `id_zona` int DEFAULT NULL,
  KEY `id_conductor` (`id_conductor`),
  KEY `id_bus` (`id_bus`),
  KEY `id_ruta` (`id_ruta`),
  KEY `id_zona` (`id_zona`),
  CONSTRAINT `recorrido_ibfk_1` FOREIGN KEY (`id_conductor`) REFERENCES `conductor` (`id_conductor`),
  CONSTRAINT `recorrido_ibfk_2` FOREIGN KEY (`id_bus`) REFERENCES `buses` (`id_bus`),
  CONSTRAINT `recorrido_ibfk_3` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id_ruta`),
  CONSTRAINT `recorrido_ibfk_4` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id_zona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recorrido`
--

/*!40000 ALTER TABLE `recorrido` DISABLE KEYS */;
INSERT INTO `recorrido` VALUES (5,1,'1',1,1),(5,1,'2',1,1),(5,3,'3',1,1),(5,3,'4',1,1),(5,5,'5',2,1),(5,5,'6',2,1),(5,5,'7',2,1),(3,5,'1',4,4),(3,6,'2',4,4),(3,1,'3',4,4),(3,1,'4',5,4),(3,3,'5',5,4),(3,3,'6',5,4),(3,3,'7',5,4),(10,3,'1',10,5),(10,3,'2',10,5),(10,5,'3',10,5),(10,5,'4',10,5),(10,4,'5',10,5),(10,7,'6',11,5),(10,7,'7',11,5),(7,7,'1',11,5),(7,7,'2',11,5),(6,7,'3',12,5),(6,7,'4',12,5),(6,7,'5',12,5),(6,6,'6',12,5),(6,6,'7',12,5);
/*!40000 ALTER TABLE `recorrido` ENABLE KEYS */;

--
-- Table structure for table `ruta`
--

DROP TABLE IF EXISTS `ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruta` (
  `id_ruta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `tiempo` time NOT NULL,
  `estacion_inicial` varchar(50) NOT NULL,
  `estacion_final` varchar(50) NOT NULL,
  PRIMARY KEY (`id_ruta`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta`
--

/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
INSERT INTO `ruta` VALUES (1,'Universidades','02:00:00','1','2'),(2,'Café Madrid','02:15:00','3','4'),(3,'Cacique','01:45:00','5','6'),(4,'Diamantes','01:50:00','7','8'),(5,'Terminal','02:00:00','9','10'),(6,'Prado','01:30:00','11','12'),(7,'Cabecera','02:00:00','13','14'),(8,'Ciudadela','02:00:00','15','16'),(9,'Punta Estrella','02:30:00','17','18'),(10,'Niza','02:45:00','19','20'),(11,'Autopista','02:15:00','21','22'),(12,'Lagos','02:15:00','23','24'),(13,'Centro Florida','02:30:00','25','26');
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;

--
-- Table structure for table `zona`
--

DROP TABLE IF EXISTS `zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zona` (
  `id_zona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona`
--

/*!40000 ALTER TABLE `zona` DISABLE KEYS */;
INSERT INTO `zona` VALUES (1,'Norte'),(2,'Sur'),(3,'Oriente'),(4,'Occidente'),(5,'Floridablanca'),(6,'Girón'),(7,'Piedecuesta');
/*!40000 ALTER TABLE `zona` ENABLE KEYS */;

--
-- Dumping routines for database 'filtro'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-06 22:01:22
