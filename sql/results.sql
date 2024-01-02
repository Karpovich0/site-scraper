-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2024 at 02:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sites`
--

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `url` varchar(2047) NOT NULL,
  `element` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `duration` int(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `domain` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `url`, `element`, `count`, `duration`, `date`, `domain`) VALUES
(1, '\"https://test.com\"', 'h1', 2, 333, '2023-12-26 13:23:39', ''),
(46, 'https://books.toscrape.com/', 'img', 20, 573, '2023-12-27 11:58:14', 'books.toscrape.com'),
(47, 'https://colnect.com/en', 'img', 2, 173, '2023-12-27 12:03:16', 'colnect.com'),
(48, 'https://books.toscrape.com/', 'img', 20, 807, '2023-12-27 19:09:44', 'books.toscrape.com'),
(49, 'https://books.toscrape.com/', 'img', 20, 547, '2023-12-27 19:10:09', 'books.toscrape.com'),
(50, 'https://books.toscrape.com/', 'img', 20, 585, '2023-12-27 19:11:22', 'books.toscrape.com'),
(51, 'https://books.toscrape.com/', 'img', 20, 566, '2023-12-27 19:12:02', 'books.toscrape.com'),
(52, 'https://books.toscrape.com/', 'img', 20, 845, '2023-12-27 19:17:32', 'books.toscrape.com'),
(53, 'https://books.toscrape.com/', 'img', 20, 540, '2023-12-27 19:17:56', 'books.toscrape.com'),
(54, 'https://books.toscrape.com/', 'img', 20, 811, '2023-12-27 19:25:51', 'books.toscrape.com'),
(55, 'https://books.toscrape.com/', 'img', 20, 564, '2023-12-27 19:29:03', 'books.toscrape.com'),
(56, 'https://books.toscrape.com/', 'img', 20, 793, '2023-12-27 19:33:35', 'books.toscrape.com'),
(57, 'https://books.toscrape.com/', 'img', 20, 766, '2023-12-27 19:48:50', 'books.toscrape.com'),
(58, 'https://books.toscrape.com/', 'img', 20, 558, '2023-12-27 19:49:02', 'books.toscrape.com'),
(59, 'https://books.toscrape.com/', 'div', 56, 567, '2023-12-27 19:49:26', 'books.toscrape.com'),
(60, 'https://books.toscrape.com/', 'div', 56, 596, '2023-12-27 19:50:07', 'books.toscrape.com'),
(61, 'https://colnect.com/en', 'div', 62, 270, '2023-12-27 19:50:19', 'colnect.com'),
(62, 'https://colnect.com/en', 'div', 62, 261, '2023-12-27 19:51:34', 'colnect.com'),
(63, 'https://colnect.com/en', 'div', 62, 173, '2023-12-27 19:52:12', 'colnect.com'),
(64, 'https://colnect.com/en', 'div', 62, 138, '2023-12-27 19:54:12', 'colnect.com'),
(65, 'https://colnect.com/ru', 'div', 62, 157, '2023-12-27 19:54:26', 'colnect.com'),
(66, 'https://books.toscrape.com/', 'div', 56, 829, '2023-12-27 19:55:25', 'books.toscrape.com'),
(67, 'https://books.toscrape.com/', 'div', 56, 554, '2023-12-27 19:55:59', 'books.toscrape.com'),
(68, 'https://books.toscrape.com/', 'div', 56, 839, '2023-12-27 20:04:21', 'books.toscrape.com'),
(69, 'https://books.toscrape.com/', 'div', 56, 26, '2023-12-28 11:40:06', 'books.toscrape.com'),
(70, 'https://books.toscrape.com/', 'div', 56, 23, '2023-12-28 11:40:46', 'books.toscrape.com'),
(71, 'https://books.toscrape.com/', 'div', 56, 38, '2023-12-28 12:08:38', 'books.toscrape.com'),
(72, 'https://books.toscrape.com/', 'div', 56, 23, '2023-12-28 12:24:26', 'books.toscrape.com'),
(73, 'https://books.toscrape.com/', 'div', 56, 715, '2023-12-28 12:33:35', 'books.toscrape.com'),
(74, 'https://books.toscrape.com/', 'div', 56, 286, '2023-12-28 12:34:18', 'books.toscrape.com'),
(75, 'https://books.toscrape.com/', 'div', 56, 288, '2023-12-28 12:35:04', 'books.toscrape.com'),
(76, 'https://books.toscrape.com/', 'div', 56, 869, '2023-12-28 12:36:09', 'books.toscrape.com'),
(77, 'https://books.toscrape.com/', 'div', 56, 789, '2023-12-28 12:40:56', 'books.toscrape.com'),
(78, 'https://books.toscrape.com/', 'div', 56, 708, '2023-12-28 12:43:11', 'books.toscrape.com'),
(79, 'https://books.toscrape.com/', 'div', 56, 542, '2023-12-28 12:43:42', 'books.toscrape.com'),
(80, 'https://books.toscrape.com/', 'div', 56, 564, '2023-12-28 12:44:29', 'books.toscrape.com'),
(81, 'https://books.toscrape.com/', 'div', 56, 548, '2023-12-28 12:45:11', 'books.toscrape.com'),
(82, 'https://books.toscrape.com/', 'div', 56, 547, '2023-12-28 12:45:35', 'books.toscrape.com'),
(83, 'https://books.toscrape.com/', 'div', 56, 735, '2023-12-28 12:46:28', 'books.toscrape.com'),
(84, 'https://books.toscrape.com/', 'div', 56, 560, '2023-12-28 12:46:59', 'books.toscrape.com'),
(85, 'https://books.toscrape.com/', 'div', 56, 818, '2023-12-28 13:10:01', 'books.toscrape.com'),
(86, 'https://books.toscrape.com/', 'div', 56, 552, '2023-12-28 13:10:54', 'books.toscrape.com'),
(87, 'https://books.toscrape.com/', 'div', 56, 566, '2023-12-28 13:11:13', 'books.toscrape.com'),
(88, 'https://books.toscrape.com/', 'div', 56, 547, '2023-12-28 13:13:55', 'books.toscrape.com'),
(89, 'https://books.toscrape.com/', 'div', 56, 551, '2023-12-28 13:14:49', 'books.toscrape.com'),
(90, 'https://books.toscrape.com/', 'div', 56, 675, '2023-12-28 13:18:31', 'books.toscrape.com'),
(91, '', '', 0, 0, '2023-12-28 13:21:22', ''),
(92, 'https://books.toscrape.com/', 'div', 56, 637, '2023-12-28 13:23:08', 'books.toscrape.com'),
(93, 'https://books.toscrape.com/', 'div', 56, 593, '2023-12-28 13:25:39', 'books.toscrape.com'),
(94, 'https://books.toscrape.com/', 'div', 56, 566, '2023-12-28 13:26:18', 'books.toscrape.com'),
(95, 'https://books.toscrape.com/', 'div', 56, 575, '2023-12-28 13:26:41', 'books.toscrape.com'),
(96, 'https://books.toscrape.com/', 'div', 56, 553, '2023-12-28 13:26:55', 'books.toscrape.com'),
(97, 'https://books.toscrape.com/', 'div', 56, 564, '2023-12-28 13:27:26', 'books.toscrape.com'),
(98, 'https://books.toscrape.com/', 'div', 56, 624, '2023-12-28 13:28:51', 'books.toscrape.com'),
(99, 'https://books.toscrape.com/', 'div', 56, 570, '2023-12-28 13:30:30', 'books.toscrape.com'),
(100, 'https://books.toscrape.com/', 'div', 56, 617, '2023-12-28 13:32:47', 'books.toscrape.com'),
(101, 'https://books.toscrape.com/', 'div', 56, 551, '2023-12-28 13:33:43', 'books.toscrape.com'),
(102, 'https://books.toscrape.com/', 'div', 56, 290, '2023-12-28 13:33:44', 'books.toscrape.com'),
(103, 'https://books.toscrape.com/', 'div', 56, 716, '2023-12-28 13:34:12', 'books.toscrape.com'),
(104, 'https://books.toscrape.com/', 'div', 56, 576, '2023-12-28 13:34:27', 'books.toscrape.com'),
(105, 'https://books.toscrape.com/', 'div', 56, 745, '2023-12-28 13:36:05', 'books.toscrape.com'),
(106, 'https://books.toscrape.com/', 'div', 56, 23, '2023-12-28 14:40:07', 'books.toscrape.com'),
(107, 'https://books.toscrape.com/', 'div', 56, 15, '2023-12-28 14:40:45', 'books.toscrape.com'),
(108, 'https://books.toscrape.com/', 'div', 56, 29, '2023-12-28 14:47:40', 'books.toscrape.com'),
(109, 'https://books.toscrape.com/', 'div', 56, 864, '2023-12-28 14:51:21', 'books.toscrape.com'),
(110, 'https://books.toscrape.com/', 'div', 56, 710, '2023-12-28 14:52:23', 'books.toscrape.com'),
(111, 'https://colnect.com/en', 'img', 2, 394, '2023-12-28 14:54:29', 'colnect.com'),
(112, 'https://books.toscrape.com/', 'img', 20, 616, '2023-12-28 14:55:34', 'books.toscrape.com'),
(113, 'https://books.toscrape.com/', 'img', 20, 762, '2023-12-28 16:54:00', 'books.toscrape.com'),
(114, 'https://books.toscrape.com/', 'img', 20, 686, '2023-12-29 13:06:08', 'books.toscrape.com'),
(115, 'https://colnect.com/en', 'img', 2, 524, '2023-12-29 13:11:40', 'colnect.com'),
(116, 'https://books.toscrape.com/', 'img', 20, 786, '2023-12-29 13:12:20', 'books.toscrape.com'),
(117, 'https://www.sqltutorial.org/sql-cheat-sheet/', 'img', 10, 1046, '2023-12-29 13:14:33', 'www.sqltutorial.org'),
(118, 'https://www.sqltutorial.org/sql-cheat-sheet/', 'img', 10, 738, '2023-12-29 13:21:34', 'www.sqltutorial.org'),
(119, 'https://www.sqltutorial.org/sql-cheat-sheet/', 'img', 10, 931, '2023-12-29 13:29:58', 'www.sqltutorial.org'),
(120, 'https://books.toscrape.com/', 'img', 20, 31, '2023-12-29 13:40:45', 'books.toscrape.com'),
(121, 'https://books.toscrape.com/', 'img', 20, 38, '2023-12-29 13:50:15', 'books.toscrape.com'),
(122, 'https://books.toscrape.com/', 'div', 56, 720, '2023-12-29 13:57:40', 'books.toscrape.com'),
(123, 'https://books.toscrape.com/', 'img', 20, 600, '2023-12-29 13:57:53', 'books.toscrape.com'),
(124, 'https://colnect.com/en', 'img', 2, 739, '2023-12-30 10:42:54', 'colnect.com'),
(125, 'https://colnect.com/en', 'div', 62, 182, '2023-12-30 10:43:34', 'colnect.com'),
(126, 'https://books.toscrape.com/', 'img', 20, 627, '2023-12-30 10:57:25', 'books.toscrape.com'),
(127, 'https://books.toscrape.com/', 'div', 56, 586, '2023-12-30 11:01:05', 'books.toscrape.com'),
(128, 'https://books.toscrape.com/', 'img', 20, 932, '2024-01-01 12:43:05', 'books.toscrape.com'),
(129, 'https://books.toscrape.com', 'x', 0, 58, '2024-01-01 12:46:48', 'books.toscrape.com'),
(130, 'https://books.toscrape.com', 'img', 20, 52, '2024-01-01 13:01:58', 'books.toscrape.com'),
(131, 'https://books.toscrape.com', 'SELECTUserIdNamePasswordFROMUsersWHEREUserId105or11', 0, 54, '2024-01-01 13:04:17', 'books.toscrape.com'),
(132, 'https://books.toscrape.com', 'a10', 0, 41, '2024-01-01 13:04:53', 'books.toscrape.com'),
(133, 'https://books.toscrape.com/', 'img', 20, 101, '2024-01-01 13:11:02', 'books.toscrape.com'),
(134, 'https://books.toscrape.com/', 'div', 56, 49, '2024-01-01 13:15:12', 'books.toscrape.com'),
(135, 'https://books.toscrape.com/', 'h2', 0, 741, '2024-01-01 13:16:25', 'books.toscrape.com'),
(136, 'https://books.toscrape.com/', 'img', 20, 839, '2024-01-01 13:21:47', 'books.toscrape.com'),
(137, 'https://books.toscrape.com/', '', 0, 595, '2024-01-01 13:22:34', 'books.toscrape.com'),
(138, 'https://books.toscrape.com/', '', 0, 574, '2024-01-01 13:23:06', 'books.toscrape.com'),
(139, 'https://resto-club.io/', 'img', 0, 328, '2024-01-01 13:31:19', 'resto-club.io'),
(140, 'https://colnect.com/en', 'img', 2, 413, '2024-01-01 13:32:30', 'colnect.com'),
(141, 'https://resto-club.io/', 'section', 23, 200, '2024-01-01 13:32:46', 'resto-club.io'),
(142, 'https://resto-club.io/', 'div', 127, 175, '2024-01-01 13:33:18', 'resto-club.io'),
(143, 'https://books.toscrape.com/', 'img', 20, 51, '2024-01-01 13:35:01', 'books.toscrape.com'),
(144, 'https://books.toscrape.com/', 'div', 0, 723, '2024-01-01 13:38:41', 'books.toscrape.com'),
(145, 'https://books.toscrape.com/', 'h2', 0, 579, '2024-01-01 13:39:33', 'books.toscrape.com'),
(146, 'https://books.toscrape.com/', 'div', 56, 109, '2024-01-01 14:40:30', 'books.toscrape.com'),
(147, 'https://books.toscrape.com/', 'img', 20, 50, '2024-01-02 13:39:54', 'books.toscrape.com'),
(148, 'https://books.toscrape.com/', 'div', 56, 95, '2024-01-02 13:46:00', 'books.toscrape.com'),
(149, 'https://books.toscrape.com/', 'h2', 0, 98, '2024-01-02 13:49:45', 'books.toscrape.com'),
(150, 'https://books.toscrape.com/', 'h1', 1, 39, '2024-01-02 13:49:49', 'books.toscrape.com'),
(151, 'https://colnect.com/en', 'img', 2, 413, '2024-01-02 14:13:21', 'colnect.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
