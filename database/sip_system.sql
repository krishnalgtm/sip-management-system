-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2025 at 09:46 AM
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
-- Database: `sip_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-sipmanagers@gmail.com|127.0.0.1', 'i:2;', 1753770078),
('laravel-cache-sipmanagers@gmail.com|127.0.0.1:timer', 'i:1753770078;', 1753770078);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `scheduled_for` timestamp NULL DEFAULT NULL,
  `sip_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','paid','failed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `user_id`, `scheduled_for`, `sip_id`, `invoice_date`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(10, 1, '2025-07-29 01:40:05', 1, NULL, 800.00, 'pending', '2025-07-29 01:40:05', '2025-07-29 01:40:05'),
(11, 1, '2025-07-29 01:40:05', 2, NULL, 4567.00, 'pending', '2025-07-29 01:40:05', '2025-07-29 01:40:05'),
(12, 1, '2025-07-29 01:40:05', 3, NULL, 15.00, 'pending', '2025-07-29 01:40:05', '2025-07-29 01:40:05'),
(13, 1, '2025-07-29 01:40:05', 4, NULL, 3435.00, 'pending', '2025-07-29 01:40:05', '2025-07-29 01:40:05'),
(14, 1, '2025-07-30 02:41:46', 1, NULL, 800.00, 'pending', '2025-07-29 01:41:46', '2025-07-29 01:41:46'),
(15, 1, '2025-07-30 02:41:46', 2, NULL, 4567.00, 'pending', '2025-07-29 01:41:46', '2025-07-29 01:41:46'),
(16, 1, '2025-07-30 02:41:46', 3, NULL, 15.00, 'pending', '2025-07-29 01:41:46', '2025-07-29 01:41:46'),
(17, 1, '2025-07-30 02:41:46', 4, NULL, 3435.00, 'pending', '2025-07-29 01:41:46', '2025-07-29 01:41:46'),
(18, 1, '2025-07-30 02:42:58', 5, NULL, 112.00, 'pending', '2025-07-29 01:42:58', '2025-07-29 01:42:58'),
(19, 1, '2025-07-30 02:48:15', 6, NULL, 2500.00, 'pending', '2025-07-29 01:48:15', '2025-07-29 01:48:15'),
(20, 1, '2025-07-30 02:53:05', 7, NULL, 2000.00, 'pending', '2025-07-29 01:53:05', '2025-07-29 01:53:05'),
(21, 2, '2025-07-30 02:56:03', 8, NULL, 15.00, 'pending', '2025-07-29 01:56:03', '2025-07-29 01:56:03'),
(22, 2, '2025-07-30 03:10:55', 9, NULL, 2323.00, 'pending', '2025-07-29 02:10:55', '2025-07-29 02:10:55');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_28_103106_create_sips_table', 1),
(5, '2025_07_28_104434_create_invoices_table', 1),
(6, '2025_07_28_122726_make_invoice_date_nullable', 1),
(7, '2025_07_29_061610_add_user_id_to_invoices_table', 1),
(8, '2025_07_29_070850_add_scheduled_for_to_invoices_table', 2);

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
('ZnREkxdSz251fmZ7A2hFPjWUYVcPPvY7UmX94ecD', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR1g1REhPYkRZSjZBYTBqdmhSQUJVc0Y5ZnFKRzV6bGFoM0YxdnMxNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9pbnZvaWNlcyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==', 1753774855);

-- --------------------------------------------------------

--
-- Table structure for table `sips`
--

CREATE TABLE `sips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `frequency` enum('daily','monthly') NOT NULL,
  `sip_day` tinyint(3) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sips`
--

INSERT INTO `sips` (`id`, `user_id`, `amount`, `frequency`, `sip_day`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 800.00, 'daily', NULL, '2025-07-29', '2025-08-29', 'active', '2025-07-29 00:51:43', '2025-07-29 00:51:43'),
(2, 1, 4567.00, 'daily', NULL, '2025-07-29', '2025-07-31', 'active', '2025-07-29 01:07:54', '2025-07-29 01:07:54'),
(3, 1, 15.00, 'daily', NULL, '2025-07-29', '2025-07-30', 'active', '2025-07-29 01:13:20', '2025-07-29 01:13:20'),
(4, 1, 3435.00, 'daily', NULL, '2025-07-29', '2025-07-31', 'active', '2025-07-29 01:36:17', '2025-07-29 01:36:17'),
(5, 1, 112.00, 'daily', NULL, '2025-07-29', '2025-07-31', 'active', '2025-07-29 01:42:39', '2025-07-29 01:42:39'),
(6, 1, 2500.00, 'daily', NULL, '2025-07-29', '2025-07-31', 'active', '2025-07-29 01:47:46', '2025-07-29 01:47:46'),
(7, 1, 2000.00, 'monthly', NULL, '2025-07-30', '2025-08-30', 'active', '2025-07-29 01:49:28', '2025-07-29 01:49:28'),
(8, 2, 15.00, 'daily', NULL, '2025-07-29', '2025-07-31', 'active', '2025-07-29 01:55:37', '2025-07-29 01:55:37'),
(9, 2, 2323.00, 'daily', NULL, '2025-07-29', '2025-08-13', 'active', '2025-07-29 02:10:50', '2025-07-29 02:10:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'sipmanager', 'sipmanager@gmail.com', NULL, '$2y$12$7zoEmbywDA0SsMK8d2A6v.FSWWsen9Vgufjqy9LgcDKuANnqyiB2C', NULL, '2025-07-29 00:51:22', '2025-07-29 00:51:22'),
(2, 'yash', 'yash@gmail.com', NULL, '$2y$12$ES2Xb15O0KFUVoehPQgd3ewCOF59Iw2CjZD2NLXQhsg5.0p29u6s2', NULL, '2025-07-29 01:55:24', '2025-07-29 01:55:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_sip_id_foreign` (`sip_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sips`
--
ALTER TABLE `sips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sips_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sips`
--
ALTER TABLE `sips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_sip_id_foreign` FOREIGN KEY (`sip_id`) REFERENCES `sips` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sips`
--
ALTER TABLE `sips`
  ADD CONSTRAINT `sips_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
