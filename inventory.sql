-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2023 at 02:38 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` int(11) NOT NULL,
  `supplier` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `quantity_ordered` int(11) DEFAULT NULL,
  `quantity_received` int(11) DEFAULT NULL,
  `quantity_remaining` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `batch` int(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `requested_by` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `supplier`, `product`, `quantity_ordered`, `quantity_received`, `quantity_remaining`, `status`, `batch`, `created_by`, `requested_by`, `created_at`, `updated_at`) VALUES
(25, 7, 33, 32, 9, 23, 'incomplete', 1682655197, 31, '', '2023-04-28 06:13:17', '2023-04-28 06:13:17'),
(26, 7, 32, 12, 6, 6, 'incomplete', 1682655207, 31, '', '2023-04-28 06:13:27', '2023-04-28 06:13:27'),
(27, 8, 32, 32, 8, 24, 'incomplete', 1682655207, 31, '', '2023-04-28 06:13:27', '2023-04-28 06:13:27'),
(28, 8, 31, 143, 143, 0, 'complete', 1682656750, 31, '', '2023-04-28 06:39:10', '2023-04-28 06:39:10'),
(29, 8, 37, 0, NULL, NULL, 'pending', 1700628019, 31, '', '2023-11-22 05:40:19', '2023-11-22 05:40:19'),
(30, 8, 36, 32, NULL, NULL, 'pending', 1700628080, 31, '', '2023-11-22 05:41:20', '2023-11-22 05:41:20'),
(31, 8, 36, 32, NULL, NULL, 'pending', 1700628601, 31, 'Test 1', '2023-11-22 05:50:01', '2023-11-22 05:50:01'),
(32, 7, 32, 322, NULL, NULL, 'pending', 1700628601, 31, 'Test 2', '2023-11-22 05:50:01', '2023-11-22 05:50:01'),
(33, 8, 32, 12, NULL, NULL, 'pending', 1700628601, 31, 'Test 2', '2023-11-22 05:50:01', '2023-11-22 05:50:01'),
(34, 8, 35, 32, 52, -20, 'complete', 1700711098, 31, 'Angelo', '2023-11-23 04:44:58', '2023-11-23 04:44:58'),
(35, 8, 36, 32, 32, 0, 'complete', 1701517119, 31, '', '2023-12-02 12:38:39', '2023-12-02 12:38:39'),
(36, 8, 37, 23, 23, 0, 'complete', 1701517119, 31, '', '2023-12-02 12:38:39', '2023-12-02 12:38:39');

-- --------------------------------------------------------

--
-- Table structure for table `order_product_history`
--

CREATE TABLE `order_product_history` (
  `id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `qty_received` int(11) NOT NULL,
  `date_received` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_product_history`
--

INSERT INTO `order_product_history` (`id`, `order_product_id`, `qty_received`, `date_received`, `date_updated`) VALUES
(21, 26, 2, '2023-04-27 06:13:56', '2023-04-27 06:13:56'),
(22, 27, 4, '2023-04-27 06:13:56', '2023-04-27 06:13:56'),
(23, 25, 2, '2023-04-26 06:14:13', '2023-04-26 06:14:13'),
(24, 26, 4, '2023-04-28 06:14:51', '2023-04-28 06:14:51'),
(25, 27, 4, '2023-04-25 06:14:51', '2023-04-25 06:14:51'),
(26, 25, 4, '2023-04-28 06:15:16', '2023-04-28 06:15:16'),
(27, 25, 3, '2023-04-28 06:15:22', '2023-04-28 06:15:22'),
(28, 28, 143, '2023-04-28 06:39:29', '2023-04-28 06:39:29'),
(29, 36, 23, '2023-12-02 12:38:57', '2023-12-02 12:38:57'),
(30, 35, 32, '2023-12-02 12:38:57', '2023-12-02 12:38:57'),
(31, 34, 52, '2023-12-02 14:32:00', '2023-12-02 14:32:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(191) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `description`, `img`, `price`, `stock`, `created_by`, `created_at`, `updated_at`) VALUES
(31, 'Milo', 'This is an energy drink											\r\n										', 'product-1682655126.png', '32.00', 0, 31, '2023-04-28 06:12:06', '2023-04-28 06:12:06'),
(32, 'Kitkat', 'This is a chocolate', 'product-1682655158.png', '12.50', 1, 31, '2023-04-28 06:12:38', '2023-04-28 06:12:38'),
(33, 'Nescafe2', '  This is a coffee bean											<br />										', 'product-1682656653.png', '3.25', 4, 31, '2023-04-28 06:12:59', '2023-04-28 06:12:59'),
(35, 'Kopiko', 'Brown Cofee is real											\r\n										', 'product-1700326972.png', '5.00', 52, 31, '2023-11-18 18:02:52', '2023-11-18 18:02:52'),
(36, 'Nike Bag', '  This is a nike bag.											<br />										', 'product-1700327171.png', '21.00', 0, 31, '2023-11-18 18:05:19', '2023-11-18 18:05:19'),
(37, 'Ring', 'this is a ring											\r\n										', 'product-1700327185.png', '32.00', 23, 31, '2023-11-18 18:06:25', '2023-11-18 18:06:25');

-- --------------------------------------------------------

--
-- Table structure for table `productsuppliers`
--

CREATE TABLE `productsuppliers` (
  `id` int(11) NOT NULL,
  `supplier` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productsuppliers`
--

INSERT INTO `productsuppliers` (`id`, `supplier`, `product`, `updated_at`, `created_at`) VALUES
(40, 8, 31, '2023-04-28 06:12:06', '2023-04-28 06:12:06'),
(41, 8, 32, '2023-04-28 06:12:38', '2023-04-28 06:12:38'),
(42, 7, 32, '2023-04-28 06:12:38', '2023-04-28 06:12:38'),
(45, 7, 33, '2023-04-28 06:37:33', '2023-04-28 06:37:33'),
(47, 8, 35, '2023-11-18 18:02:52', '2023-11-18 18:02:52'),
(50, 8, 36, '2023-11-18 18:06:11', '2023-11-18 18:06:11'),
(51, 8, 37, '2023-11-18 18:06:25', '2023-11-18 18:06:25');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `requested_by` varchar(150) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `requested_by`, `product_id`, `quantity`, `date`, `updated_at`, `created_at`) VALUES
(7, 'Test', 36, 3, '2023-12-06', '2023-12-02 11:35:11', '2023-12-02 11:35:11'),
(8, 'Jane', 33, 2, '2023-12-28', '2023-12-02 11:41:53', '2023-12-02 11:41:53'),
(9, 'Kitkat', 32, 3, '2023-12-14', '2023-12-02 12:31:07', '2023-12-02 12:31:07'),
(10, 'John Doe', 36, 32, '2023-12-30', '2023-12-02 14:21:32', '2023-12-02 14:21:32');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `supplier_name` varchar(191) NOT NULL,
  `supplier_location` varchar(191) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplier_name`, `supplier_location`, `email`, `created_by`, `created_at`, `updated_at`) VALUES
(7, 'Nestle', 'United States', 'supplier@nestle.com', 31, '2023-04-28 06:10:39', '2023-04-28 06:10:39'),
(8, 'Robinson', 'United Kingdom', 'supplier@robinson.com', 31, '2023-04-28 06:11:29', '2023-04-28 06:11:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(2000) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `password`, `email`, `created_at`, `updated_at`) VALUES
(31, 'John2', 'Doe2', '$2y$10$cjv7hqlOlwjs7xGpxZmm/e3LXqokrY4wexxQt0nVIfzP6q0X3UGKG', 'johndoe@yahoo.com', '2023-04-28 06:05:49', '2023-04-28 06:40:21'),
(33, 'Jan', 'Tan', '$2y$10$2KSKRzDp1SEMf4q01ISIK.SlJRQ8DHlAxw29sy0vaC4Y9.Y3WOSc.', 'janjantandayag123@gmail.com', '2023-11-08 12:05:34', '2023-11-08 12:05:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier` (`supplier`),
  ADD KEY `product` (`product`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `order_product_history`
--
ALTER TABLE `order_product_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_id` (`order_product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`created_by`);

--
-- Indexes for table `productsuppliers`
--
ALTER TABLE `productsuppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product` (`product`),
  ADD KEY `supplier` (`supplier`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_created_by` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `order_product_history`
--
ALTER TABLE `order_product_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `productsuppliers`
--
ALTER TABLE `productsuppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`supplier`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_product_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_product_history`
--
ALTER TABLE `order_product_history`
  ADD CONSTRAINT `order_product_history_ibfk_1` FOREIGN KEY (`order_product_id`) REFERENCES `order_product` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `productsuppliers`
--
ALTER TABLE `productsuppliers`
  ADD CONSTRAINT `productsuppliers_ibfk_1` FOREIGN KEY (`product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `productsuppliers_ibfk_2` FOREIGN KEY (`supplier`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
