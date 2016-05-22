-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2016 at 04:17 AM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignment`
--

-- --------------------------------------------------------

--
-- Table structure for table `android`
--

CREATE TABLE `android` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `images` varchar(255) NOT NULL,
  `app` varchar(255) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `android`
--

INSERT INTO `android` (`id`, `name`, `description`, `images`, `app`, `active`) VALUES
(1, 'test', 'test android', 'temp/ios/5/20160508065348/ios_5-20160508065348accept-icon.png', 'temp/ios/5/20160508065349/ios_5-20160508065349keygen.exe', 'Y'),
(3, 'dropbox', 'dropbox test', 'temp/android/5/20160509032205/android5-20160509032205h1.webp', 'temp/android/5/20160509032205/android5-20160509032205dropboxinstaller.exe', 'Y'),
(4, 'abc', 'abc', 'temp/android/5/20160509032851/android5-20160509032851app6.webp', 'temp/android/5/20160509032851/android5-20160509032851vs10sp1-kb983509.exe', 'Y'),
(5, 'teaet', 'test', 'temp/android/5/20160509032909/android5-20160509032909img.jpg', 'temp/android/5/20160509032909/android5-20160509032909rufus-2.8.exe', 'Y'),
(6, 'game', 'game hay', 'temp/android/5/20160509032954/android5-20160509032954app5.webp', 'temp/android/5/20160509032954/android5-20160509032954keygen.exe', 'Y'),
(7, 'music', 'music vietnam', 'temp/android/5/20160509033022/android5-20160509033022app7.webp', 'temp/android/5/20160509033022/android5-20160509033022keygen.exe', 'Y'),
(8, 'uplaod', 'upload', 'temp/android/6/20160509041141/android6-20160509041141app2.webp', 'temp/android/6/20160509041141/android6-20160509041141vs10sp1-kb983509.exe', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `ios`
--

CREATE TABLE `ios` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `images` varchar(255) NOT NULL,
  `app` varchar(255) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ios`
--

INSERT INTO `ios` (`id`, `name`, `description`, `images`, `app`, `active`) VALUES
(12, 'minion', 'game minion', 'temp/ios/5/20160504190034/ios_5-20160504190034app7.webp', 'temp/ios/5/20160504190034/ios_5-20160504190034rufus-2.8.exe', 'Y'),
(13, 'test', 'test view', 'temp/ios/5/20160505105839/ios_5-20160505105839app10.webp', 'temp/ios/5/20160505105839/ios_5-20160505105839vs10sp1-kb983509.exe', 'Y'),
(15, 'test', 'test', 'temp/ios/5/20160505112004/ios_5-20160505112004app5.webp', 'temp/ios/5/20160505112004/ios_5-20160505112004rufus-2.8.exe', 'Y'),
(16, 'test2', 'test uplaod', 'temp/ios/5/20160505112224/ios_5-20160505112224app11.webp', 'temp/ios/5/20160505112224/ios_5-20160505112224vs10sp1-kb983509.exe', 'Y'),
(18, 'test', 'test lai', 'temp/ios/5/20160505120850/ios_5-20160505120850lichthi.png', 'temp/ios/5/20160505120850/ios_5-20160505120850paio.exe', 'Y'),
(19, 'reuq', 'qá»eid', 'temp/ios/5/20160507205525/ios_5-20160507205525app13.webp', 'temp/ios/5/20160507205525/ios_5-20160507205525keygen.exe', 'Y'),
(20, 'game car', 'game hay', 'temp/ios/5/20160509035119/ios_5-20160509035119app5.webp', 'temp/ios/5/20160509035119/ios_5-20160509035119vs10sp1-kb983509.exe', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(70) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `role`) VALUES
(1, 'Luong Quoc Dinh', 'quocdinhcs', '8cb2237d0679ca88db6464eac60da96345513964', 'luongquocdinh1995@gmail.com', 'admin'),
(4, 'Nguyen Thanh Hai', 'haivl', '7c222fb2927d828af22f592134e8932480637c0d', 'hai@hcmut.edu.vn', 'admin'),
(5, 'Nguyen Van A', 'nguyenvana', '7c222fb2927d828af22f592134e8932480637c0d', 'nguyenvana@gmail.com', 'user'),
(6, 'Luong Van Ninh', 'ninh', '7c222fb2927d828af22f592134e8932480637c0d', 'luongvanninh1995@gmail.com', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `windown`
--

CREATE TABLE `windown` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `images` varchar(255) NOT NULL,
  `app` varchar(255) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `windown`
--

INSERT INTO `windown` (`id`, `name`, `description`, `images`, `app`, `active`) VALUES
(2, 'windown', 'windown', 'temp/windown/5/20160509033105/windown5-20160509033105app6.webp', 'temp/windown/5/20160509033105/windown5-20160509033105rufus-2.8.exe', 'Y'),
(3, 'test', 'test', 'temp/windown/5/20160509033122/windown5-20160509033122app18.webp', 'temp/windown/5/20160509033122/windown5-20160509033122vs10sp1-kb983509.exe', 'Y'),
(4, 'name', 'description', 'temp/windown/5/20160509033142/windown5-20160509033142h4.webp', 'temp/windown/5/20160509033142/windown5-20160509033142rufus-2.8.exe', 'Y'),
(5, 'email', 'password', 'temp/windown/5/20160509033221/windown5-20160509033221app6.webp', 'temp/windown/5/20160509033221/windown5-20160509033221keygen.exe', 'Y'),
(6, 'test', 'test', 'temp/windown/5/20160509033234/windown5-20160509033234app5.webp', 'temp/windown/5/20160509033234/windown5-20160509033234dropboxinstaller.exe', 'Y'),
(7, 'hello', 'hi', 'temp/windown/5/20160509033248/windown5-20160509033248app11.webp', 'temp/windown/5/20160509033249/windown5-20160509033249keygen.exe', 'Y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `android`
--
ALTER TABLE `android`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ios`
--
ALTER TABLE `ios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `windown`
--
ALTER TABLE `windown`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `android`
--
ALTER TABLE `android`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `ios`
--
ALTER TABLE `ios`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `windown`
--
ALTER TABLE `windown`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
