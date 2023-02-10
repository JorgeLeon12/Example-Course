-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2023 at 08:54 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `course_students`
--

CREATE TABLE `course_students` (
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `course_students`
--

INSERT INTO `course_students` (`student_id`, `first_name`, `last_name`, `email`) VALUES
(1605031215599, 'Naomi', 'Ferguson', 'euismod.mauris@vulputateeu.net'),
(1605092601799, 'Melvin', 'Levine', 'libero@ultricessitamet.co.uk'),
(1607102510699, 'Amal', 'Cervantes', 'aliquet@in.co.uk'),
(1609062069499, 'Wayne', 'Pennington', 'bibendum@metus.com'),
(1610122466699, 'Amena', 'Winters', 'eu.lacus@Uttincidunt.org'),
(1611010296699, 'Cathleen', 'Greene', 'semper@facilisisfacilisismagna.ca'),
(1611102284199, 'Ahmed', 'Galloway', 'eget.ipsum.Donec@laoreetlectusquis.co.uk'),
(1611112931699, 'Jennifer', 'Stevenson', 'sollicitudin.adipiscing@Aenean.com'),
(1627060401499, 'Elaine', 'Donaldson', 'Morbi.vehicula@imperdiet.ca'),
(1638092980799, 'Kay', 'Marquez', 'In@blanditviverraDonec.co.uk'),
(1641010876399, 'Caryn', 'Reid', 'Aliquam.ornare.libero@adlitoratorquent.com'),
(1643020941699, 'Joy', 'Carey', 'scelerisque.lorem@dolordolortempus.ca'),
(1651061329999, 'Evelyn', 'Atkinson', 'tempus.eu@dolorelitpellentesque.com'),
(1651092040799, 'Chadwick', 'Allen', 'enim@semper.co.uk'),
(1653062608899, 'Victor', 'Mcconnell', 'sem.Nulla@Quisque.co.uk'),
(1656061966999, 'Octavius', 'Wade', 'pede@mus.ca'),
(1656081805699, 'Xanthus', 'Mcgowan', 'ridiculus.mus.Proin@Maurisvestibulum.org'),
(1660020239499, 'Giacomo', 'James', 'Duis.mi.enim@mi.com'),
(1664110352499, 'Nathan', 'Moran', 'eget.lacus@erosNam.net'),
(1665101843499, 'Otto', 'Hart', 'elementum@Maurisvestibulum.org'),
(1667081298699, 'Kenneth', 'Fletcher', 'in.consequat@dignissimtemporarcu.org'),
(1669031424299, 'Jackson', 'Gould', 'lorem@orci.com'),
(1683092555899, 'Vivian', 'Workman', 'fringilla@sagittis.net'),
(1687072131299, 'Xanthus', 'Massey', 'semper@odio.net'),
(1688110873699, 'Brent', 'Mcneil', 'ac.arcu@Nuncsollicitudincommodo.net'),
(1691060523599, 'Willa', 'Wagner', 'at@interdumNuncsollicitudin.edu'),
(1691091750799, 'Oleg', 'Koch', 'natoque.penatibus.et@Quisqueporttitor.com'),
(1695092204299, 'Branden', 'Morgan', 'Nulla.facilisis.Suspendisse@vitae.ca'),
(1697062419499, 'Malik', 'Silva', 'Suspendisse@commodo.com'),
(1699112687399, 'Roth', 'Hinton', 'lorem@Nullamscelerisque.net');

-- --------------------------------------------------------

--
-- Table structure for table `roster`
--

CREATE TABLE `roster` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Present','Absent') NOT NULL DEFAULT 'Absent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course_students`
--
ALTER TABLE `course_students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `roster`
--
ALTER TABLE `roster`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course_students`
--
ALTER TABLE `course_students`
  MODIFY `student_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1699112687400;

--
-- AUTO_INCREMENT for table `roster`
--
ALTER TABLE `roster`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `roster`
--
ALTER TABLE `roster`
  ADD CONSTRAINT `roster_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `course_students` (`student_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
