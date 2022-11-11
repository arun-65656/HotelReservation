-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2022 at 05:38 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_reservation`
--
CREATE DATABASE IF NOT EXISTS `hotel_reservation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hotel_reservation`;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customerid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerid`, `name`, `email`, `phone`, `password`) VALUES
(2, 'Paul Levesque', 'paul.l@gamil.com', '8546917355', '753951');

-- --------------------------------------------------------

--
-- Table structure for table `hotelreservationdetail`
--

DROP TABLE IF EXISTS `hotelreservationdetail`;
CREATE TABLE IF NOT EXISTS `hotelreservationdetail` (
  `ReservationId` int(11) NOT NULL AUTO_INCREMENT,
  `HotelId` int(11) NOT NULL,
  `CheckIn` date DEFAULT curdate(),
  `CheckOut` date DEFAULT curdate(),
  `Amount` decimal(10,2) DEFAULT 0.00,
  `billstatus` varchar(50) DEFAULT 'NOT PAID',
  PRIMARY KEY (`ReservationId`),
  KEY `fk1` (`HotelId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotelreservationdetail`
--

INSERT INTO `hotelreservationdetail` (`ReservationId`, `HotelId`, `CheckIn`, `CheckOut`, `Amount`, `billstatus`) VALUES
(2, 4, '2022-11-15', '2021-11-18', '6600.00', 'PAID');

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
CREATE TABLE IF NOT EXISTS `hotels` (
  `HotelId` int(11) NOT NULL AUTO_INCREMENT,
  `HotelsId` int(11) NOT NULL,
  `HotelName` varchar(100) NOT NULL,
  `RoomTyoe` varchar(100) NOT NULL,
  `Amount` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`HotelId`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`HotelId`, `HotelsId`, `HotelName`, `RoomTyoe`, `Amount`) VALUES
(1, 1, 'OYO 92129 Hotel S K Palace', 'Double Room', '1500.00'),
(2, 1, 'OYO 92129 Hotel S K Palace', 'Deluxe Triple Room', '2500.00'),
(3, 1, 'OYO 92129 Hotel S K Palace', 'Standard Double Room', '1600.00'),
(4, 1, 'OYO 92129 Hotel S K Palace', 'Deluxe Room', '2200.00'),
(5, 1, 'OYO 92129 Hotel S K Palace', 'Classic Triple Room', '1700.00'),
(6, 1, 'OYO 92129 Hotel S K Palace', 'Small Twin Room', '1300.00'),
(7, 1, 'OYO 92129 Hotel S K Palace', 'Standard Double or Twin Room', '1550.00'),
(8, 2, 'Hotel Palm Beach Pride', 'Double Room', '1600.00'),
(9, 2, 'Hotel Palm Beach Pride', 'Deluxe Triple Room', '1650.00'),
(10, 2, 'Hotel Palm Beach Pride', 'Standard Double Room', '1700.00'),
(11, 2, 'Hotel Palm Beach Pride', 'Deluxe Room', '2000.00'),
(12, 2, 'Hotel Palm Beach Pride', 'Classic Triple Room', '1500.00'),
(13, 2, 'Hotel Palm Beach Pride', 'Small Twin Room', '1550.00'),
(14, 2, 'Hotel Palm Beach Pride', 'Standard Double or Twin Room', '2000.00'),
(15, 3, 'Ramee Guestline Hotel Dadar', 'Double Room', '1600.00'),
(16, 3, 'Ramee Guestline Hotel Dadar', 'Deluxe Triple Room', '1450.00'),
(17, 3, 'Ramee Guestline Hotel Dadar', 'Standard Double Room', '1550.00'),
(18, 3, 'Ramee Guestline Hotel Dadar', 'Deluxe Room', '1500.00'),
(19, 3, 'Ramee Guestline Hotel Dadar', 'Classic Triple Room', '1200.00'),
(20, 3, 'Ramee Guestline Hotel Dadar', 'Small Twin Room', '2000.00'),
(21, 3, 'Ramee Guestline Hotel Dadar', 'Standard Double or Twin Room', '1250.00'),
(22, 4, 'Hotel Orritel West', 'Double Room', '1546.00'),
(23, 4, 'Hotel Orritel West', 'Deluxe Triple Room', '1560.00'),
(24, 4, 'Hotel Orritel West', 'Standard Double Room', '1245.00'),
(25, 4, 'Hotel Orritel West', 'Deluxe Room', '1500.00'),
(26, 4, 'Hotel Orritel West', 'Classic Triple Room', '2500.00'),
(27, 4, 'Hotel Orritel West', 'Small Twin Room', '1250.00'),
(28, 4, 'Hotel Orritel West', 'Standard Double or Twin Room', '2000.00'),
(29, 5, 'Mumbai House Luxury Apartments Santacruz East, Mumbai', 'Double Room', '1450.00'),
(30, 5, 'Mumbai House Luxury Apartments Santacruz East, Mumbai', 'Deluxe Triple Room', '1650.00'),
(31, 5, 'Mumbai House Luxury Apartments Santacruz East, Mumbai', 'Standard Double Room', '1450.00'),
(32, 5, 'Mumbai House Luxury Apartments Santacruz East, Mumbai', 'Deluxe Room', '1500.00'),
(33, 5, 'Mumbai House Luxury Apartments Santacruz East, Mumbai', 'Classic Triple Room', '1450.00'),
(34, 5, 'Mumbai House Luxury Apartments Santacruz East, Mumbai', 'Small Twin Room', '1650.00'),
(35, 5, 'Mumbai House Luxury Apartments Santacruz East, Mumbai', 'Standard Double or Twin Room', '1800.00'),
(36, 6, 'HOTEL ADARSH BAUG', 'Double Room', '1250.00'),
(37, 6, 'HOTEL ADARSH BAUG', 'Deluxe Triple Room', '1650.00'),
(38, 6, 'HOTEL ADARSH BAUG', 'Standard Double Room', '1700.00'),
(39, 6, 'HOTEL ADARSH BAUG', 'Deluxe Room', '1650.00'),
(40, 6, 'HOTEL ADARSH BAUG', 'Classic Triple Room', '1250.00'),
(41, 6, 'HOTEL ADARSH BAUG', 'Small Twin Room', '1500.00'),
(42, 6, 'HOTEL ADARSH BAUG', 'Standard Double or Twin Room', '2000.00'),
(43, 7, 'Hotel Leafio Marigold-Near Airport', 'Double Room', '1560.00'),
(44, 7, 'Hotel Leafio Marigold-Near Airport', 'Deluxe Triple Room', '1800.00'),
(45, 7, 'Hotel Leafio Marigold-Near Airport', 'Standard Double Room', '1650.00'),
(46, 7, 'Hotel Leafio Marigold-Near Airport', 'Deluxe Room', '1250.00'),
(47, 7, 'Hotel Leafio Marigold-Near Airport', 'Classic Triple Room', '1230.00'),
(48, 7, 'Hotel Leafio Marigold-Near Airport', 'Small Twin Room', '1230.00'),
(49, 7, 'Hotel Leafio Marigold-Near Airport', 'Standard Double or Twin Room', '2000.00'),
(50, 8, 'WishTree Apartment kalina Bkc', 'Double Room', '1600.00'),
(51, 8, 'WishTree Apartment kalina Bkc', 'Deluxe Triple Room', '1500.00'),
(52, 8, 'WishTree Apartment kalina Bkc', 'Standard Double Room', '1230.00'),
(53, 8, 'WishTree Apartment kalina Bkc', 'Deluxe Room', '1230.00'),
(54, 8, 'WishTree Apartment kalina Bkc', 'Classic Triple Room', '1650.00'),
(55, 8, 'WishTree Apartment kalina Bkc', 'Small Twin Room', '1840.00'),
(56, 8, 'WishTree Apartment kalina Bkc', 'Standard Double or Twin Room', '1520.00'),
(57, 9, 'InterContinental Marine Drive Mumbai, an IHG Hotel', 'Double Room', '1650.00'),
(58, 9, 'InterContinental Marine Drive Mumbai, an IHG Hotel', 'Deluxe Triple Room', '1200.00'),
(59, 9, 'InterContinental Marine Drive Mumbai, an IHG Hotel', 'Standard Double Room', '1450.00'),
(60, 9, 'InterContinental Marine Drive Mumbai, an IHG Hotel', 'Deluxe Room', '1650.00'),
(61, 9, 'InterContinental Marine Drive Mumbai, an IHG Hotel', 'Classic Triple Room', '1450.00'),
(62, 9, 'InterContinental Marine Drive Mumbai, an IHG Hotel', 'Small Twin Room', '1650.00'),
(63, 9, 'InterContinental Marine Drive Mumbai, an IHG Hotel', 'Standard Double or Twin Room', '1650.00'),
(64, 10, 'ITC Grand Central, a Luxury Collection Hotel, Mumbai', 'Double Room', '1500.00'),
(65, 10, 'ITC Grand Central, a Luxury Collection Hotel, Mumbai', 'Deluxe Triple Room', '1520.00'),
(66, 10, 'ITC Grand Central, a Luxury Collection Hotel, Mumbai', 'Standard Double Room', '1580.00'),
(67, 10, 'ITC Grand Central, a Luxury Collection Hotel, Mumbai', 'Deluxe Room', '1650.00'),
(68, 10, 'ITC Grand Central, a Luxury Collection Hotel, Mumbai', 'Classic Triple Room', '2000.00'),
(69, 10, 'ITC Grand Central, a Luxury Collection Hotel, Mumbai', 'Small Twin Room', '1500.00'),
(70, 10, 'ITC Grand Central, a Luxury Collection Hotel, Mumbai', 'Standard Double or Twin Room', '2500.00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
