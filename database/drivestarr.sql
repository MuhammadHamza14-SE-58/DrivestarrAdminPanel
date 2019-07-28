-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2019 at 08:30 PM
-- Server version: 5.7.9
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drivestarr`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
CREATE TABLE IF NOT EXISTS `bus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `route_name` varchar(62) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `route_name`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'alksdjf', 1, '2019-07-28 19:48:04', '2019-07-28 19:48:04');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(2, NULL, 1, 'Category 2', 'category-2', '2019-07-28 07:18:17', '2019-07-28 07:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(62) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'A', '2019-07-28 13:58:30', '2019-07-28 13:58:30');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":"0","taggable":"0"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"name"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 16, 'route_name', 'text', 'Route Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(58, 16, 'company_id', 'text', 'Company Id', 1, 0, 0, 0, 0, 0, '{}', 3),
(66, 16, 'bus_hasone_company_relationship', 'relationship', 'company', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Company","table":"company","type":"belongsTo","column":"company_id","key":"id","label":"name","pivot_table":"bus","pivot":"0","taggable":"0"}', 6),
(60, 16, 'updated_at', 'text', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(61, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(62, 17, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(63, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(64, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(65, 16, 'created_at', 'text', 'Created At', 1, 0, 0, 0, 0, 0, '{}', 4),
(67, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(68, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(69, 21, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(82, 1, 'user_hasone_bus_relationship', 'relationship', 'bus', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Bus","table":"bus","type":"hasOne","column":"id","key":"id","label":"route_name","pivot_table":"bus","pivot":"0","taggable":"0"}', 13),
(72, 21, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(73, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(74, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(75, 22, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(76, 22, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(77, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(78, 21, 'student_belongsto_school_relationship', 'relationship', 'school', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\School","table":"school","type":"belongsTo","column":"school_id","key":"id","label":"name","pivot_table":"bus","pivot":"0","taggable":"0"}', 6),
(79, 21, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(80, 21, 'school_id', 'text', 'School Id', 0, 0, 0, 0, 0, 0, '{}', 3),
(81, 21, 'qr_code', 'text', 'Qr Code', 0, 0, 0, 0, 0, 0, '{}', 4),
(83, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(84, 1, 'mobile_number', 'text', 'Mobile Number', 0, 1, 1, 1, 1, 1, '{}', 12),
(85, 1, 'bus_id', 'text', 'Bus Id', 0, 0, 0, 0, 0, 0, '{}', 13),
(86, 1, 'user_hasmany_student_relationship', 'relationship', 'students', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Student","table":"students","type":"belongsToMany","column":"id","key":"id","label":"name","pivot_table":"user_students","pivot":"1","taggable":"on"}', 14);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}', '2019-07-28 07:17:03', '2019-07-28 15:29:04'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2019-07-28 07:18:16', '2019-07-28 07:18:16'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(16, 'bus', 'bus', 'Bus', 'Buses', NULL, 'App\\Bus', NULL, 'App\\Http\\Controllers\\BusController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-07-28 09:58:14', '2019-07-28 14:10:28'),
(17, 'company', 'company', 'Company', 'Companies', NULL, 'App\\Company', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-07-28 13:50:54', '2019-07-28 13:50:54'),
(21, 'students', 'students', 'Student', 'Students', NULL, 'App\\Student', NULL, 'App\\Http\\Controllers\\StudentController', NULL, 1, 1, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-07-28 14:55:36', '2019-07-28 15:00:15'),
(22, 'school', 'school', 'School', 'Schools', NULL, 'App\\School', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-07-28 14:57:06', '2019-07-28 14:57:06');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-07-28 07:17:03', '2019-07-28 07:17:03');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-07-28 07:17:03', '2019-07-28 07:17:03', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2019-07-28 07:17:03', '2019-07-28 07:17:03', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2019-07-28 07:17:03', '2019-07-28 07:17:03', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2019-07-28 07:17:03', '2019-07-28 07:17:03', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2019-07-28 07:17:03', '2019-07-28 07:17:03', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2019-07-28 07:17:03', '2019-07-28 07:17:03', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2019-07-28 07:17:03', '2019-07-28 07:17:03', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2019-07-28 07:17:03', '2019-07-28 07:17:03', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2019-07-28 07:17:03', '2019-07-28 07:17:03', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2019-07-28 07:17:03', '2019-07-28 07:17:03', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2019-07-28 07:17:03', '2019-07-28 07:17:03', 'voyager.hooks', NULL),
(12, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2019-07-28 07:18:17', '2019-07-28 07:18:17', 'voyager.categories.index', NULL),
(13, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2019-07-28 07:18:17', '2019-07-28 07:18:17', 'voyager.posts.index', NULL),
(14, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2019-07-28 07:18:17', '2019-07-28 07:18:17', 'voyager.pages.index', NULL),
(20, 1, 'Buses', '', '_self', NULL, NULL, NULL, 15, '2019-07-28 09:58:14', '2019-07-28 09:58:14', 'voyager.bus.index', NULL),
(21, 1, 'Companies', '', '_self', NULL, NULL, NULL, 16, '2019-07-28 13:50:55', '2019-07-28 13:50:55', 'voyager.company.index', NULL),
(22, 1, 'Students', '', '_self', NULL, NULL, NULL, 17, '2019-07-28 14:55:36', '2019-07-28 14:55:36', 'voyager.students.index', NULL),
(23, 1, 'Schools', '', '_self', NULL, NULL, NULL, 18, '2019-07-28 14:57:06', '2019-07-28 14:57:06', 'voyager.school.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(10, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(12, '2016_06_01_000004_create_oauth_clients_table', 1),
(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(14, '2016_10_21_190000_create_roles_table', 1),
(15, '2016_10_21_190000_create_settings_table', 1),
(16, '2016_11_30_135954_create_permission_table', 1),
(17, '2016_11_30_141208_create_permission_role_table', 1),
(18, '2016_12_26_201236_data_types__add__server_side', 1),
(19, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(20, '2017_01_14_005015_create_translations_table', 1),
(21, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(22, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(23, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(24, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(25, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(26, '2017_08_05_000000_add_group_to_settings_table', 1),
(27, '2017_11_26_013050_add_user_role_relationship', 1),
(28, '2017_11_26_015000_create_user_roles_table', 1),
(29, '2018_03_11_000000_add_user_settings', 1),
(30, '2018_03_14_000000_add_details_to_data_types_table', 1),
(31, '2018_03_16_000000_make_settings_value_nullable', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'Pn1bCbqWPycSGG2oawQeoUWIcgJELNIFIKGFn0JV', 'http://localhost', 1, 0, 0, '2019-07-28 07:15:57', '2019-07-28 07:15:57'),
(2, NULL, 'Laravel Password Grant Client', 'J5rNfHdmUw1nIPVysbpICVzOx4wSimGIfBvdBDUk', 'http://localhost', 0, 1, 0, '2019-07-28 07:15:57', '2019-07-28 07:15:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-07-28 07:15:57', '2019-07-28 07:15:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o''nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-07-28 07:18:17', '2019-07-28 07:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(2, 'browse_bread', NULL, '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(3, 'browse_database', NULL, '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(4, 'browse_media', NULL, '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(5, 'browse_compass', NULL, '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(6, 'browse_menus', 'menus', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(7, 'read_menus', 'menus', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(8, 'edit_menus', 'menus', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(9, 'add_menus', 'menus', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(10, 'delete_menus', 'menus', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(11, 'browse_roles', 'roles', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(12, 'read_roles', 'roles', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(13, 'edit_roles', 'roles', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(14, 'add_roles', 'roles', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(15, 'delete_roles', 'roles', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(16, 'browse_users', 'users', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(17, 'read_users', 'users', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(18, 'edit_users', 'users', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(19, 'add_users', 'users', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(20, 'delete_users', 'users', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(21, 'browse_settings', 'settings', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(22, 'read_settings', 'settings', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(23, 'edit_settings', 'settings', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(24, 'add_settings', 'settings', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(25, 'delete_settings', 'settings', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(26, 'browse_hooks', NULL, '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(27, 'browse_categories', 'categories', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(28, 'read_categories', 'categories', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(29, 'edit_categories', 'categories', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(30, 'add_categories', 'categories', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(31, 'delete_categories', 'categories', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(32, 'browse_posts', 'posts', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(33, 'read_posts', 'posts', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(34, 'edit_posts', 'posts', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(35, 'add_posts', 'posts', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(36, 'delete_posts', 'posts', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(37, 'browse_pages', 'pages', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(38, 'read_pages', 'pages', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(39, 'edit_pages', 'pages', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(40, 'add_pages', 'pages', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(41, 'delete_pages', 'pages', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(71, 'delete_bus', 'bus', '2019-07-28 09:58:14', '2019-07-28 09:58:14'),
(70, 'add_bus', 'bus', '2019-07-28 09:58:14', '2019-07-28 09:58:14'),
(69, 'edit_bus', 'bus', '2019-07-28 09:58:14', '2019-07-28 09:58:14'),
(68, 'read_bus', 'bus', '2019-07-28 09:58:14', '2019-07-28 09:58:14'),
(67, 'browse_bus', 'bus', '2019-07-28 09:58:14', '2019-07-28 09:58:14'),
(72, 'browse_company', 'company', '2019-07-28 13:50:55', '2019-07-28 13:50:55'),
(73, 'read_company', 'company', '2019-07-28 13:50:55', '2019-07-28 13:50:55'),
(74, 'edit_company', 'company', '2019-07-28 13:50:55', '2019-07-28 13:50:55'),
(75, 'add_company', 'company', '2019-07-28 13:50:55', '2019-07-28 13:50:55'),
(76, 'delete_company', 'company', '2019-07-28 13:50:55', '2019-07-28 13:50:55'),
(77, 'browse_students', 'students', '2019-07-28 14:55:36', '2019-07-28 14:55:36'),
(78, 'read_students', 'students', '2019-07-28 14:55:36', '2019-07-28 14:55:36'),
(79, 'edit_students', 'students', '2019-07-28 14:55:36', '2019-07-28 14:55:36'),
(80, 'add_students', 'students', '2019-07-28 14:55:36', '2019-07-28 14:55:36'),
(81, 'delete_students', 'students', '2019-07-28 14:55:36', '2019-07-28 14:55:36'),
(82, 'browse_school', 'school', '2019-07-28 14:57:06', '2019-07-28 14:57:06'),
(83, 'read_school', 'school', '2019-07-28 14:57:06', '2019-07-28 14:57:06'),
(84, 'edit_school', 'school', '2019-07-28 14:57:06', '2019-07-28 14:57:06'),
(85, 'add_school', 'school', '2019-07-28 14:57:06', '2019-07-28 14:57:06'),
(86, 'delete_school', 'school', '2019-07-28 14:57:06', '2019-07-28 14:57:06');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-07-28 07:18:17', '2019-07-28 07:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-07-28 07:17:03', '2019-07-28 07:17:03'),
(2, 'user', 'Normal User', '2019-07-28 07:17:03', '2019-07-28 07:17:03');

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
CREATE TABLE IF NOT EXISTS `school` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'A', '2019-07-28 15:00:28', '2019-07-28 15:00:28');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `school_id`, `qr_code`, `created_at`, `updated_at`) VALUES
(1, 'Muhammad Shahid Muneer', 1, NULL, '2019-07-28 15:00:42', '2019-07-28 15:00:42');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o''nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(22, 'menu_items', 'title', 13, 'pt', 'Publicações', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(24, 'menu_items', 'title', 12, 'pt', 'Categorias', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(25, 'menu_items', 'title', 14, 'pt', 'Páginas', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-07-28 07:18:17', '2019-07-28 07:18:17'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-07-28 07:18:17', '2019-07-28 07:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mobile_number` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `mobile_number`, `bus_id`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$ITxIJNkMzq4pYFH2yLXzhePUczOeX2m/hDlbCw/juyBx.cWIjzpk.', 'tGbmgE7ieeKLFIfmTGU0KRWegnCkKlvIRYUZ4AKXbC8iekweOIoXH3ghhYMf', NULL, '2019-07-28 07:18:17', '2019-07-28 07:18:17', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_students`
--

DROP TABLE IF EXISTS `user_students`;
CREATE TABLE IF NOT EXISTS `user_students` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`student_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
