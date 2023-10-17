-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2023 at 01:13 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `coment`
--

CREATE TABLE `coment` (
  `id_comand` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `name_user` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `userImage` varchar(200) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coment`
--

INSERT INTO `coment` (`id_comand`, `id_user`, `name_user`, `content`, `userImage`, `id_product`) VALUES
(1, 1, 'NguyenHuyHoang', 'Khá là ngon nhưng thỉnh thoảng cổng mạng bị đứt, mình nghĩ là do bị nóng quá, mình dùng 3 cổng USB + HDMI + LAN, liên tục tầm 10 mấy tiếng thì tự nhiên mất LAN, rút ra để nguội tý, restart máy lại thì', 'https://i.bloganchoi.com/bloganchoi.com/wp-content/uploads/2022/05/hinh-avatar-doi-dep-2022-6-696x696.jpg?fit=700%2C20000&quality=95&ssl=1', 1),
(2, 2, 'VuThiLinh', 'Sản phẩm dùng tốt giá vừa phải, chất lượng build oke', 'https://nhadepso.com/wp-content/uploads/2023/03/cap-nhat-99-hinh-anh-avatar-gau-cute-de-thuong-ngo-nghinh_1.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `platform`
--

CREATE TABLE `platform` (
  `id_platform` int(11) NOT NULL,
  `name_platform` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `platform`
--

INSERT INTO `platform` (`id_platform`, `name_platform`) VALUES
(1, 'Shoppe'),
(2, 'Lazada'),
(3, 'SenDo'),
(4, 'tiki');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `name_product` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `id_platform` varchar(200) NOT NULL,
  `price_product` varchar(200) NOT NULL,
  `imgURL` varchar(500) NOT NULL,
  `type` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id_product`, `name_product`, `id_platform`, `price_product`, `imgURL`, `type`) VALUES
(1, 'Bộ Hub mở rộng Baseus Metal Gleam StarJoy Series 8 in 1 4K60Hz', '1', '579.000', 'https://cf.shopee.vn/file/0831df249013d5ae50d7ed42996412c8', 'electric'),
(2, 'Hub Baseus Metal Gleam Series Multifunctional Type-C HUB Docking Station', '1', '575.000', 'https://cf.shopee.vn/file/c9f6652fbc8faeaea9d054ce072bd7fc_tn', ''),
(3, 'Hub type c Baseus 5in1 Metal Gleam Series CX0G, bộ chuyển đổi type c', '1', '585.000', 'https://cf.shopee.vn/file/c9f6652fbc8faeaea9d054ce072bd7fc_tn', 'electric'),
(7, 'Hub Baseus Metal Gleam Series Multifunctional Type-C HUB Docking Station', '2', '545.000', 'https://vn-live-01.slatic.net/p/8f0e6b96c7d98adc0bacbaabe672b3ac.jpg', ''),
(8, 'Bộ chia cổng type-c baseus metal gleam series cahub-cx0g chính hãng', '2', '520.000', 'https://cf.shopee.vn/file/5f97be3dd5743c05129637ad48c8717d_tn', 'electric'),
(9, 'Hub type c Baseus 5in1 Metal Gleam Series CX0G, bộ chuyển đổi type c', '2', '575.000', 'https://cf.shopee.vn/file/c9f6652fbc8faeaea9d054ce072bd7fc_tn', 'electric'),
(10, 'Hub Baseus Metal Gleam Series Multifunctional Type-C HUB Docking Station', '3', '585.000', 'https://media3.scdn.vn/img4/2021/12_30/7nkh5DOeyQ8bupfWHtYr_simg_b5529c_250x250_maxb.jpg', 'electric'),
(11, 'Hub type c Baseus 5in1 Metal Gleam Series CX0G, bộ chuyển đổi type c', '3', '575.000', 'https://cf.shopee.vn/file/c9f6652fbc8faeaea9d054ce072bd7fc_tn', 'electric'),
(12, 'Hub chuyển đa năng 4 trong 1 Baseus Metal Gleam Series Multifunctional Docking Station', '4', '585.000', 'https://media3.scdn.vn/img4/2021/12_30/7nkh5DOeyQ8bupfWHtYr_simg_b5529c_250x250_maxb.jpg', 'electric'),
(13, 'Hub Baseus Metal Gleam From china', '3', '512.000', 'https://cf.shopee.vn/file/c9f6652fbc8faeaea9d054ce072bd7fc_tn', 'electric'),
(14, 'Hub Baseus Metal Gleam From USA', '4', '600.000', 'https://cf.shopee.vn/file/c9f6652fbc8faeaea9d054ce072bd7fc_tn', 'electric');

-- --------------------------------------------------------

--
-- Table structure for table `product_image_details`
--

CREATE TABLE `product_image_details` (
  `id_PD_details` int(11) NOT NULL,
  `id_product` varchar(200) NOT NULL,
  `imgURL` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_image_details`
--

INSERT INTO `product_image_details` (`id_PD_details`, `id_product`, `imgURL`) VALUES
(1, '1', 'https://cf.shopee.vn/file/3f447029faa61a3a9bcc4e19fee409c6'),
(2, '1', 'https://cf.shopee.vn/file/f08e41b307b4a324abfdc528bf5528cd'),
(3, '1', 'https://cf.shopee.vn/file/c28660cb50a4bf315fdc875efaa5ee01'),
(4, '1', 'https://cf.shopee.vn/file/99be5e5ca5d77f3006cbe53bf4d49c01'),
(5, '1', 'https://cf.shopee.vn/file/3f447029faa61a3a9bcc4e19fee409c6'),
(6, '1', 'https://cf.shopee.vn/file/0831df249013d5ae50d7ed42996412c8'),
(7, '1', 'https://cf.shopee.vn/file/0831df249013d5ae50d7ed42996412c8');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coment`
--
ALTER TABLE `coment`
  ADD PRIMARY KEY (`id_comand`);

--
-- Indexes for table `platform`
--
ALTER TABLE `platform`
  ADD PRIMARY KEY (`id_platform`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`);

--
-- Indexes for table `product_image_details`
--
ALTER TABLE `product_image_details`
  ADD PRIMARY KEY (`id_PD_details`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coment`
--
ALTER TABLE `coment`
  MODIFY `id_comand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `platform`
--
ALTER TABLE `platform`
  MODIFY `id_platform` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_image_details`
--
ALTER TABLE `product_image_details`
  MODIFY `id_PD_details` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
