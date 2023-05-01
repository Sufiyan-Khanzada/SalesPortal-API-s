-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2023 at 05:36 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salesportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DOB` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referby` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referprice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profilepic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `client_id`, `firstname`, `lastname`, `email`, `DOB`, `gender`, `referby`, `referprice`, `profilepic`, `created_at`, `updated_at`) VALUES
(3, 14, 'sufiyan', 'khanzada', 'client123@example.com', '24-01-2028', 'male', 'sufiyan', '2300', 'image path ayegaa', '2023-04-15 20:41:48', '2023-04-15 20:41:48'),
(4, 20, 'Burton Craig', 'Drew Guzman', 'fahyjopisi@mailinator.com', '2001-04-28', 'female', '15', '1', NULL, '2023-05-01 10:04:46', '2023-05-01 10:04:46'),
(5, 21, 'Paki Berry', 'Chelsea Dennis', 'gisosocu@mailinator.com', '2004-09-03', 'female', '15', '1', NULL, '2023-05-01 10:09:02', '2023-05-01 10:09:02'),
(6, 22, 'Taha', 'Rafi', 'test@gmail.com', '2023-12-31', 'female', '15', '1', NULL, '2023-05-01 10:10:15', '2023-05-01 10:10:15');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2023_04_06_203023_add_columns_users_table', 1),
(11, '2023_04_08_014707_create_referer_table', 2),
(12, '2023_04_09_020847_create_pricings_table', 3),
(13, '2023_04_10_010234_add_columns_in_users_table', 4),
(14, '2023_04_15_214938_add_columns_pricings_table', 5),
(16, '2023_04_15_220840_crete_customers_table', 6),
(17, '2023_04_29_161111_create_purchases_table', 7),
(18, '2023_04_30_032920_add_column_in_purchases_table', 8),
(19, '2023_04_30_044628_add_column_in_purchases_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00aa6b23b6975c03348c8473e1adf161e9316410fb29334a0f4778b761a47bd499716e8db20ba26a', 1, 1, 'passport_token', '[]', 0, '2023-04-15 13:45:54', '2023-04-15 13:45:54', '2024-04-15 18:45:54'),
('0497c3d1550676d5eda6e144de2f6fa19c18eba0954fe0f9a56a1716e6312f148681e1fc9c1b9183', 1, 1, 'passport_token', '[]', 1, '2023-05-01 05:06:45', '2023-05-01 05:06:45', '2024-05-01 10:06:45'),
('13fbf4bfb9e91269bd425ad4e623f599b1e47cbf4af6803f28695245d94758d2a603d1a0d29f8b84', 1, 1, 'passport_token', '[]', 0, '2023-04-15 13:44:59', '2023-04-15 13:44:59', '2024-04-15 18:44:59'),
('18ddf3c0bf158ca1491d97e0562900bef14ac514162b64479f98f1cfaefb1b4b24143dd91ccc39a5', 2, 1, 'passport_token', '[]', 0, '2023-04-14 20:35:12', '2023-04-14 20:35:12', '2024-04-15 01:35:12'),
('1f7a1ec91de94d2e47a6d4accdefa9b0a719ac2c59ecf6feaef348929ba50a45739da267f3a63a79', 1, 1, 'passport_token', '[]', 0, '2023-04-10 16:57:51', '2023-04-10 16:57:51', '2024-04-10 21:57:51'),
('325e84b840cf5b4460d52c09b10328f60a37056690c3b5b0eadba7ecfe5b51c7c9d5ca8ab08eac79', 3, 1, 'passport_token', '[]', 1, '2023-04-09 20:59:41', '2023-04-09 20:59:41', '2024-04-10 01:59:41'),
('3434dfc52de7d0e7fe98a11cfbd12fe2cb01358c5a2ed4791f1ce0187573aa5f61dcc24c7adc140b', 3, 1, 'passport_token', '[]', 0, '2023-04-14 20:41:41', '2023-04-14 20:41:41', '2024-04-15 01:41:41'),
('360ef371de92586cefad913014ea324260a95daf9afd48167827d0bebc406a982e0f9bd8955111ff', 1, 1, 'passport_token', '[]', 1, '2023-04-15 13:48:28', '2023-04-15 13:48:28', '2024-04-15 18:48:28'),
('3f0aa3cc5e005e8304ac6e3ba4450d5fc26eb62cad8e240843179fac6f27e33bc8b2459551aedb10', 1, 1, 'passport_token', '[]', 0, '2023-04-14 20:24:13', '2023-04-14 20:24:13', '2024-04-15 01:24:13'),
('4b7df76139b8a013775d8a1d4a5d702c80d666921ba3eec7aa86c53b81127fd85d930a2c5787daad', 15, 1, 'passport_token', '[]', 0, '2023-04-30 16:58:09', '2023-04-30 16:58:09', '2024-04-30 21:58:09'),
('516b147f72af6ec754210924f6ce75584bc046f441a84b6a4281634be6aeeb706398eca30df45ded', 1, 1, 'passport_token', '[]', 1, '2023-04-17 03:26:23', '2023-04-17 03:26:23', '2024-04-17 08:26:23'),
('53814f657f49d9b82fe6dbf050b0a7e8617f56d01dbf2799f177989a21696b2a5d07bec45b2b5441', 22, 1, 'passport_token', '[]', 0, '2023-05-01 10:13:36', '2023-05-01 10:13:36', '2024-05-01 15:13:36'),
('54444956135e474afccdba08ee950048383e3eb662a5b517c8c17dbaf22663d5934594dac5b3ba26', 1, 1, 'passport_token', '[]', 0, '2023-04-15 13:39:00', '2023-04-15 13:39:00', '2024-04-15 18:39:00'),
('62c7875a1fe7205e23edcd25bcb4c6048c2f3af07db7b23893097e03a5c47fc47519f9465f0c05c7', 1, 1, 'passport_token', '[]', 0, '2023-04-14 20:33:10', '2023-04-14 20:33:10', '2024-04-15 01:33:10'),
('6e5c2b5c5822becd24bb2fec2327d9ea7d5905ae81f571214a4d08302dc9ed35deee7175def0ce51', 22, 1, 'passport_token', '[]', 0, '2023-05-01 10:10:31', '2023-05-01 10:10:31', '2024-05-01 15:10:31'),
('75498189042495ce86687137fe8ea6bf5054dd151dca4784926c86c9172632debaa6ec4f792ef93f', 1, 1, 'passport_token', '[]', 0, '2023-04-14 20:40:54', '2023-04-14 20:40:54', '2024-04-15 01:40:54'),
('7aebc1294ef671085e9bbc9e9602f6b60265b7192ebf811fd56f93c86bf52dda2064d1df208e9ae3', 1, 1, 'passport_token', '[]', 0, '2023-04-30 17:10:41', '2023-04-30 17:10:41', '2024-04-30 22:10:41'),
('7dece4ab6bcf1328db04e07b4a24a5d1219671e79943656a9bc985d20ff67d4ff9c60d5762e4f628', 1, 1, 'passport_token', '[]', 0, '2023-04-15 13:41:40', '2023-04-15 13:41:40', '2024-04-15 18:41:40'),
('83742d5b70ee286cffa210bc7a73b2623c50efccb94129f22c4fc77329ff1648f3798b30bb722852', 1, 1, 'passport_token', '[]', 0, '2023-04-15 13:47:10', '2023-04-15 13:47:10', '2024-04-15 18:47:10'),
('861b6e3e3fee4bc536060d3e037291e90f9e64a146514c150bfa1de88abcbfd4b979eb5a501012e9', 15, 1, 'passport_token', '[]', 0, '2023-05-01 05:25:36', '2023-05-01 05:25:36', '2024-05-01 10:25:36'),
('97136299f256df0a2f4a30c91c15a6f691f79fd90c727698512ad31fa51f7c84c3b6b3c2b234a597', 1, 1, 'passport_token', '[]', 0, '2023-04-15 13:43:18', '2023-04-15 13:43:18', '2024-04-15 18:43:18'),
('a01e40c7edb02d91c75b73a35a0d5b02c6ca0e55990e6ba8cb4bee036206f89b3d8d36554f9b0eae', 1, 1, 'passport_token', '[]', 0, '2023-04-10 16:24:09', '2023-04-10 16:24:09', '2024-04-10 21:24:09'),
('abab6d45895dc3b88e9441b34894ed172a35d2d3d43acbdd4be87d205a375b47ed59f674b8ba04c7', 1, 1, 'passport_token', '[]', 1, '2023-05-01 05:24:35', '2023-05-01 05:24:35', '2024-05-01 10:24:35'),
('abf70921c9c72f1c689bc297a407b181c551c0ea403634cb8ab5f2d15c2b29ad26e98e2d1ea25cf0', 2, 1, 'passport_token', '[]', 0, '2023-04-14 20:41:04', '2023-04-14 20:41:04', '2024-04-15 01:41:04'),
('b4d14845d811f9c02f9cf56242111a52b369052cfd794791e063758919370f6c68316d81090dfccf', 1, 1, 'passport_token', '[]', 1, '2023-04-07 20:27:12', '2023-04-07 20:27:12', '2024-04-08 01:27:12'),
('b684fe86c93eb14a59e5141b14bf523d632c781731b92bd6fbd586746455cbd6538645414ab69eb9', 14, 1, 'passport_token', '[]', 0, '2023-04-15 20:46:09', '2023-04-15 20:46:09', '2024-04-16 01:46:09'),
('becea9c27920f23fafa79cb4a21d898b5d6d54530f9c726e89a77d80de15fbf7da9509e37e1b6df1', 3, 1, 'passport_token', '[]', 1, '2023-04-17 03:29:31', '2023-04-17 03:29:31', '2024-04-17 08:29:31'),
('c81f7ef956d068e1c51bec77487a9bedaa84745869b769121838fcfea6f611655e4136156c12323b', 1, 1, 'passport_token', '[]', 0, '2023-04-07 20:26:04', '2023-04-07 20:26:04', '2024-04-08 01:26:04'),
('cfdd592219e9cdaf95f56fe67a2b9a0caca31058866f123cd67f2a896569b8d2c0ca5a1fad7e5a7b', 1, 1, 'passport_token', '[]', 1, '2023-04-30 16:26:44', '2023-04-30 16:26:44', '2024-04-30 21:26:44');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '0vqYxUH6MJHnOqSvE6QfchIZbBvaZI0SmZyNdPQr', NULL, 'http://localhost', 1, 0, 0, '2023-04-07 20:25:37', '2023-04-07 20:25:37'),
(2, NULL, 'Laravel Password Grant Client', 'etFH5n9ytjJgRC57tiUgYqXndeGQDhiaw46ak5j9', 'users', 'http://localhost', 0, 1, 0, '2023-04-07 20:25:37', '2023-04-07 20:25:37');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-04-07 20:25:37', '2023-04-07 20:25:37');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pricings`
--

CREATE TABLE `pricings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Plan_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Plan_tag_line` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Plan_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Plan_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pricings`
--

INSERT INTO `pricings` (`id`, `Plan_title`, `Plan_tag_line`, `Plan_price`, `Plan_description`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Testings', 'Something Great', '2300', 'Hello Dear', '2023-04-08 21:28:36', '2023-04-08 21:38:51', ''),
(2, 'Testing', 'Somethings New', '2300', 'Hello Dear', '2023-04-15 16:53:38', '2023-04-30 16:29:48', '1682890188.jpg'),
(3, 'new plan', 'plan slogan', '150', 'atest', '2023-04-30 16:34:38', '2023-04-30 16:34:38', '1682890476.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `First_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Paymode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Referid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Referby` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Product_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Remaining_Amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `First_name`, `Last_name`, `Email`, `Paymode`, `Referid`, `Referby`, `Amount`, `Product_ids`, `Total`, `created_at`, `updated_at`, `Remaining_Amount`, `user_id`) VALUES
(1, 'Sufiyan', 'khanzada', 'sufiyankhanzada1254@gmail.com', 'Half', '2', '3', '4500', '23,43,55', NULL, '2023-04-29 22:24:10', '2023-04-29 22:24:10', NULL, NULL),
(2, 'Sufiyan', 'khanzada', 'sufiyankhanzada1254@gmail.com', 'Half', '2', '3', '4500', '23,43,55', NULL, '2023-04-29 22:30:35', '2023-04-29 22:30:35', NULL, NULL),
(3, 'Sufiyan', 'khanzada', 'sufiyankhanzada1254@gmail.com', 'Half', '2', '3', '4500', '23,43,55', NULL, '2023-04-29 23:47:44', '2023-04-29 23:47:44', '0', NULL),
(4, 'Sufiyan', 'khanzada', 'sufiyankhanzada1254@gmail.com', 'Half', '2', '3', '4500', '23,43,55', NULL, '2023-04-29 23:49:13', '2023-04-29 23:49:13', '0', '2'),
(5, 'Sufiyan', 'khanzada', 'sufiyankhanzada1254@gmail.com', 'Half', '2', '3', '4500', '23,43,55', '2250', '2023-04-29 23:50:25', '2023-04-29 23:50:25', '0', '2');

-- --------------------------------------------------------

--
-- Table structure for table `referers`
--

CREATE TABLE `referers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Refer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Refer_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Refer_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `referers`
--

INSERT INTO `referers` (`id`, `Refer_name`, `Refer_value`, `Refer_status`, `created_at`, `updated_at`) VALUES
(1, 'NewYear', '2001', 'enabled', '2023-04-07 21:35:26', '2023-04-30 16:35:28'),
(2, 'test', '10', 'enabled', '2023-04-30 16:34:57', '2023-04-30 16:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `referal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `confirm_password`, `role`, `DOB`, `cnic`, `referal`) VALUES
(1, 'Sufiyan', 'sufiyankhanzada1254@gmail.com', NULL, '$2y$10$.NFJAz.xDzSk0iA3Sju8oOtFbTiVVLqDjxauTaEQZdJTD3im.ro3i', NULL, '2023-04-07 20:24:48', '2023-04-07 20:24:48', '$2y$10$7KSEX5yPcXKtDq/JBe.tVumOPj.uK6ldEM6o72ZmDo1PFxzhJNCz2', 'admin', '', '', ''),
(2, 'Sufiyan', 'sufiyankhanzada12541@gmail.com', NULL, '$2y$10$ubq/Q.OCqh/x8qzS/2tcAeKR5T8dOA3Ck0NNTppSmVTttxu3Hruj6', NULL, '2023-04-09 20:12:21', '2023-04-09 21:53:06', '$2y$10$gsDjM7saVYMWCqaDNw1sLeCqn4KXZ0tUN6yxd8jMcWWzGAfFxEIuC', 'admin', '24-01-2023', '4130234234324234', ''),
(3, 'Sufiyan', 'sales123@example.com', NULL, '$2y$10$Y2MS/6Ozut10Mafv1uIyf.boZU79TFBfF9Tv2fOcaAwB9BbExlaBm', NULL, '2023-04-09 20:27:32', '2023-04-09 21:29:29', '$2y$10$.goaF1UPXHslnaFc3A7lI.slnIu2SpxY8kLpu.0CcZFS3VNd64Clu', 'SalesPerson', '24-01-2028', '3123233443432', ''),
(14, 'Sufiyan', 'client123@example.com', NULL, '$2y$10$HQFziG2GHrVMGt27uk716.Bt/9DjsWII.zGTcMSFJXmY.p7NlHLRW', NULL, '2023-04-15 20:41:48', '2023-04-15 20:41:48', '$2y$10$AfCdhrtsOnUTA6lpvODxCesXjwJSsQZjzHMht9Y0KQzXa5W1XTvz6', 'Client', '24-01-2028', NULL, 'shfkjhsdjkfhjksdhf'),
(15, 'Taha', 'tuaha.rafi@gmail.com', NULL, '$2y$10$Q5Zf1p9vD0xLWLuv3znBXuBG668ijSBd/LSKoRktrWs10Cva.CD9G', NULL, '2023-04-30 16:56:21', '2023-05-01 05:25:11', '$2y$10$M3oCXDXnksZHBorToczuU.tRbA6ydHBwb2dyHJFHX2JbG9CHi.2si', 'SalesPerson', '2001-01-01', '123456789', NULL),
(20, 'Burton Craig Drew Guzman', 'fahyjopisi@mailinator.com', NULL, '$2y$10$DOhD6B60VudjJGl0J2nLoekNzH//Dw9Tqrcz9Kt2JSGZgD1g4WlyC', NULL, '2023-05-01 10:04:46', '2023-05-01 10:04:46', '$2y$10$Kb7I25uK7ptQEp3zyqZxg.bOFg4ppR4Pba.DMFOlgfo6QmmeF/riq', 'Client', '2001-04-28', NULL, '15'),
(21, 'Paki Berry Chelsea Dennis', 'gisosocu@mailinator.com', NULL, '$2y$10$DJIz5f.NV4Re8NldjG6L7eMqZvjHtdTce8DzC1SS7GjYeEXfiWf0i', NULL, '2023-05-01 10:09:02', '2023-05-01 10:09:02', '$2y$10$xln6ue.RmUmsTZufCsUpVe2Wy7NC6k3wpkwrY8Zlfo8HK7YZNK5vS', 'Client', '2004-09-03', NULL, '15'),
(22, 'Taha Rafi', 'test@gmail.com', NULL, '$2y$10$cSNDAQljwBDrpamuX8uYQu2XZk2pXSbrVkvLmqUPdYj5H7gpl/Kka', NULL, '2023-05-01 10:10:15', '2023-05-01 10:10:15', '$2y$10$G0.punOX4XI61.qvup2DROpucC51d0wOV7.nUKi5wHeQTV5gMr8zG', 'Client', '2023-12-31', NULL, '15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_client_id_foreign` (`client_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pricings`
--
ALTER TABLE `pricings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referers`
--
ALTER TABLE `referers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pricings`
--
ALTER TABLE `pricings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `referers`
--
ALTER TABLE `referers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
