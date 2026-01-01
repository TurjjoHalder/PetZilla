-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2024 at 08:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet_zilla`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `phone_no` varchar(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `unique_key` char(15) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`phone_no`, `email`, `unique_key`, `password`) VALUES
('00000000000', 'mridul@gmail.com', 'aaaa', '0000'),
('01856497305', 'turjo@gmail.com', 'qqqq', '1111');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `vet_id` int(11) DEFAULT NULL,
  `pet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `date`, `time`, `status`, `vet_id`, `pet_id`) VALUES
(1, '2024-12-01', '10:30:00', 'Scheduled', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `payment_method` enum('cash_on_delivery','bkash') NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--


-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--



-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

CREATE TABLE `pet` (
  `pet_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `breed` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `health_notes` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pet`
--

INSERT INTO `pet` (`pet_id`, `name`, `type`, `breed`, `age`, `health_notes`, `user_id`) VALUES
(1, 'Buddy', 'Dog', 'Labrador', 5, 'No known allergies', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) DEFAULT 0,
  `product_img` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `category`, `description`, `price`, `stock`, `product_img`) VALUES
(1, 'Winalot Shapes', 'food', '5 Wholesome buscuits', 28.56, 8, 'https://i.ibb.co.com/m5H2Tbr/images-6.jpg'),
(25, 'parle g biscuit', 'dog-food', 'very good', 5.60, 7, 'https://i.ibb.co/whL96zz/437eb8ec25b0.jpg'),
(26, 'Brew Biscuit', 'dog-food', 'good biscuits', 6.20, 5, 'https://i.ibb.co/YXbVDLr/2a558c4075f2.jpg'),
(27, 'Plastic Indur', 'cat-toy', 'Platicer khelna for your cat', 3.90, 7, 'https://i.ibb.co/BPp0TP6/95c1ffafd1b6.jpg'),
(28, 'Plastic Indur', 'cat-toy', 'Platicer khelna for your cat', 3.90, 7, 'https://i.ibb.co/rQNyd8G/54c7b5904e62.jpg'),
(29, 'plat Fish', 'cat-toy', 'Plastic cat toys', 4.15, 5, 'https://i.ibb.co/54T3rkL/bd3fb0415a9f.jpg'),
(30, 'Cat Star', 'cat-medicine', 'get medicine for cats good health', 45.00, 5, 'https://i.ibb.co/SR5fKKD/e3fc69104223.jpg'),
(31, 'Revolution Plus', 'cat-medicine', 'selami pin and Sarolina Topical Solutions', 34.00, 7, 'https://i.ibb.co/1sQNqvm/8418626a39a2.jpg'),
(33, 'Feverin-P', 'cat-medicine', 'fever in P for cats fever', 13.00, 5, 'https://i.ibb.co/wMrgJ1X/56f133d6aa84.jpg'),
(34, 'Nose reliefer', 'cat-medicine', 'gentle and natural support for healthy national and sinus tract', 13.00, 6, 'https://i.ibb.co/QQPH9TH/b73a772c13b2.jpg'),
(35, 'pyleot power', 'dog-medicine', 'pilot bar fix your dog\'s new vision for your dog', 14.00, 6, 'https://i.ibb.co/yXKWZVB/84072cfafd6e.jpg'),
(36, 'himalaya liv .52', 'cat-medicine', 'PBD Himalaya lead 52 pet liquid 200ML', 29.95, 10, 'https://i.ibb.co/smh9Nmm/1f11f4106426.png'),
(37, 'smoothies golf', 'cat-medicine', 'top **** **** smoothies **** and throat', 34.00, 5, 'https://i.ibb.co/Nshbt0r/5759e229c63c.jpg'),
(38, 'Defender Pro', 'dog-medicine', 'defender pro for your dog', 23.00, 34, 'https://i.ibb.co/qFCBLZy/9a4579d42e37.jpg'),
(39, 'Digyton syrup', 'cat-medicine', 'Himalaya digiton syrup works for your cat and dog to keep their health good', 24.00, 7, 'https://i.ibb.co/pj5XBzH/2226cb1aafc8.jpg'),
(40, 'parle g biscuit', 'cat-medicine', 'gsgfdf', 67.00, 7, 'https://i.ibb.co.com/6tqjHJ1/c8d10bef137d.webp'),
(41, 'Bright Blends', 'bird-food', 'Bright blends bird food', 25.05, 6, 'https://i.ibb.co/b1HvfqJ/1c28fcab8bcd.jpg'),
(42, 'Pnnnigton', 'bird-food', 'Classic willd feed', 35.05, 9, 'https://i.ibb.co/V9SfdSk/1a6e2cf7fd4a.jpg'),
(43, 'Bright Blends', 'bird-food', 'tttt', 78.10, 5, 'https://i.ibb.co/0Zx9nNZ/4ce5d68e2e0a.jpg'),
(45, 'parle g biscuit', 'cat-food', 'dsfdsfd', 4.05, 15, 'https://i.ibb.co/RzyVhVM/46edf76a6977.webp'),
(46, 'parle g biscuit', 'cat-food', 'dsfdsfd', 4.05, 15, 'https://i.ibb.co/RzyVhVM/46edf76a6977.webp'),
(47, 'parle g biscuit', 'cat-food', 'dfgfd', 0.25, 15, 'https://i.ibb.co/gZ7LRX6/96e471ea8112.jpg'),
(48, 'parle g biscuit', 'cat-food', 'dfgfd', 0.25, 15, 'https://i.ibb.co/gZ7LRX6/96e471ea8112.jpg'),
(49, 'parle g biscuit', 'cat-food', 'afsd', 43.05, 15, 'https://i.ibb.co/WgKsnRC/d6babe3c8a41.jpg'),
(50, 'parle g biscuit3', 'dog-food', '3dss', 3.05, 15, 'https://i.ibb.co/YPk6Xd3/60a863ed5e8b.webp'),
(51, 'parle g biscuit3', 'dog-food', '3dss', 3.05, 15, 'https://i.ibb.co/YPk6Xd3/60a863ed5e8b.webp'),
(52, 'parle g biscuit', 'dog-food', 'xzvcx', 4.05, 7, 'https://i.ibb.co/bFfbvKy/9f495c6c3dcf.jpg'),
(53, 'parle g biscuit', 'dog-food', 'xzvcx', 4.05, 7, 'https://i.ibb.co/bFfbvKy/9f495c6c3dcf.jpg'),
(54, 'parle g biscuit', 'dog-food', 'sdsd', 0.15, 15, 'https://i.ibb.co/2kSDqgC/571a7a8d4da6.jpg'),
(55, 'parle g biscuit', 'cat-food', 'sdsd', 0.15, 15, 'https://i.ibb.co/n8zBm1P/9004c2bb86d0.jpg'),
(56, 'parle g biscuit', 'cat-food', 'sdsd', 0.15, 15, 'https://i.ibb.co/58JYCN0/a0c4146f2d58.jpg'),
(57, 'kjkj', 'dog-medicine', 'knrdkfnr', 44.80, 5, 'https://i.ibb.co/Ph9jXfL/5a37bd715ed4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--



-- --------------------------------------------------------

--
-- Table structure for table `veterinarian`
--

CREATE TABLE `veterinarian` (
  `vet_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `specialty` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `veterinarian`
--

INSERT INTO `veterinarian` (`vet_id`, `name`, `specialty`, `phone`, `address`, `email`) VALUES
(1, 'Dr. Smith', 'Canine Specialist', '9876543210', '456 Vet Road', 'dr.smith@vetclinic.com');