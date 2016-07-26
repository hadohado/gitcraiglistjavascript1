-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2016 at 11:31 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lamp_final_project`
--
CREATE DATABASE IF NOT EXISTS `lamp_final_project` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `lamp_final_project`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `Category_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` char(90) NOT NULL,
  PRIMARY KEY (`Category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `category`:
--

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_ID`, `CategoryName`) VALUES
(1, 'jobs'),
(2, 'housing'),
(3, 'for sale');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `Location_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Region_ID` int(11) NOT NULL,
  `LocationName` char(90) NOT NULL,
  PRIMARY KEY (`Location_ID`),
  KEY `Region_ID` (`Region_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `location`:
--   `Region_ID`
--       `region` -> `Region_ID`
--

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`Location_ID`, `Region_ID`, `LocationName`) VALUES
(1, 1, 'san francisco'),
(2, 1, 'LA'),
(3, 1, 'washington'),
(4, 2, 'paris'),
(5, 2, 'rome'),
(6, 2, 'london'),
(7, 3, 'saigon'),
(8, 3, 'tokyo'),
(9, 3, 'dehli');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `Post_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` char(90) NOT NULL,
  `Price` float DEFAULT NULL,
  `Description` text,
  `Email` char(90) DEFAULT NULL,
  `Agreement` tinyint(1) DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Image_1` text,
  `Image_2` text,
  `Image_3` text,
  `Image_4` text,
  `SubCategory_ID` int(11) DEFAULT NULL,
  `Location_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Post_ID`),
  KEY `SubCategory_ID` (`SubCategory_ID`),
  KEY `Location_ID` (`Location_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `posts`:
--   `Location_ID`
--       `location` -> `Location_ID`
--   `SubCategory_ID`
--       `subcategory` -> `SubCategory_ID`
--

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`Post_ID`, `Title`, `Price`, `Description`, `Email`, `Agreement`, `TimeStamp`, `Image_1`, `Image_2`, `Image_3`, `Image_4`, `SubCategory_ID`, `Location_ID`) VALUES
(63, 'director of engineering', 10000, 'The Director of Engineering will plan, direct and coordinate all aspects and activities of the SuperElectronics Engineering organization.\r\nYou will champion development of software products\r\nfor our proprietary cloud computing.', 'sw1@gmail.com', 1, '2016-04-11 11:10:10', '', '', '', '', 1, 4),
(64, 'Javascript software engineer', 8000, 'Modern Technology is seeking a highly motivated and dedicated engineer to help develop software for our IT group. Our software is based on Javascript, NodeJs and Mongo DB.', 'sw2@moderntech.com', 1, '2016-04-11 11:15:25', '', '', '', '', 1, 5),
(65, 'Android engineer', 9000, 'Need android engineer with 5 years of experience developing android applications. Must know design patterns, software testing. Languages: Java, C.', 'sw3@warrior.com', 1, '2016-04-11 11:22:03', '', '', '', '', 1, 6),
(66, 'accountant for construction company needed', 5000, 'Experienced accountant needed for Southeast asia construction company. Run daily operations, process monthly and year end process. Establish proper accounting methods.', 'ac1@goldengateconst.com', 1, '2016-04-11 11:54:01', '', '', '', '', 2, 7),
(67, 'senior financial analyst', 7000, 'Major company based in Tokyo needs a senior financial analyst.\r\nProvide ongoing analytical support to management including preparing forecasts, planning.', 'ac2@tokyotech.com', 1, '2016-04-11 11:58:29', '', '', '', '', 2, 8),
(68, 'account payable manager', 12000, 'City of Dehli is looking for experienced account payable manager. Reqires strong working knowledge of accounts payable cycle, internal control.', 'ac3@dehli.gov', 1, '2016-04-11 12:02:35', '', '', '', '', 2, 9),
(69, 'general manager', 20000, 'Professional property management company has opening for a general manager. Responsibilities include managing several departments.', 'busi1@property1.com', 1, '2016-04-11 12:07:47', '', '', '', '', 3, 1),
(70, 'business development manager', 9000, 'Mission Development Agency is seeking candidates to join our business development team. Our goal is to expand business planning for Mission area.', 'busi2@mission.com', 1, '2016-04-11 12:12:12', '', '', '', '', 3, 1),
(71, 'Account manager', 8000, 'UCSF is seeking account manager for our medical school. Need excellent financial and analytical skills, clinical practice management.', 'busi3@ucsf.edu', 1, '2016-04-11 12:17:24', '', '', '', '', 3, 1),
(72, 'modern office for lease', 2000, 'Modern office in downtown for lease. 1000 sqft. Wifi and fax machine available. Great for real estate agents.', 'off1@washingtoncommerce.com', 1, '2016-04-11 13:22:44', 'db7a3_office1.jpg', '', '', '', 5, 3),
(73, 'Professional office for rent', 2000, 'Profesional office on second floor of building in central area for rent. 10 x 20 sqft.', 'off2@sfmission.com', 1, '2016-04-11 13:26:35', '12c76_office2.jpg', '', '', '', 5, 1),
(74, 'Spacious office for lease', 2000, 'Large office in beautiful building for lease. Nearby shopping. Easy access to highway 880.', 'off3@arch.com', 1, '2016-04-11 13:31:20', '963e1_office3.jpg', '', '', '', 5, 1),
(75, 'beautiful house for vacation rental', 20000, 'Beautiful house with large pool for vacation rental.\r\n5000 sqft. 3 bdrm, 2 bath. Located close to the beach.', 'vaca1@malibu.com', 1, '2016-04-11 13:35:19', '837a1_vacationrent1.jpe', '', '', '', 6, 2),
(76, 'Vacation house next to the beach for rent', 18000, 'Nice house next to white sand beach for rent.\r\n2000 sqft, 3 bdrm, 2 bath. Close to Santa Monica.', 'vaca2@palmtree.com', 1, '2016-04-11 13:38:41', 'd86f9_vacationrent2.jpe', '', '', '', 6, 2),
(77, 'modern house next to beach for vacation rental', 8000, 'Modern house with infinity pool overlooking ocean for weekly / monthly rent. Very large 3000 sqft, 5 bdrm, 3 baths. Minutes walk to the beach.', 'vaca3@infinity.com', 1, '2016-04-11 13:41:35', 'e6221_vacationrent3.jpe', '', '', '', 6, 2),
(78, 'wedding ring', 8888, 'For sale: one of a kind blue diamond wedding ring.\r\n 3 carat.', 'je1@ring.com', 1, '2016-04-12 02:38:05', '34273_jewelry_ring1.jpe', '', '', '', 7, 1),
(79, 'ruby bracelet', 250, 'For sale: ruby bracelet from the far east.', 'je2@ruby.com', 1, '2016-04-12 02:40:15', '08151_jewelry_ruby_2.jpe', '', '', '', 7, 1),
(80, 'rolex watch', 7000, 'Authentic Rolex watch with certificate for sale.\r\nOyster Perpetual, silver.', 'je3@watch.com', 1, '2016-04-12 02:43:23', 'b3e9a_jewelry_watch_3.jpe', '', '', '', 7, 4),
(81, 'red lamp', 30, 'Beautiful red lamp for sale.\r\nModern with touch sensor, height is 25&quot;.', 'hh1@redlamp.com', 1, '2016-04-12 02:51:43', '7a935_household_lamp1.jpe', '', '', '', 8, 1),
(82, 'wine glass', 200, 'Set of 8 wine glasses with beach theme for sale.', 'hh2@glass.com', 1, '2016-04-12 03:06:31', 'ac058_household_wineclass2.jpg', '', '', '', 8, 8),
(83, 'table with chairs', 1000, 'Contemporary sand-color round table with chairs.', 'hh3@chair.com', 1, '2016-04-12 03:10:41', '91e7a_household_table3.jpe', '', '', '', 8, 1),
(84, 'labtop computer', 1700, 'For sale: Sony labtop 15 inch, brand new.\r\nI7 processor, 500 gigabyte hard disk.', 'student1@ucsc.com', 1, '2016-04-12 03:26:46', 'd540a_electronics_sony_laptop1.jpg', '', '', '', 9, 1),
(85, 'apple Iwatch', 200, 'Apple Iwatch with green band for sale.\r\nNew, never used.', 'el2@smartwatch.com', 1, '2016-04-12 03:55:11', '66121_electronics_iwatch2.jpe', '', '', '', 9, 1),
(86, 'Sony TV', 200, 'Sony flat screen TV for sale.\r\n40 inch, brand new.', 'el3@sony.com', 1, '2016-04-12 04:03:04', '62a62_electronics_TV3.jpg', '', '', '', 9, 8),
(87, 'adorable apartment in san francisco', 3800, 'modern aparttment 500 sqft, 3 bedrooms, 1 bath. pets ok', 'ap1@y.com', 1, '2016-04-12 04:10:10', '7fcd7_apartment1a.jpe', '01cd5_apartment1b.jpe', '3049b_apartment1c.jpe', '2f06f_apartment1d.jpe', 4, 1),
(88, 'beautiful 2-bedroom apartment', 1800, 'beautiful classic 2 bdrm 2 bath,\r\nmiddle unit, 1 garage,\r\nclose to park,\r\ncentral heating', 'ap2@y.com', 1, '2016-04-12 04:12:06', '3aec1_apartment2a.jpe', '041a7_apartment2b.jpe', 'a55ae_apartment2c.jpg', '7eab7_apartment2d.jpg', 4, 2),
(89, 'spacious 3 brdm apartment', 8000, 'spacious, modern 3 bdrm, 3 bath apartment modern kitchen, fireplace walk-in closet, security guard in building.\r\nDesirable neighborhood.', 'ap3@gmail.com', 1, '2016-04-12 04:14:03', 'a7176_apartment3a.jpe', 'cfb4d_apartment3b.jpe', 'a60c2_apartment3c.jpe', '2b4ba_apartment3d.jpe', 4, 3),
(90, 'almost send', 987, 'humonguous', 'almost@gold.com', 1, '2016-04-23 00:32:24', 'f515f_2016-02-02 (2).png', 'a86e7_jewelry_ruby_2.jpe', '93754_apartment3c.jpe', 'ef325_electronics_iwatch2.jpe', 6, 4),
(91, 'send NOW', 12, 'aaaaaa', 'oh@yes.com', 1, '2016-04-23 00:33:35', '0b299_jewelry_watch_3.jpe', '0e71c_office3.jpg', '5c2cd_household_lamp1.jpe', '7e594_household_wineclass2.jpg', 1, 1),
(92, 'mytitle7777777', NULL, NULL, 'myemail77777', NULL, '2016-06-27 06:51:30', NULL, NULL, NULL, NULL, NULL, NULL),
(126, 'suger', 222, 'spice', 'is@nice.com', 1, '2016-07-09 13:36:31', NULL, NULL, NULL, NULL, 3, 2),
(127, 'javascript', 87912, 'javascript should work here', 'java@you.com', 1, '2016-07-09 13:45:40', NULL, NULL, NULL, NULL, 9, 8),
(128, 'javascript', 87912, 'javascript should work here', 'java@you.com', 1, '2016-07-09 13:45:40', NULL, NULL, NULL, NULL, 9, 8),
(129, 'aws pict', 22, 'I am working on pushing picture to mysql database', 'a3@a.com', 1, '2016-07-26 04:34:29', NULL, NULL, NULL, NULL, 2, 2),
(139, 'iiiiiiiiii', 99, 'iiiiiiiiiiiiiiiiiii', 'a@a.com', 1, '2016-07-26 05:39:07', NULL, NULL, NULL, NULL, 5, 2),
(140, 'iiiiiiiiii', 99, 'iiiiiiiiiiiiiiiiiii', 'a@a.com', 1, '2016-07-26 05:39:07', NULL, NULL, NULL, NULL, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `Region_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RegionName` char(90) NOT NULL,
  PRIMARY KEY (`Region_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `region`:
--

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`Region_ID`, `RegionName`) VALUES
(1, 'usa'),
(2, 'europe'),
(3, 'asia');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
CREATE TABLE IF NOT EXISTS `subcategory` (
  `SubCategory_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Category_ID` int(11) NOT NULL,
  `SubCategroryName` char(90) NOT NULL,
  PRIMARY KEY (`SubCategory_ID`),
  KEY `Category_ID` (`Category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `subcategory`:
--   `Category_ID`
--       `category` -> `Category_ID`
--

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`SubCategory_ID`, `Category_ID`, `SubCategroryName`) VALUES
(1, 1, 'software'),
(2, 1, 'accounting'),
(3, 1, 'business'),
(4, 2, 'apartment'),
(5, 2, 'office'),
(6, 2, 'vacation rental'),
(7, 3, 'jewelry'),
(8, 3, 'household'),
(9, 3, 'electronics');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `ID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `user`:
--

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `username`, `password`, `email`) VALUES
(1, NULL, '4124bc0a9335c27f086f24ba207a4912', 'a@b.com'),
(2, NULL, '5634275d694f8665957746c9619132f0', 'almost@gold.com'),
(6, NULL, '24c9e15e52afc47c225b757e7bee1f9d', 'user1@company.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `fk_location_region_ID` FOREIGN KEY (`Region_ID`) REFERENCES `region` (`Region_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_locationID` FOREIGN KEY (`Location_ID`) REFERENCES `location` (`Location_ID`),
  ADD CONSTRAINT `fk_posts_subcatID` FOREIGN KEY (`SubCategory_ID`) REFERENCES `subcategory` (`SubCategory_ID`);

--
-- Constraints for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `fk_subcategory_category_ID` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
