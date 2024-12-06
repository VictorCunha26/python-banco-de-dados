-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vingadores
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `chipgps`
--

DROP TABLE IF EXISTS `chipgps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chipgps` (
  `registro` int NOT NULL AUTO_INCREMENT,
  `id_tornozeleira` int NOT NULL,
  `localizacao_atual` varchar(255) NOT NULL,
  `ultima_localizacao` varchar(255) NOT NULL,
  `status` enum('Ativo','Inativo') NOT NULL,
  `data_ativacao` datetime NOT NULL,
  `data_desativacao` datetime NOT NULL,
  PRIMARY KEY (`registro`),
  KEY `id_tornozeleira_idx` (`id_tornozeleira`),
  CONSTRAINT `id_tornozeleira` FOREIGN KEY (`id_tornozeleira`) REFERENCES `tornozeleira` (`Registro`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chipgps`
--

LOCK TABLES `chipgps` WRITE;
/*!40000 ALTER TABLE `chipgps` DISABLE KEYS */;
/*!40000 ALTER TABLE `chipgps` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `chipgps_BEFORE_UPDATE` BEFORE UPDATE ON `chipgps` FOR EACH ROW BEGIN
IF NEW.localizacao_atual != OLD.localizacao_atual THEN
    SET NEW.ultima_localizacao = OLD.localizacao_atual;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `convocacao`
--

DROP TABLE IF EXISTS `convocacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convocacao` (
  `idnumero_registro` int NOT NULL AUTO_INCREMENT,
  `id_heroi` int NOT NULL,
  `motivo` text NOT NULL,
  `data_convocacao` datetime NOT NULL,
  `data_comparecimento` datetime NOT NULL,
  `status` enum('Ativo','Inativo') NOT NULL,
  PRIMARY KEY (`idnumero_registro`),
  KEY `id_heroi_idx` (`id_heroi`),
  CONSTRAINT `id_heroi` FOREIGN KEY (`id_heroi`) REFERENCES `heroi` (`heroi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convocacao`
--

LOCK TABLES `convocacao` WRITE;
/*!40000 ALTER TABLE `convocacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `convocacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heroi`
--

DROP TABLE IF EXISTS `heroi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heroi` (
  `heroi_id` int NOT NULL AUTO_INCREMENT,
  `nome_heroi` varchar(45) DEFAULT NULL,
  `nome_real` varchar(45) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `poderes` varchar(45) DEFAULT NULL,
  `poder_principal` varchar(45) DEFAULT NULL,
  `fraquezas` varchar(45) DEFAULT NULL,
  `nivel_forca` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`heroi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroi`
--

LOCK TABLES `heroi` WRITE;
/*!40000 ALTER TABLE `heroi` DISABLE KEYS */;
INSERT INTO `heroi` VALUES (52,'j','','','','','',''),(53,'j','','','','','','');
/*!40000 ALTER TABLE `heroi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mandadodeprisao`
--

DROP TABLE IF EXISTS `mandadodeprisao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mandadodeprisao` (
  `numero_registro` int NOT NULL AUTO_INCREMENT,
  `id_heroi` int NOT NULL,
  `motivo` text NOT NULL,
  `data_emissao` datetime DEFAULT NULL,
  `data_comparecimento` datetime DEFAULT NULL,
  `status` enum('Ativo','Cumprido','Cancelado') NOT NULL,
  PRIMARY KEY (`numero_registro`),
  KEY `id_heroi_idx` (`id_heroi`),
  CONSTRAINT `id_heroi2` FOREIGN KEY (`id_heroi`) REFERENCES `heroi` (`heroi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mandadodeprisao`
--

LOCK TABLES `mandadodeprisao` WRITE;
/*!40000 ALTER TABLE `mandadodeprisao` DISABLE KEYS */;
/*!40000 ALTER TABLE `mandadodeprisao` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mandadodeprisao_BEFORE_INSERT` BEFORE INSERT ON `mandadodeprisao` FOR EACH ROW BEGIN
  IF NEW.data_emissao IS NULL THEN
    SET NEW.data_emissao = NOW();
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tornozeleira`
--

DROP TABLE IF EXISTS `tornozeleira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tornozeleira` (
  `Registro` int NOT NULL AUTO_INCREMENT,
  `id_vingador` int NOT NULL,
  `status` enum('Ativo','Inativo') NOT NULL,
  `data_ativacao` date DEFAULT NULL,
  `data_desativacao` date DEFAULT NULL,
  PRIMARY KEY (`Registro`),
  KEY `id_vingador_idx` (`id_vingador`),
  CONSTRAINT `id_vingador` FOREIGN KEY (`id_vingador`) REFERENCES `heroi` (`heroi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tornozeleira`
--

LOCK TABLES `tornozeleira` WRITE;
/*!40000 ALTER TABLE `tornozeleira` DISABLE KEYS */;
/*!40000 ALTER TABLE `tornozeleira` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tornozeleira_BEFORE_INSERT` BEFORE INSERT ON `tornozeleira` FOR EACH ROW BEGIN
IF NEW.status = 'Ativo' AND NEW.data_ativacao IS NULL THEN
    SET NEW.data_ativacao = NOW();
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tornozeleira_BEFORE_UPDATE` BEFORE UPDATE ON `tornozeleira` FOR EACH ROW BEGIN
IF NEW.status = 'Inativo' AND OLD.status != 'Inativo' AND NEW.data_desativacao IS NULL THEN
    SET NEW.data_desativacao = NOW();
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'vingadores'
--

--
-- Dumping routines for database 'vingadores'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-06 12:48:08
