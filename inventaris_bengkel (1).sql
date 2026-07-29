-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Jul 2026 pada 18.51
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventaris_bengkel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `jobs`
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
-- Struktur dari tabel `job_batches`
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
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_04_28_052957_create_products_table', 1),
(5, '2026_04_28_052957_create_suppliers_table', 1),
(6, '2026_04_28_052958_create_transactions_table', 1),
(7, '2026_06_10_000001_add_supplier_id_to_products_table', 1),
(8, '2026_06_10_000002_update_suppliers_table', 1),
(9, '2026_06_25_000001_add_code_and_category_to_products_table', 1),
(10, '2026_07_09_000001_add_unit_to_products_table', 1),
(11, '2026_07_09_000002_add_unit_conversion_to_tables', 1),
(12, '2026_07_27_000001_add_role_to_users_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL COMMENT 'Kode Barang',
  `name` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL COMMENT 'Kategori Barang',
  `unit` varchar(255) NOT NULL DEFAULT 'pcs' COMMENT 'Satuan Barang (contoh: botol, set, pcs)',
  `large_unit` varchar(255) DEFAULT NULL COMMENT 'Satuan besar opsional (contoh: dus, box)',
  `unit_conversion` int(11) NOT NULL DEFAULT 1 COMMENT 'Konversi isi (contoh: 24 botol per dus)',
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `lead_time` int(11) NOT NULL DEFAULT 0 COMMENT 'Average Lead Time (days)',
  `max_lead_time` int(11) NOT NULL DEFAULT 0 COMMENT 'Max Lead Time (days)',
  `average_usage` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Average Usage per day',
  `max_usage` int(11) NOT NULL DEFAULT 0 COMMENT 'Max Usage per day',
  `ss_value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `rop_value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `code`, `name`, `category`, `unit`, `large_unit`, `unit_conversion`, `supplier_id`, `stock`, `lead_time`, `max_lead_time`, `average_usage`, `max_usage`, `ss_value`, `rop_value`, `created_at`, `updated_at`) VALUES
(1, 'GEN-CM1691', 'Roller Assembly Standard Piaggio', 'Servis & Performa', 'set', 'box', 5, 1, 3, 3, 5, 3.00, 5, 16.00, 25.00, '2026-07-27 06:48:30', '2026-07-28 19:07:32'),
(2, 'GEN-638853', 'Busi Standard NGK CR8EB Piaggio', 'Servis & Performa', 'pcs', 'box', 10, 1, 0, 3, 5, 4.00, 5, 13.00, 25.00, '2026-07-27 06:48:30', '2026-07-28 19:07:32'),
(3, 'GEN-B01807', 'Filter Udara Standard Piaggio', 'Servis & Performa', 'pcs', NULL, 1, 1, 38, 3, 5, 3.14, 5, 16.00, 26.00, '2026-07-27 06:48:30', '2026-07-28 19:07:32'),
(4, 'GEN-1A0033', 'V-Belt Standard Piaggio', 'Servis & Performa', 'pcs', NULL, 1, 1, 1, 3, 5, 1.75, 3, 10.00, 16.00, '2026-07-27 06:48:30', '2026-07-28 19:07:32'),
(5, 'GEN-651356', 'Kampas Rem Depan Standard Piaggio', 'Keamanan & Kaki-Kaki', 'pcs', NULL, 1, 1, 33, 3, 5, 2.91, 5, 17.00, 26.00, '2026-07-27 06:48:30', '2026-07-28 19:07:32'),
(6, 'GEN-82635R', 'Filter Oli Mesin Piaggio', 'Servis & Performa', 'pcs', 'dus', 24, 1, 19, 3, 5, 3.29, 5, 16.00, 26.00, '2026-07-27 06:48:30', '2026-07-28 19:07:32'),
(7, 'MOD-OLIPM', 'Oli Mesin Ipone Scooter 10W-40 Premium', 'Servis & Performa', 'pcs', 'dus', 24, 2, 13, 1, 3, 3.43, 4, 9.00, 13.00, '2026-07-27 06:48:30', '2026-07-28 19:07:32'),
(8, 'MOD-RLBRT', 'Roller Racing BRT / Kawahara (Set)', 'Servis & Performa', 'set', 'box', 5, 2, 15, 1, 3, 2.86, 5, 13.00, 16.00, '2026-07-27 06:48:30', '2026-07-28 19:07:32'),
(9, 'MOD-VBCVT', 'Paket V-Belt & Per CVT Racing Anti-Greged', 'Servis & Performa', 'set', 'box', 5, 2, 30, 1, 3, 3.43, 5, 12.00, 16.00, '2026-07-27 06:48:30', '2026-07-28 19:07:32'),
(10, 'MOD-BSIRD', 'Busi Racing Iridium NGK / Denso', 'Servis & Performa', 'pcs', 'box', 10, 3, 16, 1, 3, 2.78, 5, 13.00, 16.00, '2026-07-27 06:48:30', '2026-07-28 19:07:32'),
(11, 'MOD-FLFRX', 'Filter Udara Racing Ferrox Replacement', 'Servis & Performa', 'pcs', NULL, 1, 2, 18, 1, 3, 3.22, 5, 12.00, 16.00, '2026-07-27 06:48:30', '2026-07-28 19:07:32'),
(12, 'MOD-KNSHJ', 'Knalpot Racing Shijiro / Prospeed Bolt-On', 'Servis & Performa', 'pcs', NULL, 1, 2, 12, 1, 3, 3.67, 5, 12.00, 16.00, '2026-07-27 06:48:30', '2026-07-28 19:07:33'),
(13, 'MOD-KMZEL', 'Kampas Rem Aftermarket Zelioni / Malossi', 'Keamanan & Kaki-Kaki', 'pcs', NULL, 1, 2, 11, 1, 3, 2.88, 5, 13.00, 16.00, '2026-07-27 06:48:30', '2026-07-28 19:07:33'),
(14, 'MOD-SBYSS', 'Shockbreaker Aftermarket YSS / Scarlet (Set)', 'Keamanan & Kaki-Kaki', 'set', 'box', 5, 2, 16, 1, 3, 2.78, 5, 13.00, 16.00, '2026-07-27 06:48:30', '2026-07-28 19:07:33'),
(15, 'MOD-BTPRT', 'Baut Proti Titanium Variasi (Eceran)', 'Keamanan & Kaki-Kaki', 'pcs', 'box', 100, 2, 212, 1, 3, 2.88, 5, 13.00, 16.00, '2026-07-27 06:48:30', '2026-07-28 19:07:33'),
(16, 'MOD-HGDMN', 'Handgrip Aftermarket Harris / Domino', 'Aksesoris & Body', 'set', 'box', 5, 2, 17, 1, 3, 2.88, 5, 13.00, 16.00, '2026-07-27 06:48:30', '2026-07-28 19:07:33'),
(17, 'MOD-SPBAR', 'Spion Bar End / Tangkai Pendek Sporty', 'Aksesoris & Body', 'pcs', NULL, 1, 2, 4, 1, 3, 3.22, 5, 12.00, 16.00, '2026-07-27 06:48:30', '2026-07-28 19:07:33'),
(18, 'MOD-HKCNC', 'Gantungan Barang (Hook) CNC Aluminium', 'Aksesoris & Body', 'pcs', NULL, 1, 2, 1, 1, 3, 3.00, 5, 12.00, 15.00, '2026-07-27 06:48:30', '2026-07-28 19:07:33'),
(19, 'MOD-WSMCA', 'Flyscreen / Windshield Mika Retro', 'Aksesoris & Body', 'pcs', NULL, 1, 2, 9, 1, 3, 2.63, 5, 13.00, 16.00, '2026-07-27 06:48:30', '2026-07-28 19:07:33'),
(20, 'MOD-CRBAR', 'Crashbar Pelindung Body Vespa (Set)', 'Aksesoris & Body', 'set', 'box', 5, 2, 4, 1, 3, 3.00, 5, 12.00, 15.00, '2026-07-27 06:48:30', '2026-07-28 19:07:33'),
(21, 'MOD-LEDRG', 'Lampu LED Utama + Ring Bezel Black Matte', 'Aksesoris & Body', 'pcs', NULL, 1, 2, 5, 1, 3, 3.71, 5, 12.00, 16.00, '2026-07-27 06:48:30', '2026-07-28 19:07:33'),
(22, NULL, 'Oli Mesin Motul 5100 10W-40', NULL, 'botol', NULL, 1, NULL, 50, 2, 4, 3.56, 5, 13.00, 21.00, '2026-07-28 19:07:32', '2026-07-28 19:07:33'),
(23, NULL, 'Busi NGK C7HSA Vespa', NULL, 'pcs', NULL, 1, NULL, 7, 1, 2, 3.83, 5, 7.00, 11.00, '2026-07-28 19:07:32', '2026-07-28 19:07:33'),
(24, NULL, 'Ban Pirelli Angel Scooter 110/70', NULL, 'pcs', NULL, 1, NULL, 30, 5, 7, 3.10, 5, 20.00, 36.00, '2026-07-28 19:07:32', '2026-07-28 19:07:33'),
(25, NULL, 'V-Belt Mitsuboshi Vespa Matic', NULL, 'pcs', NULL, 1, NULL, 23, 3, 5, 3.33, 5, 15.00, 25.00, '2026-07-28 19:07:32', '2026-07-28 19:07:33'),
(26, NULL, 'Kampas Rem Depan Vespa Sprint', NULL, 'set', NULL, 1, NULL, 40, 2, 4, 3.00, 4, 10.00, 16.00, '2026-07-28 19:07:32', '2026-07-28 19:07:33'),
(27, NULL, 'Kampas Rem Belakang Piaggio', NULL, 'set', NULL, 1, NULL, 45, 2, 4, 3.63, 5, 13.00, 21.00, '2026-07-28 19:07:32', '2026-07-28 19:07:33'),
(28, NULL, 'Filter Udara Ferrox', NULL, 'pcs', NULL, 1, NULL, 15, 4, 6, 2.80, 5, 19.00, 31.00, '2026-07-28 19:07:32', '2026-07-28 19:07:33'),
(29, NULL, 'Roller Kawahara 12g', NULL, 'set', NULL, 1, NULL, 60, 2, 3, 2.78, 3, 4.00, 10.00, '2026-07-28 19:07:32', '2026-07-28 19:07:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
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
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3AHRTFtYu5oayHJWp0xssPSicsBLG9OOmAawYXy2', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicER6T2dOMmlkbXE5NVJ2bUJuR0pXc2wzRUw2Q1NoZ2gySFA0ZEJiRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcmVwb3J0cy9yZXN0b2NrIjtzOjU6InJvdXRlIjtzOjE1OiJyZXBvcnRzLnJlc3RvY2siO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1785166450),
('cwSQutzd85VL7IQleCQuv7gYSTjZGK2B0bZ4tfWb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoid0hqdHNMSkxjcjUyVHF5TGc1OUYzREhRRlUzOGo1NElYczJMdVZhaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785165997),
('N6I3NVXtGHfDWt41YX2RiOi1oiTdYTKNpEZFv0Sp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFFRY25mS3dMT2lJZENQVmFubnlQRjk3V2Z5NmNIZ2xnem1QTVBQZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbXBvcnQtcmVhbC1kYXRhIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1785160114);

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL COMMENT 'Nomor telepon supplier',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email supplier',
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'PT Piaggio Pratama', '081299887766', 'piaggio@supplier.com', 'Jakarta', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(2, 'CV Abadi Karunia', '081388776655', 'abadi@supplier.com', 'Jakarta', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(3, 'PT Mobility Indonesia', '081577665544', 'mobility@supplier.com', 'Jakarta', '2026-07-27 06:48:30', '2026-07-27 06:48:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('in','out') NOT NULL,
  `quantity` int(11) NOT NULL,
  `transaction_unit` varchar(255) DEFAULT NULL COMMENT 'Satuan transaksi yang digunakan',
  `original_quantity` int(11) DEFAULT NULL COMMENT 'Jumlah unit asli sebelum dikonversi',
  `transaction_date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `product_id`, `type`, `quantity`, `transaction_unit`, `original_quantity`, `transaction_date`, `notes`, `created_at`, `updated_at`) VALUES
(1, 4, 'in', 3, NULL, NULL, '2025-12-02', 'Barang Masuk. Supplier: PT Piaggio Pratama', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(2, 2, 'in', 3, NULL, NULL, '2025-12-02', 'Barang Masuk. Supplier: PT Piaggio Pratama', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(3, 5, 'in', 7, NULL, NULL, '2025-12-02', 'Barang Masuk. Supplier: PT Piaggio Pratama', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(4, 6, 'in', 19, NULL, NULL, '2025-12-02', 'Barang Masuk. Supplier: PT Piaggio Pratama', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(5, 3, 'in', 4, NULL, NULL, '2025-12-02', 'Barang Masuk. Supplier: PT Piaggio Pratama', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(6, 1, 'in', 9, NULL, NULL, '2025-12-02', 'Barang Masuk. Supplier: PT Piaggio Pratama', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(7, 15, 'in', 25, NULL, NULL, '2025-12-05', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(8, 20, 'in', 2, NULL, NULL, '2025-12-05', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(9, 11, 'in', 2, NULL, NULL, '2025-12-05', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(10, 16, 'in', 7, NULL, NULL, '2025-12-05', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(11, 18, 'in', 4, NULL, NULL, '2025-12-05', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(12, 13, 'in', 17, NULL, NULL, '2025-12-05', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(13, 12, 'in', 3, NULL, NULL, '2025-12-05', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(14, 21, 'in', 3, NULL, NULL, '2025-12-05', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(15, 7, 'in', 49, NULL, NULL, '2025-12-05', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(16, 8, 'in', 13, NULL, NULL, '2025-12-05', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(17, 14, 'in', 2, NULL, NULL, '2025-12-05', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(18, 17, 'in', 3, NULL, NULL, '2025-12-05', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(19, 9, 'in', 7, NULL, NULL, '2025-12-05', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(20, 19, 'in', 3, NULL, NULL, '2025-12-05', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(21, 10, 'in', 7, NULL, NULL, '2025-12-08', 'Barang Masuk. Supplier: PT Mobility Indonesia', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(22, 4, 'in', 5, NULL, NULL, '2026-01-03', 'Barang Masuk. Supplier: PT Piaggio Pratama', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(23, 2, 'in', 3, NULL, NULL, '2026-01-03', 'Barang Masuk. Supplier: PT Piaggio Pratama', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(24, 5, 'in', 14, NULL, NULL, '2026-01-03', 'Barang Masuk. Supplier: PT Piaggio Pratama', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(25, 6, 'in', 37, NULL, NULL, '2026-01-03', 'Barang Masuk. Supplier: PT Piaggio Pratama', '2026-07-27 06:48:30', '2026-07-27 06:48:30'),
(26, 3, 'in', 7, NULL, NULL, '2026-01-03', 'Barang Masuk. Supplier: PT Piaggio Pratama', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(27, 1, 'in', 9, NULL, NULL, '2026-01-03', 'Barang Masuk. Supplier: PT Piaggio Pratama', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(28, 15, 'in', 26, NULL, NULL, '2026-01-06', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(29, 20, 'in', 3, NULL, NULL, '2026-01-06', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(30, 11, 'in', 2, NULL, NULL, '2026-01-06', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(31, 16, 'in', 10, NULL, NULL, '2026-01-06', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(32, 18, 'in', 7, NULL, NULL, '2026-01-06', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(33, 13, 'in', 23, NULL, NULL, '2026-01-06', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(34, 12, 'in', 5, NULL, NULL, '2026-01-06', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(35, 21, 'in', 4, NULL, NULL, '2026-01-06', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(36, 7, 'in', 96, NULL, NULL, '2026-01-06', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(37, 8, 'in', 27, NULL, NULL, '2026-01-06', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(38, 14, 'in', 3, NULL, NULL, '2026-01-06', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(39, 17, 'in', 2, NULL, NULL, '2026-01-06', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(40, 9, 'in', 10, NULL, NULL, '2026-01-06', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(41, 19, 'in', 4, NULL, NULL, '2026-01-06', 'Barang Masuk. Supplier: CV Abadi Karunia', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(42, 10, 'in', 7, NULL, NULL, '2026-01-09', 'Barang Masuk. Supplier: PT Mobility Indonesia', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(43, 7, 'out', 1, NULL, NULL, '2025-12-13', 'Barang Keluar. No. Nota: MOG-251213-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(44, 5, 'out', 2, NULL, NULL, '2025-12-13', 'Barang Keluar. No. Nota: MOG-251213-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(45, 9, 'out', 1, NULL, NULL, '2025-12-13', 'Barang Keluar. No. Nota: MOG-251213-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(46, 13, 'out', 1, NULL, NULL, '2025-12-13', 'Barang Keluar. No. Nota: MOG-251213-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(47, 13, 'out', 1, NULL, NULL, '2025-12-13', 'Barang Keluar. No. Nota: MOG-251213-03', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(48, 13, 'out', 1, NULL, NULL, '2025-12-13', 'Barang Keluar. No. Nota: MOG-251213-03', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(49, 6, 'out', 2, NULL, NULL, '2025-12-14', 'Barang Keluar. No. Nota: MOG-251214-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(50, 15, 'out', 4, NULL, NULL, '2025-12-14', 'Barang Keluar. No. Nota: MOG-251214-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(51, 8, 'out', 1, NULL, NULL, '2025-12-14', 'Barang Keluar. No. Nota: MOG-251214-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(52, 7, 'out', 3, NULL, NULL, '2025-12-14', 'Barang Keluar. No. Nota: MOG-251214-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(53, 7, 'out', 4, NULL, NULL, '2025-12-14', 'Barang Keluar. No. Nota: MOG-251214-03', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(54, 8, 'out', 1, NULL, NULL, '2025-12-14', 'Barang Keluar. No. Nota: MOG-251214-03', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(55, 9, 'out', 1, NULL, NULL, '2025-12-14', 'Barang Keluar. No. Nota: MOG-251214-04', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(56, 7, 'out', 1, NULL, NULL, '2025-12-15', 'Barang Keluar. No. Nota: MOG-251215-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(57, 1, 'out', 1, NULL, NULL, '2025-12-15', 'Barang Keluar. No. Nota: MOG-251215-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(58, 15, 'out', 3, NULL, NULL, '2025-12-15', 'Barang Keluar. No. Nota: MOG-251215-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(59, 20, 'out', 1, NULL, NULL, '2025-12-15', 'Barang Keluar. No. Nota: MOG-251215-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(60, 7, 'out', 1, NULL, NULL, '2025-12-16', 'Barang Keluar. No. Nota: MOG-251216-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(61, 13, 'out', 1, NULL, NULL, '2025-12-16', 'Barang Keluar. No. Nota: MOG-251216-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(62, 8, 'out', 1, NULL, NULL, '2025-12-16', 'Barang Keluar. No. Nota: MOG-251216-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(63, 12, 'out', 1, NULL, NULL, '2025-12-16', 'Barang Keluar. No. Nota: MOG-251216-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(64, 6, 'out', 1, NULL, NULL, '2025-12-17', 'Barang Keluar. No. Nota: MOG-251217-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(65, 15, 'out', 2, NULL, NULL, '2025-12-17', 'Barang Keluar. No. Nota: MOG-251217-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(66, 6, 'out', 1, NULL, NULL, '2025-12-17', 'Barang Keluar. No. Nota: MOG-251217-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(67, 13, 'out', 1, NULL, NULL, '2025-12-17', 'Barang Keluar. No. Nota: MOG-251217-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(68, 1, 'out', 1, NULL, NULL, '2025-12-18', 'Barang Keluar. No. Nota: MOG-251218-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(69, 3, 'out', 1, NULL, NULL, '2025-12-18', 'Barang Keluar. No. Nota: MOG-251218-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(70, 13, 'out', 1, NULL, NULL, '2025-12-18', 'Barang Keluar. No. Nota: MOG-251218-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(71, 7, 'out', 1, NULL, NULL, '2025-12-18', 'Barang Keluar. No. Nota: MOG-251218-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(72, 3, 'out', 1, NULL, NULL, '2025-12-19', 'Barang Keluar. No. Nota: MOG-251219-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(73, 7, 'out', 1, NULL, NULL, '2025-12-19', 'Barang Keluar. No. Nota: MOG-251219-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(74, 7, 'out', 1, NULL, NULL, '2025-12-19', 'Barang Keluar. No. Nota: MOG-251219-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(75, 13, 'out', 1, NULL, NULL, '2025-12-19', 'Barang Keluar. No. Nota: MOG-251219-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(76, 21, 'out', 1, NULL, NULL, '2025-12-19', 'Barang Keluar. No. Nota: MOG-251219-03', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(77, 10, 'out', 1, NULL, NULL, '2025-12-19', 'Barang Keluar. No. Nota: MOG-251219-03', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(78, 7, 'out', 1, NULL, NULL, '2025-12-19', 'Barang Keluar. No. Nota: MOG-251219-04', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(79, 16, 'out', 1, NULL, NULL, '2025-12-20', 'Barang Keluar. No. Nota: MOG-251220-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(80, 6, 'out', 1, NULL, NULL, '2025-12-20', 'Barang Keluar. No. Nota: MOG-251220-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(81, 13, 'out', 1, NULL, NULL, '2025-12-20', 'Barang Keluar. No. Nota: MOG-251220-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(82, 9, 'out', 1, NULL, NULL, '2025-12-20', 'Barang Keluar. No. Nota: MOG-251220-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(83, 10, 'out', 1, NULL, NULL, '2025-12-20', 'Barang Keluar. No. Nota: MOG-251220-03', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(84, 6, 'out', 1, NULL, NULL, '2025-12-20', 'Barang Keluar. No. Nota: MOG-251220-03', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(85, 16, 'out', 1, NULL, NULL, '2025-12-20', 'Barang Keluar. No. Nota: MOG-251220-04', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(86, 7, 'out', 3, NULL, NULL, '2025-12-21', 'Barang Keluar. No. Nota: MOG-251221-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(87, 17, 'out', 1, NULL, NULL, '2025-12-21', 'Barang Keluar. No. Nota: MOG-251221-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(88, 19, 'out', 1, NULL, NULL, '2025-12-21', 'Barang Keluar. No. Nota: MOG-251221-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(89, 2, 'out', 1, NULL, NULL, '2025-12-21', 'Barang Keluar. No. Nota: MOG-251221-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(90, 19, 'out', 1, NULL, NULL, '2025-12-21', 'Barang Keluar. No. Nota: MOG-251221-03', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(91, 16, 'out', 1, NULL, NULL, '2025-12-21', 'Barang Keluar. No. Nota: MOG-251221-03', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(92, 1, 'out', 1, NULL, NULL, '2025-12-22', 'Barang Keluar. No. Nota: MOG-251222-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(93, 7, 'out', 2, NULL, NULL, '2025-12-22', 'Barang Keluar. No. Nota: MOG-251222-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(94, 9, 'out', 1, NULL, NULL, '2025-12-22', 'Barang Keluar. No. Nota: MOG-251222-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(95, 6, 'out', 2, NULL, NULL, '2025-12-22', 'Barang Keluar. No. Nota: MOG-251222-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(96, 1, 'out', 1, NULL, NULL, '2025-12-23', 'Barang Keluar. No. Nota: MOG-251223-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(97, 6, 'out', 1, NULL, NULL, '2025-12-23', 'Barang Keluar. No. Nota: MOG-251223-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(98, 10, 'out', 1, NULL, NULL, '2025-12-23', 'Barang Keluar. No. Nota: MOG-251223-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(99, 14, 'out', 1, NULL, NULL, '2025-12-23', 'Barang Keluar. No. Nota: MOG-251223-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(100, 5, 'out', 1, NULL, NULL, '2025-12-24', 'Barang Keluar. No. Nota: MOG-251224-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(101, 7, 'out', 2, NULL, NULL, '2025-12-24', 'Barang Keluar. No. Nota: MOG-251224-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(102, 17, 'out', 1, NULL, NULL, '2025-12-24', 'Barang Keluar. No. Nota: MOG-251224-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(103, 1, 'out', 1, NULL, NULL, '2025-12-24', 'Barang Keluar. No. Nota: MOG-251224-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(104, 5, 'out', 1, NULL, NULL, '2025-12-25', 'Barang Keluar. No. Nota: MOG-251225-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(105, 12, 'out', 1, NULL, NULL, '2025-12-25', 'Barang Keluar. No. Nota: MOG-251225-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(106, 6, 'out', 2, NULL, NULL, '2025-12-25', 'Barang Keluar. No. Nota: MOG-251225-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(107, 10, 'out', 1, NULL, NULL, '2025-12-25', 'Barang Keluar. No. Nota: MOG-251225-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(108, 8, 'out', 1, NULL, NULL, '2025-12-26', 'Barang Keluar. No. Nota: MOG-251226-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(109, 8, 'out', 1, NULL, NULL, '2025-12-26', 'Barang Keluar. No. Nota: MOG-251226-01', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(110, 7, 'out', 1, NULL, NULL, '2025-12-26', 'Barang Keluar. No. Nota: MOG-251226-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(111, 13, 'out', 1, NULL, NULL, '2025-12-26', 'Barang Keluar. No. Nota: MOG-251226-02', '2026-07-27 06:48:31', '2026-07-27 06:48:31'),
(112, 10, 'out', 1, NULL, NULL, '2025-12-26', 'Barang Keluar. No. Nota: MOG-251226-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(113, 13, 'out', 1, NULL, NULL, '2025-12-26', 'Barang Keluar. No. Nota: MOG-251226-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(114, 7, 'out', 1, NULL, NULL, '2025-12-26', 'Barang Keluar. No. Nota: MOG-251226-04', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(115, 13, 'out', 1, NULL, NULL, '2025-12-27', 'Barang Keluar. No. Nota: MOG-251227-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(116, 15, 'out', 3, NULL, NULL, '2025-12-27', 'Barang Keluar. No. Nota: MOG-251227-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(117, 2, 'out', 1, NULL, NULL, '2025-12-27', 'Barang Keluar. No. Nota: MOG-251227-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(118, 7, 'out', 2, NULL, NULL, '2025-12-27', 'Barang Keluar. No. Nota: MOG-251227-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(119, 3, 'out', 1, NULL, NULL, '2025-12-27', 'Barang Keluar. No. Nota: MOG-251227-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(120, 8, 'out', 1, NULL, NULL, '2025-12-27', 'Barang Keluar. No. Nota: MOG-251227-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(121, 11, 'out', 1, NULL, NULL, '2025-12-27', 'Barang Keluar. No. Nota: MOG-251227-04', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(122, 7, 'out', 5, NULL, NULL, '2025-12-28', 'Barang Keluar. No. Nota: MOG-251228-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(123, 9, 'out', 1, NULL, NULL, '2025-12-28', 'Barang Keluar. No. Nota: MOG-251228-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(124, 8, 'out', 1, NULL, NULL, '2025-12-28', 'Barang Keluar. No. Nota: MOG-251228-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(125, 6, 'out', 2, NULL, NULL, '2025-12-28', 'Barang Keluar. No. Nota: MOG-251228-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(126, 7, 'out', 3, NULL, NULL, '2025-12-28', 'Barang Keluar. No. Nota: MOG-251228-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(127, 16, 'out', 1, NULL, NULL, '2025-12-28', 'Barang Keluar. No. Nota: MOG-251228-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(128, 15, 'out', 3, NULL, NULL, '2025-12-28', 'Barang Keluar. No. Nota: MOG-251228-04', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(129, 1, 'out', 1, NULL, NULL, '2025-12-29', 'Barang Keluar. No. Nota: MOG-251229-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(130, 7, 'out', 1, NULL, NULL, '2025-12-29', 'Barang Keluar. No. Nota: MOG-251229-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(131, 7, 'out', 1, NULL, NULL, '2025-12-29', 'Barang Keluar. No. Nota: MOG-251229-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(132, 5, 'out', 1, NULL, NULL, '2025-12-30', 'Barang Keluar. No. Nota: MOG-251230-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(133, 16, 'out', 1, NULL, NULL, '2025-12-30', 'Barang Keluar. No. Nota: MOG-251230-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(134, 15, 'out', 4, NULL, NULL, '2025-12-30', 'Barang Keluar. No. Nota: MOG-251230-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(135, 13, 'out', 1, NULL, NULL, '2025-12-30', 'Barang Keluar. No. Nota: MOG-251230-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(136, 8, 'out', 1, NULL, NULL, '2025-12-31', 'Barang Keluar. No. Nota: MOG-251231-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(137, 21, 'out', 1, NULL, NULL, '2025-12-31', 'Barang Keluar. No. Nota: MOG-251231-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(138, 8, 'out', 1, NULL, NULL, '2025-12-31', 'Barang Keluar. No. Nota: MOG-251231-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(139, 13, 'out', 1, NULL, NULL, '2025-12-31', 'Barang Keluar. No. Nota: MOG-251231-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(140, 7, 'out', 1, NULL, NULL, '2026-01-01', 'Barang Keluar. No. Nota: MOG-260101-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(141, 7, 'out', 1, NULL, NULL, '2026-01-01', 'Barang Keluar. No. Nota: MOG-260101-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(142, 16, 'out', 1, NULL, NULL, '2026-01-01', 'Barang Keluar. No. Nota: MOG-260101-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(143, 7, 'out', 2, NULL, NULL, '2026-01-01', 'Barang Keluar. No. Nota: MOG-260101-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(144, 12, 'out', 1, NULL, NULL, '2026-01-02', 'Barang Keluar. No. Nota: MOG-260102-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(145, 7, 'out', 2, NULL, NULL, '2026-01-02', 'Barang Keluar. No. Nota: MOG-260102-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(146, 8, 'out', 1, NULL, NULL, '2026-01-02', 'Barang Keluar. No. Nota: MOG-260102-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(147, 7, 'out', 1, NULL, NULL, '2026-01-02', 'Barang Keluar. No. Nota: MOG-260102-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(148, 5, 'out', 2, NULL, NULL, '2026-01-02', 'Barang Keluar. No. Nota: MOG-260102-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(149, 7, 'out', 1, NULL, NULL, '2026-01-02', 'Barang Keluar. No. Nota: MOG-260102-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(150, 15, 'out', 4, NULL, NULL, '2026-01-02', 'Barang Keluar. No. Nota: MOG-260102-04', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(151, 9, 'out', 1, NULL, NULL, '2026-01-03', 'Barang Keluar. No. Nota: MOG-260103-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(152, 9, 'out', 1, NULL, NULL, '2026-01-03', 'Barang Keluar. No. Nota: MOG-260103-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(153, 6, 'out', 1, NULL, NULL, '2026-01-03', 'Barang Keluar. No. Nota: MOG-260103-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(154, 9, 'out', 1, NULL, NULL, '2026-01-03', 'Barang Keluar. No. Nota: MOG-260103-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(155, 13, 'out', 1, NULL, NULL, '2026-01-03', 'Barang Keluar. No. Nota: MOG-260103-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(156, 7, 'out', 2, NULL, NULL, '2026-01-03', 'Barang Keluar. No. Nota: MOG-260103-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(157, 3, 'out', 1, NULL, NULL, '2026-01-03', 'Barang Keluar. No. Nota: MOG-260103-04', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(158, 16, 'out', 1, NULL, NULL, '2026-01-04', 'Barang Keluar. No. Nota: MOG-260104-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(159, 1, 'out', 1, NULL, NULL, '2026-01-04', 'Barang Keluar. No. Nota: MOG-260104-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(160, 16, 'out', 1, NULL, NULL, '2026-01-04', 'Barang Keluar. No. Nota: MOG-260104-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(161, 7, 'out', 5, NULL, NULL, '2026-01-04', 'Barang Keluar. No. Nota: MOG-260104-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(162, 8, 'out', 1, NULL, NULL, '2026-01-04', 'Barang Keluar. No. Nota: MOG-260104-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(163, 8, 'out', 1, NULL, NULL, '2026-01-04', 'Barang Keluar. No. Nota: MOG-260104-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(164, 7, 'out', 4, NULL, NULL, '2026-01-04', 'Barang Keluar. No. Nota: MOG-260104-04', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(165, 13, 'out', 1, NULL, NULL, '2026-01-05', 'Barang Keluar. No. Nota: MOG-260105-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(166, 13, 'out', 1, NULL, NULL, '2026-01-05', 'Barang Keluar. No. Nota: MOG-260105-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(167, 7, 'out', 1, NULL, NULL, '2026-01-05', 'Barang Keluar. No. Nota: MOG-260105-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(168, 7, 'out', 1, NULL, NULL, '2026-01-05', 'Barang Keluar. No. Nota: MOG-260105-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(169, 4, 'out', 1, NULL, NULL, '2026-01-06', 'Barang Keluar. No. Nota: MOG-260106-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(170, 19, 'out', 1, NULL, NULL, '2026-01-06', 'Barang Keluar. No. Nota: MOG-260106-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(171, 16, 'out', 1, NULL, NULL, '2026-01-06', 'Barang Keluar. No. Nota: MOG-260106-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(172, 15, 'out', 4, NULL, NULL, '2026-01-06', 'Barang Keluar. No. Nota: MOG-260106-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(173, 7, 'out', 1, NULL, NULL, '2026-01-07', 'Barang Keluar. No. Nota: MOG-260107-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(174, 3, 'out', 1, NULL, NULL, '2026-01-07', 'Barang Keluar. No. Nota: MOG-260107-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(175, 6, 'out', 2, NULL, NULL, '2026-01-07', 'Barang Keluar. No. Nota: MOG-260107-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(176, 1, 'out', 1, NULL, NULL, '2026-01-08', 'Barang Keluar. No. Nota: MOG-260108-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(177, 4, 'out', 1, NULL, NULL, '2026-01-08', 'Barang Keluar. No. Nota: MOG-260108-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(178, 10, 'out', 1, NULL, NULL, '2026-01-08', 'Barang Keluar. No. Nota: MOG-260108-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(179, 20, 'out', 1, NULL, NULL, '2026-01-08', 'Barang Keluar. No. Nota: MOG-260108-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(180, 7, 'out', 1, NULL, NULL, '2026-01-09', 'Barang Keluar. No. Nota: MOG-260109-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(181, 7, 'out', 2, NULL, NULL, '2026-01-09', 'Barang Keluar. No. Nota: MOG-260109-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(182, 15, 'out', 3, NULL, NULL, '2026-01-09', 'Barang Keluar. No. Nota: MOG-260109-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(183, 7, 'out', 1, NULL, NULL, '2026-01-09', 'Barang Keluar. No. Nota: MOG-260109-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(184, 16, 'out', 1, NULL, NULL, '2026-01-09', 'Barang Keluar. No. Nota: MOG-260109-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(185, 10, 'out', 1, NULL, NULL, '2026-01-09', 'Barang Keluar. No. Nota: MOG-260109-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(186, 13, 'out', 1, NULL, NULL, '2026-01-10', 'Barang Keluar. No. Nota: MOG-260110-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(187, 15, 'out', 3, NULL, NULL, '2026-01-10', 'Barang Keluar. No. Nota: MOG-260110-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(188, 7, 'out', 2, NULL, NULL, '2026-01-10', 'Barang Keluar. No. Nota: MOG-260110-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(189, 10, 'out', 1, NULL, NULL, '2026-01-10', 'Barang Keluar. No. Nota: MOG-260110-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(190, 8, 'out', 1, NULL, NULL, '2026-01-10', 'Barang Keluar. No. Nota: MOG-260110-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(191, 18, 'out', 1, NULL, NULL, '2026-01-10', 'Barang Keluar. No. Nota: MOG-260110-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(192, 6, 'out', 1, NULL, NULL, '2026-01-11', 'Barang Keluar. No. Nota: MOG-260111-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(193, 21, 'out', 1, NULL, NULL, '2026-01-11', 'Barang Keluar. No. Nota: MOG-260111-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(194, 7, 'out', 4, NULL, NULL, '2026-01-11', 'Barang Keluar. No. Nota: MOG-260111-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(195, 13, 'out', 1, NULL, NULL, '2026-01-11', 'Barang Keluar. No. Nota: MOG-260111-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(196, 21, 'out', 1, NULL, NULL, '2026-01-11', 'Barang Keluar. No. Nota: MOG-260111-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(197, 13, 'out', 1, NULL, NULL, '2026-01-11', 'Barang Keluar. No. Nota: MOG-260111-03', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(198, 8, 'out', 1, NULL, NULL, '2026-01-11', 'Barang Keluar. No. Nota: MOG-260111-04', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(199, 6, 'out', 1, NULL, NULL, '2026-01-12', 'Barang Keluar. No. Nota: MOG-260112-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(200, 7, 'out', 1, NULL, NULL, '2026-01-12', 'Barang Keluar. No. Nota: MOG-260112-01', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(201, 3, 'out', 1, NULL, NULL, '2026-01-12', 'Barang Keluar. No. Nota: MOG-260112-02', '2026-07-27 06:48:32', '2026-07-27 06:48:32'),
(202, 7, 'out', 2, NULL, NULL, '2026-01-12', 'Barang Keluar. No. Nota: MOG-260112-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(203, 5, 'out', 2, NULL, NULL, '2026-01-13', 'Barang Keluar. No. Nota: MOG-260113-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(204, 8, 'out', 1, NULL, NULL, '2026-01-13', 'Barang Keluar. No. Nota: MOG-260113-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(205, 9, 'out', 1, NULL, NULL, '2026-01-13', 'Barang Keluar. No. Nota: MOG-260113-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(206, 7, 'out', 1, NULL, NULL, '2026-01-14', 'Barang Keluar. No. Nota: MOG-260114-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(207, 6, 'out', 2, NULL, NULL, '2026-01-14', 'Barang Keluar. No. Nota: MOG-260114-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(208, 7, 'out', 2, NULL, NULL, '2026-01-14', 'Barang Keluar. No. Nota: MOG-260114-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(209, 5, 'out', 1, NULL, NULL, '2026-01-14', 'Barang Keluar. No. Nota: MOG-260114-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(210, 4, 'out', 1, NULL, NULL, '2026-01-15', 'Barang Keluar. No. Nota: MOG-260115-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(211, 6, 'out', 1, NULL, NULL, '2026-01-15', 'Barang Keluar. No. Nota: MOG-260115-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(212, 6, 'out', 1, NULL, NULL, '2026-01-16', 'Barang Keluar. No. Nota: MOG-260116-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(213, 6, 'out', 1, NULL, NULL, '2026-01-16', 'Barang Keluar. No. Nota: MOG-260116-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(214, 7, 'out', 2, NULL, NULL, '2026-01-16', 'Barang Keluar. No. Nota: MOG-260116-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(215, 13, 'out', 2, NULL, NULL, '2026-01-16', 'Barang Keluar. No. Nota: MOG-260116-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(216, 12, 'out', 1, NULL, NULL, '2026-01-16', 'Barang Keluar. No. Nota: MOG-260116-03', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(217, 12, 'out', 1, NULL, NULL, '2026-01-16', 'Barang Keluar. No. Nota: MOG-260116-03', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(218, 6, 'out', 2, NULL, NULL, '2026-01-16', 'Barang Keluar. No. Nota: MOG-260116-04', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(219, 7, 'out', 1, NULL, NULL, '2026-01-17', 'Barang Keluar. No. Nota: MOG-260117-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(220, 5, 'out', 2, NULL, NULL, '2026-01-17', 'Barang Keluar. No. Nota: MOG-260117-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(221, 7, 'out', 2, NULL, NULL, '2026-01-17', 'Barang Keluar. No. Nota: MOG-260117-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(222, 7, 'out', 2, NULL, NULL, '2026-01-17', 'Barang Keluar. No. Nota: MOG-260117-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(223, 6, 'out', 1, NULL, NULL, '2026-01-17', 'Barang Keluar. No. Nota: MOG-260117-03', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(224, 7, 'out', 2, NULL, NULL, '2026-01-17', 'Barang Keluar. No. Nota: MOG-260117-03', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(225, 8, 'out', 1, NULL, NULL, '2026-01-17', 'Barang Keluar. No. Nota: MOG-260117-04', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(226, 3, 'out', 1, NULL, NULL, '2026-01-18', 'Barang Keluar. No. Nota: MOG-260118-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(227, 7, 'out', 1, NULL, NULL, '2026-01-18', 'Barang Keluar. No. Nota: MOG-260118-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(228, 8, 'out', 1, NULL, NULL, '2026-01-18', 'Barang Keluar. No. Nota: MOG-260118-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(229, 13, 'out', 1, NULL, NULL, '2026-01-18', 'Barang Keluar. No. Nota: MOG-260118-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(230, 14, 'out', 1, NULL, NULL, '2026-01-18', 'Barang Keluar. No. Nota: MOG-260118-03', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(231, 8, 'out', 1, NULL, NULL, '2026-01-18', 'Barang Keluar. No. Nota: MOG-260118-03', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(232, 8, 'out', 1, NULL, NULL, '2026-01-18', 'Barang Keluar. No. Nota: MOG-260118-04', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(233, 7, 'out', 1, NULL, NULL, '2026-01-19', 'Barang Keluar. No. Nota: MOG-260119-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(234, 10, 'out', 1, NULL, NULL, '2026-01-19', 'Barang Keluar. No. Nota: MOG-260119-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(235, 7, 'out', 2, NULL, NULL, '2026-01-19', 'Barang Keluar. No. Nota: MOG-260119-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(236, 13, 'out', 1, NULL, NULL, '2026-01-20', 'Barang Keluar. No. Nota: MOG-260120-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(237, 6, 'out', 2, NULL, NULL, '2026-01-20', 'Barang Keluar. No. Nota: MOG-260120-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(238, 16, 'out', 1, NULL, NULL, '2026-01-20', 'Barang Keluar. No. Nota: MOG-260120-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(239, 17, 'out', 1, NULL, NULL, '2026-01-20', 'Barang Keluar. No. Nota: MOG-260120-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(240, 6, 'out', 1, NULL, NULL, '2026-01-21', 'Barang Keluar. No. Nota: MOG-260121-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(241, 15, 'out', 4, NULL, NULL, '2026-01-21', 'Barang Keluar. No. Nota: MOG-260121-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(242, 5, 'out', 1, NULL, NULL, '2026-01-21', 'Barang Keluar. No. Nota: MOG-260121-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(243, 8, 'out', 1, NULL, NULL, '2026-01-21', 'Barang Keluar. No. Nota: MOG-260121-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(244, 13, 'out', 1, NULL, NULL, '2026-01-22', 'Barang Keluar. No. Nota: MOG-260122-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(245, 13, 'out', 1, NULL, NULL, '2026-01-22', 'Barang Keluar. No. Nota: MOG-260122-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(246, 6, 'out', 2, NULL, NULL, '2026-01-22', 'Barang Keluar. No. Nota: MOG-260122-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(247, 14, 'out', 1, NULL, NULL, '2026-01-22', 'Barang Keluar. No. Nota: MOG-260122-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(248, 8, 'out', 1, NULL, NULL, '2026-01-23', 'Barang Keluar. No. Nota: MOG-260123-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(249, 18, 'out', 1, NULL, NULL, '2026-01-23', 'Barang Keluar. No. Nota: MOG-260123-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(250, 13, 'out', 1, NULL, NULL, '2026-01-23', 'Barang Keluar. No. Nota: MOG-260123-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(251, 13, 'out', 1, NULL, NULL, '2026-01-23', 'Barang Keluar. No. Nota: MOG-260123-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(252, 7, 'out', 2, NULL, NULL, '2026-01-23', 'Barang Keluar. No. Nota: MOG-260123-03', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(253, 7, 'out', 2, NULL, NULL, '2026-01-23', 'Barang Keluar. No. Nota: MOG-260123-03', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(254, 1, 'out', 2, NULL, NULL, '2026-01-23', 'Barang Keluar. No. Nota: MOG-260123-04', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(255, 7, 'out', 1, NULL, NULL, '2026-01-24', 'Barang Keluar. No. Nota: MOG-260124-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(256, 1, 'out', 1, NULL, NULL, '2026-01-24', 'Barang Keluar. No. Nota: MOG-260124-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(257, 2, 'out', 1, NULL, NULL, '2026-01-24', 'Barang Keluar. No. Nota: MOG-260124-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(258, 21, 'out', 1, NULL, NULL, '2026-01-24', 'Barang Keluar. No. Nota: MOG-260124-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(259, 13, 'out', 1, NULL, NULL, '2026-01-24', 'Barang Keluar. No. Nota: MOG-260124-03', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(260, 15, 'out', 2, NULL, NULL, '2026-01-24', 'Barang Keluar. No. Nota: MOG-260124-03', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(261, 10, 'out', 1, NULL, NULL, '2026-01-24', 'Barang Keluar. No. Nota: MOG-260124-04', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(262, 7, 'out', 3, NULL, NULL, '2026-01-25', 'Barang Keluar. No. Nota: MOG-260125-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(263, 20, 'out', 1, NULL, NULL, '2026-01-25', 'Barang Keluar. No. Nota: MOG-260125-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(264, 9, 'out', 1, NULL, NULL, '2026-01-25', 'Barang Keluar. No. Nota: MOG-260125-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(265, 8, 'out', 1, NULL, NULL, '2026-01-25', 'Barang Keluar. No. Nota: MOG-260125-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(266, 8, 'out', 1, NULL, NULL, '2026-01-25', 'Barang Keluar. No. Nota: MOG-260125-03', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(267, 16, 'out', 1, NULL, NULL, '2026-01-25', 'Barang Keluar. No. Nota: MOG-260125-03', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(268, 8, 'out', 1, NULL, NULL, '2026-01-25', 'Barang Keluar. No. Nota: MOG-260125-04', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(269, 19, 'out', 1, NULL, NULL, '2026-01-26', 'Barang Keluar. No. Nota: MOG-260126-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(270, 7, 'out', 1, NULL, NULL, '2026-01-26', 'Barang Keluar. No. Nota: MOG-260126-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(271, 5, 'out', 2, NULL, NULL, '2026-01-26', 'Barang Keluar. No. Nota: MOG-260126-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(272, 6, 'out', 2, NULL, NULL, '2026-01-26', 'Barang Keluar. No. Nota: MOG-260126-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(273, 7, 'out', 1, NULL, NULL, '2026-01-27', 'Barang Keluar. No. Nota: MOG-260127-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(274, 13, 'out', 2, NULL, NULL, '2026-01-27', 'Barang Keluar. No. Nota: MOG-260127-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(275, 9, 'out', 1, NULL, NULL, '2026-01-27', 'Barang Keluar. No. Nota: MOG-260127-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(276, 2, 'out', 1, NULL, NULL, '2026-01-27', 'Barang Keluar. No. Nota: MOG-260127-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(277, 7, 'out', 2, NULL, NULL, '2026-01-28', 'Barang Keluar. No. Nota: MOG-260128-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(278, 1, 'out', 1, NULL, NULL, '2026-01-28', 'Barang Keluar. No. Nota: MOG-260128-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(279, 3, 'out', 1, NULL, NULL, '2026-01-28', 'Barang Keluar. No. Nota: MOG-260128-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(280, 4, 'out', 2, NULL, NULL, '2026-01-28', 'Barang Keluar. No. Nota: MOG-260128-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(281, 1, 'out', 1, NULL, NULL, '2026-01-29', 'Barang Keluar. No. Nota: MOG-260129-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(282, 5, 'out', 1, NULL, NULL, '2026-01-29', 'Barang Keluar. No. Nota: MOG-260129-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(283, 6, 'out', 2, NULL, NULL, '2026-01-29', 'Barang Keluar. No. Nota: MOG-260129-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(284, 18, 'out', 1, NULL, NULL, '2026-01-29', 'Barang Keluar. No. Nota: MOG-260129-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(285, 19, 'out', 1, NULL, NULL, '2026-01-30', 'Barang Keluar. No. Nota: MOG-260130-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(286, 13, 'out', 1, NULL, NULL, '2026-01-30', 'Barang Keluar. No. Nota: MOG-260130-01', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(287, 7, 'out', 2, NULL, NULL, '2026-01-30', 'Barang Keluar. No. Nota: MOG-260130-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(288, 6, 'out', 1, NULL, NULL, '2026-01-30', 'Barang Keluar. No. Nota: MOG-260130-02', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(289, 18, 'out', 1, NULL, NULL, '2026-01-30', 'Barang Keluar. No. Nota: MOG-260130-03', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(290, 18, 'out', 1, NULL, NULL, '2026-01-30', 'Barang Keluar. No. Nota: MOG-260130-03', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(291, 8, 'out', 1, NULL, NULL, '2026-01-30', 'Barang Keluar. No. Nota: MOG-260130-04', '2026-07-27 06:48:33', '2026-07-27 06:48:33'),
(292, 8, 'out', 1, NULL, NULL, '2026-01-30', 'Barang Keluar. No. Nota: MOG-260130-04', '2026-07-27 06:48:34', '2026-07-27 06:48:34'),
(293, 8, 'out', 1, NULL, NULL, '2026-01-31', 'Barang Keluar. No. Nota: MOG-260131-01', '2026-07-27 06:48:34', '2026-07-27 06:48:34'),
(294, 8, 'out', 1, NULL, NULL, '2026-01-31', 'Barang Keluar. No. Nota: MOG-260131-01', '2026-07-27 06:48:34', '2026-07-27 06:48:34'),
(295, 13, 'out', 1, NULL, NULL, '2026-01-31', 'Barang Keluar. No. Nota: MOG-260131-02', '2026-07-27 06:48:34', '2026-07-27 06:48:34'),
(296, 9, 'out', 1, NULL, NULL, '2026-01-31', 'Barang Keluar. No. Nota: MOG-260131-02', '2026-07-27 06:48:34', '2026-07-27 06:48:34'),
(297, 12, 'out', 1, NULL, NULL, '2026-01-31', 'Barang Keluar. No. Nota: MOG-260131-03', '2026-07-27 06:48:34', '2026-07-27 06:48:34'),
(298, 6, 'out', 1, NULL, NULL, '2026-01-31', 'Barang Keluar. No. Nota: MOG-260131-04', '2026-07-27 06:48:34', '2026-07-27 06:48:34'),
(299, 7, 'in', 50, 'pcs', 50, '2026-07-27', NULL, '2026-07-27 06:50:20', '2026-07-27 06:50:20'),
(300, 7, 'out', 70, 'pcs', 70, '2026-07-27', NULL, '2026-07-27 06:50:47', '2026-07-27 06:50:47'),
(301, 6, 'out', 30, 'pcs', 30, '2026-07-27', NULL, '2026-07-27 06:51:43', '2026-07-27 06:51:43'),
(302, 1, 'out', 3, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(303, 1, 'out', 1, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(304, 1, 'out', 3, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(305, 1, 'out', 1, NULL, NULL, '2026-07-25', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(306, 1, 'out', 5, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(307, 1, 'out', 5, NULL, NULL, '2026-07-23', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(308, 1, 'out', 3, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(309, 1, 'out', 2, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(310, 1, 'out', 3, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(311, 1, 'out', 1, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(312, 1, 'out', 5, NULL, NULL, '2026-07-18', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(313, 1, 'out', 4, NULL, NULL, '2026-07-16', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(314, 2, 'out', 4, NULL, NULL, '2026-07-28', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(315, 2, 'out', 2, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(316, 2, 'out', 5, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(317, 2, 'out', 4, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(318, 2, 'out', 5, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(319, 3, 'out', 4, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(320, 3, 'out', 2, NULL, NULL, '2026-07-28', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(321, 3, 'out', 3, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(322, 3, 'out', 2, NULL, NULL, '2026-07-25', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(323, 3, 'out', 3, NULL, NULL, '2026-07-23', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(324, 3, 'out', 3, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(325, 3, 'out', 5, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(326, 4, 'out', 1, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(327, 4, 'out', 2, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(328, 4, 'out', 2, NULL, NULL, '2026-07-23', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(329, 4, 'out', 1, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(330, 4, 'out', 1, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(331, 4, 'out', 2, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(332, 4, 'out', 2, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(333, 4, 'out', 3, NULL, NULL, '2026-07-16', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(334, 5, 'out', 2, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(335, 5, 'out', 2, NULL, NULL, '2026-07-28', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(336, 5, 'out', 1, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(337, 5, 'out', 5, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(338, 5, 'out', 2, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(339, 5, 'out', 2, NULL, NULL, '2026-07-23', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(340, 5, 'out', 3, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(341, 5, 'out', 4, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(342, 5, 'out', 3, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(343, 5, 'out', 3, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(344, 5, 'out', 5, NULL, NULL, '2026-07-18', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(345, 6, 'out', 3, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(346, 6, 'out', 3, NULL, NULL, '2026-07-28', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(347, 6, 'out', 3, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(348, 6, 'out', 1, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(349, 6, 'out', 3, NULL, NULL, '2026-07-25', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(350, 6, 'out', 5, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(351, 6, 'out', 5, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(352, 7, 'out', 4, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(353, 7, 'out', 2, NULL, NULL, '2026-07-25', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(354, 7, 'out', 4, NULL, NULL, '2026-07-23', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(355, 7, 'out', 4, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(356, 7, 'out', 3, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(357, 7, 'out', 3, NULL, NULL, '2026-07-18', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(358, 7, 'out', 4, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(359, 8, 'out', 1, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(360, 8, 'out', 1, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(361, 8, 'out', 2, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(362, 8, 'out', 4, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(363, 8, 'out', 3, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(364, 8, 'out', 4, NULL, NULL, '2026-07-18', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(365, 8, 'out', 5, NULL, NULL, '2026-07-16', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(366, 9, 'out', 2, NULL, NULL, '2026-07-28', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(367, 9, 'out', 5, NULL, NULL, '2026-07-23', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(368, 9, 'out', 3, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(369, 9, 'out', 2, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(370, 9, 'out', 4, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(371, 9, 'out', 5, NULL, NULL, '2026-07-18', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(372, 9, 'out', 3, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(373, 10, 'out', 1, NULL, NULL, '2026-07-28', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(374, 10, 'out', 1, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(375, 10, 'out', 5, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(376, 10, 'out', 2, NULL, NULL, '2026-07-23', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(377, 10, 'out', 3, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(378, 10, 'out', 2, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(379, 10, 'out', 1, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(380, 10, 'out', 5, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(381, 10, 'out', 5, NULL, NULL, '2026-07-18', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(382, 11, 'out', 5, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(383, 11, 'out', 5, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(384, 11, 'out', 1, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(385, 11, 'out', 3, NULL, NULL, '2026-07-23', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(386, 11, 'out', 5, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(387, 11, 'out', 5, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(388, 11, 'out', 2, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(389, 11, 'out', 2, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(390, 11, 'out', 1, NULL, NULL, '2026-07-16', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(391, 12, 'out', 5, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32');
INSERT INTO `transactions` (`id`, `product_id`, `type`, `quantity`, `transaction_unit`, `original_quantity`, `transaction_date`, `notes`, `created_at`, `updated_at`) VALUES
(392, 12, 'out', 4, NULL, NULL, '2026-07-28', 'Seeded transaction', '2026-07-28 19:07:32', '2026-07-28 19:07:32'),
(393, 12, 'out', 4, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(394, 12, 'out', 1, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(395, 12, 'out', 3, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(396, 12, 'out', 4, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(397, 12, 'out', 5, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(398, 12, 'out', 2, NULL, NULL, '2026-07-18', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(399, 12, 'out', 5, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(400, 13, 'out', 4, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(401, 13, 'out', 1, NULL, NULL, '2026-07-28', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(402, 13, 'out', 5, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(403, 13, 'out', 3, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(404, 13, 'out', 3, NULL, NULL, '2026-07-23', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(405, 13, 'out', 1, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(406, 13, 'out', 5, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(407, 13, 'out', 1, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(408, 14, 'out', 4, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(409, 14, 'out', 1, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(410, 14, 'out', 4, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(411, 14, 'out', 2, NULL, NULL, '2026-07-23', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(412, 14, 'out', 4, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(413, 14, 'out', 1, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(414, 14, 'out', 5, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(415, 14, 'out', 2, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(416, 14, 'out', 2, NULL, NULL, '2026-07-16', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(417, 15, 'out', 4, NULL, NULL, '2026-07-28', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(418, 15, 'out', 4, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(419, 15, 'out', 2, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(420, 15, 'out', 2, NULL, NULL, '2026-07-25', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(421, 15, 'out', 1, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(422, 15, 'out', 3, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(423, 15, 'out', 2, NULL, NULL, '2026-07-18', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(424, 15, 'out', 5, NULL, NULL, '2026-07-16', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(425, 16, 'out', 5, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(426, 16, 'out', 3, NULL, NULL, '2026-07-25', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(427, 16, 'out', 1, NULL, NULL, '2026-07-23', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(428, 16, 'out', 2, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(429, 16, 'out', 3, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(430, 16, 'out', 4, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(431, 16, 'out', 1, NULL, NULL, '2026-07-18', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(432, 16, 'out', 4, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(433, 17, 'out', 2, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(434, 17, 'out', 4, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(435, 17, 'out', 5, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(436, 17, 'out', 2, NULL, NULL, '2026-07-25', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(437, 17, 'out', 2, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(438, 17, 'out', 1, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(439, 17, 'out', 3, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(440, 17, 'out', 5, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(441, 17, 'out', 5, NULL, NULL, '2026-07-16', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(442, 18, 'out', 4, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(443, 18, 'out', 3, NULL, NULL, '2026-07-28', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(444, 18, 'out', 4, NULL, NULL, '2026-07-25', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(445, 18, 'out', 1, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(446, 18, 'out', 2, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(447, 18, 'out', 5, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(448, 18, 'out', 2, NULL, NULL, '2026-07-16', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(449, 19, 'out', 2, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(450, 19, 'out', 1, NULL, NULL, '2026-07-28', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(451, 19, 'out', 2, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(452, 19, 'out', 2, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(453, 19, 'out', 2, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(454, 19, 'out', 3, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(455, 19, 'out', 5, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(456, 19, 'out', 4, NULL, NULL, '2026-07-16', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(457, 20, 'out', 2, NULL, NULL, '2026-07-25', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(458, 20, 'out', 5, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(459, 20, 'out', 1, NULL, NULL, '2026-07-23', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(460, 20, 'out', 4, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(461, 20, 'out', 3, NULL, NULL, '2026-07-16', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(462, 21, 'out', 5, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(463, 21, 'out', 5, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(464, 21, 'out', 4, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(465, 21, 'out', 1, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(466, 21, 'out', 4, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(467, 21, 'out', 4, NULL, NULL, '2026-07-18', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(468, 21, 'out', 3, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(469, 22, 'out', 1, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(470, 22, 'out', 5, NULL, NULL, '2026-07-25', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(471, 22, 'out', 4, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(472, 22, 'out', 4, NULL, NULL, '2026-07-23', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(473, 22, 'out', 3, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(474, 22, 'out', 4, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(475, 22, 'out', 4, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(476, 22, 'out', 5, NULL, NULL, '2026-07-18', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(477, 22, 'out', 2, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(478, 23, 'out', 5, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(479, 23, 'out', 3, NULL, NULL, '2026-07-28', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(480, 23, 'out', 5, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(481, 23, 'out', 4, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(482, 23, 'out', 4, NULL, NULL, '2026-07-23', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(483, 23, 'out', 2, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(484, 24, 'out', 5, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(485, 24, 'out', 5, NULL, NULL, '2026-07-28', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(486, 24, 'out', 2, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(487, 24, 'out', 3, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(488, 24, 'out', 1, NULL, NULL, '2026-07-25', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(489, 24, 'out', 2, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(490, 24, 'out', 2, NULL, NULL, '2026-07-23', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(491, 24, 'out', 4, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(492, 24, 'out', 5, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(493, 24, 'out', 2, NULL, NULL, '2026-07-16', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(494, 25, 'out', 1, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(495, 25, 'out', 5, NULL, NULL, '2026-07-28', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(496, 25, 'out', 4, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(497, 25, 'out', 4, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(498, 25, 'out', 4, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(499, 25, 'out', 2, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(500, 26, 'out', 1, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(501, 26, 'out', 4, NULL, NULL, '2026-07-25', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(502, 26, 'out', 2, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(503, 26, 'out', 4, NULL, NULL, '2026-07-23', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(504, 26, 'out', 2, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(505, 26, 'out', 4, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(506, 26, 'out', 1, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(507, 26, 'out', 4, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(508, 26, 'out', 4, NULL, NULL, '2026-07-18', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(509, 26, 'out', 4, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(510, 26, 'out', 3, NULL, NULL, '2026-07-16', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(511, 27, 'out', 1, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(512, 27, 'out', 3, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(513, 27, 'out', 4, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(514, 27, 'out', 5, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(515, 27, 'out', 5, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(516, 27, 'out', 3, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(517, 27, 'out', 5, NULL, NULL, '2026-07-18', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(518, 27, 'out', 3, NULL, NULL, '2026-07-16', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(519, 28, 'out', 5, NULL, NULL, '2026-07-28', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(520, 28, 'out', 1, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(521, 28, 'out', 2, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(522, 28, 'out', 1, NULL, NULL, '2026-07-25', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(523, 28, 'out', 5, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(524, 28, 'out', 2, NULL, NULL, '2026-07-22', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(525, 28, 'out', 3, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(526, 28, 'out', 4, NULL, NULL, '2026-07-20', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(527, 28, 'out', 3, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(528, 28, 'out', 2, NULL, NULL, '2026-07-16', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(529, 29, 'out', 3, NULL, NULL, '2026-07-29', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(530, 29, 'out', 2, NULL, NULL, '2026-07-28', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(531, 29, 'out', 3, NULL, NULL, '2026-07-27', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(532, 29, 'out', 3, NULL, NULL, '2026-07-26', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(533, 29, 'out', 3, NULL, NULL, '2026-07-24', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(534, 29, 'out', 3, NULL, NULL, '2026-07-21', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(535, 29, 'out', 3, NULL, NULL, '2026-07-19', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(536, 29, 'out', 3, NULL, NULL, '2026-07-18', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33'),
(537, 29, 'out', 2, NULL, NULL, '2026-07-17', 'Seeded transaction', '2026-07-28 19:07:33', '2026-07-28 19:07:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'admin',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin Mo Gerzz', 'admin@mogerzz.com', NULL, '$2y$12$dFDcVcOmBvliTiC8QR.bTOCw6U9DHXTfaLEAsvrBaAZZ94EKEy9je', 'admin', NULL, '2026-07-24 23:36:15', '2026-07-28 19:07:31'),
(2, 'Owner Mo Gerzz', 'owner@mogerzz.com', NULL, '$2y$12$gSD0ujb5l6a.OrueveOOfuZa1On5dtkuVDKy7/PqG.b99LVntQOKq', 'owner', NULL, '2026-07-27 06:48:30', '2026-07-28 19:07:32');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_code_unique` (`code`),
  ADD KEY `products_supplier_id_foreign` (`supplier_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=538;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
