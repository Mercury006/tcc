-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: autonomos
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `anuncio`
--

DROP TABLE IF EXISTS `anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anuncio` (
  `IDANUNCIO` int(11) NOT NULL AUTO_INCREMENT,
  `IDUSUARIO` int(11) NOT NULL,
  `IDAVALIACAO` int(11) DEFAULT NULL,
  `REDESOCIAL` text DEFAULT NULL,
  `TELEFONE` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `TRABALHO` varchar(255) NOT NULL,
  `ESPECIALIZACAO` varchar(255) DEFAULT NULL,
  `LOCAL` varchar(255) DEFAULT NULL,
  `DESCRICAO` text DEFAULT NULL,
  `ENDERECOANUNCIO` varchar(255) DEFAULT NULL,
  `HORARIOS` varchar(255) DEFAULT NULL,
  `IMAGEM` varchar(255) DEFAULT NULL,
  `NOME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDANUNCIO`),
  KEY `IDAVALIACAO` (`IDAVALIACAO`),
  CONSTRAINT `anuncio_ibfk_1` FOREIGN KEY (`IDAVALIACAO`) REFERENCES `avaliacao` (`IDAVALIACAO`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncio`
--

LOCK TABLES `anuncio` WRITE;
/*!40000 ALTER TABLE `anuncio` DISABLE KEYS */;
INSERT INTO `anuncio` VALUES (15,2,NULL,'@FranMarcenarias','(16) 99412-3333','','Artesanato','Marcenaria','Av Brasil, 425','Trabalho com marcenaria a 12 anos e faço oque gosto, com amor tudo fica melhor.',NULL,'8h as 16h','uploads/66679e9c2026b_foto-marcenaria.jpg','Francisco'),(16,1,NULL,'@GregTI','(16) 99312-9152','','Tecnologia','Desenvolvedor Back End','Rua Bonfim, 523','Desenvolvimento Back-End com Java e SpringBoot',NULL,'13h às 20h','uploads/66679f81845ad_post05-912x480.png','Gregório Matos');
/*!40000 ALTER TABLE `anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacao` (
  `IDAVALIACAO` int(11) NOT NULL AUTO_INCREMENT,
  `IDUSUARIO` int(11) NOT NULL,
  `NOTA` int(11) NOT NULL,
  PRIMARY KEY (`IDAVALIACAO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `IDCIDADE` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) NOT NULL,
  `IDESTADO` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDCIDADE`),
  KEY `IDESTADO` (`IDESTADO`),
  CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`IDESTADO`) REFERENCES `estado` (`IDESTADO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratacao`
--

DROP TABLE IF EXISTS `contratacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratacao` (
  `IDCONTRATACAO` int(11) NOT NULL AUTO_INCREMENT,
  `DATA` date NOT NULL,
  `HORA` time NOT NULL,
  `IDCLIENTE` int(11) DEFAULT NULL,
  `IDANUNCIO` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDCONTRATACAO`),
  KEY `IDCLIENTE` (`IDCLIENTE`),
  KEY `IDANUNCIO` (`IDANUNCIO`),
  CONSTRAINT `contratacao_ibfk_1` FOREIGN KEY (`IDCLIENTE`) REFERENCES `usuario` (`IDUSUARIO`),
  CONSTRAINT `contratacao_ibfk_2` FOREIGN KEY (`IDANUNCIO`) REFERENCES `anuncio` (`IDANUNCIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratacao`
--

LOCK TABLES `contratacao` WRITE;
/*!40000 ALTER TABLE `contratacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `IDESTADO` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) NOT NULL,
  `SIGLA` char(2) NOT NULL,
  PRIMARY KEY (`IDESTADO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `IDAVALIACAO` int(11) DEFAULT NULL,
  `LOGIN` varchar(255) NOT NULL,
  `SENHA` varchar(20) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  PRIMARY KEY (`IDUSUARIO`),
  UNIQUE KEY `LOGIN` (`LOGIN`),
  UNIQUE KEY `EMAIL` (`EMAIL`),
  UNIQUE KEY `CPF` (`CPF`),
  KEY `IDAVALIACAO` (`IDAVALIACAO`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`IDAVALIACAO`) REFERENCES `avaliacao` (`IDAVALIACAO`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,NULL,'greg','oi','greg@gmail.com','69270887685'),(2,NULL,'Francisco','123','francisco@gmail.com','12312312332'),(6,NULL,'Gregório','123','gregorio@gmail.com','99922211144'),(7,NULL,'Roberto','123','roberto@outlook.com','10117739880'),(8,NULL,'Mano','123','mano@gmail.com','48267165835'),(15,NULL,'guilherme','123','guilhermejoseandrini@gmail.com','497.142.548-92'),(16,NULL,'sabrina','01020355','sabrinagodoi@gmail.com','5367267367');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-10 21:57:40
