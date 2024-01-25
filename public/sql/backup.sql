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
-- Table structure for table `absence_employees`
--

DROP TABLE IF EXISTS `absence_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `absence_employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `absence_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `absence_employees_absence_id_foreign` (`absence_id`),
  KEY `absence_employees_employee_id_foreign` (`employee_id`),
  CONSTRAINT `absence_employees_absence_id_foreign` FOREIGN KEY (`absence_id`) REFERENCES `absences` (`id`) ON DELETE CASCADE,
  CONSTRAINT `absence_employees_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence_employees`
--

LOCK TABLES `absence_employees` WRITE;
/*!40000 ALTER TABLE `absence_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `absence_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `absence_relation_types`
--

DROP TABLE IF EXISTS `absence_relation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `absence_relation_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `absence_id` bigint(20) unsigned NOT NULL,
  `absence_type_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `absence_relation_types_absence_id_foreign` (`absence_id`),
  KEY `absence_relation_types_absence_type_id_foreign` (`absence_type_id`),
  CONSTRAINT `absence_relation_types_absence_id_foreign` FOREIGN KEY (`absence_id`) REFERENCES `absences` (`id`) ON DELETE CASCADE,
  CONSTRAINT `absence_relation_types_absence_type_id_foreign` FOREIGN KEY (`absence_type_id`) REFERENCES `absence_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence_relation_types`
--

LOCK TABLES `absence_relation_types` WRITE;
/*!40000 ALTER TABLE `absence_relation_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `absence_relation_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `absence_types`
--

DROP TABLE IF EXISTS `absence_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `absence_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence_types`
--

LOCK TABLES `absence_types` WRITE;
/*!40000 ALTER TABLE `absence_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `absence_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `absences`
--

DROP TABLE IF EXISTS `absences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `absences` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `finish_date` date NOT NULL,
  `finish_time` time NOT NULL,
  `all_day` tinyint(1) NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absences`
--

LOCK TABLES `absences` WRITE;
/*!40000 ALTER TABLE `absences` DISABLE KEYS */;
/*!40000 ALTER TABLE `absences` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coming_work_employees`
--

LOCK TABLES `coming_work_employees` WRITE;
/*!40000 ALTER TABLE `coming_work_employees` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coming_work_projects`
--

LOCK TABLES `coming_work_projects` WRITE;
/*!40000 ALTER TABLE `coming_work_projects` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coming_work_tasks`
--

LOCK TABLES `coming_work_tasks` WRITE;
/*!40000 ALTER TABLE `coming_work_tasks` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coming_work_types`
--

LOCK TABLES `coming_work_types` WRITE;
/*!40000 ALTER TABLE `coming_work_types` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coming_works`
--

LOCK TABLES `coming_works` WRITE;
/*!40000 ALTER TABLE `coming_works` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_companies`
--

LOCK TABLES `contact_companies` WRITE;
/*!40000 ALTER TABLE `contact_companies` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
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
(1,'PHP Developer','2024-01-16 19:11:26','2024-01-16 19:11:26');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_tasks`
--

LOCK TABLES `employee_tasks` WRITE;
/*!40000 ALTER TABLE `employee_tasks` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES
(1,1,'Pavel Burda','paul@gmail.com',0,NULL,602543698,NULL,'Halenkov','Halenkov','75603','Zlinsky kraj','Czech republic',NULL,'2024-01-16 19:11:55','2024-01-16 19:11:55'),
(2,1,'Ondrej Zelina','ondrej.web@gmail.com',0,NULL,732127410,NULL,'Halenkov 655','Halenkov','75603','Zlinsky kraj','Czech republic',NULL,'2024-01-16 20:07:41','2024-01-16 20:07:41'),
(3,1,'Josef Tkadlec','joseftkadlec@volny.cz',0,571457585,603891025,NULL,'Halenkov 457','Halenkov','75603','Zlinsky kraj','Czech republic',NULL,'2024-01-25 17:23:45','2024-01-25 17:23:45');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_import_rows`
--

DROP TABLE IF EXISTS `failed_import_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_import_rows` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `import_id` bigint(20) unsigned NOT NULL,
  `validation_error` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `failed_import_rows_import_id_foreign` (`import_id`),
  CONSTRAINT `failed_import_rows_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_import_rows`
--

LOCK TABLES `failed_import_rows` WRITE;
/*!40000 ALTER TABLE `failed_import_rows` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_import_rows` ENABLE KEYS */;
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
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `importer` varchar(255) NOT NULL,
  `processed_rows` int(10) unsigned NOT NULL DEFAULT 0,
  `total_rows` int(10) unsigned NOT NULL,
  `successful_rows` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imports_user_id_foreign` (`user_id`),
  CONSTRAINT `imports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
(25,'2024_01_19_115724_create_coming_work_types_table',1),
(26,'2024_01_19_134930_create_coming_works_table',1),
(27,'2024_01_19_135239_create_coming_work_projects_table',1),
(28,'2024_01_19_140253_create_coming_work_tasks_table',1),
(29,'2024_01_19_153119_create_coming_work_employees_table',1),
(30,'2024_01_20_163640_create_absence_types_table',1),
(31,'2024_01_20_163645_create_absences_table',1),
(32,'2024_01_20_171540_create_absence_employees_table',1),
(33,'2024_01_20_224515_create_absence_relation_types_table',1),
(34,'2024_01_21_193445_create_imports_table',1),
(35,'2024_01_21_193446_create_failed_import_rows_table',1),
(36,'2024_01_25_184649_create_project_users_table',1),
(37,'2024_01_26_211144_create_permission_tables',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES
(1,'App\\Models\\User',1),
(4,'App\\Models\\User',2);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
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
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES
(1,'view_absence','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(2,'view_any_absence','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(3,'create_absence','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(4,'update_absence','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(5,'restore_absence','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(6,'restore_any_absence','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(7,'replicate_absence','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(8,'reorder_absence','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(9,'delete_absence','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(10,'delete_any_absence','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(11,'force_delete_absence','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(12,'force_delete_any_absence','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(13,'view_absence::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(14,'view_any_absence::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(15,'create_absence::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(16,'update_absence::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(17,'restore_absence::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(18,'restore_any_absence::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(19,'replicate_absence::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(20,'reorder_absence::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(21,'delete_absence::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(22,'delete_any_absence::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(23,'force_delete_absence::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(24,'force_delete_any_absence::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(25,'view_coming::work','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(26,'view_any_coming::work','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(27,'create_coming::work','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(28,'update_coming::work','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(29,'restore_coming::work','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(30,'restore_any_coming::work','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(31,'replicate_coming::work','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(32,'reorder_coming::work','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(33,'delete_coming::work','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(34,'delete_any_coming::work','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(35,'force_delete_coming::work','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(36,'force_delete_any_coming::work','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(37,'view_coming::work::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(38,'view_any_coming::work::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(39,'create_coming::work::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(40,'update_coming::work::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(41,'restore_coming::work::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(42,'restore_any_coming::work::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(43,'replicate_coming::work::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(44,'reorder_coming::work::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(45,'delete_coming::work::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(46,'delete_any_coming::work::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(47,'force_delete_coming::work::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(48,'force_delete_any_coming::work::type','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(49,'view_company','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(50,'view_any_company','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(51,'create_company','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(52,'update_company','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(53,'restore_company','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(54,'restore_any_company','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(55,'replicate_company','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(56,'reorder_company','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(57,'delete_company','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(58,'delete_any_company','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(59,'force_delete_company','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(60,'force_delete_any_company','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(61,'view_contact','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(62,'view_any_contact','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(63,'create_contact','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(64,'update_contact','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(65,'restore_contact','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(66,'restore_any_contact','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(67,'replicate_contact','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(68,'reorder_contact','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(69,'delete_contact','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(70,'delete_any_contact','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(71,'force_delete_contact','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(72,'force_delete_any_contact','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(73,'view_department','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(74,'view_any_department','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(75,'create_department','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(76,'update_department','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(77,'restore_department','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(78,'restore_any_department','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(79,'replicate_department','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(80,'reorder_department','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(81,'delete_department','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(82,'delete_any_department','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(83,'force_delete_department','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(84,'force_delete_any_department','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(85,'view_employee','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(86,'view_any_employee','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(87,'create_employee','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(88,'update_employee','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(89,'restore_employee','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(90,'restore_any_employee','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(91,'replicate_employee','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(92,'reorder_employee','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(93,'delete_employee','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(94,'delete_any_employee','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(95,'force_delete_employee','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(96,'force_delete_any_employee','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(97,'view_project','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(98,'view_any_project','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(99,'create_project','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(100,'update_project','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(101,'restore_project','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(102,'restore_any_project','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(103,'replicate_project','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(104,'reorder_project','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(105,'delete_project','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(106,'delete_any_project','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(107,'force_delete_project','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(108,'force_delete_any_project','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(109,'view_role','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(110,'view_any_role','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(111,'create_role','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(112,'update_role','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(113,'delete_role','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(114,'delete_any_role','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(115,'view_task','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(116,'view_any_task','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(117,'create_task','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(118,'update_task','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(119,'restore_task','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(120,'restore_any_task','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(121,'replicate_task','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(122,'reorder_task','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(123,'delete_task','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(124,'delete_any_task','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(125,'force_delete_task','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(126,'force_delete_any_task','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(127,'view_user','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(128,'view_any_user','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(129,'create_user','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(130,'update_user','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(131,'restore_user','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(132,'restore_any_user','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(133,'replicate_user','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(134,'reorder_user','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(135,'delete_user','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(136,'delete_any_user','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(137,'force_delete_user','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(138,'force_delete_any_user','web','2024-01-26 20:31:45','2024-01-26 20:31:45'),
(139,'2','web','2024-01-26 20:51:34','2024-01-26 20:51:34');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_companies`
--

LOCK TABLES `project_companies` WRITE;
/*!40000 ALTER TABLE `project_companies` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_contacts`
--

LOCK TABLES `project_contacts` WRITE;
/*!40000 ALTER TABLE `project_contacts` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_types`
--

LOCK TABLES `project_types` WRITE;
/*!40000 ALTER TABLE `project_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_users`
--

DROP TABLE IF EXISTS `project_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_users_project_id_foreign` (`project_id`),
  KEY `project_users_user_id_foreign` (`user_id`),
  CONSTRAINT `project_users_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_users`
--

LOCK TABLES `project_users` WRITE;
/*!40000 ALTER TABLE `project_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_users` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES
(1,1),
(1,4),
(2,1),
(2,4),
(3,1),
(3,4),
(4,1),
(4,4),
(5,1),
(5,4),
(6,1),
(6,4),
(7,1),
(7,4),
(8,1),
(8,4),
(9,1),
(9,4),
(10,1),
(10,4),
(11,1),
(11,4),
(12,1),
(12,4),
(13,1),
(13,4),
(14,1),
(14,4),
(15,1),
(15,4),
(16,1),
(16,4),
(17,1),
(17,4),
(18,1),
(18,4),
(19,1),
(19,4),
(20,1),
(20,4),
(21,1),
(21,4),
(22,1),
(22,4),
(23,1),
(23,4),
(24,1),
(24,4),
(25,1),
(25,4),
(26,1),
(26,4),
(27,1),
(27,4),
(28,1),
(28,4),
(29,1),
(29,4),
(30,1),
(30,4),
(31,1),
(31,4),
(32,1),
(32,4),
(33,1),
(33,4),
(34,1),
(34,4),
(35,1),
(35,4),
(36,1),
(36,4),
(37,1),
(37,4),
(38,1),
(38,4),
(39,1),
(39,4),
(40,1),
(40,4),
(41,1),
(41,4),
(42,1),
(42,4),
(43,1),
(43,4),
(44,1),
(44,4),
(45,1),
(45,4),
(46,1),
(46,4),
(47,1),
(47,4),
(48,1),
(48,4),
(49,1),
(49,4),
(50,1),
(50,4),
(51,1),
(51,4),
(52,1),
(52,4),
(53,1),
(53,4),
(54,1),
(54,4),
(55,1),
(55,4),
(56,1),
(56,4),
(57,1),
(57,4),
(58,1),
(58,4),
(59,1),
(59,4),
(60,1),
(60,4),
(61,1),
(61,4),
(62,1),
(62,4),
(63,1),
(63,4),
(64,1),
(64,4),
(65,1),
(65,4),
(66,1),
(66,4),
(67,1),
(67,4),
(68,1),
(68,4),
(69,1),
(69,4),
(70,1),
(70,4),
(71,1),
(71,4),
(72,1),
(72,4),
(73,1),
(73,4),
(74,1),
(74,4),
(75,1),
(75,4),
(76,1),
(76,4),
(77,1),
(77,4),
(78,1),
(78,4),
(79,1),
(79,4),
(80,1),
(80,4),
(81,1),
(81,4),
(82,1),
(82,4),
(83,1),
(83,4),
(84,1),
(84,4),
(85,1),
(85,4),
(86,1),
(86,4),
(87,1),
(87,4),
(88,1),
(88,4),
(89,1),
(89,4),
(90,1),
(90,4),
(91,1),
(91,4),
(92,1),
(92,4),
(93,1),
(93,4),
(94,1),
(94,4),
(95,1),
(95,4),
(96,1),
(96,4),
(97,1),
(97,4),
(98,1),
(98,4),
(99,1),
(99,4),
(100,1),
(100,4),
(101,1),
(101,4),
(102,1),
(102,4),
(103,1),
(103,4),
(104,1),
(104,4),
(105,1),
(105,4),
(106,1),
(106,4),
(107,1),
(107,4),
(108,1),
(108,4),
(109,1),
(109,4),
(110,1),
(110,4),
(111,1),
(111,4),
(112,1),
(112,4),
(113,1),
(113,4),
(114,1),
(114,4),
(115,1),
(115,4),
(116,1),
(116,4),
(117,1),
(117,4),
(118,1),
(118,4),
(119,1),
(119,4),
(120,1),
(120,4),
(121,1),
(121,4),
(122,1),
(122,4),
(123,1),
(123,4),
(124,1),
(124,4),
(125,1),
(125,4),
(126,1),
(126,4),
(127,1),
(127,4),
(128,1),
(128,4),
(129,1),
(129,4),
(130,1),
(130,4),
(131,1),
(131,4),
(132,1),
(132,4),
(133,1),
(133,4),
(134,1),
(134,4),
(135,1),
(135,4),
(136,1),
(136,4),
(137,1),
(137,4),
(138,1),
(138,4),
(139,4);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'super_admin','web','2024-01-26 20:31:44','2024-01-26 20:31:44'),
(3,'panel_user','web','2024-01-26 21:19:52','2024-01-26 21:19:52'),
(4,'Project Manager','web','2024-01-26 21:21:50','2024-01-26 21:21:50');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_companies`
--

LOCK TABLES `task_companies` WRITE;
/*!40000 ALTER TABLE `task_companies` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_contacts`
--

LOCK TABLES `task_contacts` WRITE;
/*!40000 ALTER TABLE `task_contacts` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_projects`
--

LOCK TABLES `task_projects` WRITE;
/*!40000 ALTER TABLE `task_projects` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Ondrej Zelina','ondrej.web@gmail.com',NULL,'$2y$12$X9vB93kEFrrrvef23dfLFOApzB4PPPoQd09FHGYksNh9Ps1BIp1xq',NULL,'2024-01-26 20:32:06','2024-01-26 20:32:06'),
(2,'Pavel Burda','root@example.com',NULL,'$2y$12$mX9LOnDZlRvbEu45QaVU8.Pfh3vXJXyYPVPoSXtgVAcfvYj9FCd8a',NULL,'2024-01-26 20:47:44','2024-01-26 22:06:51'),
(3,'Josef Tkadlec','tkadlec@example.com',NULL,'$2y$12$OkI51Uea6/9NBEHkERpMnOjvoe6RxPYRVhv.QKB/QiXsUV.V/R49G',NULL,'2024-01-26 22:07:18','2024-01-26 22:07:18'),
(4,'Vlasta Zelinova','zelinova@example.com',NULL,'$2y$12$hLpKXeb6tO/q80JT.SPo.uModR1RlVdzAu8dMdDP.Dx.cvCcFvbuG',NULL,'2024-01-26 22:07:56','2024-01-26 22:07:56'),
(5,'Vlasta Tkadlecova','tkadlecova@example.com',NULL,'$2y$12$a2fVUsLgE4HDj5UBwagF7.nwJ4eIl1Hz0On3XjRQ0eP5f3SXQf4gm',NULL,'2024-01-26 22:08:29','2024-01-26 22:08:29'),
(6,'Antonin Kyselak','kyselak@example.com',NULL,'$2y$12$upl8RUwtFpuZBopFNKjS9.CTHAtBem/X7Se.fi9Es3T6o/d7ta2tu',NULL,'2024-01-26 22:09:01','2024-01-26 22:09:01');
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

-- Dump completed on 2024-01-27  0:09:44
