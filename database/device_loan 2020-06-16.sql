-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2020 at 09:38 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `device_loan`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'ronie', 'ronie');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `brand` varchar(64) NOT NULL,
  `model` varchar(256) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `brand`, `model`, `price`, `deleted`) VALUES
(1, 'ACER', 'TRAVELMATE TMB118-M-C3ME', '16500.00', 0),
(2, 'ACER', 'TRAVELMATE TMP2410-G2-M-380L', '23800.00', 0),
(3, 'ASD', '34234', '32342342.00', 1),
(4, 'ACER', 'ASPIRE 5 A514-52K-3472', '27499.00', 0),
(5, 'ACER', 'TRAVELMATE TMP249-G3-M-38PF', '27680.00', 0),
(6, 'ACER', 'ASPIRE 5 A514-52KG-339Z ', '30499.00', 0),
(7, 'ACER', 'ASPIRE 3 A315-55G-76YB', '47999.00', 0),
(8, 'ACER', 'TRAVELMATE TMP215-52G-729R', '50000.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(64) NOT NULL,
  `full_name` varchar(64) NOT NULL,
  `device_id` int(11) NOT NULL,
  `months` int(3) NOT NULL,
  `application_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `class` varchar(12) NOT NULL,
  `application_id` int(11) NOT NULL,
  `payment` int(12) NOT NULL,
  `payment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `student_id` varchar(64) NOT NULL,
  `full_name` varchar(128) NOT NULL,
  `device_id` int(11) NOT NULL,
  `level` varchar(128) NOT NULL,
  `months` int(2) NOT NULL,
  `application_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `student_id`, `full_name`, `device_id`, `level`, `months`, `application_date`) VALUES
(4, '1', 'Emannuel Joy Taruc', 6, 'basic_education', 10, '2020-06-16'),
(5, '010170018', 'Saskhea Fiona G. Mengote', 4, 'basic_education', 10, '2020-06-16'),
(6, '011901556', 'Brince T. Pakingking', 6, 'basic_education', 10, '2020-06-16'),
(7, '010150089', 'Nathania S. Zabala', 4, 'basic_education', 10, '2020-06-16'),
(8, '011529336', 'Kneiwghkcole Redd Marquez', 5, 'basic_education', 10, '2020-06-16'),
(9, '010150010', 'Knewelle Purple Marquez', 8, 'basic_education', 10, '2020-06-16'),
(10, '7', 'Aiden Cyle A. De Jesus', 4, 'basic_education', 10, '2020-06-16'),
(11, '010180165', 'Rolie Jr. D. Cayabyab', 4, 'basic_education', 10, '2020-06-16'),
(12, '0120200151', 'Max Owen Gomez', 4, 'basic_education', 10, '2020-06-16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_id` (`device_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_id` (`device_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
