-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2022 at 04:16 AM
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
-- Database: `mobile-store`
--

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `name`, `image`, `published`, `created_date`, `user_id`) VALUES
(1, 'Banner 1', 'http://localhost:8000/images/banners/16648949739491646407575832banner1.jpg', 1, '2022-10-04 21:49:32', 1),
(2, 'Banner 2', 'http://localhost:8000/images/banners/16648949881641646407589897iphone-12-banner-1400x633.png', 1, '2022-10-04 21:49:47', 1),
(3, 'Banner 3', 'http://localhost:8000/images/banners/16648950034941646408574478y33s_kv_vn_pc.png', 1, '2022-10-04 21:50:02', 1),
(4, 'Banner 4', 'http://localhost:8000/images/banners/16648950156401646408623467s20-plus-pc-banner.jpg', 0, '2022-10-04 21:50:14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `published`, `created_date`) VALUES
(1, 'Samsung', 1, '2022-01-17 12:00:00'),
(2, 'Vivo', 1, '2022-01-17 12:00:00'),
(3, 'iPhone', 1, '2022-01-17 12:00:00'),
(4, 'Xiaomi', 1, '2022-01-17 12:00:00'),
(5, 'OPPO', 1, '2022-01-17 12:00:00'),
(6, 'Nokia', 1, '2022-01-17 12:00:00'),
(7, 'Realme', 1, '2022-01-17 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_option_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `color_option`
--

CREATE TABLE `color_option` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `color_option`
--

INSERT INTO `color_option` (`id`, `name`, `created_date`) VALUES
(1, 'Xanh', '2022-01-23 06:00:00'),
(2, 'Đen', '2022-01-23 06:00:00'),
(3, 'Xanh dương', '2022-01-23 06:00:00'),
(4, 'Đỏ', '2022-01-23 06:00:00'),
(5, 'Bạc', '2022-01-23 06:00:00'),
(6, 'Xanh lá', '2022-01-23 06:00:00'),
(7, 'Vàng', '2022-01-23 06:00:00'),
(8, 'Hồng', '2022-01-23 06:00:00'),
(9, 'Trắng', '2022-01-23 06:00:00'),
(10, 'Xám', '2022-01-23 06:00:00'),
(11, 'Nâu', '2022-01-23 06:00:00'),
(12, 'Tím', '2022-01-23 06:00:00'),
(13, 'Cam', '2022-01-23 06:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `used_quantity` int(11) DEFAULT NULL,
  `discount_value` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `created_date`, `start_date`, `end_date`, `quantity`, `used_quantity`, `discount_value`, `user_id`) VALUES
(1, 'giam-gia-thang-10-2022', '2022-10-05 22:09:46', '2022-10-05 00:00:09', '2022-10-31 23:59:16', 10, 1, 500000, 1),
(2, 'giam-gia-10-05-2022', '2022-10-05 22:11:42', '2022-10-05 00:00:09', '2022-10-05 23:59:21', 1, 1, 200000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `total_price` int(11) DEFAULT NULL,
  `delivery_cost` int(11) DEFAULT NULL,
  `coupons_id` int(11) DEFAULT NULL,
  `discount_value` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `shop_name` varchar(100) DEFAULT NULL,
  `shop_phone` varchar(15) DEFAULT NULL,
  `shop_address` varchar(1000) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_phone` varchar(15) DEFAULT NULL,
  `customer_address` varchar(1000) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `total_price`, `delivery_cost`, `coupons_id`, `discount_value`, `status_id`, `shop_name`, `shop_phone`, `shop_address`, `customer_id`, `customer_name`, `customer_phone`, `customer_address`, `created_date`) VALUES
(1, 14101501, 31501, 2, 200000, 6, 'Công Ty TNHH Mobile Store', '0989123123', '123 đường Nguyễn Ảnh Thủ, Phường Hiệp Thành, Quận 12, Hồ Chí Minh', 7, 'Nguyễn Thành Lộc', '0123123123', '123 đường 3-2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ', '2022-10-05 22:17:09'),
(2, 21019000, 29000, NULL, 0, 6, 'Công Ty TNHH Mobile Store', '0989123123', '123 đường Nguyễn Ảnh Thủ, Phường Hiệp Thành, Quận 12, Hồ Chí Minh', 7, 'Nguyễn Thành Lộc', '0123123123', '123 đường 3-2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ', '2022-10-05 22:20:56'),
(3, 12109000, 29000, 1, 500000, 6, 'Công Ty TNHH Mobile Store', '0989123123', '123 đường Nguyễn Ảnh Thủ, Phường Hiệp Thành, Quận 12, Hồ Chí Minh', 8, 'Nguyễn Thanh Nhi', '0919123123', '456 đường 3-2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ', '2022-10-05 22:32:31'),
(4, 20009000, 29000, NULL, 0, 6, 'Công Ty TNHH Mobile Store', '0989123123', '123 đường Nguyễn Ảnh Thủ, Phường Hiệp Thành, Quận 12, Hồ Chí Minh', 8, 'Nguyễn Thanh Nhi', '0919123123', '456 đường 3-2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ', '2022-10-05 22:34:28'),
(5, 13801501, 31501, NULL, 0, 6, 'Công Ty TNHH Mobile Store', '0989123123', '123 đường Nguyễn Ảnh Thủ, Phường Hiệp Thành, Quận 12, Hồ Chí Minh', 8, 'Nguyễn Thanh Nhi', '0919123123', '456 đường 3-2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ', '2022-10-05 22:39:36'),
(6, 21019000, 29000, NULL, 0, 7, 'Công Ty TNHH Mobile Store', '0989123123', '123 đường Nguyễn Ảnh Thủ, Phường Hiệp Thành, Quận 12, Hồ Chí Minh', 8, 'Nguyễn Thanh Nhi', '0919123123', '456 đường 3-2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ', '2022-10-05 22:41:23'),
(7, 7311000, 21000, NULL, 0, 6, 'Công Ty TNHH Mobile Store', '0989123123', '123 đường Nguyễn Ảnh Thủ, Phường Hiệp Thành, Quận 12, Hồ Chí Minh', 2, 'Nguyễn Hoài Tân', '0123123123', '123 đường Nguyễn Ảnh Thủ, Phường Hiệp Thành, Quận 12, Hồ Chí Minh', '2022-10-05 22:45:25');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `price`, `quantity`, `order_id`, `product_option_id`) VALUES
(1, 4590000, 2, 1, 18),
(2, 5090000, 1, 1, 23),
(3, 20990000, 1, 2, 32),
(4, 7290000, 1, 3, 5),
(5, 5290000, 1, 3, 4),
(6, 9990000, 2, 4, 25),
(7, 4590000, 3, 5, 1),
(8, 20990000, 1, 6, 31),
(9, 7290000, 1, 7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Đặt hàng'),
(2, 'Chờ xác nhận'),
(3, 'Đang xử lý'),
(4, 'Đang vận chuyển'),
(5, 'Đã giao hàng'),
(6, 'Hoàn tất'),
(7, 'Đã hủy');

-- --------------------------------------------------------

--
-- Table structure for table `order_tracking`
--

CREATE TABLE `order_tracking` (
  `id` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_tracking`
--

INSERT INTO `order_tracking` (`id`, `created_date`, `status_id`, `order_id`, `user_id`) VALUES
(1, '2022-10-05 22:17:09', 1, 1, 7),
(2, '2022-10-05 22:18:04', 2, 1, 1),
(3, '2022-10-05 22:18:17', 3, 1, 1),
(4, '2022-10-05 22:18:19', 4, 1, 1),
(5, '2022-10-05 22:18:23', 5, 1, 1),
(6, '2022-10-05 22:20:56', 1, 2, 7),
(7, '2022-10-05 22:21:10', 2, 2, 1),
(8, '2022-10-05 22:21:11', 3, 2, 1),
(9, '2022-10-05 22:21:11', 4, 2, 1),
(10, '2022-10-05 22:21:12', 5, 2, 1),
(11, '2022-10-05 22:32:31', 1, 3, 8),
(12, '2022-10-05 22:32:51', 2, 3, 1),
(13, '2022-10-05 22:32:52', 3, 3, 1),
(14, '2022-10-05 22:32:53', 4, 3, 1),
(15, '2022-10-05 22:32:54', 5, 3, 1),
(16, '2022-10-05 22:34:28', 1, 4, 8),
(17, '2022-10-05 22:34:57', 2, 4, 1),
(18, '2022-10-05 22:34:58', 3, 4, 1),
(19, '2022-10-05 22:34:59', 4, 4, 1),
(20, '2022-10-05 22:35:00', 5, 4, 1),
(21, '2022-10-05 22:39:36', 1, 5, 8),
(22, '2022-10-05 22:39:55', 2, 5, 1),
(23, '2022-10-05 22:39:56', 3, 5, 1),
(24, '2022-10-05 22:39:57', 4, 5, 1),
(25, '2022-10-05 22:39:57', 5, 5, 1),
(26, '2022-10-05 22:41:23', 1, 6, 8),
(27, '2022-10-05 22:41:35', 7, 6, 1),
(28, '2022-10-05 22:45:25', 1, 7, 2),
(29, '2022-10-05 22:45:39', 2, 7, 1),
(30, '2022-10-05 22:45:39', 3, 7, 1),
(31, '2022-10-05 22:45:40', 4, 7, 1),
(32, '2022-10-05 22:45:40', 5, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `specifications` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `specifications`, `description`, `width`, `height`, `weight`, `length`, `created_date`, `published`, `brand_id`, `user_id`) VALUES
(1, 'Xiaomi Redmi Note 11', '<table style=\"border-collapse: collapse; width: 99.975%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 15.105%;\">Dung lượng pin</td>\n<td style=\"width: 84.8694%;\">5000 mAh</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Bluetooth</td>\n<td style=\"width: 84.8694%;\">v5.0</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Thương hiệu</td>\n<td style=\"width: 84.8694%;\">Xiaomi</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Hỗ trợ thẻ nhớ ngo&agrave;i</td>\n<td style=\"width: 84.8694%;\">MicroSD, hỗ trợ tối đa 1 TB</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Thời gian sạc</td>\n<td style=\"width: 84.8694%;\">Trong khoảng thời gian từ 1h30-2 tiếng được sạc đầy từ 0% l&ecirc;n 100% pin</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Chip đồ họa (GPU)</td>\n<td style=\"width: 84.8694%;\">Adreno 610</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Chip set</td>\n<td style=\"width: 84.8694%;\">MediaTek Helio G80</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Chức năng kh&aacute;c</td>\n<td style=\"width: 84.8694%;\">C&ocirc;ng nghệ pin: Sạc pin nhanh</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Kết nối kh&aacute;c</td>\n<td style=\"width: 84.8694%;\">BEIDOU GALILEO GLONASS GPS</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Tốc độ CPU</td>\n<td style=\"width: 84.8694%;\">2.4 GHz</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Đ&egrave;n Flash</td>\n<td style=\"width: 84.8694%;\">C&Oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">K&iacute;ch thước</td>\n<td style=\"width: 84.8694%;\">\n<p>K&iacute;ch thước, khối lượng: D&agrave;i 159.8 mm - Ngang 73.87 mm - D&agrave;y 8.09 mm - Nặng 179 g</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 84.8694%;\">AMOLED</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Ghi &acirc;m</td>\n<td style=\"width: 84.8694%;\">Ghi &acirc;m mặc định</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">GPS</td>\n<td style=\"width: 84.8694%;\">BEIDOU GALILEO GLONASS GPS</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">H&ocirc;̃ trợ 4G</td>\n<td style=\"width: 84.8694%;\">C&Oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Hỗ trợ 5G</td>\n<td style=\"width: 84.8694%;\">Kh&ocirc;ng hỗ trợ</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Phụ kiện đi k&egrave;m</td>\n<td style=\"width: 84.8694%;\">\n<p>Bộ sản phẩm bao gồm: điện thoại, c&aacute;p sạc pin, s&aacute;ch hướng dẫn</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Model</td>\n<td style=\"width: 84.8694%;\">Redmi Note 11</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Jack tai nghe</td>\n<td style=\"width: 84.8694%;\">3.5mm</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Bộ nhớ khả dụng</td>\n<td style=\"width: 84.8694%;\">118 GB</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Số sim</td>\n<td style=\"width: 84.8694%;\">2 Nano SIM</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Loại pin</td>\n<td style=\"width: 84.8694%;\">5.000 mAh, hỗ trợ sạc nhanh 18 W</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Loại Sim</td>\n<td style=\"width: 84.8694%;\">Nano</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Chất liệu</td>\n<td style=\"width: 84.8694%;\">Khung nhựa &amp; Mặt lưng nhựa giả k&iacute;nh</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Xuất xứ</td>\n<td style=\"width: 84.8694%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Cổng sạc</td>\n<td style=\"width: 84.8694%;\">Type C</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Trọng lượng sản phẩm</td>\n<td style=\"width: 84.8694%;\">Nặng 179 g</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">RAM</td>\n<td style=\"width: 84.8694%;\">4GB/6GB</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Độ ph&acirc;n giải</td>\n<td style=\"width: 84.8694%;\">Full HD+ (1080 x 2400 Pixels)</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">ROM</td>\n<td style=\"width: 84.8694%;\">128GB</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 84.8694%;\">6.43 inch</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Hỗ trợ thẻ tối đa</td>\n<td style=\"width: 84.8694%;\">1 TB</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">T&iacute;nh năng camera</td>\n<td style=\"width: 84.8694%;\">AI Camera Ban đ&ecirc;m (Night Mode) Bộ lọc m&agrave;u Chuy&ecirc;n nghiệp (Pro) Google Lens G&oacute;c rộng (Wide) HDR L&agrave;m đẹp Quay chậm (Slow Motion) Si&ecirc;u cận (Macro) To&agrave;n cảnh (Panorama) Tr&ocirc;i nhanh thời gian (Time Lapse) X&oacute;a ph&ocirc;ng</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">Wifi</td>\n<td style=\"width: 84.8694%;\">Wi-Fi 802.11 a/b/g/n/acWi-Fi Direct</td>\n</tr>\n<tr>\n<td style=\"width: 15.105%;\">C&oacute; thuế VAT</td>\n<td style=\"width: 84.8694%;\">C&oacute;</td>\n</tr>\n</tbody>\n</table>', '<h3 id=\"dang-gia-chi-tiet\"><a title=\"Tham khảo điện thoại Redmi kinh doanh tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-xiaomi-redmi\" target=\"_blank\" rel=\"noopener\">Điện thoại Redmi</a>&nbsp;được mệnh danh l&agrave; d&ograve;ng sản phẩm quốc d&acirc;n ngon - bổ&nbsp; - rẻ của&nbsp;<a title=\"Tham khảo điện thoại Xiaomi kinh doanh tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-xiaomi\" target=\"_blank\" rel=\"noopener\">Xiaomi</a>&nbsp;v&agrave;&nbsp;<a title=\"Tham khảo th&ocirc;ng tin sản phẩm tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd/xiaomi-redmi-note-11-4gb-64gb\" target=\"_blank\" rel=\"noopener\">Redmi Note 11 (4GB/64GB)</a>&nbsp;cũng kh&ocirc;ng phải ngoại lệ, m&aacute;y sở hữu một hiệu năng ổn định, m&agrave;n h&igrave;nh 90 Hz mượt m&agrave;, cụm camera AI đến 50 MP c&ugrave;ng một mức gi&aacute; v&ocirc; c&ugrave;ng tốt.</h3>\n<h3>Khung viền phẳng thời thượng</h3>\n<p>Redmi Note 11 được ho&agrave;n thiện từ nhựa nguy&ecirc;n khối, mặt lưng thiết kế nh&aacute;m mờ gi&uacute;p qu&aacute; tr&igrave;nh sử dụng được thoải m&aacute;i hơn, kh&ocirc;ng bị trơn, tuột. Thiết kế nh&aacute;m cũng gi&uacute;p m&aacute;y tr&ocirc;ng mạnh mẽ, cứng c&aacute;p hơn.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/269831/xiaomi-redmi-note-11-4gb-64gb-090222-032242.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>M&aacute;y sử dụng khung viền phẳng theo xu hướng kh&aacute; l&agrave; thời trang, cạnh viền được bo cong nhẹ &ocirc;m về ph&iacute;a trước n&ecirc;n khi sử dụng sẽ kh&ocirc;ng bị cấn tay. Cụm 4 camera được l&agrave;m lồi hơn so với mặt lưng của m&aacute;y, nh&igrave;n chung phần thiết kế n&agrave;y kh&aacute; cơ bản v&agrave; ph&ugrave; hợp với nhiều đối tượng người d&ugrave;ng.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/269831/xiaomi-redmi-note-11-4gb-64gb-260122-085723.jpg\" alt=\"\" /></p>\n<p>M&aacute;y cũng được trang bị cảm biến v&acirc;n tay t&iacute;ch hợp trong ph&iacute;m nguồn v&agrave; m&igrave;nh nhận thấy tốc độ nhận v&agrave; mở kh&oacute;a của cảm biến n&agrave;y l&agrave; cực k&igrave; nhanh.</p>\n<h3>Hiệu năng h&agrave;ng đầu ph&acirc;n kh&uacute;c</h3>\n<p>Hiệu năng tr&ecirc;n chiếc m&aacute;y n&agrave;y khiến m&igrave;nh thật sự rất bất ngờ,&nbsp;<a href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">điện thoại</a>&nbsp;được trang bị con chip Snapdragon 680 x&acirc;y dựng tr&ecirc;n tiến tr&igrave;nh 6 nm gi&uacute;p cho m&aacute;y xử l&yacute; những t&aacute;c vụ cơ bản rất l&agrave; trơn tru. M&igrave;nh kiểm tra bằng ứng dụng đo hiệu năng Benchmark (b&ecirc;n tr&aacute;i) với điểm đơn nh&acirc;n l&agrave; 353 v&agrave; đa nh&acirc;n 1547, v&agrave; ứng dụng PC Mark (b&ecirc;n phải) đạt 7170 điểm.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/269831/xiaomi-redmi-note-11-4gb-64gb-090222-034442.jpg\" alt=\"\" /></p>\n<p>Với phi&ecirc;n bản 4 GB RAM th&igrave; m&igrave;nh vẫn c&oacute; thể đa nhiệm tốt nhu cầu sử dụng hằng ng&agrave;y như sử dụng mạng x&atilde; hội, xem phim, giải tr&iacute; nhẹ, hiện tượng giật lag hay đơ m&aacute;y hầu như rất &iacute;t khi xảy ra.</p>\n<p>C&aacute;c ứng dụng để l&agrave;m việc như Google Docs, Google Sheet, Word, Excel,... th&igrave; m&aacute;y vẫn xử l&yacute; tốt, chuyển cảnh, thao t&aacute;c kh&aacute; mượt.</p>\n<p>Về phần trải nghiệm game tr&ecirc;n chiếc m&aacute;y n&agrave;y, m&igrave;nh đ&atilde; chơi qua c&aacute;c tựa game phổ biến như Li&ecirc;n Qu&acirc;n th&igrave; m&aacute;y c&oacute; thể chơi ở đồ họa cao 60 FPS. Khi giao tranh tổng th&igrave; c&oacute; thể drop c&ograve;n 53-55 FPS, đồ họa h&igrave;nh ảnh trong game ở mức ổn, kh&ocirc;ng bị qu&aacute; nhiệt tại cụm camera.&nbsp;</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/269831/xiaomi-redmi-note-11-4gb-64gb-090222-035323.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Game PUBG Mobile th&igrave; m&igrave;nh c&oacute; thể c&agrave;i đặt đồ họa Mượt với FPS Cao hoặc đồ họa C&acirc;n bằng với FPS Trung b&igrave;nh để chơi ổn &aacute;p nhất.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/269831/xiaomi-redmi-note-11-4gb-64gb-090222-053820.jpg\" alt=\"\" /></p>\n<p>Hiệu năng n&agrave;y sẽ ph&ugrave; hợp với bạn nếu bạn kh&ocirc;ng y&ecirc;u cầu đồ họa cao xuất sắc, bạn cần một trải nghiệm mượt m&agrave;, ổn định cũng như l&agrave; một chiếc m&aacute;y c&oacute; nhiệt độ m&aacute;t mẻ khi sử dụng.</p>\n<h3>M&agrave;n h&igrave;nh AMOLED mượt m&agrave;</h3>\n<p>Xiaomi Redmi Note 11 c&oacute; m&agrave;n h&igrave;nh sở hữu h&agrave;ng loạt điểm nhấn như m&agrave;n h&igrave;nh đục lỗ 6.43 inches, độ ph&acirc;n giải Full HD+, tấm nền AMOLED c&ugrave;ng khả năng hỗ trợ 100% dải m&agrave;u rộng DCI-P3 mang lại m&agrave;u sắc kh&aacute; l&agrave; rực rỡ v&agrave; tươi tắn, độ chi tiết hiển thị cao, k&iacute;ch thước lớn gi&uacute;p cho m&aacute;y hiển thị được nhiều th&ocirc;ng tin hơn.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/269831/xiaomi-redmi-note-11-4gb-64gb-090222-035929.jpg\" alt=\"\" /></p>\n<p>Phần viền m&agrave;n h&igrave;nh kh&aacute; c&acirc;n đối, phần \"cằm\" cũng được l&agrave;m tinh gọn hơn nhiều. B&ecirc;n cạnh đ&oacute;, m&aacute;y cũng được trang bị tần số qu&eacute;t 90 Hz mang lại cho m&igrave;nh trải nghiệm vuốt chạm c&aacute;c thứ cực k&igrave; l&agrave; mượt m&agrave;, gi&uacute;p cho những trải nghiệm khi chơi game, xem phim cũng như l&agrave; lướt web đều rất l&agrave; tốt.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/269831/xiaomi-redmi-note-11-4gb-64gb-090222-040212.jpg\" alt=\"\" /></p>\n<p>Th&ecirc;m một điểm cộng cho Redmi Note 11 l&agrave; m&aacute;y c&oacute; hỗ trợ Chế độ đọc 3.0 gi&uacute;p hạn chế &aacute;nh s&aacute;ng xanh đi v&agrave;o mắt, g&igrave;n giữ sức khỏe đ&ocirc;i mắt của bạn.</p>\n<p>Về phần &acirc;m thanh th&igrave; m&aacute;y sở hữu 2 loa &acirc;m thanh k&eacute;p đạt chứng nhận Hi-Res Audio, cụm loa n&agrave;y c&oacute; &acirc;m thanh s&aacute;ng, &acirc;m lượng kh&aacute; gi&uacute;p trải nghiệm nghe, nh&igrave;n của bạn trở n&ecirc;n tốt hơn bao giờ hết.</p>\n<h3>Camera AI đến 50 MP</h3>\n<p>Mặt lưng sở hữu cụm 4 camera với cảm biến ch&iacute;nh l&ecirc;n đến 50 MP bậc nhất trong ph&acirc;n kh&uacute;c c&ugrave;ng với nhiều chế độ chụp mới nhất. Trong điều kiện đủ s&aacute;ng ảnh cho ra c&oacute; chất lượng chi tiết tốt, m&agrave;u sắc tươi tắn.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/269831/xiaomi-redmi-note-11-4gb-64gb-090222-040857.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p><em>*Thời gian sạc, sử dụng c&oacute; thể thay đổi t&ugrave;y theo nhu cầu, t&aacute;c vụ sử dụng.</em></p>\n<p>Theo m&igrave;nh đ&acirc;y sẽ l&agrave; một &ocirc;ng vua tầm trung mới, xứng đ&aacute;ng với danh hiệu ngon - bổ - rẻ m&agrave; nhiều kh&aacute;ch h&agrave;ng tin d&ugrave;ng, những điểm s&aacute;ng về cấu h&igrave;nh, m&agrave;n h&igrave;nh v&agrave; camera sẽ gi&uacute;p bạn tự tin chọn Redmi Note 11 để học tập, l&agrave;m việc v&agrave; giải tr&iacute;.</p>', 8, 1, 180, 16, '2022-10-05 20:05:11', 1, 4, 1),
(2, 'Xiaomi Redmi Note 10 Pro', '<table style=\"border-collapse: collapse; width: 99.975%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 26.4977%;\">Bluetooth</td>\n<td style=\"width: 73.6047%;\">A2DP LE v5.1</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Thương hiệu</td>\n<td style=\"width: 73.6047%;\">Xiaomi</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Hỗ trợ thẻ nhớ ngo&agrave;i</td>\n<td style=\"width: 73.6047%;\">MicroSD</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Chip set</td>\n<td style=\"width: 73.6047%;\">MediaTek Helio G96 8 nh&acirc;n</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Kết nối kh&aacute;c</td>\n<td style=\"width: 73.6047%;\">Hồng ngoạiNFC</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Tốc độ CPU</td>\n<td style=\"width: 73.6047%;\">2 nh&acirc;n 2.05 GHz &amp; 6 nh&acirc;n 2.0 GHz</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 73.6047%;\">AMOLED</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Model</td>\n<td style=\"width: 73.6047%;\">2201116TG</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Jack tai nghe</td>\n<td style=\"width: 73.6047%;\">3.5 mm</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Bộ nhớ khả dụng</td>\n<td style=\"width: 73.6047%;\">118 GB</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Số sim</td>\n<td style=\"width: 73.6047%;\">2</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Loại pin</td>\n<td style=\"width: 73.6047%;\">Li-Po</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Loại Sim</td>\n<td style=\"width: 73.6047%;\">Nano SIM</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Chất liệu</td>\n<td style=\"width: 73.6047%;\">Khung nhựa &amp; Mặt lưng k&iacute;nh</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Cổng sạc</td>\n<td style=\"width: 73.6047%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Trọng lượng sản phẩm</td>\n<td style=\"width: 73.6047%;\">202 g</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Độ ph&acirc;n giải</td>\n<td style=\"width: 73.6047%;\">Full HD+ (1080 x 2400 Pixels)</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 73.6047%;\">6.67 inch</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Hỗ trợ thẻ tối đa</td>\n<td style=\"width: 73.6047%;\">256 GB</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">Wifi</td>\n<td style=\"width: 73.6047%;\">Dual-band (2.4 GHz/5 GHz) Wi-Fi 802.11 a/b/g/n/ac Wi-Fi Direct Wi-Fi hotspot</td>\n</tr>\n<tr>\n<td style=\"width: 26.4977%;\">C&oacute; thuế VAT</td>\n<td style=\"width: 73.6047%;\">C&oacute;</td>\n</tr>\n</tbody>\n</table>', '<h3>Kế thừa v&agrave; n&acirc;ng cấp từ thế hệ trước,&nbsp;<a title=\"Tham khảo điện thoại Xiaomi tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-xiaomi\" target=\"_blank\" rel=\"noopener\">Xiaomi</a>&nbsp;đ&atilde; cho ra mắt&nbsp;<a href=\"https://www.thegioididong.com/dtdd/xiaomi-redmi-note-10-pro\" target=\"_blank\" rel=\"noopener\">điện thoại&nbsp;Xiaomi Redmi Note 10 Pro (8GB/128GB)</a>&nbsp;sở hữu một thiết kế cao cấp, sang trọng b&ecirc;n cạnh cấu h&igrave;nh v&ocirc; c&ugrave;ng mạnh mẽ, hứa hẹn mang đến sự cạnh tranh lớn trong ph&acirc;n kh&uacute;c smartphone tầm trung.</h3>\n<h3>Cấu tạo bền bỉ, thiết kế cao cấp</h3>\n<p>Xiaomi Redmi Note 10 Pro c&oacute; thiết kế nguy&ecirc;n khối mang lại cảm gi&aacute;c rất đầm tay v&agrave; chắc chắn, b&ecirc;n cạnh việc trang bị mặt k&iacute;nh&nbsp;ở hai cả hai mặt, tăng khả năng chống chịu va đập v&agrave; c&aacute;c trầy xước kh&ocirc;ng mong muốn.</p>\n<p><img src=\"http://localhost:8000/images/products/1664975537206xiaomi-redmi-note-10-pro-8gb-002.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Thiết kế sang trọng với khung viền được gia c&ocirc;ng bằng vật liệu kim loại cao cấp, m&aacute;y sử dụng bản m&agrave;u thanh lịch với những m&agrave;u sắc trẻ trung v&agrave; năng động t&ugrave;y chọn theo sở th&iacute;ch.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/229228/xiaomi-redmi-note-10-pro11.jpg\" alt=\"\" /></p>\n<p>Redmi Note 10 Pro c&ograve;n được trang bị t&iacute;nh năng&nbsp;mở kh&oacute;a v&acirc;n tay&nbsp;cạnh viền v&agrave;&nbsp;mở kh&oacute;a khu&ocirc;n mặt&nbsp;với tốc độ nhận diện cao, ch&iacute;nh x&aacute;c gi&uacute;p người d&ugrave;ng mở điện thoại nhanh ch&oacute;ng v&agrave; tăng cường độ bảo mật.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/229228/xiaomi-redmi-note-10-pro-8gb-009.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<h3>M&agrave;n h&igrave;nh rộng mở, trải nghiệm đầy hứng khởi</h3>\n<p>Sử dụng c&ocirc;ng nghệ m&agrave;n h&igrave;nh&nbsp;<a title=\"M&agrave;n h&igrave;nh AMOLED l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/hoi-dap/man-hinh-amoled-la-gi-905766\" target=\"_blank\" rel=\"noopener\">AMOLED</a>&nbsp;độ ph&acirc;n giải&nbsp;<a title=\"Độ ph&acirc;n giải m&agrave;n h&igrave;nh qHD, HD, FullHD, 2K, 4K l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/tin-tuc/do-phan-giai-man-hinh-qhd-hd-fullhd-2k-4k-la-gi--592178\" target=\"_blank\" rel=\"noopener\">Full HD+ (1080 x 2400 Pixels)</a>&nbsp;cho độ&nbsp;sắc n&eacute;t cao vừa sở hữu k&iacute;ch thước lớn 6.67 inch, thoải m&aacute;i xem phim, lướt web hay giải tr&iacute; h&agrave;ng ng&agrave;y.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/229228/xiaomi-redmi-note-10-pro-8gb-001.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>B&ecirc;n cạnh đ&oacute;, m&agrave;n h&igrave;nh của Redmi Note 10 Pro sở hữu tần số qu&eacute;t l&ecirc;n đến 120 Hz m&agrave; &iacute;t&nbsp;<a href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">điện thoại</a>&nbsp;n&agrave;o trong c&ugrave;ng ph&acirc;n kh&uacute;c gi&aacute; c&oacute; được, gi&uacute;p tốc độ chuyển động h&igrave;nh ảnh trở n&ecirc;n mượt m&agrave; v&agrave; sắc n&eacute;t hơn bao giờ hết.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/229228/xiaomi-redmi-note-10-pro-8gb-007.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<h3>Độ ph&acirc;n giải m&aacute;y ảnh cao đ&aacute;ng kinh ngạc</h3>\n<p>Cụm camera si&ecirc;u khủng với độ ph&acirc;n giải camera ch&iacute;nh l&ecirc;n đến 108 MP,&nbsp;<a title=\"Camera g&oacute;c rộng, g&oacute;c si&ecirc;u rộng tr&ecirc;n smartphone l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/dtdd-camera-goc-rong\" target=\"_blank\" rel=\"noopener\">camera g&oacute;c rộng</a>&nbsp;118 độ 8 MP,&nbsp;<a title=\"Ống k&iacute;nh Macro, chụp ảnh Macro l&agrave; g&igrave;? C&aacute;c lưu &yacute; khi chụp ảnh Macro\" href=\"https://www.thegioididong.com/dtdd-camera-macro\" target=\"_blank\" rel=\"noopener\">camera macro</a>&nbsp;5 MP v&agrave; camera đo độ s&acirc;u 2 MP, tạo n&ecirc;n một trong những điểm nhấn đặc biệt nhất tr&ecirc;n Xiaomi Redmi Note 10 Pro.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/229228/xiaomi-redmi-note-10-pro-011.jpg\" alt=\"\" /></p>\n<p>Thiết bị c&ograve;n sử dụng được c&aacute;c chuẩn quay phim từ&nbsp;<a title=\"C&aacute;c chuẩn quay phim tr&ecirc;n điện thoại, tablet phổ biến hiện nay\" href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134\" target=\"_blank\" rel=\"noopener\">HD</a>&nbsp;cho đến video chất lượng&nbsp;<a title=\"C&aacute;c chuẩn quay phim tr&ecirc;n điện thoại, tablet phổ biến hiện nay\" href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134\" target=\"_blank\" rel=\"noopener\">4K</a>. Giờ đ&acirc;y, bạn c&oacute; thể thả ga thu trọn từng khoảnh khắc đặc biệt trong những khung h&igrave;nh sắc n&eacute;t v&agrave; chất lượng tuyệt vời.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/229228/xiaomi-redmi-note-10-pro-008.jpg\" alt=\"\" /></p>\n<p>Camera trước c&oacute; độ ph&acirc;n giải 16 MP, m&aacute;y hỗ trợ c&aacute;c t&iacute;nh năng&nbsp;<a title=\"Chế độ l&agrave;m đẹp (Beautify) tr&ecirc;n smartphone, tablet l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/hoi-dap/che-do-lam-dep-beautify-tren-smartphone-tablet-1172231\" target=\"_blank\" rel=\"noopener\">l&agrave;m đẹp</a>,&nbsp;<a title=\"Chế độ autofocus trong chụp ảnh tr&ecirc;n smartphone\" href=\"https://www.thegioididong.com/hoi-dap/che-do-autofocus-trong-chup-anh-tren-smartphone-906408\" target=\"_blank\" rel=\"noopener\">tự động lấy n&eacute;t</a>&nbsp;gi&uacute;p mang lại khả năng selfie bắt mắt, chụp đẹp trong v&ograve;ng &ldquo;một nốt nhạc&rdquo; m&agrave; kh&ocirc;ng cần phải tốn nhiều thời gian chỉnh sửa ảnh.</p>\n<h3>Hiệu năng mạnh mẽ từ&nbsp;Snapdragon 732G 8 nh&acirc;n</h3>\n<p>Redmi Note 10 Pro hoạt động mạnh mẽ với con chip Snapdragon 732G 8 nh&acirc;n của Qualcomm, chipset cho hiệu năng khủng, cung cấp khả năng xử l&yacute; tuyệt vời, qua đ&oacute; khẳng định tham vọng vươn m&igrave;nh trở th&agrave;nh một trong những smartphone c&oacute; cấu h&igrave;nh gaming hấp dẫn.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/229228/xiaomi-redmi-note-10-pro5.jpg\" alt=\"\" /></p>\n<p>Snapdragon 732G được n&acirc;ng cấp để tập trung mạnh mẽ v&agrave;o xử l&yacute; c&aacute;c t&aacute;c vụ v&agrave; cấu h&igrave;nh cao của những tựa game online chất lượng v&agrave; đồ họa sắc n&eacute;t như: Li&ecirc;n Qu&acirc;n Mobile, PUBG Mobile, Tốc Chiến,...</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/229228/xiaomi-redmi-note-10-pro-8gb-006.jpg\" alt=\"\" /></p>\n<p><a href=\"https://www.thegioididong.com/dtdd-ram-8gb\" target=\"_blank\" rel=\"noopener\">Điện thoại RAM 8 GB</a>&nbsp;gi&uacute;p người d&ugrave;ng c&oacute; thể bật đa nhiệm mượt m&agrave;, c&ugrave;ng với&nbsp;128 GB bộ nhớ trong&nbsp;v&agrave; hỗ trợ thẻ nhớ ngo&agrave;i MicroSD đem lại kh&ocirc;ng gian lưu trữ lớn.</p>\n<h3>Pin tr&acirc;u kết hợp với&nbsp;sạc pin nhanh</h3>\n<p>M&aacute;y trang bị vi&ecirc;n pin&nbsp;Li-Ion&nbsp;dung lượng cao 5020 mAh, vi&ecirc;n pin cung cấp khả năng hoạt động xuy&ecirc;n suốt nhiều giờ liền với hiệu suất cao. Những trận game k&eacute;o d&agrave;i hay một lượng b&agrave;i tập, c&ocirc;ng việc lớn l&agrave;m ti&ecirc;u hao đ&aacute;ng kể pin sẽ&nbsp;kh&ocirc;ng c&ograve;n l&agrave; vấn đề&nbsp;với Redmi Note 10 Pro nữa.&nbsp;</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/229228/xiaomi-redmi-note-10-pro2.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Xiaomi Redmi Note 10 Pro sở hữu những t&iacute;nh năng v&ocirc; c&ugrave;ng hấp dẫn của một chiếc điện thoại cao cấp trong một mức gi&aacute; tầm trung như: Pin tốt sạc pin nhanh, vi xử l&yacute; tốc độ, m&agrave;n h&igrave;nh v&agrave; camera cho chất lượng h&igrave;nh ảnh xuất sắc,... hứa hẹn sẽ b&ugrave;ng nổ trở th&agrave;nh một trong những smartphone tầm trung đ&aacute;ng ch&uacute; &yacute; nhất nửa đầu năm 2021.</p>', 8, 1, 180, 17, '2022-10-05 20:19:06', 1, 4, 1),
(3, 'Xiaomi 12', '<table style=\"border-collapse: collapse; width: 99.9489%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 15.1088%;\">Dung lượng pin</td>\n<td style=\"width: 84.8912%;\">5000 mAh</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Bluetooth</td>\n<td style=\"width: 84.8912%;\">v5.0</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Thương hiệu</td>\n<td style=\"width: 84.8912%;\">Xiaomi</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Hỗ trợ thẻ nhớ ngo&agrave;i</td>\n<td style=\"width: 84.8912%;\">MicroSD, hỗ trợ tối đa 1 TB</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Thời gian sạc</td>\n<td style=\"width: 84.8912%;\">Trong khoảng thời gian từ 1h30-2 tiếng được sạc đầy từ 0% l&ecirc;n 100% pin</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Chip đồ họa (GPU)</td>\n<td style=\"width: 84.8912%;\">Adreno 610</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Chip set</td>\n<td style=\"width: 84.8912%;\">MediaTek Helio G80</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Chức năng kh&aacute;c</td>\n<td style=\"width: 84.8912%;\">C&ocirc;ng nghệ pin: Sạc pin nhanh</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Kết nối kh&aacute;c</td>\n<td style=\"width: 84.8912%;\">BEIDOU GALILEO GLONASS GPS</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Tốc độ CPU</td>\n<td style=\"width: 84.8912%;\">2.4 GHz</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Đ&egrave;n Flash</td>\n<td style=\"width: 84.8912%;\">C&Oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">K&iacute;ch thước</td>\n<td style=\"width: 84.8912%;\">\n<p>K&iacute;ch thước, khối lượng: D&agrave;i 159.8 mm - Ngang 73.87 mm - D&agrave;y 8.09 mm - Nặng 179 g</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 84.8912%;\">AMOLED</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Ghi &acirc;m</td>\n<td style=\"width: 84.8912%;\">Ghi &acirc;m mặc định</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">GPS</td>\n<td style=\"width: 84.8912%;\">BEIDOU GALILEO GLONASS GPS</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">H&ocirc;̃ trợ 4G</td>\n<td style=\"width: 84.8912%;\">C&Oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Hỗ trợ 5G</td>\n<td style=\"width: 84.8912%;\">Kh&ocirc;ng hỗ trợ</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Phụ kiện đi k&egrave;m</td>\n<td style=\"width: 84.8912%;\">\n<p>Bộ sản phẩm bao gồm: điện thoại, c&aacute;p sạc pin, s&aacute;ch hướng dẫn</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Model</td>\n<td style=\"width: 84.8912%;\">Redmi Note 11</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Jack tai nghe</td>\n<td style=\"width: 84.8912%;\">3.5mm</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Bộ nhớ khả dụng</td>\n<td style=\"width: 84.8912%;\">118 GB</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Số sim</td>\n<td style=\"width: 84.8912%;\">2 Nano SIM</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Loại pin</td>\n<td style=\"width: 84.8912%;\">5.000 mAh, hỗ trợ sạc nhanh 18 W</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Loại Sim</td>\n<td style=\"width: 84.8912%;\">Nano</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Chất liệu</td>\n<td style=\"width: 84.8912%;\">Khung nhựa &amp; Mặt lưng nhựa giả k&iacute;nh</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Xuất xứ</td>\n<td style=\"width: 84.8912%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Cổng sạc</td>\n<td style=\"width: 84.8912%;\">Type C</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Trọng lượng sản phẩm</td>\n<td style=\"width: 84.8912%;\">Nặng 179 g</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">RAM</td>\n<td style=\"width: 84.8912%;\">4GB/6GB</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Độ ph&acirc;n giải</td>\n<td style=\"width: 84.8912%;\">Full HD+ (1080 x 2400 Pixels)</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">ROM</td>\n<td style=\"width: 84.8912%;\">128GB</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 84.8912%;\">6.43 inch</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Hỗ trợ thẻ tối đa</td>\n<td style=\"width: 84.8912%;\">1 TB</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">T&iacute;nh năng camera</td>\n<td style=\"width: 84.8912%;\">AI Camera Ban đ&ecirc;m (Night Mode) Bộ lọc m&agrave;u Chuy&ecirc;n nghiệp (Pro) Google Lens G&oacute;c rộng (Wide) HDR L&agrave;m đẹp Quay chậm (Slow Motion) Si&ecirc;u cận (Macro) To&agrave;n cảnh (Panorama) Tr&ocirc;i nhanh thời gian (Time Lapse) X&oacute;a ph&ocirc;ng</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">Wifi</td>\n<td style=\"width: 84.8912%;\">Wi-Fi 802.11 a/b/g/n/acWi-Fi Direct</td>\n</tr>\n<tr>\n<td style=\"width: 15.1088%;\">C&oacute; thuế VAT</td>\n<td style=\"width: 84.8912%;\">C&oacute;</td>\n</tr>\n</tbody>\n</table>', '<h3><a title=\"Tham khảo một số mẫu điện thoại Xiaomi  đang kinh doanh tại Thế Giới Di Động \" href=\"https://www.thegioididong.com/dtdd/xiaomi\" target=\"_blank\" rel=\"noopener\">Điện thoại&nbsp;Xiaomi</a>&nbsp;đang dần khẳng định chỗ đứng của m&igrave;nh trong ph&acirc;n kh&uacute;c&nbsp;flagship bằng việc ra mắt Xiaomi 12 với bộ th&ocirc;ng số ấn tượng, m&aacute;y c&oacute; một thiết kế gọn g&agrave;ng, hiệu năng mạnh mẽ, m&agrave;n h&igrave;nh hiển thị chi tiết c&ugrave;ng khả năng chụp ảnh sắc n&eacute;t nhờ trang bị ống k&iacute;nh đến từ Sony.</h3>\n<h3>Cầm nắm cực kỳ thoải m&aacute;i</h3>\n<p>Ấn tượng đầu ti&ecirc;n khi m&igrave;nh nh&igrave;n&nbsp;<a title=\"Tham khảo điện thoại Xiaomi 12 đang kinh doanh tại Thế Giới Di Động \" href=\"https://www.thegioididong.com/dtdd/xiaomi-mi-12\" target=\"_blank\" rel=\"noopener\">điện thoại Xiaomi 12</a>&nbsp;l&agrave; n&oacute; qu&aacute; đẹp, c&aacute;c chi tiết được ho&agrave;n thiện một c&aacute;ch tỉ mỉ, cạnh viền được bo cong mềm mại v&agrave; kh&ocirc;ng thấy xuất hiện chi tiết thừa.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/234621/xiaomi-mi-12-030422-122212.jpg\" alt=\"\" /></p>\n<p>Bộ khung kim loại cứng c&aacute;p c&ugrave;ng mặt lưng k&iacute;nh cao cấp được ho&agrave;n thiện nh&aacute;m mang lại khả năng hạn chế b&aacute;m dấu v&acirc;n tay, cũng như cho ra cảm gi&aacute;c cầm nắm rất thoải m&aacute;i v&agrave; chắc chắn.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/234621/xiaomi-mi-12-030422-122214.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Xiaomi 12 đi ngược với xu hướng thiết kế vu&ocirc;ng vức hiện nay nhằm mang đến cho người d&ugrave;ng trải nghiệm cầm nắm thoải m&aacute;i nhất c&oacute; thể, khi hai cạnh b&ecirc;n được h&atilde;ng bo cong một c&aacute;ch mềm mại.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/234621/xiaomi-mi-12-030422-122216.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>M&aacute;y mang đến cho m&igrave;nh cảm gi&aacute;c rất &ecirc;m &aacute;i khi sử dụng, t&igrave;nh trạng cấn tay gần như kh&ocirc;ng xuất hiện cho d&ugrave; sử dụng li&ecirc;n tục trong khoảng thời gian d&agrave;i, cử chỉ vuốt m&agrave;n h&igrave;nh từ cạnh ngo&agrave;i v&agrave;o trong trở n&ecirc;n nhanh ch&oacute;ng v&agrave; trơn mượt hơn nhờ viền m&agrave;n h&igrave;nh bo cong.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/234621/xiaomi-mi-12-030422-122218.jpg\" alt=\"\" /></p>\n<p>Cụm loa được bố tr&iacute; ri&ecirc;ng lẻ ở hai đầu thiết bị c&ugrave;ng c&ocirc;ng nghệ &acirc;m thanh Dolby Atmos, cho ra trải nghiệm giải tr&iacute; khi chơi game hay xem phim một c&aacute;ch sống động hơn.</p>\n<p>Xem th&ecirc;m:&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/cong-nghe-am-thanh-dolby-altmos-la-gi-co-nhung-gi-noi-bat-1280672\" target=\"_blank\" rel=\"noopener\">C&ocirc;ng nghệ &acirc;m thanh Dolby Atmos l&agrave; g&igrave;? C&oacute; những g&igrave; nổi bật?</a></p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/234621/xiaomi-mi-12-030422-122219.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<h3>Nh&igrave;n đ&atilde; mắt với m&agrave;n h&igrave;nh sắc n&eacute;t</h3>\n<p>Xiaomi 12 được trang bị tấm nền AMOLED c&oacute; k&iacute;ch thước 6.28 inch, mang lại m&agrave;u sắc rực rỡ, hiển thị v&ugrave;ng tối c&oacute; chiều s&acirc;u hơn c&ugrave;ng một kh&ocirc;ng gian tr&igrave;nh chiếu rộng lớn, gi&uacute;p m&igrave;nh trải nghiệm c&aacute;c t&aacute;c vụ xem phim, chơi game cực kỳ đ&atilde; mắt.</p>\n<p>Xem th&ecirc;m:&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-amoled-la-gi-905766\" target=\"_blank\" rel=\"noopener\">M&agrave;n h&igrave;nh AMOLED l&agrave; g&igrave;? C&oacute; g&igrave; nổi bật? Thiết bị n&agrave;o c&oacute; m&agrave;n h&igrave;nh AMOLED?</a></p>\n<p>Trước l&uacute;c cầm qua m&aacute;y th&igrave; m&igrave;nh kh&aacute; hụt hẫng khi biết độ ph&acirc;n giải m&agrave;n h&igrave;nh tr&ecirc;n Xiaomi 12 được &ldquo;cải l&ugrave;i&rdquo; so với thế hệ tiền nhiệm, nhưng khi cầm thiết bị tr&ecirc;n tay th&igrave; m&igrave;nh thấy m&aacute;y hiển thị rất chi tiết v&agrave; gần như kh&ocirc;ng k&eacute;m cạnh qu&aacute; nhiều so với&nbsp;<a title=\"Tham khảo một điện thoại Xiaomi 11 đang kinh doanh tại Thế Giới Di Động \" href=\"https://www.thegioididong.com/dtdd/xiaomi-mi-11\" target=\"_blank\" rel=\"noopener\">điện thoại&nbsp;Xiaomi 11</a>&nbsp;(m&agrave;n h&igrave;nh 2K+).</p>\n<p>Được biết, th&igrave; đ&acirc;y l&agrave; do k&iacute;ch thước m&agrave;n h&igrave;nh của Xiaomi 12 nhỏ hơn gi&uacute;p mật độ điểm ảnh tăng cao l&ecirc;n đến 419 ppi, kết hợp c&ugrave;ng những c&ocirc;ng nghệ hiển thị ti&ecirc;n tiến được n&acirc;ng cấp, cho ra h&igrave;nh ảnh v&ocirc; c&ugrave;ng sắc n&eacute;t v&agrave; đẹp mắt.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/234621/xiaomi-mi-12-030422-122229.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<h3>M&aacute;y trang bị 3 camera c&oacute; độ ph&acirc;n giải cao</h3>\n<p>Ở chế độ chụp ảnh 50 MP cho ra c&aacute;c bức h&igrave;nh c&oacute; độ chi tiết cao, m&agrave;u sắc được t&aacute;i hiện ch&acirc;n thực, ảnh sau khi zoom vẫn mang một chất lượng kh&aacute; ổn, hỗ trợ cho việc hậu kỳ ảnh một c&aacute;ch tốt hơn.</p>\n<p>Nhờ trang bị camera g&oacute;c si&ecirc;u rộng 13 MP n&ecirc;n kết quả thu được c&oacute; độ bao qu&aacute;t rộng lớn v&agrave; sắc n&eacute;t hơn, c&aacute;c g&oacute;c của bức ảnh được m&aacute;y xử l&yacute; kh&aacute; tốt khi vật thể v&agrave; quang cảnh kh&ocirc;ng bị b&oacute;p m&eacute;o qu&aacute; nhiều l&agrave;m mất đi t&iacute;nh ch&acirc;n thực.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/234621/xiaomi-mi-12-040422-110108.jpg\" alt=\"\" /></p>\n<h3>Trải nghiệm mượt hầu hết c&aacute;c t&aacute;c vụ</h3>\n<p>Cung cấp sức mạnh cho Xiaomi 12 l&agrave; con chip thuộc top đầu tr&ecirc;n bảng xếp hạng chipset mạnh mẽ d&agrave;nh cho smartphone (04/2022) đến từ nh&agrave; Qualcomm mang t&ecirc;n&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/kham-pha-chip-snapdragon-8-gen-1-tren-samsung-galaxy-s22-1416106\" target=\"_blank\" rel=\"noopener\">Snapdragon 8 Gen 1 8 nh&acirc;n</a>.</p>\n<p>Để kiểm chứng sức mạnh tr&ecirc;n m&aacute;y th&igrave; m&igrave;nh c&oacute; test qua hai phần mềm đo hiệu năng với số điểm như sau: 1205 (đơn nh&acirc;n), 3405 (đa nh&acirc;n) tr&ecirc;n Benchmark v&agrave; 12936 điểm cho ứng dụng PCMark.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/234621/xiaomi-mi-12-030422-122235.jpg\" alt=\"\" /></p>\n<p>Để đi s&acirc;u v&agrave;o khả năng xử l&yacute; tr&ecirc;n m&aacute;y mạnh mẽ đến đ&acirc;u th&igrave; m&igrave;nh đ&atilde; chơi game tr&ecirc;n Xiaomi qua 2 tr&ograve; chơi phổ biến hiện nay như Li&ecirc;n Qu&acirc;n Mobile v&agrave; PUBG Mobile, được xem l&agrave; hai tựa game đ&ograve;i hỏi về hiệu năng kh&aacute; cao ở thời điểm hiện tại.</p>\n<p>Đầu ti&ecirc;n l&agrave; Li&ecirc;n Qu&acirc;n Mobile, m&igrave;nh chơi với mức cấu h&igrave;nh cao nhất, h&igrave;nh ảnh hiển thị v&ocirc; c&ugrave;ng đẹp mắt, đổ b&oacute;ng nh&acirc;n vật ch&acirc;n thực, kh&ocirc;ng xuất hiện t&igrave;nh trạng khựng hay giật lag, tuy nhi&ecirc;n m&aacute;y n&oacute;ng l&ecirc;n kh&aacute; nhanh khi chơi khoảng từ 15 - 20 ph&uacute;t ở mức cấu h&igrave;nh cao như vậy.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/234621/xiaomi-mi-12-030422-122239.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p><a title=\"Tham khảo một số mẫu điện thoại RAM 8GB đang kinh doanh tại Thế Giới Di Động \" href=\"https://www.thegioididong.com/dtdd-ram-8gb\" target=\"_blank\" rel=\"noopener\">Điện thoại c&oacute; RAM 8 GB</a>&nbsp;đem lại khả năng xử l&yacute; đa nhiệm phải gọi l&agrave; &ldquo;mướt mườn mượt&rdquo;, khựng m&aacute;y khi mở nhiều ứng dụng c&ugrave;ng một l&uacute;c l&agrave; điều dường như kh&ocirc;ng xuất hiện ở sản phẩm n&agrave;y trong l&uacute;c m&igrave;nh sử dụng.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/234621/xiaomi-mi-12-030422-122241.jpg\" alt=\"\" /></p>\n<h3>Thời lượng sử dụng l&acirc;u d&agrave;i</h3>\n<p><a title=\"Tham khảo một số mẫu điện thoại đang kinh doanh tại Thế Giới Di Động \" href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">Điện thoại</a>&nbsp;trang bị vi&ecirc;n pin c&oacute; dung lượng 4500 mAh được xem l&agrave; kh&aacute; ổn, đ&aacute;p ứng thời lượng on screen hơn 7 tiếng* cho c&aacute;c t&aacute;c vụ chơi game, lướt YouTube, Facebook v&agrave; sử dụng tr&igrave;nh duyệt.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/234621/xiaomi-mi-12-030422-122245.jpg\" alt=\"\" /></p>\n<p>Qua những trải nghiệm b&ecirc;n tr&ecirc;n, Xiaomi 12 ho&agrave;n to&agrave;n xứng đ&aacute;ng với mức gi&aacute; trang bị bởi những trải nghiệm tuyệt vời m&agrave; n&oacute; mang lại, l&agrave; một người d&ugrave;ng quen thuộc với hệ điều h&agrave;nh Android, đam m&ecirc; chơi game hiệu năng cao v&agrave; y&ecirc;u th&iacute;ch một thiết bị c&oacute; vẻ ngo&agrave;i cao cấp th&igrave; đ&acirc;y l&agrave; một lựa chọn kh&ocirc;ng thể bỏ qua.</p>', 8, 1, 180, 17, '2022-10-05 20:28:49', 1, 4, 1),
(4, 'OPPO Reno6', '<table style=\"border-collapse: collapse; width: 99.9489%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 38.1562%;\">Dung lượng pin</td>\n<td style=\"width: 61.8438%;\">4310mAh</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">Bluetooth</td>\n<td style=\"width: 61.8438%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">Thương hiệu</td>\n<td style=\"width: 61.8438%;\">OPPO</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">Xuất xứ thương hiệu</td>\n<td style=\"width: 61.8438%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">Camera sau</td>\n<td style=\"width: 61.8438%;\">Ch&iacute;nh 64 MP &amp; Phụ 8 MP, 2 MP</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">Camera trước</td>\n<td style=\"width: 61.8438%;\">32 MP</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">Chip đồ họa (GPU)</td>\n<td style=\"width: 61.8438%;\">Mali-G57 MC3</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">Chip set</td>\n<td style=\"width: 61.8438%;\">MTK Dimensity 800U 5G, tối đa 2.4G</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">K&iacute;ch thước</td>\n<td style=\"width: 61.8438%;\">D&agrave;i 163.6 mm - Ngang 74 mm - D&agrave;y 8.3 mm</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 61.8438%;\">AMOLED</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">H&ocirc;̃ trợ 4G</td>\n<td style=\"width: 61.8438%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">Phụ kiện đi k&egrave;m</td>\n<td style=\"width: 61.8438%;\">S&aacute;ch hướng dẫn</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">Xuất xứ</td>\n<td style=\"width: 61.8438%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">Trọng lượng sản phẩm</td>\n<td style=\"width: 61.8438%;\">193g</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">RAM</td>\n<td style=\"width: 61.8438%;\">8GB</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">ROM</td>\n<td style=\"width: 61.8438%;\">128GB</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 61.8438%;\">6.43 inch</td>\n</tr>\n<tr>\n<td style=\"width: 38.1562%;\">Wifi</td>\n<td style=\"width: 61.8438%;\">C&oacute;</td>\n</tr>\n</tbody>\n</table>', '<h3>Sau khi ra mắt OPPO Reno5 chưa l&acirc;u th&igrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd-oppo\" target=\"_blank\" rel=\"noopener\">OPPO</a>&nbsp;lại cho ra mẫu smartphone mới mang t&ecirc;n&nbsp;<a title=\"Tham khảo điện thoại OPPO Reno6 ch&iacute;nh h&atilde;ng tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd/oppo-reno6\" target=\"_blank\" rel=\"noopener\">OPPO Reno6</a>&nbsp;với h&agrave;ng loạt cải tiến mới về ngoại h&igrave;nh b&ecirc;n ngo&agrave;i lẫn hiệu năng b&ecirc;n trong, mang đến trải nghiệm vượt bật cho người d&ugrave;ng.</h3>\n<h3>Chip Dimensity 900 5G hiệu năng ổn định</h3>\n<p>OPPO Reno6 được trang bị vi xử l&yacute; MediaTek Dimensity 900 đ&aacute;p ứng mọi nhu cầu giải tr&iacute; h&agrave;ng ng&agrave;y, c&oacute; thể chơi tất cả c&aacute;c game phổ biến hiện nay, tạo ấn tượng rất mạnh mẽ cho người d&ugrave;ng trải nghiệm mượt m&agrave; với cấu h&igrave;nh ổn định.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236186/oppo-reno6-1.jpg\" alt=\"\" /></p>\n<p>M&aacute;y hỗ trợ hệ điều h&agrave;nh Android 11 được cải tiến với nhiều t&iacute;nh năng vượt trội. Đi k&egrave;m đ&oacute; l&agrave; điện thoại&nbsp;<a href=\"https://www.thegioididong.com/dtdd-ram-8gb\" target=\"_blank\" rel=\"noopener\">RAM 8 GB</a>&nbsp;cho đa nhiệm thoải m&aacute;i nhiều ứng dụng c&ugrave;ng một l&uacute;c.&nbsp;<a href=\"https://www.thegioididong.com/dtdd-rom-128gb\" target=\"_blank\" rel=\"noopener\">Bộ nhớ trong 128 GB</a>&nbsp;cho bạn thoải m&aacute;i tải những tệp nặng v&agrave; những tựa game y&ecirc;u th&iacute;ch dễ d&agrave;ng hơn.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236186/oppo-reno6-2.jpg\" alt=\"\" /></p>\n<p>Theo xu hướng hiện nay th&igrave; OPPO Reno6 cũng được trang bị kết nối mạng 5G hiện đại với tốc độ truyền tải dữ liệu nhanh hơn gấp nhiều lần 4G, tải mọi game v&agrave; ứng dụng nặng đều kh&ocirc;ng thể l&agrave;m kh&oacute; được sự mạnh mẽ n&agrave;y.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236186/oppo-reno6-3.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<h3>Trải nghiệm th&uacute; vị c&ugrave;ng những bộ ảnh cực chất</h3>\n<p>Mặt sau của OPPO Reno6 sở hữu cụm 3 camera bao gồm: Cảm biến ch&iacute;nh 64 MP, camera g&oacute;c si&ecirc;u rộng&nbsp;8 MP,&nbsp;camera macro&nbsp;2 MP gi&uacute;p người d&ugrave;ng thoải m&aacute;i sử dụng ghi lại những khoảnh khắc h&agrave;ng ng&agrave;y.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236186/oppo-reno6-4.jpg\" alt=\"\" /></p>\n<p>Thiết bị cũng hỗ trợ nhiều chế độ chụp ảnh th&uacute; vị kh&aacute;c như: HDR, chụp x&oacute;a ph&ocirc;ng, quay phim 4K, hỗ trợ quay video Full HD,... đ&aacute;p ứng tốt nhu cầu sử dụng th&ocirc;ng thường.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236186/oppo-reno6-5.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<h3>Thiết kế thời thượng, đẳng cấp</h3>\n<p>Vẻ ngo&agrave;i mảnh mai v&agrave; thon gọn đến bất ngờ với khối lượng chỉ 182 g cho bạn cầm nắm thoải m&aacute;i, bỏ t&uacute;i hay cặp đều tiện lợi.</p>\n<p>Reno6 c&oacute; điểm nổi bật so với thế hệ trước l&agrave; thiết kế nguy&ecirc;n khối vu&ocirc;ng vức kh&aacute; giống với&nbsp;<a title=\"Tham khảo th&ocirc;ng tin iPhone 12 tại thegioididong.com\" href=\"https://www.thegioididong.com/dtdd/iphone-12\" target=\"_blank\" rel=\"noopener\">iPhone 12</a>, mặt sau của m&aacute;y được&nbsp;phủ một lớp nh&aacute;m mờ cho độ b&aacute;m v&acirc;n tay &iacute;t hơn, kh&ocirc;ng bị trơn trượt trong qu&aacute; tr&igrave;nh sử dụng, tạo n&ecirc;n sự sang trọng khi mang theo b&ecirc;n m&igrave;nh.&nbsp;</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236186/oppo-reno6-8.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<h3>Giải tr&iacute; sống động m&agrave;n h&igrave;nh Full HD+</h3>\n<p>Sử dụng c&ocirc;ng nghệ m&agrave;n h&igrave;nh AMOLED với k&iacute;ch thước 6.43 inch c&ugrave;ng độ s&aacute;ng tối đa 750 nits cho t&aacute;i tạo m&agrave;u v&agrave; độ ch&acirc;n thực cao hơn, h&igrave;nh ảnh n&eacute;t hơn, độ tương phản cao gi&uacute;p người d&ugrave;ng c&oacute; thể sử dụng&nbsp;<a href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">điện thoại</a>&nbsp;dưới mọi điều kiện s&aacute;ng v&agrave; g&oacute;c nh&igrave;n rộng hơn đ&aacute;ng kể.&nbsp;</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236186/oppo-reno6-10.jpg\" alt=\"\" /></p>\n<p>Ngo&agrave;i ra, m&agrave;n h&igrave;nh tần số qu&eacute;t&nbsp; 90 Hz v&agrave; tốc độ lấy mẫu cảm ứng từ 180 Hz, mang đến độ mượt m&agrave; trong trải nghiệm.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236186/oppo-reno6-11.jpg\" alt=\"\" /></p>\n<h3>Cả ng&agrave;y tr&agrave;n đầy năng lượng</h3>\n<p>Reno6 sở hữu cho m&igrave;nh vi&ecirc;n pin tương đối khủng, dung lượng 4300 mAh. Như vậy việc sử dụng để quay phim, chụp ảnh li&ecirc;n tục l&ecirc;n đến nhiều tiếng kh&ocirc;ng phải l&agrave; qu&aacute; kh&oacute; khăn với chiếc m&aacute;y n&agrave;y.</p>\n<p>M&aacute;y c&ograve;n được trang bị c&ocirc;ng nghệ&nbsp;<a href=\"https://www.thegioididong.com/dtdd-sac-pin-nhanh\" target=\"_blank\" rel=\"noopener\">điện thoại&nbsp;sạc nhanh</a>&nbsp;65 W, thời gian sạc si&ecirc;u nhanh chỉ với v&agrave;i chục ph&uacute;t, thả ga sử dụng trong một thời gian d&agrave;i m&agrave; đợi kh&ocirc;ng qu&aacute; l&acirc;u.</p>\n<p>T&oacute;m lại, chỉ với gi&aacute; tầm trung bạn đ&atilde; c&oacute; trong tay một chiếc điện thoại c&ugrave;ng nhiều t&iacute;nh năng hấp dẫn, đ&aacute;p ứng c&aacute;c nhu cầu kh&aacute;c nhau, hứa hẹn sẽ l&agrave; mẫu Smartphone ph&ugrave; hợp với nhiều người tin d&ugrave;ng.</p>', 8, 1, 180, 17, '2022-10-05 20:37:02', 1, 5, 1);
INSERT INTO `product` (`id`, `name`, `specifications`, `description`, `width`, `height`, `weight`, `length`, `created_date`, `published`, `brand_id`, `user_id`) VALUES
(5, 'OPPO A95', '<table style=\"border-collapse: collapse; width: 99.9489%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 17.6697%;\">Dung lượng pin</td>\n<td style=\"width: 82.3303%;\">5000 mAh</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Bluetooth</td>\n<td style=\"width: 82.3303%;\">A2DP, LE, v5.0</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Thương hiệu</td>\n<td style=\"width: 82.3303%;\">OPPO</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Xuất xứ thương hiệu</td>\n<td style=\"width: 82.3303%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Camera sau</td>\n<td style=\"width: 82.3303%;\">Ch&iacute;nh 48 MP &amp; Phụ 2 MP, 2 MP</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Camera trước</td>\n<td style=\"width: 82.3303%;\">16 MP</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Hỗ trợ thẻ nhớ ngo&agrave;i</td>\n<td style=\"width: 82.3303%;\">MicroSD</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Chip đồ họa (GPU)</td>\n<td style=\"width: 82.3303%;\">Adreno 610</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Chip set</td>\n<td style=\"width: 82.3303%;\">Snapdragon 662 8 nh&acirc;n</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Chức năng kh&aacute;c</td>\n<td style=\"width: 82.3303%;\">Mở kho&aacute; khu&ocirc;n mặt, Mở kho&aacute; v&acirc;n tay dưới m&agrave;n h&igrave;nh</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Kết nối kh&aacute;c</td>\n<td style=\"width: 82.3303%;\">OTG</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Tốc độ CPU</td>\n<td style=\"width: 82.3303%;\">4 nh&acirc;n 2.0 GHz &amp; 4 nh&acirc;n 1.8 GHz</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Đ&egrave;n Flash</td>\n<td style=\"width: 82.3303%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">K&iacute;ch thước</td>\n<td style=\"width: 82.3303%;\">D&agrave;i 163.6 mm - Ngang 74 mm - D&agrave;y 8.3 mm</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 82.3303%;\">AMOLED</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Ghi &acirc;m</td>\n<td style=\"width: 82.3303%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">GPS</td>\n<td style=\"width: 82.3303%;\">BDS, GALILEO, GLONASS, GPS</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">H&ocirc;̃ trợ 4G</td>\n<td style=\"width: 82.3303%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Jack tai nghe</td>\n<td style=\"width: 82.3303%;\">3.5 mm</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Bộ nhớ khả dụng</td>\n<td style=\"width: 82.3303%;\">Khoảng 115 GB</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Số sim</td>\n<td style=\"width: 82.3303%;\">2</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Loại pin</td>\n<td style=\"width: 82.3303%;\">Li-Po</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Loại Sim</td>\n<td style=\"width: 82.3303%;\">Nano SIM</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Chất liệu</td>\n<td style=\"width: 82.3303%;\">Khung &amp; Mặt lưng thủy tinh hữu cơ</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Nghe nhạc</td>\n<td style=\"width: 82.3303%;\">FLAC, Midi , MP3, OGG</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Xuất xứ</td>\n<td style=\"width: 82.3303%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Cổng sạc</td>\n<td style=\"width: 82.3303%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Trọng lượng sản phẩm</td>\n<td style=\"width: 82.3303%;\">193g</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Quay phim</td>\n<td style=\"width: 82.3303%;\">FullHD 1080p@30fps, HD 720p@30fps</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">RAM</td>\n<td style=\"width: 82.3303%;\">8GB</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Độ ph&acirc;n giải</td>\n<td style=\"width: 82.3303%;\">Full HD+ (1080 x 2400 Pixels)</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">ROM</td>\n<td style=\"width: 82.3303%;\">128 GB</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 82.3303%;\">6.43 inch</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Hỗ trợ thẻ tối đa</td>\n<td style=\"width: 82.3303%;\">256GB</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">T&iacute;nh năng camera</td>\n<td style=\"width: 82.3303%;\">AI Camera, Chuy&ecirc;n nghiệp (Pro), HDR, Lấy n&eacute;t theo pha (PDAF), Si&ecirc;u cận (Macro), To&agrave;n cảnh (Panorama), Tr&ocirc;i nhanh thời gian (Time Lapse), X&oacute;a ph&ocirc;ng</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Wifi</td>\n<td style=\"width: 82.3303%;\">Dual-band (2.4 GHz/5 GHz), Wi-Fi 802.11 a/b/g/n/ac, Wi-Fi Direct, Wi-Fi hotspot</td>\n</tr>\n<tr>\n<td style=\"width: 17.6697%;\">Xem phim</td>\n<td style=\"width: 82.3303%;\">AVI, MP4</td>\n</tr>\n</tbody>\n</table>', '<h3>B&ecirc;n cạnh phi&ecirc;n bản 5G,&nbsp;<a href=\"https://www.thegioididong.com/dtdd-oppo\">OPPO</a>&nbsp;c&ograve;n bổ sung phi&ecirc;n bản&nbsp;<a href=\"https://www.thegioididong.com/dtdd/oppo-a95-4g\">OPPO A95 4G</a>&nbsp;với gi&aacute; th&agrave;nh phải chăng tập trung v&agrave;o thiết kế năng động, sạc nhanh v&agrave; hiệu năng đa nhiệm ấn tượng sẽ gi&uacute;p cho cuộc sống của bạn th&ecirc;m phần hấp dẫn, ngập tr&agrave;n niềm vui.</h3>\n<h3>Thiết kế hiện đại, mỏng nhẹ thời trang</h3>\n<p style=\"font-weight: 400;\">OPPO A95 c&oacute; thiết kế trẻ trung hiện đại với c&ocirc;ng nghệ phủ m&agrave;u độc quyền OPPO. N&oacute; mềm mại mượt m&agrave;, chống m&agrave;i m&ograve;n v&agrave; chống b&aacute;m v&acirc;n tay một c&aacute;ch hiệu quả.</p>\n<p style=\"font-weight: 400;\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/251703/oppo-a95-4g-191121-095705.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p style=\"font-weight: 400;\">Đồng thời mặt lưng m&aacute;y c&ograve;n g&acirc;y ấn tượng lớn cho người d&ugrave;ng với hiệu ứng chuyển m&agrave;u bắt mắt khi thay đổi g&oacute;c nh&igrave;n (ở phi&ecirc;n bản m&agrave;u bạc), điều n&agrave;y gi&uacute;p m&aacute;y trở n&ecirc;n b&oacute;ng bẩy thu h&uacute;t ngay từ &aacute;nh nh&igrave;n đầu ti&ecirc;n.</p>\n<p style=\"font-weight: 400;\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/251703/oppo-a95-4g-191121-095654.jpg\" alt=\"\" /></p>\n<p>OPPO A95 sẽ c&oacute; 2 phi&ecirc;n bản m&agrave;u sắc Glowing Rainbow Silver (Bạc) v&agrave; Glowing Starry Black (Đen) cho người d&ugrave;ng thỏa th&iacute;ch lựa chọn theo sở th&iacute;ch của m&igrave;nh.</p>\n<p>Tổng thể điện thoại rất sang trọng, cảm gi&aacute;c cầm nắm thoải m&aacute;i khi c&oacute; độ mỏng 7.95 mm v&agrave; khối lượng 175 g kết hợp với phần khung viền được l&agrave;m cong 2.5D đem đến trải nghiệm sử dụng v&ocirc; c&ugrave;ng th&iacute;ch th&uacute;.</p>\n<h3>M&agrave;n h&igrave;nh AMOLED ngập tr&agrave;n m&agrave;u sắc sống động</h3>\n<p>Ph&iacute;a trước OPPO A95 l&agrave; m&agrave;n h&igrave;nh \"đục lỗ\" theo xu hướng hiện tại nằm ở vị tr&iacute; ph&iacute;a tr&ecirc;n c&ugrave;ng b&ecirc;n tr&aacute;i như&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại OPPO Reno6 ch&iacute;nh h&atilde;ng\" href=\"https://www.thegioididong.com/dtdd/oppo-reno6\" target=\"_blank\" rel=\"noopener\">OPPO Reno6</a>&nbsp;với k&iacute;ch thước 6.43 inch v&agrave; tỉ lệ hiển thị l&ecirc;n 90.2% rộng lớn để bạn c&oacute; thể tận hưởng c&aacute;c bộ phim y&ecirc;u th&iacute;ch hay chiến game cực đ&atilde;.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/251703/oppo-a95-4g-191121-095711.jpg\" alt=\"\" /></p>\n<p>Hơn nữa tấm nền AMOLED cao cấp với độ ph&acirc;n giải Full HD+ phủ 92% gam m&agrave;u DCI-P3 v&agrave; 100% sRGB, OPPO A95 mang tới chất lượng h&igrave;nh ảnh chi tiết, sắc n&eacute;t, m&agrave;u sắc sống động, gi&uacute;p bạn ch&igrave;m đắm trong kh&ocirc;ng gian giải tr&iacute; ấn tượng.&nbsp;</p>\n<p>Ngo&agrave;i ra, m&aacute;y c&ograve;n hỗ trợ t&iacute;nh năng bảo vệ mắt th&ocirc;ng minh AI c&oacute; khả năng tự động điều chỉnh theo c&aacute;c m&ocirc;i trường &aacute;nh s&aacute;ng kh&aacute;c nhau, gi&uacute;p chăm s&oacute;c v&agrave; bảo vệ đ&ocirc;i mắt của bạn mọi l&uacute;c mọi nơi, kể cả ng&agrave;y hay đ&ecirc;m.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/251703/oppo-a95-4g-191121-101307.jpg\" alt=\"\" /></p>\n<p>Cảm biến v&acirc;n tay của m&aacute;y cũng được t&iacute;ch hợp v&agrave;o trong m&agrave;n h&igrave;nh cho thao t&aacute;c mở kh&oacute;a nhanh ch&oacute;ng, tiện lợi chỉ bằng một c&aacute;i chạm nhẹ.</p>\n<h3>Hiệu năng giải tr&iacute; ấn tượng</h3>\n<p>Về cấu h&igrave;nh mẫu smartphone n&agrave;y được trang bị con chip xử l&yacute; Snapdragon 662 8 nh&acirc;n cho hiệu năng ổn định, mượt m&agrave; với c&aacute;c t&aacute;c vụ h&agrave;ng ng&agrave;y cũng như cải thiện hiệu suất để trải nghiệm chơi game tốt hơn.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/251703/oppo-a95-4g-191121-095714.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Đồng thời, OPPO c&ograve;n trang bị cho A95 bộ nhớ&nbsp;<a href=\"https://www.thegioididong.com/dtdd-ram-8gb\" target=\"_blank\" rel=\"noopener\">RAM 8 GB</a>&nbsp;hỗ trợ c&ocirc;ng nghệ RAM mở rộng tối đa 5 GB, được ph&aacute;t triển để đem tới 13 GB gi&uacute;p m&aacute;y đa nhiệm tốt hơn cải thiện hiệu suất đọc dữ liệu giảm tỷ lệ mất khung h&igrave;nh để đảm bảo bạn lu&ocirc;n c&oacute; được những trải nghiệm sử dụng tốt nhất.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/251703/oppo-a95-4g-191121-095656.jpg\" alt=\"\" /></p>\n<p>Bộ nhớ trong của m&aacute;y cũng được n&acirc;ng cấp l&ecirc;n tới 128 GB, bạn sẽ thỏa th&iacute;ch lưu trữ dữ liệu c&agrave;i đặt ứng dụng, h&igrave;nh ảnh, video y&ecirc;u th&iacute;ch.</p>\n<p>OPPO A95 sẽ được c&agrave;i sẵn giao diện người d&ugrave;ng ColorOS 11.1 t&ugrave;y biến tr&ecirc;n nền tảng hệ điều h&agrave;nh Android 11 t&iacute;ch hợp nhiều t&iacute;nh năng th&ocirc;ng minh cho bạn thoải m&aacute;i sử dụng.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/251703/oppo-a95-4g-191121-095652.jpg\" alt=\"\" /></p>\n<h3>Bộ 3 camera 48 MP hỗ trợ nhiều chế độ chụp</h3>\n<p>OPPO A95 trang bị 1 thiết lập hệ thống 3 camera đặt trong module h&igrave;nh chữ nhật l&agrave; điểm nhấn với độ ph&acirc;n giải lần lượt l&agrave; camera ch&iacute;nh 48 MP,&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại smartphone camera macro\" href=\"https://www.thegioididong.com/dtdd-camera-macro\" target=\"_blank\" rel=\"noopener\">cảm biến macro</a>&nbsp;2 MP v&agrave; cuối c&ugrave;ng l&agrave; cảm biến đo chiều s&acirc;u 2 MP phương tiện ho&agrave;n hảo để ghi lại những khoảnh khắc đ&aacute;ng nhớ trong cuộc sống.</p>\n<p>Camera ch&iacute;nh 48 MP cho chất lượng h&igrave;nh ảnh sắc n&eacute;t, r&otilde; r&agrave;ng, m&agrave;u sắc h&agrave;i h&ograve;a. Bạn c&oacute; thể dễ d&agrave;ng chụp đ&ecirc;m, ph&oacute;ng to hay thu nhỏ c&aacute;c chi tiết tr&ecirc;n ảnh để kh&ocirc;ng bỏ lỡ khoảnh khắc n&agrave;o.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/251703/oppo-a95-4g-191121-095700.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Ngo&agrave;i ra, OPPO A95 t&iacute;ch hợp camera selfie 16 MP, hỗ trợ c&ocirc;ng nghệ l&agrave;m đẹp th&ocirc;ng minh mang tới những khung h&igrave;nh rạng rỡ nhưng vẫn rất tự nhi&ecirc;n, ghi lại một c&aacute;ch trọn vẹn mọi g&oacute;c nh&igrave;n thần th&aacute;i của bạn.</p>\n<h3>Vi&ecirc;n pin lớn sử dụng cả ng&agrave;y d&agrave;i</h3>\n<p>Với vi&ecirc;n pin 5000 mAh, OPPO A95 mang đến thời lượng ấn tượng để lu&ocirc;n đồng h&agrave;nh c&ugrave;ng bạn trong cả ng&agrave;y d&agrave;i m&agrave; kh&ocirc;ng cần lo cắm sạc th&ecirc;m. Tuy trang bị vi&ecirc;n pin lớn nhưng m&aacute;y c&oacute; độ mỏng chỉ 7.95 mm kh&aacute; ấn tượng.</p>\n<p>Th&ecirc;m nữa,&nbsp;<a href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">điện thoại</a>&nbsp;được trang bị c&ocirc;ng nghệ sạc nhanh 33 W, cho ph&eacute;p bạn sạc đến 54% chỉ trong 30 ph&uacute;t, tiết kiệm thời gian hiệu quả. Đi k&egrave;m đ&oacute; c&ograve;n c&oacute; t&iacute;nh năng bảo vệ sạc đ&ecirc;m rất an to&agrave;n d&agrave;nh cho người d&ugrave;ng thường xuy&ecirc;n sạc qua đ&ecirc;m.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/251703/oppo-a95-4g-191121-100920.jpg\" alt=\"\" /></p>\n<p>Nh&igrave;n chung, OPPO A95 l&agrave; chiếc điện thoại th&ocirc;ng minh c&oacute; cấu h&igrave;nh mạnh, thời lượng pin đủ d&ugrave;ng trọn ng&agrave;y, chất lượng ảnh chụp l&agrave; kh&aacute; tốt v&agrave; cũng l&agrave; cỗ m&aacute;y chiến game gi&uacute;p bạn thư gi&atilde;n rất hiệu quả.</p>', 8, 1, 180, 17, '2022-10-05 20:47:43', 1, 5, 1),
(6, 'OPPO Reno8', '<table style=\"border-collapse: collapse; width: 99.975%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 40.5786%;\">Dung lượng pin</td>\n<td style=\"width: 59.3958%;\">4500mah</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Bluetooth</td>\n<td style=\"width: 59.3958%;\">5.1</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Thương hiệu</td>\n<td style=\"width: 59.3958%;\">OPPO</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Chip đồ họa (GPU)</td>\n<td style=\"width: 59.3958%;\">ARM G-77 MC9 3D Graphics@866MHz</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Chip set</td>\n<td style=\"width: 59.3958%;\">Qualcomm Snapdragon 695 5G</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Tốc độ CPU</td>\n<td style=\"width: 59.3958%;\">tối đa 2.2GHz</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">K&iacute;ch thước</td>\n<td style=\"width: 59.3958%;\">\n<p>160 x 73.4 x 7.67 mm</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 59.3958%;\">AMOLED</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Hỗ trợ 5G</td>\n<td style=\"width: 59.3958%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Model</td>\n<td style=\"width: 59.3958%;\">Reno8 5G</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Jack tai nghe</td>\n<td style=\"width: 59.3958%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Bộ nhớ khả dụng</td>\n<td style=\"width: 59.3958%;\">256GB</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Số sim</td>\n<td style=\"width: 59.3958%;\">2</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Loại Sim</td>\n<td style=\"width: 59.3958%;\">Nano sim</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Pin c&oacute; thể th&aacute;o rời</td>\n<td style=\"width: 59.3958%;\">Nguy&ecirc;n Khối</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Cổng sạc</td>\n<td style=\"width: 59.3958%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Trọng lượng sản phẩm</td>\n<td style=\"width: 59.3958%;\">Khoảng 179g (Bao gồm pin)</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">RAM</td>\n<td style=\"width: 59.3958%;\">8GB</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Độ ph&acirc;n giải</td>\n<td style=\"width: 59.3958%;\">Full HD+ (1080 x 2400 Pixels)</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">ROM</td>\n<td style=\"width: 59.3958%;\">256GB</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 59.3958%;\">6.4 inch</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">Wifi</td>\n<td style=\"width: 59.3958%;\">Wifi 2.4G/5G, 802.11 a/b/g/n/ac</td>\n</tr>\n<tr>\n<td style=\"width: 40.5786%;\">C&oacute; thuế VAT</td>\n<td style=\"width: 59.3958%;\">C&oacute;</td>\n</tr>\n</tbody>\n</table>', '<h3>Reno8 - sản phẩm tầm trung được OPPO đầu tư kỹ lưỡng về thiết kế lẫn cấu h&igrave;nh, khi sở hữu vẻ ngo&agrave;i vu&ocirc;ng vức hợp xu hướng, hiệu năng ổn định mang đến trải nghiệm mượt m&agrave; c&ugrave;ng với cụm camera c&oacute; khả năng chụp ảnh đẹp mắt.</h3>\n<h3>Vẻ đẹp đến từ sự đơn giản</h3>\n<p><a title=\"Tham khảo một số mẫu điện thoại đang kinh doanh tại Thế Giới Di Động \" href=\"https://www.thegioididong.com/dtdd/oppo-reno8-4g\" target=\"_blank\" rel=\"noopener\">Điện thoại OPPO Reno8</a>&nbsp;sở hữu thiết kế mỏng 7.66 mm kh&aacute; ấn tượng, c&aacute;c cạnh được l&agrave;m nhựa v&agrave; thiết kế vu&ocirc;ng vức. M&agrave;u sắc tr&ecirc;n Reno8 cũng kh&aacute; trẻ trung với 2 phi&ecirc;n bản m&agrave;u sắc gồm v&agrave;ng đồng v&agrave; đen.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/285029/oppo-reno8-4g-170922-104505.jpg\" alt=\"\" width=\"1020\" height=\"574\" /></p>\n<p>Mặt lưng của m&aacute;y được l&agrave;m từ k&iacute;nh gi&uacute;p tăng độ sang trọng cho thiết bị, cụm camera được thiết kế trong một m&ocirc;-đun h&igrave;nh chữ nhật c&ugrave;ng với hai t&ocirc;ng m&agrave;u trắng đen l&agrave;m thu h&uacute;t mọi &aacute;nh nh&igrave;n.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/285029/oppo-reno8-4g-170922-104601.jpg\" alt=\"\" /></p>\n<p>OPPO đ&atilde; trang bị c&ocirc;ng nghệ độc quyền OPPO Glow l&ecirc;n mặt lưng của&nbsp;<a title=\"Tham khảo một số mẫu điện thoại đang kinh doanh tại Thế Giới Di Động \" href=\"https://www.thegioididong.com/dtdd-oppo-reno\" target=\"_blank\" rel=\"noopener\">điện thoại Reno</a>, n&ecirc;n khi m&igrave;nh sử dụng ngo&agrave;i trời th&igrave; mặt lưng chuyển đổi m&agrave;u sắc &oacute;ng &aacute;nh rất đẹp mắt điều đ&oacute; gi&uacute;p m&igrave;nh trở n&ecirc;n nổi bật hơn.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/285029/oppo-reno8-4g-170922-104747.jpg\" alt=\"\" width=\"1020\" height=\"574\" /></p>\n<p>Mặt trước của m&aacute;y được thiết kế dạng đục lỗ điều n&agrave;y l&agrave;m tăng diện t&iacute;ch hiển thị tr&ecirc;n m&aacute;y, cạnh viền hai b&ecirc;n m&agrave;n h&igrave;nh được l&agrave;m kh&aacute; mỏng, tuy nhi&ecirc;n phần cạnh dưới vẫn c&ograve;n hơi d&agrave;y nhưng trong khi sử dụng m&igrave;nh cũng kh&ocirc;ng cảm thấy qu&aacute; bất tiện.</p>\n<h3>Tinh tế qua mỗi lần chạm</h3>\n<p>M&igrave;nh đ&atilde; rất ấn tượng với những g&igrave; m&agrave;&nbsp;<a title=\"Tham khảo một số mẫu điện thoại đang kinh doanh tại Thế Giới Di Động \" href=\"https://www.thegioididong.com/dtdd-oppo\" target=\"_blank\" rel=\"noopener\">OPPO</a>&nbsp;đ&atilde; trang bị l&ecirc;n camera của Reno8 với cảm biến ch&iacute;nh c&oacute; độ ph&acirc;n giải 64 MP, v&igrave; thế những tấm ảnh được chụp từ cảm biến ch&iacute;nh c&oacute; độ sắc n&eacute;t, m&agrave;u sắc tươi, h&igrave;nh ảnh được t&aacute;i tạo kh&aacute; chi tiết. Hai cảm biến c&ograve;n lại đều c&oacute; độ ph&acirc;n giải 2 MP hỗ trợ bạn chụp những bức ảnh x&oacute;a ph&ocirc;ng hoặc chụp macro được tốt hơn.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/285029/oppo-reno8-4g-170922-105002.jpg\" alt=\"\" width=\"1020\" height=\"574\" /></p>\n<p>Thật sự m&igrave;nh rất th&iacute;ch những tấm ảnh được chụp bằng Reno8, ở m&ocirc;i trường đầy đủ s&aacute;ng v&agrave; bật chế độ AI, bức ảnh m&igrave;nh thu được c&oacute; độ chi tiết tốt, m&agrave;u sắc kh&aacute; rực, những vật nhỏ xung quanh được t&aacute;i tạo r&otilde; r&agrave;ng, kh&ocirc;ng bị mờ.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/285029/oppo-reno8-4g-170922-105309.jpg\" alt=\"\" /></p>\n<p>Chế độ hiển vi tr&ecirc;n m&aacute;y rất l&agrave; th&uacute; vị, giờ đ&acirc;y chiếc điện thoại của bạn sẽ trở th&agrave;nh một chiếc k&iacute;nh hiển vi c&oacute; thể ph&oacute;ng những vật nhỏ l&ecirc;n đến 30 lần gi&uacute;p bạn chụp được những bức ảnh độc đ&aacute;o ngay tr&ecirc;n chiếc điện thoại di động.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/285029/oppo-reno8-4g-170922-105836.jpg\" alt=\"\" /></p>\n<p>Ở chế độ chụp ngược s&aacute;ng th&igrave; camera tr&ecirc;n Reno8 cũng l&agrave;m kh&aacute; tốt, c&aacute;c chi tiết thu lại đầy đủ, v&ugrave;ng tối được t&aacute;i hiện kh&aacute; tốt, nh&igrave;n chung tổng thể bức ảnh đẹp mắt.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/285029/oppo-reno8-4g-170922-110346.jpg\" alt=\"\" /></p>\n<p>Camera selfie của m&aacute;y c&oacute; độ ph&acirc;n giải 32 MP c&ugrave;ng với đ&oacute; l&agrave; những t&iacute;nh năng l&agrave;m đẹp, nh&atilde;n d&aacute;n, HDR hỗ trợ tối đa cho bạn khi chụp ảnh trong mọi điều kiện &aacute;nh s&aacute;ng. Bạn sẽ sở hữu một bức ảnh đẹp, cuốn h&uacute;t m&agrave; kh&ocirc;ng cần phải d&ugrave;ng đến app của b&ecirc;n thứ ba.</p>\n<h3>Thư gi&atilde;n qua những thước phim</h3>\n<p>Nhằm mang đến ph&uacute;t gi&acirc;y thư gi&atilde;n sau một ng&agrave;y d&agrave;i l&agrave;m việc, h&atilde;ng đ&atilde; trang bị cho Reno8 m&agrave;n h&igrave;nh k&iacute;ch thước 6.4 inch đi k&egrave;m với tấm nền AMOLED v&agrave; độ ph&acirc;n giải Full HD+ cho kh&ocirc;ng gian hiển thị rộng r&atilde;i.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/285029/oppo-reno8-4g-170922-110518.jpg\" alt=\"\" /></p>\n<p>Những th&ocirc;ng số tr&ecirc;n gi&uacute;p h&igrave;nh ảnh khi xem c&oacute; m&agrave;u sắc rực rỡ, độ nổi khối tốt, h&igrave;nh ảnh cực kỳ sắc n&eacute;t, m&agrave;u đen s&acirc;u rất nịnh mắt, mang đến cho bạn những ph&uacute;t gi&acirc;y giải tr&iacute; tuyệt vời hơn.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/285029/oppo-reno8-4g-170922-110607.jpg\" alt=\"\" /></p>\n<p>Tr&ecirc;n OPPO Reno8 c&oacute; t&iacute;nh năng cử chỉ kh&ocirc;ng chạm kh&aacute; l&agrave; th&uacute; vị, khi m&igrave;nh lướt TikTok hoặc Facebook m&igrave;nh kh&ocirc;ng cần chạm v&agrave;o m&agrave;n h&igrave;nh m&agrave; vẫn c&oacute; thể cuộn trang một c&aacute;ch rất linh hoạt nhờ t&iacute;nh năng n&agrave;y.&nbsp;</p>\n<p>Độ s&aacute;ng 600 nits cho chất lượng hiển thị kh&aacute; ổn khi ở ngo&agrave;i trời, m&igrave;nh thử nghi&ecirc;ng m&agrave;n h&igrave;nh nhẹ qua th&igrave; chất lượng h&igrave;nh ảnh hiển thị cũng kh&ocirc;ng bị biến đổi qu&aacute; nhiều, kh&ocirc;ng ảnh hưởng g&igrave; nhiều đến trải nghiệm.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/285029/oppo-reno8-4g-170922-110731.jpg\" alt=\"\" width=\"1020\" height=\"574\" /></p>\n<h3>Sức mạnh cho mọi trải nghiệm</h3>\n<p>Mang trong m&igrave;nh chipset Snapdragon 680 đ&acirc;y l&agrave; con chip quốc d&acirc;n trong ph&acirc;n kh&uacute;c tầm trung, tốc độ CPU tối đa đạt 2.4 GHz mang đến cho bạn một hiệu năng ổn định, mượt m&agrave; với những t&aacute;c vụ cơ bản như: Đọc b&aacute;o, lướt web, chơi game.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/285029/oppo-reno8-4g-170922-111429.jpg\" alt=\"\" width=\"1020\" height=\"459\" /></p>\n<p>Điểm l&agrave;m m&igrave;nh bất ngờ khi tr&ecirc;n điện thoại Reno8 m&igrave;nh c&oacute; thể bật ở mức cấu h&igrave;nh cao nhất với tựa game Li&ecirc;n Qu&acirc;n Mobile, h&igrave;nh ảnh c&oacute; độ chi tiết tốt, m&agrave;u sắc tươi tắn. T&igrave;nh trạng giật lag nhẹ vẫn xảy ra khi bật cấu h&igrave;nh tối đa ở những pha combat tổng cuối game, FPS trung b&igrave;nh dao động khoảng 59 cho cả trận game. Để tối ưu hơn v&agrave; giảm t&igrave;nh trạng giật lag bạn n&ecirc;n chỉnh cấu h&igrave;nh trung b&igrave;nh để trải nghiệm tốt nhất.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/285029/oppo-reno8-4g-170922-112043.jpg\" alt=\"\" /></p>\n<p>Reno8 c&oacute; tần số qu&eacute;t 90 Hz n&ecirc;n trong khi chơi game m&igrave;nh cảm thấy h&igrave;nh ảnh chuyển động rất mượt m&agrave;, kh&ocirc;ng bị lag v&agrave; kh&ocirc;ng gặp phải t&igrave;nh trạng mỏi mắt sau một thời gian d&agrave;i chơi game.</p>\n<h3>Đi c&ugrave;ng bạn đến mọi nẻo đường</h3>\n<p>Với vi&ecirc;n pin 4500 mAh c&ugrave;ng con chip kh&ocirc;ng ti&ecirc;u tốn qu&aacute; nhiều năng lượng, mang đến thời gian sử dụng ổn định m&agrave; kh&ocirc;ng qu&aacute; quan ngại về vấn đề hết pin khi đang d&ugrave;ng trong ng&agrave;y. Với dung lượng như vậy m&igrave;nh đ&atilde; sử dụng khoảng hơn 7 tiếng với c&aacute;c t&aacute;c vụ đọc b&aacute;o, lướt web hay chơi game.</p>\n<p>Ngo&agrave;i ra, thời gian sạc pin cũng rất nhanh ch&oacute;ng khi m&aacute;y hỗ trợ&nbsp;<a title=\"Tham khảo điện thoại sạc si&ecirc;u nhanh tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-sac-sieu-nhanh\" target=\"_blank\" rel=\"noopener\">sạc si&ecirc;u nhanh</a>&nbsp;33 W gi&uacute;p bạn tiết kiệm tối đa thời gian chờ đợi, bạn sẽ mất khoảng 1 tiếng để đợi vi&ecirc;n pin được lấp đầy 100% v&agrave; tiếp tục bắt kịp nhịp sống năng động.</p>\n<p>OPPO Reno8 với những điểm s&aacute;ng gi&aacute; từ thiết kế cho đến camera v&agrave; hiệu năng, đ&acirc;y sẽ l&agrave; một lựa chọn kh&ocirc;ng thể bỏ qua đối với những ai đang mong muốn t&igrave;m kiếm cho m&igrave;nh một thiết bị tầm trung, đ&aacute;p ứng tốt hầu hết mọi nhu cầu h&agrave;ng ng&agrave;y.</p>', 8, 1, 180, 17, '2022-10-05 20:57:42', 1, 5, 1),
(7, 'Samsung Galaxy A13', '<table style=\"border-collapse: collapse; width: 99.9489%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 49.2958%;\">C&oacute; thuế VAT</td>\n<td style=\"width: 50.7042%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Dung lượng pin</td>\n<td style=\"width: 50.7042%;\">5000 mAh</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Bluetooth</td>\n<td style=\"width: 50.7042%;\">c&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Thương hiệu</td>\n<td style=\"width: 50.7042%;\">Samsung</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Xuất xứ thương hiệu</td>\n<td style=\"width: 50.7042%;\">H&agrave;n Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Chip đồ họa (GPU)</td>\n<td style=\"width: 50.7042%;\">Mali-G52</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Kết nối kh&aacute;c</td>\n<td style=\"width: 50.7042%;\">c&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Tốc độ CPU</td>\n<td style=\"width: 50.7042%;\">2.0 GHz</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 50.7042%;\">PLS TFT LCD</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Ghi &acirc;m</td>\n<td style=\"width: 50.7042%;\">c&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">H&ocirc;̃ trợ 4G</td>\n<td style=\"width: 50.7042%;\">c&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Model</td>\n<td style=\"width: 50.7042%;\">SM-A135F/DS</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Jack tai nghe</td>\n<td style=\"width: 50.7042%;\">3.5 mm</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Bộ nhớ khả dụng</td>\n<td style=\"width: 50.7042%;\">128GB</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Số sim</td>\n<td style=\"width: 50.7042%;\">2</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Loại pin</td>\n<td style=\"width: 50.7042%;\">Li-Po</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Loại Sim</td>\n<td style=\"width: 50.7042%;\">Nano</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Nh&agrave; sản xuất</td>\n<td style=\"width: 50.7042%;\">Samsung</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Nghe nhạc</td>\n<td style=\"width: 50.7042%;\">c&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Xuất xứ</td>\n<td style=\"width: 50.7042%;\">Việt Nam</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Cổng sạc</td>\n<td style=\"width: 50.7042%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Trọng lượng sản phẩm</td>\n<td style=\"width: 50.7042%;\">195g</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Quay phim</td>\n<td style=\"width: 50.7042%;\">c&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">RAM</td>\n<td style=\"width: 50.7042%;\">4GB</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Độ ph&acirc;n giải</td>\n<td style=\"width: 50.7042%;\">1080 x 2408 (FHD+)</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">ROM</td>\n<td style=\"width: 50.7042%;\">128GB</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 50.7042%;\">6.6 inch</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Hỗ trợ thẻ tối đa</td>\n<td style=\"width: 50.7042%;\">MicroSD, hỗ trợ tối đa 1 TB</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">T&iacute;nh năng camera</td>\n<td style=\"width: 50.7042%;\">c&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Video call</td>\n<td style=\"width: 50.7042%;\">c&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Wifi</td>\n<td style=\"width: 50.7042%;\">c&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 49.2958%;\">Xem phim</td>\n<td style=\"width: 50.7042%;\">c&oacute;</td>\n</tr>\n</tbody>\n</table>', '<h3>Nhằm mang trải nghiệm tốt hơn tr&ecirc;n d&ograve;ng sản phẩm gi&aacute; rẻ,&nbsp;<a title=\"Tham khảo điện thoại Samsung kinh doanh tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-samsung\" target=\"_blank\" rel=\"noopener\">Samsung</a>&nbsp;cho ra mắt&nbsp;<a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-a13-4g\" target=\"_blank\" rel=\"noopener\">Galaxy A13 4G</a>&nbsp;với một hiệu năng ổn định, camera chụp ảnh sắc n&eacute;t v&agrave; vi&ecirc;n pin khủng đ&aacute;p ứng nhu cầu sử dụng cả ng&agrave;y cho bạn c&ugrave;ng một mức gi&aacute; trang bị cực kỳ phải chăng.</h3>\n<h3>Ngoại h&igrave;nh b&oacute;ng bẩy</h3>\n<p>Galaxy A13 c&oacute; khung viền được ho&agrave;n thiện từ nhựa b&oacute;ng mang đến c&aacute;i nh&igrave;n mới mẻ, &oacute;ng &aacute;nh khi cầm tr&ecirc;n tay, tuy nhi&ecirc;n t&igrave;nh trạng b&aacute;m dấu v&acirc;n tay, mồ h&ocirc;i vẫn sẽ xuất hiện trong l&uacute;c sử dụng, người d&ugrave;ng c&oacute; thể trang bị ốp lưng cho m&aacute;y nhằm khắc phục t&igrave;nh trạng tr&ecirc;n cũng như hạn chế trầy xước trong l&uacute;c sử dụng.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/262402/samsung-galaxy-a13-4g-150422-113132.jpg\" alt=\"\" /></p>\n<p>M&aacute;y c&oacute; độ ho&agrave;n thiện tốt, c&aacute;c chi tiết nhỏ như cổng sạc, jack cắm tai nghe, cảm biến loa thoại đều được h&atilde;ng gia c&ocirc;ng rất tỉ mỉ v&agrave; gần như kh&ocirc;ng xuất hiện chi tiết thừa.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/262402/samsung-galaxy-a13-4g-150422-113130.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Giờ đ&acirc;y h&atilde;ng đ&atilde; bố tr&iacute; c&aacute;c ống k&iacute;nh một c&aacute;ch ri&ecirc;ng lẻ v&agrave; kh&ocirc;ng được bao bọc bởi một cụm n&agrave;o cả tr&ocirc;ng rất độc lạ, viền của camera được Samsung thiết kế c&oacute; phần hơi nh&ocirc; ra một ch&uacute;t gi&uacute;p m&igrave;nh an t&acirc;m hơn trong l&uacute;c sử dụng m&agrave; kh&ocirc;ng qu&aacute; lo lắng đến vấn đề trầy xước ống k&iacute;nh.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/262402/samsung-galaxy-a13-4g-150422-113134.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<h3>Chụp ảnh sắc n&eacute;t nhờ cụm camera th&ocirc;ng minh</h3>\n<p>Trang bị 4 camera với camera ch&iacute;nh c&oacute; độ ph&acirc;n giải l&ecirc;n đến 50 MP,&nbsp;<a href=\"https://www.thegioididong.com/dtdd-camera-goc-rong\" target=\"_blank\" rel=\"noopener\">camera g&oacute;c si&ecirc;u rộng</a>&nbsp;5 MP v&agrave; 2 cảm biến phụ 2 MP gi&uacute;p thiết bị bắt lại những khoảnh khắc xung quanh một c&aacute;ch r&otilde; n&eacute;t.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/262402/samsung-galaxy-a13-4g-150422-113129.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>M&igrave;nh c&oacute; sử dụng Galaxy A13 để chụp ngo&agrave;i trời th&igrave; thấy bức ảnh mang lại c&oacute; độ sắc n&eacute;t cao, những chi tiết nhỏ như l&aacute; c&acirc;y, thanh cửa, b&oacute;ng r&acirc;m đều được t&aacute;i hiện r&otilde; r&agrave;ng, ảnh kh&ocirc;ng qu&aacute; vỡ khi zoom l&ecirc;n khi hậu kỳ chỉnh sửa.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/262402/samsung-galaxy-a13-4g-150422-113136.jpg\" alt=\"\" /></p>\n<p>Tiếp đến l&agrave; t&iacute;nh năng chụp ảnh x&oacute;a ph&ocirc;ng th&igrave; m&aacute;y xử l&yacute; kh&aacute; tốt khi kh&ocirc;ng thấy xuất hiện t&igrave;nh trạng lẹm ảnh, bạn nữ m&agrave; m&igrave;nh chụp được t&aacute;ch biệt khỏi nền một c&aacute;ch c&oacute; chiều s&acirc;u l&agrave;m m&igrave;nh kh&aacute; ấn tượng.</p>\n<p>Cuối c&ugrave;ng l&agrave; t&iacute;nh năng chụp ảnh g&oacute;c si&ecirc;u rộng, Galaxy A13 gi&uacute;p m&igrave;nh bắt trọn khung cảnh với độ bao qu&aacute;t lớn, h&igrave;nh ảnh được thể hiện một c&aacute;ch chi tiết, c&aacute;c g&oacute;c mở rộng kh&ocirc;ng bị b&oacute;p m&eacute;o qu&aacute; nhiều để giữ lại độ ch&acirc;n thực vốn c&oacute;.</p>\n<p>Ở phần mặt trước m&aacute;y trang bị camera selfie 8 MP gi&uacute;p bức ảnh c&oacute; độ chi tiết tốt, m&agrave;u da được t&aacute;i tạo ch&acirc;n thực, tuy nhi&ecirc;n t&igrave;nh trạng bệt ảnh vẫn c&ograve;n xuất hiện nhưng kh&ocirc;ng đ&aacute;ng kể.</p>\n<h3>M&agrave;n h&igrave;nh k&iacute;ch thước lớn</h3>\n<p>M&aacute;y sử dụng tấm nền PLS TFT LCD c&oacute; k&iacute;ch thước đến 6.6 inch c&ugrave;ng độ ph&acirc;n giải Full HD+, mang lại h&igrave;nh ảnh c&oacute; độ chi tiết cao, t&aacute;i tạo m&agrave;u sắc ch&acirc;n thực c&ugrave;ng kh&ocirc;ng gian hiển thị &ldquo;khủng&rdquo; gi&uacute;p m&igrave;nh xem phim, chơi game đ&atilde; mắt hơn.</p>\n<p>Xem th&ecirc;m:&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-pls-tft-lcd-la-gi-1323627\" target=\"_blank\" rel=\"noopener\">M&agrave;n h&igrave;nh PLS TFT LCD l&agrave; g&igrave;?</a></p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/262402/samsung-galaxy-a13-4g-150422-113144.jpg\" alt=\"\" /></p>\n<p>Trang bị tr&ecirc;n phần m&agrave;n h&igrave;nh l&agrave; k&iacute;nh cường lực Gorilla Glass 5 gi&uacute;p hạn chế c&aacute;c vết trầy xước cũng như gia tăng độ bền cho thiết bị, gi&uacute;p m&igrave;nh an t&acirc;m hơn đ&ocirc;i ch&uacute;t khi thường xuy&ecirc;n đặt&nbsp;<a href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">điện thoại</a>&nbsp;trong balo c&ugrave;ng nhiều vật dụng linh tinh c&oacute; đầu nhọn như: Ch&igrave;a kh&oacute;a, b&uacute;t, c&agrave;i t&oacute;c,...</p>\n<p>Xem th&ecirc;m:&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-cac-mat-kinh-cuong-luc-gorilla-glass-1172198\" target=\"_blank\" rel=\"noopener\">K&iacute;nh cường lực Gorilla Glass l&agrave; g&igrave;? So s&aacute;nh giữa thế hệ 5, 6 v&agrave; Victus</a></p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/262402/samsung-galaxy-a13-4g-150422-113146.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<h3>Sử dụng ổn định nhờ chip nh&agrave; l&agrave;m</h3>\n<p>Galaxy A13 được trang bị con chip Exynos 850 8 nh&acirc;n với hiệu suất tối đa 2.0 GHz những t&aacute;c vụ như: Nhắn tin, nghe nhạc hay xem phim đều được m&aacute;y vận h&agrave;nh rất trơn tru.</p>\n<p>Xem th&ecirc;m:&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/chip-exynos-850-la-gi-hieu-nang-nhu-the-nao-1344173\" target=\"_blank\" rel=\"noopener\">T&igrave;m hiểu về chip Exynos 850 - C&oacute; đặc điểm g&igrave; nổi bật, C&oacute; tốt kh&ocirc;ng?</a></p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/262402/samsung-galaxy-a13-4g-150422-113150.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Tr&ecirc;n tựa game PUBG Mobile với mức đồ họa c&acirc;n bằng v&agrave; tốc độ khung h&igrave;nh cực cao, m&aacute;y đ&aacute;p ứng qu&aacute; tr&igrave;nh chơi ở mức FPS dao động từ 20 - 28, bạn c&oacute; thể hạ tốc độ khung h&igrave;nh xuống để c&oacute; trải nghiệm chơi tốt hơn.&nbsp;</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/262402/samsung-galaxy-a13-4g-150422-113152.jpg\" alt=\"\" /></p>\n<p>Galaxy A13 sở hữu&nbsp;<a href=\"https://www.thegioididong.com/dtdd-ram-4gb\" target=\"_blank\" rel=\"noopener\">RAM 4 GB</a>&nbsp;v&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd-rom-128gb\" target=\"_blank\" rel=\"noopener\">bộ nhớ trong 128 GB</a>&nbsp;gi&uacute;p thiết bị đa nhiệm kh&aacute; tốt c&ugrave;ng kh&ocirc;ng gian lưu trữ đ&aacute;p ứng vừa đủ nhu cầu tải xuống dữ liệu cho một lượng h&igrave;nh ảnh v&agrave; ứng dụng tương đối lớn.</p>\n<h3>Thoải m&aacute;i sử dụng nhờ vi&ecirc;n pin tr&acirc;u</h3>\n<p>Với một vi&ecirc;n pin 5000 mAh c&ugrave;ng một con chip kh&ocirc;ng ti&ecirc;u tốn nhiều điện năng l&agrave;m cho m&igrave;nh kh&ocirc;ng qu&aacute; lo lắng đến thời lượng sử dụng, m&igrave;nh c&oacute; d&ugrave;ng để phục vụ c&aacute;c c&ocirc;ng việc như: Nghe nhạc, xem phim, chơi game th&igrave; thấy Galaxy A13 đ&aacute;p ứng hơn 8 giờ* li&ecirc;n tục.</p>', 8, 1, 180, 17, '2022-10-05 21:11:31', 1, 1, 1),
(8, 'Samsung Galaxy A53 5G', '<table style=\"border-collapse: collapse; width: 99.9489%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 26.5045%;\">Bluetooth</td>\n<td style=\"width: 73.4955%;\">v5.1</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Thương hiệu</td>\n<td style=\"width: 73.4955%;\">Samsung</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Hỗ trợ thẻ nhớ ngo&agrave;i</td>\n<td style=\"width: 73.4955%;\">MicroSD</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Chip set</td>\n<td style=\"width: 73.4955%;\">Exynos 1280 8 nh&acirc;n</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Kết nối kh&aacute;c</td>\n<td style=\"width: 73.4955%;\">NFC</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Tốc độ CPU</td>\n<td style=\"width: 73.4955%;\">2 nh&acirc;n 2.4 GHz &amp; 6 nh&acirc;n 2 GHz</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 73.4955%;\">Super AMOLED</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Model</td>\n<td style=\"width: 73.4955%;\">Samsung Galaxy A53 5G (8GB/128GB)</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Jack tai nghe</td>\n<td style=\"width: 73.4955%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Bộ nhớ khả dụng</td>\n<td style=\"width: 73.4955%;\">Đang cập nhật</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Số sim</td>\n<td style=\"width: 73.4955%;\">2</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Loại pin</td>\n<td style=\"width: 73.4955%;\">Li-Ion</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Loại Sim</td>\n<td style=\"width: 73.4955%;\">Nano SIM</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Chất liệu</td>\n<td style=\"width: 73.4955%;\">Đang c&acirc;̣p nh&acirc;̣t</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Cổng sạc</td>\n<td style=\"width: 73.4955%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Trọng lượng sản phẩm</td>\n<td style=\"width: 73.4955%;\">189 g</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Độ ph&acirc;n giải</td>\n<td style=\"width: 73.4955%;\">Full HD+ (1080 x 2400 Pixels)</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 73.4955%;\">6.5 inch</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Hỗ trợ thẻ tối đa</td>\n<td style=\"width: 73.4955%;\">1 TB</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">Wifi</td>\n<td style=\"width: 73.4955%;\">Dual-band (2.4 GHz/5 GHz) Wi-Fi 802.11 a/b/g/n/ac Wi-Fi Direct Wi-Fi hotspot</td>\n</tr>\n<tr>\n<td style=\"width: 26.5045%;\">C&oacute; thuế VAT</td>\n<td style=\"width: 73.4955%;\">C&oacute;</td>\n</tr>\n</tbody>\n</table>', '<h3><a title=\"Samsung Galaxy A53 5G 128GB\" href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-a53\" target=\"_blank\" rel=\"noopener\">Samsung Galaxy A53 5G 128GB</a>&nbsp;tr&igrave;nh l&agrave;ng với một thiết kế hiện đại, hiệu năng ổn định c&ugrave;ng một m&agrave;n h&igrave;nh hiển thị sắc n&eacute;t, hỗ trợ tần số qu&eacute;t cao gi&uacute;p bạn c&oacute; được những ph&uacute;t gi&acirc;y giải tr&iacute; cực kỳ đ&atilde; mắt, hay thỏa m&atilde;n đam m&ecirc; nhiếp ảnh trong bạn nhờ trang bị camera c&oacute; độ ph&acirc;n giải cao.</h3>\n<h3>M&agrave;u sắc hiển thị rực rỡ</h3>\n<p>M&aacute;y trang bị tấm nền Super AMOLED với k&iacute;ch thước m&agrave;n h&igrave;nh l&ecirc;n đến 6.5 inch&nbsp;mang đến h&igrave;nh ảnh đầy m&agrave;u sắc, độ tương phản cao, tối ưu năng lượng ti&ecirc;u hao&nbsp;v&agrave; kh&ocirc;ng gian hiển thị đầy đủ, bao qu&aacute;t.</p>\n<p>Xem th&ecirc;m:&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-super-amoled-hd-la-gi-905777\" target=\"_blank\" rel=\"noopener\">M&agrave;n h&igrave;nh Super AMOLED l&agrave; g&igrave;? Thiết bị n&agrave;o c&oacute; m&agrave;n h&igrave;nh SUPER AMOLED?</a></p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/246196/samsung-galaxy-a53-280322-054930.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Sở hữu độ ph&acirc;n giải Full HD+ (1080 x 2400 Pixels) gi&uacute;p h&igrave;nh ảnh được&nbsp;hiển thị sắc n&eacute;t, độ chi tiết cao, đem đến cho m&igrave;nh cảm gi&aacute;c ch&acirc;n thực tr&ecirc;n từng t&aacute;c vụ giải tr&iacute; khi trải nghiệm qua con m&aacute;y n&agrave;y.</p>\n<p>C&aacute;c cử chỉ vuốt chạm khi m&igrave;nh thao t&aacute;c cho thấy m&aacute;y mang đến trải nghiệm cực kỳ mượt m&agrave; nhờ hỗ trợ tần số qu&eacute;t 120 Hz, ngo&agrave;i ra người d&ugrave;ng ho&agrave;n to&agrave;n c&oacute; thể t&ugrave;y chỉnh tần số qu&eacute;t ở hai mức độ 60 Hz v&agrave; 120 Hz cho ph&ugrave; hợp với t&aacute;c vụ sử dụng nhằm tiết kiệm điện năng.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/246196/samsung-galaxy-a53-280322-054934.jpg\" alt=\"\" /></p>\n<h3>Đa dạng m&agrave;u sắc trẻ trung</h3>\n<p>Ra mắt 4 phi&ecirc;n bản m&agrave;u sắc nhằm đa dạng t&ugrave;y chọn đến với kh&aacute;ch h&agrave;ng, c&ugrave;ng với đ&oacute; l&agrave; tone m&agrave;u pastel mang đến vẻ trẻ trung v&agrave; tươi mới, ph&ugrave; hợp với c&aacute;c bạn trẻ năng động, c&aacute; t&iacute;nh hay những ai y&ecirc;u th&iacute;ch c&aacute;c tone m&agrave;u dịu &ecirc;m.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/246196/samsung-galaxy-a53-280322-054938.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Galaxy A53 5G sử dụng lối thiết kế phẳng, đem lại c&aacute;i nh&igrave;n rất hợp xu hướng v&agrave; thời thượng. C&aacute;c cạnh được bo cong mềm mại mang đến cho m&igrave;nh cảm gi&aacute;c cầm nắm rất thoải m&aacute;i, sử dụng l&acirc;u d&agrave;i m&agrave; kh&ocirc;ng cảm thấy qu&aacute; cấn tay.</p>\n<p>M&aacute;y được thiết kế nguy&ecirc;n khối từ nhựa cao cấp nhằm tối ưu khối lượng v&agrave; mặt lưng gia c&ocirc;ng nh&aacute;m gi&uacute;p hạn chế c&aacute;c vết b&aacute;m v&acirc;n tay v&agrave; mồ h&ocirc;i kh&aacute; tốt, điều n&agrave;y thực sự rất hữu &iacute;ch đối với những ai thường ra mồ h&ocirc;i tay như c&aacute; nh&acirc;n m&igrave;nh.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/246196/samsung-galaxy-a53-280322-054939.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<h3>Ảnh chụp c&oacute; chi tiết cao, nhiều t&iacute;nh năng mới mẻ</h3>\n<p>Trang bị ở phần mặt lưng l&agrave; cụm camera được thiết kế \"hiệu ứng nổi 3D\" rất nổi bật với 4 camera b&ecirc;n trong, gi&uacute;p bạn c&oacute; được những bức ảnh sắc n&eacute;t hơn nhờ t&iacute;ch hợp nhiều t&iacute;nh năng mới mẻ v&agrave; bộ th&ocirc;ng số ấn tượng như: Camera ch&iacute;nh 64 MP,&nbsp;<a href=\"https://www.thegioididong.com/dtdd-camera-goc-rong\" target=\"_blank\" rel=\"noopener\">camera g&oacute;c si&ecirc;u rộng</a>&nbsp;12 MP v&agrave; hai camera phụ 5 MP.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/246196/samsung-galaxy-a53-280322-054941.jpg\" alt=\"\" /></p>\n<p>C&aacute;c bức ảnh thu được c&oacute; độ chi tiết tốt, m&agrave;u sắc được t&aacute;i tạo ch&acirc;n thực nhờ trang bị camera ch&iacute;nh c&oacute; độ ph&acirc;n giải cao, với khả năng&nbsp;<a href=\"https://www.thegioididong.com/dtdd-camera-zoom\" target=\"_blank\" rel=\"noopener\">zoom</a>&nbsp;tối đa 10x gi&uacute;p m&igrave;nh ph&oacute;ng to vật thể một c&aacute;ch nhanh ch&oacute;ng hay bắt lại những khoảnh khắc xung quanh được bao qu&aacute;t v&agrave; đầy đủ khi k&iacute;ch hoạt t&iacute;nh năng chụp ảnh g&oacute;c si&ecirc;u rộng.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/246196/samsung-galaxy-a53-290322-043029.jpg\" alt=\"\" /></p>\n<p>Với khả năng quay video 4K 30fps c&ugrave;ng c&ocirc;ng nghệ chống rung quang học (OIS) gi&uacute;p ổn định khung h&igrave;nh rất tốt, giữ cho chuyển động lu&ocirc;n mượt m&agrave; v&agrave; sắc n&eacute;t ngay cả khi thiếu s&aacute;ng, mang lại những thước phim chất lượng.</p>\n<p>Xem th&ecirc;m:&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/che-do-chong-rung-quang-hoc-ois-chup-anh-tren-sm-906416\" target=\"_blank\" rel=\"noopener\">Chống rung quang học (OIS) l&agrave; g&igrave;? C&oacute; t&aacute;c dụng g&igrave;? Thiết bị n&agrave;o hỗ trợ?</a></p>\n<p>Mặt trước m&aacute;y sở hữu camera selfie với độ ph&acirc;n giải l&ecirc;n đến 32 MP c&ugrave;ng nhiều t&iacute;nh năng mới mẻ, m&igrave;nh kh&aacute; th&iacute;ch th&uacute; với &ldquo;Chế độ vui nhộn&rdquo; khi mang đến c&aacute;c bức ảnh hay đoạn phim th&uacute; vị.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/246196/samsung-galaxy-a53-280322-054945.jpg\" alt=\"\" /></p>\n<h3>Trải nghiệm mượt m&agrave; tr&ecirc;n mọi t&aacute;c vụ</h3>\n<p>M&aacute;y trang bị chip được ch&iacute;nh&nbsp;<a href=\"https://www.thegioididong.com/dtdd-samsung\" target=\"_blank\" rel=\"noopener\">Samsung</a>&nbsp;ph&aacute;t triển c&oacute; t&ecirc;n Exynos 1280 8 nh&acirc;n với xung nhịp tối đa đạt khoảng 2.4 GHz mang đến sự mượt m&agrave; tr&ecirc;n hầu hết c&aacute;c t&aacute;c vụ giải tr&iacute;, c&ocirc;ng việc h&agrave;ng ng&agrave;y của m&igrave;nh.</p>\n<p>Để kiểm tra xem m&aacute;y c&oacute; thực sự khai th&aacute;c tối đa sức mạnh tr&ecirc;n chip hay chưa, m&igrave;nh c&oacute; test qua hai phần mềm đo hiệu năng với số điểm như sau: 743 (đơn nh&acirc;n), 1806 (đa nh&acirc;n) tr&ecirc;n Benchmark v&agrave; 11745 điểm cho ứng dụng PCMark.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/246196/samsung-galaxy-a53-300322-103645.jpg\" alt=\"\" /></p>\n<p>Tr&ecirc;n c&aacute;c t&aacute;c vụ chơi game, m&aacute;y vẫn đủ sức đ&aacute;p ứng tốt nhu cầu xử l&yacute; mượt m&agrave; với mức đồ họa cao nhất. Như m&igrave;nh c&oacute; trải nghiệm qua hai tựa game Li&ecirc;n Qu&acirc;n Mobile v&agrave; PUBG Mobile cho thấy h&igrave;nh ảnh hiển thị đẹp mắt, nh&acirc;n vật di chuyển mượt m&agrave; c&ugrave;ng khả năng duy tr&igrave; mức khung h&igrave;nh ổn định.</p>\n<p>Tốc độ khung h&igrave;nh tr&ecirc;n Li&ecirc;n Qu&acirc;n Mobile dao động trung b&igrave;nh khoảng 56 FPS v&agrave; xấp xỉ 30 FPS với tựa game PUBG Mobile khi chơi mức đồ họa cao.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/246196/samsung-galaxy-a53-280322-054949.jpg\" alt=\"\" /></p>\n<p>M&aacute;y sở hữu&nbsp;<a href=\"https://www.thegioididong.com/dtdd-ram-8gb\" target=\"_blank\" rel=\"noopener\">RAM 8 GB</a>&nbsp;c&ugrave;ng khả năng mở rộng qua chế độ &ldquo;RAM Plus&rdquo; n&acirc;ng tổng số dung lượng RAM l&ecirc;n đến 16 GB (8 GB mặc định + 8 GB mở rộng) gi&uacute;p m&igrave;nh thao t&aacute;c đa nhiệm một c&aacute;ch mượt m&agrave;, t&igrave;nh trạng load lại app gần như kh&ocirc;ng xảy ra cho d&ugrave; mở nhiều ứng dụng c&ugrave;ng l&uacute;c.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/246196/samsung-galaxy-a53-280322-054952.jpg\" alt=\"\" /></p>\n<h3>Sử dụng cả ng&agrave;y với pin 5000 mAh c&ugrave;ng sạc nhanh 25 W</h3>\n<p>Trang bị b&ecirc;n trong m&aacute;y l&agrave; vi&ecirc;n pin c&oacute; dung lượng l&ecirc;n đến 5000 mAh mang đến thời lượng sử dụng l&acirc;u d&agrave;i, đ&aacute;p ứng nhu cầu giải tr&iacute; li&ecirc;n tục cả ng&agrave;y m&agrave; kh&ocirc;ng qu&aacute; lo lắng đến vấn đề hết pin giữa chừng.</p>\n<p>Với c&ocirc;ng nghệ sạc nhanh 25 W mang đến khả năng r&uacute;t ngắn thời gian lấp đầy vi&ecirc;n pin khủng, gi&uacute;p bạn quay lại c&ocirc;ng việc hay c&aacute;c t&aacute;c vụ giải tr&iacute; một c&aacute;ch nhanh ch&oacute;ng.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/246196/samsung-galaxy-a53-280322-054954.jpg\" alt=\"\" /></p>\n<p>Qua những đ&aacute;nh gi&aacute; tr&ecirc;n cho thấy m&aacute;y đ&aacute;p ứng tốt hầu hết c&aacute;c y&ecirc;u cầu cơ bản tr&ecirc;n một chiếc&nbsp;<a href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">điện thoại</a>, với ưu điểm s&aacute;ng gi&aacute; về phần m&agrave;n h&igrave;nh gi&uacute;p Galaxy A53 5G mang đến cho bạn những trải nghiệm giải tr&iacute; v&ocirc; c&ugrave;ng đ&atilde; mắt, hay đ&aacute;p ứng khả năng chụp ảnh sắc n&eacute;t gi&uacute;p thỏa m&atilde;n đam m&ecirc; nhiếp ảnh trong bạn.</p>', 8, 1, 180, 17, '2022-10-05 21:20:24', 1, 1, 1);
INSERT INTO `product` (`id`, `name`, `specifications`, `description`, `width`, `height`, `weight`, `length`, `created_date`, `published`, `brand_id`, `user_id`) VALUES
(9, 'iPhone 13', '<table style=\"border-collapse: collapse; width: 99.9489%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 37.2599%;\">Bluetooth</td>\n<td style=\"width: 62.7401%;\">v5.0</td>\n</tr>\n<tr>\n<td style=\"width: 37.2599%;\">Thương hiệu</td>\n<td style=\"width: 62.7401%;\">Apple</td>\n</tr>\n<tr>\n<td style=\"width: 37.2599%;\">Xuất xứ thương hiệu</td>\n<td style=\"width: 62.7401%;\">Mỹ</td>\n</tr>\n<tr>\n<td style=\"width: 37.2599%;\">Camera sau</td>\n<td style=\"width: 62.7401%;\">2 Camera: G&oacute;c rộng ống k&iacute;nh f/1.8 - Si&ecirc;u rộng</td>\n</tr>\n<tr>\n<td style=\"width: 37.2599%;\">Chip set</td>\n<td style=\"width: 62.7401%;\">Chip A15 Bionic (5nm)</td>\n</tr>\n<tr>\n<td style=\"width: 37.2599%;\">K&iacute;ch thước</td>\n<td style=\"width: 62.7401%;\">146.7 x 71.5 x 7.4 mm</td>\n</tr>\n<tr>\n<td style=\"width: 37.2599%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 62.7401%;\">Super Retina XDR</td>\n</tr>\n<tr>\n<td style=\"width: 37.2599%;\">Model</td>\n<td style=\"width: 62.7401%;\">iphone 13 128g</td>\n</tr>\n<tr>\n<td style=\"width: 37.2599%;\">Xuất xứ</td>\n<td style=\"width: 62.7401%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 37.2599%;\">Cổng sạc</td>\n<td style=\"width: 62.7401%;\">Lightning</td>\n</tr>\n<tr>\n<td style=\"width: 37.2599%;\">Trọng lượng sản phẩm</td>\n<td style=\"width: 62.7401%;\">164g</td>\n</tr>\n<tr>\n<td style=\"width: 37.2599%;\">RAM</td>\n<td style=\"width: 62.7401%;\">4GB</td>\n</tr>\n<tr>\n<td style=\"width: 37.2599%;\">ROM</td>\n<td style=\"width: 62.7401%;\">128GB</td>\n</tr>\n<tr>\n<td style=\"width: 37.2599%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 62.7401%;\">6.1 inch</td>\n</tr>\n<tr>\n<td style=\"width: 37.2599%;\">Wifi</td>\n<td style=\"width: 62.7401%;\">Wifi 6</td>\n</tr>\n</tbody>\n</table>', '<h3><a title=\"Tham khảo điện thoại iPhone 13 mini kinh doanh tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd/iphone-13-mini\" target=\"_blank\" rel=\"noopener\">iPhone 13 mini</a>&nbsp;được&nbsp;<a title=\"Tham khảo sản phẩm Apple ch&iacute;nh h&atilde;ng tại Thegioididong.com \" href=\"https://www.thegioididong.com/apple\" target=\"_blank\" rel=\"noopener\">Apple</a>&nbsp;ra mắt với h&agrave;ng loạt n&acirc;ng cấp về cấu h&igrave;nh v&agrave; c&aacute;c t&iacute;nh năng hữu &iacute;ch, lại c&oacute; thiết kế vừa vặn. Chiếc&nbsp;<a title=\"Tham khảo điện thoại kinh doanh tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd\">điện thoại</a>&nbsp;n&agrave;y hứa hẹn l&agrave; một thiết bị ho&agrave;n hảo hướng tới những kh&aacute;ch h&agrave;ng th&iacute;ch sự nhỏ gọn nhưng vẫn giữ được sự mạnh mẽ b&ecirc;n trong.&nbsp;</h3>\n<h3>Hiệu năng mạnh mẽ h&agrave;ng đầu</h3>\n<p>iPhone 13 mini được trang bị bộ vi xử l&yacute; A15 Bionic sản xuất tr&ecirc;n tiến tr&igrave;nh 5 nm gi&uacute;p cải thiện hiệu suất v&agrave; giảm điện năng ti&ecirc;u thụ đến 15% so với phi&ecirc;n bản A14 Bionic trước đ&oacute;, đ&aacute;p ứng ho&agrave;n hảo trong c&ocirc;ng việc cũng như trong giải tr&iacute; của người d&ugrave;ng tốt hơn.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-1.jpg\" alt=\"\" /></p>\n<p>CPU 6 l&otilde;i cho hiệu suất hoạt động tăng 40% c&ugrave;ng với đ&oacute; l&agrave; GPU cũng c&oacute; mức hiệu năng tăng mạnh l&ecirc;n đến 80% so với chipset thế hệ trước. Bạn ho&agrave;n to&agrave;n c&oacute; thể chơi game mượt m&agrave;, c&aacute;c thao t&aacute;c chỉnh sửa h&igrave;nh ảnh, cắt gh&eacute;p video đều v&ocirc; c&ugrave;ng trơn tru.&nbsp;</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-2.jpg\" alt=\"\" /></p>\n<p>M&aacute;y được đi k&egrave;m&nbsp;bộ nhớ trong 128 GB&nbsp;khoảng dung lượng l&yacute; tưởng cho bạn c&oacute; thể lưu trữ một c&aacute;ch thoải m&aacute;i, đảm bảo đủ kh&ocirc;ng gian để c&oacute; thể sử dụng l&acirc;u d&agrave;i.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-3.jpg\" alt=\"\" /></p>\n<p>Tốc độ internet rất quan trọng tr&ecirc;n một chiếc smartphone, khi m&agrave; mạng kết nối 5G với những ưu thế vượt trội đang dần phủ s&oacute;ng khắp to&agrave;n cầu, v&agrave; chiếc iPhone 13 mini n&agrave;y sẽ được Apple t&iacute;ch hợp 5G mang đến cho bạn trải nghiệm internet tuyệt vời nhất.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-06.jpg\" alt=\"\" /></p>\n<p>Với t&iacute;nh năng Smart Data, iPhone của bạn sẽ tự động chuyển đổi dữ liệu khi m&agrave; bạn kh&ocirc;ng cần d&ugrave;ng đến tốc độ cao nhằm tiết kiệm điện năng đ&aacute;ng kể.</p>\n<p>iPhone 13 mini sử dụng iOS 15 được t&iacute;ch hợp nhiều t&iacute;nh năng mới gi&uacute;p bạn c&oacute; những trải nghiệm mới mẻ v&agrave; tốt hơn. Với SharePlay khi bạn FaceTime bạn vẫn xem được c&aacute;c chương tr&igrave;nh TV v&agrave; phim hoặc chia sẻ m&agrave;n h&igrave;nh của ch&iacute;nh m&igrave;nh.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-5.jpg\" alt=\"\" /></p>\n<p><a title=\"Tham khảo điện thoại c&oacute; bảo mật khu&ocirc;n mặt tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-bao-mat-khuon-mat\" target=\"_blank\" rel=\"noopener\">Mở kh&oacute;a khu&ocirc;n mặt</a>&nbsp;Face ID tr&ecirc;n iPhone 13 mini n&agrave;y cũng được cải tiến để c&oacute; thể nhận diện ở nhiều g&oacute;c độ hơn v&agrave; tốc độ phản hồi nhanh hơn.</p>\n<h3>Thiết kế cao cấp, mang tầm thương hiệu</h3>\n<p>Sản phẩm c&oacute; kiểu d&aacute;ng bắt mắt với khung viền nh&ocirc;m v&agrave; mặt lưng được ho&agrave;n thiện từ k&iacute;nh cường lực b&oacute;ng bẩy chống xước tốt, kết hợp c&ugrave;ng viền m&agrave;n h&igrave;nh mỏng tạo n&ecirc;n vẻ đẹp hiện đại cho iPhone 13 mini.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-6.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Apple vẫn tiếp tục ưu thế về k&iacute;ch thước nhỏ nhắn giống với iPhone 12 mini để bạn dễ d&agrave;ng mang đi bất cứ đ&acirc;u. Ngo&agrave;i ra, Apple cho đi k&egrave;m nhiều m&agrave;u sắc để người d&ugrave;ng c&oacute; nhiều sự lựa chọn, ph&ugrave; hợp với sở th&iacute;ch cho ri&ecirc;ng m&igrave;nh.</p>\n<p>Thiết bị sẽ c&oacute; một m&agrave;n h&igrave;nh kiểu d&aacute;ng tai thỏ quen thuộc, với phần khuyết được l&agrave;m tối giản hơn, gi&uacute;p mặt trước của m&aacute;y trở n&ecirc;n tinh tế v&agrave; tạo cảm gi&aacute;c rộng hơn d&ugrave; m&agrave;n h&igrave;nh iPhone 13 mini chỉ lớn 5.4 inch.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-19.jpg\" alt=\"\" /></p>\n<p>C&oacute; một sự thay đổi nhỏ ở phần camera sau l&agrave; c&aacute;c camera được đặt ch&eacute;o thay v&igrave; đặt dọc như ở iPhone 12 mini, tạo n&ecirc;n điểm nhấn độc đ&aacute;o khi mới nh&igrave;n v&agrave;o cũng như tạo sự kh&aacute;c biệt cho m&aacute;y khi so s&aacute;nh với tiền nhiệm.</p>\n<h3>Khả năng chụp ảnh si&ecirc;u ch&acirc;n thật</h3>\n<p>Cụm camera sau được thiết kế đặt ch&eacute;o kh&ocirc;ng chỉ tạo sự kh&aacute;c biệt m&agrave; n&oacute; c&ograve;n cải thiện g&oacute;c chụp đ&aacute;ng kể, cảm biến m&aacute;y ảnh cũng được l&agrave;m lớn hơn. Camera ch&iacute;nh 12 MP cho khả năng quay chụp sắc n&eacute;t, khả năng thu s&aacute;ng cũng được tăng l&ecirc;n 47% so với thế hệ trước, cho ra đời những bức h&igrave;nh, video tuyệt hảo d&ugrave; bạn chụp v&agrave;o ban ng&agrave;y hay ban đ&ecirc;m.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-14.jpg\" alt=\"\" /></p>\n<p>iPhone 13 mini c&ograve;n hỗ trợ nhiều t&iacute;nh năng th&ocirc;ng minh như: Smart HDR 4, Deep Fusion, Time Lapse, Tự động lấy n&eacute;t (AF), Zoom quang học,... chỉ với những thao t&aacute;c đơn giản bạn đ&atilde; c&oacute; thể tạo ra kiệt t&aacute;c.</p>\n<p>Camera trước c&oacute; độ ph&acirc;n giải 12 MP chỉ cần đưa m&aacute;y l&ecirc;n bạn đ&atilde; c&oacute; ngay bức selfie cực xinh, kh&ocirc;ng thua g&igrave; c&aacute;c loại m&aacute;y ảnh đắt tiền. Hỗ trợ nhiều t&iacute;nh năng như: Smart HDR 4, Deep Fusion, nhận diện khu&ocirc;n mặt, quay video 4K, tự động lấy n&eacute;t (AF), x&oacute;a ph&ocirc;ng,... tha hồ trải nghiệm.</p>\n<h3>M&agrave;n h&igrave;nh sắc n&eacute;t cho những trải nghiệm xem tuyệt vời</h3>\n<p>M&agrave;n h&igrave;nh OLED c&oacute; k&iacute;ch thước 5.4 inch viền mỏng tạo cảm gi&aacute;c xem kh&ocirc;ng bị giới hạn mang đến cho bạn những trải nghiệm cực kỳ phong ph&uacute; về h&igrave;nh ảnh. iPhone 13 mini được phủ một lớp k&iacute;nh cường lực Ceramic Shield c&oacute; độ trong suốt cao v&agrave; hạn chế trầy xước giảm thiểu sự hư hại khi va chạm.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-16.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Sản phẩm c&oacute; độ ph&acirc;n giải Full HD+ gi&uacute;p hiển thị h&igrave;nh ảnh sắc n&eacute;t c&ugrave;ng c&ocirc;ng nghệ Super Retina XDR cho mật độ điểm ảnh cao n&ecirc;n nội dung sẽ được đồng nhất ở mọi g&oacute;c nh&igrave;n, sẵn s&agrave;ng thưởng thức mọi nội dung d&ugrave; l&agrave; h&igrave;nh ảnh, văn bản hay video.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-18.jpg\" alt=\"\" /></p>\n<h3>Thời lượng sử dụng tốt</h3>\n<p>Apple cho biết điện thoại sẽ c&oacute; thời lượng sử dụng d&agrave;i hơn phi&ecirc;n bản trước cụ thể l&agrave; thời gian d&ugrave;ng l&acirc;u hơn 1.5 giờ. Chip mới A15 Bionic c&ugrave;ng hệ điều h&agrave;nh iOS 15 cũng sẽ gi&uacute;p tối ưu v&agrave; k&eacute;o d&agrave;i thời lượng sử dụng.</p>', 8, 1, 180, 17, '2022-10-05 21:32:00', 1, 3, 1),
(10, 'iPhone 12', '<table style=\"border-collapse: collapse; width: 99.9489%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 21.895%;\">Bluetooth</td>\n<td style=\"width: 78.105%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Thương hiệu</td>\n<td style=\"width: 78.105%;\">Apple</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Xuất xứ thương hiệu</td>\n<td style=\"width: 78.105%;\">Mỹ</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Camera sau</td>\n<td style=\"width: 78.105%;\">12 MP + 12 MP</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Camera trước</td>\n<td style=\"width: 78.105%;\">12 MP</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Chip đồ họa (GPU)</td>\n<td style=\"width: 78.105%;\">Apple GPU (4-core graphics)</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Chip set</td>\n<td style=\"width: 78.105%;\">Apple A14 Bionic (5 nm)</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Chức năng kh&aacute;c</td>\n<td style=\"width: 78.105%;\">Face ID</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Đ&egrave;n Flash</td>\n<td style=\"width: 78.105%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">K&iacute;ch thước</td>\n<td style=\"width: 78.105%;\">146.7 x 71.5 x 7.4 mm</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 78.105%;\">Super Retina XDR OLED, HDR10, Dolby Vision, Wide color gamut, True-tone</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">FM radio</td>\n<td style=\"width: 78.105%;\">Kh&ocirc;ng</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Ghi &acirc;m</td>\n<td style=\"width: 78.105%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Phụ kiện đi k&egrave;m</td>\n<td style=\"width: 78.105%;\">S&aacute;ch hướng dẫn</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Model</td>\n<td style=\"width: 78.105%;\">iPhone 12</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Jack tai nghe</td>\n<td style=\"width: 78.105%;\">Lightning</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Số sim</td>\n<td style=\"width: 78.105%;\">2 (nano‑SIM + eSIM)</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Loại Sim</td>\n<td style=\"width: 78.105%;\">Nano Sim</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Nghe nhạc</td>\n<td style=\"width: 78.105%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Xuất xứ</td>\n<td style=\"width: 78.105%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">M&atilde; part</td>\n<td style=\"width: 78.105%;\">VN/A</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Cổng sạc</td>\n<td style=\"width: 78.105%;\">Lightning</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Trọng lượng sản phẩm</td>\n<td style=\"width: 78.105%;\">164g</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">RAM</td>\n<td style=\"width: 78.105%;\">4GB</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">ROM</td>\n<td style=\"width: 78.105%;\">64GB</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 78.105%;\">6.1 inch</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">T&iacute;nh năng camera</td>\n<td style=\"width: 78.105%;\">4K@24/30/60fps, 1080p@30/60/120/240fps, HDR, Dolby Vision HDR (up to 30fps), stereo sound rec.</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Video call</td>\n<td style=\"width: 78.105%;\">Hỗ trợ VideoCall th&ocirc;ng qua ứng dụng</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Wifi</td>\n<td style=\"width: 78.105%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">Xem phim</td>\n<td style=\"width: 78.105%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 21.895%;\">C&oacute; thuế VAT</td>\n<td style=\"width: 78.105%;\">C&oacute;</td>\n</tr>\n</tbody>\n</table>', '<h3>Trong những th&aacute;ng cuối năm 2020,&nbsp;<a title=\"Tham khảo sản phẩm ch&iacute;nh h&atilde;ng của Apple tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/apple\" target=\"_blank\" rel=\"noopener\">Apple</a>&nbsp;đ&atilde; ch&iacute;nh thức giới thiệu đến người d&ugrave;ng cũng như iFan thế hệ iPhone&nbsp;12&nbsp;series&nbsp;mới với h&agrave;ng loạt t&iacute;nh năng bứt ph&aacute;, thiết kế được lột x&aacute;c ho&agrave;n to&agrave;n, hiệu năng đầy mạnh mẽ v&agrave; một trong số đ&oacute; ch&iacute;nh l&agrave;&nbsp;<a title=\"Tham khảo th&ocirc;ng tin sản phẩm tại TopZone.vn\" href=\"https://www.topzone.vn/iphone/iphone-12\" target=\"_blank\" rel=\"noopener\">iPhone 12 64GB</a>.</h3>\n<h3>Hiệu năng vượt xa mọi giới hạn</h3>\n<p>Apple đ&atilde; trang bị con chip mới nhất của h&atilde;ng (t&iacute;nh đến 11/2020) cho iPhone 12 đ&oacute; l&agrave;&nbsp;<a title=\"T&igrave;m hiểu chip A14 Bionic l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-chip-apple-a14-bionic-tren-iphone-12-va-ipad-1290695\" target=\"_blank\" rel=\"noopener\">A14 Bionic</a>, được sản xuất tr&ecirc;n tiến tr&igrave;nh 5 nm với hiệu suất ổn định hơn so với chip A13 được trang bị tr&ecirc;n phi&ecirc;n bản tiền nhiệm&nbsp;<a title=\"Tham khảo điện thoại iPhone 11 ch&iacute;nh h&atilde;ng tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd/iphone-11\" target=\"_blank\" rel=\"noopener\">iPhone 11</a>.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-144220-044259.jpg\" alt=\"\" /></p>\n<p>Xem th&ecirc;m:&nbsp;<a title=\"T&igrave;m hiểu về chip Apple A14 Bionic tr&ecirc;n iPhone 12 v&agrave; iPad Air 2020\" href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-chip-apple-a14-bionic-tren-iphone-12-va-ipad-1290695\" target=\"_blank\" rel=\"noopener\">T&igrave;m hiểu về chip Apple A14 Bionic tr&ecirc;n iPhone 12 v&agrave; iPad Air 2020</a></p>\n<p>Với CPU Apple A14 Bionic, bạn c&oacute; thể dễ d&agrave;ng trải nghiệm mọi tựa game với những pha chuyển cảnh mượt m&agrave; hay h&agrave;ng loạt hiệu ứng đồ họa tuyệt đẹp ở mức đồ họa cao m&agrave; kh&ocirc;ng lo t&igrave;nh trạng giật lag.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-18.jpg\" alt=\"\" /></p>\n<p>Chưa hết, Apple c&ograve;n g&acirc;y bất ngờ đến người d&ugrave;ng với hệ thống 5G lần đầu ti&ecirc;n được trang bị tr&ecirc;n những chiếc&nbsp;<a title=\"Tham khảo iPhone kinh doanh tại thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-apple-iphone\" target=\"_blank\" rel=\"noopener\">iPhone</a>, cho tốc độ truyền tải dữ liệu nhanh hơn, ổn định hơn.</p>\n<p>iPhone 12 sẽ chạy tr&ecirc;n hệ điều h&agrave;nh iOS 15 (12/2021)&nbsp;với nhiều t&iacute;nh năng hấp dẫn như hỗ trợ Widget cũng như những n&acirc;ng cấp tối ưu phần mềm đ&aacute;ng kể mang lại những trải nghiệm th&uacute; vị mới lạ đến người d&ugrave;ng.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-13.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<h3>Cụm camera kh&ocirc;ng ngừng cải tiến</h3>\n<p>iPhone 12 được trang bị hệ thống camera k&eacute;p bao gồm&nbsp;<a title=\"Tham khảo điện thoại c&oacute; camera g&oacute;c rộng tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-camera-goc-rong\" target=\"_blank\" rel=\"noopener\">camera g&oacute;c rộng</a>&nbsp;v&agrave; camera si&ecirc;u rộng c&oacute; c&ugrave;ng độ ph&acirc;n giải l&agrave; 12 MP, chế độ ban đ&ecirc;m (<a title=\"T&igrave;m hiểu chế độ chụp đ&ecirc;m Night Mode l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/hoi-dap/che-do-chup-dem-night-mode-la-gi-907873\" target=\"_blank\" rel=\"noopener\">Night Mode</a>) tr&ecirc;n bộ đ&ocirc;i camera n&agrave;y cũng đ&atilde; được n&acirc;ng cấp về phần cứng lẫn thuật to&aacute;n xử l&yacute;, khi chụp những bức ảnh thiếu s&aacute;ng bạn sẽ nhận được kết quả ấn tượng với m&agrave;u sắc, độ chi tiết r&otilde; n&eacute;t đ&aacute;ng kinh ngạc.</p>\n<p>Bạn c&oacute; thể kh&aacute;m ph&aacute; th&ecirc;m những t&iacute;nh năng của camera tr&ecirc;n iPhone 12 như chế độ smart HDR 3 gi&uacute;p c&acirc;n bằng yếu tố &aacute;nh s&aacute;ng trong ảnh, l&agrave;m nổi bật chi tiết đối tượng v&agrave; c&acirc;y cối trong khi vẫn giữ được m&agrave;u sắc phong ph&uacute; của bầu trời ngay cả v&agrave;o buổi trưa nắng gắt.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-10.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Bạn sẽ dễ d&agrave;ng quay video 4K HDR với chuẩn điện ảnh&nbsp;<a title=\"T&igrave;m hiểu Dolby Vision l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/hoi-dap/dolby-vision-la-gi-cac-ung-dung-noi-bat-va-nhung-loai-1226284\" target=\"_blank\" rel=\"noopener\">Dolby Vision</a>&nbsp;v&agrave; chỉnh sửa ngay tr&ecirc;n chiếc điện thoại của m&igrave;nh, bạn c&oacute; thể đưa video l&ecirc;n TV của bạn để thưởng thức thước phim sắc n&eacute;t chất lượng cao.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-11.jpg\" alt=\"\" /></p>\n<p>Sự kết hợp của 2 cảm biến chất lượng n&agrave;y đ&atilde; tạo n&ecirc;n một hệ thống camera chuy&ecirc;n nghiệp kh&ocirc;ng kh&aacute;c g&igrave; những chiếc m&aacute;y ảnh thực thụ, dễ d&agrave;ng đem lại những bức h&igrave;nh sắc n&eacute;t tuyệt đối, độ chi tiết cao v&agrave; đa dạng chế độ chụp cho người d&ugrave;ng linh hoạt sử dụng.</p>\n<h3>Ghi dấu ấn về mặt thiết kế</h3>\n<p>Về ngoại h&igrave;nh iPhone 12 c&oacute; thiết kế ho&agrave;i niệm với phần cạnh được l&agrave;m vu&ocirc;ng vức tương tự tr&ecirc;n mẫu iPhone 4 thay v&igrave; bo cong như iPhone 11.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-040321-030352.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Ở mặt trước iPhone 12 phần tai thỏ được l&agrave;m nhỏ gọn hơn v&agrave; cũng l&agrave; nơi chứa cảm biến Face ID c&oacute; thể nhận diện khu&ocirc;n mặt một c&aacute;ch nhanh ch&oacute;ng v&agrave; ch&iacute;nh x&aacute;c.</p>\n<p>Apple c&ograve;n mang đến cho người một loạt gam m&agrave;u c&aacute; t&iacute;nh, độc đ&aacute;o tr&ecirc;n những chiếc iPhone của m&igrave;nh để người d&ugrave;ng c&oacute; sự lựa chọn ph&ugrave; hợp với những phong c&aacute;ch kh&aacute;c nhau.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-17.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>iPhone 12 được trang bị m&agrave;n h&igrave;nh OLED tr&agrave;n viền c&oacute; k&iacute;ch thước 6.1 inch, cho bạn kh&ocirc;ng gian trải nghiệm lớn cũng như những gi&acirc;y ph&uacute;t giải tr&iacute; hấp dẫn tr&ecirc;n một m&agrave;n ảnh v&ocirc; c&ugrave;ng chất lượng.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-040421-030410.jpg\" alt=\"\" /></p>\n<p>Mặt trước của iPhone 12 được phủ ho&agrave;n to&agrave;n bởi lớp k&iacute;nh cường lực Ceramic Shield cứng c&aacute;p, được đ&aacute;nh gi&aacute; l&agrave; c&oacute; độ bền cao v&agrave; cứng c&aacute;p hơn hầu hết c&aacute;c loại mặt k&iacute;nh c&oacute; tr&ecirc;n&nbsp;<a title=\"Tham khảo điện thoại ch&iacute;nh h&atilde;ng tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">điện thoại th&ocirc;ng minh</a>&nbsp;kh&aacute;c c&oacute; mặt tr&ecirc;n thị trường.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-040321-030328.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Xem th&ecirc;m:&nbsp;<a title=\"Mặt k&iacute;nh Ceramic Shield tr&ecirc;n iPhone 12 l&agrave; g&igrave;? C&oacute; xịn s&ograve; như quảng c&aacute;o?\" href=\"https://www.thegioididong.com/hoi-dap/mat-kinh-ceramic-shield-tren-iphone-12-la-gi-co-xin-so-nhu-1298900\" target=\"_blank\" rel=\"noopener\">Mặt k&iacute;nh Ceramic Shield tr&ecirc;n iPhone 12 l&agrave; g&igrave;? C&oacute; xịn s&ograve; như quảng c&aacute;o?</a></p>\n<p>V&agrave; để cho thiết bị trở n&ecirc;n ho&agrave;n hảo hơn n&ecirc;n kh&ocirc;ng thể thiếu khả năng kh&aacute;ng nước, bụi chuẩn IP68 gi&uacute;p người d&ugrave;ng y&ecirc;n t&acirc;m sử dụng với những buổi đi chơi biển m&agrave; kh&ocirc;ng hề lo chiếc m&aacute;y bị v&ocirc; nước.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-040321-030358.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>V&agrave; kh&ocirc;ng thể thiếu đ&oacute; ch&iacute;nh l&agrave; t&iacute;nh năng sạc nhanh, iPhone 12 c&oacute; khả năng&nbsp;<a title=\"Tham khảo điện thoại c&oacute; sạc pin nhanh tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-sac-pin-nhanh\" target=\"_blank\" rel=\"noopener\">sạc pin nhanh</a>&nbsp;qua c&aacute;p c&ocirc;ng suất 20 W, chỉ trong v&ograve;ng 30 ph&uacute;t th&igrave; chiếc m&aacute;y đ&atilde; c&oacute; thế sạc được 50% pin. Th&ecirc;m v&agrave;o đ&oacute; l&agrave; khả năng&nbsp;<a title=\"Tham khảo điện thoại c&oacute; sạc kh&ocirc;ng d&acirc;y tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-sac-khong-day\" target=\"_blank\" rel=\"noopener\">sạc kh&ocirc;ng d&acirc;y</a>&nbsp;MagSafe v&ocirc; c&ugrave;ng tiện dụng.</p>\n<p>Lưu &yacute;: Củ sạc kh&ocirc;ng k&egrave;m theo m&aacute;y m&agrave; phải mua ri&ecirc;ng.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-16.jpg\" alt=\"\" /></p>\n<p>Xem th&ecirc;m:&nbsp;<a title=\"MagSafe tr&ecirc;n iPhone 12 l&agrave; g&igrave;? D&ugrave;ng để l&agrave;m g&igrave; tr&ecirc;n c&aacute;c thiết bị Apple?\" href=\"https://www.thegioididong.com/hoi-dap/cong-nghe-magsafe-magsafe-2-la-gi-co-tren-thiet-bi-nao-cua-1241888\" target=\"_blank\" rel=\"noopener\">MagSafe tr&ecirc;n iPhone 12 l&agrave; g&igrave;? D&ugrave;ng để l&agrave;m g&igrave; tr&ecirc;n c&aacute;c thiết bị Apple?</a></p>\n<p>Sự lột x&aacute;c đầy mạnh mẽ lần n&agrave;y của Apple kh&ocirc;ng chỉ g&acirc;y bất ngờ đến người d&ugrave;ng m&agrave; c&ograve;n đ&aacute;nh dấu một kỷ nguy&ecirc;n mới trong nền ph&aacute;t triển smartphone Apple. V&agrave; đ&acirc;y cũng được xem l&agrave; một trong những bộ series iPhone m&agrave; Apple đặt nhiều t&acirc;m huyết, mục đ&iacute;ch v&agrave; đầy t&iacute;nh năng mạnh mẽ chưa từng thấy.</p>', 8, 1, 180, 17, '2022-10-05 21:44:57', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`id`, `image`, `product_id`) VALUES
(1, 'http://localhost:8000/images/products/1664974881496Xiaomi-redmi-note-11-black-600x600.jpeg', 1),
(2, 'http://localhost:8000/images/products/1664974881486xiaomi-redmi-note-11-1-3.jpg', 1),
(3, 'http://localhost:8000/images/products/1664974881508xiaomi-redmi-note-11-4.jpg', 1),
(4, 'http://localhost:8000/images/products/1664974881510xiaomi-redmi-note-11-5.jpg', 1),
(5, 'http://localhost:8000/images/products/1664974881523xiaomi-redmi-note-11-6.jpg', 1),
(6, 'http://localhost:8000/images/products/1664974881503xiaomi-redmi-note-11-7.jpg', 1),
(7, 'http://localhost:8000/images/products/1664974881537xiaomi-redmi-note-11-8.jpg', 1),
(8, 'http://localhost:8000/images/products/1664974881540xiaomi-redmi-note-11-9.jpg', 1),
(9, 'http://localhost:8000/images/products/1664974881545xiaomi-redmi-note-11-10.jpg', 1),
(10, 'http://localhost:8000/images/products/1664974881492xiaomi-redmi-note-11-12.jpg', 1),
(11, 'http://localhost:8000/images/products/1664975837983xiaomi-redmi-note-10-pro-thumb-vang-dong-600x600-600x600.jpg', 2),
(12, 'http://localhost:8000/images/products/1664975837939xiaomi-redmi-note-10-pro-1-1-org.jpg', 2),
(13, 'http://localhost:8000/images/products/1664975837955xiaomi-redmi-note-10-pro-4-1-org.jpg', 2),
(14, 'http://localhost:8000/images/products/1664975837977xiaomi-redmi-note-10-pro-5-1-org.jpg', 2),
(15, 'http://localhost:8000/images/products/1664975837943xiaomi-redmi-note-10-pro-6-1-org.jpg', 2),
(16, 'http://localhost:8000/images/products/1664975837952xiaomi-redmi-note-10-pro-7-1-org.jpg', 2),
(17, 'http://localhost:8000/images/products/1664975837945xiaomi-redmi-note-10-pro-8-1-org.jpg', 2),
(18, 'http://localhost:8000/images/products/1664975837949xiaomi-redmi-note-10-pro-9-1-org.jpg', 2),
(19, 'http://localhost:8000/images/products/1664975837968xiaomi-redmi-note-10-pro-10-1-org.jpg', 2),
(20, 'http://localhost:8000/images/products/1664975837974xiaomi-redmi-note-10-pro-11-1-org.jpg', 2),
(21, 'http://localhost:8000/images/products/1664975837980xiaomi-redmi-note-10-pro-12-1-org.jpg', 2),
(22, 'http://localhost:8000/images/products/1664976428613Xiaomi-12-xam-thumb-mau-600x600.jpg', 3),
(23, 'http://localhost:8000/images/products/1664976428625xiaomi-mi-12-1-1.jpg', 3),
(24, 'http://localhost:8000/images/products/1664976428658xiaomi-mi-12-4-1.jpg', 3),
(25, 'http://localhost:8000/images/products/1664976428619xiaomi-mi-12-5-1.jpg', 3),
(26, 'http://localhost:8000/images/products/1664976428616xiaomi-mi-12-6-1.jpg', 3),
(27, 'http://localhost:8000/images/products/1664976428629xiaomi-mi-12-7-1.jpg', 3),
(28, 'http://localhost:8000/images/products/1664976428632xiaomi-mi-12-8-1.jpg', 3),
(29, 'http://localhost:8000/images/products/1664976428656xiaomi-mi-12-9-1.jpg', 3),
(30, 'http://localhost:8000/images/products/1664976428661xiaomi-mi-12-10-1.jpg', 3),
(31, 'http://localhost:8000/images/products/1664976428663xiaomi-mi-12-11-1.jpg', 3),
(32, 'http://localhost:8000/images/products/1664976428666xiaomi-mi-12-12-1.jpg', 3),
(33, 'http://localhost:8000/images/products/1664976428669xiaomi-mi-12-13-1.jpg', 3),
(34, 'http://localhost:8000/images/products/1664976924646oppo-reno6-5g-black-600x600.jpg', 4),
(35, 'http://localhost:8000/images/products/1664976924661oppo-reno6-den-1-org.jpg', 4),
(36, 'http://localhost:8000/images/products/1664976924675oppo-reno6-den-4-org.jpg', 4),
(37, 'http://localhost:8000/images/products/1664976924688oppo-reno6-den-5-org.jpg', 4),
(38, 'http://localhost:8000/images/products/1664976924685oppo-reno6-den-6-org.jpg', 4),
(39, 'http://localhost:8000/images/products/1664976924648oppo-reno6-den-7-org.jpg', 4),
(40, 'http://localhost:8000/images/products/1664976924651oppo-reno6-den-8-org.jpg', 4),
(41, 'http://localhost:8000/images/products/1664976924655oppo-reno6-den-9-org.jpg', 4),
(42, 'http://localhost:8000/images/products/1664976924658oppo-reno6-den-10-org.jpg', 4),
(43, 'http://localhost:8000/images/products/1664976924667oppo-reno6-den-11-org.jpg', 4),
(44, 'http://localhost:8000/images/products/1664976924680oppo-reno6-den-12-org.jpg', 4),
(45, 'http://localhost:8000/images/products/1664976924683oppo-reno6-den-13-org.jpg', 4),
(46, 'http://localhost:8000/images/products/1664977542674oppo-a95-4g-bac-2-600x600.jpg', 5),
(47, 'http://localhost:8000/images/products/1664977542665oppo-a95-4g-bac-1-1.jpg', 5),
(48, 'http://localhost:8000/images/products/1664977542677oppo-a95-4g-bac-4-1.jpg', 5),
(49, 'http://localhost:8000/images/products/1664977542685oppo-a95-4g-bac-5-1.jpg', 5),
(50, 'http://localhost:8000/images/products/1664977542690oppo-a95-4g-bac-6-1.jpg', 5),
(51, 'http://localhost:8000/images/products/1664977542694oppo-a95-4g-bac-7-1.jpg', 5),
(52, 'http://localhost:8000/images/products/1664977542697oppo-a95-4g-bac-8-1.jpg', 5),
(53, 'http://localhost:8000/images/products/1664977542699oppo-a95-4g-bac-9-1.jpg', 5),
(54, 'http://localhost:8000/images/products/1664977542702oppo-a95-4g-bac-10-1.jpg', 5),
(55, 'http://localhost:8000/images/products/1664977542670oppo-a95-4g-bac-11-1.jpg', 5),
(56, 'http://localhost:8000/images/products/1664977542667oppo-a95-4g-bac-12-1.jpg', 5),
(57, 'http://localhost:8000/images/products/1664977542672oppo-a95-4g-bac-13-1.jpg', 5),
(58, 'http://localhost:8000/images/products/1664978198808oppo-reno8-4g-thumb-vang-600x600.jpg', 6),
(59, 'http://localhost:8000/images/products/1664978198820oppo-reno8-vang-1.jpg', 6),
(60, 'http://localhost:8000/images/products/1664978198847oppo-reno8-vang-4.jpg', 6),
(61, 'http://localhost:8000/images/products/1664978198811oppo-reno8-vang-5.jpg', 6),
(62, 'http://localhost:8000/images/products/1664978198815oppo-reno8-vang-6.jpg', 6),
(63, 'http://localhost:8000/images/products/1664978198818oppo-reno8-vang-7.jpg', 6),
(64, 'http://localhost:8000/images/products/1664978198822oppo-reno8-vang-8.jpg', 6),
(65, 'http://localhost:8000/images/products/1664978198829oppo-reno8-vang-9.jpg', 6),
(66, 'http://localhost:8000/images/products/1664978198841oppo-reno8-vang-10.jpg', 6),
(67, 'http://localhost:8000/images/products/1664978198851oppo-reno8-vang-11.jpg', 6),
(68, 'http://localhost:8000/images/products/1664978198863oppo-reno8-vang-12.jpg', 6),
(69, 'http://localhost:8000/images/products/1664978198856oppo-reno8-vang-13.jpg', 6),
(70, 'http://localhost:8000/images/products/1664978988811Samsung-Galaxy-A13-cam-thumb-600x600.jpg', 7),
(71, 'http://localhost:8000/images/products/1664978988780samsung-galaxy-a13-4g-1.jpg', 7),
(72, 'http://localhost:8000/images/products/1664978988787samsung-galaxy-a13-4g-4.jpg', 7),
(73, 'http://localhost:8000/images/products/1664978988809samsung-galaxy-a13-4g-5.jpg', 7),
(74, 'http://localhost:8000/images/products/1664978988819samsung-galaxy-a13-4g-6.jpg', 7),
(75, 'http://localhost:8000/images/products/1664978988785samsung-galaxy-a13-4g-7.jpg', 7),
(76, 'http://localhost:8000/images/products/1664978988803samsung-galaxy-a13-4g-8.jpg', 7),
(77, 'http://localhost:8000/images/products/1664978988782samsung-galaxy-a13-4g-9.jpg', 7),
(78, 'http://localhost:8000/images/products/1664978988789samsung-galaxy-a13-4g-10.jpg', 7),
(79, 'http://localhost:8000/images/products/1664978988792samsung-galaxy-a13-4g-11.jpg', 7),
(80, 'http://localhost:8000/images/products/1664978988815samsung-galaxy-a13-4g-12.jpg', 7),
(81, 'http://localhost:8000/images/products/1664979540847Samsung-Galaxy-A53-xanh-thumb-600x600.jpg', 8),
(82, 'http://localhost:8000/images/products/1664979540816samsung-galaxy-a53-1-1.jpg', 8),
(83, 'http://localhost:8000/images/products/1664979540825samsung-galaxy-a53-4-1.jpg', 8),
(84, 'http://localhost:8000/images/products/1664979540845samsung-galaxy-a53-5.jpg', 8),
(85, 'http://localhost:8000/images/products/1664979540865samsung-galaxy-a53-6.jpg', 8),
(86, 'http://localhost:8000/images/products/1664979540859samsung-galaxy-a53-7.jpg', 8),
(87, 'http://localhost:8000/images/products/1664979540822samsung-galaxy-a53-8.jpg', 8),
(88, 'http://localhost:8000/images/products/1664979540818samsung-galaxy-a53-9.jpg', 8),
(89, 'http://localhost:8000/images/products/1664979540830samsung-galaxy-a53-10.jpg', 8),
(90, 'http://localhost:8000/images/products/1664979540827samsung-galaxy-a53-11.jpg', 8),
(91, 'http://localhost:8000/images/products/1664979540840samsung-galaxy-a53-12.jpg', 8),
(92, 'http://localhost:8000/images/products/1664980132272iphone-13-mini-midnight-1-600x600.jpg', 9),
(93, 'http://localhost:8000/images/products/1664980132241iphone-13-mini-1-1.jpg', 9),
(94, 'http://localhost:8000/images/products/1664980132244iphone-13-mini-4-1.jpg', 9),
(95, 'http://localhost:8000/images/products/1664980132275iphone-13-mini-5-1.jpg', 9),
(96, 'http://localhost:8000/images/products/1664980132266iphone-13-mini-6-1.jpg', 9),
(97, 'http://localhost:8000/images/products/1664980132246iphone-13-mini-7-1.jpg', 9),
(98, 'http://localhost:8000/images/products/1664980132248iphone-13-mini-8-1.jpg', 9),
(99, 'http://localhost:8000/images/products/1664980132250iphone-13-mini-9-1.jpg', 9),
(100, 'http://localhost:8000/images/products/1664980132252iphone-13-mini-10-1.jpg', 9),
(101, 'http://localhost:8000/images/products/1664980132262iphone-13-mini-11-1.jpg', 9),
(102, 'http://localhost:8000/images/products/1664980905945iphone-12-den-new-2-600x600.jpg', 10),
(103, 'http://localhost:8000/images/products/1664980905916iphone-12-den-1-1-org.jpg', 10),
(104, 'http://localhost:8000/images/products/1664980905926iphone-12-den-4-org.jpg', 10),
(105, 'http://localhost:8000/images/products/1664980905943iphone-12-den-5-1-org.jpg', 10),
(106, 'http://localhost:8000/images/products/1664980905955iphone-12-den-6-org.jpg', 10),
(107, 'http://localhost:8000/images/products/1664980905919iphone-12-den-8-org.jpg', 10),
(108, 'http://localhost:8000/images/products/1664980905921iphone-12-den-9-org.jpg', 10),
(109, 'http://localhost:8000/images/products/1664980905923iphone-12-den-10-org.jpg', 10),
(110, 'http://localhost:8000/images/products/1664980905929iphone-12-den-11-org.jpg', 10),
(111, 'http://localhost:8000/images/products/1664980905953iphone-12-den-12-org.jpg', 10);

-- --------------------------------------------------------

--
-- Table structure for table `product_option`
--

CREATE TABLE `product_option` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `ram_id` int(11) DEFAULT NULL,
  `rom_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `original_price` int(11) DEFAULT NULL,
  `sale_price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sold_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_option`
--

INSERT INTO `product_option` (`id`, `product_id`, `ram_id`, `rom_id`, `color_id`, `original_price`, `sale_price`, `quantity`, `sold_quantity`) VALUES
(1, 1, 4, 4, 10, 4690000, 4590000, 10, 3),
(2, 1, 4, 4, 3, 4690000, 4590000, 10, 0),
(3, 1, 5, 5, 10, 5490000, 5290000, 10, 0),
(4, 1, 5, 5, 3, 5490000, 5290000, 10, 1),
(5, 2, 6, 5, 7, 7490000, 7290000, 10, 2),
(6, 2, 6, 5, 10, 7490000, 7290000, 10, 0),
(7, 2, 6, 5, 3, 7490000, 7290000, 10, 0),
(8, 3, 6, 6, 10, 19990000, 15990000, 0, 0),
(9, 3, 6, 6, 3, 19990000, 15990000, 0, 0),
(10, 3, 6, 6, 12, 19990000, 15990000, 0, 0),
(11, 4, 6, 5, 2, 12990000, 10390000, 0, 0),
(12, 4, 6, 5, 8, 12990000, 10390000, 0, 0),
(13, 4, 6, 5, 3, 12990000, 10390000, 0, 0),
(14, 5, 6, 5, 5, 6490000, 6390000, 0, 0),
(15, 5, 6, 5, 2, 6490000, 6390000, 0, 0),
(16, 6, 6, 6, 7, 8990000, 8990000, 0, 0),
(17, 6, 6, 6, 2, 8990000, 8990000, 0, 0),
(18, 7, 4, 5, 13, 4690000, 4590000, 100, 2),
(19, 7, 4, 5, 2, 4690000, 4590000, 100, 0),
(20, 7, 4, 5, 3, 4690000, 4590000, 100, 0),
(21, 7, 5, 5, 13, 5190000, 5090000, 100, 0),
(22, 7, 5, 5, 2, 5190000, 5090000, 100, 0),
(23, 7, 5, 5, 3, 5190000, 5090000, 100, 1),
(24, 8, 6, 5, 2, 10090000, 9990000, 10, 0),
(25, 8, 6, 5, 3, 10090000, 9990000, 10, 2),
(26, 8, 6, 5, 9, 10090000, 9990000, 10, 0),
(27, 8, 6, 5, 13, 10090000, 9990000, 10, 0),
(28, 9, 4, 5, 2, 21990000, 16990000, 100, 0),
(29, 9, 4, 5, 3, 21990000, 16990000, 100, 0),
(30, 9, 4, 5, 8, 21990000, 16990000, 100, 0),
(31, 9, 4, 6, 2, 22990000, 20990000, 100, 0),
(32, 9, 4, 6, 3, 22990000, 20990000, 100, 1),
(33, 9, 4, 6, 8, 22990000, 20990000, 100, 0),
(34, 9, 4, 7, 2, 30990000, 23990000, 0, 0),
(35, 9, 4, 7, 3, 30990000, 23990000, 0, 0),
(36, 9, 4, 7, 8, 30990000, 23990000, 0, 0),
(37, 10, 4, 4, 2, 19990000, 16990000, 0, 0),
(38, 10, 4, 4, 6, 19990000, 16990000, 0, 0),
(39, 10, 4, 4, 3, 19990000, 16990000, 0, 0),
(40, 10, 4, 4, 9, 19990000, 16990000, 0, 0),
(41, 10, 4, 5, 2, 21990000, 18990000, 0, 0),
(42, 10, 4, 5, 6, 21990000, 18990000, 0, 0),
(43, 10, 4, 5, 3, 21990000, 18990000, 0, 0),
(44, 10, 4, 5, 9, 21990000, 18990000, 0, 0),
(45, 10, 4, 6, 2, 25990000, 23990000, 0, 0),
(46, 10, 4, 6, 6, 25990000, 23990000, 0, 0),
(47, 10, 4, 6, 3, 25990000, 23990000, 0, 0),
(48, 10, 4, 6, 9, 25990000, 23990000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_rating`
--

CREATE TABLE `product_rating` (
  `id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_rating`
--

INSERT INTO `product_rating` (`id`, `rating`, `content`, `created_date`, `user_id`, `product_id`) VALUES
(1, 5, 'Điện thoại dùng rất tốt', '2022-10-05 22:19:19', 7, 7),
(2, 4, 'Điện thoại ngon, camera chụp hình đẹp, chơi game rất mượt', '2022-10-05 22:21:59', 7, 9),
(3, 3, 'Điện thoại dùng ổn', '2022-10-05 22:33:24', 8, 2),
(4, 4, 'Điện thoại dùng khá ngon', '2022-10-05 22:33:38', 8, 1),
(5, 5, 'Điện thoại dùng rất tốt, mọi người nên mua', '2022-10-05 22:35:23', 8, 8),
(6, 5, 'Sản phẩm dùng rất tốt, chơi game ngon, pin trâu, chụp hình đẹp mọi người nên mua dùng thử', '2022-10-05 22:46:33', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ram_option`
--

CREATE TABLE `ram_option` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ram_option`
--

INSERT INTO `ram_option` (`id`, `name`, `created_date`) VALUES
(1, '1 GB', '2022-01-23 06:00:00'),
(2, '2 GB', '2022-01-23 06:00:00'),
(3, '3 GB', '2022-01-23 06:00:00'),
(4, '4 GB', '2022-01-23 06:00:00'),
(5, '6 GB', '2022-01-23 06:00:00'),
(6, '8 GB', '2022-01-23 06:00:00'),
(7, '12 GB', '2022-01-23 06:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rating_image`
--

CREATE TABLE `rating_image` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `rating_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rating_image`
--

INSERT INTO `rating_image` (`id`, `image`, `rating_id`) VALUES
(1, 'http://localhost:8000/images/ratings/16649847859351664975837955xiaomi-redmi-note-10-pro-4-1-org.jpg', 6),
(2, 'http://localhost:8000/images/ratings/16649847859431664975837968xiaomi-redmi-note-10-pro-10-1-org.jpg', 6),
(3, 'http://localhost:8000/images/ratings/16649847859461664975837974xiaomi-redmi-note-10-pro-11-1-org.jpg', 6),
(4, 'http://localhost:8000/images/ratings/16649847859391664975837977xiaomi-redmi-note-10-pro-5-1-org.jpg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE `receipt` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_price` bigint(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `receipt`
--

INSERT INTO `receipt` (`id`, `supplier_id`, `user_id`, `total_price`, `created_date`) VALUES
(1, 1, 1, 12300000000, '2022-10-05 22:02:28'),
(2, 2, 1, 791900000, '2022-10-05 22:26:45');

-- --------------------------------------------------------

--
-- Table structure for table `receipt_detail`
--

CREATE TABLE `receipt_detail` (
  `id` int(11) NOT NULL,
  `receipt_id` int(11) DEFAULT NULL,
  `product_option_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `receipt_detail`
--

INSERT INTO `receipt_detail` (`id`, `receipt_id`, `product_option_id`, `quantity`, `price`) VALUES
(1, 1, 18, 100, 4200000),
(2, 1, 19, 100, 4200000),
(3, 1, 20, 100, 4200000),
(4, 1, 21, 100, 4800000),
(5, 1, 22, 100, 4800000),
(6, 1, 23, 100, 4800000),
(7, 1, 28, 100, 14000000),
(8, 1, 29, 100, 14000000),
(9, 1, 30, 100, 14000000),
(10, 1, 31, 100, 18000000),
(11, 1, 32, 100, 18000000),
(12, 1, 33, 100, 18000000),
(13, 2, 24, 10, 9690000),
(14, 2, 25, 10, 9690000),
(15, 2, 26, 10, 9690000),
(16, 2, 27, 10, 9690000),
(17, 2, 1, 10, 4490000),
(18, 2, 2, 10, 4490000),
(19, 2, 3, 10, 5090000),
(20, 2, 4, 10, 5090000),
(21, 2, 5, 10, 7090000),
(22, 2, 6, 10, 7090000),
(23, 2, 7, 10, 7090000);

-- --------------------------------------------------------

--
-- Table structure for table `rom_option`
--

CREATE TABLE `rom_option` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rom_option`
--

INSERT INTO `rom_option` (`id`, `name`, `created_date`) VALUES
(1, '8 GB', '2022-01-23 06:00:00'),
(2, '16 GB', '2022-01-23 06:00:00'),
(3, '32 GB', '2022-01-23 06:00:00'),
(4, '64 GB', '2022-01-23 06:00:00'),
(5, '128 GB', '2022-01-23 06:00:00'),
(6, '256 GB', '2022-01-23 06:00:00'),
(7, '512 GB', '2022-01-23 06:00:00'),
(8, '1 TB', '2022-01-23 06:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `shop_info`
--

CREATE TABLE `shop_info` (
  `id` int(11) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `ward_code` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_info`
--

INSERT INTO `shop_info` (`id`, `logo`, `name`, `description`, `email`, `phone_number`, `province_id`, `district_id`, `ward_code`, `address`) VALUES
(1, 'Mobile Store', 'Công Ty TNHH Mobile Store', NULL, 'mobilestore@gmail.com', '0989123123', 202, 1454, '21203', '123 đường Nguyễn Ảnh Thủ');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `ward_code` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `phone_number`, `description`, `province_id`, `district_id`, `ward_code`, `address`, `created_date`) VALUES
(1, 'Thế giới di động', '0999111222', 'Thế giới di động là cửa hàng chuyên cung cấp các sản phẩm về di động.', 202, 3695, '90765', '123', '2022-10-05 21:57:37'),
(2, 'Cellphones', '0123888315', 'Cellphones là nơi chuyên cung cấp các sản phẩm về điện thoại di động.', 202, 1442, '20110', '12A', '2022-10-05 21:59:18');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `avatar`, `full_name`, `date_of_birth`, `gender`, `phone_number`, `email`, `password`, `created_date`, `role_id`) VALUES
(1, 'http://localhost:8000/images/avatars/1664893318437user-01.jpg', 'Nguyễn Quốc Huy', '2000-01-01', 1, '0388235023', 'huynguyen@gmail.com', '$2b$10$8ULORIyJvJ4K7/XTTZmDpejIUrhY1zzHkHW8xgcLgaFfAUk4Rzz.K', '2022-10-04 21:07:13', 1),
(2, 'http://localhost:8000/images/avatars/default_avatar.png', 'Nguyễn Hoài Tân', NULL, NULL, '0123123123', 'tannguyen@gmail.com', '$2b$10$XaH7eb32dsUFEsf.xnDnjOQqKjn0yW6mYcKLk.Ti74z3NdZXCfbPG', '2022-10-04 21:08:12', 4),
(3, 'http://localhost:8000/images/avatars/default_avatar.png', 'Nguyễn Thị Kim Ngân', '2000-06-06', 0, '0123213557', 'ngannguyen@gmail.com', '$2b$10$K.tShWLZX2JgiLoSKp6BmOIqI.Xna4F7niy9t7oRLgo3M5TwUMNxy', '2022-10-04 21:23:36', 2),
(4, 'http://localhost:8000/images/avatars/default_avatar.png', 'Nguyễn Nam Anh', '2000-01-01', 1, '0998123321', 'anhnguyen@gmail.com', '$2b$10$kll7ic7HCoRxWdpcFDshPuyrcZ1wFiBIPNxpTi4oPaWGWA.GN2jsG', '2022-10-04 21:25:13', 3),
(5, 'http://localhost:8000/images/avatars/default_avatar.png', 'Trần Thị Tường Vy', '1998-12-31', 0, '0918112331', 'vytran@gmail.com', '$2b$10$97wdVB2Cul.c1C7005ni3.QrCJGE6VuvBGz8V2PuyxE3fS1YS1w/O', '2022-10-04 21:46:36', 2),
(6, 'http://localhost:8000/images/avatars/default_avatar.png', 'Trần Đăng Khoa', '1990-12-31', 1, '0919123321', 'khoatran@gmail.com', '$2b$10$ygC4IqtoHGrHPLpvgEfd.OptcNlSOArpTVGSUZJ5V5qnbDRMWzS0y', '2022-10-04 21:47:29', 3),
(7, 'http://localhost:8000/images/avatars/default_avatar.png', 'Nguyễn Thành Lộc', NULL, NULL, '0399123123', 'locnguyen@gmail.com', '$2b$10$K.4KxQA4xyOqfKWaSF6VRuWSHVcI98LhhsC1xi8KTeVU1rep/LBqu', '2022-10-05 22:13:24', 4),
(8, 'http://localhost:8000/images/avatars/default_avatar.png', 'Nguyễn Thanh Nhi', NULL, NULL, '0919123123', 'nhinguyen@gmail.com', '$2b$10$tMapZPhEn9Le271XxRE6WeJ6f4zhdtllgwIXKbJQhnSjs58Kg4Kwu', '2022-10-05 22:30:12', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `ward_code` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `full_address` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`id`, `full_name`, `phone_number`, `user_id`, `province_id`, `district_id`, `ward_code`, `address`, `full_address`, `is_default`) VALUES
(1, 'Nguyễn Hoài Tân', '0123123123', 2, 202, 1454, '21203', '123 đường Nguyễn Ảnh Thủ', '123 đường Nguyễn Ảnh Thủ, Phường Hiệp Thành, Quận 12, Hồ Chí Minh', 1),
(2, 'Nguyễn Thành Lộc', '0123123123', 7, 220, 1572, '550113', '123 đường 3-2', '123 đường 3-2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ', 1),
(3, 'Nguyễn Thanh Nhi', '0919123123', 8, 220, 1572, '550113', '456 đường 3-2', '456 đường 3-2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `name`) VALUES
(4, 'Khách hàng'),
(2, 'Nhân viên bán hàng'),
(3, 'Nhân viên quản lý kho'),
(1, 'Quản trị');

-- --------------------------------------------------------

--
-- Table structure for table `viewed_notification`
--

CREATE TABLE `viewed_notification` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_option_id` (`product_option_id`);

--
-- Indexes for table `color_option`
--
ALTER TABLE `color_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `coupons_id` (`coupons_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_option_id` (`product_option_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_option`
--
ALTER TABLE `product_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `ram_id` (`ram_id`),
  ADD KEY `rom_id` (`rom_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Indexes for table `product_rating`
--
ALTER TABLE `product_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `ram_option`
--
ALTER TABLE `ram_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating_image`
--
ALTER TABLE `rating_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rating_id` (`rating_id`);

--
-- Indexes for table `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `receipt_detail`
--
ALTER TABLE `receipt_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receipt_id` (`receipt_id`),
  ADD KEY `product_option_id` (`product_option_id`);

--
-- Indexes for table `rom_option`
--
ALTER TABLE `rom_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_info`
--
ALTER TABLE `shop_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `viewed_notification`
--
ALTER TABLE `viewed_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `notification_id` (`notification_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `color_option`
--
ALTER TABLE `color_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_tracking`
--
ALTER TABLE `order_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `product_option`
--
ALTER TABLE `product_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `product_rating`
--
ALTER TABLE `product_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ram_option`
--
ALTER TABLE `ram_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rating_image`
--
ALTER TABLE `rating_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `receipt`
--
ALTER TABLE `receipt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `receipt_detail`
--
ALTER TABLE `receipt_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `rom_option`
--
ALTER TABLE `rom_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shop_info`
--
ALTER TABLE `shop_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `viewed_notification`
--
ALTER TABLE `viewed_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `banner`
--
ALTER TABLE `banner`
  ADD CONSTRAINT `banner_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_option_id`) REFERENCES `product_option` (`id`);

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`coupons_id`) REFERENCES `coupons` (`id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_option_id`) REFERENCES `product_option` (`id`);

--
-- Constraints for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD CONSTRAINT `order_tracking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `order_tracking_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `order_tracking_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product_option`
--
ALTER TABLE `product_option`
  ADD CONSTRAINT `product_option_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_option_ibfk_2` FOREIGN KEY (`ram_id`) REFERENCES `ram_option` (`id`),
  ADD CONSTRAINT `product_option_ibfk_3` FOREIGN KEY (`rom_id`) REFERENCES `rom_option` (`id`),
  ADD CONSTRAINT `product_option_ibfk_4` FOREIGN KEY (`color_id`) REFERENCES `color_option` (`id`);

--
-- Constraints for table `product_rating`
--
ALTER TABLE `product_rating`
  ADD CONSTRAINT `product_rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `product_rating_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `rating_image`
--
ALTER TABLE `rating_image`
  ADD CONSTRAINT `rating_image_ibfk_1` FOREIGN KEY (`rating_id`) REFERENCES `product_rating` (`id`);

--
-- Constraints for table `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `receipt_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `receipt_detail`
--
ALTER TABLE `receipt_detail`
  ADD CONSTRAINT `receipt_detail_ibfk_1` FOREIGN KEY (`receipt_id`) REFERENCES `receipt` (`id`),
  ADD CONSTRAINT `receipt_detail_ibfk_2` FOREIGN KEY (`product_option_id`) REFERENCES `product_option` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`);

--
-- Constraints for table `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `viewed_notification`
--
ALTER TABLE `viewed_notification`
  ADD CONSTRAINT `viewed_notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `viewed_notification_ibfk_2` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
