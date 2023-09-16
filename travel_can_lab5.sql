-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: travelcan
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `lugares`
--

DROP TABLE IF EXISTS `lugares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugares` (
  `idLugares` int NOT NULL,
  `nombre_lugar` varchar(45) DEFAULT NULL,
  `descrip_lugar` varchar(45) DEFAULT NULL,
  `fecha_lugar` date DEFAULT NULL,
  PRIMARY KEY (`idLugares`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugares`
--

LOCK TABLES `lugares` WRITE;
/*!40000 ALTER TABLE `lugares` DISABLE KEYS */;
INSERT INTO `lugares` VALUES (1,'Antankallo','Catarata a 2 horas de lima con un gran vista','2023-10-10'),(2,'Lunahuana','Será una visita de 6 horas.','2023-09-16'),(3,'Nevado Rajuntay','Nevado trekking extremo','2023-09-24'),(4,'Club Chaclacayo','Club para nadar en la piscina','2023-10-01'),(5,'Lomas de Mala','Lomas poder disfrutar de la vegetación.','2023-09-16');
/*!40000 ALTER TABLE `lugares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotas` (
  `idMascotas` int NOT NULL,
  `nombre_mascota` varchar(45) DEFAULT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `edad` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` varchar(45) DEFAULT NULL,
  `Vacunado` varchar(45) DEFAULT NULL,
  `Desparasitado` varchar(45) DEFAULT NULL,
  `Persona_idPersona` int NOT NULL,
  PRIMARY KEY (`idMascotas`),
  KEY `fk_Mascotas_Persona1_idx` (`Persona_idPersona`),
  CONSTRAINT `fk_Mascotas_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascotas`
--

LOCK TABLES `mascotas` WRITE;
/*!40000 ALTER TABLE `mascotas` DISABLE KEYS */;
INSERT INTO `mascotas` VALUES (1,'Crash','Masculino','10','2013-08-18','si','si',1),(2,'Candy','Femenino','13','2010-08-25','si','si',1),(3,'Reina','Femenino','3','2020-05-01','si','si',2),(4,'Milo','Masculino','4','2019-05-26','si','si',6),(5,'Bonnie','Femenino','2','2021-06-30','si','si',7);
/*!40000 ALTER TABLE `mascotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `idPersona` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `tipo_persona` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Henry Yaipen','79865471','99999999','Dueño'),(2,'Jesus Saldarriaga','89765435','99887766','Dueño'),(3,'Jose Luis','00986543','95958855','Invitado'),(4,'Teresa Barriga','72931641','980355580','Invitado'),(5,'Juan Yaipen','72931643','944272292','Invitado'),(6,'Kevin Raso','08104081','996106441','Dueño'),(7,'Angelica Cabeza','25651874','959588555','Dueño');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes`
--

DROP TABLE IF EXISTS `viajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viajes` (
  `idViajes` int NOT NULL,
  `punto_recojo` varchar(45) DEFAULT NULL,
  `cant_personas` varchar(45) DEFAULT NULL,
  `cant_perros` varchar(45) DEFAULT NULL,
  `Persona_idPersona` int NOT NULL,
  `Lugares_idLugares` int NOT NULL,
  PRIMARY KEY (`idViajes`),
  KEY `fk_Viajes_Persona1_idx` (`Persona_idPersona`),
  KEY `fk_Viajes_Lugares1_idx` (`Lugares_idLugares`),
  CONSTRAINT `fk_Viajes_Lugares1` FOREIGN KEY (`Lugares_idLugares`) REFERENCES `lugares` (`idLugares`),
  CONSTRAINT `fk_Viajes_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes`
--

LOCK TABLES `viajes` WRITE;
/*!40000 ALTER TABLE `viajes` DISABLE KEYS */;
INSERT INTO `viajes` VALUES (1,'Javier Prado','2','1',1,1),(2,'Javier Prado','1','2',2,2),(3,'Los Olivos','2','1',6,2),(4,'Los Olivos','1','1',7,3);
/*!40000 ALTER TABLE `viajes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-10 23:52:29
