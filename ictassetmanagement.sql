-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2024 at 11:32 AM
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
-- Database: `ictassetmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetregistration`
--

CREATE TABLE `assetregistration` (
  `asset_id` int(11) NOT NULL,
  `asset_type` varchar(50) DEFAULT NULL,
  `asset_name` varchar(255) DEFAULT NULL,
  `asset_description` text DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assetregistration`
--

INSERT INTO `assetregistration` (`asset_id`, `asset_type`, `asset_name`, `asset_description`, `serial_number`, `purchase_date`) VALUES
(1, 'hardware', 'Laptop', 'hp Elitebook', '0015', '2024-07-24'),
(2, 'hardware', 'Laptop', 'lenovo', '0015', '2024-06-24'),
(3, 'peripherals', 'ethernet', '20m', '000013', '2024-05-20'),
(4, 'software', 'window package', 'Window 11', '000123', '2024-07-06');

-- --------------------------------------------------------

--
-- Table structure for table `maintenancescheduling`
--

CREATE TABLE `maintenancescheduling` (
  `maintenance_id` int(11) NOT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `maintenance_date` date DEFAULT NULL,
  `maintenance_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maintenancescheduling`
--

INSERT INTO `maintenancescheduling` (`maintenance_id`, `asset_id`, `maintenance_date`, `maintenance_details`) VALUES
(3, 1, '2024-07-24', 'Lenovo ,maintainace'),
(4, 1, '2024-06-24', 'Windows stored'),
(5, 1, '2024-06-24', 'Windows stored'),
(6, 2, '2024-07-26', 'window crush');

-- --------------------------------------------------------

--
-- Table structure for table `usermanagement`
--

CREATE TABLE `usermanagement` (
  `user_id` int(11) NOT NULL,
  `user_role` varchar(50) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usermanagement`
--

INSERT INTO `usermanagement` (`user_id`, `user_role`, `username`, `password`) VALUES
(1, 'admin', 'kyle2030', '$2y$10$/q1eE1G.MLas8YqwpwjS9e2qXsa8re6lMfnkGp/XVxFxNapMF0y.e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetregistration`
--
ALTER TABLE `assetregistration`
  ADD PRIMARY KEY (`asset_id`);

--
-- Indexes for table `maintenancescheduling`
--
ALTER TABLE `maintenancescheduling`
  ADD PRIMARY KEY (`maintenance_id`),
  ADD KEY `asset_id` (`asset_id`);

--
-- Indexes for table `usermanagement`
--
ALTER TABLE `usermanagement`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetregistration`
--
ALTER TABLE `assetregistration`
  MODIFY `asset_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `maintenancescheduling`
--
ALTER TABLE `maintenancescheduling`
  MODIFY `maintenance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `usermanagement`
--
ALTER TABLE `usermanagement`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `maintenancescheduling`
--
ALTER TABLE `maintenancescheduling`
  ADD CONSTRAINT `maintenancescheduling_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `assetregistration` (`asset_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
