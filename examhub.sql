-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 15, 2024 at 06:42 AM
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
-- Database: `examhub`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads001`
--

CREATE TABLE `ads001` (
  `QUE` varchar(256) NOT NULL,
  `OP1` varchar(256) NOT NULL,
  `OP2` varchar(256) NOT NULL,
  `OP3` varchar(256) NOT NULL,
  `OP4` varchar(256) NOT NULL,
  `CROP` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ads001`
--

INSERT INTO `ads001` (`QUE`, `OP1`, `OP2`, `OP3`, `OP4`, `CROP`) VALUES
('1. What is the capital of France?', 'Berlin', 'Madrid', 'Paris', 'Rome', 'C'),
('2. Which planet is known as the Red Planet?', 'Venus', 'Mars', 'Jupiter', 'Saturn', 'B'),
('3. Who wrote \"Romeo and Juliet\"?', 'Charles Dickens', 'J.K. Rowling', 'William Shakespeare', 'Mark Twain', 'C'),
('4. What is the boiling point of water?', '90°C', '100°C', '80°C', '70°C', 'B'),
('5. Who is known as the father of computers?', 'Charles Babbage', 'Isaac Newton', 'Albert Einstein', 'Alan Turing', 'A'),
('6. What is the chemical symbol for water?', 'H2O', 'O2', 'CO2', 'NaCl', 'A'),
('7. How many continents are there on Earth?', '5', '6', '7', '8', 'C'),
('8. What is the largest mammal?', 'Elephant', 'Blue Whale', 'Giraffe', 'Shark', 'B'),
('9. What is the square root of 81?', '7', '8', '9', '10', 'C'),
('10. Who discovered gravity?', 'Isaac Newton', 'Galileo Galilei', 'Thomas Edison', 'Albert Einstein', 'A'),
('dsfcsdsdcsv', 'sdvs', 'sdvsdvsd', 'dfbvd', 'dfbdfb', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `ads001_res`
--

CREATE TABLE `ads001_res` (
  `username` varchar(256) NOT NULL,
  `answers` varchar(256) NOT NULL,
  `report` varchar(4096) NOT NULL,
  `marks` varchar(256) NOT NULL,
  `per` varchar(256) NOT NULL,
  `date_time` varchar(256) NOT NULL,
  `submit_id` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ads001_res`
--

INSERT INTO `ads001_res` (`username`, `answers`, `report`, `marks`, `per`, `date_time`, `submit_id`) VALUES
('tushar', 'C, B, C, B, A, A, C, 0, 0, 0, 0', '1. What is the capital of France? ## Berlin ## Madrid ## Paris ## Rome ## C ## C ## 1 ## 2 |||2. Which planet is known as the Red Planet? ## Venus ## Mars ## Jupiter ## Saturn ## B ## B ## 1 ## 2 |||3. Who wrote \"Romeo and Juliet\"? ## Charles Dickens ## J.K. Rowling ## William Shakespeare ## Mark Twain ## C ## C ## 1 ## 2 |||4. What is the boiling point of water? ## 90°C ## 100°C ## 80°C ## 70°C ## B ## B ## 1 ## 2 |||5. Who is known as the father of computers? ## Charles Babbage ## Isaac Newton ## Albert Einstein ## Alan Turing ## A ## A ## 1 ## 2 |||6. What is the chemical symbol for water? ## H2O ## O2 ## CO2 ## NaCl ## A ## A ## 1 ## 2 |||7. How many continents are there on Earth? ## 5 ## 6 ## 7 ## 8 ## C ## C ## 1 ## 2 |||8. What is the largest mammal? ## Elephant ## Blue Whale ## Giraffe ## Shark ## B ## - ## -1 ## 0 |||9. What is the square root of 81? ## 7 ## 8 ## 9 ## 10 ## C ## - ## -1 ## 0 |||10. Who discovered gravity? ## Isaac Newton ## Galileo Galilei ## Thomas Edison ## Albert Einstein ## A ## - ## -1 ## 0 |||dsfcsdsdcsv ## sdvs ## sdvsdvsd ## dfbvd ## dfbdfb ## A ## - ## -1 ## 0 |||', '14', '63.64', '12/10/2024 14:43:51', '56baefd3672402dd51c58997c00f6ad46a67795546aa8d9d97931db3eff94158'),
('tushar', 'B, B, C, B, A, A, C, B, C, A, A', '1. What is the capital of France? ## Berlin ## Madrid ## Paris ## Rome ## C ## B ## -1 ## 0 |||2. Which planet is known as the Red Planet? ## Venus ## Mars ## Jupiter ## Saturn ## B ## B ## 1 ## 2 |||3. Who wrote \"Romeo and Juliet\"? ## Charles Dickens ## J.K. Rowling ## William Shakespeare ## Mark Twain ## C ## C ## 1 ## 2 |||4. What is the boiling point of water? ## 90°C ## 100°C ## 80°C ## 70°C ## B ## B ## 1 ## 2 |||5. Who is known as the father of computers? ## Charles Babbage ## Isaac Newton ## Albert Einstein ## Alan Turing ## A ## A ## 1 ## 2 |||6. What is the chemical symbol for water? ## H2O ## O2 ## CO2 ## NaCl ## A ## A ## 1 ## 2 |||7. How many continents are there on Earth? ## 5 ## 6 ## 7 ## 8 ## C ## C ## 1 ## 2 |||8. What is the largest mammal? ## Elephant ## Blue Whale ## Giraffe ## Shark ## B ## B ## 1 ## 2 |||9. What is the square root of 81? ## 7 ## 8 ## 9 ## 10 ## C ## C ## 1 ## 2 |||10. Who discovered gravity? ## Isaac Newton ## Galileo Galilei ## Thomas Edison ## Albert Einstein ## A ## A ## 1 ## 2 |||dsfcsdsdcsv ## sdvs ## sdvsdvsd ## dfbvd ## dfbdfb ## A ## A ## 1 ## 2 |||', '20', '90.91', '15/10/2024 09:44:05', '9805f6c13365c893d10548ab444a3986004e05dba1c03bc974213457d275dacf');

-- --------------------------------------------------------

--
-- Table structure for table `ads002`
--

CREATE TABLE `ads002` (
  `QUE` varchar(256) DEFAULT NULL,
  `OP1` varchar(256) DEFAULT NULL,
  `OP2` varchar(256) DEFAULT NULL,
  `OP3` varchar(256) DEFAULT NULL,
  `OP4` varchar(256) DEFAULT NULL,
  `CROP` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ads002`
--

INSERT INTO `ads002` (`QUE`, `OP1`, `OP2`, `OP3`, `OP4`, `CROP`) VALUES
('What is Color of Red?', 'Pink', 'Red', 'Black', 'Blue', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `ads002_res`
--

CREATE TABLE `ads002_res` (
  `username` varchar(256) DEFAULT NULL,
  `answers` varchar(256) DEFAULT NULL,
  `marks` varchar(256) DEFAULT NULL,
  `per` varchar(256) DEFAULT NULL,
  `date_time` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ads002_res`
--

INSERT INTO `ads002_res` (`username`, `answers`, `marks`, `per`, `date_time`) VALUES
('tushar', 'B', '2', '100.00', '09/10/2024 19:11:14');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-10-04 07:57:14.784280'),
(2, 'auth', '0001_initial', '2024-10-04 07:57:15.401229'),
(3, 'admin', '0001_initial', '2024-10-04 07:57:15.523593'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-10-04 07:57:15.543917'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-10-04 07:57:15.552653'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-10-04 07:57:15.617654'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-10-04 07:57:15.682260'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-10-04 07:57:15.696647'),
(9, 'auth', '0004_alter_user_username_opts', '2024-10-04 07:57:15.702307'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-10-04 07:57:15.765963'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-10-04 07:57:15.765963'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-10-04 07:57:15.781964'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-10-04 07:57:15.788025'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-10-04 07:57:15.807742'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-10-04 07:57:15.816195'),
(16, 'auth', '0011_update_proxy_permissions', '2024-10-04 07:57:15.838345'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-10-04 07:57:15.849607'),
(18, 'sessions', '0001_initial', '2024-10-04 07:57:15.887205');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('hqok0q9xjpx1p68tuynp26ehzwn8utcf', '.eJyrViotTi3KS8xNVbJSKiktzkgsUtKBMuITS0sylKxKikpTgUKpxSXJ-SkgZYkpxQYGhkoQsfjiksSSVIiqWgBDtRuA:1t0YzP:yquD3xR_fCUtx_eK0dKqB_ftmTl2fbJfni1Oy8K7MoQ', '2024-10-29 04:16:55.051494');

-- --------------------------------------------------------

--
-- Table structure for table `examhub_auth`
--

CREATE TABLE `examhub_auth` (
  `eh_username` varchar(256) NOT NULL,
  `eh_password` varchar(256) NOT NULL,
  `role` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `examhub_auth`
--

INSERT INTO `examhub_auth` (`eh_username`, `eh_password`, `role`) VALUES
('tushar', '123', 'STD'),
('admin', '123', 'TEC');

-- --------------------------------------------------------

--
-- Table structure for table `testcodes`
--

CREATE TABLE `testcodes` (
  `testcode` varchar(256) NOT NULL,
  `testname` varchar(256) NOT NULL,
  `testtime` varchar(256) NOT NULL,
  `q_weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testcodes`
--

INSERT INTO `testcodes` (`testcode`, `testname`, `testtime`, `q_weight`) VALUES
('ads001', 'ADS', '0', 2),
('ADS002', 'ADS', '0', 2),
('TEST_001', 'TEST_001', '0', 2),
('XYZ001', 'XYZ', '0', 2);

-- --------------------------------------------------------

--
-- Table structure for table `test_001`
--

CREATE TABLE `test_001` (
  `QUE` varchar(256) DEFAULT NULL,
  `OP1` varchar(256) DEFAULT NULL,
  `OP2` varchar(256) DEFAULT NULL,
  `OP3` varchar(256) DEFAULT NULL,
  `OP4` varchar(256) DEFAULT NULL,
  `CROP` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_001_res`
--

CREATE TABLE `test_001_res` (
  `username` varchar(256) DEFAULT NULL,
  `answers` varchar(256) DEFAULT NULL,
  `marks` varchar(256) DEFAULT NULL,
  `per` varchar(256) DEFAULT NULL,
  `date_time` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `xyz001`
--

CREATE TABLE `xyz001` (
  `QUE` varchar(256) DEFAULT NULL,
  `OP1` varchar(256) DEFAULT NULL,
  `OP2` varchar(256) DEFAULT NULL,
  `OP3` varchar(256) DEFAULT NULL,
  `OP4` varchar(256) DEFAULT NULL,
  `CROP` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `xyz001`
--

INSERT INTO `xyz001` (`QUE`, `OP1`, `OP2`, `OP3`, `OP4`, `CROP`) VALUES
('DFBDFBD', 'BDFBDBD', 'FBDFBD', 'FBDFBD', 'FBDFBDFB', 'B'),
('DFBDFBD', 'BDFBDBD', 'FBDFBD', 'FBDFBD', 'FBDFBDFB', 'B'),
('DFBDFBD', 'BDFBDBD', 'FBDFBD', 'FBDFBD', 'FBDFBDFB', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `xyz001_res`
--

CREATE TABLE `xyz001_res` (
  `username` varchar(256) DEFAULT NULL,
  `answers` varchar(256) DEFAULT NULL,
  `report` varchar(4096) DEFAULT NULL,
  `marks` varchar(256) DEFAULT NULL,
  `per` varchar(256) DEFAULT NULL,
  `date_time` varchar(256) DEFAULT NULL,
  `submit_id` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
