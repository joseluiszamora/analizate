-- MySQL dump 10.13  Distrib 5.6.24, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: analizate
-- ------------------------------------------------------
-- Server version	5.6.24-0ubuntu2

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
-- Table structure for table `analyses`
--

DROP TABLE IF EXISTS `analyses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analyses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `receipt_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `receipt_time` time DEFAULT NULL,
  `delivery_time` time DEFAULT NULL,
  `patient_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient_type_selector` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_analyses_on_patient_id` (`patient_id`),
  KEY `index_analyses_on_doctor_id` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analyses`
--

LOCK TABLES `analyses` WRITE;
/*!40000 ALTER TABLE `analyses` DISABLE KEYS */;
INSERT INTO `analyses` VALUES (1,NULL,NULL,'2015-07-09','2015-07-09','2015-07-10 00:04:12','2015-07-10 01:06:25','23:00:00','23:00:00','Victor Hugo Mendoza Guzman',1),(2,3,2,'2015-07-11','2015-07-11','2015-07-11 16:33:48','2015-07-11 16:33:48','12:15:00','12:15:00','',0),(3,3,2,'2015-07-20','2015-07-20','2015-07-20 22:43:47','2015-07-20 22:43:47','18:00:00','18:00:00','',0),(4,3,2,'2015-07-29','2015-07-29','2015-07-29 19:48:38','2015-07-29 19:52:21','23:30:00','23:30:00','',0),(5,3,2,'2015-07-30','2015-07-30','2015-07-30 22:36:30','2015-07-30 22:36:30','18:30:00','19:30:00','Evo Morales',1),(6,3,2,'2015-08-03','2015-08-03','2015-08-04 01:52:25','2015-08-04 01:52:25','21:45:00','21:45:00','helen fernandez',1),(7,3,5,'2015-08-23','2015-08-23','2015-08-23 21:00:16','2015-08-23 21:00:16','16:45:00','16:45:00','',0),(8,3,5,'2015-09-03','2015-09-03','2015-09-03 17:35:10','2015-09-03 17:35:10','13:30:00','13:30:00','',0),(9,3,5,'2015-09-03','2015-09-03','2015-09-04 02:28:19','2015-09-04 02:28:19','22:15:00','22:15:00','',0),(10,3,5,'2015-09-07','2015-09-07','2015-09-07 19:57:24','2015-09-07 19:57:24','15:45:00','15:45:00','',0),(11,3,5,'2015-09-07','2015-09-07','2015-09-07 21:01:27','2015-09-07 21:01:27','17:00:00','17:00:00','',0);
/*!40000 ALTER TABLE `analyses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutions`
--

DROP TABLE IF EXISTS `institutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `desc` text COLLATE utf8_unicode_ci,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `web` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutions`
--

LOCK TABLES `institutions` WRITE;
/*!40000 ALTER TABLE `institutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratories`
--

DROP TABLE IF EXISTS `laboratories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboratories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `analysis_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `result` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_laboratories_on_analysis_id` (`analysis_id`),
  KEY `index_laboratories_on_test_id` (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratories`
--

LOCK TABLES `laboratories` WRITE;
/*!40000 ALTER TABLE `laboratories` DISABLE KEYS */;
INSERT INTO `laboratories` VALUES (1,1,1,'5.5','2015-07-10 00:04:12','2015-07-10 00:04:12',NULL,NULL),(2,1,2,'45','2015-07-10 00:04:12','2015-07-10 00:04:12',NULL,NULL),(3,1,3,'13,3','2015-07-10 00:04:12','2015-07-10 00:04:12',NULL,NULL),(4,1,4,'3','2015-07-10 00:04:12','2015-07-10 00:04:12',NULL,NULL),(5,1,5,'5','2015-07-10 00:04:12','2015-07-10 00:04:12',NULL,NULL),(6,4,2,'23','2015-07-29 19:52:21','2015-07-29 19:52:21',NULL,NULL),(7,4,3,'2','2015-07-29 19:52:21','2015-07-29 19:52:21',NULL,NULL),(8,5,1,'4.5','2015-07-30 22:36:31','2015-07-30 22:36:31',NULL,NULL),(9,5,2,'41','2015-07-30 22:36:31','2015-07-30 22:36:31',NULL,NULL),(10,5,3,'12.5','2015-07-30 22:36:31','2015-07-30 22:36:31',NULL,NULL),(11,5,4,'5','2015-07-30 22:36:31','2015-07-30 22:36:31',NULL,NULL),(12,5,5,'18','2015-07-30 22:36:31','2015-07-30 22:36:31',NULL,NULL),(13,6,1,'5,5','2015-08-04 01:52:25','2015-08-04 01:52:25',NULL,NULL),(14,6,2,'45','2015-08-04 01:52:25','2015-08-04 01:52:25',NULL,NULL),(15,6,3,'16.5','2015-08-04 01:52:25','2015-08-04 01:52:25',NULL,NULL),(16,6,4,'2','2015-08-04 01:52:25','2015-08-04 01:52:25',NULL,NULL),(17,6,5,'5','2015-08-04 01:52:25','2015-08-04 01:52:25',NULL,NULL),(18,7,1,'','2015-08-23 21:00:16','2015-08-23 21:00:16',NULL,NULL),(19,7,2,'','2015-08-23 21:00:16','2015-08-23 21:00:16',NULL,NULL),(20,7,3,'','2015-08-23 21:00:16','2015-08-23 21:00:16',NULL,NULL),(21,7,4,'','2015-08-23 21:00:16','2015-08-23 21:00:16',NULL,NULL),(22,7,5,'','2015-08-23 21:00:16','2015-08-23 21:00:16',NULL,NULL),(23,8,1,'3','2015-09-03 17:35:10','2015-09-03 17:35:10',NULL,NULL),(24,8,3,'4','2015-09-03 17:35:10','2015-09-03 17:35:10',NULL,NULL),(25,8,4,'5','2015-09-03 17:35:10','2015-09-03 17:35:10',NULL,NULL),(26,8,5,'1','2015-09-03 17:35:10','2015-09-03 17:35:10',NULL,NULL),(27,9,1,'4,6','2015-09-04 02:28:19','2015-09-04 02:28:19',NULL,NULL),(28,9,2,'45','2015-09-04 02:28:19','2015-09-04 02:28:19',NULL,NULL),(29,9,3,'16,3','2015-09-04 02:28:19','2015-09-04 02:28:19',NULL,NULL),(30,9,4,'12','2015-09-04 02:28:19','2015-09-04 02:28:19',NULL,NULL),(31,9,5,'45','2015-09-04 02:28:19','2015-09-04 02:28:19',NULL,NULL),(32,10,1,'3,4','2015-09-07 19:57:24','2015-09-07 19:57:24',NULL,NULL),(33,10,2,'32','2015-09-07 19:57:24','2015-09-07 19:57:24',NULL,NULL),(34,10,3,'8','2015-09-07 19:57:24','2015-09-07 19:57:24',NULL,NULL),(35,10,4,'9','2015-09-07 19:57:24','2015-09-07 19:57:24',NULL,NULL),(36,10,5,'0','2015-09-07 19:57:24','2015-09-07 19:57:24',NULL,NULL),(37,11,6,NULL,'2015-09-07 21:01:27','2015-09-07 21:01:27','cdcdcdc',NULL);
/*!40000 ALTER TABLE `laboratories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
INSERT INTO `notices` VALUES (2,'ZONA  WI - FI','Ahora puedes contar con nuestro servicio wi-fi mientras esperas por tus resultados, haciendo mas ameno el tiempo de estancia en el laboratorio clínico.','zona_wi-fi.png','2015-07-03 01:11:30','2015-07-03 01:11:30');
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130808032325'),('20130813034535'),('20130813043605'),('20130815021426'),('20130826042946'),('20130828040034'),('20130829061336'),('20130831100210'),('20130902142838'),('20130902151900'),('20130905202854'),('20130920153337'),('20130920231242'),('20130927225443'),('20130927225505'),('20131002183758'),('20131014172023'),('20131014184345'),('20131017105536'),('20131022025737'),('20131022211416'),('20131022214401'),('20131023103819'),('20131030181417'),('20131030182127'),('20131030183649'),('20131230145453');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (2,'BIENVENIDO (A)','El Laboratorio Clínico KOLPING, le da una cordial bienvenida a nuestra pagina web.<br>En esta pagina usted podrá encontrar una <b>guía medica</b>, una <b>guía farmacéutica</b> y una <b>guía hospitalaria</b> que esperamos sea de gran utilidad en sus necesidades de salud. También podrá encontrar principalmente el <b>servicio de Laboratorio Clínico</b>, con el realizado de diferentes exámenes de diagnostico y la puesta de estos resultados en linea, los que podrá descargarlos desde cualquier ordenador, en cualquier parte del mundo.<br>Confiando que este sitio web sea de gran beneficio suyo, lo invitamos a navegar por el mismo, agradeciendo infinitamente su visita.',NULL,'2015-07-04 15:06:12','2015-07-04 15:06:12'),(3,'ACERCA DE LOS EXÁMENES DE LABORATORIO','Para el cuidado integral de la salud, se requiere de la interacción de varias disciplinas medicas y/o diferentes especialidades en donde el Laboratorio Clínico aporta una herramienta clínica adicional muy importante, para prevenir, monitorear y curar una determinada enfermedad. &nbsp;Los exámenes realizados en un laboratorio por si solo no son diagnostico, pero usados conjuntamente con la historia clínica y el examen físico realizados por el medico, aportan una valiosa información sobre el estado del paciente. &nbsp;Los exámenes o pruebas de laboratorio sirven para evaluar la funcionalidad básica de uno o de varios órganos. &nbsp;A estos exámenes se los agrupa bajo el denominativo de Paneles o Perfiles que según el órgano que se seleccione para monitorear &nbsp;se denominan como sigue. &nbsp;<i>Perfil renal, perfil&nbsp;hepático, perfil&nbsp;lipídico, perfil tiroideo etc.</i>&nbsp;&nbsp;Existen ademas otras pruebas especiales que van en la búsqueda de un diagnostico ya mas especifico, que están basados en técnicas como la quimioluminiscencia, inmunocromatografia, biología molecular, etc. &nbsp;El medico al seleccionar las pruebas de laboratorio en sangre, orina u otros líquidos biológicos obtiene la información necesaria para conocer el estado \"químico\" del paciente. &nbsp;Es recomendable y muy importante que usted evalúe y/o monitoree su estado de salud con uno o varios de estos&nbsp;',NULL,'2015-07-30 00:29:04','2015-07-30 00:40:42'),(4,'CONDICIONES PARA UNA TOMA DE MUESTRA','<b>EXÁMENES GENERALES<br></b>1. Haber cumplido un ayuno minimo de <b>8</b> horas, maximo <b>12</b> horas previo a la toma de muestra.<br>2. La ultima comida del dia anterior debe ser baja en grasas.<br>3. No realizar ningun tipo de ejercicio desde la noche anterior al dia de toma de muestra.<br>4. No ingerir alcohol, minimo <b>72</b> horas antes del examen.<br>5. No consumir chiclets antes o durante la realización de los examenes de laboratorio.',NULL,'2015-07-30 00:51:52','2015-07-30 00:51:52');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialties`
--

DROP TABLE IF EXISTS `specialties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialties`
--

LOCK TABLES `specialties` WRITE;
/*!40000 ALTER TABLE `specialties` DISABLE KEYS */;
INSERT INTO `specialties` VALUES (1,'Medicina General',NULL,'2015-08-04 03:09:35','2015-08-04 03:09:35'),(2,'Emergencias',NULL,'2015-08-04 03:09:50','2015-08-04 03:09:50'),(3,'Ginecologia',NULL,'2015-08-04 03:10:02','2015-08-04 03:10:02'),(4,'Pediatria',NULL,'2015-08-04 03:10:12','2015-08-04 03:10:12'),(5,'Cardiologia',NULL,'2015-08-04 03:10:21','2015-08-04 03:10:21'),(6,'Neurologia',NULL,'2015-08-04 03:10:33','2015-08-04 03:10:33'),(7,'Otorrinolarongologia',NULL,'2015-08-04 03:10:46','2015-08-04 03:10:46'),(8,'Dermatologia',NULL,'2015-08-04 03:10:55','2015-08-04 03:10:55'),(9,'Oftalmologia',NULL,'2015-08-04 03:11:07','2015-08-04 03:11:07'),(10,'Gastroenterologia',NULL,'2015-08-04 03:11:21','2015-08-04 03:11:21'),(11,'Urologia',NULL,'2015-08-04 03:11:32','2015-08-04 03:11:32'),(12,'Endocrinologia',NULL,'2015-08-04 03:11:42','2015-08-04 03:11:42'),(13,'Medicina Critica y Terapia Intensiva',NULL,'2015-08-04 03:12:03','2015-08-04 03:12:03'),(14,'Odontologia',NULL,'2015-08-04 03:12:18','2015-08-04 03:12:18');
/*!40000 ALTER TABLE `specialties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_categories`
--

DROP TABLE IF EXISTS `test_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ancestry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_test_categories_on_ancestry` (`ancestry`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_categories`
--

LOCK TABLES `test_categories` WRITE;
/*!40000 ALTER TABLE `test_categories` DISABLE KEYS */;
INSERT INTO `test_categories` VALUES (2,'BIOMETRIA HEMATICA',NULL,'2015-07-09 23:55:03','2015-07-09 23:55:03','table1',NULL),(3,'SERIE ROJA','2','2015-07-09 23:56:01','2015-07-09 23:56:01','table1',1),(4,'<p>Prueba 1</p>\r\n',NULL,'2015-09-07 20:59:03','2015-09-07 20:59:03','desc',0),(5,'<p>prueba 11</p>\r\n','4','2015-09-07 20:59:30','2015-09-07 20:59:30','desc',0);
/*!40000 ALTER TABLE `test_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference_values` text COLLATE utf8_unicode_ci,
  `test_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `test_category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tests_on_test_category_id` (`test_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,'Glóbulos rojos','millones/mm3','varon 5,2 &nbsp;- &nbsp;6,6 &nbsp; &nbsp; &nbsp;mujer 4,5 &nbsp;- &nbsp;5,5','',NULL,NULL,3,'2015-07-09 23:57:25','2015-07-09 23:57:25',1),(2,'Hematocrito','%','varon 49 &nbsp;- &nbsp;57 &nbsp; &nbsp; &nbsp;mujer 45 &nbsp;- &nbsp;54','',NULL,NULL,3,'2015-07-09 23:58:14','2015-07-09 23:58:14',2),(3,'Hemoglobina','g %','varon 15,1 &nbsp;- &nbsp;18,7 &nbsp; &nbsp; &nbsp;mujer 14,3 &nbsp;- &nbsp;17,4','',NULL,NULL,3,'2015-07-09 23:59:10','2015-07-09 23:59:10',3),(4,'V.E.S.   1ra. Hora','mm','varon 0 &nbsp;- &nbsp;10 &nbsp; &nbsp; &nbsp;mujer 0 &nbsp;- &nbsp;15','',NULL,NULL,3,'2015-07-10 00:00:25','2015-07-10 00:00:25',4),(5,'V.E.S.   2da Hora','mm','varon 0 &nbsp;- &nbsp;15 &nbsp; &nbsp; &nbsp;mujer 0 &nbsp;- &nbsp;20','',NULL,NULL,3,'2015-07-10 00:01:18','2015-07-10 00:01:18',5),(6,'ml','mll','<p>prueba 111</p>\r\n','',NULL,NULL,5,'2015-09-07 21:00:51','2015-09-07 21:00:51',0);
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failed_attempts` int(11) DEFAULT '0',
  `unlock_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `authentication_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cellular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `especiality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `specialty_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_username` (`username`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`),
  UNIQUE KEY `index_users_on_unlock_token` (`unlock_token`),
  UNIQUE KEY `index_users_on_authentication_token` (`authentication_token`),
  KEY `index_users_on_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@laboratoriokolping.com','$2a$10$Kh81AGNzh17A5HnPfrhtlujlypfbpzeRHjQ0oHAIIwzaKfKlSOc2i',NULL,NULL,NULL,32,'2015-09-08 02:14:09','2015-09-07 22:14:45','161.22.132.235','200.87.106.102',NULL,NULL,NULL,NULL,0,NULL,NULL,'jkkp2FZ5MA9pELyqJVCr','2015-06-22 19:28:08','2015-09-08 02:14:09','admin','admin','','','','','',NULL,'','Darth-Vader.jpg','admin',NULL,NULL,NULL),(3,'joseluiszamorag@gmail.com','$2a$10$RQl0ElS5AR4W6RnkYi6sa.eMuQfnHt//4STVNx610N7bOJ0wEcNVi',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'izdtyseLmQx5SHvQmjbX','2015-07-11 16:27:53','2015-07-11 16:27:53','jzamora',NULL,'jose luis','zamora','av/ N galindo #1172, z El Kenko, El Alto','79511810','79511810','1985-07-28','','9398_10202264478446294_481194706_n.jpg','patient',NULL,NULL,NULL),(4,'yhoviym@gmail.com','$2a$10$ZUw2hrfu1b5xfmhCG1ZhtuPl3hOO8c9p/zCtY5UhX8BSqshcbq7CS',NULL,NULL,NULL,2,'2015-07-30 22:38:51','2015-07-30 22:31:32','186.2.56.111','186.2.56.111',NULL,NULL,NULL,NULL,0,NULL,NULL,'iJqiX8jv4AfTZa8PaebS','2015-07-30 22:30:10','2015-07-30 22:38:51','Yhovana Yanarico Medrano',NULL,'Yhovana ','Yanarico Medrano','','','79670773',NULL,'DRA. JEFA DE LABORATORIO SAN SEBASTIAN',NULL,'laboratory_staff',NULL,NULL,NULL),(5,'','$2a$10$rL82ADSJFZrIRoHkzUhvk.M2HvlI.QT9pcK1.AVAzKHcELYoqBHZC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'YGaqs1K3rfykKVzTfMrr','2015-08-04 03:14:04','2015-08-04 03:14:04','Wilfredo Tancara Vargas',NULL,'Dr. Wilfredo','Tancara Vargas','','','',NULL,'Medico de Emergencias',NULL,'medical',NULL,2,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-07 22:20:35
