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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence_employees`
--

LOCK TABLES `absence_employees` WRITE;
/*!40000 ALTER TABLE `absence_employees` DISABLE KEYS */;
INSERT INTO `absence_employees` VALUES
(1,1,1,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence_relation_types`
--

LOCK TABLES `absence_relation_types` WRITE;
/*!40000 ALTER TABLE `absence_relation_types` DISABLE KEYS */;
INSERT INTO `absence_relation_types` VALUES
(1,1,1,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence_types`
--

LOCK TABLES `absence_types` WRITE;
/*!40000 ALTER TABLE `absence_types` DISABLE KEYS */;
INSERT INTO `absence_types` VALUES
(1,'Paid Vacation','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(2,'Compensatory Time Off','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(3,'Sickness','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(4,'Doctor\'s Visit','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(5,'Home Office','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(6,'Sick Day','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(7,'Maternity / Paternity Leave','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(8,'Approved Absence','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(9,'Disapproved Absence','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(10,'Treatment of a Family Member','2024-01-28 23:58:58','2024-01-28 23:58:58');
/*!40000 ALTER TABLE `absence_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `absence_users`
--

DROP TABLE IF EXISTS `absence_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `absence_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `absence_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `absence_users_absence_id_foreign` (`absence_id`),
  KEY `absence_users_user_id_foreign` (`user_id`),
  CONSTRAINT `absence_users_absence_id_foreign` FOREIGN KEY (`absence_id`) REFERENCES `absences` (`id`) ON DELETE CASCADE,
  CONSTRAINT `absence_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence_users`
--

LOCK TABLES `absence_users` WRITE;
/*!40000 ALTER TABLE `absence_users` DISABLE KEYS */;
INSERT INTO `absence_users` VALUES
(1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `absence_users` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absences`
--

LOCK TABLES `absences` WRITE;
/*!40000 ALTER TABLE `absences` DISABLE KEYS */;
INSERT INTO `absences` VALUES
(1,'2024-01-30','08:00:00','2024-01-30','15:00:00',0,NULL,NULL,'2024-01-30 10:28:32','2024-01-30 10:28:32');
/*!40000 ALTER TABLE `absences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_attendance_types`
--

DROP TABLE IF EXISTS `attendance_attendance_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_attendance_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coming_work_id` bigint(20) unsigned NOT NULL,
  `coming_work_type_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendance_attendance_types_coming_work_id_foreign` (`coming_work_id`),
  KEY `attendance_attendance_types_coming_work_type_id_foreign` (`coming_work_type_id`),
  CONSTRAINT `attendance_attendance_types_coming_work_id_foreign` FOREIGN KEY (`coming_work_id`) REFERENCES `coming_works` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendance_attendance_types_coming_work_type_id_foreign` FOREIGN KEY (`coming_work_type_id`) REFERENCES `coming_work_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_attendance_types`
--

LOCK TABLES `attendance_attendance_types` WRITE;
/*!40000 ALTER TABLE `attendance_attendance_types` DISABLE KEYS */;
INSERT INTO `attendance_attendance_types` VALUES
(1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `attendance_attendance_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_users`
--

DROP TABLE IF EXISTS `attendance_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coming_work_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendance_users_coming_work_id_foreign` (`coming_work_id`),
  KEY `attendance_users_user_id_foreign` (`user_id`),
  CONSTRAINT `attendance_users_coming_work_id_foreign` FOREIGN KEY (`coming_work_id`) REFERENCES `coming_works` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendance_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_users`
--

LOCK TABLES `attendance_users` WRITE;
/*!40000 ALTER TABLE `attendance_users` DISABLE KEYS */;
INSERT INTO `attendance_users` VALUES
(1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `attendance_users` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coming_work_employees`
--

LOCK TABLES `coming_work_employees` WRITE;
/*!40000 ALTER TABLE `coming_work_employees` DISABLE KEYS */;
INSERT INTO `coming_work_employees` VALUES
(3,1,1,NULL,NULL);
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
(1,1,1,NULL,NULL);
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
(1,1,2,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coming_work_types`
--

LOCK TABLES `coming_work_types` WRITE;
/*!40000 ALTER TABLE `coming_work_types` DISABLE KEYS */;
INSERT INTO `coming_work_types` VALUES
(1,'Work on Project','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(2,'Communication','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(3,'Management','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(4,'Marketing','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(5,'Business','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(6,'Meeting','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(7,'Others','2024-01-28 23:58:58','2024-01-28 23:58:58');
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
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `note` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coming_works_user_id_foreign` (`user_id`),
  CONSTRAINT `coming_works_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coming_works`
--

LOCK TABLES `coming_works` WRITE;
/*!40000 ALTER TABLE `coming_works` DISABLE KEYS */;
INSERT INTO `coming_works` VALUES
(1,'Tvorba relaci','2024-01-31','08:00:00','21:00:00',NULL,NULL,'2024-01-30 23:52:23','2024-01-30 23:52:23');
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
(1,'Ondrej Zelina','732127410','ondrej.web@gmail.com','binapi.tech','02453681',NULL,0,0,0,'Horni namesti 3','Vsetin','75603','Zlinsky kraj','Czech Republic',NULL,'2024-01-28 23:58:58','2024-01-28 23:59:57',NULL,NULL),
(2,'Millenium international s.r.o.','732127410','ondrej.web@gmail.com','binapi.tech','02239221','CZ02239221',0,0,0,'Kosicka 63/30','Praha','10100','Hlavni mesto Praha','Czech Republic',NULL,'2024-01-28 23:58:58','2024-01-29 00:00:11',NULL,NULL),
(3,'Nabah Solutions s.r.o.',' 605776170','ondrej.web@gmail.com','binapi.tech','05832144','CZ05832144',0,0,0,'Horova 1298/5A','Olomouc','77900','Olomoucky kraj','Czech Republic',NULL,'2024-01-28 23:58:58','2024-01-29 00:00:27',NULL,NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_attendances`
--

DROP TABLE IF EXISTS `company_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_attendances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `coming_work_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_attendances_company_id_foreign` (`company_id`),
  KEY `company_attendances_coming_work_id_foreign` (`coming_work_id`),
  CONSTRAINT `company_attendances_coming_work_id_foreign` FOREIGN KEY (`coming_work_id`) REFERENCES `coming_works` (`id`) ON DELETE CASCADE,
  CONSTRAINT `company_attendances_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_attendances`
--

LOCK TABLES `company_attendances` WRITE;
/*!40000 ALTER TABLE `company_attendances` DISABLE KEYS */;
INSERT INTO `company_attendances` VALUES
(1,3,1,NULL,NULL);
/*!40000 ALTER TABLE `company_attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_users`
--

DROP TABLE IF EXISTS `company_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_users_company_id_foreign` (`company_id`),
  KEY `company_users_user_id_foreign` (`user_id`),
  CONSTRAINT `company_users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `company_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_users`
--

LOCK TABLES `company_users` WRITE;
/*!40000 ALTER TABLE `company_users` DISABLE KEYS */;
INSERT INTO `company_users` VALUES
(3,1,1,NULL,NULL);
/*!40000 ALTER TABLE `company_users` ENABLE KEYS */;
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
(2,2,1),
(3,3,3),
(4,3,2);
/*!40000 ALTER TABLE `contact_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_users`
--

DROP TABLE IF EXISTS `contact_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_users_contact_id_foreign` (`contact_id`),
  KEY `contact_users_user_id_foreign` (`user_id`),
  CONSTRAINT `contact_users_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contact_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_users`
--

LOCK TABLES `contact_users` WRITE;
/*!40000 ALTER TABLE `contact_users` DISABLE KEYS */;
INSERT INTO `contact_users` VALUES
(1,1,1,NULL,NULL),
(3,3,1,NULL,NULL),
(4,3,3,NULL,NULL);
/*!40000 ALTER TABLE `contact_users` ENABLE KEYS */;
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
(1,1,NULL,'Ondrej Zelina','ondrej.web@gmail.com',0,NULL,732127410,NULL,'Halenkov 655','Halenkov','75603','Zlinsky kraj','Czech republic',NULL,'2024-01-28 23:58:58','2024-01-31 10:45:58'),
(2,1,NULL,'Lukas Haban','info@nabah.cz',0,NULL,605776170,NULL,'Schweitzerova 798/99a','Olomouc','77900','Olomocky kraj','Czech republic',NULL,'2024-01-28 23:58:58','2024-01-28 23:59:29'),
(3,2,NULL,'Aneta Kabelikova','kabelikova@nabah.cz',0,NULL,605776170,NULL,'Schweitzerova 798/99a','Olomouc','77900','Olomocky kraj','Czech republic',NULL,'2024-01-28 23:58:58','2024-01-28 23:59:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES
(1,'Management of the company','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(2,'Project Office','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(3,'Quality and audit','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(4,'Management staff','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(5,'Store','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(6,'IT operation and development','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(7,'IT Security','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(8,'Administration','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(9,'HR','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(10,'Legal Department','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(11,'Finance','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(12,'Accounting','2024-01-28 23:58:58','2024-01-28 23:58:58');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_tasks`
--

LOCK TABLES `employee_tasks` WRITE;
/*!40000 ALTER TABLE `employee_tasks` DISABLE KEYS */;
INSERT INTO `employee_tasks` VALUES
(1,1,1,NULL,NULL),
(2,2,1,NULL,NULL);
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
(1,NULL,'Ondrej Zelina','ondrej.web@gmail.com',0,NULL,732127410,NULL,'Halenkov 655','Halenkov','75603','Zlinsky kraj','Czech republic',NULL,'2024-01-28 23:58:58','2024-01-28 23:58:58'),
(2,NULL,'Pavel Burda','paul@example.com',0,NULL,605776170,NULL,'Schweitzerova 798/99a','Olomouc','77900','Olomocky kraj','Czech republic',NULL,'2024-01-28 23:58:58','2024-01-28 23:58:58'),
(3,NULL,'Aneta Kabelikova','kabelikova@example.com',0,NULL,605776170,NULL,'Schweitzerova 798/99a','Olomouc','77900','Olomocky kraj','Czech republic',NULL,'2024-01-28 23:58:58','2024-01-28 23:58:58');
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
-- Table structure for table `file_absences`
--

DROP TABLE IF EXISTS `file_absences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_absences` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) unsigned NOT NULL,
  `absence_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_absences_file_id_foreign` (`file_id`),
  KEY `file_absences_absence_id_foreign` (`absence_id`),
  CONSTRAINT `file_absences_absence_id_foreign` FOREIGN KEY (`absence_id`) REFERENCES `absences` (`id`) ON DELETE CASCADE,
  CONSTRAINT `file_absences_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_absences`
--

LOCK TABLES `file_absences` WRITE;
/*!40000 ALTER TABLE `file_absences` DISABLE KEYS */;
INSERT INTO `file_absences` VALUES
(1,6,1,NULL,NULL);
/*!40000 ALTER TABLE `file_absences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_attendances`
--

DROP TABLE IF EXISTS `file_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_attendances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coming_work_id` bigint(20) unsigned NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_attendances_coming_work_id_foreign` (`coming_work_id`),
  KEY `file_attendances_file_id_foreign` (`file_id`),
  CONSTRAINT `file_attendances_coming_work_id_foreign` FOREIGN KEY (`coming_work_id`) REFERENCES `coming_works` (`id`) ON DELETE CASCADE,
  CONSTRAINT `file_attendances_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_attendances`
--

LOCK TABLES `file_attendances` WRITE;
/*!40000 ALTER TABLE `file_attendances` DISABLE KEYS */;
INSERT INTO `file_attendances` VALUES
(1,1,5,NULL,NULL);
/*!40000 ALTER TABLE `file_attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_companies`
--

DROP TABLE IF EXISTS `file_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_companies_file_id_foreign` (`file_id`),
  KEY `file_companies_company_id_foreign` (`company_id`),
  CONSTRAINT `file_companies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `file_companies_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_companies`
--

LOCK TABLES `file_companies` WRITE;
/*!40000 ALTER TABLE `file_companies` DISABLE KEYS */;
INSERT INTO `file_companies` VALUES
(1,1,3,NULL,NULL),
(3,2,3,NULL,NULL),
(4,3,2,NULL,NULL),
(5,4,3,NULL,NULL),
(7,5,3,NULL,NULL),
(8,6,3,NULL,NULL);
/*!40000 ALTER TABLE `file_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_contacts`
--

DROP TABLE IF EXISTS `file_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) unsigned NOT NULL,
  `contact_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_contacts_file_id_foreign` (`file_id`),
  KEY `file_contacts_contact_id_foreign` (`contact_id`),
  CONSTRAINT `file_contacts_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `file_contacts_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_contacts`
--

LOCK TABLES `file_contacts` WRITE;
/*!40000 ALTER TABLE `file_contacts` DISABLE KEYS */;
INSERT INTO `file_contacts` VALUES
(1,1,3,NULL,NULL),
(2,2,3,NULL,NULL),
(3,3,3,NULL,NULL),
(4,4,3,NULL,NULL),
(5,5,1,NULL,NULL),
(6,6,1,NULL,NULL);
/*!40000 ALTER TABLE `file_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_projects`
--

DROP TABLE IF EXISTS `file_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_projects_file_id_foreign` (`file_id`),
  KEY `file_projects_project_id_foreign` (`project_id`),
  CONSTRAINT `file_projects_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `file_projects_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_projects`
--

LOCK TABLES `file_projects` WRITE;
/*!40000 ALTER TABLE `file_projects` DISABLE KEYS */;
INSERT INTO `file_projects` VALUES
(1,1,1,NULL,NULL),
(2,2,1,NULL,NULL),
(3,3,1,NULL,NULL),
(4,4,1,NULL,NULL),
(5,5,1,NULL,NULL),
(6,6,1,NULL,NULL);
/*!40000 ALTER TABLE `file_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_tasks`
--

DROP TABLE IF EXISTS `file_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_tasks_task_id_foreign` (`task_id`),
  KEY `file_tasks_file_id_foreign` (`file_id`),
  CONSTRAINT `file_tasks_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `file_tasks_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_tasks`
--

LOCK TABLES `file_tasks` WRITE;
/*!40000 ALTER TABLE `file_tasks` DISABLE KEYS */;
INSERT INTO `file_tasks` VALUES
(1,1,3,NULL,NULL),
(2,2,4,NULL,NULL);
/*!40000 ALTER TABLE `file_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_types`
--

DROP TABLE IF EXISTS `file_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_types`
--

LOCK TABLES `file_types` WRITE;
/*!40000 ALTER TABLE `file_types` DISABLE KEYS */;
INSERT INTO `file_types` VALUES
(1,'Proposal','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(2,'RFI','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(3,'Contract','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(4,'Specification','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(5,'Acceptance Protocol','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(6,'Invoice Issued','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(7,'Invoice Received','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(8,'Meeting Minutes','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(9,'Complaint Protocol','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(10,'Others','2024-01-28 23:58:58','2024-01-28 23:58:58');
/*!40000 ALTER TABLE `file_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_users`
--

DROP TABLE IF EXISTS `file_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_users_file_id_foreign` (`file_id`),
  KEY `file_users_user_id_foreign` (`user_id`),
  CONSTRAINT `file_users_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `file_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_users`
--

LOCK TABLES `file_users` WRITE;
/*!40000 ALTER TABLE `file_users` DISABLE KEYS */;
INSERT INTO `file_users` VALUES
(1,6,1,NULL,NULL);
/*!40000 ALTER TABLE `file_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `priority` varchar(255) NOT NULL,
  `document` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES
(1,'Contact','Height','\"Documents\\/CiselnikOkresu.xlsx\"','2024-01-29 00:12:49','2024-01-30 09:19:53'),
(2,'Tvorba testovaciho projektu','Low','\"Documents\\/tasks.csv\"','2024-01-29 01:11:36','2024-01-30 09:43:45'),
(3,'Test','Medium','\"Documents\\/contacts.csv\"','2024-01-30 08:58:20','2024-01-30 09:22:15'),
(4,'testovaci ','Low','\"Documents\\/contacts.csv\"','2024-01-30 09:09:09','2024-01-30 09:28:58'),
(5,'Attendance','Low','\"Documents\\/contacts.csv\"','2024-01-30 10:11:20','2024-01-30 10:11:20'),
(6,'Testovaci soubor Absence','Low','\"Documents\\/zvlastni_org-actual-praha-2015.csv\"','2024-01-30 10:29:11','2024-01-30 10:29:11');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
(38,'2024_01_29_003628_create_file_types_table',1),
(40,'2024_01_26_232140_create_permission_tables',2),
(41,'2024_01_29_010155_create_files_table',2),
(42,'2024_01_29_011710_create_file_projects_table',3),
(43,'2024_01_29_011824_create_file_companies_table',3),
(44,'2024_01_29_011930_create_file_contacts_table',3),
(45,'2024_01_30_094606_create_file_tasks_table',4),
(47,'2024_01_30_105911_create_file_attendances_table',5),
(48,'2024_01_30_112135_create_file_absences_table',6),
(54,'2024_01_31_003444_create_attendance_attendance_types_table',9),
(55,'2024_01_30_225156_create_company_attendances_table',10),
(58,'2024_01_19_134930_create_coming_works_table',11),
(59,'2024_01_31_010329_create_attendance_users_table',12),
(60,'2024_01_31_112042_create_company_users_table',13),
(62,'2024_01_31_113912_create_contact_users_table',14),
(63,'2024_01_31_115007_create_task_users_table',15),
(64,'2024_01_31_115855_create_absence_users_table',16),
(66,'2024_01_31_120820_create_file_users_table',17);
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
(1,'App\\Models\\User',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES
(1,'view_absence','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(2,'view_any_absence','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(3,'create_absence','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(4,'update_absence','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(5,'restore_absence','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(6,'restore_any_absence','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(7,'replicate_absence','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(8,'reorder_absence','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(9,'delete_absence','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(10,'delete_any_absence','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(11,'force_delete_absence','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(12,'force_delete_any_absence','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(13,'view_absence::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(14,'view_any_absence::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(15,'create_absence::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(16,'update_absence::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(17,'restore_absence::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(18,'restore_any_absence::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(19,'replicate_absence::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(20,'reorder_absence::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(21,'delete_absence::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(22,'delete_any_absence::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(23,'force_delete_absence::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(24,'force_delete_any_absence::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(25,'view_coming::work','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(26,'view_any_coming::work','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(27,'create_coming::work','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(28,'update_coming::work','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(29,'restore_coming::work','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(30,'restore_any_coming::work','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(31,'replicate_coming::work','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(32,'reorder_coming::work','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(33,'delete_coming::work','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(34,'delete_any_coming::work','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(35,'force_delete_coming::work','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(36,'force_delete_any_coming::work','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(37,'view_coming::work::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(38,'view_any_coming::work::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(39,'create_coming::work::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(40,'update_coming::work::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(41,'restore_coming::work::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(42,'restore_any_coming::work::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(43,'replicate_coming::work::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(44,'reorder_coming::work::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(45,'delete_coming::work::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(46,'delete_any_coming::work::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(47,'force_delete_coming::work::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(48,'force_delete_any_coming::work::type','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(49,'view_company','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(50,'view_any_company','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(51,'create_company','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(52,'update_company','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(53,'restore_company','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(54,'restore_any_company','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(55,'replicate_company','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(56,'reorder_company','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(57,'delete_company','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(58,'delete_any_company','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(59,'force_delete_company','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(60,'force_delete_any_company','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(61,'view_contact','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(62,'view_any_contact','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(63,'create_contact','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(64,'update_contact','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(65,'restore_contact','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(66,'restore_any_contact','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(67,'replicate_contact','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(68,'reorder_contact','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(69,'delete_contact','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(70,'delete_any_contact','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(71,'force_delete_contact','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(72,'force_delete_any_contact','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(73,'view_department','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(74,'view_any_department','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(75,'create_department','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(76,'update_department','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(77,'restore_department','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(78,'restore_any_department','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(79,'replicate_department','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(80,'reorder_department','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(81,'delete_department','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(82,'delete_any_department','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(83,'force_delete_department','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(84,'force_delete_any_department','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(85,'view_employee','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(86,'view_any_employee','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(87,'create_employee','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(88,'update_employee','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(89,'restore_employee','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(90,'restore_any_employee','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(91,'replicate_employee','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(92,'reorder_employee','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(93,'delete_employee','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(94,'delete_any_employee','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(95,'force_delete_employee','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(96,'force_delete_any_employee','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(97,'view_file','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(98,'view_any_file','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(99,'create_file','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(100,'update_file','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(101,'restore_file','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(102,'restore_any_file','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(103,'replicate_file','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(104,'reorder_file','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(105,'delete_file','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(106,'delete_any_file','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(107,'force_delete_file','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(108,'force_delete_any_file','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(109,'view_file::types','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(110,'view_any_file::types','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(111,'create_file::types','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(112,'update_file::types','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(113,'restore_file::types','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(114,'restore_any_file::types','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(115,'replicate_file::types','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(116,'reorder_file::types','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(117,'delete_file::types','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(118,'delete_any_file::types','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(119,'force_delete_file::types','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(120,'force_delete_any_file::types','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(121,'view_project','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(122,'view_any_project','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(123,'create_project','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(124,'update_project','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(125,'restore_project','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(126,'restore_any_project','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(127,'replicate_project','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(128,'reorder_project','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(129,'delete_project','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(130,'delete_any_project','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(131,'force_delete_project','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(132,'force_delete_any_project','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(133,'view_role','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(134,'view_any_role','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(135,'create_role','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(136,'update_role','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(137,'delete_role','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(138,'delete_any_role','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(139,'view_task','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(140,'view_any_task','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(141,'create_task','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(142,'update_task','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(143,'restore_task','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(144,'restore_any_task','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(145,'replicate_task','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(146,'reorder_task','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(147,'delete_task','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(148,'delete_any_task','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(149,'force_delete_task','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(150,'force_delete_any_task','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(151,'view_user','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(152,'view_any_user','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(153,'create_user','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(154,'update_user','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(155,'restore_user','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(156,'restore_any_user','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(157,'replicate_user','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(158,'reorder_user','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(159,'delete_user','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(160,'delete_any_user','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(161,'force_delete_user','web','2024-01-29 00:08:18','2024-01-29 00:08:18'),
(162,'force_delete_any_user','web','2024-01-29 00:08:18','2024-01-29 00:08:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_companies`
--

LOCK TABLES `project_companies` WRITE;
/*!40000 ALTER TABLE `project_companies` DISABLE KEYS */;
INSERT INTO `project_companies` VALUES
(1,3,1,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_contacts`
--

LOCK TABLES `project_contacts` WRITE;
/*!40000 ALTER TABLE `project_contacts` DISABLE KEYS */;
INSERT INTO `project_contacts` VALUES
(1,1,3,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_types`
--

LOCK TABLES `project_types` WRITE;
/*!40000 ALTER TABLE `project_types` DISABLE KEYS */;
INSERT INTO `project_types` VALUES
(1,'PHP Contract','2024-01-28 23:58:58','2024-01-28 23:58:58'),
(2,'Security Contract','2024-01-28 23:58:58','2024-01-28 23:58:58');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_users`
--

LOCK TABLES `project_users` WRITE;
/*!40000 ALTER TABLE `project_users` DISABLE KEYS */;
INSERT INTO `project_users` VALUES
(1,1,1,NULL,NULL),
(3,1,3,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES
(1,'Tvorba crm na zakazku Nabah Solutions',3,3,1,'2024-01-01','2024-05-31',NULL,'150000',NULL,'2024-01-29 00:01:22','2024-01-29 00:01:22',1);
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
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1),
(13,1),
(14,1),
(15,1),
(16,1),
(17,1),
(18,1),
(19,1),
(20,1),
(21,1),
(22,1),
(23,1),
(24,1),
(25,1),
(26,1),
(27,1),
(28,1),
(29,1),
(30,1),
(31,1),
(32,1),
(33,1),
(34,1),
(35,1),
(36,1),
(37,1),
(38,1),
(39,1),
(40,1),
(41,1),
(42,1),
(43,1),
(44,1),
(45,1),
(46,1),
(47,1),
(48,1),
(49,1),
(50,1),
(51,1),
(52,1),
(53,1),
(54,1),
(55,1),
(56,1),
(57,1),
(58,1),
(59,1),
(60,1),
(61,1),
(62,1),
(63,1),
(64,1),
(65,1),
(66,1),
(67,1),
(68,1),
(69,1),
(70,1),
(71,1),
(72,1),
(73,1),
(74,1),
(75,1),
(76,1),
(77,1),
(78,1),
(79,1),
(80,1),
(81,1),
(82,1),
(83,1),
(84,1),
(85,1),
(86,1),
(87,1),
(88,1),
(89,1),
(90,1),
(91,1),
(92,1),
(93,1),
(94,1),
(95,1),
(96,1),
(97,1),
(98,1),
(99,1),
(100,1),
(101,1),
(102,1),
(103,1),
(104,1),
(105,1),
(106,1),
(107,1),
(108,1),
(109,1),
(110,1),
(111,1),
(112,1),
(113,1),
(114,1),
(115,1),
(116,1),
(117,1),
(118,1),
(119,1),
(120,1),
(121,1),
(122,1),
(123,1),
(124,1),
(125,1),
(126,1),
(127,1),
(128,1),
(129,1),
(130,1),
(131,1),
(132,1),
(133,1),
(134,1),
(135,1),
(136,1),
(137,1),
(138,1),
(139,1),
(140,1),
(141,1),
(142,1),
(143,1),
(144,1),
(145,1),
(146,1),
(147,1),
(148,1),
(149,1),
(150,1),
(151,1),
(152,1),
(153,1),
(154,1),
(155,1),
(156,1),
(157,1),
(158,1),
(159,1),
(160,1),
(161,1),
(162,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'super_admin','web','2024-01-29 00:08:17','2024-01-29 00:08:17'),
(2,'panel_user','web','2024-01-29 00:08:18','2024-01-29 00:08:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_companies`
--

LOCK TABLES `task_companies` WRITE;
/*!40000 ALTER TABLE `task_companies` DISABLE KEYS */;
INSERT INTO `task_companies` VALUES
(1,1,3,NULL,NULL),
(2,2,3,NULL,NULL);
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
(1,1,1,NULL,NULL),
(2,2,1,NULL,NULL);
/*!40000 ALTER TABLE `task_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_users`
--

DROP TABLE IF EXISTS `task_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_users_task_id_foreign` (`task_id`),
  KEY `task_users_user_id_foreign` (`user_id`),
  CONSTRAINT `task_users_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_users`
--

LOCK TABLES `task_users` WRITE;
/*!40000 ALTER TABLE `task_users` DISABLE KEYS */;
INSERT INTO `task_users` VALUES
(1,2,1,NULL,NULL);
/*!40000 ALTER TABLE `task_users` ENABLE KEYS */;
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
(1,'Testovaci ukol','1','2024-01-30','2024-01-30','2024-01-30 08:35:35','2024-01-30 08:35:35'),
(2,'testovani relace','1','2024-01-30','2024-01-30','2024-01-30 09:34:21','2024-01-30 09:34:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Ondrej Zelina','ondrej.web@gmail.com',NULL,'$2y$12$8wqPNCSjYcGtG8tie/KlLOgxVdmq/fe.74fiLUomJhXij587KT4/i',NULL,'2024-01-28 23:58:42','2024-01-28 23:58:42'),
(3,'Pavel Burda','paul.burda@email.cz',NULL,'$2y$12$j2Fx/h4E.1UfyNI7zWlB6u5LcmeTaJ7.PPoupzAZNyhvsVUAFOlLK',NULL,'2024-01-31 10:15:00','2024-01-31 10:15:00');
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

-- Dump completed on 2024-01-31 13:19:37
