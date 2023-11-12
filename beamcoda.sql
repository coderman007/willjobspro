-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 07-11-2023 a las 15:20:09
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `beamcoda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `img_url`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Daren', 'goyette.korey@example.org', '$2y$10$wjMihDgrUEH99OOVVPPZfutpWUG4kTbGxMR.yaICGOwdXBm3yherG', 'https://randomuser.me/api/portraits/women/26.jpg', 'icUYJeg1bg', '2023-10-31 17:22:16', '2023-10-31 17:22:16'),
(2, 'Jeison Miller', 'millerjeison@gmail.com', '$2y$10$19CRa4lTFPJM9w0rURn0.OR5E.t5H9fTeomgolV4sF0BmLL59P5L.', '1698756160-6540f640c5cd4_Analizamos-tus-tarifas-scaled-e1690212379365.jpg', NULL, '2023-10-31 17:42:40', '2023-10-31 17:42:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_settings`
--

CREATE TABLE `app_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `config_name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `setting_tab` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `app_settings`
--

INSERT INTO `app_settings` (`id`, `config_name`, `display_name`, `value`, `setting_tab`, `created_at`, `updated_at`) VALUES
(1, 'app_logo', 'App Logo', '1698755212-6540f28c511da_Analizamos-tus-tarifas-scaled-e1690212379365.jpg', 'general', '2023-10-31 17:26:52', '2023-10-31 17:26:52'),
(2, 'app_minimum_android', 'App. Minimum Version (iOS)', '1', 'general', '2023-10-31 17:26:52', '2023-10-31 17:26:52'),
(3, 'app_minimum_ios', 'App. Minimum Version (Android)', '1', 'general', '2023-10-31 17:26:52', '2023-10-31 17:26:52'),
(4, 'address', 'Address', 'Carrera 24 #59b53', 'general', '2023-10-31 17:27:01', '2023-10-31 17:27:01'),
(5, 'phone', 'Phone', '+573233386633', 'general', '2023-10-31 17:27:01', '2023-10-31 17:27:01'),
(6, 'email', 'Email', 'millerjeison@gmail.com', 'general', '2023-10-31 17:27:01', '2023-10-31 17:27:01'),
(7, 'footer_title', 'Footer Text', '', 'general', '2023-10-31 17:27:01', '2023-10-31 17:27:01'),
(8, 'app_url_android', 'App Url (Google Play Store)', '', 'general', '2023-10-31 17:27:01', '2023-10-31 17:27:01'),
(9, 'app_url_ios', 'App Url (Apple App Store)', '', 'general', '2023-10-31 17:27:01', '2023-10-31 17:27:01'),
(10, 'app_name', 'Application Name', 'jobs', 'application', '2023-10-31 17:42:55', '2023-10-31 17:42:55'),
(11, 'recaptcha_active', 'Active', '0', 'application', '2023-10-31 17:42:55', '2023-10-31 17:42:55'),
(12, 'recaptcha_site_key', 'Site Key', '', 'application', '2023-10-31 17:42:55', '2023-10-31 17:42:55'),
(13, 'recaptcha_secret_key', 'Secret Key', '', 'application', '2023-10-31 17:42:55', '2023-10-31 17:42:55'),
(14, 'website_webhook_url', 'Website Build Webhook Url', '', 'general', '2023-10-31 17:42:55', '2023-10-31 17:42:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `excerpt` varchar(200) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `icon_url` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `config_name` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `display_only` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `features`
--

INSERT INTO `features` (`id`, `config_name`, `name`, `display_only`, `created_at`, `updated_at`) VALUES
(1, 'long-post-duration', 'Extended Job Post Duration', 0, '2023-10-31 17:42:55', '2023-10-31 17:42:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `partner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `invoiced_date` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `payment_method` varchar(255) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `amount_paid` decimal(8,2) DEFAULT NULL,
  `date_paid` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `partner_id` bigint(20) UNSIGNED NOT NULL,
  `job_title` varchar(200) NOT NULL,
  `is_remote` tinyint(1) NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `no_pay_range` tinyint(1) NOT NULL,
  `min_salary_range` int(11) DEFAULT NULL,
  `max_salary_range` int(11) DEFAULT NULL,
  `job_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `desc` text NOT NULL,
  `job_active_duration` bigint(20) UNSIGNED DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_applications`
--

CREATE TABLE `job_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `resume_id` bigint(20) UNSIGNED DEFAULT NULL,
  `applied_time` datetime NOT NULL,
  `is_shortlisted` tinyint(1) NOT NULL,
  `selected_time` datetime DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL,
  `read_receipt_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_saved`
--

CREATE TABLE `job_saved` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `saved_time` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_skill`
--

CREATE TABLE `job_skill` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `skill_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_types`
--

CREATE TABLE `job_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_09_23_181547_create_admins_table', 1),
(6, '2022_09_25_130602_create_partners_table', 1),
(7, '2022_09_26_051041_create_categories_table', 1),
(8, '2022_09_27_165114_create_resumes_table', 1),
(9, '2022_09_27_165307_create_job_types_table', 1),
(10, '2022_09_27_165335_create_skills_table', 1),
(11, '2022_09_27_165354_create_posts_durations_table', 1),
(12, '2022_09_27_171628_create_jobs_table', 1),
(13, '2022_09_27_181230_create_job_applications_table', 1),
(14, '2022_09_27_182500_create_blog_posts_table', 1),
(15, '2022_09_27_182754_create_web_pages_table', 1),
(16, '2022_09_27_183048_create_features_table', 1),
(17, '2022_09_27_183153_create_packages_table', 1),
(18, '2022_09_27_183451_create_invoices_table', 1),
(19, '2022_09_27_183813_create_app_settings_table', 1),
(20, '2022_09_28_174749_create_skill_user_table', 1),
(21, '2022_09_28_182934_create_job_skill_table', 1),
(22, '2022_10_20_085632_create_package_feature_table', 1),
(23, '2022_10_20_142900_create_partner_package_table', 1),
(24, '2022_10_23_064025_create_job_saved_table', 1),
(25, '2022_10_24_122436_create_user_notification_settings_table', 1),
(26, '2022_10_24_135032_create_partner_notification_settings_table', 1),
(27, '2022_10_24_165717_create_user_notification_devices_table', 1),
(28, '2022_10_24_172648_create_partner_notification_devices', 1),
(29, '2022_10_25_165213_create_user_activity_log_table', 1),
(30, '2023_03_02_173858_add_google_id_to_users', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `subscription_type` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `packages`
--

INSERT INTO `packages` (`id`, `name`, `price`, `subscription_type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Free', 0.00, 'annual', 1, '2023-10-31 17:42:55', '2023-10-31 17:42:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `package_feature`
--

CREATE TABLE `package_feature` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `feature_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `company_name` varchar(200) NOT NULL,
  `short_name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `bio` text NOT NULL,
  `employee_count` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `partners`
--

INSERT INTO `partners` (`id`, `img_url`, `company_name`, `short_name`, `email`, `password`, `bio`, `employee_count`, `email_verified_at`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'https://randomuser.me/api/portraits/women/82.jpg', 'Kshlerin, Hoeger and Feeney', 'LLC', 'carson76@example.net', '$2y$10$EuPpCkBAkZYK6Zo/fzfZ3Ons1xoiQbmqjeMrODlpQvcopTNYmHWIW', 'Alice noticed, had powdered hair that WOULD always get into her head. \'If I eat or drink under the sea--\' (\'I haven\'t,\' said Alice)--\'and perhaps you haven\'t found it so quickly that the way down.', 'Paper Goods Machine Operator', '2023-10-31 17:22:16', NULL, 'gZG3xxRrPy', '2023-10-31 17:22:17', '2023-10-31 17:22:17'),
(2, 'https://randomuser.me/api/portraits/women/82.jpg', 'Streich LLC', 'and Sons', 'hammes.nova@example.org', '$2y$10$tHvyQSxwliE1.VU8XFw0MO0HZwDgarCqgXmmf5AW/MkKvN/pW.FRi', 'Alice, swallowing down her anger as well as she had succeeded in curving it down into a conversation. Alice felt a little queer, won\'t you?\' \'Not a bit,\' she thought it over afterwards, it occurred.', 'Logging Worker', '2023-10-31 17:22:16', NULL, 'slBgsBiwQr', '2023-10-31 17:22:17', '2023-10-31 17:22:17'),
(3, 'https://randomuser.me/api/portraits/women/82.jpg', 'Schmitt, Macejkovic and Nader', 'PLC', 'dfarrell@example.org', '$2y$10$8/bTmqmkggujt5JSCrkpjOI8x.GgTYUVr2sWHR5NBe0GKCluvnFPK', 'I\'ll look first,\' she said, as politely as she said to the shore. CHAPTER III. A Caucus-Race and a Dodo, a Lory and an old Turtle--we used to do:-- \'How doth the little--\"\' and she put them into a.', 'Agricultural Crop Farm Manager', '2023-10-31 17:22:17', NULL, 'N895cuHEdg', '2023-10-31 17:22:17', '2023-10-31 17:22:17'),
(4, 'https://randomuser.me/api/portraits/women/82.jpg', 'Welch LLC', 'LLC', 'abbott.lavonne@example.com', '$2y$10$/1Quh6ETjc2MTfLMFiAGv.rL65DBjE5ILYr1ESq7UtbbrfQFb5LIe', 'Alice did not like the look of things at all, at all!\' \'Do as I used--and I don\'t think,\' Alice went on, \'\"--found it advisable to go nearer till she heard it before,\' said Alice,) and round goes.', 'Telecommunications Facility Examiner', '2023-10-31 17:22:17', NULL, 'pk4qhz0iTE', '2023-10-31 17:22:17', '2023-10-31 17:22:17'),
(5, 'https://randomuser.me/api/portraits/women/82.jpg', 'Mraz Inc', 'Inc', 'wiza.patience@example.net', '$2y$10$MmB72SrU9EPiS2qF5LBZkusHK3TKLn5b2QPTrBOQeCMsDEsJY7Bt.', 'White Rabbit read:-- \'They told me you had been found and handed them round as prizes. There was a most extraordinary noise going on within--a constant howling and sneezing, and every now and then.', 'Actor', '2023-10-31 17:22:17', NULL, 'ZM7OtAeeUv', '2023-10-31 17:22:17', '2023-10-31 17:22:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partner_notification_devices`
--

CREATE TABLE `partner_notification_devices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `partner_id` bigint(20) UNSIGNED NOT NULL,
  `device_key` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partner_notification_settings`
--

CREATE TABLE `partner_notification_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `partner_id` bigint(20) UNSIGNED NOT NULL,
  `new_applicants` tinyint(1) NOT NULL,
  `job_expiry` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partner_package`
--

CREATE TABLE `partner_package` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `partner_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `valid_until` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Admin', 1, 'WEB TOKEN', '71c07d96cf43ce9777b9e349739216dd489c264d58919245dbf0efca63b24564', '[\"*\"]', '2023-11-07 19:04:41', NULL, '2023-10-31 17:43:20', '2023-11-07 19:04:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts_durations`
--

CREATE TABLE `posts_durations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `duration` bigint(20) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts_durations`
--

INSERT INTO `posts_durations` (`id`, `name`, `duration`, `is_paid`, `created_at`, `updated_at`) VALUES
(1, '1 Week', 10080, 0, '2023-10-31 17:42:55', '2023-10-31 17:42:55'),
(2, '2 Weeks', 20160, 0, '2023-10-31 17:42:55', '2023-10-31 17:42:55'),
(3, '1 Month', 43800, 0, '2023-10-31 17:42:55', '2023-10-31 17:42:55'),
(4, '3 Months', 131400, 0, '2023-10-31 17:42:55', '2023-10-31 17:42:55'),
(5, '6 Months', 262800, 1, '2023-10-31 17:42:55', '2023-10-31 17:42:55'),
(6, '1 Year', 525600, 1, '2023-10-31 17:42:55', '2023-10-31 17:42:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resumes`
--

CREATE TABLE `resumes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `doc_type` varchar(255) NOT NULL,
  `download_url` varchar(255) NOT NULL,
  `is_shared` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skills`
--

CREATE TABLE `skills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_hinted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skill_user`
--

CREATE TABLE `skill_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `skill_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `date_of_birth` date NOT NULL,
  `profession` varchar(255) NOT NULL,
  `short_bio` text NOT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `img_url`, `first_name`, `last_name`, `date_of_birth`, `profession`, `short_bio`, `blocked`, `email_verified_at`, `deleted_at`, `remember_token`, `created_at`, `updated_at`, `google_id`) VALUES
(1, 'heber28@example.org', '$2y$10$gkyvV4RvFfFkuWymcd1o0ep/xyjSGFHi2LILseLTbI9SESCUPjmDW', 'https://randomuser.me/api/portraits/women/82.jpg', 'Devin', 'Gerhold', '2018-05-07', 'Brazer', 'LITTLE larger, sir, if you were all turning into little cakes as they all cheered. Alice thought to herself, \'if one only knew how to get very tired of being upset, and their curls got entangled.', 0, '2023-10-31 17:22:16', NULL, '7WsNYQbQBc', '2023-10-31 17:22:16', '2023-10-31 17:22:16', NULL),
(2, 'ozboncak@example.org', '$2y$10$9NLIiXerSs7.clH/LzZo9OckjLpU.tu2LscbJMkzUf4j/Fu4Oh/hC', 'https://randomuser.me/api/portraits/women/82.jpg', 'Zoila', 'Bednar', '2001-04-05', 'Grips', 'He moved on as he said in an undertone, \'important--unimportant--unimportant--important--\' as if she had someone to listen to her, And mentioned me to sell you a couple?\' \'You are not the right size.', 0, '2023-10-31 17:22:16', NULL, 'WGQMde8gpn', '2023-10-31 17:22:16', '2023-10-31 17:22:16', NULL),
(3, 'luettgen.bennie@example.com', '$2y$10$X9XnZ.sv6TJetFGO/tTsA.jAtW3xyHHfeNvkFrxEcHagkbtC3KiB6', 'https://randomuser.me/api/portraits/women/82.jpg', 'Jett', 'Koelpin', '2020-09-26', 'Sailor', 'I suppose?\' said Alice. \'Why, there they lay on the bank, with her friend. When she got into the garden at once; but, alas for poor Alice! when she had accidentally upset the milk-jug into his.', 0, '2023-10-31 17:22:16', NULL, 'ZTMeUoluY4', '2023-10-31 17:22:16', '2023-10-31 17:22:16', NULL),
(4, 'camilla28@example.net', '$2y$10$2SJcgAPnVWrZrg1KuOs3Yuj912X5xOWB4LIdN.WkNKRb42zc/VPna', 'https://randomuser.me/api/portraits/women/82.jpg', 'Domenica', 'Cummings', '2000-05-11', 'Residential Advisor', 'Hatter, \'or you\'ll be telling me next that you have of putting things!\' \'It\'s a Cheshire cat,\' said the Gryphon. \'I mean, what makes them sour--and camomile that makes them bitter--and--and.', 0, '2023-10-31 17:22:16', NULL, 'XFIItzp5Z8', '2023-10-31 17:22:16', '2023-10-31 17:22:16', NULL),
(5, 'carlo44@example.com', '$2y$10$LT4FLJWhXnAiFfz0smGQOeVZWTJd8svkrontEt.c5rlyAjJgfj9C6', 'https://randomuser.me/api/portraits/women/82.jpg', 'Bertrand', 'Greenfelder', '2001-05-13', 'Production Manager', 'Queen, pointing to Alice an excellent opportunity for croqueting one of the goldfish kept running in her haste, she had never been in a great hurry, muttering to itself \'The Duchess! The Duchess! Oh.', 0, '2023-10-31 17:22:16', NULL, 'IX5hKJoeJZ', '2023-10-31 17:22:16', '2023-10-31 17:22:16', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_activity_log`
--

CREATE TABLE `user_activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `activity_name` varchar(255) NOT NULL,
  `activity_value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_notification_devices`
--

CREATE TABLE `user_notification_devices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `device_key` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_notification_settings`
--

CREATE TABLE `user_notification_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shortlisted_notification` tinyint(1) NOT NULL,
  `inactivity_notification` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `web_pages`
--

CREATE TABLE `web_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(200) NOT NULL,
  `body` text NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `web_pages`
--

INSERT INTO `web_pages` (`id`, `slug`, `title`, `body`, `is_published`, `status`, `created_at`, `updated_at`) VALUES
(1, 'contact-us', 'Contact us', 'Here is where your contact page content will go.', 1, 'active', '2023-10-31 17:42:55', '2023-10-31 17:42:55'),
(2, 'about-us', 'About us', 'Here is where your about page content will go.', 1, 'active', '2023-10-31 17:42:55', '2023-10-31 17:42:55'),
(3, 'privacy-policy', 'Privacy Policy', 'Here is where your privacy policy page content will go.', 1, 'active', '2023-10-31 17:42:55', '2023-10-31 17:42:55'),
(4, 'terms-conditions', 'Terms of Conditions', 'Here is where your terms of services page content will go.', 1, 'active', '2023-10-31 17:42:55', '2023-10-31 17:42:55');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indices de la tabla `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_posts_slug_unique` (`slug`),
  ADD KEY `blog_posts_author_id_foreign` (`author_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_partner_id_foreign` (`partner_id`),
  ADD KEY `invoices_package_id_foreign` (`package_id`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_partner_id_foreign` (`partner_id`),
  ADD KEY `jobs_category_id_foreign` (`category_id`),
  ADD KEY `jobs_job_type_id_foreign` (`job_type_id`),
  ADD KEY `jobs_job_active_duration_foreign` (`job_active_duration`);

--
-- Indices de la tabla `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_applications_job_id_foreign` (`job_id`),
  ADD KEY `job_applications_user_id_foreign` (`user_id`),
  ADD KEY `job_applications_resume_id_foreign` (`resume_id`);

--
-- Indices de la tabla `job_saved`
--
ALTER TABLE `job_saved`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_saved_job_id_foreign` (`job_id`),
  ADD KEY `job_saved_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `job_skill`
--
ALTER TABLE `job_skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_skill_job_id_foreign` (`job_id`),
  ADD KEY `job_skill_skill_id_foreign` (`skill_id`);

--
-- Indices de la tabla `job_types`
--
ALTER TABLE `job_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `package_feature`
--
ALTER TABLE `package_feature`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_feature_package_id_foreign` (`package_id`),
  ADD KEY `package_feature_feature_id_foreign` (`feature_id`);

--
-- Indices de la tabla `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `partners_email_unique` (`email`);

--
-- Indices de la tabla `partner_notification_devices`
--
ALTER TABLE `partner_notification_devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_notification_devices_partner_id_foreign` (`partner_id`);

--
-- Indices de la tabla `partner_notification_settings`
--
ALTER TABLE `partner_notification_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_notification_settings_partner_id_foreign` (`partner_id`);

--
-- Indices de la tabla `partner_package`
--
ALTER TABLE `partner_package`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_package_partner_id_foreign` (`partner_id`),
  ADD KEY `partner_package_package_id_foreign` (`package_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `posts_durations`
--
ALTER TABLE `posts_durations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `resumes`
--
ALTER TABLE `resumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resumes_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `skill_user`
--
ALTER TABLE `skill_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skill_user_user_id_foreign` (`user_id`),
  ADD KEY `skill_user_skill_id_foreign` (`skill_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `user_activity_log`
--
ALTER TABLE `user_activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_activity_log_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `user_notification_devices`
--
ALTER TABLE `user_notification_devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_notification_devices_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `user_notification_settings`
--
ALTER TABLE `user_notification_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_notification_settings_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `web_pages`
--
ALTER TABLE `web_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `web_pages_slug_unique` (`slug`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `job_saved`
--
ALTER TABLE `job_saved`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `job_skill`
--
ALTER TABLE `job_skill`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `job_types`
--
ALTER TABLE `job_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `package_feature`
--
ALTER TABLE `package_feature`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `partner_notification_devices`
--
ALTER TABLE `partner_notification_devices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `partner_notification_settings`
--
ALTER TABLE `partner_notification_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `partner_package`
--
ALTER TABLE `partner_package`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `posts_durations`
--
ALTER TABLE `posts_durations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `resumes`
--
ALTER TABLE `resumes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `skill_user`
--
ALTER TABLE `skill_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `user_activity_log`
--
ALTER TABLE `user_activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_notification_devices`
--
ALTER TABLE `user_notification_devices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_notification_settings`
--
ALTER TABLE `user_notification_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `web_pages`
--
ALTER TABLE `web_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jobs_job_active_duration_foreign` FOREIGN KEY (`job_active_duration`) REFERENCES `posts_durations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jobs_job_type_id_foreign` FOREIGN KEY (`job_type_id`) REFERENCES `job_types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jobs_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `job_applications`
--
ALTER TABLE `job_applications`
  ADD CONSTRAINT `job_applications_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_applications_resume_id_foreign` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `job_applications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `job_saved`
--
ALTER TABLE `job_saved`
  ADD CONSTRAINT `job_saved_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_saved_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `job_skill`
--
ALTER TABLE `job_skill`
  ADD CONSTRAINT `job_skill_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_skill_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `package_feature`
--
ALTER TABLE `package_feature`
  ADD CONSTRAINT `package_feature_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `package_feature_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `partner_notification_devices`
--
ALTER TABLE `partner_notification_devices`
  ADD CONSTRAINT `partner_notification_devices_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `partner_notification_settings`
--
ALTER TABLE `partner_notification_settings`
  ADD CONSTRAINT `partner_notification_settings_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `partner_package`
--
ALTER TABLE `partner_package`
  ADD CONSTRAINT `partner_package_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `partner_package_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `resumes`
--
ALTER TABLE `resumes`
  ADD CONSTRAINT `resumes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `skill_user`
--
ALTER TABLE `skill_user`
  ADD CONSTRAINT `skill_user_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `skill_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_activity_log`
--
ALTER TABLE `user_activity_log`
  ADD CONSTRAINT `user_activity_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_notification_devices`
--
ALTER TABLE `user_notification_devices`
  ADD CONSTRAINT `user_notification_devices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_notification_settings`
--
ALTER TABLE `user_notification_settings`
  ADD CONSTRAINT `user_notification_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
