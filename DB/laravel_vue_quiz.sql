-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2021 at 06:22 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_vue_quiz`
--

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2021_11_17_174018_create_versions_table', 2),
(8, '2021_11_18_135442_create_quiz_classes_table', 3),
(10, '2021_11_18_143454_create_subjects_table', 4),
(11, '2021_11_18_150946_create_quizzes_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_class_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `pass_percentage` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `version_id`, `quiz_class_id`, `subject_id`, `title`, `start`, `end`, `pass_percentage`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Bangla Test', '2021-11-19 23:12:00', '2021-11-19 23:12:00', 30, '2021-11-18 11:12:15', '2021-11-18 11:12:15'),
(2, 1, 2, 2, 'Bangla 2 test', '2021-11-19 23:13:00', '2021-11-19 23:13:00', 33, '2021-11-18 11:13:14', '2021-11-18 11:13:14'),
(3, 2, 3, 3, 'English 1 test', '2021-11-25 10:14:00', '2021-11-25 12:14:00', 33, '2021-11-18 11:14:32', '2021-11-18 11:14:32'),
(4, 2, 2, 5, 'English 2 test', '2021-11-26 23:18:00', '2021-11-26 12:18:00', 33, '2021-11-18 11:18:38', '2021-11-18 11:18:38'),
(5, 3, 1, 6, 'Math 1 test', '2021-11-27 23:18:00', '2021-11-27 12:18:00', NULL, '2021-11-18 11:19:04', '2021-11-18 11:19:04'),
(6, 3, 3, 6, 'tttr', '2021-11-28 23:19:00', '2021-11-28 00:19:00', 33, '2021-11-18 11:19:37', '2021-11-18 11:19:37'),
(7, 3, 3, 2, 'ttrt', '2021-11-30 23:19:00', '2021-11-30 12:20:00', 40, '2021-11-18 11:20:11', '2021-11-18 11:20:11'),
(8, 1, 3, 5, 'ENG BANG', '2021-12-01 12:20:00', '2021-11-18 12:20:00', NULL, '2021-11-18 11:20:49', '2021-11-18 11:20:49');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_classes`
--

CREATE TABLE `quiz_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_classes`
--

INSERT INTO `quiz_classes` (`id`, `version_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Class 1', '2021-11-18 11:08:29', '2021-11-18 11:08:29'),
(2, 1, 'Class 2', '2021-11-18 11:08:50', '2021-11-18 11:08:50'),
(3, 1, 'Class 3', '2021-11-18 11:09:01', '2021-11-18 11:09:01');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quiz_class_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `quiz_class_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bangla 1', '2021-11-18 11:10:43', '2021-11-18 11:10:43'),
(2, 2, 'Bangla 2', '2021-11-18 11:10:57', '2021-11-18 11:10:57'),
(3, 3, 'English 1', '2021-11-18 11:11:07', '2021-11-18 11:11:07'),
(5, 2, 'English 2', '2021-11-18 11:11:24', '2021-11-18 11:11:24'),
(6, 3, 'Math 1', '2021-11-18 11:11:42', '2021-11-18 11:11:42');

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE `versions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `versions`
--

INSERT INTO `versions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Bangla', '2021-11-18 11:07:31', '2021-11-18 11:07:31'),
(2, 'English', '2021-11-18 11:07:41', '2021-11-18 11:07:41'),
(3, 'Mathmatics', '2021-11-18 11:07:51', '2021-11-18 11:07:51');

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quizzes_version_id_foreign` (`version_id`),
  ADD KEY `quizzes_quiz_class_id_foreign` (`quiz_class_id`),
  ADD KEY `quizzes_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `quiz_classes`
--
ALTER TABLE `quiz_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_classes_version_id_foreign` (`version_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_quiz_class_id_foreign` (`quiz_class_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `versions`
--
ALTER TABLE `versions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `versions_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `quiz_classes`
--
ALTER TABLE `quiz_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `versions`
--
ALTER TABLE `versions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_quiz_class_id_foreign` FOREIGN KEY (`quiz_class_id`) REFERENCES `quiz_classes` (`id`),
  ADD CONSTRAINT `quizzes_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `quizzes_version_id_foreign` FOREIGN KEY (`version_id`) REFERENCES `versions` (`id`);

--
-- Constraints for table `quiz_classes`
--
ALTER TABLE `quiz_classes`
  ADD CONSTRAINT `quiz_classes_version_id_foreign` FOREIGN KEY (`version_id`) REFERENCES `versions` (`id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_quiz_class_id_foreign` FOREIGN KEY (`quiz_class_id`) REFERENCES `quiz_classes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
