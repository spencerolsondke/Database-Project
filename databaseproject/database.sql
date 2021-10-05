-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: pizzadb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'8DWBUFC'),(2,'UB10OIE'),(3,'J5LQ8M8'),(4,'KITMKUC'),(5,'IGJHDY2');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add area',1,'add_area'),(2,'Can change area',1,'change_area'),(3,'Can delete area',1,'delete_area'),(4,'Can view area',1,'view_area'),(5,'Can add customer',2,'add_customer'),(6,'Can change customer',2,'change_customer'),(7,'Can delete customer',2,'delete_customer'),(8,'Can view customer',2,'view_customer'),(9,'Can add orders',3,'add_orders'),(10,'Can change orders',3,'change_orders'),(11,'Can delete orders',3,'delete_orders'),(12,'Can view orders',3,'view_orders'),(13,'Can add pizza',4,'add_pizza'),(14,'Can change pizza',4,'change_pizza'),(15,'Can delete pizza',4,'delete_pizza'),(16,'Can view pizza',4,'view_pizza'),(17,'Can add product',5,'add_product'),(18,'Can change product',5,'change_product'),(19,'Can delete product',5,'delete_product'),(20,'Can view product',5,'view_product'),(21,'Can add restaurant',6,'add_restaurant'),(22,'Can change restaurant',6,'change_restaurant'),(23,'Can delete restaurant',6,'delete_restaurant'),(24,'Can view restaurant',6,'view_restaurant'),(25,'Can add toppings',7,'add_toppings'),(26,'Can change toppings',7,'change_toppings'),(27,'Can delete toppings',7,'delete_toppings'),(28,'Can view toppings',7,'view_toppings'),(29,'Can add toppings to pizza',8,'add_toppingstopizza'),(30,'Can change toppings to pizza',8,'change_toppingstopizza'),(31,'Can delete toppings to pizza',8,'delete_toppingstopizza'),(32,'Can view toppings to pizza',8,'view_toppingstopizza'),(33,'Can add order to product',9,'add_ordertoproduct'),(34,'Can change order to product',9,'change_ordertoproduct'),(35,'Can delete order to product',9,'delete_ordertoproduct'),(36,'Can view order to product',9,'view_ordertoproduct'),(37,'Can add drink',10,'add_drink'),(38,'Can change drink',10,'change_drink'),(39,'Can delete drink',10,'delete_drink'),(40,'Can view drink',10,'view_drink'),(41,'Can add dessert',11,'add_dessert'),(42,'Can change dessert',11,'change_dessert'),(43,'Can delete dessert',11,'delete_dessert'),(44,'Can view dessert',11,'view_dessert'),(45,'Can add delivery person',12,'add_deliveryperson'),(46,'Can change delivery person',12,'change_deliveryperson'),(47,'Can delete delivery person',12,'delete_deliveryperson'),(48,'Can view delivery person',12,'view_deliveryperson'),(49,'Can add log entry',13,'add_logentry'),(50,'Can change log entry',13,'change_logentry'),(51,'Can delete log entry',13,'delete_logentry'),(52,'Can view log entry',13,'view_logentry'),(53,'Can add permission',14,'add_permission'),(54,'Can change permission',14,'change_permission'),(55,'Can delete permission',14,'delete_permission'),(56,'Can view permission',14,'view_permission'),(57,'Can add group',15,'add_group'),(58,'Can change group',15,'change_group'),(59,'Can delete group',15,'delete_group'),(60,'Can view group',15,'view_group'),(61,'Can add user',16,'add_user'),(62,'Can change user',16,'change_user'),(63,'Can delete user',16,'delete_user'),(64,'Can view user',16,'view_user'),(65,'Can add content type',17,'add_contenttype'),(66,'Can change content type',17,'change_contenttype'),(67,'Can delete content type',17,'delete_contenttype'),(68,'Can view content type',17,'view_contenttype'),(69,'Can add session',18,'add_session'),(70,'Can change session',18,'change_session'),(71,'Can delete session',18,'delete_session'),(72,'Can view session',18,'view_session'),(73,'Can add site',19,'add_site'),(74,'Can change site',19,'change_site'),(75,'Can delete site',19,'delete_site'),(76,'Can view site',19,'view_site');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$lDuAOI2YGtWI1Un9XjMcI3$w5SfuArravP2kqFe3dTuqlwHzLEuXQYlhStxAFx/Mfo=','2021-10-05 12:39:07.228778',1,'admin','','','',1,1,'2021-10-05 12:38:49.245824');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `area_id` int DEFAULT NULL,
  `address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_person`
--

DROP TABLE IF EXISTS `delivery_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area_id` int DEFAULT NULL,
  `availibility` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `delivery_person_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_person`
--

LOCK TABLES `delivery_person` WRITE;
/*!40000 ALTER TABLE `delivery_person` DISABLE KEYS */;
INSERT INTO `delivery_person` VALUES (1,'Spencer Olson',1,1),(2,'Adrian Dammers',1,1),(3,'Kai Krink',1,1),(4,'Aurélien Bertrand',1,1),(5,'Vincent Claessens',2,1),(6,'Alexia Collignon',2,1),(7,'Robert Florea',2,1),(8,'Mehdi Layachi',2,1),(9,'Gyongyosi Zsombor',3,1),(10,'Horvath Daniel',3,1),(11,'Hasper Dominika',3,1),(12,'Kretz Zsombor',3,1),(13,'Tom Pepels',4,1),(14,'Christof Seiler',4,1),(15,'Matus Mihalak',4,1),(16,'Otti D\'Huys',4,1),(17,'Donald Trump',5,1),(18,'Barack Obama',5,1),(19,'Joe Biden',5,1),(20,'Bill Clinton',5,1);
/*!40000 ALTER TABLE `delivery_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dessert`
--

DROP TABLE IF EXISTS `dessert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dessert` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `dessert_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dessert`
--

LOCK TABLES `dessert` WRITE;
/*!40000 ALTER TABLE `dessert` DISABLE KEYS */;
INSERT INTO `dessert` VALUES (1,24,'Vanilla Ice Cream'),(2,23,'Chocolate Ice Cream'),(3,22,'Tiramisu'),(4,21,'Chocolate Mousse');
/*!40000 ALTER TABLE `dessert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-10-05 13:06:52.861471','15','Al Pesto',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(2,'2021-10-05 13:08:13.258179','14','Crudo',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(3,'2021-10-05 13:08:36.895429','13','Tonno',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(4,'2021-10-05 13:09:33.142819','12','Frutti di Mare',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(5,'2021-10-05 13:10:31.905933','14','Crudo',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(6,'2021-10-05 13:12:04.668413','11','Hawaii',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(7,'2021-10-05 13:13:01.487939','10','Melanzane',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(8,'2021-10-05 13:14:12.593538','9','Diavola',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(9,'2021-10-05 13:15:10.687676','8','Napoletana',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(10,'2021-10-05 13:15:36.171759','7','Margherita',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(11,'2021-10-05 13:16:18.577163','6','Calzone',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(12,'2021-10-05 13:16:40.837875','5','Caprese',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(13,'2021-10-05 13:17:22.101194','4','Quattro fromaggi',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(14,'2021-10-05 13:18:01.974205','3','Capricciosa',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(15,'2021-10-05 13:18:34.917095','2','Detroit-Style',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(16,'2021-10-05 13:19:03.712649','1','Prosciutto e funghi',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(17,'2021-10-05 13:20:13.694578','6','Calzone',2,'[{\"changed\": {\"fields\": [\"Toppings\"]}}]',4,1),(18,'2021-10-05 18:40:58.571306','1','Product object (1)',1,'[{\"added\": {}}]',5,1),(19,'2021-10-05 18:41:09.600750','15','Al Pesto',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',4,1),(20,'2021-10-05 18:44:53.103962','2','Product object (2)',1,'[{\"added\": {}}]',5,1),(21,'2021-10-05 18:44:54.812321','14','Crudo',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',4,1),(22,'2021-10-05 18:45:01.632086','3','Product object (3)',1,'[{\"added\": {}}]',5,1),(23,'2021-10-05 18:45:02.461630','13','Tonno',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',4,1),(24,'2021-10-05 18:45:09.440289','4','Product object (4)',1,'[{\"added\": {}}]',5,1),(25,'2021-10-05 18:45:10.669692','12','Frutti di Mare',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',4,1),(26,'2021-10-05 18:45:17.529773','5','Product object (5)',1,'[{\"added\": {}}]',5,1),(27,'2021-10-05 18:45:18.321795','11','Hawaii',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',4,1),(28,'2021-10-05 18:45:28.999058','6','Product object (6)',1,'[{\"added\": {}}]',5,1),(29,'2021-10-05 18:45:30.331135','10','Melanzane',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',4,1),(30,'2021-10-05 18:45:36.392516','7','Product object (7)',1,'[{\"added\": {}}]',5,1),(31,'2021-10-05 18:45:37.393132','9','Diavola',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',4,1),(32,'2021-10-05 18:45:51.822110','8','Product object (8)',1,'[{\"added\": {}}]',5,1),(33,'2021-10-05 18:45:53.264399','8','Napoletana',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',4,1),(34,'2021-10-05 18:46:00.486130','9','Product object (9)',1,'[{\"added\": {}}]',5,1),(35,'2021-10-05 18:46:09.430868','7','Margherita',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',4,1),(36,'2021-10-05 18:46:16.293555','10','Product object (10)',1,'[{\"added\": {}}]',5,1),(37,'2021-10-05 18:46:18.145589','6','Calzone',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',4,1),(38,'2021-10-05 18:46:25.606505','11','Product object (11)',1,'[{\"added\": {}}]',5,1),(39,'2021-10-05 18:46:26.849986','5','Caprese',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',4,1),(40,'2021-10-05 18:46:33.667321','12','Product object (12)',1,'[{\"added\": {}}]',5,1),(41,'2021-10-05 18:46:35.511791','4','Quattro fromaggi',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',4,1),(42,'2021-10-05 18:46:44.784357','13','Product object (13)',1,'[{\"added\": {}}]',5,1),(43,'2021-10-05 18:46:45.815096','3','Capricciosa',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',4,1),(44,'2021-10-05 18:46:52.305791','14','Product object (14)',1,'[{\"added\": {}}]',5,1),(45,'2021-10-05 18:46:53.426279','2','Detroit-Style',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',4,1),(46,'2021-10-05 18:46:59.637381','15','Product object (15)',1,'[{\"added\": {}}]',5,1),(47,'2021-10-05 18:47:00.645154','1','Prosciutto e funghi',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',4,1),(48,'2021-10-05 18:47:56.699496','16','Product object (16)',1,'[{\"added\": {}}]',5,1),(49,'2021-10-05 18:47:57.988581','5','Drink object (5)',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',10,1),(50,'2021-10-05 18:48:06.898700','17','Product object (17)',1,'[{\"added\": {}}]',5,1),(51,'2021-10-05 18:48:07.886376','4','Drink object (4)',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',10,1),(52,'2021-10-05 18:48:16.595360','18','Product object (18)',1,'[{\"added\": {}}]',5,1),(53,'2021-10-05 18:48:17.547519','3','Drink object (3)',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',10,1),(54,'2021-10-05 18:48:25.784360','19','Product object (19)',1,'[{\"added\": {}}]',5,1),(55,'2021-10-05 18:48:26.518326','2','Drink object (2)',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',10,1),(56,'2021-10-05 18:48:33.466844','20','Product object (20)',1,'[{\"added\": {}}]',5,1),(57,'2021-10-05 18:48:34.523084','1','Drink object (1)',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',10,1),(58,'2021-10-05 18:48:48.061984','21','Product object (21)',1,'[{\"added\": {}}]',5,1),(59,'2021-10-05 18:48:49.088695','4','Dessert object (4)',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',11,1),(60,'2021-10-05 18:48:57.377859','22','Product object (22)',1,'[{\"added\": {}}]',5,1),(61,'2021-10-05 18:48:58.334122','3','Dessert object (3)',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',11,1),(62,'2021-10-05 18:49:06.470782','23','Product object (23)',1,'[{\"added\": {}}]',5,1),(63,'2021-10-05 18:49:07.533714','2','Dessert object (2)',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',11,1),(64,'2021-10-05 18:49:18.178364','24','Product object (24)',1,'[{\"added\": {}}]',5,1),(65,'2021-10-05 18:49:24.646112','24','Product object (24)',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',5,1),(66,'2021-10-05 18:49:25.902089','1','Dessert object (1)',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',11,1),(67,'2021-10-05 18:52:27.037403','1','Area object (1)',1,'[{\"added\": {}}]',1,1),(68,'2021-10-05 18:52:33.859214','2','Area object (2)',1,'[{\"added\": {}}]',1,1),(69,'2021-10-05 18:52:39.954538','3','Area object (3)',1,'[{\"added\": {}}]',1,1),(70,'2021-10-05 18:52:46.193006','4','Area object (4)',1,'[{\"added\": {}}]',1,1),(71,'2021-10-05 18:52:52.297228','5','Area object (5)',1,'[{\"added\": {}}]',1,1),(72,'2021-10-05 19:00:12.813185','1','DeliveryPerson object (1)',1,'[{\"added\": {}}]',12,1),(73,'2021-10-05 19:00:24.564229','2','DeliveryPerson object (2)',1,'[{\"added\": {}}]',12,1),(74,'2021-10-05 19:00:38.644624','3','DeliveryPerson object (3)',1,'[{\"added\": {}}]',12,1),(75,'2021-10-05 19:00:49.069211','4','DeliveryPerson object (4)',1,'[{\"added\": {}}]',12,1),(76,'2021-10-05 19:01:16.010863','5','DeliveryPerson object (5)',1,'[{\"added\": {}}]',12,1),(77,'2021-10-05 19:01:26.144003','6','DeliveryPerson object (6)',1,'[{\"added\": {}}]',12,1),(78,'2021-10-05 19:01:36.735388','7','DeliveryPerson object (7)',1,'[{\"added\": {}}]',12,1),(79,'2021-10-05 19:01:48.227988','8','DeliveryPerson object (8)',1,'[{\"added\": {}}]',12,1),(80,'2021-10-05 19:02:13.076473','9','DeliveryPerson object (9)',1,'[{\"added\": {}}]',12,1),(81,'2021-10-05 19:02:22.920428','10','DeliveryPerson object (10)',1,'[{\"added\": {}}]',12,1),(82,'2021-10-05 19:02:31.905043','11','DeliveryPerson object (11)',1,'[{\"added\": {}}]',12,1),(83,'2021-10-05 19:02:40.135176','12','DeliveryPerson object (12)',1,'[{\"added\": {}}]',12,1),(84,'2021-10-05 19:03:18.615744','13','DeliveryPerson object (13)',1,'[{\"added\": {}}]',12,1),(85,'2021-10-05 19:03:30.489037','14','DeliveryPerson object (14)',1,'[{\"added\": {}}]',12,1),(86,'2021-10-05 19:03:48.748969','15','DeliveryPerson object (15)',1,'[{\"added\": {}}]',12,1),(87,'2021-10-05 19:04:03.335757','16','DeliveryPerson object (16)',1,'[{\"added\": {}}]',12,1),(88,'2021-10-05 19:04:20.304964','17','DeliveryPerson object (17)',1,'[{\"added\": {}}]',12,1),(89,'2021-10-05 19:04:34.446582','18','DeliveryPerson object (18)',1,'[{\"added\": {}}]',12,1),(90,'2021-10-05 19:04:47.051293','19','DeliveryPerson object (19)',1,'[{\"added\": {}}]',12,1),(91,'2021-10-05 19:04:55.771424','20','DeliveryPerson object (20)',1,'[{\"added\": {}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (13,'admin','logentry'),(15,'auth','group'),(14,'auth','permission'),(16,'auth','user'),(17,'contenttypes','contenttype'),(1,'index','area'),(2,'index','customer'),(12,'index','deliveryperson'),(11,'index','dessert'),(10,'index','drink'),(3,'index','orders'),(9,'index','ordertoproduct'),(4,'index','pizza'),(5,'index','product'),(6,'index','restaurant'),(7,'index','toppings'),(8,'index','toppingstopizza'),(18,'sessions','session'),(19,'sites','site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-10-01 15:15:34.283559'),(2,'auth','0001_initial','2021-10-01 15:15:34.606597'),(3,'admin','0001_initial','2021-10-01 15:15:34.707498'),(4,'admin','0002_logentry_remove_auto_add','2021-10-01 15:15:34.729286'),(5,'admin','0003_logentry_add_action_flag_choices','2021-10-01 15:15:34.750087'),(6,'contenttypes','0002_remove_content_type_name','2021-10-01 15:15:34.836351'),(7,'auth','0002_alter_permission_name_max_length','2021-10-01 15:15:34.884460'),(8,'auth','0003_alter_user_email_max_length','2021-10-01 15:15:34.919833'),(9,'auth','0004_alter_user_username_opts','2021-10-01 15:15:34.931354'),(10,'auth','0005_alter_user_last_login_null','2021-10-01 15:15:34.991864'),(11,'auth','0006_require_contenttypes_0002','2021-10-01 15:15:34.994966'),(12,'auth','0007_alter_validators_add_error_messages','2021-10-01 15:15:35.017858'),(13,'auth','0008_alter_user_username_max_length','2021-10-01 15:15:35.066176'),(14,'auth','0009_alter_user_last_name_max_length','2021-10-01 15:15:35.116657'),(15,'auth','0010_alter_group_name_max_length','2021-10-01 15:15:35.146988'),(16,'auth','0011_update_proxy_permissions','2021-10-01 15:15:35.162200'),(17,'auth','0012_alter_user_first_name_max_length','2021-10-01 15:15:35.213281'),(18,'index','0001_initial','2021-10-01 15:15:35.283233'),(19,'sessions','0001_initial','2021-10-01 15:15:35.309172'),(20,'sites','0001_initial','2021-10-01 15:15:35.332438'),(21,'sites','0002_alter_domain_unique','2021-10-01 15:15:35.350070'),(22,'index','0002_toppings_name','2021-10-01 15:17:01.095320'),(23,'index','0003_auto_20211001_1718','2021-10-01 15:18:58.567739'),(24,'index','0004_toppings_price','2021-10-05 12:36:17.015035');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ad5o3qvxr8r1emlstby011op7ugww9p9','.eJxVjDsOwjAQBe_iGllexz9R0nMGa-1d4wBypDipIu5OIqWA9s282UTEdalx7TzHkcRVgLj8bgnzi9sB6IntMck8tWUekzwUedIu7xPx-3a6f4GKve5va5LhAOh0QJMHB954DM7ZQsVlD25PcfaoVCbQRiVlirV6IIJgOZH4fAHZJTfw:1mXjit:X-INowbpsFxhAG4iSivNtCk4GRV7azxD0KdWnzqJZBY','2021-10-19 12:39:07.233523');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drink`
--

DROP TABLE IF EXISTS `drink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drink` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `drink_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drink`
--

LOCK TABLES `drink` WRITE;
/*!40000 ALTER TABLE `drink` DISABLE KEYS */;
INSERT INTO `drink` VALUES (1,20,'Fanta'),(2,19,'Cola'),(3,18,'Mineral water'),(4,17,'Jupiler'),(5,16,'Sparkling water');
/*!40000 ALTER TABLE `drink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orders_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_products_orders_id_product_id_73a04287_uniq` (`orders_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `pizza_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES (1,15,'Prosciutto e funghi'),(2,14,'Detroit-Style'),(3,13,'Capricciosa'),(4,12,'Quattro fromaggi'),(5,11,'Caprese'),(6,10,'Calzone'),(7,9,'Margherita'),(8,8,'Napoletana'),(9,7,'Diavola'),(10,6,'Melanzane'),(11,5,'Hawaii'),(12,4,'Frutti di Mare'),(13,3,'Tonno'),(14,2,'Crudo'),(15,1,'Al Pesto');
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_toppings`
--

DROP TABLE IF EXISTS `pizza_toppings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_toppings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pizza_id` bigint NOT NULL,
  `toppings_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_toppings`
--

LOCK TABLES `pizza_toppings` WRITE;
/*!40000 ALTER TABLE `pizza_toppings` DISABLE KEYS */;
INSERT INTO `pizza_toppings` VALUES (1,15,24),(2,15,2),(6,13,24),(7,13,1),(8,13,22),(9,12,11),(10,12,3),(11,12,22),(12,12,23),(13,14,17),(14,11,24),(15,11,19),(16,11,22),(17,11,7),(18,10,24),(19,10,9),(20,10,17),(21,10,22),(22,9,4),(23,9,6),(24,9,20),(25,9,22),(26,9,24),(27,8,24),(28,8,17),(29,8,21),(30,7,24),(31,7,17),(32,7,21),(37,5,24),(38,5,17),(39,5,21),(40,4,8),(41,4,14),(42,4,15),(43,4,16),(44,4,17),(45,4,21),(46,4,24),(47,3,5),(48,3,6),(49,3,12),(50,3,22),(51,3,24),(52,2,24),(53,2,18),(54,2,22),(55,1,24),(56,1,12),(57,1,13),(58,1,22),(59,6,10);
/*!40000 ALTER TABLE `pizza_toppings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,-1),(2,-1),(3,-1),(4,-1),(5,-1),(6,-1),(7,-1),(8,-1),(9,-1),(10,-1),(11,-1),(12,-1),(13,-1),(14,-1),(15,-1),(16,2.49),(17,3.49),(18,1.99),(19,2.49),(20,2.49),(21,3.15),(22,4.99),(23,3.99),(24,3.79);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toppings`
--

DROP TABLE IF EXISTS `toppings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toppings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vegetarian` tinyint(1) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toppings`
--

LOCK TABLES `toppings` WRITE;
/*!40000 ALTER TABLE `toppings` DISABLE KEYS */;
INSERT INTO `toppings` VALUES (1,0,'Tuna',3.49),(2,1,'Pesto Genovese',1.99),(3,0,'Mussels',5.49),(4,0,'Spicy Salami',3.49),(5,1,'Artichoke',2.99),(6,1,'Olives',0.99),(7,0,'Ham',3.49),(8,1,'Gorgonzola',3.99),(9,1,'Eggplant',1.99),(10,0,'Pork Rinds',3.99),(11,0,'Squid',4.99),(12,1,'Mushrooms',3.49),(13,0,'Prosciutto',3.99),(14,1,'Ricotta',1.99),(15,1,'Fontina',2.99),(16,1,'Grana Padano',1.99),(17,1,'Basilicum',0.99),(18,0,'Salami',3.49),(19,1,'Pineapple',1.99),(20,1,'Pepperoncini',1.99),(21,1,'Cherry Tomatoes',2.99),(22,1,'Tomato Sauce',1.99),(23,0,'Shrimp',4.99),(24,1,'Mozzarella',2.99);
/*!40000 ALTER TABLE `toppings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-05 21:06:00
