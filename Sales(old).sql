/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 10.4.24-MariaDB : Database - salesportal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`salesportal` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `salesportal`;

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DOB` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referby` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referprice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profilepic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_client_id_foreign` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `customers` */

insert  into `customers`(`id`,`client_id`,`firstname`,`lastname`,`email`,`DOB`,`gender`,`referby`,`referprice`,`profilepic`,`created_at`,`updated_at`) values (3,14,'sufiyan','khanzada','client123@example.com','24-01-2028','male','sufiyan','2300','image path ayegaa','2023-04-16 01:41:48','2023-04-16 01:41:48');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2019_12_14_000001_create_personal_access_tokens_table',1),(10,'2023_04_06_203023_add_columns_users_table',1),(11,'2023_04_08_014707_create_referer_table',2),(12,'2023_04_09_020847_create_pricings_table',3),(13,'2023_04_10_010234_add_columns_in_users_table',4),(14,'2023_04_15_214938_add_columns_pricings_table',5),(16,'2023_04_15_220840_crete_customers_table',6);

/*Table structure for table `oauth_access_tokens` */

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_access_tokens` */

insert  into `oauth_access_tokens`(`id`,`user_id`,`client_id`,`name`,`scopes`,`revoked`,`created_at`,`updated_at`,`expires_at`) values ('00aa6b23b6975c03348c8473e1adf161e9316410fb29334a0f4778b761a47bd499716e8db20ba26a',1,1,'passport_token','[]',0,'2023-04-15 18:45:54','2023-04-15 18:45:54','2024-04-15 18:45:54'),('13fbf4bfb9e91269bd425ad4e623f599b1e47cbf4af6803f28695245d94758d2a603d1a0d29f8b84',1,1,'passport_token','[]',0,'2023-04-15 18:44:59','2023-04-15 18:44:59','2024-04-15 18:44:59'),('18ddf3c0bf158ca1491d97e0562900bef14ac514162b64479f98f1cfaefb1b4b24143dd91ccc39a5',2,1,'passport_token','[]',0,'2023-04-15 01:35:12','2023-04-15 01:35:12','2024-04-15 01:35:12'),('1f7a1ec91de94d2e47a6d4accdefa9b0a719ac2c59ecf6feaef348929ba50a45739da267f3a63a79',1,1,'passport_token','[]',0,'2023-04-10 21:57:51','2023-04-10 21:57:51','2024-04-10 21:57:51'),('325e84b840cf5b4460d52c09b10328f60a37056690c3b5b0eadba7ecfe5b51c7c9d5ca8ab08eac79',3,1,'passport_token','[]',1,'2023-04-10 01:59:41','2023-04-10 01:59:41','2024-04-10 01:59:41'),('3434dfc52de7d0e7fe98a11cfbd12fe2cb01358c5a2ed4791f1ce0187573aa5f61dcc24c7adc140b',3,1,'passport_token','[]',0,'2023-04-15 01:41:41','2023-04-15 01:41:41','2024-04-15 01:41:41'),('360ef371de92586cefad913014ea324260a95daf9afd48167827d0bebc406a982e0f9bd8955111ff',1,1,'passport_token','[]',1,'2023-04-15 18:48:28','2023-04-15 18:48:28','2024-04-15 18:48:28'),('3f0aa3cc5e005e8304ac6e3ba4450d5fc26eb62cad8e240843179fac6f27e33bc8b2459551aedb10',1,1,'passport_token','[]',0,'2023-04-15 01:24:13','2023-04-15 01:24:13','2024-04-15 01:24:13'),('54444956135e474afccdba08ee950048383e3eb662a5b517c8c17dbaf22663d5934594dac5b3ba26',1,1,'passport_token','[]',0,'2023-04-15 18:39:00','2023-04-15 18:39:00','2024-04-15 18:39:00'),('62c7875a1fe7205e23edcd25bcb4c6048c2f3af07db7b23893097e03a5c47fc47519f9465f0c05c7',1,1,'passport_token','[]',0,'2023-04-15 01:33:10','2023-04-15 01:33:10','2024-04-15 01:33:10'),('75498189042495ce86687137fe8ea6bf5054dd151dca4784926c86c9172632debaa6ec4f792ef93f',1,1,'passport_token','[]',0,'2023-04-15 01:40:54','2023-04-15 01:40:54','2024-04-15 01:40:54'),('7dece4ab6bcf1328db04e07b4a24a5d1219671e79943656a9bc985d20ff67d4ff9c60d5762e4f628',1,1,'passport_token','[]',0,'2023-04-15 18:41:40','2023-04-15 18:41:40','2024-04-15 18:41:40'),('83742d5b70ee286cffa210bc7a73b2623c50efccb94129f22c4fc77329ff1648f3798b30bb722852',1,1,'passport_token','[]',0,'2023-04-15 18:47:10','2023-04-15 18:47:10','2024-04-15 18:47:10'),('97136299f256df0a2f4a30c91c15a6f691f79fd90c727698512ad31fa51f7c84c3b6b3c2b234a597',1,1,'passport_token','[]',0,'2023-04-15 18:43:18','2023-04-15 18:43:18','2024-04-15 18:43:18'),('a01e40c7edb02d91c75b73a35a0d5b02c6ca0e55990e6ba8cb4bee036206f89b3d8d36554f9b0eae',1,1,'passport_token','[]',0,'2023-04-10 21:24:09','2023-04-10 21:24:09','2024-04-10 21:24:09'),('abf70921c9c72f1c689bc297a407b181c551c0ea403634cb8ab5f2d15c2b29ad26e98e2d1ea25cf0',2,1,'passport_token','[]',0,'2023-04-15 01:41:04','2023-04-15 01:41:04','2024-04-15 01:41:04'),('b4d14845d811f9c02f9cf56242111a52b369052cfd794791e063758919370f6c68316d81090dfccf',1,1,'passport_token','[]',1,'2023-04-08 01:27:12','2023-04-08 01:27:12','2024-04-08 01:27:12'),('b684fe86c93eb14a59e5141b14bf523d632c781731b92bd6fbd586746455cbd6538645414ab69eb9',14,1,'passport_token','[]',0,'2023-04-16 01:46:09','2023-04-16 01:46:09','2024-04-16 01:46:09'),('c81f7ef956d068e1c51bec77487a9bedaa84745869b769121838fcfea6f611655e4136156c12323b',1,1,'passport_token','[]',0,'2023-04-08 01:26:04','2023-04-08 01:26:04','2024-04-08 01:26:04');

/*Table structure for table `oauth_auth_codes` */

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_auth_codes` */

/*Table structure for table `oauth_clients` */

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_clients` */

insert  into `oauth_clients`(`id`,`user_id`,`name`,`secret`,`provider`,`redirect`,`personal_access_client`,`password_client`,`revoked`,`created_at`,`updated_at`) values (1,NULL,'Laravel Personal Access Client','0vqYxUH6MJHnOqSvE6QfchIZbBvaZI0SmZyNdPQr',NULL,'http://localhost',1,0,0,'2023-04-08 01:25:37','2023-04-08 01:25:37'),(2,NULL,'Laravel Password Grant Client','etFH5n9ytjJgRC57tiUgYqXndeGQDhiaw46ak5j9','users','http://localhost',0,1,0,'2023-04-08 01:25:37','2023-04-08 01:25:37');

/*Table structure for table `oauth_personal_access_clients` */

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_personal_access_clients` */

insert  into `oauth_personal_access_clients`(`id`,`client_id`,`created_at`,`updated_at`) values (1,1,'2023-04-08 01:25:37','2023-04-08 01:25:37');

/*Table structure for table `oauth_refresh_tokens` */

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_refresh_tokens` */

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `pricings` */

DROP TABLE IF EXISTS `pricings`;

CREATE TABLE `pricings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Plan_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Plan_tag_line` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Plan_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Plan_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pricings` */

insert  into `pricings`(`id`,`Plan_title`,`Plan_tag_line`,`Plan_price`,`Plan_description`,`created_at`,`updated_at`,`image`) values (1,'Testings','Something Great','$2300','Hello Dear','2023-04-09 02:28:36','2023-04-09 02:38:51',''),(2,'Testing','Somethings New','$2300','Hello Dear','2023-04-15 21:53:38','2023-04-15 21:53:38','imagepath');

/*Table structure for table `referers` */

DROP TABLE IF EXISTS `referers`;

CREATE TABLE `referers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Refer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Refer_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Refer_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `referers` */

insert  into `referers`(`id`,`Refer_name`,`Refer_value`,`Refer_status`,`created_at`,`updated_at`) values (1,'NewYear','$2001','disable','2023-04-08 02:35:26','2023-04-08 02:41:16');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirm_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DOB` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`confirm_password`,`role`,`DOB`,`cnic`,`referal`) values (1,'Sufiyan','sufiyankhanzada1254@gmail.com',NULL,'$2y$10$.NFJAz.xDzSk0iA3Sju8oOtFbTiVVLqDjxauTaEQZdJTD3im.ro3i',NULL,'2023-04-08 01:24:48','2023-04-08 01:24:48','$2y$10$7KSEX5yPcXKtDq/JBe.tVumOPj.uK6ldEM6o72ZmDo1PFxzhJNCz2','admin','','',''),(2,'Sufiyan','sufiyankhanzada12541@gmail.com',NULL,'$2y$10$ubq/Q.OCqh/x8qzS/2tcAeKR5T8dOA3Ck0NNTppSmVTttxu3Hruj6',NULL,'2023-04-10 01:12:21','2023-04-10 02:53:06','$2y$10$gsDjM7saVYMWCqaDNw1sLeCqn4KXZ0tUN6yxd8jMcWWzGAfFxEIuC','admin','24-01-2023','4130234234324234',''),(3,'Sufiyan','sales123@example.com',NULL,'$2y$10$Y2MS/6Ozut10Mafv1uIyf.boZU79TFBfF9Tv2fOcaAwB9BbExlaBm',NULL,'2023-04-10 01:27:32','2023-04-10 02:29:29','$2y$10$.goaF1UPXHslnaFc3A7lI.slnIu2SpxY8kLpu.0CcZFS3VNd64Clu','SalesPerson','24-01-2028','3123233443432',''),(14,'Sufiyan','client123@example.com',NULL,'$2y$10$HQFziG2GHrVMGt27uk716.Bt/9DjsWII.zGTcMSFJXmY.p7NlHLRW',NULL,'2023-04-16 01:41:48','2023-04-16 01:41:48','$2y$10$AfCdhrtsOnUTA6lpvODxCesXjwJSsQZjzHMht9Y0KQzXa5W1XTvz6','Client','24-01-2028',NULL,'shfkjhsdjkfhjksdhf');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
