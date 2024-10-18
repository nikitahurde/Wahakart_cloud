-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 26, 2023 at 05:51 AM
-- Server version: 10.5.19-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u432726438_sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `back_order_list`
--

CREATE TABLE `back_order_list` (
  `id` int(30) NOT NULL,
  `receiving_id` int(30) NOT NULL,
  `po_id` int(30) NOT NULL,
  `bo_code` varchar(50) NOT NULL,
  `supplier_id` int(30) NOT NULL,
  `amount` float NOT NULL,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = partially received, 2 =received',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `back_order_list_man`
--

CREATE TABLE `back_order_list_man` (
  `id` int(30) NOT NULL,
  `receiving_id` int(30) NOT NULL,
  `po_id` int(30) NOT NULL,
  `bo_code` varchar(50) NOT NULL,
  `supplier_id` int(30) NOT NULL,
  `amount` float NOT NULL,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = partially received, 2 =received',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `back_order_list_prod`
--

CREATE TABLE `back_order_list_prod` (
  `id` int(30) NOT NULL,
  `receiving_id` int(30) NOT NULL,
  `po_id` int(30) NOT NULL,
  `bo_code` varchar(50) NOT NULL,
  `supplier_id` int(30) NOT NULL,
  `amount` float NOT NULL,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = partially received, 2 =received',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bo_items`
--

CREATE TABLE `bo_items` (
  `bo_id` int(30) NOT NULL,
  `item_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `unit` varchar(50) NOT NULL,
  `total` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bo_items_man`
--

CREATE TABLE `bo_items_man` (
  `bo_id` int(30) NOT NULL,
  `item_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `unit` varchar(50) NOT NULL,
  `total` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bo_items_prod`
--

CREATE TABLE `bo_items_prod` (
  `bo_id` int(30) NOT NULL,
  `item_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `unit` varchar(50) NOT NULL,
  `total` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `brands_name` varchar(255) NOT NULL,
  `brands_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brands_name`, `brands_status`) VALUES
(1, 'SPIRITS', 1),
(2, 'FERMENTED', 1),
(3, 'MILD', 1),
(4, 'WINE', 1),
(5, 'C.L.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `categories_name` varchar(255) NOT NULL,
  `categories_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories_name`, `categories_status`) VALUES
(1, 'waahkart', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories_man`
--

CREATE TABLE `categories_man` (
  `id` int(30) NOT NULL,
  `categories_name` varchar(255) NOT NULL,
  `categories_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories_man`
--

INSERT INTO `categories_man` (`id`, `categories_name`, `categories_status`) VALUES
(1, 'Employee', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_list`
--

CREATE TABLE `employee_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `cperson` text NOT NULL,
  `contact` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_list`
--

INSERT INTO `employee_list` (`id`, `name`, `address`, `cperson`, `contact`, `status`, `date_created`, `date_updated`) VALUES
(1, 'rahul', 'nagpur', 'penter', '2255', 1, '2023-07-24 12:29:20', '2023-07-24 12:29:20'),
(2, 'rohit', 'nag', 'maker', '544', 1, '2023-07-24 12:29:36', '2023-07-24 12:29:36'),
(3, 'ritu', 'nagpur', 'observer', '6566544524', 1, '2023-07-25 13:42:49', '2023-07-25 13:42:49');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `item` text NOT NULL,
  `price` float NOT NULL,
  `details` text NOT NULL,
  `expense_date` date DEFAULT current_timestamp(),
  `added_on` datetime NOT NULL DEFAULT current_timestamp(),
  `dispatch_date` datetime NOT NULL DEFAULT current_timestamp(),
  `pre_job` text NOT NULL,
  `order_by` text NOT NULL,
  `docket` text NOT NULL,
  `labour` float NOT NULL,
  `transpotation` float NOT NULL,
  `misc` float NOT NULL,
  `overal` float NOT NULL,
  `sell_cost` float NOT NULL,
  `pl` float NOT NULL,
  `epf` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id`, `item`, `price`, `details`, `expense_date`, `added_on`, `dispatch_date`, `pre_job`, `order_by`, `docket`, `labour`, `transpotation`, `misc`, `overal`, `sell_cost`, `pl`, `epf`) VALUES
(1, 'Honey bee small size statue', 1680, ' ', '2023-04-14', '2023-11-08 07:53:13', '2023-04-28 00:00:00', 'no', 'vaishnavi mam', '', 8180, 3, 986, 35716.2, 0, 0, 24867.2);

-- --------------------------------------------------------

--
-- Table structure for table `item_list`
--

CREATE TABLE `item_list` (
  `id` int(30) NOT NULL,
  `profile` varchar(255) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `categories_id` int(30) NOT NULL,
  `brands_id` int(30) NOT NULL,
  `cost` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_list`
--

INSERT INTO `item_list` (`id`, `profile`, `name`, `description`, `categories_id`, `brands_id`, `cost`, `status`, `date_created`, `date_updated`) VALUES
(1, 'upload/', 'Mat', '', 1, 1, 153.4, 1, '2023-09-25 06:52:30', '2023-09-25 06:52:30'),
(2, 'upload/', 'S.Mat', '', 1, 1, 2.3, 1, '2023-09-25 06:53:20', '2023-09-25 06:53:20'),
(3, 'upload/', 'L.Polish', '', 1, 1, 360, 1, '2023-09-25 06:53:49', '2023-09-25 06:53:49'),
(4, 'upload/', 'G P R', '', 1, 1, 169, 1, '2023-09-25 06:54:15', '2023-09-25 06:54:15'),
(5, 'upload/', 'ISOR', '', 1, 1, 178.18, 1, '2023-09-25 06:54:55', '2023-09-25 06:54:55'),
(6, 'upload/', 'GLC', '', 1, 1, 230, 1, '2023-09-25 06:55:26', '2023-09-25 06:55:26'),
(7, 'upload/', 'Flex', '', 1, 1, 40, 1, '2023-09-25 06:55:46', '2023-09-25 06:55:46'),
(8, 'upload/', 'Cobolt', '', 1, 1, 178.18, 1, '2023-09-25 06:56:14', '2023-09-25 06:56:14'),
(9, 'upload/', 'Hordner', '', 1, 1, 212.4, 1, '2023-09-25 06:56:46', '2023-09-25 06:56:46'),
(10, 'upload/', 'Powder', '', 1, 1, 14.16, 1, '2023-09-25 06:57:18', '2023-09-25 06:57:18'),
(11, 'upload/', 'brush', '', 1, 1, 20.25, 1, '2023-09-25 06:57:55', '2023-09-25 06:57:55'),
(12, 'upload/', 'Pigment', '', 1, 1, 472, 1, '2023-09-25 06:58:23', '2023-09-25 06:58:23'),
(13, 'upload/', 'Thinner HD', '', 1, 1, 170, 1, '2023-09-25 06:58:59', '2023-09-25 06:58:59'),
(14, 'upload/', 'Thinner L', '', 1, 1, 83, 1, '2023-09-25 06:59:21', '2023-09-25 06:59:21'),
(15, 'upload/', 'P.V [Wax Polish]', '', 1, 1, 70, 1, '2023-09-25 07:00:08', '2023-09-25 07:00:08'),
(16, 'upload/', 'P.U', '', 1, 1, 690, 1, '2023-09-25 07:00:24', '2023-09-25 07:00:24'),
(17, 'upload/', 'P R', 'KG', 1, 1, 230, 1, '2023-11-08 06:18:55', '2023-11-08 06:18:55'),
(18, 'upload/', 'brush 2', '', 1, 1, 20, 1, '2023-11-08 06:59:54', '2023-11-08 06:59:54'),
(19, 'upload/', 'resin', '', 1, 1, 125, 1, '2023-11-16 06:32:40', '2023-11-16 06:32:40'),
(20, 'upload/', 'PUTTY', 'KG', 1, 1, 14.16, 1, '2023-11-18 06:57:25', '2023-11-18 06:57:25'),
(21, 'upload/', 'ex.curing silicon rubber', '', 1, 1, 0, 1, '2023-12-23 05:31:49', '2023-12-23 05:31:49'),
(22, 'upload/', 'ex.curing silicon rubber', '', 1, 1, 0, 1, '2023-12-23 05:32:16', '2023-12-23 05:32:16'),
(23, 'upload/', 'SILICON RUBBER RTV-2121', '', 1, 1, 0, 1, '2023-12-23 05:32:47', '2023-12-23 05:32:47'),
(24, 'upload/', 'COMM.PUTTY OFF WHT', '', 1, 1, 0, 1, '2023-12-23 05:33:21', '2023-12-23 05:33:21'),
(25, 'upload/', 'ALLENKEY', '', 1, 1, 0, 1, '2023-12-23 05:33:51', '2023-12-23 05:33:51'),
(26, 'upload/', 'APEX SHYNE AY-2', '', 1, 1, 0, 1, '2023-12-23 05:34:13', '2023-12-23 05:34:13'),
(27, 'upload/', 'ASHOKA SUPER', '', 1, 1, 0, 1, '2023-12-23 05:34:28', '2023-12-23 05:34:28'),
(28, 'upload/', 'ASPA CAR FINISH BLK', '', 1, 1, 0, 1, '2023-12-23 05:34:47', '2023-12-23 05:34:47'),
(29, 'upload/', 'Autocat BC TINT WHT', '', 1, 1, 0, 1, '2023-12-23 05:35:11', '2023-12-23 05:35:11'),
(30, 'upload/', 'Autocat Jet Black', '', 1, 1, 0, 1, '2023-12-23 05:35:37', '2023-12-23 05:35:37'),
(31, 'upload/', 'P.U.COMM', '', 1, 1, 0, 1, '2023-12-23 05:35:56', '2023-12-23 05:35:56'),
(32, 'upload/', 'PU FLOST ORANGE', '', 1, 1, 0, 1, '2023-12-23 05:36:18', '2023-12-23 05:36:18'),
(33, 'upload/', 'P.U. UNIVERSAL MATT CLEAR', '', 1, 1, 0, 1, '2023-12-23 05:36:42', '2023-12-23 05:36:42'),
(34, 'upload/', 'Autocat TINT BK 801', '', 1, 1, 0, 1, '2023-12-23 05:37:17', '2023-12-23 05:37:17'),
(35, 'upload/', 'Autocat TINT R- 504', '', 1, 1, 0, 1, '2023-12-23 05:37:44', '2023-12-23 05:37:44'),
(36, 'upload/', 'Autocat UNI CLEAR', '', 1, 1, 0, 1, '2023-12-23 05:38:09', '2023-12-23 05:38:09'),
(37, 'upload/', 'AC UNIVERSAL PUTTY', '', 1, 1, 0, 1, '2023-12-23 05:38:36', '2023-12-23 05:38:36'),
(38, 'upload/', 'AC WHITE', '', 1, 1, 0, 1, '2023-12-23 05:38:51', '2023-12-23 05:38:51'),
(39, 'upload/', 'BILUX PUTTY', '', 1, 1, 0, 1, '2023-12-23 05:39:06', '2023-12-23 05:39:06'),
(40, 'upload/', 'BIRLA PUTTY FINE', '', 1, 1, 0, 1, '2023-12-23 05:39:23', '2023-12-23 05:39:23'),
(41, 'upload/', 'BK 802', '', 1, 1, 0, 1, '2023-12-23 05:39:35', '2023-12-23 05:39:35'),
(42, 'upload/', 'CELLO COAT PUTTY', '', 1, 1, 0, 1, '2023-12-23 05:39:52', '2023-12-23 05:39:52'),
(43, 'upload/', 'CHARMWOOD THINNER N.C.', '', 1, 1, 0, 1, '2023-12-23 05:40:14', '2023-12-23 05:40:14'),
(44, 'upload/', 'COLOUR', '', 1, 1, 0, 1, '2023-12-23 05:40:23', '2023-12-23 05:40:23'),
(45, 'upload/', 'COTTON WEAR', '', 1, 1, 0, 1, '2023-12-23 05:40:35', '2023-12-23 05:40:35'),
(46, 'upload/', 'CUTTING PILER', '', 1, 1, 0, 1, '2023-12-23 05:40:54', '2023-12-23 05:40:54'),
(47, 'upload/', 'CUTTING WHEEL', '', 1, 1, 0, 1, '2023-12-23 05:41:10', '2023-12-23 05:41:10'),
(48, 'upload/', 'EPE SHEET', '', 1, 1, 0, 1, '2023-12-23 05:41:27', '2023-12-23 05:41:27'),
(49, 'upload/', 'FABRIC', '', 1, 1, 0, 1, '2023-12-23 05:41:37', '2023-12-23 05:41:37'),
(50, 'upload/', 'FEET PANNA', '', 1, 1, 0, 1, '2023-12-23 05:41:51', '2023-12-23 05:41:51'),
(51, 'upload/', 'FLEXKWIK', '', 1, 1, 34.49, 1, '2023-12-23 05:42:09', '2023-12-23 05:42:09'),
(52, 'upload/', 'FOAMS', '', 1, 1, 0, 1, '2023-12-23 05:42:21', '2023-12-23 05:42:21'),
(53, 'upload/', 'Grinding Sander', '', 1, 1, 0, 1, '2023-12-23 05:42:51', '2023-12-23 05:42:51'),
(54, 'upload/', 'Hingres', '', 1, 1, 0, 1, '2023-12-23 05:43:08', '2023-12-23 05:43:08'),
(55, 'upload/', 'H.T.Allan', '', 1, 1, 0, 1, '2023-12-23 05:43:28', '2023-12-23 05:43:28'),
(56, 'upload/', 'H.T.NUT', '', 1, 1, 0, 1, '2023-12-23 05:43:55', '2023-12-23 05:43:55'),
(57, 'upload/', 'H.T.NUT', '', 1, 1, 0, 1, '2023-12-23 05:43:56', '2023-12-23 05:43:56'),
(58, 'upload/', '441 HARDNER', '', 1, 1, 0, 1, '2023-12-23 05:45:36', '2023-12-23 05:45:36'),
(59, 'upload/', '841 COMBI CLEAR', '', 1, 1, 0, 1, '2023-12-23 05:46:02', '2023-12-23 05:46:02'),
(60, 'upload/', 'NCT THINNER', '', 1, 1, 0, 1, '2023-12-23 05:46:25', '2023-12-23 05:46:25'),
(61, 'upload/', 'REXINE', '', 1, 1, 0, 1, '2023-12-23 05:46:48', '2023-12-23 05:46:48'),
(62, 'upload/', 'UNIVERSAL POLISTER PUTTY', '', 1, 1, 0, 1, '2023-12-23 05:47:20', '2023-12-23 05:47:20'),
(63, 'upload/', 'WHITE PUTTY', '', 1, 1, 0, 1, '2023-12-23 05:47:38', '2023-12-23 05:47:38'),
(64, 'upload/', 'WATER PAPER', '', 1, 1, 0, 1, '2023-12-23 05:48:05', '2023-12-23 05:48:05'),
(65, 'upload/', 'TOOLS', '', 1, 1, 0, 1, '2023-12-23 05:48:20', '2023-12-23 05:48:20'),
(66, 'upload/', 'SYN BUS GREEN', '', 1, 1, 0, 1, '2023-12-23 05:48:45', '2023-12-23 05:48:45'),
(67, 'upload/', 'SYN.COLORANT EXT.RED', '', 1, 1, 0, 1, '2023-12-23 05:49:11', '2023-12-23 05:49:11'),
(68, 'upload/', 'SUPER.G.YELLOW', '', 1, 1, 0, 1, '2023-12-23 05:49:39', '2023-12-23 05:49:39'),
(69, 'upload/', 'SUPER.GLARE.GOLD', '', 1, 1, 0, 1, '2023-12-23 05:49:59', '2023-12-23 05:49:59'),
(70, 'upload/', 'SUPER.COLOUR', '', 1, 1, 0, 1, '2023-12-23 05:50:16', '2023-12-23 05:50:16'),
(71, 'upload/', 'SS.PLAIN WASHER', '', 1, 1, 0, 1, '2023-12-23 05:50:40', '2023-12-23 05:50:40'),
(72, 'upload/', 'SS.SPRING WASHER', '', 1, 1, 0, 1, '2023-12-23 05:51:00', '2023-12-23 05:51:00'),
(73, 'upload/', 'STEEL GRIP', '', 1, 1, 0, 1, '2023-12-23 05:51:54', '2023-12-23 05:51:54'),
(74, 'upload/', 'SS SP', '', 1, 1, 0, 1, '2023-12-23 05:52:13', '2023-12-23 05:52:13'),
(75, 'upload/', 'SS P/W', '', 1, 1, 0, 1, '2023-12-23 05:52:32', '2023-12-23 05:52:32'),
(76, 'upload/', 'SS PLW M', '', 1, 1, 0, 1, '2023-12-23 05:52:48', '2023-12-23 05:52:48'),
(77, 'upload/', 'SS PIPE', '', 1, 1, 0, 1, '2023-12-23 05:53:05', '2023-12-23 05:53:05'),
(78, 'upload/', 'SS HEX NUT', '', 1, 1, 0, 1, '2023-12-23 05:53:25', '2023-12-23 05:53:25'),
(79, 'upload/', 'SS HEX BOLT', '', 1, 1, 0, 1, '2023-12-23 05:53:45', '2023-12-23 05:53:45'),
(80, 'upload/', 'SS CSK', '', 1, 1, 0, 1, '2023-12-23 05:54:04', '2023-12-23 05:54:04'),
(81, 'upload/', 'SS CSK', '', 1, 1, 0, 1, '2023-12-23 05:54:09', '2023-12-23 05:54:09'),
(82, 'upload/', 'SS ALAN BOLT', '', 1, 1, 0, 1, '2023-12-23 05:54:31', '2023-12-23 05:54:31'),
(83, 'upload/', 'SPRY GUN', '', 1, 1, 0, 1, '2023-12-23 05:54:46', '2023-12-23 05:54:46'),
(84, 'upload/', 'R 504', '', 1, 1, 0, 1, '2023-12-23 05:55:07', '2023-12-23 05:55:07'),
(85, 'upload/', 'ROLL PAPER', '', 1, 1, 0, 1, '2023-12-23 05:55:20', '2023-12-23 05:55:20'),
(86, 'upload/', 'Speedy FD PURE WHITE', '', 1, 1, 0, 1, '2023-12-23 05:55:50', '2023-12-23 05:55:50'),
(87, 'upload/', 'P U BOWLLING WHEEL', '', 1, 1, 0, 1, '2023-12-23 05:56:10', '2023-12-23 05:56:10'),
(88, 'upload/', 'PP/ HDPE Fabric', '', 1, 1, 0, 1, '2023-12-23 05:56:32', '2023-12-23 05:56:32'),
(89, 'upload/', 'Plug cable wire', '', 1, 1, 0, 1, '2023-12-23 05:57:03', '2023-12-23 05:57:03'),
(90, 'upload/', 'patti', '', 1, 1, 0, 1, '2023-12-23 05:57:22', '2023-12-23 05:57:22'),
(91, 'upload/', 'packing material box', '', 1, 1, 0, 1, '2023-12-23 05:57:46', '2023-12-23 05:57:46'),
(92, 'upload/', '841 ultra clear', '', 1, 1, 0, 1, '2023-12-23 06:00:06', '2023-12-23 06:00:06'),
(93, 'upload/', 'MOP WHEEL', '', 1, 1, 0, 1, '2023-12-23 06:00:45', '2023-12-23 06:00:45'),
(94, 'upload/', 'autocoat shinv wax', '', 1, 1, 0, 1, '2023-12-23 07:06:53', '2023-12-23 07:06:53'),
(95, 'upload/', 'H.T.CSR', '', 1, 1, 0, 1, '2023-12-23 07:07:22', '2023-12-23 07:07:22'),
(96, 'upload/', 'MOP WHEEL', '', 1, 1, 0, 1, '2023-12-23 07:08:06', '2023-12-23 07:08:06'),
(97, 'upload/', 'NYLONE NUT', '', 1, 1, 0, 1, '2023-12-23 07:08:37', '2023-12-23 07:08:37'),
(98, 'upload/', 'PAPER', '', 1, 1, 0, 1, '2023-12-23 07:09:09', '2023-12-23 07:09:09'),
(99, 'upload/', 'PMDC MOTOR MODEL', '', 1, 1, 0, 1, '2023-12-23 07:09:49', '2023-12-23 07:09:49'),
(100, 'upload/', 'VOLTBEK REF 1100182', '', 1, 1, 0, 1, '2023-12-23 07:10:25', '2023-12-23 07:10:25'),
(101, 'upload/', 'masking tape', '', 1, 1, 0, 1, '2023-12-23 07:23:04', '2023-12-23 07:23:04');

-- --------------------------------------------------------

--
-- Table structure for table `item_list_man`
--

CREATE TABLE `item_list_man` (
  `id` int(30) NOT NULL,
  `profile` varchar(255) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `categories_id` int(30) NOT NULL,
  `brands_id` int(30) NOT NULL,
  `cost` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp(),
  `time` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_list_man`
--

INSERT INTO `item_list_man` (`id`, `profile`, `name`, `description`, `categories_id`, `brands_id`, `cost`, `status`, `date_created`, `date_updated`, `time`) VALUES
(1, 'upload/pokemon-artwork-pikachu-ash-ketchum-wallpaper-preview.jpg', 'Jitendra janghel', 'ghisai', 1, 5, 375, 1, '2023-07-20 00:00:00', '2023-07-20 00:00:00', ''),
(2, 'upload/peakpx.jpg', 'chunnilal khutle', 'ghisai + mudwork', 1, 5, 335, 1, '2023-07-20 00:00:00', '2023-07-20 00:00:00', ''),
(3, 'upload/images.jpg', 'Bhupendra shahu', 'molding', 1, 2, 500, 1, '2023-07-25 00:00:00', '2023-07-25 00:00:00', ''),
(4, 'upload/images.jpg', 'Ashok khutle', 'ghisai', 1, 5, 270, 1, '2023-07-26 00:00:00', '2023-07-26 00:00:00', ''),
(7, 'upload/aa.jpg', 'sunil narekar', 'molding', 1, 1, 650, 1, '2023-08-12 00:00:00', '2023-08-12 00:00:00', ''),
(8, 'upload/', 'sevak nishad', ' ghisai', 1, 1, 345, 1, '2023-08-15 00:00:00', '2023-08-15 00:00:00', ''),
(9, 'upload/', 'panchram shahu', 'ghisai', 1, 1, 340, 1, '2023-08-15 00:00:00', '2023-08-15 00:00:00', ''),
(10, 'upload/', 'B.Shrivastav', 'ghisai', 1, 1, 300, 1, '2023-08-17 00:00:00', '2023-08-17 00:00:00', ''),
(12, 'upload/', 'PHOOL SINGH', 'Ghisai', 1, 1, 400, 1, '2023-09-02 00:00:00', '2023-09-02 00:00:00', ''),
(13, 'upload/', ' SONRAJ ANAND', 'Ghisai', 1, 1, 340, 1, '2023-11-08 06:23:40', '2023-11-08 06:23:40', ''),
(14, 'upload/', 'SUNIL SAHU', 'Ghisai', 1, 1, 250, 1, '2023-11-08 06:24:09', '2023-11-08 06:24:09', ''),
(15, 'upload/', 'PARSHURAM YADAV', 'Ghisai', 1, 1, 400, 1, '2023-11-08 06:25:08', '2023-11-08 06:25:08', ''),
(16, 'upload/', 'CHANDRA PRAKASH', 'Ghisai', 1, 1, 350, 1, '2023-11-08 06:25:41', '2023-11-08 06:25:41', ''),
(17, 'upload/', 'MADANLAL PATEL', 'Ghisai', 1, 1, 275, 1, '2023-11-08 06:26:14', '2023-11-08 06:26:14', ''),
(18, 'upload/', 'AJAY SINGH', 'Ghisai', 1, 1, 260, 1, '2023-11-08 06:26:40', '2023-11-08 06:26:40', ''),
(19, 'upload/', 'LOKESH NISHAD', 'Ghisai', 1, 1, 300, 1, '2023-11-08 06:27:09', '2023-11-08 06:27:09', ''),
(20, 'upload/', 'GAYA SINGH', 'Painter', 1, 1, 450, 1, '2023-11-08 06:27:32', '2023-11-08 06:27:32', ''),
(21, 'upload/', 'NARESH YADAV', 'Painter', 1, 1, 300, 1, '2023-11-08 06:28:08', '2023-11-08 06:28:08', ''),
(22, 'upload/', 'ANIL VERMA', 'Murtikar', 1, 1, 450, 1, '2023-11-08 06:29:11', '2023-11-08 06:29:11', ''),
(23, 'upload/', 'KRISHNA CHOUDHARY', 'Fabrication', 1, 1, 530, 1, '2023-11-08 06:29:43', '2023-11-08 06:29:43', ''),
(24, 'upload/', 'MANISH SINHA', 'Bowling_Machine', 1, 1, 450, 1, '2023-11-08 06:30:16', '2023-11-08 06:30:16', ''),
(25, 'upload/', 'PARSHURAM YADAV', 'Bowling_Machine', 1, 1, 400, 1, '2023-11-08 06:30:49', '2023-11-08 06:30:49', ''),
(26, 'upload/', 'PHOOL SINGH', 'Ghisai', 1, 1, 400, 1, '2023-11-08 06:31:11', '2023-11-08 06:31:11', '');

-- --------------------------------------------------------

--
-- Table structure for table `item_list_p`
--

CREATE TABLE `item_list_p` (
  `id` int(30) NOT NULL,
  `profile` varchar(255) NOT NULL,
  `name` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `categories_id` int(30) NOT NULL,
  `brands_id` int(30) NOT NULL,
  `cost` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp(),
  `time` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_list_p`
--

INSERT INTO `item_list_p` (`id`, `profile`, `name`, `description`, `categories_id`, `brands_id`, `cost`, `status`, `date_created`, `date_updated`, `time`) VALUES
(1, 'upload/pokemon-artwork-pikachu-ash-ketchum-wallpaper-preview.jpg', 'Plastic wrap', '', 1, 5, 375, 1, '2023-07-20 00:00:00', '2023-07-20 00:00:00', ''),
(2, 'upload/peakpx.jpg', 'Thermocil 1 inch', '', 1, 5, 335, 1, '2023-07-20 00:00:00', '2023-07-20 00:00:00', ''),
(3, 'upload/images.jpg', 'Khadda', '', 1, 2, 500, 1, '2023-07-25 00:00:00', '2023-07-25 00:00:00', ''),
(4, 'upload/images.jpg', 'Plastic Bori', '', 1, 5, 270, 1, '2023-07-26 00:00:00', '2023-07-26 00:00:00', ''),
(5, 'upload/images.jpg', 'Plastic  patti', '', 1, 5, 270, 1, '2023-07-26 00:00:00', '2023-07-26 00:00:00', ''),
(6, 'upload/images.jpg', 'Silver packing clip', '', 1, 5, 270, 1, '2023-07-26 00:00:00', '2023-07-26 00:00:00', ''),
(7, 'upload/aa.jpg', 'Wooden ka Bhatta', '', 1, 1, 650, 1, '2023-08-12 00:00:00', '2023-08-12 00:00:00', ''),
(8, 'upload/aa.jpg', 'Steel Patti', '', 1, 1, 345, 1, '2023-08-15 00:00:00', '2023-08-15 00:00:00', ''),
(9, 'upload/aa.jpg', 'Steel nail 17 no 3', '', 1, 1, 340, 1, '2023-08-15 00:00:00', '2023-08-15 00:00:00', ''),
(10, 'upload/aa.jpg', 'Steel nail 14 no 2', '', 1, 1, 340, 1, '2023-08-15 00:00:00', '2023-08-15 00:00:00', ''),
(11, 'upload/aa.jpg', 'Steel nail 14 no 0.75', '', 1, 1, 340, 1, '2023-08-15 00:00:00', '2023-08-15 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `po_items`
--

CREATE TABLE `po_items` (
  `po_id` int(30) NOT NULL,
  `item_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `unit` varchar(50) NOT NULL,
  `total` float NOT NULL DEFAULT 0,
  `supplier` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_items_man`
--

CREATE TABLE `po_items_man` (
  `po_id` int(30) NOT NULL,
  `item_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `unit` varchar(50) NOT NULL,
  `total` float NOT NULL DEFAULT 0,
  `supplier` varchar(50) NOT NULL,
  `time` varchar(100) NOT NULL,
  `aaaa` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_items_pack`
--

CREATE TABLE `po_items_pack` (
  `po_id` int(30) NOT NULL,
  `item_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `unit` varchar(50) NOT NULL,
  `total` float NOT NULL DEFAULT 0,
  `supplier` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_items_prod`
--

CREATE TABLE `po_items_prod` (
  `po_id` int(30) NOT NULL,
  `item_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `unit` varchar(50) NOT NULL,
  `total` float NOT NULL DEFAULT 0,
  `supplier` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_list`
--

CREATE TABLE `products_list` (
  `id` int(30) NOT NULL,
  `profile` varchar(255) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `categories_id` int(30) NOT NULL,
  `brands_id` int(30) NOT NULL,
  `cost` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_list`
--

INSERT INTO `products_list` (`id`, `profile`, `name`, `description`, `categories_id`, `brands_id`, `cost`, `status`, `date_created`, `date_updated`) VALUES
(1, 'profile', 'name', 'description', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '', '3D Triangular Prism Geometrical Shapes Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '', 'Red Multipurpose Stool\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '', 'FRP Playground Slider for kids\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '', 'FRP Dice Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '', 'Yellow Capsicum\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, '', 'Car Shape Study Table\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, '', 'Toss Ball\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, '', 'Cute Little Duck Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, '', 'Sunflower Stool\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, '', 'Giraffe Face Wall Decor\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, '', 'Damru Shaped Stool\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, '', 'Round Shaped Stool For Kids\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, '', 'Alphabet And Colour Learning Stool\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, '', 'Colourful Multipurpose Block Stool\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, '', 'Blue Multipurpose Block Stool\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, '', 'Multipurpose Block Stool- Set Of 2\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, '', 'Blue Multipurpose Block Stool- Set Of 4\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, '', 'Blue Multipurpose Block -Set Of 6\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, '', 'Blue Multipurpose Stool-set Of 10\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, '', 'Attractive Green Fixed Stool For Garden\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, '', 'Stylish Beach And Garden Chair\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, '', 'Green Fiber Bench And Desk (6-Set)\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, '', 'Bench And Desk For Kids(10-Set)\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, '', 'Yellow Fiber Desk-Bench For Kids (1-Set)\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, '', 'Adjustable Book Storage Rack\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, '', 'Yellow Bench And Desk For Kids ( 6 -Set )\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, '', 'Yellow Flawless Desk & Bench For Kids(10 Set )\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, '', 'Single Seater Red Bench Set\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, '', 'Stunning Single Seater Benches -Set Of 2\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, '', 'Beautiful Single Seater Study Benches - Set Of 4\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, '', 'Red Study Single Seater Benches Set Of 6\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, '', 'Kids Study Furniture- Red Set Of 10\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, '', 'Unique Dice Stool For Kids-Yellow Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, '', 'Attractive Green Chair\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, '', 'Dice Shape Stool\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, '', 'Two-way See Saw For Kids - Cream Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, '', 'Two-way See Saw For Kids In Yellow Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, '', 'Two-way See Saw In Vibrant Red Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, '', 'Fun Time Two-way See Saw For Kids In Blue Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, '', 'See Saw For Kids In Yellow Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, '', 'See Saw For Kids In Red Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, '', 'See Saw For Kids In Orange Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, '', 'See Saw For Kids In White Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, '', 'See Saw For Kids In Green Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, '', 'Swing- Jhulla In Wooden Texture\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, '', 'FRP Playground Slide -green Colour\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, '', 'FRP Elephant Slide\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, '', 'FRP Playground Slide- Red Slide\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, '', 'Unique Yellow Slide With FRP Stairs\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, '', 'Attractive FRP - 10 Ft Orange Wave Slide\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, '', 'Pug Dog In A Small Space Money Bank\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, '', 'Maroon/Golden Money Bank With Flower Pot\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, '', 'White/Golden Money Bank\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, '', 'Nazar Battu With Money Bank\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, '', 'Maroon/Golden Money Bank With Special Security\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, '', 'Fish Shape Money Bank\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, '', 'Shankh Shaped Money Bank\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, '', 'Duck Shaped Money Bank\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, '', 'Piggy Bank', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, '', 'Bookshelf With Tagore Sculpture\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, '', 'Ice Cream Shape Money Bank\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, '', 'Piggy Bank - Red\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, '', 'Piggy Bank - Green\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, '', 'Educational Model-Custard Apple\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, '', 'Watermelon- A Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, '', 'Pear - A Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, '', 'Mango - Fun And Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, '', 'Citrus Fruit Sweet Lemon Fiber Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, '', 'Garlic- Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, '', 'Red Chili- A Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, '', 'Green Chili- A Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, '', 'Brinjal- A Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, '', 'Learning Model- Orange\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, '', 'Tomato - A Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, '', 'A Learning Model- Maize (corn)\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, '', 'A Learning Model- Pomegranate\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, '', 'A Learning Model - Banana\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, '', 'Capsicum - A Learning Model', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, '', 'Custard Apple - A Half Cutted Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, '', 'Brinjal Learning Half Cutted Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, '', 'Half Cutted Learning Model- Green Chilli\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, '', 'A Learning Half Cutted Model- Garlic\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, '', 'A Learning Half - Banana Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, '', 'A Learning Half Model- Capsicum\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, '', 'A Learning Half Pumpkin Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, '', 'A Learning Model - Pear\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, '', 'A Learning Half Cutted Pomegranate Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, '', 'Maize -A Learning Half Cutted Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, '', 'A Learning Half Cutted Apple Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, '', '3D Shapes Set- A Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, '', 'Cone Shape - Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, '', 'Cylindrical Shape-A Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, '', 'Hexagonal Shape-A Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, '', 'Square Prism-A Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, '', 'Hexagon Pyramid Shape- A Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, '', 'Triangle Pyramid Shape-a Learning Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, '', 'Kids Swimming Pool Tank\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, '', 'FRP Red Lawn Chair - For Swimming Pools\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, '', 'Bookshelf With White Buddha Face Sculpture\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, '', 'Bookshelf With Black Buddha Face Sculpture\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, '', 'Adjustable Bookshelf With Lord Buddha Face Sculpture\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, '', 'FRP Egyptian Face Hammock (Jhula) without foam\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, '', 'Egyptian Face Hammock With Foam\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, '', 'FRP Radiant Red Apple\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, '', 'Real Look Pomegranate Model -Kids Endearing\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, '', 'Unity Hand Shaped Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, '', 'Cartoon Bed Kitty For Kids', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, '', 'Kids Modern Upholstered Designer Bed\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, '', 'Yellow Sports Car Bed\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, '', 'Blue Sports Car Bed\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, '', 'Pink Crown Shaped Bed\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, '', 'Pink Children\'s Bed\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, '', 'Heart Shape Bed\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, '', 'Sports Car Bed', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, '', 'Dolphin Shaped Bed\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, '', 'Penguin Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, '', 'Ice-Cream Shape Dustbin -In Blue Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, '', 'Small Puppy Face Multipurpose Planter\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, '', 'Little Angel Lamp Post\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, '', 'Dual Lamp Post\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, '', 'Ice-cream Shape Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, '', 'Small Old Looking Dog\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, '', 'Bottle Holder Stand\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, '', 'Card Holder\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, '', 'Cat House - Cattery\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, '', 'Multi Colour Flag Poll\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, '', 'Cute Penguin Shape Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, '', 'Cat House - Cattery\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, '', 'Piggy Bank Combo\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, '', 'Dog Urinal\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, '', '(Halloween) Wooden lantern\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, '', '(Trishul damru) Wooden lantern\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, '', 'Elephant Pair Floating Pot / Urli\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, '', 'Deer- Multipurpose Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, '', 'Birds Nest Cum Feeder\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, '', 'Black Elephants Pair\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, '', 'URLI- Bowl\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, '', 'Camel Shaped Pen Stand\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, '', '?The Legacy? - Modern Horse Head\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, '', 'Squirrel Bird feeder', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, '', 'Relaxing Frog Hanging\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, '', 'Hawan Kund\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, '', 'CRICKET BALL SHAPED DUSTBIN\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, '', 'Sleek Deer Head\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, '', 'Royal Letter/Suggestion / Complaint box\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, '', 'Designer Trunk Up Elephant Statue- Golden\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, '', 'MS Flag Pole In Yellow Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, '', 'Ms Flag Pole In Green Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, '', 'SS Flag Pole\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, '', 'Foot Operated Sanitizer Dispenser Stand\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, '', 'Real Hand-Shaped Multipurpose Pot\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, '', 'Hand-Shaped Multipurpose Pot\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, '', 'Van Shaped Multipurpose Pot\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, '', 'Man Upper Body Dummy Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, '', 'Pig Shape Multipurpose Pot\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, '', 'Owl Shaped Multipurpose Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, '', 'Rat Shaped Multipurpose Pot\n\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, '', 'Car Shaped Multipurpose Pot\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, '', 'Cow Donation Box\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, '', 'Temple Donation Box\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, '', 'MS Donation Box\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, '', 'Donation Box\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, '', 'Jain Temple Donation Box\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, '', 'Jain Temple Danpeti\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, '', 'Donation Box For Gurudwara', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, '', 'Danpeti For Temple', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, '', 'Donation Box With 6 Lever Lock\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, '', 'Donation Box With Great Storage\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, '', 'Mosque Donation Box In Extra Large Size\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, '', 'Large Size Donation Box\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, '', 'Metal Donation Box\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, '', 'Metal Donation Box In Extra Large Size\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, '', 'Donation Box- Shani Temple\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, '', 'Donation Box- Cow\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, '', 'Octopus Shaped- Indoor And Outdoor Lamp\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, '', 'FRP Cream Floor Standing Lamp Post\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, '', 'Metallic Color Fiber Lamp Post\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, '', 'Mate White Color Fiber Lamp Post\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, '', 'FRP Golden Floor Standing Lamp Pole\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, '', 'Curve Shape Floor Standing Lamp Post\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, '', 'Rajasthani Royal Couple Night Lamp\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, '', 'Lamp Post- Light Golden Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, '', 'Sitting Elephant Statue With Lantern\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, '', 'White Floor Lamp Post\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, '', 'Floor Lamp Pole\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, '', 'Fairy Lamp Post\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, '', 'Rope Lamp Post\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, '', 'Fiber Natural Finished Lamp Post\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, '', 'Garden Lamp In An Angel Look\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, '', 'FRP Boy Under Wooden Trunk Lamp Post\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, '', 'Phoenix Lamp Post\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, '', 'Designer White Lamp Post\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, '', 'Jharokha- Beautiful Traditional Frame\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, '', 'Colonnade - Swan Pillar For Decoration\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, '', 'Swan Anchor - Columns For Decoration In Pair\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, '', 'Lady Colonnade -Pillar For Decorations\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, '', 'Double Designed Backdrop Panel\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, '', 'Traditional Look Backdrop Panel\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, '', 'Peacock Designed Backdrop Panel\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, '', 'Net Potted Golden-Back Drop Panel\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, '', 'Royal Traditional Designed Backdrop Panel\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, '', 'Royal Palki - A Palanquin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, '', 'Lady Faced Statue With Small Basket- Golden\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, '', 'Sleek White Multipurpose Container\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, '', 'Multipurpose Staircase\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, '', 'Peacock Shape Center Piece Bucket\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, '', 'Fiber Baby Lion Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, '', 'Duck Shape Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, '', 'Penguin Shape Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, '', 'King Penguin Shape Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, '', 'Bear Shape Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, '', 'Rabbit Fiber Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, '', 'Tree Shape Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, '', 'White Duckling Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, '', 'Bear Shaped Garbage Bin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, '', 'Fish Shaped Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, '', 'FRP Giraffe Trashbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, '', 'Monkey Shape Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, '', 'Trash Bin Baby Lion\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, '', 'Rabbit Dustbin With Green Basket\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, '', 'Baby Lion Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, '', 'Attractive Kangaroo Shaped Big Size Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, '', 'Attractive Dog Shape Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, '', 'Attractive Boy Statue Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, '', 'Unique Dino Shape Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, '', 'Attractive Dino Shape Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, '', 'Boy Statue Dustbin- Clay Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, '', 'BJP 3D Kamal Logo With Long Handle\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, '', 'Congress 3 D Panja Logo\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, '', 'BJP 3D Kamal Logo\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, '', 'BJP 2D Kamal Logo\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, '', 'Congress 2 D Panja Logo\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, '', 'Congress 3D Panja Logo (white)\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, '', 'Congress 2D Panja Logo (White)\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, '', '3 D Congress Logo\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, '', 'Revolving Kamal BJP Party Symbol\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, '', 'The Bird House Avian Hut\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, '', 'Dog Bed For Shetland Speeddog\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, '', 'Dog Bed For Shetland Pomeranian\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, '', 'Dog Bed -German Shepherd\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, '', 'Dog House - Shetland (Small Size Of Dog )\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, '', 'Pigeon House- A Shelter Place For Birds\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, '', 'Mini Pigeon House\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, '', 'Dog House - A Friendly Home\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, '', 'Dog Bed For Bulldog\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, '', 'Outdoor Foot Washer\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, '', 'Nazar Battu With Money Bank\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, '', 'FRP Egyptian Face Hammock (Jhula) without foam\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, '', 'Egyptian Face Hammock With Foam\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, '', 'Designer Trunk Up Elephant Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, '', 'Beautiful FRP Dancing Couple\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, '', 'Designer Rope Pillar\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, '', 'Lady Design In Golden Shade -Back Drop Panel\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, '', 'Window Look Back Drop Panel\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, '', 'Semi Circle(Arch)\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, '', 'Golden Fiber Traditional Frame\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, '', 'Colonnade-strip Design Pillar For Decorations\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, '', 'Royal Wedding Gate Peacock Arch\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, '', 'Metallic look FRP Jharokha\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, '', 'Traditional French Lady Statue Holding Lamp\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, '', 'A Royal Elephant Welcome Statue in White Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, '', 'Welcome Elephant-In Golden Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, '', 'Marble Look -Welcome Elephant\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, '', 'Welcome Elephant Statue For Entrance\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, '', 'Royal Designer Look Entrance Arch\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, '', 'Net Pattern Entrance Arch\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, '', 'Designer Peacock Entrance Arch\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, '', 'Decorative Statue Stand\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, '', 'Round Colonnade -Pillar\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, '', 'PU Dimple Ball 85gram - 12Ball\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, '', 'PU Dimple Ball 85gram - 6Ball\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, '', 'PU Dimple Ball 85gram - 4Ball\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, '', 'PU Dimple Ball 85gram - 3Ball\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, '', 'PU Dimple Ball 85gram - 2Ball\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, '', 'PU Dimple Ball - 85gram\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, '', 'Adjustable Toss Ball\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, '', 'Cricket Stump\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, '', 'PU Dimple Cricket Ball 100gram - Yellow\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, '', 'PU Dimple Ball 100gram - 2 Balls\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, '', 'PU Dimple Cricket Ball 100gram - 3 Balls\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, '', 'PU Dimple Ball 100gram - 4 Balls (Yellow)\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, '', 'PU Cricket Dimple Ball 100gram - Pack Of 6\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, '', 'PU Dimple Cricket Ball 100gram - Pack Of 12\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, '', 'PU Dimple Cricket Ball - 120gram\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, '', 'PU Dimple Cricket Ball 120gram - 2 Ball\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, '', 'PU Dimple Cricket Ball 120gram - 4 Ball\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, '', 'PU Dimple Cricket Ball 120gram - 6 Ball\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, '', 'PU Dimple Cricket Ball 120gram - 12 Ball\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, '', 'PU Dimple Cricket Ball 120gram - 3 Ball\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, '', 'PU Dimple Cricket Ball 142gram - (Yellow)\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, '', 'PU Cricket Dimple Ball 142gram - 2 Balls\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, '', 'Dimple Cricket Ball (PU) 142gram - 3 Balls\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, '', 'Dimple Cricket Ball (PU) 142gram - 4 Ball\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, '', 'Dimple Cricket Ball (PU) 142gram - 6 Balls\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, '', '12 Nos PU Dimple Cricket Ball - 142gram\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, '', 'PU Dimple Cricket Ball 165gram - Red\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, '', 'PU Dimple Cricket Ball (Red) 165gram - 2 Ball\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, '', 'PU Dimple Cricket Ball (Red) 165gram - 3 Ball\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, '', 'PU Dimple Cricket Ball (Red) 165gram - 4 Balls\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, '', 'PU Dimple Cricket Ball (Red) 165gram - Pack Of 6\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, '', '12 Nos PU Dimple Cricket Ball 165gram - Red\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, '', 'Cricket Dimple Ball (PU) - 165gram', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, '', 'Cricket Dimple Ball (PU) 165gram - 2 Balls\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, '', 'Cricket Dimple Ball (PU) 165gram - 4 Balls\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, '', 'Cricket Dimple Ball (PU) 165gram - 6 Balls\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, '', '12 Nos Cricket PU Dimple Ball -165gram\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, '', 'Academic Bowler - Cricket Bowling Machine\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, '', 'Base Model (Deluxe) - Cricket Bowling Machine\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, '', 'Base Model - Cricket Bowling Machine\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, '', 'Magic Bowler - Cricket Bowling Machine\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, '', 'Dynamic Bowler - Cricket Bowling Machine\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, '', 'Dynamic Bowler (Deluxe) -Cricket Bowling Machine\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, '', 'Field Trainer - Cricket Bowling Machine\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, '', 'Super Bowler - Cricket Bowling Machine\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, '', 'Super Bowler (Deluxe) - Cricket Bowling Machine\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, '', 'Lawn Tennis Bowling Machine With Auto Feeder\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, '', 'Professional Bowler - Cricket Bowling Machine\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, '', 'Fun Bowler-Cricket Bowling Machine\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, '', 'Professional Bowler (Deluxe) - Cricket Bowling Machine\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, '', 'Yellow Ice Cream Chair\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, '', 'Standing Ice-Cream Cone Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, '', 'Boy statue With chocolate bowl\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, '', 'Ice Cream Shape - Set Of 1 Table And 6 Chair In Pink Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, '', 'Ice Cream Shape - Set Of 1 Table And 5 Chair In Pink Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, '', 'Ice Cream Shape - Set Of 1 Table And 4 Chair In Pink Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, '', 'Ice Cream Shape - Set of 1 Table And 3 Chair In Pink Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, '', 'Ice Cream Shape 1Table or 2Chair - In Pink Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, '', 'Ice Cream Shape 1Table or 1Chair - In Pink Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, '', 'Ice Cream Shape Chair - In Pink Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, '', 'Ice Cream Shape Table In Pink Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, '', 'Ice Cream Shape Table In Pink Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, '', 'Hanging Ice-cream Cone Planter\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, '', 'Girl With Ice Cream Cone\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, '', 'Giant Ice Cream Cone Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, '', 'Boy With Ice Cream Cone\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, '', 'Boy And Girl With Ice Cream Cone\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, '', 'Ice-cream Shape Dustbin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, '', 'Ice Cream Shape - set Of 1 Table And 4 Colourful Chairs\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, '', 'Ice Cream Cone Shape -1 Table And 1 Chair\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, '', 'Ice Cream Cone Shape Chair Table - Set Of 3 Chair 1 Table\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, '', 'Ice Cream Shape - Set Of 1 Table And 4 Chair\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, '', 'Ice-cream Cone Planter\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, '', 'Ice-cream cone on wall\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, '', 'Selfie Ice-cream cone statue with seat\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, '', 'Ice-cream Cone Splash Wall Hanging\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, '', 'Ice-cream Design Wall Hanging\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, '', 'Ice-Cream Statue For Display\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, '', 'Colorful Ice-cone Statue For Display\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, '', 'Ice-cone Statue For Display\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, '', 'Ice-cone Statue With SS Stand\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(352, '', 'Ice-Cone Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, '', 'Ice Cream Shaped Table\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, '', 'Exclusive Ice Cream Chair/stool\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(355, '', 'Exclusive Ice Cream Chair\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, '', 'Exclusive Ice Cream Chair/ Stool - Red And Green\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, '', 'Exclusive Ice Cream Chair/ Stool - Blue And Yellow\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, '', 'Exclusive Ice Cream Chair/ Stool - Black\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(359, '', 'Exclusive Ice Cream Chair/ Stool - Purple\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(360, '', 'Exclusive Ice Cream Chair/ Stool - Yellow And Green\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(361, '', 'Exclusive Ice Cream Chair/ Stool - Yellow\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(362, '', 'Exclusive Ice Cream Chair/ Stool - Red\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, '', 'Ice Cream Cup Cake Chair/ Stool- Red\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(364, '', 'Ice Cream Cup Cake Chair/ Stool- Black\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(365, '', 'Ice Cream Cup Cake Chair/ Stool- Yellow\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(366, '', 'Ice-cream Planter\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(367, '', 'Ice Cream Cone Shape Chair - In Green\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(368, '', 'Ice Cream Cone Shape Chair - In Red\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(369, '', 'Ice Cream Cone Shape Table\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(370, '', 'Ice Cream Cone Shape Table With Chair- Set Of 5\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(371, '', 'Delicious Hanging Ice Cream Cone Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(372, '', 'Ice Cream Shaped Chair\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(373, '', 'Ice Cream Shaped -Set Of 6 Chairs And 1 Table\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(374, '', 'Ice Cream Shaped Chair - Set Of 2 Chairs And 1 Table\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, '', 'Unique Ice Cream Shaped- 4 Chairs And 1 Table\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(376, '', 'Ice Cream Furniture -set Of 1 Table And 6 Chairs\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(377, '', 'Ice Cream Shaped -set Of 1 Table And 3 Chairs\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(378, '', 'Ice Cream Shape -Set Of 1 Table And 2 Chairs\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(379, '', 'Ice Cream Shape - Set Of 1 Table And 1 Chair\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(380, '', 'Ice Cream Shape -set Of 1 Table And 5 Chairs\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(381, '', 'Wooden Look Buddha Face Idol Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(382, '', 'Radha Krishna With White Peacock Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(383, '', 'Tea Girl Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(384, '', 'FRP Tea Girl Fountain\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, '', 'Mahadev Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(386, '', 'Baker With Cake Holding Text Board\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(387, '', 'Mermaid Statue - In Black Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(388, '', 'Lal Bahadur Shastri Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(389, '', 'Rabindranath Tagore Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(390, '', 'Couple on moon - Sea blue and copper colour\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(391, '', 'Small Nandi Sitting Pose In Black Colour\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(392, '', 'Lord Krishna Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(393, '', 'Angel Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(394, '', 'Eagle Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(395, '', 'Rajasthani Lady With Chaas\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, '', 'Indian Waiter Statue - In Red Colour\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, '', 'Sitting Kamdhenu Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(398, '', 'Cute Baby Elephant Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, '', 'Gautam Buddha In Black Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(400, '', 'Chhatrapati Shivaji Maharaj Statue Riding On Horse\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, '', 'Tiny Tiny Buddha Face Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, '', 'Gautam Buddha Idol-Black and Silver Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, '', 'Spiritual Gautam Buddha Sitting Statue - Orange Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(404, '', 'Meditating Gautam Buddha - Brown And Pink Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, '', 'Gautam Buddha Sitting Statue - Brown And Green Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, '', 'Gautam Buddha Blessing Pose - Brown\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(407, '', 'Gautam Buddha Sitting Statue - Black And Orange\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(408, '', 'Gautam Buddha Sitting Statue - Black And Purple Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, '', 'Spiritual Gautam Buddha Sitting Statue - Black And Purple Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(410, '', 'Gautam Buddha Sitting Statue - Black And Brown Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(411, '', 'Spiritual Gautam Buddha Sitting Statue - Black And Brown Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(412, '', 'Gautam Buddha Sitting Statue - Black And Blue Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, '', 'Spiritual Gautam Buddha Sitting Statue - Black And Blue Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(414, '', 'Gautam Buddha Sitting Statue - Grey And Bronze Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, '', 'Spiritual Gautam Buddha Sitting Statue - Grey And Bronze Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(416, '', 'Gautam Buddha Sitting Statue - Green And Golden Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(417, '', 'Spiritual Gautam Buddha Sitting Statue - Green And Golden Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(418, '', 'Gautam Buddha Sitting Statue - Black And Golden Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(419, '', 'Spiritual Gautam Buddha Sitting Statue - Black And Golden Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(420, '', 'Spiritual Gautam Buddha Sitting Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(421, '', 'Gautam Buddha Sitting Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(422, '', 'Spiritual Gautam Buddha Sitting Statue - Purple And Golden Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(423, '', 'Gautam Buddha Sitting Statue - Purple And Golden Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(424, '', 'Spiritual Gautam Buddha Sitting Statue - Green And Bronze Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(425, '', 'Gautam Buddha Sitting Statue - Green and Bronze Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(426, '', 'Spiritual Gautam Buddha Sitting Statue - Gray And Black Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(427, '', 'Gautam Buddha Sitting Statue - Gray And Black Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(428, '', 'Radha Krishna With Peacock Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(429, '', 'Fiber Indian Lady Grinding Wheat (Gehu Piste Hue Lady)\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(430, '', 'Fiber Soldier Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(431, '', 'Swan Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(432, '', 'Mahabharath Arjun Rath With Standing Krishna\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(433, '', 'Camel With its Calf Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(434, '', 'Tara Devi Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(435, '', 'Vasudev With Bal Gopal Krishna Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(436, '', 'Tea Pouring Fountain Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(437, '', 'Mahabharath Arjun Rath\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(438, '', 'FRP Lion Statue in Real Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(439, '', 'Brown And White Chef Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(440, '', 'Fiber Holy Family Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(441, '', 'Sitting Chhatrapati Shivaji Maharaj Murti Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(442, '', 'Lord Ganesha Statue For Office And Home\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(443, '', 'Waiter Statue With Chocolate Cake\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(444, '', 'Camel Calf Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(445, '', 'FRP Camel Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(446, '', 'Rajasthani Man Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(447, '', 'Rajasthani Man With Camel And its Calf\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(448, '', 'Fiber Sheshnag Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(449, '', 'Shri Krishna On Sheshnaag Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(450, '', 'Charlie Chaplin Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(451, '', 'Chhatrapati Shivaji Maharaj Small Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(452, '', 'Rajasthani Jaya Vijaya Dwarpal Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(453, '', 'Sitting Buddha In Metallic Golden Blue Colour\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(454, '', 'Gautam Buddha Sitting Statue - Orange Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(455, '', 'Gautam Buddha Sitting Statue - Purple Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(456, '', 'Buddha Sitting Posture- White Colour\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(457, '', 'Peacefully Meditating Blue Buddha\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `products_list` (`id`, `profile`, `name`, `description`, `categories_id`, `brands_id`, `cost`, `status`, `date_created`, `date_updated`) VALUES
(458, '', 'Gracious Black And Dark Blue Buddha\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(459, '', 'Gracious Mehroon And Red Buddha\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(460, '', 'Gracious Mehroon and Sky Blue Buddha\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(461, '', 'Buddha Sitting Pose Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(462, '', 'Boy statue With chocolate bowl\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(463, '', 'Nandi Bull\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(464, '', 'Golden Gautam Buddha In Meditation\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(465, '', 'Gautam Buddha Sitting Statue - Mehroon Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(466, '', 'Spiritual Gautam Buddha Sitting Statue- Mehroon Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(467, '', 'Alligator Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(468, '', 'Nakul Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(469, '', 'Bheem Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(470, '', 'Sahadev Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(471, '', 'Yudhishthira Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(472, '', 'Kunti Mata Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(473, '', 'Arjuna Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(474, '', 'Gautam Buddha In Grey Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(475, '', 'Gautam Buddha Sitting Statue - Golden Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(476, '', 'Spiritual Gautam Buddha Sitting Statue- golden Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(477, '', 'Sai Baba Statue In White Colour\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(478, '', 'Light Brown Shade Gautam Buddha\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(479, '', 'Shree Krishna Playing Flute With Cow Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(480, '', 'Table Top Sleeping Buddha\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(481, '', 'Spiritual Gautam Buddha Sitting Statue- Black And Yellow\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(482, '', 'Gautam Buddha Sitting Statue- Black And Yellow\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(483, '', 'Gautam Buddha Sitting Statue- Black And Green\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(484, '', 'Spiritual Gautam Buddha Sitting Statue- Black And Green\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(485, '', 'Gautam Buddha Sitting Statue- Black And Blue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(486, '', 'Spiritual Gautam Buddha Sitting Statue- Black And Blue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(487, '', 'Spiritual White Shaded Buddha - Big Size\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(488, '', 'Spiritual White Shaded Buddha\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(489, '', 'Spiritual Golden Blue Shaded Buddha - Big Size\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(490, '', 'Spiritual Golden Blue Shaded Buddha\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(491, '', 'Spiritual Gautam Buddha Sitting Statue- Black And Orange\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(492, '', 'Spiritual Gautam Buddha Blessing pose - Brown\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(493, '', 'Spiritual Meditating Gautam Buddha - Brown And Pink shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(494, '', 'Spiritual Meditating Gautam Buddha Statue - Golden Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(495, '', 'Spiritual Meditating Buddha Blessing Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(496, '', 'Golden Charging Bull (Stock Market Rising Upmarket Trend)\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(497, '', 'Charging Bull (Stock Market Rising Upmarket Trend)\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(498, '', 'Traditional Kamdhenu Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(499, '', 'Gautam Buddha In Golden Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(500, '', 'Girl With Ice Cream Cone\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(501, '', 'Giant Ice Cream Cone Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(502, '', 'Boy With Ice Cream Cone\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(503, '', 'Mahadev Shivji Big statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(504, '', 'Swami Vivekananda Statue In White Colour\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(505, '', 'Meditating Buddha Statue Blessing Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(506, '', 'Black And White Panda\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(507, '', 'Elephant Pair In Red Colour\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(508, '', 'Mermaid Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(509, '', 'Chhatrapati Shivaji Maharaj Half Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(510, '', 'Brass Coloured Gautam Buddha On Lotus\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(511, '', 'Lord Shiva Small Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(512, '', 'Bread Man Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(513, '', 'Maharana Pratap Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(514, '', 'Elephant Figurine - in real colour\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(515, '', 'Big Ganesha With Peacock\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(516, '', 'Crane Pair Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(517, '', 'FRP Ostrich Statue - in real size\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(518, '', 'FRP Tiger Statue - In Real Size\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(519, '', 'Royal Elephant With Leaf Top', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(520, '', 'Bharat Mata Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(521, '', 'King Maharana Pratap On Horse\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(522, '', 'Monkey And Her Baby\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(523, '', 'Peacock Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(524, '', 'Cute Boy Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(525, '', 'Beautiful Lady Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(526, '', 'Fiberglass Monkey\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(527, '', 'Stock Market Bull\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(528, '', 'Golden Brown Shade Lord Buddha Decorative Piece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(529, '', 'Pink And Black Shaded Buddha Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(530, '', 'Duck Pair\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(531, '', 'Swan With its Swanlings\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(532, '', 'Golden Tiger Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(533, '', 'Copper Tiger Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(534, '', 'Adorable Panda with its cub\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(535, '', 'Wolf showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(536, '', 'Mahatma Gandhi Statue Golden Colour\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(537, '', 'Mahatma Gandhi Statue Copper Colour\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(538, '', 'Modern Lady Statue And Mannequin\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(539, '', 'Selfie Ice-cream cone statue with seat\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(540, '', 'Cute Puppy Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(541, '', 'Mother-Father and Child Trio Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(542, '', 'Combo Red Yellow capsicum\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(543, '', 'Red Capsicum\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(544, '', 'White Royal Elephant\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(545, '', 'Brown Modern Art Face Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(546, '', 'Golden Modern Art Face Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(547, '', 'Bottle Holder Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(548, '', 'Lady Face Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(549, '', 'Cute Little Duck Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(550, '', 'Cute Makhan Chor Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(551, '', 'Mother Teresa Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(552, '', 'Chhatrapati Shivaji Maharaj Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(553, '', 'Maharana Pratap fiber Glass Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(554, '', 'Panchmukhi Hanuman ji statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(555, '', 'White Modern Art Face Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(556, '', 'Goddess Laxmi Mata A Beautiful Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(557, '', 'Cute ELF Gardener Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(558, '', 'Attractive White Colour Lord Shankar ji Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(559, '', 'Beautiful Real Colour Shankar JI Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(560, '', 'Lord Silver Shiv ji Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(561, '', 'Couple Statue in white colour\n\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(562, '', 'Copper Lord Shiv Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(563, '', 'Lady With Mirror\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(564, '', 'Beautiful Lady Mural In White Color Holding Pot with Fountain\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(565, '', 'Sai Baba Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(566, '', 'Gautam Buddha Statue - Light Wooden Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(567, '', 'Indian Lady Welcome Statue in Multi Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(568, '', 'Welcome Man Statue In Namaste Pose\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(569, '', 'FRP Lion Statue in Real Size\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(570, '', 'FRP Deer Statue in Real Look\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(571, '', 'Deer- Multipurpose Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(572, '', 'Swami Vivekanada Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(573, '', 'MAA SARASWATI\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(574, '', 'SHIVAJI MAHARAJA\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(575, '', 'Big Size Gautam Buddha In Meditation\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(576, '', 'BAL HANUMAN STATUE\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(577, '', 'Cute Boy and Girl Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(578, '', 'Mahavir Swami In Meditation\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(579, '', 'Cute Little Angel\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(580, '', 'EAGLE\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(581, '', 'Swami Vivekananda\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(582, '', 'Ram Darbaar\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(583, '', 'Atal Bihari Bajpai Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(584, '', 'BUDDHA THE GREAT\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(585, '', 'White Buddha Face Idol - Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(586, '', 'Ganesha On Leaf-Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(587, '', 'Man with beer barrel fountain\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(588, '', 'BAWARCHI - THE MASTER CHEF\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(589, '', 'Nandi Statue in Black and Golden\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(590, '', 'Waiter Statue Serving Cake with Pleasure\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(591, '', 'Radha Krishna Dancing Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(592, '', 'Chhatrapati Shivaji Maharaj FRP Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(593, '', 'Sai baba FRP Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(594, '', 'Sai baba Sitting Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(595, '', 'Life Size Giraffe Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(596, '', 'Black Deer Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(597, '', 'Meditating Gautam Buddha- Brown and Golden shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(598, '', 'Deer Statue ? In Real Shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(599, '', 'Meditating Gautam Buddha- Brown and Green shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(600, '', 'Gautam Buddha Sitting Statue- Black and Orange\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(601, '', 'Hanuman Gadah- A Bludgeon in Sinduri color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(602, '', 'Hanuman Gadah- A Bludgeon in black\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(603, '', 'Lord Hanuman Gadah - A Bludgeon\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(604, '', 'Golden Hanuman Gadah - A Bludgeon\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(605, '', 'Royal Guard Welcome Entrance -Dwarpal\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(606, '', 'Darban Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(607, '', 'Vijaya- Dwarpal Statue For Temple\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(608, '', 'Jaya And Vijaya- Temple Dwarpal\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(609, '', 'Life Size Fibre Cow Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(610, '', 'Rajasthani Traditional Lady Holding Odhani', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(611, '', 'A Waiter Statue-Serving With Pleasure\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(612, '', 'Chhatrapati Shivaji Maharaja Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(613, '', 'Yoga Statue In Meditating Position\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(614, '', 'Charlie Chaplin Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(615, '', 'Indian Waiter Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(616, '', 'Man Upper Body Dummy Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(617, '', 'Hot Dog Funny Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(618, '', 'Funny Chef cum joker display statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(619, '', 'Attractive Soldier Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(620, '', 'Beautiful Lady Statue In Red Dress', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(621, '', 'Lady With Child Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(622, '', 'Modern Yoga Statue In Meditation Position\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(623, '', 'FRP Dinosaur Garden Statue- Life Size\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(624, '', 'Maharaja Ranjit Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(625, '', 'Chhatrapati Shivaji Maharaja Statue-Greenish Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(626, '', 'Elegant Peacock Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(627, '', 'Jesus Christ- Lamb Of God Fiber 3D Mural Painting', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(628, '', 'Radhe Krishna Sculpture Under Tree', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(629, '', 'Shirdi Sai Baba Idol Murti\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(630, '', 'FRP - Lord Ganesha Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(631, '', 'Lord Vishwakarma Sculpture\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(632, '', 'Fiber Shiv Ling - Hindu God Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(633, '', 'FRP Ganesha Face - Stone Look\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(634, '', 'God Of Law (Insaff Ki Devi) With Golden Stool\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(635, '', 'God Of Law (Insaff Ki Devi With Metallic Stand)\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(636, '', 'Bam-Bam Bhole Nath Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(637, '', 'Saraswati Mata -Goddess Of Art And Knowledge\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(638, '', 'Hindu God Shiva Lingam Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(639, '', 'Buddhism Goddess Devi Tara- In Sitting Position\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(640, '', 'White Cow With Krishna\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(641, '', 'Bal Ganesha Lying Down Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(642, '', 'Hindu God -Lord Ganapati Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(643, '', 'Sai Baba Statue - Metallic\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(644, '', 'Copper Finished Lord Ganesha Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(645, '', 'Ganesha Face Showpiece Marble Look\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(646, '', 'Mangal Grah-Cultural\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(647, '', 'Buddhism Goddess Devi Tara\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(648, '', 'Radha Krishna Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(649, '', 'Bal Gopal Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(650, '', 'Lord Ganesha Idol-Brass Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(651, '', 'Shani Grah - Sculpture\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(652, '', 'Surya Grah - Murti\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(653, '', 'Lord Krishna Sculpture\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(654, '', 'Lord Sindoori Ganesh\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(655, '', 'Jaya And Vijaya Dwarpal Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(656, '', 'Lord Garuda-Vahana Of Lord Vishnu\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(657, '', 'Lord Hanuman Statue- Large Size\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(658, '', 'Lord Ganesha Seating Pose Multi-color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(659, '', 'Fiber Lord Hanuman Standing Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(660, '', 'Lord Garuda In White Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(661, '', 'Lord Ganesha Sitting On Sihaasan\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(662, '', 'Divine Devi Durga Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(663, '', 'Grah Statues - Surya, Shani, Guru And Mangal Grah\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(664, '', 'Goddess Saraswati Devine Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(665, '', 'Nandi Statue- The Vahana Of Shiva\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(666, '', 'Balaji Statue - The Lord Of Tirupati\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(667, '', 'Lord Jhulelal Resin Figurine\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(668, '', 'Radha Krishna Mesmerizing Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(669, '', 'Mahatma Gandhi Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(670, '', 'Mahatma Gandhi Statue- Black Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(671, '', 'Mahatma Gandhi - Bapu Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(672, '', 'Silver Shade Gautam Buddha Mini Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(673, '', 'Brass Shade Gautam Buddha Mini Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(674, '', 'Golden Shade Gautam Buddha Showpiece Mini\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(675, '', 'Lord Buddha Face Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(676, '', 'Laughing Buddha Statue - Fengshui Product\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(677, '', 'Sitting Position Gautam Buddha Under Tree Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(678, '', 'Buddha White And Golden Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(679, '', 'Gold And Black Sitting Buddha Idol', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(680, '', 'Sitting Buddha Idol -Stone Pink Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(681, '', 'Lord Buddha Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(682, '', 'Gautam Buddha Half Structure Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(683, '', 'Gautam Buddha Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(684, '', 'Metallic Buddha In Real Size Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(685, '', 'Gautam Buddha In Resting Position Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(686, '', 'Gautam Buddha Statue In Metallic\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(687, '', 'Golden colored Gautam Buddha peacefully sitting Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(688, '', 'Brass Color Lord Buddha Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(689, '', 'Gautam Buddha Face Idol In Light Metallic Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(690, '', 'Laughing Buddha - Figurine\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(691, '', 'Light Brown Shade Gautam Buddha Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(692, '', 'Lord Gautam Buddha Showpiece- Silver Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(693, '', 'White Gautam Buddha Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(694, '', 'Black Buddha Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(695, '', 'Gautam Buddha Sitting Pose Black\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(696, '', 'Gautam Buddha Sitting Pose White\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(697, '', 'Gautam Buddha Sitting Pose- Brown\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(698, '', 'Gautam Buddha Sitting Pose- Copper Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(699, '', 'Buddha Sitting Posture- Metallic Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(700, '', 'Gautam Buddha Statue- In Real Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(701, '', 'Gautam Buddha Statue - Wooden Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(702, '', 'Gautam Buddha Resting Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(703, '', 'Santa Claus Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(704, '', 'Traditional Darbaan Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(705, '', 'Fiber Kitchen Head - Chef\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(706, '', 'Chef Statue With Menu Board\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(707, '', 'An Ancient Egyptian Queen - Cleopatra Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(708, '', 'Egyptian Man Guard- Black Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(709, '', 'Ancient Egyptian Cat Statue- Metallic\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(710, '', 'Ancient Egyptian Cat Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(711, '', 'Fiber Egyptian Modern Man Guard\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(712, '', 'Fiber Egyptian Modern Lady Colorful Guard\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(713, '', 'Indian Lady Welcome Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(714, '', 'Indian Lady Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(715, '', 'Dwarpal Statue For Temple\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(716, '', 'White Swan Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(717, '', 'Siberian Crane White Big Bird Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(718, '', 'Siberian Crane White Small Bird Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(719, '', 'Queen Honey Bee Garden Decor\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(720, '', 'Sleeping Labrador Puppy', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(721, '', 'Pug Dog In A Small Space Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(722, '', 'Fiber Dog Statue - Hound\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(723, '', 'Fiber Camel-Real Look Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(724, '', 'Glamours FRP Deer Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(725, '', 'FRP Barasingha-Swamp Deer\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(726, '', 'Fiber - Giraffe Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(727, '', 'Big Lion Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(728, '', 'Real Look Sitting Deer\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(729, '', 'Riding Horse FRP Statue In Real Shape\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(730, '', 'The White Cow- Divine Indian Holy Animal', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(731, '', 'Crocodile Figurine Fountain\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(732, '', 'Golden Deer Pair\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(733, '', 'Crane - A Real Look Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(734, '', 'Horse-A Funny Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(735, '', 'Attractive Bear Garden Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(736, '', 'White Deer Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(737, '', 'Mother Cow And Calf Garden Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(738, '', 'Life Size- Brown Cow Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(739, '', 'Camel Fiber Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(740, '', 'Life Size - White Cow Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(741, '', 'Mother India- Bharat Mata Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(742, '', 'Royal Big Elephant Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(743, '', 'Flamingo Bird Stick Like Legs -Orange Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(744, '', 'Beautiful FRP Dancing Couple\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(745, '', 'Shirdi Sai Baba Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(746, '', 'Sai Baba In Matt White Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(747, '', 'Elephant With Golden Design Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(748, '', 'FRP Lord Ganesha In Metallic Color\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(749, '', 'Marble Finished Lord Ganesha\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(750, '', 'Lying Down Position Ganesha\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(751, '', 'Real Pig Shaped Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(752, '', 'Lord Ganesha Face -Black & Golden Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(753, '', 'Great Buddha Showpiece In Golden Metallic Look\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(754, '', 'Devki MATA Statue - in Namaste Position\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(755, '', 'Real Pig Showpiece- Combo Pack\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(756, '', 'Metallic Owl- Vahana of Goddess Lakshmi MATA\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(757, '', 'Small Gautam Lord Buddha Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(758, '', 'Brass Color Lion Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(759, '', 'FRP Cobra Sculpture', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(760, '', 'Pig Shaped Showpiece\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(761, '', 'Meera Bai Sculpture\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(762, '', 'Sleeping Position Buddha Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(763, '', 'Pleasant Statue Of Peacock\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(764, '', 'Royal Arts Elephant Figurine\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(765, '', 'Real Shape Attractive Water Drinking Deer\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(766, '', 'Classic Style Pink Flamingo Model\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(767, '', 'Egyptian Queen - Cleopatra Statue in Laying Down Position\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(768, '', 'German Shepherd Dog Statue In Sitting Position - In Bigger Size\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(769, '', 'Traditional Look Darban - The Royal Guard\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(770, '', 'Attractive Peacock Fiber Statue with Open Feathers\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(771, '', 'Milky White Cow with Its Calf Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(772, '', 'FRP White Duck Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(773, '', 'Lord Ganesha Idol-Sindoori Shade\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(774, '', 'FRP Dog Figurine Statue - German Shepherd', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(775, '', 'Swami Vivekananda - The Vedanta Idol\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(776, '', 'Fiber Egyptian Modern Lady Guard\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(777, '', 'A Royal Elephant Welcome Statue in White Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(778, '', 'The Great Maratha Leader Chhatrapati Shivaji Statue\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(779, '', 'Divine Mushak -The Vahana of Lord Ganesha\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(780, '', 'Kamdhenu Cow with Calf\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(781, '', 'Indian Lady Welcome Statue- Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(782, '', 'Rabindranath Tagore Statue in Metallic Golden', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(783, '', 'Rabindranath Tagore Statue in Copper Metallic Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(784, '', 'Duck Pair Showpiece of Brown Shaded', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(785, '', 'Showpiece of Ivory Coloured Duck Pair', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(786, '', 'Attractive Look- Mushroom Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(787, '', 'Yellow Sea Horse Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(788, '', 'Lord Krishna Playing Flute', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(789, '', 'Multi-color Lord Ganesha', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(790, '', 'Lord Ganesha Face Multi-color Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(791, '', 'Welcome Elephant-In Golden Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(792, '', 'White Siberian Crane Bird Pair', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(793, '', 'Marble Look -Welcome Elephant', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(794, '', 'Welcome Elephant Statue For Entrance', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(795, '', 'Lord Shiv In Sitting Positions', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(796, '', 'Gautam Buddha Face Idol in Metallic Bluish Colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(797, '', 'Gautam Buddha Face Small Size - Dark Metallic', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(798, '', 'Lord Buddha Face Small Size - Light Metallic Colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(799, '', 'Royal Looking White Horse Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(800, '', 'Egyptian Lady Guard -Natural Shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(801, '', 'Lord Hanuman Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(802, '', 'Gautam Buddha Statue In Standing Position', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(803, '', 'Lord Ganesha Multi-color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(804, '', 'Squirrel With Mushroom Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(805, '', 'Devi Saraswati Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(806, '', 'FRP Tea Girl Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(807, '', 'The Merlion Singapore Fountain - Big Size', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(808, '', 'Attractive Blue Buddha Statue With Waterfall And LED Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(809, '', 'Attractive Buddha Head Statue With Waterfall And LED Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(810, '', 'Palm Buddha Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(811, '', 'Jesus Face Fountain With Multicolour Lights And Fog', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(812, '', 'Attractive Golden Black Buddha Statue With Waterfall And LED Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(813, '', 'Attractive Orange Buddha Statue With Waterfall And Led Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(814, '', 'Attractive Shiv Ji Statue With Waterfall And Led Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(815, '', 'Peacock Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(816, '', 'Rock Structured Waterfall Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(817, '', 'Copper Shaded Step Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(818, '', 'Meditation Buddha On Lotus Fountain In White Colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(819, '', 'Mesmerising Waterfall Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(820, '', 'White Buddha Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(821, '', 'Tea Pouring Fountain Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(822, '', 'Ram Bhagwan With Shivling Abhishek Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(823, '', 'Stone Look Buddha Side Face Fountain With LED Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(824, '', 'The Merlion Singapore Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(825, '', 'Gau Mukh Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(826, '', 'Multicolor Angel Water Fountain With LED Lights', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(827, '', 'Horse Drinking Water Modern Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(828, '', 'Royal Golden Tub Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(829, '', 'Cascadia Falls Corner Fountain with shiva', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(830, '', 'Cascadia Falls Corner Fountain with Blue Buddha', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(831, '', 'Cascadia Falls Corner Fountain With Mahavir Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(832, '', 'Cascadia Falls Corner Fountain With Laxmi Mata', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(833, '', 'Cascadia Falls Corner Fountain With Buddha statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(834, '', 'Cascadia Falls Corner Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(835, '', 'Lord Ganesha Lotus Water Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(836, '', 'Lord Ganesha Lotus Water Fountain - In Black Shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(837, '', 'Meditation Buddha On Lotus Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(838, '', 'Rustic Tree Water Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(839, '', 'Lord Shiva Walnut Water Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(840, '', 'Hilltop Ganpati Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(841, '', 'Indoor Buddha Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(842, '', 'Rustic Tree Waterfall', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(843, '', 'Boy Statue With Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(844, '', 'Grey Palm Buddha Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(845, '', 'Circular Step Diya Fountain With Buddha Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(846, '', 'Shiv Parivar Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(847, '', 'Big Buddha Statue With Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(848, '', 'Shiva Statue With Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(849, '', 'Golden Tub With Fountain - In Big Size', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(850, '', 'Flower Petal Step Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(851, '', 'Golden Lord Buddha With walnut Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(852, '', 'Cream Step Water Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(853, '', 'Meditation Buddha With Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(854, '', 'Maharana Pratap With Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(855, '', 'Lord Julelal With Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(856, '', 'Ganpati With Water Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(857, '', 'Lord Ram Walnut Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(858, '', 'Gautam Buddha Statue With Pink Lotus Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(859, '', 'Lord Gautam Buddha Wall Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(860, '', 'Mount Lion Face Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(861, '', 'Half Cut Stem Center Table With fountain (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(862, '', 'Diya Step Fountain With Lotus Base', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(863, '', 'Wavy Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(864, '', 'Round Step Diya Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(865, '', 'Brown Round Step Diya Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(866, '', 'Brown Kettle and Rock Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(867, '', 'Dwarf Table Top Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(868, '', 'Fountain In Hands With Round LED Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(869, '', 'Kettle and Rock Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(870, '', 'Multicoloured LED Globe Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(871, '', 'Angel Water Fountain With LED Lights', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(872, '', 'Natkhat Makhan Chor Statue With Waterfall And L E D Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(873, '', 'Attractive Shankar Bhagwan Statue With Waterfall And LED Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(874, '', 'Attractive Laxmi Mata Statue With Waterfall And L E D Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(875, '', 'Attractive Bholenath Statue With Waterfall And L E D Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(876, '', 'Shri Ganesh ji Statue With Ball Fountain And L E D Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(877, '', 'White Buddha Statue With Lotus Base Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(878, '', 'Beautiful Lady Mural In White Color Holding Pot with Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(879, '', 'FRP Rock Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(880, '', 'Fiber Rock Corner Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(881, '', 'Buddha Statue With Lotus Base- Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(882, '', 'Man with beer barrel fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(883, '', 'Peaceful Buddha On Lotus Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(884, '', 'Lord Balaji Water Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(885, '', 'Deer Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(886, '', 'Lion Face Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(887, '', 'Stone Look Buddha Statue With Lotus Base- Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(888, '', 'Cascade Diya Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(889, '', 'Cascade Diya Fountain With Saibaba Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(890, '', 'Rock Textured Buddha Fountain With Lotus Base', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(891, '', 'Tub With Fountain - In Golden Shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(892, '', 'Diya Shape Water Fall With Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(893, '', 'Sai Baba Along With His Follower Water Falling', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(894, '', 'Global Shaped Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(895, '', 'Shivling Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(896, '', 'Seating Lady Waterfall', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(897, '', 'Lotus Shaped FRP Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(898, '', 'Egyptian Lady Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(899, '', 'Sea Horse Water Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(900, '', 'Waterfall Diya Under Umbrella Shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(901, '', 'Waterfalls From Diya Attached With Stem', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(902, '', 'Wooden Look Modern Lady Face With Light,Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(903, '', 'Showpiece Fountain Stand', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(904, '', 'Kamdhenu Cow With Shivling', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(905, '', 'Santa Table Top Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(906, '', 'Unique Stone Look Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(907, '', 'Pyramid Look Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(908, '', 'Mermaid Statue In Real Size', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(909, '', 'White Golden - Crown Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(910, '', 'Metallic Look Crown Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(911, '', 'White Golden -Balloon Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(912, '', 'Metallic Look Balloon Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(913, '', 'Wooden Look Snake Face Music, Light And Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(914, '', 'Lotus With Balloon Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(915, '', 'Unique Stone Look Fountain With Lord Shiva', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(916, '', 'Bear Holding Stem -Look Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(917, '', 'Dolphin Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(918, '', 'Three Sided Stone Look Corner Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `products_list` (`id`, `profile`, `name`, `description`, `categories_id`, `brands_id`, `cost`, `status`, `date_created`, `date_updated`) VALUES
(919, '', 'Beautiful Multi Step Sai Baba Diya Water Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(920, '', 'Beautiful Diya Water Fountain With Lord Shiva', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(921, '', 'Outdoor Metallic Look Water Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(922, '', 'Attractive Pot Water Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(923, '', 'Beautiful Pink Balloon Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(924, '', 'Attractive Pink Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(925, '', 'Elegant Fountain Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(926, '', 'Multistep Diya Fountain With White Sai Baba', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(927, '', 'Peacock Water Fountain- Wedding Decor', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(928, '', 'Zig Zag Shaped Water Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(929, '', 'Beautiful Lotus Shape Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(930, '', 'Sai Statue With Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(931, '', 'Single Cascade Diya Lord Ganesha Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(932, '', 'Golden Swan Mushroom Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(933, '', 'Designer Ladder Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(934, '', 'Modern Black Statue Waterfall', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(935, '', 'Stone Look Shell Shaped Water Corner Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(936, '', 'Circular Step Diya Fountain With Sai Baba Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(937, '', 'Step Diya Fountain With Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(938, '', 'Half Cut Stem - Step Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(939, '', 'Unique Modern Fountain Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(940, '', 'White Lord Shiv With Shankh Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(941, '', 'Buddha Face Fountain With Lights And Fog', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(942, '', 'Copper Shade Buddha Fountain With Ball Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(943, '', 'Gautam Buddha Fiber Fountain With Blue Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(944, '', 'Gautam Buddha Fiber Building Fountain With Lights', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(945, '', 'Buddha Face Water Fountain With Multicolor Lights', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(946, '', 'Lord Buddha Stone Looked Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(947, '', 'Unique Stone Look Fountain With Gautam Buddha', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(948, '', 'Multi Step Buddha Water Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(949, '', 'Beautiful White Buddha Water Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(950, '', 'Gautam Buddha Statue Standing On Lotus Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(951, '', 'Lord Buddha Face Step Diya Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(952, '', 'Lord Buddha Face Diya Fountain - Metallic Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(953, '', 'Designer Ladder Fountain With Gautam Buddha Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(954, '', 'Gautam Buddha Small Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(955, '', 'Wooden Look Snake Face Music and Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(956, '', 'Wooden Look Snake Face LED Light And Fountain Stand', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(957, '', 'Wooden Look Ganesha Face With Light And Music', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(958, '', 'Wooden Look Ganesha Face With Music Light And Fountain Stand', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(959, '', 'Traditional Lady Holding Pot- Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(960, '', 'Metallic Tub - Fountain LED Lights', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(961, '', 'Water Fall In Shankh Shaped', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(962, '', 'Rose Water Floating Pot With Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(963, '', 'Designer Stone Looked Sleeping Buddha Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(964, '', 'Buddha Side Face Fountain With LED Light', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(965, '', 'Lady Holding Pot Waterfall', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(966, '', 'Lady Holding Pot Copper Shade Waterfall', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(967, '', 'Wooden Look Modern Lady Face With Light Music Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(968, '', 'Wooden Look Modern Lady Face Light Music', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(969, '', 'Bam Bam Bhole Wooden Look Structure With LED Light Music', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(970, '', 'Bam Bam Bhole Wooden Look Structure with Light Music Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(971, '', 'Fountain with Mahadev and Golden Pot-Combo Pack', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(972, '', 'Egyptian Look Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(973, '', 'Lord Ganesha Sitting on Lotus- Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(974, '', 'Lotus Floating Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(975, '', 'Curve Fountain With Buddha', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(976, '', 'Cricket Ball Shaped Center Table (Without Glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(977, '', 'Gorgeous Rajasthani Lady Center Table (Without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(978, '', 'Elegant Roman Shaped Side Table - In Silver Colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(979, '', 'Royal Rajasthan Camel Center Table - In White Colour (Without Glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(980, '', 'FRP Bullock Cart Center Table (Without Glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(981, '', 'Modern Circle Center Table On Square Curved Arch', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(982, '', 'Diamond Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(983, '', 'Modern Semi-Circle Center Table Without Glass', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(984, '', 'Wooden Brown Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(985, '', 'Wooden Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(986, '', 'Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(987, '', 'Round Curved Designer Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(988, '', 'Round Brown Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(989, '', 'Luxurious Square Center Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(990, '', 'Modern Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(991, '', 'Modern Square Center Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(992, '', 'Round Marble Look Modern Center Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(993, '', 'Cartoon Bed Kitty For Kids', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(994, '', 'Round Modern Geometrical Center Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(995, '', 'Crossbow Center Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(996, '', 'Modern Center Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(997, '', 'Modern Sleek Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(998, '', 'Modern Multipurpose Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(999, '', 'Luxury Colonial Side Table.', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1000, '', 'Hexagon Geometric Designer Center Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1001, '', 'Victorian Side Table With Dark Teak Wood Black Color.', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1002, '', 'Side Table Bowl Stand Look With Wooden Grains', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1003, '', 'Designer Wooden Brown Plywood Side Table with Magazine Stand', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1004, '', 'Designer Wooden Brown Plywood Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1005, '', 'Geometrical Object in Square Stand Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1006, '', 'Hanging Table Wall Corner', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1007, '', 'Ship Anchor Unique Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1008, '', 'Modern Side Table Unique Strong Plywood Furniture for Living Room and Other Use', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1009, '', 'Bed or Wall Side Table With Drawer Nordic Style Furniture Plywood', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1010, '', 'Classic Side Table Unique Plywood Traditional Furniture', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1011, '', 'Modern Bed Side Table with Drawer Nordic Style Furniture Plywood', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1012, '', 'Modern Side Table Unique Geometric Shape Plywood Furniture', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1013, '', 'Classic Side Table with Drawer Unique Plywood Traditional Furniture For Home, Office', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1014, '', 'Teak Wood Sagwan Center Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1015, '', 'Modern Pet House For Small Dog Breeds And Cat', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1016, '', 'Dog House And Cat House Multipurpose Side Table Geometric Shape', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1017, '', 'Traditional Camel Shaped Mirror', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1018, '', 'Kids Modern Upholstered Designer Bed', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1019, '', 'Yellow Sports Car Bed', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1020, '', 'Blue Sports Car Bed', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1021, '', 'Pink Crown Shaped Bed', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1022, '', 'Pink Children\'s Bed', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1023, '', 'Heart Shape Bed', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1024, '', 'Stone Look Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1025, '', 'Sports Car Bed', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1026, '', 'Dolphin Shaped Bed', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1027, '', 'Copper Coloured Lady Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1028, '', 'Half Cut Stem Center Table With fountain (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1029, '', 'FRP Dice Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1030, '', 'Dancing Ladies Center Table (Without Glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1031, '', 'Wooden Look Tall Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1032, '', 'Peacock Center Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1033, '', 'Round wooden center table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1034, '', 'Centre table with stripes', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1035, '', 'Revolving side table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1036, '', 'Multi Square Centre Table (Without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1037, '', 'Brown grain black Drift Center Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1038, '', 'White and Walnut Center Table (Without Glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1039, '', 'Black Walnut Drift Drawer Center Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1040, '', 'White Walnut Drift Drawer Center Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1041, '', 'Brown colour Elephant Center Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1042, '', 'Corner Pillar Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1043, '', 'Wooden Shade Elephant Center Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1044, '', 'Baby Crib Swing With Chair For Mother', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1045, '', 'Multipurpose Side Table With Magazine And Newspaper Rack', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1046, '', 'Elegant Brown Couch', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1047, '', 'Royal Look Brown Wooden Chair', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1048, '', 'Curved Bench', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1049, '', 'Podium Desk', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1050, '', 'Octagon Shaped Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1051, '', 'Seminar Podium desk', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1052, '', 'Elegant Podium Desk', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1053, '', 'Modern White Couches Beautiful Sofa', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1054, '', 'Comfortable Couch Sofa With Storage', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1055, '', 'Public Locker', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1056, '', 'Royal FRP Couch', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1057, '', 'Purple Colour Modern Desk', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1058, '', 'Office Side table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1059, '', 'Book- Magazine Self', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1060, '', 'Cat House - Cattery', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1061, '', 'Brown Wooden Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1062, '', 'Modern Brown Wing Chair', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1063, '', 'Gorgeous U Shaped Dressing Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1064, '', 'Modern Wooden Desk', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1065, '', 'Modern Gray Colour Organizer Stand', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1066, '', 'Moving Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1067, '', 'White Royal Couch', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1068, '', 'Organizer Stand', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1069, '', 'Center Table with Traditional Men (Without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1070, '', 'Brown Colour Lady Face Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1071, '', 'Sunflower Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1072, '', 'Rectangular Wooden Center/Coffee Table with Shelves', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1073, '', 'Wooden Study Table With Drawer', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1074, '', 'Wooden Versatile Table With Drawer', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1075, '', 'Wooden Center/ Coffee Table With 4 Shelves', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1076, '', 'School / College Classroom Double Seated Wooden Desk cum Study Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1077, '', 'Cushion Wooden Chair', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1078, '', 'Book shelf cum Rack Decorative piece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1079, '', 'Elephant Base Center Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1080, '', 'Elegant Roman Shaped Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1081, '', 'Yellow Chair and Table Set', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1082, '', 'Yellow FRP table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1083, '', 'Rajasthani Lady Center Table- Pink (Without Glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1084, '', 'Wooden Color - Buffet Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1085, '', 'Cricket Bat And Bowl Shape Center Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1086, '', 'Fiber Egyptian Lady- Rectangular Center Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1087, '', 'Fiber Modern Lady Round Center Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1088, '', 'Queen Of Egypt Face Shaped - Side Table ( without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1089, '', 'Multipurpose Use Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1090, '', 'Multiple Use Modern Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1091, '', 'Unique Wooden Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1092, '', 'Wooden-Pink Colored Top End Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1093, '', 'Rajasthani Couple Face Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1094, '', 'Designer Wooden Look Peacock Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1095, '', 'Turtle Base Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1096, '', 'Wooden Center Tea Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1097, '', 'Decorative Yellow Buffet Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1098, '', 'Beautiful Rajasthani Lady Center Table - (Without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1099, '', 'Table With Glass Holder', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1100, '', 'Rajasthani Lady Center Table (Without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1101, '', 'Designer Leg Shape Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1102, '', 'Fiber Golden Swan Statue/ Table (Without Glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1103, '', 'Egyptian Lady Look Center Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1104, '', 'Lady Face Brownish Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1105, '', 'Designer Tortoise Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1106, '', 'Metallic Lady Look Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1107, '', 'Multi-Design Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1108, '', 'Wooden Color Buffet Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1109, '', 'Attractive Egyptian Look Center Table (Without Glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1110, '', 'Golden Designer Center Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1111, '', 'Golden Decorative Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1112, '', 'White Golden Shade Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1113, '', 'Wooden Look Lady Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1114, '', 'Couple Wooden Look Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1115, '', 'Attractive Egyptian Look Table Chair- Set Of 2 (Without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1116, '', 'Egyptian Lady Face Table ( without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1117, '', 'Lion Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1118, '', 'Egypt Primeval Teapoy Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1119, '', 'Adjustable Book Storage Rack', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1120, '', 'Unique Golden Tea Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1121, '', 'Metallic Golden Moonlight Side Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1122, '', 'Unique Modern Fountain Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1123, '', 'Egyptian Lion Coffee Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1124, '', 'Antique Round Trumpet Leg Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1125, '', 'Hand Shape Center Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1126, '', 'Center Table With Three Elephants (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1127, '', 'Royal Rajasthan Camel Center Table (Without Glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1128, '', 'Bat And Bowl Shape Center Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1129, '', 'Traditional Rajasthani Lady Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1130, '', 'Tortoise/Turtle Shaped Fiber Bench', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1131, '', 'Swan Shape Garden Bench', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1132, '', 'Metallic Coloured- Stem Shape Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1133, '', 'Kids Fiber Red Long Table And Chair Set', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1134, '', 'Stylish Red Chair (6-Set)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1135, '', 'Beautiful Unique Yellow Chair', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1136, '', 'Attractive Green Chair', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1137, '', 'Emperor British Design Arm Chair', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1138, '', 'British Royal Golden Lion Chair', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1139, '', 'Decorative Stool As A Side Table In Cream Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1140, '', 'Rajasthani Man Face FRP Multipurpose Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1141, '', 'Multi Purpose Wooden Look Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1142, '', 'Dark Brown Wooden Look Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1143, '', 'Wooden Shade Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1144, '', 'Pink Crown Shape Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1145, '', 'Dice Shape Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1146, '', 'Black Crown Shape Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1147, '', 'Tabla Look Table-Goblet Drum (Stool)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1148, '', 'Wooden Look Fiber Stand', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1149, '', 'Triangular Corner Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1150, '', 'Small Round Stool In Metallic Look', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1151, '', 'FRP Shahi Elephant Leg Look Brown Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1152, '', 'FRP Shahi Elephant Leg Look Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1153, '', 'Tabla Shaped Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1154, '', 'Cream Textured Side Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1155, '', 'Rajasthani Man Face Side Stool -Dark Shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1156, '', 'Wooden Look Antique French Style Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1157, '', 'Village Lady Side Table in Stem Look', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1158, '', 'Gorgeous Rajasthani Lady Sitting Position - Fancy Table (Without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1159, '', 'Blue Embroidered Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1160, '', 'Decorative Plain Flower Pot Yellow', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1161, '', 'Shirt Shaped Planter in Red Colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1162, '', 'Attractive Monkey Shape Plant Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1163, '', 'Red Heighted Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1164, '', 'Small Spotted Single Silver Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1165, '', 'Medium Shaped Spotted Silver Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1166, '', 'Long Shaped Spotted Single Silver Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1167, '', 'Engraved leaves Red Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1168, '', 'Two Sided Golden Face Elephant Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1169, '', 'Long Rectangular White Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1170, '', 'Heighted Red Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1171, '', 'Heighted Yellow Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1172, '', 'Hanging Ice-cream Cone Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1173, '', 'Peacock Ornamental Multipurpose Urli Bowl', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1174, '', 'Santa Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1175, '', 'Multi Colour Men face Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1176, '', 'Lady Face vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1177, '', 'Drum Shape Planter - In Damru Look', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1178, '', 'Yellow Sleek Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1179, '', 'Real Size Shoe with Rabbit Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1180, '', 'Designer Rectangular Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1181, '', 'Multi purpose Golden Glow Vase - Separator - Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1182, '', 'Big Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1183, '', 'EXQUISITE FLOWER VASE', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1184, '', 'Old Man Holding Plant Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1185, '', 'Adorable Fiber Squirrel Shaped Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1186, '', 'Exquisite Decorative Snail Shape Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1187, '', 'Uniquely Designed Teeth Plant Holder', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1188, '', 'Elephant Playing With Ball Plant Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1189, '', 'Squirrel Shaped Plant Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1190, '', 'Plant Pot With A Frog In Sitting Position', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1191, '', 'Pink Fish Holding Bucket - Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1192, '', 'Little Teddy Holding Pot - Multiuse Bucket', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1193, '', 'Brown Elephant Shaped Plant Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1194, '', 'Designer Round Shaped Flower Vase - Brown', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1195, '', 'Stone Looked Face Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1196, '', 'Sleek Flower vase - blue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1197, '', 'Sleek Flower vase - Dark Brown', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1198, '', 'Sleek Flower vase - Golden shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1199, '', 'Sleek Flower vase - Brown', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1200, '', 'Designer Metallic Look Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1201, '', 'Egyptian Pharao Face Plant Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1202, '', 'Egyptian Lady Face Plant Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1203, '', 'Camel Face Shaped Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1204, '', 'Car Shape Multipurpose Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1205, '', 'Decorative Pink Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1206, '', 'Stylish Fiber Floor Vase In White', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1207, '', 'Glorify Antique Handcrafted Fiber Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1208, '', 'Glorify Antique Fiber Handcrafted Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1209, '', 'Glorify Antique Small Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1210, '', 'Wooden Flower Vase In Different Shades', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1211, '', 'Designer Brass And Dark Brown Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1212, '', 'Big Peacock Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1213, '', 'Designer Off White And Golden Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1214, '', 'Rajasthani Woman Half Face Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1215, '', 'Pink Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1216, '', 'Decorative Stone Look Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1217, '', 'Dark Brown Vase With Golden Flower Design', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1218, '', 'Traditional Rajasthani Man Face Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1219, '', 'Stylish Big Size Vase In Copper Metallic Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1220, '', 'Green Color Lady Face Flower Vase In Big Size', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1221, '', 'Tortoise Shaped Flower Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1222, '', 'Royal Look Flower Vase In Metallic Golden Colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1223, '', 'Indian Engrave Art In Brass Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1224, '', 'Couple Flower Vase In White Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1225, '', 'Traditional Lady Fiber Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1226, '', 'Wooden Colored Vase With Face Engraved', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1227, '', 'Alphabet Embossed Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1228, '', 'Peacock Shape Handmade Floor Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1229, '', 'Big Metallic Look Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1230, '', 'Male-Female Printed Vase In Metalic Golden Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1231, '', 'Male-Female Printed Vase In Multi-Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1232, '', 'Swan Embossed Vase In Golden Colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1233, '', 'Beautiful Printed Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1234, '', 'Brown Terracotta Look Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1235, '', 'Designer Metallic Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1236, '', 'Swan Embossed Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1237, '', 'Glorify Brown Antique Handcrafted Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1238, '', 'Glorify Handcrafted Texture Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1239, '', 'Earthern Look Flower Vase In Brown', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1240, '', 'Brown Color Big Size Fiber Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1241, '', 'Greenish Alphabet Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1242, '', 'Grey Shade Traditional Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1243, '', 'Standing Lady With Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1244, '', 'Dark Pink Shade Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1245, '', 'Copper Black Plain Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1246, '', 'Designer Small Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1247, '', 'Couple Face Flower Vase In Wooden Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1248, '', 'Couple Face Flower Vase In Red Black Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1249, '', 'Stylish Black Pot With Silver Flower Design', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1250, '', 'Small Spotted Single Golden Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1251, '', 'Long Spotted Single Golden Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1252, '', 'Spotted Single Golden Vase - Medium', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1253, '', 'Designer Mate Black Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1254, '', 'Silver Combo Spotted Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1255, '', 'Beautiful Textured Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1256, '', 'Beautiful Double Curved Floor Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1257, '', 'Bamboo Shape Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1258, '', 'Designer Black Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1259, '', 'Designer Vase In Brown Shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1260, '', 'Designer Round Shaped Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1261, '', 'Unique Designer Round Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1262, '', 'Cylindrical Shaped Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1263, '', 'Baby Duck Holding Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1264, '', 'Shankh Shape Planter With Frog', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1265, '', 'Horse Holding Cart Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1266, '', 'Western Horse Cart Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1267, '', 'Shoe Shaped Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1268, '', 'Dinosaur Shape Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1269, '', 'Swan Shape Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1270, '', 'Santa Shape Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1271, '', 'Swan Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1272, '', 'Divine Tulsi Plant Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1273, '', 'Cute Small Girl Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1274, '', 'Bird Shaped Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1275, '', 'Shirt Shape Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1276, '', 'Ox Shape Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1277, '', 'Cock Shaped Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1278, '', 'Holy Basil - Divine Tulsi Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1279, '', 'Dog Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1280, '', 'Puppy Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1281, '', 'Wooden Look Decorative Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1282, '', 'Shankh Shaped Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1283, '', 'Bob The Builder Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1284, '', 'Lion Shaped Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1285, '', 'Puppy Shape Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1286, '', 'Divine Tulsi Planter With Imprinted Ganesha', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1287, '', 'Camel Shape Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1288, '', 'White Lady Face Wall Decor Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1289, '', 'Ancient Lady With Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1290, '', 'Peacock Shape Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1291, '', 'Elephant Shaped Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1292, '', 'Frog Shaped Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1293, '', 'Monkey Shape Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1294, '', 'Duck Shape Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1295, '', 'Frog Dragging Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1296, '', 'Cow Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1297, '', 'Santa Claus Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1298, '', 'Shoe Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1299, '', 'Big Size Plant Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1300, '', 'Snail Shaped Plant Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1301, '', 'Fish Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1302, '', 'Rhinoceros Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1303, '', 'Rabbit Plant Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1304, '', 'Two Sided Black Face Elephant Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1305, '', 'Metallic Horse Look Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1306, '', 'Stem Look FRP Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1307, '', 'Lion Shaped Flower Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1308, '', 'Squirrel Shape Plant Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1309, '', 'Wooden Look Floating Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1310, '', 'Wooden Look Floating Pot-Large Size', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1311, '', 'Stem Look Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1312, '', 'Divine Tulsi Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1313, '', 'Divine Tulsi Pot With Ganesh Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1314, '', 'Pink Shade Designer Plant Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1315, '', 'Elegant Silver Swan Plant Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1316, '', 'Round Top Shape Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1317, '', 'Yellow Round Shaped Plant Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1318, '', 'Greek Man Sculpture Head Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1319, '', 'Yellow Square Shape Plant Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1320, '', 'White Floral Sand Texture Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1321, '', 'Black Embroidered Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1322, '', 'Round Metallic Leaf Design Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1323, '', 'Square Shape Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1324, '', 'Yellow Cup Shape Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1325, '', 'Puppy Multipurpose Box', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1326, '', 'Designer White Curve Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1327, '', 'Hexagonal White Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1328, '', 'Cup Shape Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1329, '', 'Long Rectangular Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1330, '', 'Camel Face Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1331, '', 'Bird Shape Beautiful Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1332, '', 'Heighted White Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1333, '', 'Wooden Brown Shade Long Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1334, '', 'Sleeping Lady Face Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1335, '', 'Stylish Black And White Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1336, '', 'Floating Flower Pot In Light Pinkish Shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1337, '', 'Royal Floating Flower Pot - Off White Shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1338, '', 'Multipurpose White Color Urli', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1339, '', 'Floating Pot- Urli', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1340, '', 'Queen Of Egypt Showpiece In Dark Brown Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1341, '', 'Queen Of Egypt Showpiece -Off White Shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1342, '', 'Green Flower Vase - In Trendy Look', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1343, '', 'Metallic Dark Bluish Coloured Vase- In Face Sculptured', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1344, '', 'Metallic Golden Decorative Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1345, '', 'Long Shaped Spotted Single Golden Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1346, '', 'Medium Shaped Spotted Golden Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1347, '', 'Special Combo Pack Of Spotted Golden Flower Vases', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1348, '', 'Designer Copper Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1349, '', 'Village Lady Shape-Vase-Small Size', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1350, '', 'Village Lady Shape,Flower Vase-Combo Pack', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1351, '', 'Designer Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1352, '', 'Village Lady Shape, Flower Vase -Big Size', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1353, '', 'Royal Rajasthani Man Face Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1354, '', 'Tree Shaped Vase with Lady Face', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1355, '', 'Elegant Look-Floating Flower Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1356, '', 'Multi-Color Classy Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1357, '', 'Queen of Egypt Showpiece (Dark Brown)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1358, '', 'Big Size Vase in Golden Metallic Colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1359, '', 'Beautiful Lady Face Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1360, '', 'Golden Coloured Village Couple Face Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1361, '', 'The Royal Arabic Genie Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1362, '', 'Wooden Structured Plain Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1363, '', 'Divine Look Ganesha Flower Vase -Playing Dhol', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1364, '', 'Traditional Indian Engrave Art Metallic Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1365, '', 'Blue Coloured Lady Face Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1366, '', 'Black And Off White Embossed Design Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1367, '', 'Black Textured - Y Shaped Fancy Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1368, '', 'Dark Brown Textured Colored Y Shaped Fancy Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1369, '', 'Off White -Y Shaped Fancy Flower Vase-Long Shaped', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1370, '', 'Brownish Black Metallic Planter in Big Size', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1371, '', 'FRP Green Cone Shaped Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1372, '', 'Cone Shaped Vase in Copper Shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1373, '', 'Decorative Plain Flower Vase Orange', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1374, '', 'Decorative Plain Flower Vase Green', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1375, '', 'Decorative Plain Flower Vase Grey', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1376, '', 'Green Metallic Cone Shaped Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1377, '', 'Decorative Plain Flower Vase Red', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1378, '', 'Special Combo Pack of Plain Flower Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1379, '', 'Silver Basket With Flowers', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `products_list` (`id`, `profile`, `name`, `description`, `categories_id`, `brands_id`, `cost`, `status`, `date_created`, `date_updated`) VALUES
(1380, '', 'Wooden Look Buddha Face Idol Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1381, '', 'Durga Mata Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1382, '', 'Chhattisgarh Mahatari Mural Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1383, '', 'Couple on moon - Sea blue and copper colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1384, '', 'Traditional Durga Maa - Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1385, '', 'Silver Basket With Flowers', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1386, '', 'Frog On Elephant Paper Weight Cum Vastu Showpiece - Golden', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1387, '', 'Small Nandi Sitting Pose In Black Colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1388, '', 'Angel Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1389, '', 'Antique Horse Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1390, '', 'Rajasthani Female Face - Red Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1391, '', 'Elephant Showpiece In Wooden Look', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1392, '', 'Rajasthani Lady With Chaas', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1393, '', 'Cute Baby Elephant Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1394, '', 'Fiber Maharaja Sansar Chand Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1395, '', 'Dr. Ambedkar Submitting The Indian Constitution To The Constituent Assembly Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1396, '', 'FRP Birsa Munda Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1397, '', 'FRP Buddha Face Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1398, '', 'Vitthal Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1399, '', 'Peacock On Branch Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1400, '', 'Om Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1401, '', 'Elegant Wall Mural Face Carved Mask With Wings', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1402, '', 'Fish And Flower Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1403, '', 'Flying Birds Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1404, '', 'Abstract Lady Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1405, '', 'Abstract Art Golden Elephant', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1406, '', 'Abstract Art Black Elephant', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1407, '', 'Abstract Art White Elephant', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1408, '', 'Abstract Art Pink Elephant', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1409, '', 'Abstract Art Grey Elephant', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1410, '', 'Copper Shield Abstract Human Art', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1411, '', 'Hand Gestures', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1412, '', 'Hand Palm', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1413, '', 'Pointing Finger Shaped Hand', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1414, '', 'Punch Or Fist Shaped Hand', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1415, '', 'Mahalakshmi Devi Face', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1416, '', 'Abstract Art Blue Elephant', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1417, '', 'Nazar Battu - Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1418, '', 'Ganesha Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1419, '', 'Small Old Looking Dog', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1420, '', 'Cute Boy Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1421, '', 'Beautiful Lady Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1422, '', 'Bottle Holder Stand', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1423, '', 'Card Holder', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1424, '', 'Wooden colour Deer showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1425, '', 'Yellow Deer Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1426, '', 'Wolf showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1427, '', 'Baby Sleeping On Hand', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1428, '', 'Jija Mata with Shivaji Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1429, '', 'Multipurpose Showpiece Stand with Flower Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1430, '', 'Mushroom Umbrealla Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1431, '', 'Golden Modern Art Face Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1432, '', 'Golden Basket With Flowers', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1433, '', 'Jewellery Display - Mannequin Figurine', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1434, '', 'Copper Basket With Flowers', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1435, '', 'Bottle Holder Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1436, '', 'Pizza Slice Stand With Text Board', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1437, '', 'Couple Statue in white colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1438, '', 'Laughing Buddha idol', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1439, '', '(Halloween) Wooden lantern', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1440, '', '(Trishul damru) Wooden lantern', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1441, '', 'Deer- Multipurpose Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1442, '', 'Shree Ram Bhakta Hanuman', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1443, '', 'Cute Boy and Girl Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1444, '', 'Cute Little Angel', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1445, '', '?The Legacy? - Modern Horse Head', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1446, '', 'Squirrel Bird feeder', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1447, '', 'Relaxing Frog Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1448, '', 'Herd of Elephants Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1449, '', 'Pleasing Dancing Angel ( NARTAKI)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1450, '', 'Sleek Deer Head', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1451, '', 'Traditional Lady Wall Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1452, '', 'Horse Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1453, '', 'Horse Showpiece- Multicolor', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1454, '', 'Black Deer Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1455, '', 'Copper Horse Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1456, '', 'Camel Show Piece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1457, '', 'Fiber Sardar Ji Holding Basket', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1458, '', 'Modern Black Lady Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1459, '', 'Elephant Small Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1460, '', 'Beautiful Butterfly', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1461, '', 'Attractive Statue Of Frog Sitting On A Mushroom', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1462, '', 'Monkey Holding The Bird Feeder', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1463, '', 'Wooden Colour Human Face Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1464, '', 'Metallic Golden Colour Human Face Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1465, '', 'Village Lady Holding The Veena', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1466, '', 'Fox Matt Finished Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1467, '', 'Grey Elephant Showpiece/ Paper Weight', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1468, '', 'White Fox Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1469, '', 'Rajasthani Lady Holding Dholki', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1470, '', 'Hand In Round Plate Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1471, '', 'Baby In Palm', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1472, '', 'Real Baby Look- A Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1473, '', 'Modern Face', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1474, '', 'Attractive Wall Hanging Of Lord Ganesha', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1475, '', 'Attractive Rose Shaped Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1476, '', 'Golden Color Stunning Elephant Face Wall Mount', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1477, '', 'Bastar Lady Face -Wall Decorative Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1478, '', 'Tribal Man Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1479, '', 'Rajasthani Lady Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1480, '', 'FRP Rajasthani Lady Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1481, '', 'Swami Vivekananda Wall Hanging- Standing Position', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1482, '', 'Gautam Buddha Wall Hanging On Leaf', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1483, '', 'Elephant Head Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1484, '', 'Sun (Surya) Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1485, '', 'Gujarati Man Face Wall Hanging With Mahroon Pagdi', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1486, '', 'Rajasthani Village Woman Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1487, '', 'Lady Panghat Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1488, '', 'Sun God- Wall Hanging In Metallic Copper Look', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1489, '', 'Old Antique Deer Face Wall Mount', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1490, '', 'The Divine Indian Goddess Wall Hanging - Kali Mata', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1491, '', 'Village Lady Wall Hanging Playing Tambourine', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1492, '', 'Divine Durga Mata Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1493, '', 'Gautam Buddha Wall Hanging In White And Golden', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1494, '', 'Metallic Color Sun -Hindu God', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1495, '', 'Village Lady Wall Hanging Playing Tambourine- Light Green', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1496, '', 'Village Lady Wall Hanging Playing Tambourine-Violet', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1497, '', 'Beautiful Art Design Love Pair Couple Of Radha-Krishna', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1498, '', 'Giraffe Face Wall Decor', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1499, '', 'Village Lady Wall Hanging With Tambourine- Green', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1500, '', 'Gujarati Man Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1501, '', 'Decorative Gujarati Man Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1502, '', 'Colorful Gujarati Man Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1503, '', 'Gujarati Village Woman Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1504, '', 'Rajasthani Village Woman With Blue Dupatta Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1505, '', 'Gujarati Woman Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1506, '', 'Red Odhani - Lady Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1507, '', 'Lady Face Wall Hanging Green Odhni', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1508, '', 'Rajasthani Man Face Wall Hanging With Pagdi', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1509, '', 'Dark Blue Gujarati Couples Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1510, '', 'Gujarati Couples Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1511, '', 'Gujarati Male Face -Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1512, '', 'Dark Blue Gujarati Female Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1513, '', 'Dark Blue Gujarati Male Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1514, '', 'Rajasthani Female Face -Orange Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1515, '', 'Rajasthani Orange Couples Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1516, '', 'Pink Gujarati Couples Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1517, '', 'Gujarati Man Face Wall Hanging With Orange Pagdi', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1518, '', 'Ganesha Welcome Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1519, '', 'Grey-Stunning Elephant Face Wall Mount', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1520, '', 'Golden Cream Buddha In Leaf - Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1521, '', 'Peacock Shaped Elegant Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1522, '', 'Meditating Gautam Buddha Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1523, '', 'Resting And Meditating Buddha Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1524, '', 'Egyptian Tribal Man Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1525, '', 'Hand Crafted Ganesh Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1526, '', 'Gautam Buddha On Leaf Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1527, '', 'Devi Durga Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1528, '', 'Devi Durga Face Wall Hanging- Small', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1529, '', 'Devi Kali Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1530, '', 'Jesus Christ Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1531, '', 'Lord Jesus Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1532, '', 'Girl Holding Mirror- A Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1533, '', 'Rajasthani Royal Lady Canvas 3D Mural Painting', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1534, '', 'Lady Canvas Painting In Sleeping Position', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1535, '', 'Radha Krishna Canvas Painting', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1536, '', 'Hand-made Canvas Painting Of A Lady', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1537, '', 'Lord Kuber 3D Mural Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1538, '', 'Radha Krishna Wall Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1539, '', 'Lord Balaji 3D Mural Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1540, '', 'Lord Ganesha Wall Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1541, '', 'Nazar Battu Face Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1542, '', 'Grey FRP Tortoise Shape Floating Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1543, '', 'Tortoise - A Real Size Feng Shui', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1544, '', 'Brass Color Owl - Vahana Of Mata Lakshmi', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1545, '', 'Fengshui Golden Owl - Vahana Of Goddess Lakshmi', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1546, '', 'Nazar Battu - Protection Face -Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1547, '', 'Turtle - Tortoise Figurine', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1548, '', 'Feng Shui Dragon Figurine- A Vastu Decor', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1549, '', 'Fiber Tortoise Showpiece/ Vastu/ Table Top', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1550, '', 'Beautiful Lady Mural In White Color Holding Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1551, '', 'Jesus Christ- Lamb Of God Fiber 3D Mural Painting', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1552, '', 'Pug Dog In A Small Space Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1553, '', 'Traditional 3D Wall Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1554, '', 'Lord Ganesha Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1555, '', 'Shirdi Sai Baba 3D Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1556, '', 'Lord Krishna Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1557, '', 'Designer Floating Flower Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1558, '', 'Divya Mantra Feng Shui Monkey', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1559, '', 'Real Look Statue Of Tortoise', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1560, '', 'Vastu Bird Pair', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1561, '', 'Lady Face Bastar Art Metallic Golden Colour Wall Mount', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1562, '', 'The Holy Indian Bird Swan Shaped Floating Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1563, '', 'Spiritual and Religious Balaji Wall Hanging Art', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1564, '', 'Sleeping Cat Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1565, '', 'Royal Silver Horse Pair Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1566, '', 'Beautiful Cat Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1567, '', 'Gujarati Village Couples Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1568, '', 'White cats Pair - Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1569, '', 'Attractive Horse Pair Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1570, '', 'Sun Face Wall Decor', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1571, '', 'Vignaharta - Lord Ganesha Resin Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1572, '', 'Modern Lady Canvas Handmade Painting', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1573, '', 'Modern British Lady Statue (Metallic Colour)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1574, '', 'Metallic Owl- Vahana of Goddess Lakshmi MATA', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1575, '', 'Rajasthani Village Man Single Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1576, '', 'Elegant Look-Floating Flower Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1577, '', 'Rajasthani Man Face Wall Hanging - Metallic Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1578, '', 'Metallic Unique Swan Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1579, '', 'Swan Pair Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1580, '', 'Elephant Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1581, '', 'Egyptian Face Black With Golden Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1582, '', 'Egyptian Face Wall Hanging In Sand Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1583, '', 'Egyptian Face Copper Color Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1584, '', 'Egyptian Face Light Copper Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1585, '', 'Rajasthani Man - Ringing and Playing Bell', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1586, '', 'Egyptian Face Light Metallic Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1587, '', 'Lady Modern Art, Canvas 3D Painting', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1588, '', 'Egyptian Face Brass Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1589, '', 'Traditional Village Man Wall Hanging Playing Dhol', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1590, '', 'Traditional Gujarati Women Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1591, '', 'Egyptian Face Black With Dark Golden Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1592, '', 'Traditional Lord Ganesha On Green Leaf', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1593, '', 'Lady Sitting With Swan Painting', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1594, '', 'Fiber Deer Face Wall Mount', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1595, '', 'Tortoise Shaped Look Floating Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1596, '', 'Traditional Goddess Durga-A Beautiful Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1597, '', 'Traditional Rajasthani Village Man Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1598, '', 'Royal Lady with Swan Painting', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1599, '', 'Yellow - FRP Sun Face Wall Mount', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1600, '', 'Goddess Maa Laxmi- An Adorable Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1601, '', 'Designer Canvas Mural Painting', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1602, '', 'Traditional Gujarati Woman Face Wall Hanging with Dupatta', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1603, '', 'Sun Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1604, '', 'Ganesha Wall Hanging In Metallic Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1605, '', 'Ganesha Wall Hanging In Green Leaf', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1606, '', 'Ganesha Wall Hanging with shloka', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1607, '', 'Vastu Piece of Art - Brown Owl On Divine Shankh', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1608, '', 'Divine Vahana of Laxmi MATA - Owl Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1609, '', 'Frog On Elephant Paper Weight Cum Vastu Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1610, '', 'Royal Black Horse Idol-Golden Art', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1611, '', 'FRP Nose Shaped Spectacles Holder', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1612, '', 'Nazar Battu-Excellent Piece of Rural Art.', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1613, '', 'Jesus Christ- 3D Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1614, '', 'Lady Faced Statue With Small Basket', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1615, '', 'Real Look Grey Small Elephant', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1616, '', 'Real Look Grey Small Elephant - Pair', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1617, '', 'Divine Durga MATA Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1618, '', 'Attractive Orange - Fish Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1619, '', 'Santa Claus Figurine On Duck', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1620, '', 'Unity Hand Shaped Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1621, '', 'Omkar Ganesha Wall Hanging (Metallic)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1622, '', 'Squirrel With Mushroom Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1623, '', 'Rajmudra:- The Royal Seal of Shivaji Maharaj MURAL', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1624, '', 'ChhatraPati shivaji Maharaj Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1625, '', 'Fiber Shivaji Maharaj Fighting Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1626, '', 'Fiber Sambhaji Maharaj fighting with lion Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1627, '', 'Fiber Hambirrao Mohite Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1628, '', 'Fiber Western Style Women Water Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1629, '', 'Three Elephant Holding Glass Coffee Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1630, '', 'Lion Face FRP Water Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1631, '', 'FRP Coffee Table (without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1632, '', 'Cricket Equipment showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1633, '', 'Fiber Dinosaur statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1634, '', 'Fiber Brown Indoor Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1635, '', 'Fiber Rectangular shaped fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1636, '', 'Step Indoor water fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1637, '', 'Flowing waterfall fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1638, '', 'Small indoor water fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1639, '', 'Mesmerising fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1640, '', 'HORSE STANDING ON TWO LEGS HANDMADE STATUE', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1641, '', 'Lord Buddha in relaxing pose - showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1642, '', 'Card holder and Pen Stand Face showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1643, '', 'Couple on moon - silver colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1644, '', 'Welcome hamster showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1645, '', 'Gautam buddha in silver and black shade ', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1646, '', 'Unique Boat Design Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1647, '', 'Couple on moon - Sea blue and copper colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1648, '', 'Biewer Terrier dog showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1649, '', 'Big size elephant statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1650, '', 'Gautam Budha Face in Black and golden shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1651, '', 'Buddha showpiece in black and golden shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1652, '', 'Sheep shape planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1653, '', 'Dwarf with Mushroom and Birds on head - bird feeder showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1654, '', 'DUAL LAMP IN WHITE COLOUR', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1655, '', 'Couple sitting on wall - Silver couple', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1656, '', 'Monkey Holding Basket showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1657, '', 'Shivaji maharaj standing pose statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1658, '', 'Vintage fashion lady figurine', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1659, '', 'African doll decor figurine', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1660, '', 'Ancient Lady Small Planter ', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1661, '', 'Squirrel sitting on a wooden billet', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1662, '', 'Antique horse showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1663, '', 'Effortless Elephant statue with tray', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1664, '', 'Multipurpose Northern Cardinal Bird feeder and Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1665, '', ' Flower vase in black and golden shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1666, '', 'Table top sleeping Buddha in white and golden shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1667, '', 'Yellow Shaolin Kung Fu Monk Resin Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1668, '', 'Purple Shaolin kung Fu Monk Resin Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1669, '', 'Blue Shaolin kung Fu Monk Resin Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1670, '', 'Lady With Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1671, '', 'Lady With Kids Playing', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1672, '', 'African Tribal Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1673, '', 'Rabbit Shape Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1674, '', 'Eagle statue - Big size', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1675, '', 'Peacefully sitting buddha in mehroon and golden shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1676, '', 'Snail Shaped multipurpose pen stand ', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1677, '', 'Table top sleeping Buddha in white and golden shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1678, '', 'Flower vase in unique design', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1679, '', 'Small aligator showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1680, '', 'Ticket Counter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1681, '', 'Love Birds bird feeder', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1682, '', 'Squirrel showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1683, '', 'Squirrel eating  nut showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1684, '', 'Lord Buddha Face Idol in white and golden shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1685, '', 'Small  elephant showpiece  in grey shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1686, '', 'Small elephant showpiece in black shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1687, '', 'Combo of small elephant showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1688, '', 'Sleeping buddha small showpiece in grey colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1689, '', 'Sleeping buddha small showpiece in golden colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1690, '', 'Sleeping buddha small showpiece in black colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1691, '', 'Sleeping buddha small showpiece in white colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1692, '', 'Sleeping buddha small showpiece in copper colour', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1693, '', 'Meditating Gautam Buddha- Dark Brown and Golden ', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1694, '', 'Wooden look buddha face idol Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1695, '', 'Gautam Buddha Meditating Pose - Blue and White shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1696, '', 'Small lion showpiece in purple and black shade', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1697, '', 'Table top sleeping Buddha in golden', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1698, '', 'Goddess Saraswati Maa Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1699, '', 'Wooden look small flower basket', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1700, '', 'Wall mounted pillar hanging sculpture', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1701, '', 'Ancient Lady Small Planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1702, '', 'Black Dog showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1703, '', 'FRP Mother Baby Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1704, '', 'Swami Vivekananda Standing Statue - Black', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1705, '', 'White Double Planter New', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1706, '', 'Swami Vivekananda Small statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1707, '', 'White V-shaped planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1708, '', 'White wavy look bowl planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1709, '', 'Square highted white planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1710, '', 'Golden welcome entrance elephant ', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1711, '', 'Dancing couple small statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1712, '', 'Small ganpati statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1713, '', 'Honey bee small size statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1714, '', 'Peacock Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1715, '', 'B.R Ambedkar Small Burst Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1716, '', 'White golden ganesha small showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1717, '', 'Rajasthani Couple small showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1718, '', 'Rajasthani man small showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1719, '', 'Square blue planter', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1720, '', 'Skull showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1721, '', 'Resting buddha black showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1722, '', 'Radha krishna wall hanging ', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1723, '', 'New born baby showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1724, '', 'Gajanan maharaj small showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1725, '', 'Angry bird shape money bank ', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1726, '', 'Squirrel showpiece pair', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1727, '', 'Resting ganesha small showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1728, '', 'Real Color Horse showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1729, '', 'Black donation box ', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1730, '', 'Girl Doing painting showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1731, '', 'Pigeon couple showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1732, '', 'Mini flower pot in black', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1733, '', 'Cute doggie money bank ', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1734, '', 'Chef cum joker statue ', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1735, '', 'Gautam Buddha Standing Statue in Black color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1736, '', 'Stylish Green chair', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1737, '', 'Pear half cutted learning model', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1738, '', 'Traditional French Lady Statue Holding Lamp - blue color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1739, '', 'Black coloured lady table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1740, '', 'Spritual and religious Balaji wall hanging art  colour - golden black', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1741, '', 'Spiritual and Religious Balaji Wall Hanging Art\ncolour - black and White tika', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1742, '', 'Queen Honey Bee Garden Decor\n', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1743, '', 'Attractive Peacock Fiber Statue with Open Feathers', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1744, '', 'Royal Palki - A Palanquin', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1745, '', 'FRP Bullock Cart Center Table (Without Glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1746, '', 'Rabindranath Tagore Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1747, '', 'Sleeping Labrador Puppy', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1748, '', 'Attractive Dog Shape Dustbin', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1749, '', 'Shiva Statue With Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1750, '', 'Royal Big Elephant Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1751, '', 'Darban Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1752, '', 'Hand-made 3D Mural Of Mahabharata In Golden', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1753, '', 'Elegant Roman Shaped Side Table', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1754, '', 'Center Table with Hand (Without Glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1755, '', 'Lal Bahadur Shastri Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1756, '', 'Jesus Christ Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1757, '', 'Nazar Battu With Money Bank', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1758, '', 'Nazar Battu - Protection Face -Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1759, '', 'Mesmerising Waterfall Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1760, '', 'Dice Shape Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1761, '', 'Lotus Floating Pot', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1762, '', 'Fiber Goose Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1763, '', 'Radha Krishna Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1764, '', 'Unique Dino Shape Dustbin', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1765, '', 'Attractive Dino Shape Dustbin', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1766, '', 'FRP Giraffe Trashbin', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1767, '', 'White Duckling Dustbin', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1768, '', 'Duck Shape Dustbin', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1769, '', 'Penguin Dustbin', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1770, '', 'Multicolor Duck Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1771, '', 'Table Top Sleeping Buddha', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1772, '', 'Swami Vivekananda Wall Hanging- Standing Position', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1773, '', 'Rajasthani Lady Center Table (Without glass)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1774, '', 'Traditional Lady Fiber Vase', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1775, '', 'Lord Kuber 3D Mural Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1776, '', 'Little Angel Lamp Post', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1777, '', 'Dual Lamp Post', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1778, '', 'Divine Durga Mata Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1779, '', 'Durga Mata Face Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1780, '', 'Chhattisgarh Mahatari Mural Wall Hanging', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1781, '', '3D Triangular Prism Geometrical Shapes Learning Model', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1782, '', '3D Shapes Set- A Learning Model', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1783, '', 'Small Elephant Showpiece', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1784, '', 'Rajasthani Jaya Vijaya Dwarpal Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1785, '', 'See Saw For Kids In Orange Color', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1786, '', 'The Merlion Singapore Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1787, '', 'Grey Palm Buddha Fountain', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1788, '', 'Dog House - Shetland (Small Size Of Dog )', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1789, '', 'Triangular Corner Stool', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1790, '', 'Tabla Look Table-Goblet Drum (Stool)', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1791, '', 'Fiberglass Monkey', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1792, '', 'Cute Makhan Chor Statue', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1793, '', 'Spiritual Gautam Buddha Sitting Statue- Black And Yellow', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1794, '', 'Jija Mata with Shivaji Mural', '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products_list_man`
--

CREATE TABLE `products_list_man` (
  `id` int(30) NOT NULL,
  `profile` varchar(255) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `categories_id` int(30) NOT NULL,
  `brands_id` int(30) NOT NULL,
  `cost` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_list_man`
--

INSERT INTO `products_list_man` (`id`, `profile`, `name`, `description`, `categories_id`, `brands_id`, `cost`, `status`, `date_created`, `date_updated`) VALUES
(1, 'upload/pokemon-artwork-pikachu-ash-ketchum-wallpaper-preview.jpg', 'vinod', 'penter', 1, 5, 120, 1, '2023-07-20 00:00:00', '2023-07-20 00:00:00'),
(2, 'upload/peakpx.jpg', 'new_statue', 'abcdq', 1, 5, 500, 1, '2023-07-20 00:00:00', '2023-07-20 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_list`
--

CREATE TABLE `purchase_order_list` (
  `id` int(30) NOT NULL,
  `po_code` varchar(50) NOT NULL,
  `barcode_no` bigint(255) NOT NULL DEFAULT 0,
  `volume` varchar(255) NOT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `categories_id` int(30) NOT NULL,
  `amount` float NOT NULL,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `remarks` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = partially received, 2 =received',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `supplier` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_list_man`
--

CREATE TABLE `purchase_order_list_man` (
  `id` int(30) NOT NULL,
  `po_code` varchar(50) NOT NULL,
  `barcode_no` varchar(255) DEFAULT NULL,
  `volume` varchar(255) NOT NULL,
  `categories_id` int(30) NOT NULL,
  `amount` float NOT NULL,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `remarks` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = partially received, 2 =received',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `supplier` varchar(50) NOT NULL,
  `time` varchar(200) NOT NULL,
  `expiry_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_list_pack`
--

CREATE TABLE `purchase_order_list_pack` (
  `id` int(30) NOT NULL,
  `po_code` varchar(50) NOT NULL,
  `barcode_no` bigint(255) NOT NULL DEFAULT 0,
  `volume` varchar(255) NOT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `categories_id` int(30) NOT NULL,
  `amount` float NOT NULL,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `remarks` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = partially received, 2 =received',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `supplier` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_list_prod`
--

CREATE TABLE `purchase_order_list_prod` (
  `id` int(30) NOT NULL,
  `po_code` varchar(50) NOT NULL,
  `barcode_no` bigint(255) NOT NULL DEFAULT 0,
  `volume` varchar(255) NOT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `categories_id` int(30) NOT NULL,
  `amount` float NOT NULL,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `remarks` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = partially received, 2 =received',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `supplier` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receiving_list`
--

CREATE TABLE `receiving_list` (
  `id` int(30) NOT NULL,
  `barcode_no` bigint(255) NOT NULL,
  `form_id` int(30) NOT NULL,
  `from_order` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=PO ,2 = BO',
  `amount` float NOT NULL DEFAULT 0,
  `volume` varchar(255) NOT NULL,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `stock_ids` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receiving_list_man`
--

CREATE TABLE `receiving_list_man` (
  `id` int(30) NOT NULL,
  `barcode_no` bigint(255) NOT NULL,
  `form_id` int(30) NOT NULL,
  `from_order` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=PO ,2 = BO',
  `amount` float NOT NULL DEFAULT 0,
  `volume` varchar(255) NOT NULL,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `stock_ids` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receiving_list_prod`
--

CREATE TABLE `receiving_list_prod` (
  `id` int(30) NOT NULL,
  `barcode_no` bigint(255) NOT NULL,
  `form_id` int(30) NOT NULL,
  `from_order` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=PO ,2 = BO',
  `amount` float NOT NULL DEFAULT 0,
  `volume` varchar(255) NOT NULL,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `stock_ids` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_list`
--

CREATE TABLE `return_list` (
  `id` int(30) NOT NULL,
  `return_code` varchar(50) NOT NULL,
  `barcode_no` bigint(255) NOT NULL,
  `volume` varchar(200) NOT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `categories_id` int(30) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `stock_ids` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_list_prod`
--

CREATE TABLE `return_list_prod` (
  `id` int(30) NOT NULL,
  `return_code` varchar(50) NOT NULL,
  `barcode_no` bigint(255) NOT NULL,
  `volume` varchar(200) NOT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `categories_id` int(30) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `stock_ids` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_list`
--

CREATE TABLE `sales_list` (
  `id` int(30) NOT NULL,
  `item_id` bigint(255) NOT NULL,
  `sales_code` varchar(50) NOT NULL,
  `client` text DEFAULT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `stock_ids` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_list_prod`
--

CREATE TABLE `sales_list_prod` (
  `id` int(30) NOT NULL,
  `item_id` bigint(255) NOT NULL,
  `sales_code` varchar(50) NOT NULL,
  `client` text DEFAULT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `stock_ids` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_list`
--

CREATE TABLE `stock_list` (
  `id` int(30) NOT NULL,
  `item_id` int(30) NOT NULL,
  `barcode_no` bigint(255) NOT NULL,
  `quantity` double NOT NULL,
  `volume` varchar(255) NOT NULL,
  `unit` varchar(250) DEFAULT NULL,
  `price` float NOT NULL DEFAULT 0,
  `total` float NOT NULL DEFAULT current_timestamp(),
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=IN , 2=OUT',
  `available` float NOT NULL,
  `rem` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_list_man`
--

CREATE TABLE `stock_list_man` (
  `id` int(30) NOT NULL,
  `item_id` int(30) NOT NULL,
  `barcode_no` bigint(255) NOT NULL,
  `quantity` int(30) NOT NULL,
  `volume` varchar(255) NOT NULL,
  `unit` varchar(250) DEFAULT NULL,
  `price` float NOT NULL DEFAULT 0,
  `total` float NOT NULL DEFAULT current_timestamp(),
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=IN , 2=OUT',
  `available` int(11) NOT NULL,
  `rem` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_list_prod`
--

CREATE TABLE `stock_list_prod` (
  `id` int(30) NOT NULL,
  `item_id` int(30) NOT NULL,
  `barcode_no` bigint(255) NOT NULL,
  `quantity` int(30) NOT NULL,
  `volume` varchar(255) NOT NULL,
  `unit` varchar(250) DEFAULT NULL,
  `price` float NOT NULL DEFAULT 0,
  `total` float NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=IN , 2=OUT',
  `available` int(11) NOT NULL,
  `rem` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_list`
--

CREATE TABLE `supplier_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `cperson` text NOT NULL,
  `contact` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier_list`
--

INSERT INTO `supplier_list` (`id`, `name`, `address`, `cperson`, `contact`, `status`, `date_created`, `date_updated`) VALUES
(1, 'Supplier 101', 'Sample Supplier Address 101', 'Supplier Staff 101', '8585858585', 1, '2021-11-02 09:36:19', '2023-01-31 18:21:08'),
(13, 'SHANKAR GLASS AGENCIES ', 'OPP. UTTAM TALKIES,NANDINI ROAD, BHILAI', 'IT SELF', '9907746703, 7974265244', 1, '2023-11-18 06:03:14', '2023-11-18 06:03:14'),
(14, 'SHRI KRISHNA HARDWARE STORES', 'NANDINI ROAD,BHILAI', 'IT SELF', '9993430373 ,7000630762', 1, '2023-11-18 06:05:07', '2023-11-18 06:05:07'),
(15, 'MAMTA ENTERPRISES ', 'NANDINI ROAD, CHHAWANI CHOWK ,BHILAI', 'IT SELF', '9827190410 ,9300936515', 1, '2023-11-18 06:15:04', '2023-11-18 06:15:04'),
(16, 'BALAJI CHEMICALS', 'SHOP NO.3, RATAN APPARTMENT NO-2, NEAR AAGYARAM DEVI MANDIR, GANESHPETH, NAGPUR', 'IT SELF', '9373116047 , 9371474166', 1, '2023-11-18 06:24:13', '2023-11-18 06:24:13'),
(17, 'BALIRAM HARDWEAR', '', '', '', 1, '2023-11-18 06:27:35', '2023-11-18 06:27:35');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_payment`
--

CREATE TABLE `supplier_payment` (
  `id` int(10) NOT NULL,
  `supplier` varchar(200) NOT NULL,
  `paid_amount` int(200) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier_payment`
--

INSERT INTO `supplier_payment` (`id`, `supplier`, `paid_amount`, `date`) VALUES
(1, 'Supplier', 200, '0000-00-00 00:00:00'),
(2, 'Supplier', 200, '0000-00-00 00:00:00'),
(5, 'Supplier', 200, '0000-00-00 00:00:00'),
(6, 'Supplier', 200, '0000-00-00 00:00:00'),
(7, 'Supplier', 200, '0000-00-00 00:00:00'),
(8, 'indian', 200, '0000-00-00 00:00:00'),
(9, 'indian', 200, '0000-00-00 00:00:00'),
(10, 'indian', 200, '0000-00-00 00:00:00'),
(11, 'indian', 300, '0000-00-00 00:00:00'),
(12, 'Supplier', 200, '0000-00-00 00:00:00'),
(13, 'Supplier', 200, '0000-00-00 00:00:00'),
(14, 'Supplier', 200, '0000-00-00 00:00:00'),
(15, 'indian', 20000, '2023-03-02 00:00:00'),
(16, 'indian', 2000, '2023-03-22 00:00:00'),
(17, 'indian', 2000, '2023-03-22 00:00:00'),
(18, 'indian', 2000, '2023-03-22 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Waahkart '),
(6, 'short_name', 'Waahkart'),
(11, 'logo', 'uploads/logo-1690453224.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1690453224.png'),
(15, 'content', 'Array');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Kapil', NULL, 'thawkar', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1635556826', NULL, 1, '2021-01-20 14:02:37', '2023-01-31 18:24:16'),
(11, 'Waahkart', NULL, 'Luxury', 'waahkart', '8bd9c8f051807626e06048fd30548dc8', 'uploads/avatar-11.png?v=1676277599', NULL, 1, '2021-11-03 14:22:46', '2023-07-28 11:21:42'),
(16, 'shubham', NULL, 'kohad', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'uploads/avatar-16.png?v=1677239967', NULL, 1, '2023-02-23 17:44:17', '2023-02-24 17:29:27'),
(18, 'anand', NULL, 'singh', 'anand1233', '057bf0158380add916a0c1b71e2ae200', 'uploads/avatar-18.png?v=1677239430', NULL, 1, '2023-02-23 18:16:48', '2023-02-24 17:20:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `user_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `back_order_list`
--
ALTER TABLE `back_order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `po_id` (`po_id`),
  ADD KEY `receiving_id` (`receiving_id`);

--
-- Indexes for table `back_order_list_man`
--
ALTER TABLE `back_order_list_man`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `po_id` (`po_id`),
  ADD KEY `receiving_id` (`receiving_id`);

--
-- Indexes for table `back_order_list_prod`
--
ALTER TABLE `back_order_list_prod`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `po_id` (`po_id`),
  ADD KEY `receiving_id` (`receiving_id`);

--
-- Indexes for table `bo_items`
--
ALTER TABLE `bo_items`
  ADD KEY `item_id` (`item_id`),
  ADD KEY `bo_id` (`bo_id`);

--
-- Indexes for table `bo_items_man`
--
ALTER TABLE `bo_items_man`
  ADD KEY `item_id` (`item_id`),
  ADD KEY `bo_id` (`bo_id`);

--
-- Indexes for table `bo_items_prod`
--
ALTER TABLE `bo_items_prod`
  ADD KEY `item_id` (`item_id`),
  ADD KEY `bo_id` (`bo_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories_man`
--
ALTER TABLE `categories_man`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_list`
--
ALTER TABLE `employee_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_list`
--
ALTER TABLE `item_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brands_id`),
  ADD KEY `categories_id` (`categories_id`) USING BTREE;

--
-- Indexes for table `item_list_man`
--
ALTER TABLE `item_list_man`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brands_id`),
  ADD KEY `categories_id` (`categories_id`) USING BTREE;

--
-- Indexes for table `item_list_p`
--
ALTER TABLE `item_list_p`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brands_id`),
  ADD KEY `categories_id` (`categories_id`) USING BTREE;

--
-- Indexes for table `po_items`
--
ALTER TABLE `po_items`
  ADD KEY `po_id` (`po_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `po_items_man`
--
ALTER TABLE `po_items_man`
  ADD KEY `po_id` (`po_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `po_items_pack`
--
ALTER TABLE `po_items_pack`
  ADD KEY `po_id` (`po_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `products_list`
--
ALTER TABLE `products_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brands_id`),
  ADD KEY `categories_id` (`categories_id`) USING BTREE;

--
-- Indexes for table `products_list_man`
--
ALTER TABLE `products_list_man`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brands_id`),
  ADD KEY `categories_id` (`categories_id`) USING BTREE;

--
-- Indexes for table `purchase_order_list`
--
ALTER TABLE `purchase_order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_id` (`categories_id`) USING BTREE;

--
-- Indexes for table `purchase_order_list_man`
--
ALTER TABLE `purchase_order_list_man`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_id` (`categories_id`) USING BTREE;

--
-- Indexes for table `purchase_order_list_pack`
--
ALTER TABLE `purchase_order_list_pack`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_id` (`categories_id`) USING BTREE;

--
-- Indexes for table `purchase_order_list_prod`
--
ALTER TABLE `purchase_order_list_prod`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_id` (`categories_id`) USING BTREE;

--
-- Indexes for table `receiving_list`
--
ALTER TABLE `receiving_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receiving_list_man`
--
ALTER TABLE `receiving_list_man`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receiving_list_prod`
--
ALTER TABLE `receiving_list_prod`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_list`
--
ALTER TABLE `return_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_id` (`categories_id`) USING BTREE;

--
-- Indexes for table `return_list_prod`
--
ALTER TABLE `return_list_prod`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_id` (`categories_id`) USING BTREE;

--
-- Indexes for table `sales_list`
--
ALTER TABLE `sales_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_list_prod`
--
ALTER TABLE `sales_list_prod`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_list`
--
ALTER TABLE `stock_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `stock_list_man`
--
ALTER TABLE `stock_list_man`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `stock_list_prod`
--
ALTER TABLE `stock_list_prod`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `supplier_list`
--
ALTER TABLE `supplier_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_payment`
--
ALTER TABLE `supplier_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `back_order_list`
--
ALTER TABLE `back_order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `back_order_list_man`
--
ALTER TABLE `back_order_list_man`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `back_order_list_prod`
--
ALTER TABLE `back_order_list_prod`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories_man`
--
ALTER TABLE `categories_man`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee_list`
--
ALTER TABLE `employee_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `item_list`
--
ALTER TABLE `item_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `item_list_man`
--
ALTER TABLE `item_list_man`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `item_list_p`
--
ALTER TABLE `item_list_p`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products_list`
--
ALTER TABLE `products_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1795;

--
-- AUTO_INCREMENT for table `products_list_man`
--
ALTER TABLE `products_list_man`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_order_list`
--
ALTER TABLE `purchase_order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_list_man`
--
ALTER TABLE `purchase_order_list_man`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_list_pack`
--
ALTER TABLE `purchase_order_list_pack`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_list_prod`
--
ALTER TABLE `purchase_order_list_prod`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receiving_list`
--
ALTER TABLE `receiving_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receiving_list_man`
--
ALTER TABLE `receiving_list_man`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receiving_list_prod`
--
ALTER TABLE `receiving_list_prod`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_list`
--
ALTER TABLE `return_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_list_prod`
--
ALTER TABLE `return_list_prod`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_list`
--
ALTER TABLE `sales_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_list_prod`
--
ALTER TABLE `sales_list_prod`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_list`
--
ALTER TABLE `stock_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_list_man`
--
ALTER TABLE `stock_list_man`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_list_prod`
--
ALTER TABLE `stock_list_prod`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_list`
--
ALTER TABLE `supplier_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `supplier_payment`
--
ALTER TABLE `supplier_payment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `back_order_list`
--
ALTER TABLE `back_order_list`
  ADD CONSTRAINT `back_order_list_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `back_order_list_ibfk_2` FOREIGN KEY (`po_id`) REFERENCES `purchase_order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `back_order_list_ibfk_3` FOREIGN KEY (`receiving_id`) REFERENCES `receiving_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bo_items`
--
ALTER TABLE `bo_items`
  ADD CONSTRAINT `bo_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bo_items_ibfk_2` FOREIGN KEY (`bo_id`) REFERENCES `back_order_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_list`
--
ALTER TABLE `item_list`
  ADD CONSTRAINT `brands_id` FOREIGN KEY (`brands_id`) REFERENCES `brands` (`id`);

--
-- Constraints for table `po_items`
--
ALTER TABLE `po_items`
  ADD CONSTRAINT `po_items_ibfk_1` FOREIGN KEY (`po_id`) REFERENCES `purchase_order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `po_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_order_list`
--
ALTER TABLE `purchase_order_list`
  ADD CONSTRAINT `purchase_order_list_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `return_list`
--
ALTER TABLE `return_list`
  ADD CONSTRAINT `return_list_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `return_list_prod`
--
ALTER TABLE `return_list_prod`
  ADD CONSTRAINT `return_list_ibfk_2` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_list`
--
ALTER TABLE `stock_list`
  ADD CONSTRAINT `stock_list_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_list_prod`
--
ALTER TABLE `stock_list_prod`
  ADD CONSTRAINT `stock_list_prod_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `products_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
