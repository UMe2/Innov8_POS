-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2024 at 05:52 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `invoice_no` text NOT NULL,
  `amount_due` int(11) NOT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_05_21_100000_create_teams_table', 1),
(7, '2020_05_21_200000_create_team_user_table', 1),
(8, '2020_05_21_300000_create_team_invitations_table', 1),
(9, '2024_02_01_094133_create_sessions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `recipient` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `recipient`, `message`, `type`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 'You have a purchase order awaiting your approval', 'order', '2024-04-19 09:55:18', '2024-04-16 14:02:10'),
(2, 3, 3, 'You have a purchase order awaiting your approval', 'action', '2024-04-19 09:58:31', '2024-04-16 14:02:55'),
(3, 3, 3, 'You have a purchase order awaiting your approval', 'action', '2024-04-19 09:58:40', '2024-04-16 14:03:03'),
(4, 3, 3, 'You have a purchase order awaiting your approval', 'payment', '2024-04-19 09:55:42', '2024-04-16 14:03:05'),
(5, 3, 3, 'You have a purchase order awaiting your approval', 'comment', '2024-04-19 09:55:52', '2024-04-16 14:03:07'),
(6, 5, 5, 'You have a purchase order awaiting your approval', 'action', '2024-04-19 09:59:16', '2024-04-19 08:23:34'),
(7, 5, 5, 'You have a purchase order awaiting your approval', 'approved', '2024-04-19 09:56:10', '2024-04-19 08:23:41'),
(8, 5, 5, 'You have a purchase order awaiting your approval', 'action', '2024-04-19 09:59:16', '2024-04-19 08:23:45'),
(9, 5, 5, 'You have a purchase order awaiting your approval', 'action', '2024-04-19 09:59:16', '2024-04-19 08:23:49'),
(10, 5, 5, 'You have a purchase order awaiting your approval', 'order', '2024-04-19 10:23:52', '2024-04-19 08:23:50'),
(11, 5, 5, 'You have a purchase order awaiting your approval', 'order', '2024-04-19 10:24:03', '2024-04-19 08:23:52'),
(12, 5, 5, 'You have a purchase order awaiting your approval', 'action', '2024-04-19 09:59:16', '2024-04-19 08:23:54'),
(13, 5, 5, 'You have a purchase order awaiting your approval', 'order', '2024-04-19 10:23:58', '2024-04-19 08:23:55'),
(14, 5, 5, 'You have a purchase order awaiting your approval', 'action', '2024-04-19 09:59:16', '2024-04-19 08:29:38'),
(15, 5, 5, 'You have a purchase order awaiting your approval', 'action', '2024-04-19 09:59:16', '2024-04-19 08:31:17'),
(16, 5, 5, 'your purchase order is pending payment from the Account department', 'payment', '2024-04-19 10:14:24', '2024-04-19 08:46:27'),
(17, 5, 5, 'your purchase order is pending payment from the Account department', 'Purchase Order', '2024-04-19 10:10:23', '2024-04-19 10:10:23'),
(18, 3, 6, 'You have a purchase order awaiting your approval', 'Purchase Order', '2024-04-19 13:10:04', '2024-04-19 13:10:04'),
(19, 3, 6, 'You have a purchase order awaiting your approval', 'Purchase Order', '2024-04-19 13:12:57', '2024-04-19 13:12:57'),
(20, 3, 6, 'You have a purchase order awaiting your approval', 'Purchase Order', '2024-04-19 13:14:36', '2024-04-19 13:14:36'),
(21, 3, 6, 'You have a purchase order awaiting your approval', 'Purchase Order', '2024-04-19 13:14:46', '2024-04-19 13:14:46'),
(22, 3, 6, 'You have a purchase order awaiting your approval', 'Purchase Order', '2024-04-19 13:15:05', '2024-04-19 13:15:05'),
(23, 3, 6, 'You have a purchase order awaiting your approval', 'Purchase Order', '2024-04-19 13:15:09', '2024-04-19 13:15:09');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `amount` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
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

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `category` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `code` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Security', '1300', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(2, 'Security', '130006', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(3, 'OFFICE MAINTENANCE', '130000', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(4, 'Repairs of Office Equipment', '130004', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(5, 'Form & Registration Expenses', '1300005', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(6, 'Contract Bid Documents', '130005A', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(7, 'Form & Registration Expenses - Other', '1300005', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(8, 'Repairs of Furniture & Fittings', '13006', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(9, 'Petty Cash Expenses', '1300006', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(11, 'OFFICE PROVISION', '130002', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(12, 'PRINTING AND STATIONERIES', '130003', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(13, 'RENT', '130100', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(18, 'BUILDING MAINTENANCE', '130200', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(25, 'ELECTRICITY', '130201', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(26, 'DIESEL', '130202', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(27, 'MAINTENANCE OF GENERATOR', '130203', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(28, 'CONSUMABLES FOR MAINTENANCE', '130205', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(29, 'REHABILITATION/CONSTR./RENOVATION', '130206', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(30, 'Drone Lab Project Expenses', '130206A', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(31, 'CONSUMABLES & MATERIAL(WORKSHOPS)', '130207', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(32, 'SUPPLIERS AND SERVICES', '130300', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(33, 'CATERING FEEDING SERVICES', '130301', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(34, 'AUDITOR', '130302', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(35, 'LAWYER', '130303', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(36, 'INTERNET', '130304', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(37, 'CONSULTANCY SERVICES', '130306', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(38, 'EMPLOYEE SALARY', '130400', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(39, 'SALARY NET', '130401', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(40, 'SALARY FOR PERMANENT STAFF', '130401A', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(41, 'SALARY FOR TEMPORARY STAFF', '130401B', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(42, 'CONTRACTING SERVICES', '130401C', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(43, 'OVERTIME', '130402', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(44, 'PENSION', '130404', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(45, 'TAXES', '130407', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(46, 'PAYE', '130407b', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(47, 'BONUS', '130408', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(48, 'Staff Welfare', '130409', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(49, 'BONUS - Other', '130408', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(50, 'Employee Insurance', '130411', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(51, 'CARS', '130500', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(52, 'FUEL', '130501', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(53, 'SERVICES', '130502', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(54, 'REPAIRS', '130503', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(55, 'SPARE PARTS', '130504', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(56, 'LICENSE DOCUMENTS', '130505', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(57, 'INSURANCE', '130506', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(58, 'DONATION/CONTRIBUTION', '130600', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(59, 'GIVING DONATION', '130601', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(60, 'PUBLICITY', '130700', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(61, 'WEBSITE MAINTENANCE', '130703', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(62, 'EVENTS', '130900', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(63, 'TRANSPORT AND FREIGHT', '131300', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(64, 'TRANSPORTATION FOR STAFF/OTHERS', '131302', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(65, 'FLIGHT TICKET', '131304', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(66, 'CUSTOMS DUTY/CLEARING EXPENSES', '131305', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(67, 'TRANSPORT OF GOODS', '131306', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(68, 'EXPERT', '131800', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(69, 'ALLOWANCE FOR EXPERT', '131801', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(70, 'SMART VILLAGE EXPENSES', '132200', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(71, 'Research for Impact', '134000', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(72, 'RESEARCH FOR IMPACT(BATCH 17)', '170900', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(73, 'Expert Expenses', '170901', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(74, 'Feeding', '170902', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(75, 'Material', '170903', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(76, 'Welcome Sets(Souvenirs)', '170904', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(77, 'Hotel Accommodation', '170905', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(78, 'Training Cost', '170906', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(79, 'Transport', '170907', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(80, 'Allowance for Participants', '170908', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(81, 'RESEARCH FOR IMPACT(BATCH 18)', '180900', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(82, 'Expert Expenses', '180901', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(83, 'Feeding', '180902', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(84, 'Material', '180903', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(85, 'Welcome Sets(Souvenirs)', '180904', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(86, 'Hotel Accommodation', '180905', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(87, 'Training Cost', '180906', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(88, 'Transport', '180907', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(89, 'Allowance For Participants', '180908', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(90, 'RESEARCH FOR IMPACT(BATCH 19)', '190900', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(91, 'Expert Expenses', '190901', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(92, 'Feeding', '190902', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(93, 'Material', '190903', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(94, 'Welcome Sets(Souvenirs)', '190904', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(95, 'Hotel Accommodation', '190905', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(96, 'Training Cost', '190906', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(97, 'Transport', '190907', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(98, 'Allowance For Participants', '190908', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(99, 'RESEARCH FOR IMPACT(BATCH 20)', '200900', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(100, 'Expert Expenses', '200901', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(101, 'Feeding', '200902', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(102, 'Material', '200903', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(103, 'Welcome Sets(Souvenirs)', '200904', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(104, 'Hotel Accommodation', '200905', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(105, 'Training Cost', '200906', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(106, 'Transport', '200907', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(107, 'Allowance For Participants', '200908', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(108, 'RESEARCH FOR IMPACT(BATCH 21)', '210900', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(109, 'Expert Expenses', '210901', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(110, 'Feeding', '210902', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(111, 'Material', '210903', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(112, 'Welcome Sets(Souvenirs)', '210904', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(113, 'Hotel Accommodation', '210905', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(114, 'Training Cost', '210906', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(115, 'Transport', '210907', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(116, 'Allowance For Participants', '210908', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(117, 'RESEARCH FOR IMPACT(BATCH 22)', '220900', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(118, 'Expert Expenses', '220901', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(119, 'Feeding', '220902', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(120, 'Material', '220903', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(121, 'Welcome Sets(Souvenirs)', '220904', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(122, 'Hotel Accommodation', '220905', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(123, 'Training Cost', '220906', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(124, 'Transport', '220907', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(125, 'Allowance For Participants', '220908', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(126, 'RESEARCH FOR IMPACT(BATCH 23)', '230900', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(127, 'Expert Expenses', '230901', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(128, 'Feeding', '230902', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(129, 'Material', '230903', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(130, 'Welcome Sets(Souvenirs)', '230904', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(131, 'Hotel Accommodation', '230905', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(132, 'Training Cost', '230906', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(133, 'Transport', '230907', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(134, 'Allowance For Participants', '230908', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(135, 'RESEARCH FOR IMPACT(BATCH 24)', '240900', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(136, 'Expert Expenses', '240901', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(137, 'Feeding', '240902', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(138, 'Material', '240903', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(139, 'Welcome Sets(Souvenirs)', '240904', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(140, 'Hotel Accommodation', '240905', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(141, 'Training Cost', '240906', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(142, 'Transport', '240907', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(143, 'Allowance For Participants', '240908', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(144, 'TETFAIR', '135000', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(145, 'TETFAIR 2 & 3', '135100', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(146, 'External Expert', '135101', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(147, 'Material & Consumable', '135102', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(148, 'Flight Tickets & Transport', '135103', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(149, 'Experts Flight Ticket Expenses', '135104', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(150, 'Hotel Accommodation', '135105', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(151, 'Allowance(Participant)', '135106', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(152, 'Bags', '135107', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(153, 'Feeding', '135108', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(154, 'Training Cost', '135109', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(155, 'Closing Events', '135110', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(156, 'TETFAIR 4', '135200', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(157, 'External Expert', '135201', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(158, 'Material & Consumables', '135202', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(159, 'Field Trip Expenses', '135203', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(160, 'Flight Tickets & Transport', '135204', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(161, 'Expert Flight Ticket Expenses', '135205', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(162, 'Hotel Accommodation Expenses', '135206', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(163, 'Settling-In/Accom. Allowance', '145000', '2024-03-07 08:38:07', '2024-03-07 08:38:07'),
(164, 'GM Expenses', '149000', '2024-03-07 08:38:07', '2024-03-07 08:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `from_user` text NOT NULL,
  `to_user` text NOT NULL,
  `status` text NOT NULL,
  `type` text NOT NULL,
  `inv_no` text NOT NULL,
  `privilege` int(11) DEFAULT NULL,
  `amount_paid` int(11) DEFAULT NULL,
  `product_category_id` text NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='store purchase orders';

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `title`, `from_user`, `to_user`, `status`, `type`, `inv_no`, `privilege`, `amount_paid`, `product_category_id`, `vendor_id`, `created_at`, `updated_at`) VALUES
(26, '', '6', '7', 'pending', 'pufull', '', 3, 20000, '2', 3, '2024-02-22 08:52:18', '2024-02-22 08:52:18'),
(27, '', '6', '7', 'pending', '', '34674', 3, NULL, '2', 3, '2024-02-22 08:53:16', '2024-02-22 08:53:16'),
(28, '', '6', '7', 'paid', 'full', '', 4, NULL, '2', 3, '2024-03-05 08:15:40', '2024-04-19 10:42:52'),
(29, '', '6', '7', 'pending', 'full', '', 4, NULL, '3', 3, '2024-03-05 08:15:42', '2024-03-05 08:15:42'),
(30, '', '3', '6', 'pending', 'full', '', 3, NULL, '4', 3, '2024-03-05 08:15:59', '2024-03-05 08:15:59'),
(31, '', '4', '6', 'pending', 'full', '', 4, NULL, '1', 3, '2024-03-05 08:15:59', '2024-03-05 08:15:59'),
(32, '', '4', '6', 'pending', 'full', '', 4, NULL, '5', 3, '2024-03-05 08:16:00', '2024-03-05 08:16:00'),
(33, '', '3', '6', 'pending', 'full', '', 3, NULL, '2', 3, '2024-03-05 08:16:00', '2024-03-05 08:16:00'),
(34, '', '4', '6', 'pending', 'full', '', 4, NULL, '4', 3, '2024-03-05 08:28:19', '2024-03-05 08:28:19'),
(35, '', '3', '6', 'paid', 'full', '', 4, NULL, '4', 3, '2024-03-05 08:28:26', '2024-03-05 14:51:56'),
(36, '', '4', '6', 'declined', 'full', '', 4, NULL, '4', 3, '2024-03-05 08:29:51', '2024-03-05 12:50:35'),
(37, '', '3', '6', 'pending', 'advance', '', 4, NULL, '4', 3, '2024-03-05 08:29:55', '2024-03-12 16:59:09'),
(38, '', '4', '6', 'paid', 'full', '', NULL, NULL, '4', 3, '2024-03-05 08:31:38', '2024-03-05 14:50:35'),
(39, '', '4', '6', 'paid', 'expense', '', NULL, 100000, '3', 2, '2024-03-05 15:44:29', '2024-03-05 15:48:05'),
(40, '', '7', '2', 'pending', 'full', '', NULL, NULL, '18', 3, '2024-03-07 10:25:12', '2024-03-07 10:25:12'),
(41, '', '7', '7', 'pending', 'full', '', NULL, NULL, '26', 3, '2024-03-07 10:42:51', '2024-03-07 10:42:51'),
(42, '', '6', '7', 'approved', 'full', '', NULL, NULL, '8', 2, '2024-04-02 09:29:02', '2024-04-02 09:29:02'),
(43, '', '6', '7', 'pending', 'full', '', NULL, NULL, '8', 2, '2024-04-02 09:29:07', '2024-04-02 09:29:07'),
(51, '', '5', '5', 'pending', 'full', '', 5, NULL, '29', 2, '2024-04-19 08:20:20', '2024-04-19 08:20:20'),
(52, '', '5', '5', 'pending', 'full', '', 5, NULL, '29', 2, '2024-04-19 08:21:20', '2024-04-19 08:21:20'),
(53, '', '5', '5', 'approved', 'full', '', 5, NULL, '6', 3, '2024-04-19 08:23:34', '2024-04-19 08:23:34'),
(54, '', '5', '5', 'approved', 'full', '', 5, NULL, '6', 3, '2024-04-19 08:23:41', '2024-04-19 08:23:41'),
(55, '', '5', '5', 'approved', 'full', '', 5, NULL, '6', 3, '2024-04-19 08:23:45', '2024-04-19 08:23:45'),
(56, '', '5', '5', 'approved', 'advance', '', 5, NULL, '6', 3, '2024-04-19 08:23:49', '2024-04-19 08:23:49'),
(57, '', '5', '5', 'approved', 'advance', '', 5, NULL, '6', 3, '2024-04-19 08:23:50', '2024-04-19 08:23:50'),
(58, '', '5', '5', 'approved', 'full', '', 5, NULL, '6', 3, '2024-04-19 08:23:52', '2024-04-19 08:23:52'),
(59, '', '5', '5', 'approved', 'full', '', 5, NULL, '6', 3, '2024-04-19 08:23:54', '2024-04-19 08:23:54'),
(60, '', '5', '5', 'approved', 'full', '', 5, NULL, '6', 3, '2024-04-19 08:23:55', '2024-04-19 08:23:55'),
(61, '', '5', '5', 'approved', 'full', '', 5, NULL, '5', 2, '2024-04-19 08:29:38', '2024-04-19 08:29:38'),
(62, '', '5', '5', 'approved', 'full', '', 5, NULL, '5', 2, '2024-04-19 08:31:17', '2024-04-19 08:31:17'),
(63, '', '5', '5', 'approved', 'full', '', 5, NULL, '29', 2, '2024-04-19 08:46:27', '2024-04-19 08:46:27'),
(64, '', '5', '5', 'approved', 'full', '', 5, NULL, '5', 3, '2024-04-19 10:10:23', '2024-04-19 10:10:23'),
(65, '', '3', '6', 'pending', 'full', '', 3, 40000, '27', 1, '2024-04-19 13:10:04', '2024-04-19 13:10:04'),
(66, '', '3', '6', 'pending', 'full', '', 3, 40000, '27', 1, '2024-04-19 13:12:57', '2024-04-19 13:12:57'),
(67, '', '3', '6', 'pending', 'advance', '', 3, 2000, '6', 3, '2024-04-19 13:14:36', '2024-04-19 13:14:36'),
(68, '', '3', '6', 'pending', 'advance', '', 3, 40000, '6', 3, '2024-04-19 13:14:45', '2024-04-19 13:14:45'),
(69, '', '3', '6', 'pending', 'refund', '', 3, 40000, '6', 3, '2024-04-19 13:15:05', '2024-04-19 13:15:05'),
(70, '', '3', '6', 'pending', 'full', 'INV-453', 3, 40000, '6', 3, '2024-04-19 13:15:09', '2024-04-19 13:15:09');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_comments`
--

CREATE TABLE `purchase_order_comments` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `item` text NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `remarks` text DEFAULT NULL,
  `amount_due` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_order_items`
--

INSERT INTO `purchase_order_items` (`id`, `purchase_order_id`, `item`, `price`, `quantity`, `remarks`, `amount_due`, `created_at`, `updated_at`) VALUES
(1, 11, '', 10, 10, NULL, NULL, '2024-02-13 08:23:04', '2024-02-13 08:23:04'),
(2, 11, '', 10, 10, NULL, NULL, '2024-02-13 08:23:04', '2024-02-13 08:23:04'),
(3, 12, 'product 1', 10, 10, NULL, NULL, '2024-02-13 12:37:56', '2024-02-13 12:37:56'),
(4, 12, 'product 2', 13, 14, NULL, NULL, '2024-02-13 12:37:56', '2024-02-13 12:37:56'),
(5, 12, 'product 3', 1300, 18, NULL, NULL, '2024-02-13 12:37:56', '2024-02-13 12:37:56'),
(6, 12, 'product 4', 20000, 5, NULL, NULL, '2024-02-13 12:37:56', '2024-02-13 12:37:56'),
(7, 12, 'product 5', 120000, 2, NULL, NULL, '2024-02-13 12:37:56', '2024-02-13 12:37:56'),
(8, 13, 'product 1', 10, 10, NULL, NULL, '2024-02-13 12:38:40', '2024-02-13 12:38:40'),
(9, 13, 'product 2', 13, 14, NULL, NULL, '2024-02-13 12:38:40', '2024-02-13 12:38:40'),
(10, 13, 'product 3', 1300, 18, NULL, NULL, '2024-02-13 12:38:40', '2024-02-13 12:38:40'),
(11, 13, 'product 4', 20000, 5, NULL, NULL, '2024-02-13 12:38:40', '2024-02-13 12:38:40'),
(12, 13, 'product 5', 120000, 2, NULL, NULL, '2024-02-13 12:38:40', '2024-02-13 12:38:40'),
(13, 14, 'product 1', 10, 10, NULL, NULL, '2024-02-13 12:38:42', '2024-02-13 12:38:42'),
(14, 14, 'product 2', 13, 14, NULL, NULL, '2024-02-13 12:38:42', '2024-02-13 12:38:42'),
(15, 14, 'product 3', 1300, 18, NULL, NULL, '2024-02-13 12:38:42', '2024-02-13 12:38:42'),
(16, 14, 'product 4', 20000, 5, NULL, NULL, '2024-02-13 12:38:42', '2024-02-13 12:38:42'),
(17, 14, 'product 5', 120000, 2, NULL, NULL, '2024-02-13 12:38:42', '2024-02-13 12:38:42'),
(18, 15, 'product 1', 10, 10, NULL, NULL, '2024-02-13 12:38:43', '2024-02-13 12:38:43'),
(19, 15, 'product 2', 13, 14, NULL, NULL, '2024-02-13 12:38:43', '2024-02-13 12:38:43'),
(20, 15, 'product 3', 1300, 18, NULL, NULL, '2024-02-13 12:38:43', '2024-02-13 12:38:43'),
(21, 15, 'product 4', 20000, 5, NULL, NULL, '2024-02-13 12:38:43', '2024-02-13 12:38:43'),
(22, 15, 'product 5', 120000, 2, NULL, NULL, '2024-02-13 12:38:43', '2024-02-13 12:38:43'),
(23, 16, 'product 1', 10, 10, NULL, NULL, '2024-02-13 12:38:56', '2024-02-13 12:38:56'),
(24, 16, 'product 2', 13, 14, NULL, NULL, '2024-02-13 12:38:56', '2024-02-13 12:38:56'),
(25, 16, 'product 3', 1300, 18, NULL, NULL, '2024-02-13 12:38:56', '2024-02-13 12:38:56'),
(26, 16, 'product 4', 20000, 5, NULL, NULL, '2024-02-13 12:38:56', '2024-02-13 12:38:56'),
(27, 16, 'product 5', 120000, 2, NULL, NULL, '2024-02-13 12:38:56', '2024-02-13 12:38:56'),
(28, 17, 'product 1', 10, 10, NULL, NULL, '2024-02-13 12:38:57', '2024-02-13 12:38:57'),
(29, 17, 'product 2', 13, 14, NULL, NULL, '2024-02-13 12:38:57', '2024-02-13 12:38:57'),
(30, 17, 'product 3', 1300, 18, NULL, NULL, '2024-02-13 12:38:57', '2024-02-13 12:38:57'),
(31, 17, 'product 4', 20000, 5, NULL, NULL, '2024-02-13 12:38:57', '2024-02-13 12:38:57'),
(32, 17, 'product 5', 120000, 2, NULL, NULL, '2024-02-13 12:38:57', '2024-02-13 12:38:57'),
(33, 18, 'product 1', 10, 10, NULL, NULL, '2024-02-13 12:38:57', '2024-02-13 12:38:57'),
(34, 18, 'product 2', 13, 14, NULL, NULL, '2024-02-13 12:38:57', '2024-02-13 12:38:57'),
(35, 18, 'product 3', 1300, 18, NULL, NULL, '2024-02-13 12:38:57', '2024-02-13 12:38:57'),
(36, 18, 'product 4', 20000, 5, NULL, NULL, '2024-02-13 12:38:57', '2024-02-13 12:38:57'),
(37, 18, 'product 5', 120000, 2, NULL, NULL, '2024-02-13 12:38:57', '2024-02-13 12:38:57'),
(38, 19, 'product 1', 10, 10, NULL, NULL, '2024-02-13 12:38:57', '2024-02-13 12:38:57'),
(39, 19, 'product 2', 13, 14, NULL, NULL, '2024-02-13 12:38:57', '2024-02-13 12:38:57'),
(40, 19, 'product 3', 1300, 18, NULL, NULL, '2024-02-13 12:38:57', '2024-02-13 12:38:57'),
(41, 19, 'product 4', 20000, 5, NULL, NULL, '2024-02-13 12:38:57', '2024-02-13 12:38:57'),
(42, 19, 'product 5', 120000, 2, NULL, NULL, '2024-02-13 12:38:57', '2024-02-13 12:38:57'),
(43, 20, 'product 1', 10, 10, NULL, NULL, '2024-02-13 12:38:58', '2024-02-13 12:38:58'),
(44, 20, 'product 2', 13, 14, NULL, NULL, '2024-02-13 12:38:58', '2024-02-13 12:38:58'),
(45, 20, 'product 3', 1300, 18, NULL, NULL, '2024-02-13 12:38:58', '2024-02-13 12:38:58'),
(46, 20, 'product 4', 20000, 5, NULL, NULL, '2024-02-13 12:38:58', '2024-02-13 12:38:58'),
(47, 20, 'product 5', 120000, 2, NULL, NULL, '2024-02-13 12:38:58', '2024-02-13 12:38:58'),
(48, 21, 'tissue', 4000, 10, NULL, NULL, '2024-02-20 09:08:50', '2024-02-20 09:08:50'),
(49, 21, 'tissue', 4000, 10, NULL, NULL, '2024-02-20 09:08:50', '2024-02-20 09:08:50'),
(50, 21, 'tissue', 4000, 10, NULL, NULL, '2024-02-20 09:08:50', '2024-02-20 09:08:50'),
(51, 22, 'tissue', 4000, 10, NULL, NULL, '2024-02-20 09:08:54', '2024-02-20 09:08:54'),
(52, 22, 'tissue', 4000, 10, NULL, NULL, '2024-02-20 09:08:54', '2024-02-20 09:08:54'),
(53, 22, 'tissue', 4000, 10, NULL, NULL, '2024-02-20 09:08:54', '2024-02-20 09:08:54'),
(54, 23, 'tissue', 4000, 10, NULL, NULL, '2024-02-20 09:08:54', '2024-02-20 09:08:54'),
(55, 23, 'tissue', 4000, 10, NULL, NULL, '2024-02-20 09:08:54', '2024-02-20 09:08:54'),
(56, 23, 'tissue', 4000, 10, NULL, NULL, '2024-02-20 09:08:54', '2024-02-20 09:08:54'),
(57, 25, 'fuel', 30000, 1, NULL, NULL, '2024-02-20 13:13:04', '2024-02-20 13:13:04'),
(58, 26, 'Tetfair', 1400, 10, NULL, NULL, '2024-02-22 08:52:18', '2024-02-22 08:52:18'),
(59, 27, 'Tetfair', 1400, 10, NULL, NULL, '2024-02-22 08:53:16', '2024-02-22 08:53:16'),
(60, 27, 'dc motor', 1000, 2, NULL, NULL, '2024-02-22 08:53:16', '2024-02-22 08:53:16'),
(61, 27, '', 0, 0, NULL, NULL, '2024-02-22 08:53:16', '2024-02-22 08:53:16'),
(62, 28, '', 20, 30, NULL, NULL, '2024-03-05 08:15:40', '2024-03-05 08:15:40'),
(63, 28, 'Tetfair', 200, 12, NULL, NULL, '2024-03-05 08:15:40', '2024-03-05 08:15:40'),
(64, 29, '', 20, 30, NULL, NULL, '2024-03-05 08:15:42', '2024-03-05 08:15:42'),
(65, 29, 'Tetfair', 200, 12, NULL, NULL, '2024-03-05 08:15:42', '2024-03-05 08:15:42'),
(66, 34, 'Tetfair', 500, 4, NULL, NULL, '2024-03-05 08:28:19', '2024-03-05 08:28:19'),
(67, 35, 'Tetfair', 500, 4, NULL, NULL, '2024-03-05 08:28:26', '2024-03-05 08:28:26'),
(68, 36, 'fuel pump', 5900, 1, NULL, NULL, '2024-03-05 08:29:51', '2024-03-05 08:29:51'),
(69, 37, 'fuel pump', 5900, 1, NULL, NULL, '2024-03-05 08:29:55', '2024-03-05 08:29:55'),
(70, 38, 'blakc box', 20, 2, NULL, NULL, '2024-03-05 08:31:38', '2024-03-05 08:31:38'),
(71, 39, 'ink', 67000, 3, NULL, NULL, '2024-03-05 15:44:29', '2024-03-05 15:44:29'),
(72, 40, 'tissue', 450, 44, NULL, NULL, '2024-03-07 10:25:12', '2024-03-07 10:25:12'),
(73, 41, 'diesel 20 litres', 1560, 20, NULL, NULL, '2024-03-07 10:42:51', '2024-03-07 10:42:51'),
(74, 42, 'Tetfair', 3, 2, NULL, NULL, '2024-04-02 09:29:02', '2024-04-02 09:29:02'),
(75, 43, 'Tetfair', 3, 2, NULL, NULL, '2024-04-02 09:29:07', '2024-04-02 09:29:07'),
(76, 44, 'Fuel', 680, 12, NULL, NULL, '2024-04-16 13:55:50', '2024-04-16 13:55:50'),
(77, 45, 'rtx', 20000, 1, NULL, NULL, '2024-04-16 14:00:21', '2024-04-16 14:00:21'),
(78, 46, 'rtx', 12000, 12, NULL, NULL, '2024-04-16 14:02:10', '2024-04-16 14:02:10'),
(79, 47, 'rtx', 12000, 12, NULL, NULL, '2024-04-16 14:02:55', '2024-04-16 14:02:55'),
(80, 48, 'rtx', 12000, 12, NULL, NULL, '2024-04-16 14:03:03', '2024-04-16 14:03:03'),
(81, 49, 'rtx', 12000, 12, NULL, NULL, '2024-04-16 14:03:05', '2024-04-16 14:03:05'),
(82, 50, 'rtx', 12000, 12, NULL, NULL, '2024-04-16 14:03:07', '2024-04-16 14:03:07'),
(83, 51, 'Synthetic', 12000, 12, NULL, NULL, '2024-04-19 08:20:20', '2024-04-19 08:20:20'),
(84, 52, 'Synthetic', 12000, 12, NULL, NULL, '2024-04-19 08:21:20', '2024-04-19 08:21:20'),
(85, 53, 'Synthetic', 4000, 12, NULL, NULL, '2024-04-19 08:23:34', '2024-04-19 08:23:34'),
(86, 54, 'Synthetic', 4000, 12, NULL, NULL, '2024-04-19 08:23:41', '2024-04-19 08:23:41'),
(87, 55, 'Synthetic', 4000, 12, NULL, NULL, '2024-04-19 08:23:45', '2024-04-19 08:23:45'),
(88, 56, 'Synthetic', 4000, 12, NULL, NULL, '2024-04-19 08:23:49', '2024-04-19 08:23:49'),
(89, 57, 'Synthetic', 4000, 12, NULL, NULL, '2024-04-19 08:23:50', '2024-04-19 08:23:50'),
(90, 58, 'Synthetic', 4000, 12, NULL, NULL, '2024-04-19 08:23:52', '2024-04-19 08:23:52'),
(91, 59, 'Synthetic', 4000, 12, NULL, NULL, '2024-04-19 08:23:54', '2024-04-19 08:23:54'),
(92, 60, 'Synthetic', 4000, 12, NULL, NULL, '2024-04-19 08:23:55', '2024-04-19 08:23:55'),
(93, 61, 'Synthetic', 6000, 2000, NULL, NULL, '2024-04-19 08:29:38', '2024-04-19 08:29:38'),
(94, 62, 'Synthetic', 2000, 12, NULL, NULL, '2024-04-19 08:31:17', '2024-04-19 08:31:17'),
(95, 62, 'Synthetic', 212, 12, NULL, NULL, '2024-04-19 08:31:17', '2024-04-19 08:31:17'),
(96, 63, 'Synthetic', 200, 12, NULL, NULL, '2024-04-19 08:46:27', '2024-04-19 08:46:27'),
(97, 64, 'Synthetic', 50000, 2, NULL, NULL, '2024-04-19 10:10:23', '2024-04-19 10:10:23'),
(98, 65, 'synthetic', 12300, 12, NULL, NULL, '2024-04-19 13:10:04', '2024-04-19 13:10:04'),
(99, 66, 'synthetic', 12300, 12, NULL, NULL, '2024-04-19 13:12:57', '2024-04-19 13:12:57'),
(100, 67, '12', 222, 2333, NULL, NULL, '2024-04-19 13:14:36', '2024-04-19 13:14:36'),
(101, 68, '12', 222, 2333, NULL, NULL, '2024-04-19 13:14:46', '2024-04-19 13:14:46'),
(102, 69, '12', 222, 2333, NULL, NULL, '2024-04-19 13:15:05', '2024-04-19 13:15:05'),
(103, 70, '12', 222, 2333, NULL, NULL, '2024-04-19 13:15:09', '2024-04-19 13:15:09');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('09CZDlCsPPy8QXWk45ryK8rGqNCkznxD0ScKEHg4', 8, '192.168.100.148', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidUlLaDRhWVFCT2FzTEZ6YkZsQVRYYlExWFJDQmtydjZCYmVLOXI2UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xOTIuMTY4LjEwMS41L2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjg7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTIkN2F4dGkwZ3lPdVJRWUguSXo4Vm9ILkoxNUdiTUgycGxncDd6UDJKWDFvaDlLQmVmUHp6RnEiO30=', 1713537807),
('gyRdcEpu9BmIAfOicMal2jQ4qJZJS7nCYCL6i4LQ', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiaUFvbFR3Wm8wM2FUV29sdjREUWNmMEdwV1QxaTR0VnNyaHpKejBzcyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMzOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvbWFrZXJlcXVlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJE8yNXB0RjkvN2ZGTTB5SE5zcFh5dnVwaDB2MG1ZakpoWUZQOUlmRmx5bU40MnVRNUhKaU11Ijt9', 1713538244),
('LsRAPPmThGVetC63EDMypjsLbA8JyGixKeK9onV4', NULL, '192.168.101.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZ3d6Y2dwcU1xMWV5Rnp2VEx1NjVkbU5XSUpaRTAyUWdkVXZLSWhnaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjEwMS41L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMDoiaHR0cDovLzE5Mi4xNjguMTAxLjUvZGFzaGJvYXJkIjt9fQ==', 1713537771),
('M6eQFPSAXKiMqUYUIrJo67xy4Rv4GdCoRfsIRRoJ', 8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiNUgxTnZITldJeU84dzVINkVFTGZCNkpPNXpkeHdKaWtkb2tqMGh1MyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZGRwcm9kdWN0cyI7fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo4O3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJDdheHRpMGd5T3VSUVlILkl6OFZvSC5KMTVHYk1IMnBsZ3A3elAySlgxb2g5S0JlZlB6ekZxIjt9', 1713541224),
('pNFOkExTvjcshQJzMWwSFGevMwgBWHeNHKj5GMid', NULL, '192.168.100.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibktPSlg5bVpuc0laWGhDcktqY291Q3prVFpuemdNMjZCeExOMk1aQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjEwMS41L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1713536398),
('Q6V8RAPYgsSACfIKWfueJnqz8s2ex9yalI5ZqFYI', 8, '192.168.100.148', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoibDFuVlFVeGh1RElTRkdJTnluQmUyWW85Y09vSEhOYkVmbkZMODU1NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xOTIuMTY4LjEwMS41L2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo4O3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJDdheHRpMGd5T3VSUVlILkl6OFZvSC5KMTVHYk1IMnBsZ3A3elAySlgxb2g5S0JlZlB6ekZxIjt9', 1713541902),
('UkcoN9u1xrFCXaNRg3MpaNhwV4X6vLX26Ps9ZuFZ', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWE5EcklYcXBRZkhLQ3IyWUlnWEhpZnM1MmlMeXlqWlVXR2ZFSGd1bSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wdXJjaGFzZW9yZGVyL3ZpZXcvNzAiO31zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiQ2QkROdWZKbEpxMDZoWkwwZWtPSVFlNUg3d1Z5WFA2NlR0Sjk0SHYxOVlyVE1uYWlCbkRCZSI7fQ==', 1713537456);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin\'s Team', 1, '2024-02-01 09:11:14', '2024-02-01 09:11:14'),
(2, 1, 'HR', 0, '2024-02-29 08:50:26', '2024-02-29 08:50:26'),
(3, 1, 'GM', 0, '2024-02-29 08:52:01', '2024-02-29 08:52:01'),
(4, 1, 'Deputy GM', 0, '2024-02-29 08:52:12', '2024-02-29 08:52:12'),
(5, 1, 'Accountants', 0, '2024-02-29 08:52:24', '2024-02-29 08:52:24'),
(6, 1, 'Impact Lab', 0, '2024-02-29 08:52:52', '2024-02-29 08:52:52'),
(7, 1, 'Admin (Eve)', 0, '2024-02-29 08:53:11', '2024-02-29 08:53:11'),
(8, 3, 'Nizor\'s Team', 1, '2024-03-21 11:08:00', '2024-03-21 11:08:00'),
(9, 4, 'Eve\'s Team', 1, '2024-03-21 11:09:11', '2024-03-21 11:09:11'),
(10, 5, 'Meir\'s Team', 1, '2024-03-21 11:10:04', '2024-03-21 11:10:04'),
(11, 6, 'HR\'s Team', 1, '2024-03-21 11:10:54', '2024-03-21 11:10:54'),
(12, 7, 'Deji\'s Team', 1, '2024-03-29 11:32:01', '2024-03-29 11:32:01'),
(13, 8, 'Accountants\'s Team', 1, '2024-04-02 11:54:49', '2024-04-02 11:54:49');

-- --------------------------------------------------------

--
-- Table structure for table `team_invitations`
--

CREATE TABLE `team_invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `privilege` int(11) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `privilege`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'abrar.i@innov8hub.ng', NULL, 6, '$2y$12$B2ccb7vomA0noOqyUcMYbOZ6t.iTEYPIoCZ4H/H0pSd2vwm3N2e86', NULL, NULL, NULL, 'AH5gchAMLKXURt4LLlrnsti4SMLaaLT0V5E8pkBclVHt1pgeLIQRB6A3ELwH', 1, NULL, '2024-02-01 09:11:14', '2024-04-03 11:59:39'),
(2, 'admin', 'abrar.i@innov8hub.ngg', NULL, NULL, '$2y$12$6PxA3ZVyylO8TNw84TDCgONAiBsEQ0Lwz3Msi7W7UvIeEvnGYbBNq', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-01 09:43:23', '2024-02-01 09:43:23'),
(3, 'Nizor', 'nizor.i@innov8hub.ng', NULL, 2, '$2y$12$O25ptF9/7fFM0yHNspXyvuph0v0mYjJhYFP9IfFlymN42uQ5HJiMu', NULL, NULL, NULL, 'kefq49OsFmWE1iY4YnzOsov8byseZj3JWHxMlxuunnanmZLxD52q28XKkr0b', 8, NULL, '2024-03-21 11:08:00', '2024-03-21 11:08:01'),
(4, 'Eve', 'admin@innov8hub.ng', NULL, 2, '$2y$12$ydBN58SK9wMEiwg7ZtXKgebJTp6m25K.Xc89baFuzwQqs0TP5eKb2', NULL, NULL, NULL, NULL, 9, NULL, '2024-03-21 11:09:11', '2024-03-21 11:09:12'),
(5, 'G.M', 'gm@innov8hub.ng', NULL, 5, '$2y$12$Vo/tk.acIrwV0.yxPlhYGeP2x7LXBDWUFQCBnj4k8NhD5/86Mbw2m', NULL, NULL, NULL, NULL, 10, NULL, '2024-03-21 11:10:04', '2024-03-21 11:10:05'),
(6, 'HR', 'hr@innov8hub.ng', NULL, 3, '$2y$12$6BDNufJlJq06hZL0ekOIQe5H7wVyXP66TtJ94Hv19YrTMnaiBnDBe', NULL, NULL, NULL, NULL, 11, NULL, '2024-03-21 11:10:54', '2024-03-21 11:10:55'),
(7, 'Deputy GM', 'deji.i@innov8hub.ng', NULL, 4, '$2y$12$Fu9GTvOqKINuc1p8HDOODuknexHVu0uZ84bWCR.4HwPAHNYWQepFe', NULL, NULL, NULL, NULL, 12, NULL, '2024-03-29 11:32:01', '2024-03-29 11:32:01'),
(8, 'Accountants', 'accountants@innov8hub.ng', NULL, 1, '$2y$12$7axti0gyOuRQYH.Iz8VoH.J15GbMH2plgp7zP2JX1oh9KBefPzzFq', NULL, NULL, NULL, 'omdwzE9SeQJ3OFVBFOtjWOdGsEHqFqFR4jYEo3vJFe8WtGfMljXrHpX0I5PH', 13, NULL, '2024-04-02 11:54:49', '2024-04-02 11:54:50');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Hub 360', 'Garki, Abuja', '2024-02-22 09:27:35', '2024-02-22 09:27:35'),
(2, 'YSl Technologies', 'Jabi, Abuja', '2024-02-22 09:27:35', '2024-02-22 09:27:35'),
(3, 'ABC solutions', 'Airport road, abuja', '2024-02-22 09:44:42', '2024-02-22 09:44:42'),
(4, 'Nelson tech', 'maitama, abuja', '2024-02-22 10:17:09', '2024-02-22 10:17:09'),
(5, '', '', '2024-04-19 14:40:38', '2024-04-19 14:40:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_comments`
--
ALTER TABLE `purchase_order_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indexes for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`);

--
-- Indexes for table `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `purchase_order_comments`
--
ALTER TABLE `purchase_order_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `team_invitations`
--
ALTER TABLE `team_invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
