-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: crm
-- ------------------------------------------------------
-- Server version	10.11.4-MariaDB-1~deb12u1

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
-- Table structure for table `coming_work_employees`
--

DROP TABLE IF EXISTS `coming_work_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coming_work_employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coming_work_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coming_work_employees_coming_work_id_foreign` (`coming_work_id`),
  KEY `coming_work_employees_employee_id_foreign` (`employee_id`),
  CONSTRAINT `coming_work_employees_coming_work_id_foreign` FOREIGN KEY (`coming_work_id`) REFERENCES `coming_works` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coming_work_employees_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coming_work_employees`
--

LOCK TABLES `coming_work_employees` WRITE;
/*!40000 ALTER TABLE `coming_work_employees` DISABLE KEYS */;
INSERT INTO `coming_work_employees` VALUES
(1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `coming_work_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coming_work_projects`
--

DROP TABLE IF EXISTS `coming_work_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coming_work_projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coming_work_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coming_work_projects_coming_work_id_foreign` (`coming_work_id`),
  KEY `coming_work_projects_project_id_foreign` (`project_id`),
  CONSTRAINT `coming_work_projects_coming_work_id_foreign` FOREIGN KEY (`coming_work_id`) REFERENCES `coming_works` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coming_work_projects_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coming_work_projects`
--

LOCK TABLES `coming_work_projects` WRITE;
/*!40000 ALTER TABLE `coming_work_projects` DISABLE KEYS */;
INSERT INTO `coming_work_projects` VALUES
(1,1,3,NULL,NULL);
/*!40000 ALTER TABLE `coming_work_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coming_work_tasks`
--

DROP TABLE IF EXISTS `coming_work_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coming_work_tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coming_work_id` bigint(20) unsigned NOT NULL,
  `task_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coming_work_tasks_coming_work_id_foreign` (`coming_work_id`),
  KEY `coming_work_tasks_task_id_foreign` (`task_id`),
  CONSTRAINT `coming_work_tasks_coming_work_id_foreign` FOREIGN KEY (`coming_work_id`) REFERENCES `coming_works` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coming_work_tasks_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coming_work_tasks`
--

LOCK TABLES `coming_work_tasks` WRITE;
/*!40000 ALTER TABLE `coming_work_tasks` DISABLE KEYS */;
INSERT INTO `coming_work_tasks` VALUES
(1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `coming_work_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coming_work_types`
--

DROP TABLE IF EXISTS `coming_work_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coming_work_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coming_work_types`
--

LOCK TABLES `coming_work_types` WRITE;
/*!40000 ALTER TABLE `coming_work_types` DISABLE KEYS */;
INSERT INTO `coming_work_types` VALUES
(1,'Work on the project','2024-01-16 21:34:04','2024-01-16 21:34:04'),
(2,'Communication','2024-01-16 21:34:22','2024-01-16 21:34:22'),
(3,'Management','2024-01-16 21:34:36','2024-01-16 21:34:36'),
(4,'Marketing','2024-01-16 21:34:48','2024-01-16 21:34:48'),
(5,'Schop','2024-01-16 21:34:58','2024-01-16 21:34:58'),
(6,'meeting','2024-01-16 21:36:33','2024-01-16 21:36:33'),
(7,'Others','2024-01-16 21:36:59','2024-01-16 21:36:59');
/*!40000 ALTER TABLE `coming_work_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coming_works`
--

DROP TABLE IF EXISTS `coming_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coming_works` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `from` time NOT NULL,
  `to` time NOT NULL,
  `note` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coming_works`
--

LOCK TABLES `coming_works` WRITE;
/*!40000 ALTER TABLE `coming_works` DISABLE KEYS */;
INSERT INTO `coming_works` VALUES
(1,'Komunikace - naceneni projektu','2024-01-19','08:00:00','11:00:00',NULL,'2024-01-19 13:00:14','2024-01-19 13:00:14');
/*!40000 ALTER TABLE `coming_works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `www` varchar(255) DEFAULT NULL,
  `IC` varchar(255) NOT NULL,
  `DIC` varchar(255) DEFAULT NULL,
  `subscriber` tinyint(1) NOT NULL DEFAULT 0,
  `supplier` tinyint(1) NOT NULL DEFAULT 0,
  `competition` tinyint(1) NOT NULL DEFAULT 0,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `note` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contact_id` bigint(20) unsigned DEFAULT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_ic_unique` (`IC`),
  KEY `companies_contact_id_foreign` (`contact_id`),
  KEY `companies_project_id_foreign` (`project_id`),
  CONSTRAINT `companies_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `companies_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES
(1,'Nabah Solutions s.r.o.','605 776 170','info@nabah.cz',NULL,'05832144','CZ05832144',0,0,0,'Schweitzerova 798/99a ','Olomouc','77900','Olomoucky kraj','Czech Republic',NULL,'2024-01-16 20:08:18','2024-01-16 20:08:18',NULL,NULL),
(2,'Millenium International s.r.o','732127410','info@binapi.tech',NULL,'02239221',NULL,0,0,0,'Kosicka 63/30','Praha','10100','Hlavni mesto Praha','Czech Republic',NULL,'2024-01-16 20:09:42','2024-01-16 20:09:42',NULL,NULL),
(3,'Ondrej Zelina','732127410','ondrej.web@gmail.com',NULL,'02453681',NULL,0,0,0,'Horni namesti 3','Vsetin','75001','Zlinsky kraj','Czech Republic',NULL,'2024-01-16 20:10:29','2024-01-16 20:10:29',NULL,NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_companies`
--

DROP TABLE IF EXISTS `contact_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `contact_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_companies_company_id_foreign` (`company_id`),
  KEY `contact_companies_contact_id_foreign` (`contact_id`),
  CONSTRAINT `contact_companies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contact_companies_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_companies`
--

LOCK TABLES `contact_companies` WRITE;
/*!40000 ALTER TABLE `contact_companies` DISABLE KEYS */;
INSERT INTO `contact_companies` VALUES
(1,1,1),
(2,1,2),
(3,2,3),
(4,3,3);
/*!40000 ALTER TABLE `contact_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT 0,
  `landline` int(11) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `next_phone` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `note` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contacts_email_unique` (`email`),
  KEY `contacts_department_id_foreign` (`department_id`),
  KEY `contacts_company_id_foreign` (`company_id`),
  CONSTRAINT `contacts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contacts_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES
(1,NULL,NULL,'Lukas Haban','info@nabah.cz',0,NULL,605776164,NULL,'Schweitzerova 798/99a','Olomouc','77900','Olomoucky kraj','Czech republic',NULL,'2024-01-16 20:06:05','2024-01-16 20:06:05'),
(2,NULL,NULL,'Aneta Kabelikova','kablikova@nabah.cz',0,NULL,605776170,NULL,'Schweitzerova 798/99a','Olomouc','77900','Olomoucky kraj','Czech republic',NULL,'2024-01-16 20:07:22','2024-01-16 20:07:22'),
(3,1,NULL,'Ondrej Zelina','ondrej.web@gmail.com',0,NULL,732127410,NULL,'Halenkov 655','Halenkov','75603','Zlinsky kraj','Czech republic',NULL,'2024-01-16 20:09:19','2024-01-16 21:59:47');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES
(1,'PHP Developer','2024-01-16 20:11:26','2024-01-16 20:11:26');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_types`
--

DROP TABLE IF EXISTS `document_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_types`
--

LOCK TABLES `document_types` WRITE;
/*!40000 ALTER TABLE `document_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `document_type_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `contact_id` bigint(20) unsigned NOT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_suffix` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_document_type_id_foreign` (`document_type_id`),
  KEY `documents_project_id_foreign` (`project_id`),
  KEY `documents_company_id_foreign` (`company_id`),
  KEY `documents_contact_id_foreign` (`contact_id`),
  CONSTRAINT `documents_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `documents_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `documents_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_tasks`
--

DROP TABLE IF EXISTS `employee_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_tasks_task_id_foreign` (`task_id`),
  KEY `employee_tasks_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_tasks_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_tasks_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_tasks`
--

LOCK TABLES `employee_tasks` WRITE;
/*!40000 ALTER TABLE `employee_tasks` DISABLE KEYS */;
INSERT INTO `employee_tasks` VALUES
(1,1,1,NULL,NULL),
(3,2,2,NULL,NULL);
/*!40000 ALTER TABLE `employee_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT 0,
  `landline` int(11) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `next_phone` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `note` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`),
  KEY `employees_department_id_foreign` (`department_id`),
  CONSTRAINT `employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES
(1,1,'Pavel Burda','paul@gmail.com',0,NULL,602543698,NULL,'Halenkov','Halenkov','75603','Zlinsky kraj','Czech republic',NULL,'2024-01-16 20:11:55','2024-01-16 20:11:55'),
(2,1,'Ondrej Zelina','ondrej.web@gmail.com',0,NULL,732127410,NULL,'Halenkov 655','Halenkov','75603','Zlinsky kraj','Czech republic',NULL,'2024-01-16 21:07:41','2024-01-16 21:07:41');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2024_01_12_154833_create_companies_table',1),
(6,'2024_01_12_155527_create_document_types_table',1),
(7,'2024_01_12_160048_create_departments_table',1),
(8,'2024_01_12_160249_create_project_types_table',1),
(9,'2024_01_12_161129_create_contacts_table',1),
(10,'2024_01_12_161402_create_projects_table',1),
(11,'2024_01_12_161542_create_documents_table',1),
(12,'2024_01_12_162800_create_tasks_table',1),
(13,'2024_01_12_202959_create_tests_table',1),
(14,'2024_01_12_212222_add_contact_id_to_companies',1),
(15,'2024_01_14_180039_create_employees_table',1),
(16,'2024_01_15_150607_add_column_project_id',1),
(17,'2024_01_15_154032_add_employee_id',1),
(18,'2024_01_15_193753_create_contact_companies_table',1),
(19,'2024_01_15_220218_create_project_companies_table',1),
(20,'2024_01_15_230717_create_project_contacts_table',1),
(21,'2024_01_16_195340_create_task_companies_table',1),
(22,'2024_01_16_204733_create_task_projects_table',1),
(23,'2024_01_16_212750_create_task_contacts_table',1),
(24,'2024_01_16_214900_create_employee_tasks_table',1),
(25,'2024_01_17_002804_create_attendance_types_table',1),
(26,'2024_01_18_210849_create_coming_works_table',1),
(27,'2024_01_18_210956_create_coming_wor_projects_table',1),
(28,'2024_01_18_214534_create_coming_attendance_types_table',2),
(29,'2024_01_19_115724_create_coming_work_types_table',3),
(30,'2024_01_19_134930_create_coming_works_table',4),
(31,'2024_01_19_135239_create_coming_work_projects_table',4),
(32,'2024_01_19_140253_create_coming_work_tasks_table',5),
(33,'2024_01_19_153119_create_coming_work_employees_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_companies`
--

DROP TABLE IF EXISTS `project_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_companies`
--

LOCK TABLES `project_companies` WRITE;
/*!40000 ALTER TABLE `project_companies` DISABLE KEYS */;
INSERT INTO `project_companies` VALUES
(1,1,1,NULL,NULL),
(2,1,2,NULL,NULL),
(3,2,3,NULL,NULL);
/*!40000 ALTER TABLE `project_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_contacts`
--

DROP TABLE IF EXISTS `project_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `contact_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_contacts_project_id_foreign` (`project_id`),
  KEY `project_contacts_contact_id_foreign` (`contact_id`),
  CONSTRAINT `project_contacts_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_contacts_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_contacts`
--

LOCK TABLES `project_contacts` WRITE;
/*!40000 ALTER TABLE `project_contacts` DISABLE KEYS */;
INSERT INTO `project_contacts` VALUES
(1,1,2,NULL,NULL),
(2,2,2,NULL,NULL),
(3,3,3,NULL,NULL);
/*!40000 ALTER TABLE `project_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_types`
--

DROP TABLE IF EXISTS `project_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_types`
--

LOCK TABLES `project_types` WRITE;
/*!40000 ALTER TABLE `project_types` DISABLE KEYS */;
INSERT INTO `project_types` VALUES
(1,'PHP Contract','2024-01-16 19:12:48','2024-01-16 19:12:48');
/*!40000 ALTER TABLE `project_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `contact_id` bigint(20) unsigned NOT NULL,
  `project_types_id` bigint(20) unsigned NOT NULL,
  `start_project` date NOT NULL,
  `planned_project_end` date NOT NULL,
  `end_project` date DEFAULT NULL,
  `finish_price` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_company_id_foreign` (`company_id`),
  KEY `projects_contact_id_foreign` (`contact_id`),
  KEY `projects_project_types_id_foreign` (`project_types_id`),
  KEY `projects_employee_id_foreign` (`employee_id`),
  CONSTRAINT `projects_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_project_types_id_foreign` FOREIGN KEY (`project_types_id`) REFERENCES `project_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES
(1,'Tvorba crm na zakazku Nabah Solutions',1,2,1,'2024-01-01','2024-01-31',NULL,NULL,NULL,'2024-01-16 19:12:51','2024-01-16 19:23:58',1),
(2,'Tvorba eshopu',1,2,1,'2024-01-01','2024-01-31',NULL,NULL,NULL,'2024-01-16 19:13:13','2024-01-16 19:13:13',1),
(3,'Tvorba crm na zakazku Millenium International s.r.o.',2,3,1,'2024-01-01','2024-01-31',NULL,NULL,NULL,'2024-01-16 19:13:35','2024-01-16 19:24:22',1);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_coming_works`
--

DROP TABLE IF EXISTS `task_coming_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_coming_works` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coming_work_id` bigint(20) unsigned NOT NULL,
  `task_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_coming_works`
--

LOCK TABLES `task_coming_works` WRITE;
/*!40000 ALTER TABLE `task_coming_works` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_coming_works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_companies`
--

DROP TABLE IF EXISTS `task_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_companies_task_id_foreign` (`task_id`),
  CONSTRAINT `task_companies_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_companies`
--

LOCK TABLES `task_companies` WRITE;
/*!40000 ALTER TABLE `task_companies` DISABLE KEYS */;
INSERT INTO `task_companies` VALUES
(1,1,2,NULL,NULL);
/*!40000 ALTER TABLE `task_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_contacts`
--

DROP TABLE IF EXISTS `task_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `contact_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_contacts_task_id_foreign` (`task_id`),
  KEY `task_contacts_contact_id_foreign` (`contact_id`),
  CONSTRAINT `task_contacts_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_contacts_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_contacts`
--

LOCK TABLES `task_contacts` WRITE;
/*!40000 ALTER TABLE `task_contacts` DISABLE KEYS */;
INSERT INTO `task_contacts` VALUES
(1,1,3,NULL,NULL),
(2,2,3,NULL,NULL);
/*!40000 ALTER TABLE `task_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_projects`
--

DROP TABLE IF EXISTS `task_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_projects_task_id_foreign` (`task_id`),
  KEY `task_projects_project_id_foreign` (`project_id`),
  CONSTRAINT `task_projects_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_projects_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_projects`
--

LOCK TABLES `task_projects` WRITE;
/*!40000 ALTER TABLE `task_projects` DISABLE KEYS */;
INSERT INTO `task_projects` VALUES
(2,1,3,NULL,NULL);
/*!40000 ALTER TABLE `task_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `solver` varchar(255) NOT NULL,
  `start_task` date NOT NULL,
  `end_task` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES
(1,'Naceneni projektu - tvorba crm na zakazku','1','2024-01-16','2024-01-16','2024-01-16 19:16:10','2024-01-16 19:57:33'),
(2,'Test task','2','2024-01-16','2024-01-16','2024-01-16 19:42:53','2024-01-16 20:07:50');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Ondrej Zelina','ondrej.web@gmail.com',NULL,'$2y$12$EBqzlVTqezjy.bBo8myV6ukP23WAVLYc6aXlhaIRV22AKfDBhN/zu',NULL,'2024-01-17 00:23:28','2024-01-17 00:23:28');
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

-- Dump completed on 2024-01-19 18:16:05
