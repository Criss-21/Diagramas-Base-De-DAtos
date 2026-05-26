-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: discos_musicales
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '9ae58fd8-3232-11f1-aa2d-08979897c5cf:1-84';

--
-- Current Database: `discos_musicales`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `discos_musicales` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `discos_musicales`;

--
-- Table structure for table `cancion`
--

DROP TABLE IF EXISTS `cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancion` (
  `id_cancion` int NOT NULL,
  `titulo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cancion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cantante`
--

DROP TABLE IF EXISTS `cantante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cantante` (
  `nombre` varchar(100) NOT NULL,
  `pais` varchar(50) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disco`
--

DROP TABLE IF EXISTS `disco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disco` (
  `titulo` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `id_genero` int NOT NULL,
  `nombre_cantante` varchar(100) NOT NULL,
  PRIMARY KEY (`titulo`),
  KEY `id_genero` (`id_genero`),
  KEY `nombre_cantante` (`nombre_cantante`),
  CONSTRAINT `disco_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero_musical` (`id_genero`),
  CONSTRAINT `disco_ibfk_2` FOREIGN KEY (`nombre_cantante`) REFERENCES `cantante` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disco_cancion`
--

DROP TABLE IF EXISTS `disco_cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disco_cancion` (
  `titulo_disco` varchar(100) NOT NULL,
  `id_cancion` int NOT NULL,
  `posicion` int NOT NULL,
  PRIMARY KEY (`titulo_disco`,`id_cancion`),
  KEY `id_cancion` (`id_cancion`),
  CONSTRAINT `disco_cancion_ibfk_1` FOREIGN KEY (`titulo_disco`) REFERENCES `disco` (`titulo`),
  CONSTRAINT `disco_cancion_ibfk_2` FOREIGN KEY (`id_cancion`) REFERENCES `cancion` (`id_cancion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genero_musical`
--

DROP TABLE IF EXISTS `genero_musical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero_musical` (
  `id_genero` int NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `camiones`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `camiones` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `camiones`;

--
-- Table structure for table `camion`
--

DROP TABLE IF EXISTS `camion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camion` (
  `matricula` varchar(20) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `potencia` int NOT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `camionero`
--

DROP TABLE IF EXISTS `camionero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camionero` (
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `poblacion` varchar(50) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conduccion`
--

DROP TABLE IF EXISTS `conduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conduccion` (
  `cedula_camionero` varchar(15) NOT NULL,
  `matricula_camion` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`cedula_camionero`,`matricula_camion`),
  KEY `matricula_camion` (`matricula_camion`),
  CONSTRAINT `conduccion_ibfk_1` FOREIGN KEY (`cedula_camionero`) REFERENCES `camionero` (`cedula`),
  CONSTRAINT `conduccion_ibfk_2` FOREIGN KEY (`matricula_camion`) REFERENCES `camion` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paquete`
--

DROP TABLE IF EXISTS `paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquete` (
  `codigo_paquete` int NOT NULL,
  `descripcion` text NOT NULL,
  `destinatario` varchar(100) NOT NULL,
  `direccion_destiNO` varchar(150) NOT NULL,
  `cedula_camionero` varchar(15) NOT NULL,
  `codigo_provincia` int NOT NULL,
  PRIMARY KEY (`codigo_paquete`),
  KEY `cedula_camionero` (`cedula_camionero`),
  KEY `codigo_provincia` (`codigo_provincia`),
  CONSTRAINT `paquete_ibfk_1` FOREIGN KEY (`cedula_camionero`) REFERENCES `camionero` (`cedula`),
  CONSTRAINT `paquete_ibfk_2` FOREIGN KEY (`codigo_provincia`) REFERENCES `provincia` (`codigo_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `codigo_provincia` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `empresa_discografica`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `empresa_discografica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `empresa_discografica`;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `nif` varchar(20) NOT NULL,
  `nombre_completo` varchar(50) NOT NULL,
  `id_manager` int NOT NULL,
  PRIMARY KEY (`nif`),
  KEY `id_manager` (`id_manager`),
  CONSTRAINT `artista_ibfk_1` FOREIGN KEY (`id_manager`) REFERENCES `manager` (`id_manager`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `artista_evento`
--

DROP TABLE IF EXISTS `artista_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista_evento` (
  `nif_artista` varchar(20) NOT NULL,
  `id_evento` int NOT NULL,
  PRIMARY KEY (`nif_artista`,`id_evento`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `artista_evento_ibfk_1` FOREIGN KEY (`nif_artista`) REFERENCES `artista` (`nif`),
  CONSTRAINT `artista_evento_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `id_evento` int NOT NULL,
  `fecha_celebracion` date NOT NULL,
  `num_asistentes` int NOT NULL,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `id_manager` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_manager`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `veterinaria`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `veterinaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `veterinaria`;

--
-- Table structure for table `auxiliar`
--

DROP TABLE IF EXISTS `auxiliar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auxiliar` (
  `codigo_personal` int NOT NULL,
  `base_cotizacion` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codigo_personal`),
  CONSTRAINT `auxiliar_ibfk_1` FOREIGN KEY (`codigo_personal`) REFERENCES `personal` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `id_mascota` int NOT NULL,
  `codigo_veterinario` int NOT NULL,
  `fecha` date NOT NULL,
  `diagnostico` text NOT NULL,
  PRIMARY KEY (`id_mascota`,`codigo_veterinario`,`fecha`),
  KEY `codigo_veterinario` (`codigo_veterinario`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`identificador`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`codigo_veterinario`) REFERENCES `veterinario` (`codigo_personal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `familiar_contacto`
--

DROP TABLE IF EXISTS `familiar_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familiar_contacto` (
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `cedula_propietario` varchar(15) NOT NULL,
  PRIMARY KEY (`cedula`),
  UNIQUE KEY `cedula_propietario` (`cedula_propietario`),
  CONSTRAINT `familiar_contacto_ibfk_1` FOREIGN KEY (`cedula_propietario`) REFERENCES `propietario` (`cedula`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mascota`
--

DROP TABLE IF EXISTS `mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascota` (
  `identificador` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `cedula_propietario` varchar(15) NOT NULL,
  PRIMARY KEY (`identificador`),
  KEY `cedula_propietario` (`cedula_propietario`),
  CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`cedula_propietario`) REFERENCES `propietario` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `codigo` int NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `propietario`
--

DROP TABLE IF EXISTS `propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietario` (
  `cedula` varchar(15) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `propietario_telefono`
--

DROP TABLE IF EXISTS `propietario_telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietario_telefono` (
  `cedula_propietario` varchar(15) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`cedula_propietario`,`telefono`),
  CONSTRAINT `propietario_telefono_ibfk_1` FOREIGN KEY (`cedula_propietario`) REFERENCES `propietario` (`cedula`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `veterinario`
--

DROP TABLE IF EXISTS `veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinario` (
  `codigo_personal` int NOT NULL,
  `fecha_alta` date NOT NULL,
  `especialidad` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo_personal`),
  CONSTRAINT `veterinario_ibfk_1` FOREIGN KEY (`codigo_personal`) REFERENCES `personal` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `tienda_informatica`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tienda_informatica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `tienda_informatica`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `codigo` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `cod_cliente` int NOT NULL,
  `cod_producto` int NOT NULL,
  `fecha_compra` date NOT NULL,
  PRIMARY KEY (`cod_cliente`,`cod_producto`),
  KEY `cod_producto` (`cod_producto`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`codigo`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`cod_producto`) REFERENCES `producto` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `codigo` int NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `existencias` int NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `codigo` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suministro`
--

DROP TABLE IF EXISTS `suministro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suministro` (
  `cod_proveedor` int NOT NULL,
  `cod_producto` int NOT NULL,
  PRIMARY KEY (`cod_proveedor`,`cod_producto`),
  KEY `cod_producto` (`cod_producto`),
  CONSTRAINT `suministro_ibfk_1` FOREIGN KEY (`cod_proveedor`) REFERENCES `proveedor` (`codigo`),
  CONSTRAINT `suministro_ibfk_2` FOREIGN KEY (`cod_producto`) REFERENCES `producto` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-25 18:39:37
