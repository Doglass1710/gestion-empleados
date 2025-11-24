-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: gestion_empleados
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `id_area` int NOT NULL AUTO_INCREMENT,
  `nombre_area` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_area`),
  UNIQUE KEY `nombre_area` (`nombre_area`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'Sistemas','Gestión de TI y soporte','2025-10-08 22:33:34'),(2,'Recursos Humanos','Administración del personal','2025-10-08 22:33:34'),(3,'Finanzas','Control presupuestal y contabilidad','2025-10-08 23:15:08'),(4,'Ventas','Gestión de clientes y ventas','2025-10-08 23:15:08'),(5,'Operaciones','Logística y procesos internos','2025-10-08 23:15:08');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `puesto` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `id_area` int NOT NULL,
  `id_jefe` int DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `correo` (`correo`),
  KEY `fk_empleado_area` (`id_area`),
  KEY `fk_empleado_jefe` (`id_jefe`),
  CONSTRAINT `fk_empleado_area` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`),
  CONSTRAINT `fk_empleado_jefe` FOREIGN KEY (`id_jefe`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Adrián','Pérez','adrian@example.com','Analista de Sistemas',1,NULL,1,'2025-10-08 22:33:34',NULL),(2,'Laura','Martínez','laura.mtz@example.com','Contadora',3,NULL,1,'2025-10-08 23:15:08',NULL),(3,'Carlos','López','carlos.lopez@example.com','Ejecutivo de Ventas',4,NULL,1,'2025-10-08 23:15:08',NULL),(4,'María','García','maria.garcia@example.com','Jefa de Operaciones',5,NULL,1,'2025-10-08 23:15:08',NULL),(5,'José','Ramírez','jose.ramirez@example.com','Soporte Técnico',1,NULL,1,'2025-10-08 23:15:08',NULL),(6,'Ana','Hernández','ana.hernandez@example.com','Reclutadora',2,NULL,1,'2025-10-08 23:15:08',NULL);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `tipo_equipo` enum('Laptop','PC','Workstation','ThinClient','Otro') COLLATE utf8mb4_general_ci NOT NULL,
  `marca` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `modelo` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `numero_serie` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` enum('Asignado','Disponible','EnReparacion','Retirado') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Disponible',
  `id_empleado` int DEFAULT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_equipo`),
  UNIQUE KEY `numero_serie` (`numero_serie`),
  KEY `fk_equipo_empleado` (`id_empleado`),
  CONSTRAINT `fk_equipo_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Laptop','Dell','Latitude 5420','SN-TEST-001','Asignado',1,'2025-10-08','2025-10-08 22:33:34',NULL),(2,'Laptop','Dell','Latitude 5420','SN-TEST-002','Asignado',2,'2025-10-08','2025-10-08 23:15:08',NULL),(3,'PC','HP','ProDesk 600','SN-TEST-003','Disponible',NULL,NULL,'2025-10-08 23:15:08',NULL),(4,'Workstation','Lenovo','ThinkStation P340','SN-TEST-004','Asignado',3,'2025-10-08','2025-10-08 23:15:08',NULL),(5,'Laptop','Apple','MacBook Pro 14','SN-TEST-005','Asignado',4,'2025-10-08','2025-10-08 23:15:08',NULL);
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_sistema`
--

DROP TABLE IF EXISTS `usuarios_sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_sistema` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `username` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `rol` enum('admin','editor','viewer') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'viewer',
  `id_empleado` int DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_usuario_empleado` (`id_empleado`),
  CONSTRAINT `fk_usuario_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_sistema`
--

LOCK TABLES `usuarios_sistema` WRITE;
/*!40000 ALTER TABLE `usuarios_sistema` DISABLE KEYS */;
INSERT INTO `usuarios_sistema` VALUES (1,'admin','$2b$10$placeholderHash','admin',1,1,'2025-10-08 22:33:35',NULL),(2,'laura.mtz','$2b$10$placeholderHash','editor',2,1,'2025-10-08 23:15:08',NULL),(3,'carlos.lopez','$2b$10$placeholderHash','viewer',3,1,'2025-10-08 23:15:08',NULL),(4,'maria.garcia','$2b$10$placeholderHash','admin',4,1,'2025-10-08 23:15:08',NULL),(5,'jose.ramirez','$2b$10$placeholderHash','viewer',5,1,'2025-10-08 23:15:08',NULL);
/*!40000 ALTER TABLE `usuarios_sistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gestion_empleados'
--

--
-- Dumping routines for database 'gestion_empleados'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-08 17:21:39
