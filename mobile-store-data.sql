-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 08, 2022 lúc 02:35 PM
-- Phiên bản máy phục vụ: 10.1.36-MariaDB
-- Phiên bản PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mobile-store`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
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
-- Đang đổ dữ liệu cho bảng `banner`
--

INSERT INTO `banner` (`id`, `name`, `image`, `published`, `created_date`, `user_id`) VALUES
(12, 'Banner sản phẩm', 'http://localhost:8000/images/banners/1646407575832banner1.jpg', 1, '2022-03-04 22:26:14', 1),
(13, 'Banner 2', 'http://localhost:8000/images/banners/1646407589897iphone-12-banner-1400x633.png', 1, '2022-03-04 22:26:28', 1),
(14, 'Bannner 3', 'http://localhost:8000/images/banners/1646408574478y33s_kv_vn_pc.png', 1, '2022-03-04 22:42:53', 1),
(15, 'Banner 4', 'http://localhost:8000/images/banners/1646408623467s20-plus-pc-banner.jpg', 0, '2022-03-04 22:43:42', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`id`, `name`, `published`, `created_date`) VALUES
(1, 'Samsung', 1, '2022-01-17 12:00:00'),
(2, 'Vivo', 1, '2022-01-17 12:00:00'),
(3, 'Apple', 1, '2022-01-17 12:00:00'),
(4, 'Xiaomi', 1, '2022-01-17 12:00:00'),
(5, 'OPPO', 1, '2022-01-17 12:00:00'),
(6, 'Nokia', 1, '2022-01-17 12:00:00'),
(7, 'Realme', 1, '2022-01-17 12:00:00'),
(23, 'Test 1', 0, '2022-02-16 15:21:01'),
(24, 'Test 2', 0, '2022-02-16 15:21:07'),
(25, 'Test 3', 0, '2022-02-16 15:21:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
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
-- Cấu trúc bảng cho bảng `color_option`
--

CREATE TABLE `color_option` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `color_option`
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
(13, 'Cam', '2022-01-23 06:00:00'),
(14, 'Xanh đen', '2022-03-01 21:51:13'),
(15, 'Tím hồng', '2022-03-01 21:51:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notification`
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
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `total_price` int(11) DEFAULT NULL,
  `delivery_cost` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `coupons_id` int(11) DEFAULT NULL,
  `shop_address` varchar(1000) DEFAULT NULL,
  `delivery_address` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Chờ xác nhận'),
(2, 'Đang xử lý'),
(3, 'Đang vận chuyển'),
(4, 'Đã giao hàng'),
(5, 'Đã hủy');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_tracking`
--

CREATE TABLE `order_tracking` (
  `id` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `specifications` text,
  `description` text,
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
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `specifications`, `description`, `width`, `height`, `weight`, `length`, `created_date`, `published`, `brand_id`, `user_id`) VALUES
(3, 'iPhone 12 Pro Max', '<table style=\"border-collapse: collapse; width: 99.975%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 13.5689%;\">Băng tần 3G</td>\n<td style=\"width: 86.4055%;\">HSPA 42.2/5.76 Mbps, EV-DO Rev.A 3.1 Mbps</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Dung lượng pin</td>\n<td style=\"width: 86.4055%;\">3687 mAh</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Bluetooth</td>\n<td style=\"width: 86.4055%;\">A2DP, v5.0</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Thương hiệu</td>\n<td style=\"width: 86.4055%;\">Apple</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Xuất xứ thương hiệu</td>\n<td style=\"width: 86.4055%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Camera sau</td>\n<td style=\"width: 86.4055%;\">12 MP, f/1.6, 26mm (wide), 1.4&micro;m, dual pixel PDAF, OIS; 12 MP, f/2.0, 52mm (telephoto), 1/3.4\", 1.0&micro;m, PDAF, OIS, 2x optical zoom; 12 MP, f/2.4, 120˚, 13mm (ultrawide), 1/3.6\" TOF 3D LiDAR scanner (depth)</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Camera trước</td>\n<td style=\"width: 86.4055%;\">12 MP, f/2.2, 23mm (wide), 1/3.6\" SL 3D, (depth/biometrics sensor)</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Hỗ trợ thẻ nhớ ngo&agrave;i</td>\n<td style=\"width: 86.4055%;\">Kh&ocirc;ng</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Chip đồ họa (GPU)</td>\n<td style=\"width: 86.4055%;\">Apple GPU (4-core graphics)</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Chip set</td>\n<td style=\"width: 86.4055%;\">Apple A14 Bionic 6 nh&acirc;n</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">NFC</td>\n<td style=\"width: 86.4055%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Đ&egrave;n Flash</td>\n<td style=\"width: 86.4055%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">K&iacute;ch thước</td>\n<td style=\"width: 86.4055%;\">\n<p>D&agrave;i 160.8 mm - Ngang 78.1 mm - D&agrave;y 7.4 mm - Nặng 228 g</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 86.4055%;\">Super Retina XDR OLED, HDR10, Dolby Vision, Wide color gamut, True-tone</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">FM radio</td>\n<td style=\"width: 86.4055%;\">Kh&ocirc;ng</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Ghi &acirc;m</td>\n<td style=\"width: 86.4055%;\">C&oacute; (microphone chuy&ecirc;n dụng chống ồn)</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">GPS</td>\n<td style=\"width: 86.4055%;\">BDS, GLONASS, A-GPS</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">H&ocirc;̃ trợ 4G</td>\n<td style=\"width: 86.4055%;\">LTE-A (4CA) Cat16 1024/150 Mbps</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Phụ kiện đi k&egrave;m</td>\n<td style=\"width: 86.4055%;\">\n<p>Bộ sản phẩm gồm: Hộp, S&aacute;ch hướng dẫn, C&acirc;y lấy sim, C&aacute;p Lightning - Type C&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Jack tai nghe</td>\n<td style=\"width: 86.4055%;\">Lightning</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Bộ nhớ khả dụng</td>\n<td style=\"width: 86.4055%;\">113 GB</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Số sim</td>\n<td style=\"width: 86.4055%;\">1</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Loại pin</td>\n<td style=\"width: 86.4055%;\">Li-Ion</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Loại Sim</td>\n<td style=\"width: 86.4055%;\">Nano Sim, eSim</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Nh&agrave; sản xuất</td>\n<td style=\"width: 86.4055%;\">Apple</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Chất liệu</td>\n<td style=\"width: 86.4055%;\">Khung th&eacute;p kh&ocirc;ng gỉ &amp; Mặt lưng k&iacute;nh cường lực</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Nghe nhạc</td>\n<td style=\"width: 86.4055%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Xuất xứ</td>\n<td style=\"width: 86.4055%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Pin c&oacute; thể th&aacute;o rời</td>\n<td style=\"width: 86.4055%;\">Kh&ocirc;ng</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Cổng sạc</td>\n<td style=\"width: 86.4055%;\">Lightning</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Trọng lượng</td>\n<td style=\"width: 86.4055%;\">228g</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Quay phim</td>\n<td style=\"width: 86.4055%;\">Trước: 4K@24/30/60fps, 1080p@30/60/120fps, gyro-EIS; Sau: 4K@24/30/60fps, 1080p@30/60/120/240fps, HDR, Dolby Vision HDR (up to 60fps), stereo sound rec.</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">RAM</td>\n<td style=\"width: 86.4055%;\">6GB</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Độ ph&acirc;n giải</td>\n<td style=\"width: 86.4055%;\">1284 x 2778 pixels</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">ROM</td>\n<td style=\"width: 86.4055%;\">256GB</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 86.4055%;\">6.7 inch</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Video call</td>\n<td style=\"width: 86.4055%;\">Th&ocirc;ng qua ứng dụng thứ 3</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Wifi</td>\n<td style=\"width: 86.4055%;\">Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, hotspot</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">Xem phim</td>\n<td style=\"width: 86.4055%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 13.5689%;\">C&oacute; thuế VAT</td>\n<td style=\"width: 86.4055%;\">C&oacute;</td>\n</tr>\n</tbody>\n</table>', '<h3><a title=\"Tham khảo điện thoại iPhone 12 Pro Max 128GB ch&iacute;nh h&atilde;ng tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd/iphone-12-pro-max\" target=\"_blank\" rel=\"noopener\">iPhone 12 Pro Max 128 GB</a>&nbsp;một si&ecirc;u phẩm&nbsp;<a title=\"Tham khảo điện thoại smartphone ch&iacute;nh h&atilde;ng tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">smartphone</a>&nbsp;đến từ&nbsp;<a title=\"Tham khảo sản phẩm ch&iacute;nh h&atilde;ng của Apple tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/apple\" target=\"_blank\" rel=\"noopener\">Apple</a>. M&aacute;y c&oacute; một hiệu năng ho&agrave;n to&agrave;n mạnh mẽ đ&aacute;p ứng tốt nhiều nhu cầu đến từ người d&ugrave;ng v&agrave; mang trong m&igrave;nh một thiết kế đầy vu&ocirc;ng vức, sang trọng.</h3>\n<h3>Thay đổi thiết kế mới sau 6 năm</h3>\n<p>Theo chu kỳ cứ mỗi 3 năm th&igrave; iPhone lại thay đổi thiết kế v&agrave; 2020 l&agrave; năm đ&aacute;nh dấu cột mốc quan trong n&agrave;y, v&igrave; thế rất c&oacute; thể đ&acirc;y l&agrave; thời điểm c&aacute;c mẫu&nbsp;<a title=\"Tham khảo c&aacute;c mẫu điện thoại iPhone 12 ch&iacute;nh h&atilde;ng, gi&aacute; tốt tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd/iphone-12\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo c&aacute;c mẫu điện thoại iPhone 12 ch&iacute;nh h&atilde;ng, gi&aacute; tốt tại Thegioididong.com\">iPhone 12</a>&nbsp;sẽ c&oacute; một sự thay đổi mạnh mẽ về thiết kế.</p>\n<p>iPhone 12 Pro Max sở hữu diện mạo mới mới với khung viền được v&aacute;t thẳng v&agrave; mạnh mẽ như tr&ecirc;n&nbsp;<a title=\"Tham khảo gi&aacute; m&aacute;y t&iacute;nh bảng Apple iPad Pro 12.9 inch Wifi 128GB (2020)\" href=\"https://www.thegioididong.com/may-tinh-bang/ipad-pro-12-9-inch-wifi-128gb-2020\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo gi&aacute; m&aacute;y t&iacute;nh bảng Apple iPad Pro 12.9 inch Wifi 128GB (2020)\">iPad Pro 2020</a>, chấm dứt hơn 6 năm với kiểu thiết kế bo cong tr&ecirc;n&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại iPhone 6 ch&iacute;nh h&atilde;ng tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd/iphone-6-32gb-gold\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo gi&aacute; điện thoại iPhone 6 ch&iacute;nh h&atilde;ng tại Thegioididong.com\">iPhone 6</a>&nbsp;được ra mắt lần đầu ti&ecirc;n v&agrave;o năm 2014.</p>\n<p><img src=\"http://localhost:8000/images/products/1645780918112iphone-12-pro-max-2-1.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Nếu iPad Pro 2020 sử dụng chất liệu nh&ocirc;m nguy&ecirc;n khối, th&igrave;&nbsp;<a title=\"Tham khảo d&ograve;ng sản phẩm iPhone 12 đang kinh doanh tại TopZone thương hiệu của Thế Giới Di Động\" href=\"https://www.topzone.vn/iphone-12\" target=\"_blank\" rel=\"noopener\">iPhone 12</a>&nbsp;Pro Max sẽ l&agrave; chất liệu mặt k&iacute;nh c&ugrave;ng khung viền th&eacute;p, l&agrave;m người d&ugrave;ng gợi nhớ nhiều hơn về bộ đ&ocirc;i iPhone 4/4s huyền thoại với thiết kế đẹp nhất trong lịch sử thiết kế của Apple.</p>\n<p><img src=\"http://localhost:8000/images/products/1645780961791iphone-12-pro-max-4-1.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Sự kh&aacute;c biệt với bộ đ&ocirc;i 4/4s nằm ở phần mặt k&iacute;nh của iPhone 12 Pro Max được l&agrave;m cong nhẹ, gi&uacute;p &ocirc;m kh&iacute;t khung viền ho&agrave;n hảo tạo sự liền mạch của m&agrave;n h&igrave;nh khi cầm nắm sử dụng.</p>\n<p>iPhone 12 Pro Max sẽ c&oacute; độ mỏng ấn tượng chỉ 7,4 mm tức c&ograve;n mỏng hơn khoảng 10% so với&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại iPhone 11 Pro Max ch&iacute;nh h&atilde;ng tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd/iphone-11-pro-max\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo gi&aacute; điện thoại iPhone 11 Pro Max ch&iacute;nh h&atilde;ng tại Thegioididong.com\">iPhone 11 Pro Max</a>&nbsp;hiện nay đang l&agrave; 8,1 mm. Điều n&agrave;y c&agrave;ng l&agrave;m tăng sự quyến rũ, đẳng cấp cho thiết bị từ mọi g&oacute;c nh&igrave;n.</p>\n<p><img src=\"http://localhost:8000/images/products/1645780999795iphone-12-pro-max-6-1.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<h3>Chất lượng hiển thị tuyệt vời</h3>\n<p>iPhone 12 Pro Max được trang bị m&agrave;n h&igrave;nh OLED k&iacute;ch thước 6.7 inch với c&ocirc;ng nghệ Super Retina XDR mang đến chất lượng h&igrave;nh ảnh sắc n&eacute;t, m&agrave;u sắc được t&aacute;i tạo chuẩn x&aacute;c, độ tương phản cao, m&agrave;u đen s&acirc;u tiết kiệm pin hơn.</p>\n<p><img src=\"http://localhost:8000/images/products/1645781026750iphone-12-pro-max-292420-102459.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>B&ecirc;n cạnh đ&oacute;, một tin kh&ocirc;ng vui cho iFan, iPhone 12 Pro Max rất c&oacute; thể sẽ kh&ocirc;ng đi k&egrave;m bất kỳ phụ kiện n&agrave;o, kể cả c&aacute;p sạc đều l&agrave; những phụ kiện cơ bản nhất. Điều n&agrave;y đồng nghĩa, người d&ugrave;ng cần chi th&ecirc;m một số tiền kha kh&aacute; để mua ch&iacute;nh h&atilde;ng.</p>\n<h3>Cụm camera sau được n&acirc;ng cấp mạnh mẽ</h3>\n<p>Cụm camera iPhone 12 Pro Max tiếp tục sẽ l&agrave; phần được mong chờ nhất cũng l&agrave; phần quan trọng m&agrave; Apple tập trung n&acirc;ng cấp qua c&aacute;c thế hệ&nbsp;<a title=\"Tham khảo điện thoại iPhone đang kinh doanh tại TopZone thương hiệu của Thế Giới Di Động\" href=\"https://www.topzone.vn/iphone\" target=\"_blank\" rel=\"noopener\">điện thoại iPhone</a>.</p>\n<p>iPhone 12 Pro Max vẫn sử dụng hệ thống camera h&igrave;nh vu&ocirc;ng ở ph&iacute;a sau đồng thời bổ sung th&ecirc;m cảm biến LiDAR tạo th&agrave;nh 1 hệ thống 3 camera chất lượng.</p>\n<p>Cảm biến LiDAR đo độ s&acirc;u bằng tia laser tương tự như iPad Pro gi&uacute;p nhận diện khoảng c&aacute;ch giữa vật thể ch&iacute;nh x&aacute;c, tăng cường cho c&aacute;c ứng dụng thực tế ảo đồng thời cũng hỗ trợ cho 3 camera hoạt động 1 c&aacute;ch tối ưu nhất.</p>\n<p>Chất lượng h&igrave;nh ảnh iPhone 12 Pro Max cho ra lu&ocirc;n thuộc h&agrave;ng top hiện nay với điểm mạnh l&agrave; m&agrave;u sắc v&ocirc; c&ugrave;ng ch&acirc;n thực, độ ch&iacute;nh x&aacute;c cao, dải m&agrave;u rộng.&nbsp;</p>\n<p>Về t&iacute;nh năng, iPhone 12 Pro Max kế thừa mọi thứ hiện c&oacute; tr&ecirc;n iPhone 11, gồm chế độ Deep Fusion v&agrave; Night Mode. Cũng c&oacute; thể Apple sẽ bổ sung th&ecirc;m t&iacute;nh năng xử l&yacute; h&igrave;nh ảnh mới.</p>\n<p><img src=\"http://localhost:8000/images/products/1645781076720iphone-12-pro-max-293120-103117.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Với lượng trang bị chất lượng v&agrave; mạnh mẽ n&agrave;y dễ d&agrave;ng gi&uacute;p&nbsp;<a title=\"Tham khảo c&aacute;c mẫu điện thoại chơi game tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-choi-game\" target=\"_blank\" rel=\"noopener\">điện thoại chơi game</a>&nbsp;tốt tr&ecirc;n mọi thể loại game từ nhẹ đến nặng ở mức cấu h&igrave;nh cao m&agrave; kh&ocirc;ng gặp bất cứ trở ngại n&agrave;o.</p>\n<p>C&oacute; thể thấy, iPhone 12 Pro Max 128 GB l&agrave; mẫu smartphone cao cấp đầy mạnh mẽ sở hữu cho m&igrave;nh những ưu điểm nổi trội về camera hay cả hiệu năng mạnh mẽ. Hứa hẹn đ&acirc;y sẽ l&agrave; mẫu sản phẩm mang tới trải nghiệm tốt đến người d&ugrave;ng.</p>', 8, 1, 228, 16, '2022-02-25 16:31:25', 0, 3, 1),
(4, 'iPhone 13 Pro', '<table style=\"border-collapse: collapse; width: 99.975%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 20.6093%;\">Dung lượng pin</td>\n<td style=\"width: 79.3651%;\">4352 mAh</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Thời gian pin</td>\n<td style=\"width: 79.3651%;\">Ph&aacute;t video li&ecirc;n tục trong khoảng hơn 25 giờ hoặc nghe nhạc trong khoảng 95 giờ.</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Bluetooth</td>\n<td style=\"width: 79.3651%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Thương hiệu</td>\n<td style=\"width: 79.3651%;\">Apple</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Xuất xứ thương hiệu</td>\n<td style=\"width: 79.3651%;\">Mỹ</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Camera sau</td>\n<td style=\"width: 79.3651%;\">3 Camera: G&oacute;c rộng ống k&iacute;nh f/1.8 - Tele - Si&ecirc;u rộng</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Thời gian sạc</td>\n<td style=\"width: 79.3651%;\">C&ocirc;ng nghệ sạc nhanh 20 W, t&iacute;ch hợp th&ecirc;m bộ sạc MagSafe để sạc kh&ocirc;ng d&acirc;y tiện lợi hơn</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Chip đồ họa (GPU)</td>\n<td style=\"width: 79.3651%;\">Apple A15 Bionic 6 nh&acirc;n</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Chip set</td>\n<td style=\"width: 79.3651%;\">Chip A15 Bionic (5nm)</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Chức năng kh&aacute;c</td>\n<td style=\"width: 79.3651%;\">Face ID, Chồng kh&aacute;ng nước - bụi: IP68</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Kết nối kh&aacute;c</td>\n<td style=\"width: 79.3651%;\">NFC</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Tốc độ CPU</td>\n<td style=\"width: 79.3651%;\">3.22 GHz</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Đ&egrave;n Flash</td>\n<td style=\"width: 79.3651%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">K&iacute;ch thước</td>\n<td style=\"width: 79.3651%;\">160.8 x 78.1 x 7.4 mm</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 79.3651%;\">Super Retina XDR, 120Hz ProMotion</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Ghi &acirc;m</td>\n<td style=\"width: 79.3651%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">GPS</td>\n<td style=\"width: 79.3651%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">H&ocirc;̃ trợ 4G</td>\n<td style=\"width: 79.3651%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Hỗ trợ 5G</td>\n<td style=\"width: 79.3651%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Model</td>\n<td style=\"width: 79.3651%;\">iPhone 13 Pro Max 128GB</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Jack tai nghe</td>\n<td style=\"width: 79.3651%;\">Lightning</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Bộ nhớ khả dụng</td>\n<td style=\"width: 79.3651%;\">113 GB</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Số sim</td>\n<td style=\"width: 79.3651%;\">2 sim</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Loại pin</td>\n<td style=\"width: 79.3651%;\">Li-Ion</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Loại Sim</td>\n<td style=\"width: 79.3651%;\">1 Nano SIM &amp; 1 eSIM</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Nh&agrave; sản xuất</td>\n<td style=\"width: 79.3651%;\">Apple</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Chất liệu</td>\n<td style=\"width: 79.3651%;\">Khung th&eacute;p kh&ocirc;ng gỉ &amp; Mặt lưng k&iacute;nh cường lực</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Nghe nhạc</td>\n<td style=\"width: 79.3651%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Xuất xứ</td>\n<td style=\"width: 79.3651%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Pin c&oacute; thể th&aacute;o rời</td>\n<td style=\"width: 79.3651%;\">Kh&ocirc;ng</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Cổng sạc</td>\n<td style=\"width: 79.3651%;\">Lightning</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Trọng lượng</td>\n<td style=\"width: 79.3651%;\">228g</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Quay phim</td>\n<td style=\"width: 79.3651%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">RAM</td>\n<td style=\"width: 79.3651%;\">6GB</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Độ ph&acirc;n giải</td>\n<td style=\"width: 79.3651%;\">1284 x 2778 pixels</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">ROM</td>\n<td style=\"width: 79.3651%;\">128GB</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 79.3651%;\">6.7 inch</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">T&iacute;nh năng camera</td>\n<td style=\"width: 79.3651%;\">HDR, Nhận diện khu&ocirc;n mặt, Quay video 4K, Quay video Full HD, Quay video HD, Tự động lấy n&eacute;t (AF), X&oacute;a ph&ocirc;ng</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Video call</td>\n<td style=\"width: 79.3651%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Wifi</td>\n<td style=\"width: 79.3651%;\">Wifi 6</td>\n</tr>\n<tr>\n<td style=\"width: 20.6093%;\">Xem phim</td>\n<td style=\"width: 79.3651%;\">C&oacute;</td>\n</tr>\n</tbody>\n</table>', '<h3>Mỗi lần ra mắt phi&ecirc;n bản mới l&agrave; mỗi lần&nbsp;<a title=\"Tham khảo điện thoại iPhone tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-apple-iphone\" target=\"_blank\" rel=\"noopener\">iPhone</a>&nbsp;chiếm s&oacute;ng tr&ecirc;n khắp c&aacute;c mặt trận v&agrave; lần n&agrave;y c&aacute;i t&ecirc;n khiến v&ocirc; số người \"sục s&ocirc;i\" l&agrave;&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại iPhone 13 Pro ch&iacute;nh h&atilde;ng\" href=\"https://www.thegioididong.com/dtdd/iphone-13-pro\" target=\"_blank\" rel=\"noopener\">iPhone 13 Pro</a>, chiếc&nbsp;<a title=\"Điện thoại th&ocirc;ng minh đang b&aacute;n tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">điện thoại th&ocirc;ng minh</a>&nbsp;vẫn giữ nguy&ecirc;n thiết kế cao cấp, cụm 3 camera được n&acirc;ng cấp, cấu h&igrave;nh mạnh mẽ c&ugrave;ng thời lượng pin lớn ấn tượng.&nbsp;</h3>\n<h3>Thiết kế đặc trưng với m&agrave;u sắc thời thượng</h3>\n<p>iPhone 13 Pro kh&ocirc;ng c&oacute; nhiều sự thay đổi về thiết kế, khi m&aacute;y vẫn sở hữu kiểu d&aacute;ng tương tự như&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại iPhone 12 Pro ch&iacute;nh h&atilde;ng\" href=\"https://www.thegioididong.com/dtdd/iphone-12-pro\" target=\"_blank\" rel=\"noopener\">iPhone 12 Pro</a>&nbsp;với c&aacute;c cạnh viền vu&ocirc;ng vắn v&agrave; hai mặt k&iacute;nh cường lực cao cấp. Sở hữu 4 phi&ecirc;n bản m&agrave;u gồm xanh dương, bạc, v&agrave;ng đồng v&agrave; x&aacute;m cho bạn t&ugrave;y chọn theo sở th&iacute;ch của m&igrave;nh.&nbsp;</p>\n<p><img src=\"http://localhost:8000/images/products/1645781902133iphone-13-pro-1.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>M&aacute;y đạt ti&ecirc;u chuẩn&nbsp;<a title=\"Tham khảo điện thoại chống nước bụi tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-chong-nuoc-bui\" target=\"_blank\" rel=\"noopener\">kh&aacute;ng nước và bụi</a>&nbsp;IP68 c&oacute; khả năng chống lại một số hạt bụi, v&agrave; được bảo vệ khi rơi xuống nước ở độ s&acirc;u đến 6 m&eacute;t trong 30 ph&uacute;t&nbsp;theo chuẩn IEC 60529, thoải m&aacute;i nhắn tin khi lỡ ra ngo&agrave;i gặp mưa, chụp ảnh tự tin khi đi hồ bơi, b&atilde;i biển,...</p>\n<p><img src=\"http://localhost:8000/images/products/1645781921802iphone-13-pro-2.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<h3>N&acirc;ng cấp m&agrave;n h&igrave;nh với tần số qu&eacute;t 120 Hz</h3>\n<p>Chiếc iPhone 13 Pro vẫn được trang bị m&agrave;n h&igrave;nh k&iacute;ch thước 6.1 inch, với phần tai thỏ được l&agrave;m nhỏ hơn gi&uacute;p hiển thị th&ecirc;m nhiều th&ocirc;ng tin cũng như tăng cường cảm gi&aacute;c trải nghiệm. Bề mặt c&oacute; lớp phủ oleophobic chống b&aacute;m v&acirc;n tay, giữ cho m&agrave;n h&igrave;nh lu&ocirc;n được sạch mới.&nbsp;</p>\n<p><img src=\"http://localhost:8000/images/products/1645781977938iphone-13-pro-man-hinh.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>iPhone 13 Pro đ&atilde; được n&acirc;ng cấp l&ecirc;n tần số qu&eacute;t 120 Hz, với ProMotion c&oacute; thể l&agrave;m mới từ 10 đến 120 khung h&igrave;nh/gi&acirc;y. Với tần số qu&eacute;t cao, mọi thao t&aacute;c chuyển cảnh khi lướt ng&oacute;n tay tr&ecirc;n m&agrave;n h&igrave;nh trở n&ecirc;n mượt m&agrave; hơn đồng thời hiệu ứng thị gi&aacute;c khi ch&uacute;ng ta d&ugrave;ng&nbsp;<a title=\"Tham khảo c&aacute;c mẫu điện thoại chơi game tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-choi-game\" target=\"_blank\" rel=\"noopener\">điện thoại chơi game</a>&nbsp;hoặc xem video cũng cực kỳ m&atilde;n nh&atilde;n.</p>\n<p><img src=\"http://localhost:8000/images/products/1645781997135iphone-13-pro-5.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Tốc độ l&agrave;m tươi tự động tăng l&ecirc;n để hiển thị hiệu suất đồ họa, tự động giảm xuống khi kh&ocirc;ng sử dụng để tiết kiệm năng lượng v&agrave; tốc độ l&agrave;m mới cũng được tự tinh chỉnh linh động để ph&ugrave; hợp hơn tốc độ lướt của ng&oacute;n tay bạn.&nbsp;</p>\n<h3>Quay chụp đỉnh cao với camera Pro</h3>\n<p>iPhone 13 Pro có b&ocirc;̣ camera 3 &ocirc;́ng kính 12 MP x&ecirc;́p xen kẽ thành m&ocirc;̣t cụm vu&ocirc;ng, đặt ở góc tr&ecirc;n b&ecirc;n trái của lưng máy gồm camera tele, camera góc si&ecirc;u r&ocirc;̣ng (Ultra&nbsp;Wide) khẩu độ f/1.8, g&oacute;c nh&igrave;n đến 120 độ v&agrave; camera ch&iacute;nh g&oacute;c rộng (Wide) với khẩu độ f/1.5.</p>\n<p>Camera Ultra Wide được l&agrave;m mới c&oacute; thể lấy n&eacute;t tự động trong khoảng c&aacute;ch 2 cm, gi&uacute;p ph&oacute;ng to h&igrave;nh ảnh của giọt sương, l&ocirc;ng chim, c&aacute;t v&agrave;ng,... tạo n&ecirc;n những tuyệt t&aacute;c nghệ thuật chỉ bằng một thao t&aacute;c chụp đơn giản. Camera n&agrave;y cũng cho khả năng quay cảnh chuyển động tua nhanh thời gian hoặc chuyển động chậm linh hoạt để bạn l&agrave;m video giải tr&iacute; cực đẹp.&nbsp;</p>\n<p>Apple gọi iPhone 13 Pro l&agrave; thiết bị được tạo ra cho &aacute;nh s&aacute;ng yếu, bởi hệ thống camera được hỗ trợ chế độ ban đ&ecirc;m Night Mode, trang bị&nbsp;m&aacute;y qu&eacute;t LiDAR (khả dụng cho chế độ chụp ch&acirc;n dung ban đ&ecirc;m), camera Wide n&acirc;ng cao độ s&aacute;ng đến 2.2 lần, camera Ultra Wide tăng 92% độ s&aacute;ng cho ph&eacute;p quay chụp lại c&aacute;c h&igrave;nh ảnh, thước phim ban đ&ecirc;m cực kỳ chi tiết, sắc n&eacute;t.&nbsp;</p>\n<p><img src=\"http://localhost:8000/images/products/1645782074684iphone-13-pro-16.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>T&iacute;ch hợp chip đồ họa GPU 5 l&otilde;i hiệu suất tăng l&ecirc;n 50%,&nbsp;CPU đ&aacute;p ứng đa dạng t&aacute;c vụ, n&acirc;ng cao tuổi thọ pin. Đặc biệt, c&ocirc;ng nghệ tr&iacute; tuệ nh&acirc;n tạo Neural Engine tăng tốc c&aacute;c t&aacute;c vụ m&aacute;y học, thực hiện được đến 15.8 ngh&igrave;n tỷ hoạt động mỗi gi&acirc;y, cho qu&aacute; tr&igrave;nh sử dụng thiết bị mượt m&agrave;, ổn định.</p>\n<p>Dung lượng pin tr&ecirc;n iPhone lu&ocirc;n thấp hơn khi so với c&aacute;c d&ograve;ng m&aacute;y Android nhưng việc trang bị chipset mới c&ugrave;ng sự tối ưu ho&aacute; của hệ điều h&agrave;nh sẽ đảm bảo thời lượng sử dụng kh&ocirc;ng hề thua k&eacute;m tr&ecirc;n sản phẩm Android, thậm ch&iacute; c&ograve;n c&oacute; thể vượt trội hơn.&nbsp;</p>\n<p>iPhone 13 Pro với thiết kế cứng c&aacute;p, sang trọng c&ugrave;ng khả năng nhiếp ảnh ấn tượng, sẽ l&agrave; một sản phẩm phục vụ tốt c&aacute;c nhu cầu của bạn cũng như l&agrave; một m&oacute;n đồ thời trang hiện đại.</p>', 8, 1, 228, 17, '2022-02-25 16:47:01', 0, 3, 1),
(5, 'Samsung Galaxy A22', '<table style=\"border-collapse: collapse; width: 99.975%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 26.3697%;\">C&oacute; thuế VAT</td>\n<td style=\"width: 73.4767%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Thương hiệu</td>\n<td style=\"width: 73.4767%;\">Samsung</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Hỗ trợ thẻ nhớ ngo&agrave;i</td>\n<td style=\"width: 73.4767%;\">1 TB</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Chip set</td>\n<td style=\"width: 73.4767%;\">MediaTek MT6769V 8 nh&acirc;n</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Tốc độ CPU</td>\n<td style=\"width: 73.4767%;\">4 nh&acirc;n 2.0 GHz &amp; 4 nh&acirc;n 1.8 GHz</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">K&iacute;ch thước</td>\n<td style=\"width: 73.4767%;\">\n<p>D&agrave;i 159.3 mm - Ngang 73.6 mm - D&agrave;y 8.4 mm</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 73.4767%;\">Super AMOLED</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">FM radio</td>\n<td style=\"width: 73.4767%;\">Kh&ocirc;ng</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Phụ kiện đi k&egrave;m</td>\n<td style=\"width: 73.4767%;\">\n<p>Hộp, S&aacute;ch hướng dẫn, C&acirc;y lấy sim, C&aacute;p Type C, Củ sạc rời đầu Type A</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Model</td>\n<td style=\"width: 73.4767%;\">Galaxy A22</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Jack tai nghe</td>\n<td style=\"width: 73.4767%;\">3.5mm</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Bộ nhớ khả dụng</td>\n<td style=\"width: 73.4767%;\">103 GB</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Số sim</td>\n<td style=\"width: 73.4767%;\">2</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Loại pin</td>\n<td style=\"width: 73.4767%;\">Li-Po</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Loại Sim</td>\n<td style=\"width: 73.4767%;\">Nano</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Chất liệu</td>\n<td style=\"width: 73.4767%;\">Khung &amp; Mặt lưng nhựa</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Cổng sạc</td>\n<td style=\"width: 73.4767%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Trọng lượng</td>\n<td style=\"width: 73.4767%;\">186 g</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Độ ph&acirc;n giải</td>\n<td style=\"width: 73.4767%;\">HD+ (720 x 1600 pixels)</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 73.4767%;\">6.4 inch</td>\n</tr>\n<tr>\n<td style=\"width: 26.3697%;\">Wifi</td>\n<td style=\"width: 73.4767%;\">Wi-Fi hotspot Dual-band (2.4 GHz/5 GHz) Wi-Fi Direct Wi-Fi 802.11 a/b/g/n/ac</td>\n</tr>\n</tbody>\n</table>', '<h3><a title=\"Tham khảo c&aacute;c sản phẩm điện thoại Samsung tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/samsung\" target=\"_blank\" rel=\"noopener\">Samsung</a>&nbsp;ch&agrave;o đ&oacute;n m&ugrave;a h&egrave; 2021 bằng sự ra mắt của bộ đ&ocirc;i&nbsp;<a title=\"Tham khảo sản phẩm Samsung Galaxy A22 4G tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-a22-4g\" target=\"_blank\" rel=\"noopener\">Galaxy A22</a>&nbsp;v&agrave;&nbsp;<a title=\"Tham khảo sản phẩm Samsung Galaxy A22 5G tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-a22-5g\" target=\"_blank\" rel=\"noopener\">Galaxy A22 5G</a>&nbsp;với nhiều th&ocirc;ng số ấn tượng. Trong đ&oacute;, Galaxy A22 sở hữu vi&ecirc;n pin đầy năng suất, hiệu năng gaming mạnh mẽ v&agrave; m&agrave;n h&igrave;nh lớn c&oacute; khả năng hiển thị tốt.</h3>\n<h3>N&acirc;ng cao trải nghiệm người d&ugrave;ng</h3>\n<p>Sở hữu m&agrave;n h&igrave;nh&nbsp;<a title=\"M&agrave;n h&igrave;nh Super AMOLED l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/hoi-dap/man-hinh-super-amoled-la-gi-905770\" target=\"_blank\" rel=\"noopener\">Super AMOLED</a>&nbsp;rộng 6.4 inch, Samsung Galaxy A22 lu&ocirc;n thu h&uacute;t sự quan t&acirc;m của bất kỳ người ti&ecirc;u d&ugrave;ng n&agrave;o đang t&igrave;m kiếm ti&ecirc;u ch&iacute; n&agrave;y. K&iacute;ch thước m&agrave;n h&igrave;nh lớn l&agrave; một ưu điểm để bạn trải nghiệm nh&igrave;n ngắm mọi thứ thoải m&aacute;i hơn trong giải tr&iacute; cũng như c&aacute;c thao t&aacute;c hằng ng&agrave;y.&nbsp;</p>\n<p><img src=\"http://localhost:8000/images/products/1645887573031samsung-galaxy-a22-4g-001.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Chiếc&nbsp;<a title=\"Tham khảo c&aacute;c sản phẩm điện thoại tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">điện thoại</a>&nbsp;cung cấp gam m&agrave;u rực rỡ cho khả năng hiển thị sống động v&agrave; tiết kiệm điện năng tối ưu. Hỗ trợ tần số qu&eacute;t m&agrave;n h&igrave;nh 90 Hz gi&uacute;p mọi thao t&aacute;c chạm tay của bạn đều được nhận diện v&agrave; xử l&yacute; một c&aacute;ch nhanh ch&oacute;ng.</p>\n<p><img src=\"http://localhost:8000/images/products/1645887627052samsung-galaxy-a22-4g-007.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Galaxy A22 được trang bị t&iacute;nh năng&nbsp;<a title=\"Tham khảo c&aacute;c sản phẩm điện thoại c&oacute; bảo mật v&acirc;n tay tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-bao-mat-van-tay\" target=\"_blank\" rel=\"noopener\">bảo mật v&acirc;n tay</a>&nbsp;đặt b&ecirc;n h&ocirc;ng m&aacute;y gi&uacute;p bảo vệ th&ocirc;ng tin tr&ecirc;n điện thoại tốt hơn. Hơn thế nữa, smartphone vẫn gọn nhẹ mặc d&ugrave; diện t&iacute;ch m&agrave;n h&igrave;nh lớn, c&aacute;c cạnh viền bo cong quanh th&acirc;n m&aacute;y cho cảm gi&aacute;c cầm nắm th&ecirc;m dễ chịu, v&agrave; m&agrave;n h&igrave;nh được bảo vệ bởi k&iacute;nh cường lực Corning Gorilla Glass 5 c&agrave;ng tăng th&ecirc;m độ bền cho m&aacute;y.</p>\n<p><img src=\"http://localhost:8000/images/products/1645887646478samsung-galaxy-a22-4g-009.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<h3>Hiệu năng ổn định, mượt m&agrave;</h3>\n<p>Con chip MediaTek MT6769V 8 nh&acirc;n được trang bị tr&ecirc;n Samsung galaxy A22 l&agrave; d&ograve;ng CPU tầm trung đặc biệt của c&aacute;c &ldquo;tay game&rdquo; nh&agrave; MediaTek. Chipset hỗ trợ xung nhịp tối đa 2.0 GHz gi&uacute;p tăng tốc phần cứng tối đa mang đến hiệu năng v&ocirc; c&ugrave;ng ấn tượng.</p>\n<p><img src=\"http://localhost:8000/images/products/1645887676142samsung-galaxy-a22-4g-5.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Galaxy A22 đi k&egrave;m với 6&nbsp;GB RAM cho khả năng xử l&yacute; đa nhiệm ổn định. Kết hợp với bộ nhớ trong 128 GB v&agrave; khả năng lưu danh bạ kh&ocirc;ng giới hạn để người d&ugrave;ng c&oacute; thể lưu th&ocirc;ng tin v&agrave; số di động thoải m&aacute;i. Ngo&agrave;i ra bạn c&oacute; thể mở rộng bộ nhớ th&ocirc;ng qua thẻ nhớ MicroSD, hỗ trợ tối đa 1 TB.</p>\n<h3>D&agrave;n m&aacute;y ảnh chất lượng cao</h3>\n<p>Một trong những điểm nổi bật ở Galaxy A22 l&agrave; d&agrave;n 4 camera sau với th&ocirc;ng số camera ch&iacute;nh 48 MP,&nbsp;<a title=\"Tham khảo c&aacute;c sản phẩm điện thoại c&oacute; camera g&oacute;c rộng tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-camera-goc-rong\" target=\"_blank\" rel=\"noopener\">camera g&oacute;c si&ecirc;u rộng</a>&nbsp;8 MP,&nbsp;<a title=\"Tham khảo c&aacute;c sản phẩm điện thoại c&oacute; camera macro tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-camera-macro\" target=\"_blank\" rel=\"noopener\">camera macro</a>&nbsp;v&agrave; camera đo độ s&acirc;u c&oacute; chung độ ph&acirc;n giải 2 MP v&agrave; một camera selfie 13 MP ở mặt trước.</p>\n<p>Hỗ trợ một số t&iacute;nh năng như:&nbsp;<a title=\"T&igrave;m hiểu c&ocirc;ng nghệ lấy n&eacute;t theo pha tr&ecirc;n smartphone l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-cong-nghe-lay-net-theo-pha-tren-smartphon-1007275\" target=\"_blank\" rel=\"noopener\">Lấy n&eacute;t theo pha</a>,&nbsp;<a title=\"Chụp ảnh x&oacute;a ph&ocirc;ng l&agrave; g&igrave;? N&oacute; c&oacute; t&aacute;c dụng như thế n&agrave;o?\" href=\"https://www.thegioididong.com/hoi-dap/xoa-phong-khi-selfie-la-gi-no-co-tac-dung-nhu-the-1138006\" target=\"_blank\" rel=\"noopener\">x&oacute;a ph&ocirc;ng</a>,&nbsp;<a title=\"Chế độ chụp ảnh HDR tr&ecirc;n smartphone l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/hoi-dap/che-do-chup-anh-hdr-tren-smartphone-la-gi-906400\" target=\"_blank\" rel=\"noopener\">HDR</a>, chống rung quang học OIS,... gi&uacute;p người d&ugrave;ng chụp c&aacute;c chi tiết xung quanh cuộc sống một c&aacute;ch đẹp v&agrave; tự nhi&ecirc;n nhất.</p>\n<p>Trang bị khả năng&nbsp;<a title=\"C&aacute;c chuẩn quay phim tr&ecirc;n điện thoại, tablet phổ biến hiện nay\" href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134#fullhd\" target=\"_blank\" rel=\"noopener\">quay video Full HD</a>&nbsp;sẵn s&agrave;ng đồng h&agrave;nh c&ugrave;ng người d&ugrave;ng s&aacute;ng tạo n&ecirc;n những thước phim độc đ&aacute;o, đ&aacute;ng nhớ của chỉ ri&ecirc;ng bạn.</p>\n<p><img src=\"http://localhost:8000/images/products/1645887727378samsung-galaxy-a22-4g-9.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<h3>Cảm hứng giải tr&iacute; lu&ocirc;n dồi d&agrave;o</h3>\n<p>Samsung Galaxy A22 duy tr&igrave; nguồn cảm hứng học tập, l&agrave;m việc v&agrave; giải tr&iacute; của người d&ugrave;ng bằng vi&ecirc;n pin lớn dung lượng 5000 mAh. Chiếc điện thoại ho&agrave;n to&agrave;n xứng đ&aacute;ng với danh hiệu pin tr&acirc;u so với c&aacute;c d&ograve;ng smartphone hiện tại.</p>\n<p>Giờ đ&acirc;y bạn sẽ kh&ocirc;ng phải tốn qu&aacute; nhiều thời gian cho việc nạp đầy năng lượng mỗi khi hết pin nữa. Galaxy A22 đ&atilde; c&oacute; hỗ trợ c&ocirc;ng nghệ&nbsp;<a title=\"Tham khảo c&aacute;c sản phẩm điện thoại c&oacute; sạc pin nhanh tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-sac-pin-nhanh\" target=\"_blank\" rel=\"noopener\">sạc pin nhanh</a>&nbsp;c&ocirc;ng suất tối đa 15 W gi&uacute;p cho qu&aacute; tr&igrave;nh sạc được r&uacute;t ngắn đ&aacute;ng kể để người d&ugrave;ng nhanh ch&oacute;ng quay trở lại với hoạt động c&ograve;n dang dở.</p>\n<p>So với người tiền nhiệm&nbsp;<a title=\"Tham khảo th&ocirc;ng tin sản phẩm tại thegioididong.com\" href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-a21\">Galaxy A21</a>, nay Samsung Galaxy A22 được cải tiến với thiết kế mới hơn, bộ vi xử l&yacute; mạnh mẽ hơn v&agrave; vi&ecirc;n pin tr&acirc;u hơn, sản phẩm sẽ l&agrave;m h&agrave;i l&ograve;ng mọi người d&ugrave;ng với những chức năng m&agrave; n&oacute; sở hữu.</p>', 8, 1, 186, 16, '2022-02-26 22:07:23', 0, 1, 1),
(6, 'Samsung Galaxy A12', '<table style=\"border-collapse: collapse; width: 99.975%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 16.6411%;\">Dung lượng pin</td>\n<td style=\"width: 83.3333%;\">5000 mAh</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Bluetooth</td>\n<td style=\"width: 83.3333%;\">v5.0</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Thương hiệu</td>\n<td style=\"width: 83.3333%;\">Samsung</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Xuất xứ thương hiệu</td>\n<td style=\"width: 83.3333%;\">H&agrave;n Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Camera sau</td>\n<td style=\"width: 83.3333%;\">Ch&iacute;nh 48 MP &amp; Phụ 5 MP, 2 MP, 2 MP</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Camera trước</td>\n<td style=\"width: 83.3333%;\">8 MP</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Hỗ trợ thẻ nhớ ngo&agrave;i</td>\n<td style=\"width: 83.3333%;\">MicroSD, hỗ trợ tối đa 1 TB</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Chip set</td>\n<td style=\"width: 83.3333%;\">MediaTek Helio G35 8 nh&acirc;n</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Tốc độ CPU</td>\n<td style=\"width: 83.3333%;\">8 nh&acirc;n 2.3 GHz</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Đ&egrave;n Flash</td>\n<td style=\"width: 83.3333%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 83.3333%;\">PLS TFT LCD</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Ghi &acirc;m</td>\n<td style=\"width: 83.3333%;\">Có</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">GPS</td>\n<td style=\"width: 83.3333%;\">GLONASSGALILEOBDSA-GPS</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">H&ocirc;̃ trợ 4G</td>\n<td style=\"width: 83.3333%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Phụ kiện đi k&egrave;m</td>\n<td style=\"width: 83.3333%;\">&nbsp;Hộp, Sạc, S&aacute;ch hướng dẫn, C&aacute;p, C&acirc;y lấy sim</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Jack tai nghe</td>\n<td style=\"width: 83.3333%;\">3.5 mm</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Bộ nhớ khả dụng</td>\n<td style=\"width: 83.3333%;\">Khoảng 107 GB</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Số sim</td>\n<td style=\"width: 83.3333%;\">2</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Nghe nhạc</td>\n<td style=\"width: 83.3333%;\">Có</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Xuất xứ</td>\n<td style=\"width: 83.3333%;\">H&agrave;n Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Cổng sạc</td>\n<td style=\"width: 83.3333%;\">USB Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Trọng lượng</td>\n<td style=\"width: 83.3333%;\">205g</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Quay phim</td>\n<td style=\"width: 83.3333%;\">FullHD 1080p@30fps</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">RAM</td>\n<td style=\"width: 83.3333%;\">4 GB</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Độ ph&acirc;n giải</td>\n<td style=\"width: 83.3333%;\">HD+ (720 x 1600 pixels)</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">ROM</td>\n<td style=\"width: 83.3333%;\">128 GB</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Hỗ trợ thẻ tối đa</td>\n<td style=\"width: 83.3333%;\">1 TB</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">T&iacute;nh năng camera</td>\n<td style=\"width: 83.3333%;\">Zoom kỹ thuật số; G&oacute;c rộng (Wide); L&agrave;m đẹp; HDR; Nhận diện khu&ocirc;n mặt; Tự động lấy n&eacute;t (AF); Chạm lấy n&eacute;t; X&oacute;a ph&ocirc;ng; Si&ecirc;u cận (Macro); G&oacute;c si&ecirc;u rộng (Ultrawide)</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Video call</td>\n<td style=\"width: 83.3333%;\">Th&ocirc;ng qua ứng dụng thứ 3</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Wifi</td>\n<td style=\"width: 83.3333%;\">Wi-Fi 802.11 a/b/g/n,&nbsp;Wi-Fi hotspot</td>\n</tr>\n<tr>\n<td style=\"width: 16.6411%;\">Xem phim</td>\n<td style=\"width: 83.3333%;\">WMV AVI 3GP MP4</td>\n</tr>\n</tbody>\n</table>', '<h3><a title=\"Tham khảo điện thoại Galaxy A12 2021 tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-a12-2021\" target=\"_blank\" rel=\"noopener\">Galaxy A12 2021</a>&nbsp;chiếc&nbsp;<a title=\"Tham khảo điện thoại ch&iacute;nh h&atilde;ng tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">điện thoại th&ocirc;ng minh</a>&nbsp;gi&aacute; rẻ đến từ thương hiệu&nbsp;<a title=\"Tham khảo sản phẩm Samsung ch&iacute;nh h&atilde;ng tại Thegioididong.com\" href=\"https://www.thegioididong.com/samsung\" target=\"_blank\" rel=\"noopener\">Samsung</a>, n&oacute; sở hữu một cấu h&igrave;nh ổn định c&ugrave;ng với vi&ecirc;n pin dung lượng lớn 5000 mAh đ&aacute;p ứng đa dạng nhu cầu sử dụng của người ti&ecirc;u d&ugrave;ng.</h3>\n<h3>M&agrave;n h&igrave;nh lớn, mở rộng kh&ocirc;ng gian trải nghiệm</h3>\n<p>Điện thoại sở hữu m&agrave;n h&igrave;nh giọt nước k&iacute;ch thước 6.5 inch tr&agrave;n viền mở ra thế giới rộng lớn, hiển thị được nhiều nội dung hơn cho bạn thoải m&aacute;i tận hưởng kh&ocirc;ng gian giải tr&iacute;.&nbsp;</p>\n<p><img src=\"http://localhost:8000/images/products/1645888270448samsung-galaxy-a12-2021-1.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Galaxy A12 (2021) sử dụng tấm nền PLS TFT LCD mang đến khả năng t&aacute;i tạo m&agrave;u tốt hơn, cho c&aacute;c nội dung bạn xem đều đạt được m&agrave;u sắc ch&acirc;n thực v&agrave; sống động như thật.</p>\n<p><img src=\"http://localhost:8000/images/products/1645888284207samsung-galaxy-a12-2021-2.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Được trang bị m&agrave;n h&igrave;nh&nbsp;c&oacute; độ ph&acirc;n giải HD+ mặc d&ugrave; chưa thực sự qu&aacute; xuất sắc nhưng tr&ecirc;n một thiết bị gi&aacute; rẻ th&igrave; đ&atilde; đ&aacute;p ứng tốt nhu cầu xem th&ocirc;ng thường, tỉ lệ khung h&igrave;nh 20:9 tối ưu trải nghiệm của bạn trong mọi ứng dụng xem phổ biến hiện nay.</p>\n<p><img src=\"http://localhost:8000/images/products/1645888346395samsung-galaxy-a12-2021-3.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<h3>Hiệu năng ổn định, chạy mượt c&aacute;c t&aacute;c vụ</h3>\n<p>Galaxy A12 (2021) được trang bị con chip Exynos 850 8 nh&acirc;n cho tốc độ xử l&yacute; l&agrave; 2 GHz. Con chip n&agrave;y được x&acirc;y dựng tr&ecirc;n tiến tr&igrave;nh 8 nm v&agrave; l&otilde;i CPU Cortex-A55 mang lại khả năng xử l&yacute; c&aacute;c t&aacute;c vụ dễ d&agrave;ng, bạn c&oacute; thể giải tr&iacute; bằng c&aacute;ch lướt web, xem phim hoặc chơi game v&ocirc; c&ugrave;ng mượt m&agrave; v&agrave; ổn định. B&ecirc;n cạnh đ&oacute;, n&oacute; c&ograve;n tiết kiệm năng lượng khi vận h&agrave;nh một c&aacute;ch hiệu quả gi&uacute;p k&eacute;o d&agrave;i thời gian sử dụng.</p>\n<p><img src=\"http://localhost:8000/images/products/1645888382094samsung-galaxy-a12-2021-4.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>GPU Mali-G52 mang đến sự cải thiện về hiệu suất đồ hoạ cho giao diện hiển thị ở độ ph&acirc;n giải cao, giảm mức ti&ecirc;u thụ điện năng v&agrave; mức nhiệt cho thiết bị.</p>\n<p><img src=\"http://localhost:8000/images/products/1645888393255samsung-galaxy-a12-2021-5.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Galaxy A12 (2021) được trang bị RAM 4 GB hỗ trợ chạy đa nhiệm mượt m&agrave;, bạn c&oacute; thể chuyển đổi giữa c&aacute;c ứng dụng một c&aacute;ch ổn định.</p>\n<p>Bạn c&oacute; thể thỏa sức lưu trữ h&igrave;nh ảnh, c&aacute;c ứng dụng, nội dung y&ecirc;u th&iacute;ch với&nbsp;<a title=\"Tham khảo điện thoại c&oacute; rom 128 gb tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-rom-128gb\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo th&ecirc;m c&aacute;c d&ograve;ng smartphone c&oacute; bộ nhớ trong từ 128GB đến 256GB tại thegioididong.com\">bộ nhớ trong 128 GB</a>&nbsp;v&agrave; hỗ trợ cả thẻ nhớ MicroSD tối đa 1 TB, giờ đ&acirc;y bạn kh&ocirc;ng c&ograve;n phải đau đầu nghĩ xem n&ecirc;n x&oacute;a ứng dụng n&agrave;o kh&ocirc;ng cần thiết nữa.</p>\n<p>M&aacute;y sẽ được chạy tr&ecirc;n hệ điều h&agrave;nh Android 11, sẵn s&agrave;ng trải nghiệm những đột ph&aacute; tr&ecirc;n giao diện One UI Core mang đến hiệu suất ấn tượng, dễ sử dụng. Dễ d&agrave;ng chuyển đổi tone tối cho thiết bị mang lại cảm gi&aacute;c tự nhi&ecirc;n v&agrave; dễ chịu hơn cho mắt.</p>\n<h3>Sử dụng cả ng&agrave;y với vi&ecirc;n pin khủng 5000 mAh</h3>\n<p>Galaxy A12 (2021) sẽ đ&aacute;p ứng nhu cầu sử dụng l&acirc;u d&agrave;i của bạn nhờ được trang bị vi&ecirc;n pin dung lượng 5000 mAh, thoải m&aacute;i sử dụng smartphone cả ng&agrave;y m&agrave; kh&ocirc;ng lo hết pin, khi ra ngo&agrave;i cũng kh&ocirc;ng cần đem theo củ sạc hoặc pin dự ph&ograve;ng nữa.</p>\n<p>Nạp đầy năng lượng nhanh ch&oacute;ng cho chiếc điện thoại Galaxy A12 (2021) nhờ được t&iacute;ch hợp c&ocirc;ng nghệ&nbsp;<a title=\"Tham khảo c&aacute;c mẫu điện thoại c&oacute; c&ocirc;ng nghệ sạc pin nhanh tại thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-sac-pin-nhanh\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo c&aacute;c mẫu điện thoại c&oacute; c&ocirc;ng nghệ sạc pin nhanh tại thegioididong.com\">sạc pin nhanh</a>&nbsp;15 W, bạn kh&ocirc;ng c&ograve;n phải chờ đợi qu&aacute; l&acirc;u để c&oacute; thể sử dụng tiếp.</p>\n<h3>4 camera sau bắt trọn mọi khoảnh khắc</h3>\n<p>Galaxy A12 (2021) sở hữu bộ 4 camera sau được đặt trong khung vu&ocirc;ng v&ocirc; c&ugrave;ng gọn g&agrave;ng bao gồm: Camera ch&iacute;nh 48 MP, camera g&oacute;c si&ecirc;u rộng 5 MP, camera đo chiều s&acirc;u&nbsp;<a title=\"Tham khảo th&ecirc;m c&aacute;c d&ograve;ng smartphone c&oacute; camera chụp h&igrave;nh xo&aacute; ph&ocirc;ng tại thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-camera-xoa-phong\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo th&ecirc;m c&aacute;c d&ograve;ng smartphone c&oacute; camera chụp h&igrave;nh xo&aacute; ph&ocirc;ng tại thegioididong.com\">xo&aacute; ph&ocirc;ng</a>&nbsp;2 MP v&agrave;&nbsp;<a title=\"Tham khảo th&ecirc;m c&aacute;c mẫu smartphone c&oacute; camera macro chụp cận cảnh tại thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-camera-macro\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo th&ecirc;m c&aacute;c mẫu smartphone c&oacute; camera macro chụp cận cảnh tại thegioididong.com\">camera macro</a>&nbsp;2 MP.&nbsp;</p>\n<p>Camera ch&iacute;nh mang đến những bức ảnh v&ocirc; c&ugrave;ng sắc n&eacute;t, chi tiết hiển thị r&otilde; r&agrave;ng, m&agrave;u sắc của h&igrave;nh ảnh cũng rất tự nhi&ecirc;n.&nbsp;<a title=\"Tham khảo c&aacute;c mẫu điện thoại c&oacute; camera g&oacute;c si&ecirc;u rộng tại thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-camera-goc-rong\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo c&aacute;c mẫu điện thoại c&oacute; camera g&oacute;c si&ecirc;u rộng tại thegioididong.com\">Camera g&oacute;c si&ecirc;u rộng</a>&nbsp;với g&oacute;c chụp l&ecirc;n đến 123 độ mở rộng tầm nh&igrave;n hơn, gi&uacute;p bạn bắt trọn khung cảnh thi&ecirc;n nhi&ecirc;n h&ugrave;ng vĩ chỉ với một lần chụp, chất lượng h&igrave;nh ảnh cũng rất sắc n&eacute;t kh&ocirc;ng bị vỡ hay mất chi tiết qu&aacute; nhiều.</p>\n<p><img src=\"http://localhost:8000/images/products/1645888446134samsung-galaxy-a12-2021-10.jpg\" alt=\"\" width=\"1020\" height=\"650\" /></p>\n<p>Camera macro 2 MP với khoảng c&aacute;ch lấy n&eacute;t chỉ 3 đến 5 cm gi&uacute;p bạn kh&aacute;m ph&aacute; những chi tiết nhỏ tạo n&ecirc;n một bức ảnh v&ocirc; c&ugrave;ng độc đ&aacute;o. Cuối c&ugrave;ng l&agrave; camera x&oacute;a ph&ocirc;ng gi&uacute;p bạn tạo n&ecirc;n những tấm h&igrave;nh ch&acirc;n dung, ảnh nh&oacute;m hay chụp vật với hiệu ứng x&oacute;a ph&ocirc;ng tự nhi&ecirc;n, hướng người xem tập trung hơn v&agrave;o chủ thể của bức ảnh.</p>\n<p>Với camera trước 8 MP khả năng chụp tốt c&ugrave;ng với t&iacute;nh năng l&agrave;m đẹp th&ocirc;ng minh, chế độ x&oacute;a ph&ocirc;ng mang đến cho bạn những bức ảnh selfie đẹp tự nhi&ecirc;n. Bạn cũng c&oacute; thể dễ d&agrave;ng để gọi video, học online tr&ecirc;n thiết bị với chất lượng ổn.</p>\n<p>M&aacute;y c&ograve;n hỗ trợ đầy đủ c&aacute;c t&iacute;nh năng chụp ảnh th&ocirc;ng minh như lấy n&eacute;t tự động, zoom kỹ thuật số, l&agrave;m đẹp,&hellip; Đồng thời hỗ trợ quay phim với chất lượng 1080p sắc n&eacute;t để bạn c&oacute; thể quay vlog chia sẻ những khoảnh khắc đ&aacute;ng nhớ.</p>\n<h3>Thiết kế tối giản nhưng vẫn cực thu h&uacute;t</h3>\n<p>Galaxy A12 (2021) c&oacute; vẻ ngo&agrave;i đơn giản với bốn g&oacute;c cạnh được bo tr&ograve;n tinh tế c&ugrave;ng với hai cạnh b&ecirc;n được v&aacute;t cong nhẹ tạo cho bạn cảm gi&aacute;c cầm thoải m&aacute;i hơn, kh&ocirc;ng g&acirc;y mỏi tay khi cầm l&acirc;u với trong lượng chỉ 205 g. Khung m&aacute;y v&agrave; mặt lưng được l&agrave;m bằng nhựa chắc chắn, với mặt lưng nhựa được phủ một lớp nh&aacute;m hạn chế b&aacute;m v&acirc;n tay v&agrave; trơn trượt khi cầm.</p>\n<p>M&aacute;y được hỗ trợ&nbsp;<a title=\"Tham khảo th&ecirc;m c&aacute;c d&ograve;ng điện thoại cảm biến v&acirc;n tay tại thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-bao-mat-van-tay\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo th&ecirc;m c&aacute;c d&ograve;ng điện thoại cảm biến v&acirc;n tay tại thegioididong.com\">cảm biến v&acirc;n tay</a>&nbsp;nằm ở cạnh b&ecirc;n gi&uacute;p bạn mở kh&oacute;a điện thoại một c&aacute;ch nhanh ch&oacute;ng, tiện lợi v&agrave; c&oacute; độ bảo mật th&ocirc;ng tin cao.</p>\n<p>Samsung Galaxy A12 (2021) chắc chắn l&agrave; chiếc smartphone gi&aacute; rẻ mang đến cho người d&ugrave;ng những trải nghiệm th&uacute; vị với vi&ecirc;n pin 5000 mAh, m&agrave;n h&igrave;nh 6.5 inch v&agrave; chip Exynos 850 8 nh&acirc;n c&oacute; khả năng xử l&yacute; mượt m&agrave; mọi t&aacute;c vụ thường nhật.</p>', 8, 1, 205, 16, '2022-02-26 22:18:02', 0, 1, 1);
INSERT INTO `product` (`id`, `name`, `specifications`, `description`, `width`, `height`, `weight`, `length`, `created_date`, `published`, `brand_id`, `user_id`) VALUES
(8, 'Vivo X70 Pro 5G', '<table style=\"border-collapse: collapse; width: 99.975%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 14.5929%;\">Dung lượng pin</td>\n<td style=\"width: 85.2535%;\">4200 mAh</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Bluetooth</td>\n<td style=\"width: 85.2535%;\">v5.2</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Thương hiệu</td>\n<td style=\"width: 85.2535%;\">Vivo</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Xuất xứ thương hiệu</td>\n<td style=\"width: 85.2535%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Camera sau</td>\n<td style=\"width: 85.2535%;\">Ch&iacute;nh 64 MP &amp; Phụ 8 MP, 2 MP</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Camera trước</td>\n<td style=\"width: 85.2535%;\">Ch&iacute;nh 50 MP &amp; Phụ 8 MP</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Chip đồ họa (GPU)</td>\n<td style=\"width: 85.2535%;\">Mali-G68 MC4</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Chip set</td>\n<td style=\"width: 85.2535%;\">MediaTek Dimensity 920 5G 8 nh&acirc;n</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Tốc độ CPU</td>\n<td style=\"width: 85.2535%;\">2 nh&acirc;n 2.5 GHz &amp; 6 nh&acirc;n 2 GHz</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 85.2535%;\">AMOLED, Tần số qu&eacute;t 90 Hz,</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Phụ kiện đi k&egrave;m</td>\n<td style=\"width: 85.2535%;\">Hộp, S&aacute;ch Hướng Dẫn, C&acirc;y Lấy Sim, C&aacute;p Type C - Type A, Tai nghe d&acirc;y đầu Type C, Ốp lưng dẻo trong, Miếng d&aacute;n sẵn m&agrave;n h&igrave;nh, Jack chuyển tai nghe 3.5mm</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Model</td>\n<td style=\"width: 85.2535%;\">V23 5G (8GB/128GB)</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Jack tai nghe</td>\n<td style=\"width: 85.2535%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Số sim</td>\n<td style=\"width: 85.2535%;\">2</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Loại pin</td>\n<td style=\"width: 85.2535%;\">Li-Po</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Loại Sim</td>\n<td style=\"width: 85.2535%;\">Nano SIM</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Chất liệu</td>\n<td style=\"width: 85.2535%;\">Khung kim loại &amp; Mặt lưng k&iacute;nh</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Xuất xứ</td>\n<td style=\"width: 85.2535%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Cổng sạc</td>\n<td style=\"width: 85.2535%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Trọng lượng</td>\n<td style=\"width: 85.2535%;\">181 g</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Quay phim</td>\n<td style=\"width: 85.2535%;\">4K 2160p@30fps FullHD 1080p@120fps FullHD 1080p@30fps FullHD 1080p@60fps HD 720p@240fps HD 720p@30fps HD 720p@60fps</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">RAM</td>\n<td style=\"width: 85.2535%;\">8 GB</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Độ ph&acirc;n giải</td>\n<td style=\"width: 85.2535%;\">Full HD+ (1080 x 2400 Pixels)</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">ROM</td>\n<td style=\"width: 85.2535%;\">128 GB</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 85.2535%;\">6.44 inch</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">T&iacute;nh năng camera</td>\n<td style=\"width: 85.2535%;\">Ban đ&ecirc;m (Night Mode), Chuy&ecirc;n nghiệp (Pro), Hiệu ứng Bokeh, Live Photo, Nh&atilde;n d&aacute;n (AR Stickers), Quay chậm (Slow Motion), Quay video hiển thị k&eacute;p, Si&ecirc;u cận (Macro), To&agrave;n cảnh (Panorama), Tr&ocirc;i nhanh thời gian (Time Lapse), X&oacute;a ph&ocirc;ng</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Wifi</td>\n<td style=\"width: 85.2535%;\">Dual-band (2.4 GHz/5 GHz)</td>\n</tr>\n</tbody>\n</table>', '<h3><a title=\"Tham khảo gi&aacute; điện thoại smartphone Vivo ch&iacute;nh h&atilde;ng\" href=\"https://www.thegioididong.com/dtdd-vivo\" target=\"_blank\" rel=\"noopener\">Vivo</a>&nbsp;cho ra mắt&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại Vivo X70 Pro ch&iacute;nh h&atilde;ng\" href=\"https://www.thegioididong.com/dtdd/vivo-x70-pro\" target=\"_blank\" rel=\"noopener\">Vivo X70 Pro</a>, một sản phẩm cao cấp ấn tượng với kiểu d&aacute;ng lẫn hiệu năng tuyệt vời. Đặc biệt, camera c&ograve;n được n&acirc;ng cấp h&agrave;ng loạt c&aacute;c t&iacute;nh năng th&ocirc;ng minh, c&ugrave;ng bạn s&aacute;ng tạo n&ecirc;n những kiệt t&aacute;c đầy nghệ thuật.</h3>\n<h3>Ngoại h&igrave;nh sang trọng, cao cấp h&agrave;ng đầu</h3>\n<p>Vivo X70 Pro sở hữu ngoại h&igrave;nh bắt mắt, sang trọng của một chiếc&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại smartphone ch&iacute;nh h&atilde;ng\" href=\"https://www.dienmayxanh.com/dien-thoai\" target=\"_blank\" rel=\"noopener\">smartphone</a>&nbsp;cao cấp với&nbsp; khung kim loại cứng c&aacute;p v&agrave; c&aacute;c g&oacute;c cạnh được bo cong mềm mại nhẹ tr&ocirc;ng kh&aacute; nam t&iacute;nh v&agrave; mạnh mẽ.</p>\n<p><img src=\"http://localhost:8000/images/products/1646145534257vivo-x70-pro-150921-093333.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Vivo X70 Pro c&oacute; khối lượng tương đối nhẹ với khoảng 184 g, mặt trước v&agrave; mặt sau được xử l&yacute; cong 3D cho cảm gi&aacute;c chắc chắn thoải m&aacute;i khi cầm nắm đồng thời gi&uacute;p chiếc m&aacute;y trở n&ecirc;n sang chảnh v&agrave; đẳng cấp hơn.</p>\n<p><img src=\"http://localhost:8000/images/products/1646145559114vivo-x70-pro-150921-093406.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>B&ecirc;n cạnh đ&oacute;, phần mặt lưng của Vivo X70 Pro được ho&agrave;n thiện dạng nh&aacute;m mờ gi&uacute;p bạn hạn chế việc bị b&aacute;m mồ h&ocirc;i v&agrave; dấu v&acirc;n tay, mặt lưng n&agrave;y c&ograve;n c&oacute; hiệu ứng chuyển m&agrave;u khi nghi&ecirc;ng rất đẹp mắt.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/248099/vivo-x70-pro-150921-093446.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<h3>Cụm 4 camera nhiều đột ph&aacute;</h3>\n<p>Điện thoại Vivo X70 Pro được trang bị cụm camera hợp t&aacute;c c&ugrave;ng ZEISS, c&ocirc;ng ty sản xuất ống k&iacute;nh nổi tiếng h&agrave;ng đầu của Đức, bao gồm camera ch&iacute;nh 50 MP, camera tiềm vọng 12 MP,&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại smartphone camera zoom\" href=\"https://www.thegioididong.com/dtdd-camera-zoom\" target=\"_blank\" rel=\"noopener\">camera tele</a>&nbsp;8 MP v&agrave; cuối c&ugrave;ng l&agrave; một ống k&iacute;nh si&ecirc;u rộng 12 MP.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/248099/vivo-x70-pro-150921-093419.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Ống k&iacute;nh ch&iacute;nh với độ ph&acirc;n giải cao chắc chắn sẽ cho chất lượng ảnh chụp cực sắc n&eacute;t nhờ khả năng lấy n&eacute;t vượt trội trong điều kiện thiếu s&aacute;ng, nay t&iacute;ch hợp th&ecirc;m c&ocirc;ng nghệ chống rung quang học OIS ấn tượng, chắc chắn sẽ hỗ trợ rất nhiều cho người d&ugrave;ng trong qu&aacute; tr&igrave;nh quay phim, chụp ảnh.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/248099/vivo-x70-pro-150921-093340.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p><a title=\"Tham khảo gi&aacute; điện thoại smartphone camera chụp h&igrave;nh g&oacute;c rộng\" href=\"https://www.thegioididong.com/dtdd-camera-goc-rong\" target=\"_blank\" rel=\"noopener\">Camera g&oacute;c rộng</a>&nbsp;v&agrave; camera tele với khả năng chụp zoom xa 5x tối đa l&ecirc;n tới 30x, cho bạn tự do kh&aacute;m ph&aacute; c&aacute;c khung cảnh ở xa m&agrave; kh&ocirc;ng phải di chuyển. Từ đ&oacute; c&oacute; thể dễ d&agrave;ng lưu giữ những khung cảnh tuyệt vời một c&aacute;ch r&otilde; n&eacute;t như ngay trước mắt bạn.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/248099/vivo-x70-pro-150921-093433.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>T&iacute;ch hợp t&iacute;nh năng chống rung gyro-EIS, HDR10+ v&agrave; nhiều chế độ chụp ảnh ấn tượng kh&aacute;c nữa. Đ&acirc;y sẽ l&agrave; một trợ thủ đắc lực gi&uacute;p bạn ghi lại những khoảnh khắc ấn tượng trong cuộc sống một c&aacute;ch mượt m&agrave; hơn, đặc biệt l&agrave; c&aacute;c bạn th&iacute;ch l&agrave;m vlog.</p>\n<p>Camera selfie của m&aacute;y c&oacute; độ ph&acirc;n giải cao l&ecirc;n đến 32 MP, hỗ trợ đầy đủ c&aacute;c t&iacute;nh năng chụp ảnh, l&agrave;m đẹp, HDR v&agrave; quay video Full HD thể tha hồ chụp ảnh tự sướng, quay video TikTok để chia sẻ l&ecirc;n mạng x&atilde; hội.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/248099/vivo-x70-pro-150921-093347.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<h3>M&agrave;n h&igrave;nh lớn, tần số qu&eacute;t 120 Hz mượt m&agrave;</h3>\n<p>Vivo X70 Pro được trang bị m&agrave;n h&igrave;nh l&ecirc;n tới 6.56 inch, thiết kế tr&agrave;n viền với đục lỗ được tối ưu với k&iacute;ch thước kh&aacute; nhỏ v&agrave; c&aacute;c viền benzel si&ecirc;u mỏng mang lại một kh&ocirc;ng gian hiển thị rộng lớn tr&ecirc;n 90%.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/248099/vivo-x70-pro-150921-093353.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>M&agrave;n h&igrave;nh Vivo X70 Pro sử dụng tấm nền AMOLED với độ ph&acirc;n giải Full HD+ (1080 x 2376 Pixels) mang lại một khả năng hiển thị sống động, chi tiết sắc n&eacute;t bắt mắt c&ugrave;ng m&agrave;u đen s&acirc;u rất th&iacute;ch hợp cho việc đọc b&aacute;o, giải tr&iacute; hay chơi game.</p>\n<p>M&agrave;n h&igrave;nh n&agrave;y sẽ c&agrave;ng tuyệt vời hơn nữa khi hỗ trợ tần số qu&eacute;t 120 Hz mang đến sự mượt m&agrave; vượt trội, người d&ugrave;ng c&oacute; thể dễ d&agrave;ng thấy r&otilde; ở c&aacute;c t&aacute;c vụ như hoạt cảnh hay cuộn trang.</p>\n<p>Để n&acirc;ng cao trải nghiệm giải tr&iacute; v&agrave; sử dụng, Vivo X70 Pro c&ograve;n được trang bị hệ thống loa c&oacute; &acirc;m lượng v&agrave; chất lượng vượt trội, mang lại trải nghiệm sống động cho bạn thỏa th&iacute;ch đắm ch&igrave;m trong kh&ocirc;ng gian giải tr&iacute; &acirc;m nhạc hay xem video.</p>\n<h3>Hiệu năng vượt trội với chip MediaTek Dimensity 1200</h3>\n<p>Mẫu flagship h&agrave;ng đầu của Vivo được trang bị một cấu h&igrave;nh khủng với con chip MediaTek Dimensity 1200 mạnh mẽ, cho khả năng xử l&yacute; c&aacute;c t&aacute;c vụ một c&aacute;ch trơn tru, dư sức chiến tốt những tựa game nặng h&agrave;ng đầu hiện nay như PUBG Mobile, Call of Duty: Mobile một c&aacute;ch mượt m&agrave;.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/248099/vivo-x70-pro-2.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Kết hợp với bộ vi xử l&yacute; l&agrave; dung lượng RAM khủng l&ecirc;n tới&nbsp;<a title=\"Tham khảo điện thoại c&oacute; dung lượng RAM 12 GB đang b&aacute;n tại TGDĐ\" href=\"https://www.thegioididong.com/dtdd-ram-12gb\" target=\"_blank\" rel=\"noopener\">12 GB</a>&nbsp;gi&uacute;p bạn xử l&yacute; t&aacute;c vụ đa nhiệm được mượt hơn, chạy được nhiều ứng dụng c&ugrave;ng l&uacute;c hơn v&agrave; hạn chế được tối đa t&igrave;nh trạng giật hay đơ m&aacute;y.&nbsp;</p>\n<p>Bộ nhớ trong chuẩn UFS 3.1 l&ecirc;n đến 256 GB c&oacute; tốc độ đọc, ghi vượt trội cho bạn tha hồ lưu trữ nhiều t&agrave;i liệu cũng như tải c&aacute;c ứng dụng, game giải tr&iacute; y&ecirc;u th&iacute;ch.</p>\n<p>Vivo X70 Pro sẽ chạy tr&ecirc;n hệ điều h&agrave;nh Android 11 c&ugrave;ng giao diện Funtouch OS 12 th&acirc;n thiện, c&aacute;c biểu tượng được l&agrave;m mới với thiết kế tối giản, trải nghiệm của bạn sẽ trở n&ecirc;n tuyệt vời hơn bao giờ hết.</p>\n<h3>Dung lượng pin lớn, hỗ trợ sạc nhanh 44 W vượt trội</h3>\n<p>Với X70 Pro, Vivo mang tới cho người d&ugrave;ng thời gian sử dụng kh&aacute; ấn tượng, m&aacute;y c&oacute; thể sử dụng suốt cả ng&agrave;y d&agrave;i nhờ vi&ecirc;n pin 4450 mAh.&nbsp;</p>\n<p>Tạm kết, Vivo X70 Pro thực sự l&agrave; một sản phẩm rất đ&aacute;ng tiền trong tầm gi&aacute; khi sở hữu thiết kế sang trọng, cấu h&igrave;nh ngon c&ugrave;ng cụm 4 camera ấn tượng, smartphone n&agrave;y hứa hẹn sẽ dễ d&agrave;ng chinh phục nhiều đối tượng người d&ugrave;ng đặc biệt l&agrave; những ai đam m&ecirc; chụp ảnh.</p>', 8, 1, 184, 16, '2022-03-01 21:45:49', 0, 2, 1),
(9, 'Vivo V21 5G', '<table style=\"border-collapse: collapse; width: 99.975%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 14.5929%;\">Dung lượng pin</td>\n<td style=\"width: 85.2535%;\">4200 mAh</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Bluetooth</td>\n<td style=\"width: 85.2535%;\">v5.2</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Thương hiệu</td>\n<td style=\"width: 85.2535%;\">Vivo</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Xuất xứ thương hiệu</td>\n<td style=\"width: 85.2535%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Camera sau</td>\n<td style=\"width: 85.2535%;\">Ch&iacute;nh 64 MP &amp; Phụ 8 MP, 2 MP</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Camera trước</td>\n<td style=\"width: 85.2535%;\">Ch&iacute;nh 50 MP &amp; Phụ 8 MP</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Chip đồ họa (GPU)</td>\n<td style=\"width: 85.2535%;\">Mali-G68 MC4</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Chip set</td>\n<td style=\"width: 85.2535%;\">MediaTek Dimensity 920 5G 8 nh&acirc;n</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Tốc độ CPU</td>\n<td style=\"width: 85.2535%;\">2 nh&acirc;n 2.5 GHz &amp; 6 nh&acirc;n 2 GHz</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 85.2535%;\">AMOLED, Tần số qu&eacute;t 90 Hz,</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Phụ kiện đi k&egrave;m</td>\n<td style=\"width: 85.2535%;\">Hộp, S&aacute;ch Hướng Dẫn, C&acirc;y Lấy Sim, C&aacute;p Type C - Type A, Tai nghe d&acirc;y đầu Type C, Ốp lưng dẻo trong, Miếng d&aacute;n sẵn m&agrave;n h&igrave;nh, Jack chuyển tai nghe 3.5mm</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Model</td>\n<td style=\"width: 85.2535%;\">V23 5G (8GB/128GB)</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Jack tai nghe</td>\n<td style=\"width: 85.2535%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Số sim</td>\n<td style=\"width: 85.2535%;\">2</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Loại pin</td>\n<td style=\"width: 85.2535%;\">Li-Po</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Loại Sim</td>\n<td style=\"width: 85.2535%;\">Nano SIM</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Chất liệu</td>\n<td style=\"width: 85.2535%;\">Khung kim loại &amp; Mặt lưng k&iacute;nh</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Xuất xứ</td>\n<td style=\"width: 85.2535%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Cổng sạc</td>\n<td style=\"width: 85.2535%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Trọng lượng</td>\n<td style=\"width: 85.2535%;\">181 g</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Quay phim</td>\n<td style=\"width: 85.2535%;\">4K 2160p@30fps FullHD 1080p@120fps FullHD 1080p@30fps FullHD 1080p@60fps HD 720p@240fps HD 720p@30fps HD 720p@60fps</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">RAM</td>\n<td style=\"width: 85.2535%;\">8 GB</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Độ ph&acirc;n giải</td>\n<td style=\"width: 85.2535%;\">Full HD+ (1080 x 2400 Pixels)</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">ROM</td>\n<td style=\"width: 85.2535%;\">128 GB</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 85.2535%;\">6.44 inch</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">T&iacute;nh năng camera</td>\n<td style=\"width: 85.2535%;\">Ban đ&ecirc;m (Night Mode), Chuy&ecirc;n nghiệp (Pro), Hiệu ứng Bokeh, Live Photo, Nh&atilde;n d&aacute;n (AR Stickers), Quay chậm (Slow Motion), Quay video hiển thị k&eacute;p, Si&ecirc;u cận (Macro), To&agrave;n cảnh (Panorama), Tr&ocirc;i nhanh thời gian (Time Lapse), X&oacute;a ph&ocirc;ng</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Wifi</td>\n<td style=\"width: 85.2535%;\">Dual-band (2.4 GHz/5 GHz)</td>\n</tr>\n</tbody>\n</table>', '<h3>Chụp selfie b&ugrave;ng nổ trong đ&ecirc;m, thiết kế mới hiện đại đ&oacute;n đầu xu hướng, c&ugrave;ng với đ&oacute; l&agrave; tốc độ kết nối mạng 5G h&agrave;ng đầu, tất cả những t&iacute;nh năng ấn tượng n&agrave;y đều c&oacute; trong&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại Vivo V21 5G ch&iacute;nh h&atilde;ng, nhiều khuyến m&atilde;i đang c&oacute; tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd/vivo-v21-5g\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo gi&aacute; điện thoại Vivo V21 5G ch&iacute;nh h&atilde;ng, nhiều khuyến m&atilde;i đang c&oacute; tại Thegioididong.com\">Vivo V21 5G</a>&nbsp;mẫu&nbsp;<a title=\"Tham khảo th&ecirc;m gi&aacute; điện thoại, smartphone ch&iacute;nh h&atilde;ng, nhiều khuyến m&atilde;i đang c&oacute; tại Thegioididong.com \" href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo th&ecirc;m gi&aacute; điện thoại, smartphone ch&iacute;nh h&atilde;ng, nhiều khuyến m&atilde;i đang c&oacute; tại Thegioididong.com \">điện thoại</a>&nbsp;cận cao cấp đến từ&nbsp;<a title=\"Tham khảo smartphone Vivo ch&iacute;nh h&atilde;ng mới nhất đang c&oacute; tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-vivo\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo smartphone Vivo ch&iacute;nh h&atilde;ng mới nhất đang c&oacute; tại Thegioididong.com\">Vivo</a>.</h3>\n<h3>Thiết kế mới dẫn đầu xu hướng&nbsp;</h3>\n<p>Thay v&igrave; bo cong theo số đ&ocirc;ng, Vivo V21 5G lựa chọn kiểu thiết kế vu&ocirc;ng vức hơn với phần khung nhựa v&aacute;t thẳng, tạo n&ecirc;n một th&acirc;n m&aacute;y si&ecirc;u mỏng v&agrave; tuyệt đẹp.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/238047/vivo-v21-5g-004.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Ở phần mặt lưng, Vivo sử dụng&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại c&oacute; mặt lưng l&agrave;m từ k&iacute;nh cao cấp tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-mat-lung-kinh\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo gi&aacute; điện thoại c&oacute; mặt lưng l&agrave;m từ k&iacute;nh cao cấp tại Thegioididong.com\">chất liệu k&iacute;nh</a>&nbsp;phủ mờ cao cấp c&ugrave;ng những gam m&agrave;u thời trang tạo n&ecirc;n hiệu ứng chuyển m&agrave;u, c&oacute; độ phản chiếu nhẹ v&ocirc; c&ugrave;ng ho&agrave;n hảo dưới &aacute;nh s&aacute;ng. Với c&aacute;ch ho&agrave;n thiện bề mặt nh&aacute;m, gi&uacute;p bạn loại bỏ sự kh&oacute; chịu bởi vệt v&acirc;n tay hay cảm gi&aacute;c trơn tuột khi cầm.</p>\n<p>&nbsp;</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/238047/vivo-v21-5g-002.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<h3>Camera 64 MP hỗ trợ OIS chụp đ&ecirc;m ấn tượng</h3>\n<p>Điểm nhấn nổi bật tiếp theo phải n&oacute;i đến đ&oacute; l&agrave; camera trước được n&acirc;ng cấp mạnh với độ ph&acirc;n giải khủng 44 MP, hỗ trợ OIS lấy n&eacute;t nhanh, khẩu độ lớn tăng cường thu s&aacute;ng, gi&uacute;p cho ảnh chụp selfie của bạn lu&ocirc;n s&aacute;ng r&otilde; v&agrave; rạng rỡ.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/238047/vivo-v21-5g-010.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Độ ph&acirc;n giải 64 MP gi&uacute;p camera ch&iacute;nh ở mặt lưng của Vivo V21 5G chụp được những bức ảnh chất lượng cao, để bạn thỏa sức thu ph&oacute;ng kh&aacute;m ph&aacute;. Camera n&agrave;y cũng hỗ trợ OIS cho khả năng quay phim si&ecirc;u chống rung v&agrave; khả năng lấy n&eacute;t khi chụp đ&ecirc;m cực kỳ ấn tượng.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/238047/vivo-v21-5g-003.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>C&aacute;c camera c&ograve;n lại gồm&nbsp;<a title=\"Tham khảo c&aacute;c d&ograve;ng điện thoại c&oacute; camera g&oacute;c si&ecirc;u rộng tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-camera-goc-rong\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo c&aacute;c d&ograve;ng điện thoại c&oacute; camera g&oacute;c si&ecirc;u rộng tại Thegioididong.com\">camera g&oacute;c rộng</a>&nbsp;8 MP v&agrave;&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại c&oacute; camera macro chụp cận cảnh tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-camera-macro\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo gi&aacute; điện thoại c&oacute; camera macro chụp cận cảnh tại Thegioididong.com\">camera macro</a>&nbsp;2 MP đ&aacute;p ứng tốt nhu cầu chụp ảnh hiện nay, cho bạn nắm bắt những g&oacute;c chụp ho&agrave;n hảo trong nhiều điều kiện.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/238047/vivo-v21-5g-015.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<h3>5G lu&ocirc;n sẵn s&agrave;ng cho cuộc sống kh&ocirc;ng chờ đợi</h3>\n<p>Vivo V21 5G hỗ trợ kết nối 5G SA/NSA tr&ecirc;n cả 2 sim mang đến tốc độ kết nối cực nhanh cho trải nghiệm trực tuyến của bạn th&ecirc;m phần mượt m&agrave;. Với tốc độ mạng nhanh như vậy, mọi nhu cầu của bạn giờ đ&acirc;y sẽ được ho&agrave;n th&agrave;nh nhanh ch&oacute;ng hơn, &iacute;t phải chờ đợi hơn.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/238047/vivo-v21-5g-016.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<h3>Bổ sung RAM ảo tăng cường hiệu năng</h3>\n<p>Vivo V21 5G trang bị vi xử l&yacute; Dimensity 800U của MediaTek, với 8 nh&acirc;n v&agrave; tiến tr&igrave;nh 7 nm, c&ugrave;ng GPU Mali-G57 MC3 hứa hẹn những trải nghiệm&nbsp;chơi game lu&ocirc;n được mượt m&agrave;, tốc độ mở ứng dụng được r&uacute;t ngắn tối đa cho c&ocirc;ng việc diễn ra trơn tru kh&ocirc;ng bị gi&aacute;n đoạn.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/238047/vivo-v21-5g-012.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Khi được kiểm tra qua phầm mềm đo hiệu năng Antutu, Vivo V21 5G được khoảng 310.0000 điểm một con số kh&aacute; ấn tượng. Với hiệu năng cao như vậy m&aacute;y ho&agrave;n to&agrave;n đ&aacute;p ứng tốt nhu cầu từ người d&ugrave;ng với nhiều t&aacute;c vụ nặng, thoải m&aacute;i trải nghiệm.</p>\n<p>Vivo V21 5G chạy phi&ecirc;n bản FuntouchOS 11.1 hoạt động tr&ecirc;n nền tảng&nbsp;Android&nbsp;11 với giao diện th&acirc;n thiện, c&aacute;c biểu tượng được l&agrave;m mới với thiết kế tối giản, cho trải nghiệm của bạn sẽ trở n&ecirc;n h&agrave;o hứng hơn bao giờ hết.</p>\n<p>Vivo V21 5G được &aacute;p dụng c&ocirc;ng nghệ mở rộng RAM, ngo&agrave;i&nbsp;<a title=\"Tham khảo điện thoại c&oacute; RAM 8 GB tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-ram-8gb\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo điện thoại c&oacute; RAM 8 GB tại Thegioididong.com\">8 GB RAM</a>&nbsp;vật l&yacute; đi k&egrave;m, bạn sẽ c&oacute; th&ecirc;m 3 GB RAM ảo được mở rộng từ bộ nhớ trong của m&aacute;y, cho ph&eacute;p c&aacute;c ứng dụng c&oacute; thể chạy mượt m&agrave; v&agrave; ổn định bất kể số lượng ứng dụng m&agrave; bạn đ&atilde; mở trước đ&oacute;.</p>\n<h3>M&agrave;n h&igrave;nh 90 Hz chất lượng hiển thị h&agrave;ng đầu</h3>\n<p>M&agrave;n h&igrave;nh tần số l&agrave;m tươi 90 Hz n&acirc;ng cấp trải nghiệm với h&igrave;nh ảnh, hiệu ứng chuyển động li&ecirc;n tục mượt m&agrave; hơn mỗi khi bạn chạm vuốt, tăng sự th&iacute;ch th&uacute; để bạn trải nghiệm những bộ phim hay những nội dung th&uacute; vị khi lướt web.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/238047/vivo-v21-5g-007.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>V21 5G mang chất lượng hiển thị vượt mong đợi đến từ m&agrave;n h&igrave;nh AMOLED tr&agrave;n viền, k&iacute;ch thước 6.44 inch, hỗ trợ HDR10+ với m&agrave;u sắc rực rỡ sinh động trong từng khung h&igrave;nh, độ s&aacute;ng tối đa l&ecirc;n đến 800 nits dễ d&agrave;ng xem nội dung v&agrave; thao t&aacute;c khi bạn đang ở ngo&agrave;i trời nắng.</p>\n<p>Hỗ trợ&nbsp;<a title=\"Tham khảo th&ecirc;m c&aacute;c mẫu điện thoại c&oacute; cảm biến v&acirc;n tay tại Thegioididong.com \" href=\"https://www.thegioididong.com/dtdd-bao-mat-van-tay\" target=\"_blank\" rel=\"noopener\" type=\"Tham khảo th&ecirc;m c&aacute;c mẫu điện thoại c&oacute; cảm biến v&acirc;n tay tại Thegioididong.com \">cảm biến v&acirc;n tay</a>&nbsp;quang học gi&uacute;p bảo mật cho m&aacute;y cũng như cho thao t&aacute;c mở kh&oacute;a được thuận tiện, nhanh ch&oacute;ng hơn.</p>\n<h3>Pin 4000 mAh đủ cho một ng&agrave;y sử dụng</h3>\n<p>Trang bị vi&ecirc;n pin 4000 mAh kh&ocirc;ng qu&aacute; cao, nhưng nhờ sự tối ưu vượt trội đến từ vi xử l&yacute; 7 nm, gi&uacute;p cho thời lượng pin tr&ecirc;n V21 5G vẫn đủ cho hoạt động cần thiết trong một ng&agrave;y.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/238047/vivo-v21-5g-009.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>T&oacute;m lại, với những điểm \"ăn tiền\" từ thiết kế mới v&agrave; cao cấp hơn, cụm camera selfie với nhiều cải tiến, hứa hẹn Vivo V21 5G sẽ l&agrave; mẫu điện thoại 5G mang đến những trải nghiệm đ&aacute;ng gi&aacute; cho người d&ugrave;ng.</p>', 8, 1, 168, 16, '2022-03-01 21:59:24', 0, 2, 1),
(10, 'Vivo V23 5G', '<table style=\"border-collapse: collapse; width: 99.975%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 14.5929%;\">Dung lượng pin</td>\n<td style=\"width: 85.2535%;\">4200 mAh</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Bluetooth</td>\n<td style=\"width: 85.2535%;\">v5.2</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Thương hiệu</td>\n<td style=\"width: 85.2535%;\">Vivo</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Xuất xứ thương hiệu</td>\n<td style=\"width: 85.2535%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Camera sau</td>\n<td style=\"width: 85.2535%;\">Ch&iacute;nh 64 MP &amp; Phụ 8 MP, 2 MP</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Camera trước</td>\n<td style=\"width: 85.2535%;\">Ch&iacute;nh 50 MP &amp; Phụ 8 MP</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Chip đồ họa (GPU)</td>\n<td style=\"width: 85.2535%;\">Mali-G68 MC4</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Chip set</td>\n<td style=\"width: 85.2535%;\">MediaTek Dimensity 920 5G 8 nh&acirc;n</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Tốc độ CPU</td>\n<td style=\"width: 85.2535%;\">2 nh&acirc;n 2.5 GHz &amp; 6 nh&acirc;n 2 GHz</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 85.2535%;\">AMOLED, Tần số qu&eacute;t 90 Hz,</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Phụ kiện đi k&egrave;m</td>\n<td style=\"width: 85.2535%;\">Hộp, S&aacute;ch Hướng Dẫn, C&acirc;y Lấy Sim, C&aacute;p Type C - Type A, Tai nghe d&acirc;y đầu Type C, Ốp lưng dẻo trong, Miếng d&aacute;n sẵn m&agrave;n h&igrave;nh, Jack chuyển tai nghe 3.5mm</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Model</td>\n<td style=\"width: 85.2535%;\">V23 5G (8GB/128GB)</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Jack tai nghe</td>\n<td style=\"width: 85.2535%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Số sim</td>\n<td style=\"width: 85.2535%;\">2</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Loại pin</td>\n<td style=\"width: 85.2535%;\">Li-Po</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Loại Sim</td>\n<td style=\"width: 85.2535%;\">Nano SIM</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Chất liệu</td>\n<td style=\"width: 85.2535%;\">Khung kim loại &amp; Mặt lưng k&iacute;nh</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Xuất xứ</td>\n<td style=\"width: 85.2535%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Cổng sạc</td>\n<td style=\"width: 85.2535%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Trọng lượng</td>\n<td style=\"width: 85.2535%;\">181 g</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Quay phim</td>\n<td style=\"width: 85.2535%;\">4K 2160p@30fps FullHD 1080p@120fps FullHD 1080p@30fps FullHD 1080p@60fps HD 720p@240fps HD 720p@30fps HD 720p@60fps</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">RAM</td>\n<td style=\"width: 85.2535%;\">8 GB</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Độ ph&acirc;n giải</td>\n<td style=\"width: 85.2535%;\">Full HD+ (1080 x 2400 Pixels)</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">ROM</td>\n<td style=\"width: 85.2535%;\">128 GB</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 85.2535%;\">6.44 inch</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">T&iacute;nh năng camera</td>\n<td style=\"width: 85.2535%;\">Ban đ&ecirc;m (Night Mode), Chuy&ecirc;n nghiệp (Pro), Hiệu ứng Bokeh, Live Photo, Nh&atilde;n d&aacute;n (AR Stickers), Quay chậm (Slow Motion), Quay video hiển thị k&eacute;p, Si&ecirc;u cận (Macro), To&agrave;n cảnh (Panorama), Tr&ocirc;i nhanh thời gian (Time Lapse), X&oacute;a ph&ocirc;ng</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Wifi</td>\n<td style=\"width: 85.2535%;\">Dual-band (2.4 GHz/5 GHz)</td>\n</tr>\n</tbody>\n</table>', '<h3><a title=\"Vivo V23 5G\" href=\"https://www.thegioididong.com/dtdd/vivo-v23-5g\" target=\"_blank\" rel=\"noopener\">Vivo V23 5G</a>&nbsp;ra mắt thu h&uacute;t kh&ocirc;ng &iacute;t sự quan t&acirc;m của c&aacute;c kh&aacute;ch h&agrave;ng chuộng Vivo, th&iacute;ch selfie v&agrave; đam m&ecirc; với điện thoại thiết kế đẹp. Cần 1&nbsp;<a title=\"Tham khảo sản phẩm kinh doanh tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">smartphone</a>&nbsp;chụp h&igrave;nh chuẩn chỉnh với 1 cấu h&igrave;nh tốt, bạn tham khảo phi&ecirc;n bản n&agrave;y của&nbsp;<a title=\"Tham khảo sản phẩm điện thoại Vivo tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-vivo\" target=\"_blank\" rel=\"noopener\">Vivo</a>&nbsp;n&agrave;o.</h3>\n<h3>Thiết kế &ldquo;sang xịn&rdquo;</h3>\n<p>Về phần thiết kế của smartphone Vivo c&oacute; thể n&oacute;i chưa bao giờ l&agrave;m người d&ugrave;ng thất vọng. Vivo V23 5G vẫn giữ được c&aacute;c điểm nổi bật của&nbsp;<a title=\"Tham khảo th&ocirc;ng tin sản phẩm tại TGDD\" href=\"https://www.thegioididong.com/dtdd-vivo-v\">Vivo V Series</a>, c&oacute; thiết kế khung kim loại chắc chắn, c&aacute;c cạnh phẳng mạnh mẽ, 4 g&oacute;c ho&agrave;n thiện bo cong nhẹ th&ecirc;m phần sang chảnh cho tổng thể, tạo cảm gi&aacute;c cầm nắm chắc tay.</p>\n<p>M&aacute;y c&oacute; 2 phi&ecirc;n bản m&agrave;u sắc lấy cảm hứng từ thi&ecirc;n nhi&ecirc;n gồm m&agrave;u xanh đen v&agrave; v&agrave;ng, Vivo V23 5G mang ngoại h&igrave;nh cuốn h&uacute;t, độc đ&aacute;o, ấn tượng tốt ngay khi chạm mắt người d&ugrave;ng.</p>\n<p>Camera trước được đặt trong phần tai thỏ gọn g&agrave;ng, thiết kế tai thỏ n&agrave;y chứa tới 2 camera selfie, m&agrave;n h&igrave;nh c&oacute; cạnh viền si&ecirc;u mỏng mang đến trải nghiệm xem ấn tượng, k&iacute;ch thước m&agrave;n h&igrave;nh 6.44 inch đủ thỏa m&atilde;n thị gi&aacute;c khi giải tr&iacute; tr&ecirc;n&nbsp;<a title=\"Tham khảo c&aacute;c sản phẩm điện thoại tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">smartphone</a>.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/264034/vivo-v23-5g-1-2.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>M&agrave;u sắc v&agrave; độ s&aacute;ng m&agrave;n h&igrave;nh được kiểm so&aacute;t tốt tr&ecirc;n tấm nền&nbsp;<a title=\"M&agrave;n h&igrave;nh AMOLED l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/hoi-dap/man-hinh-amoled-la-gi-905766\" target=\"_blank\" rel=\"noopener\">AMOLED</a>, h&igrave;nh ảnh hiển thị c&oacute; độ tương phản cao, dải m&agrave;u rộng tạo hiệu ứng m&agrave;u sắc rực rỡ, tươi s&aacute;ng, đồng thời lại rất tiết kiệm năng lượng cho điện thoại.</p>\n<p>Hỗ trợ mở kh&oacute;a khu&ocirc;n mặt v&agrave; mở kh&oacute;a v&acirc;n tay dưới m&agrave;n h&igrave;nh, cho ph&eacute;p lựa chọn truy cập m&agrave;n h&igrave;nh nhanh với khả năng bảo mật tốt cho điện thoại c&aacute; nh&acirc;n.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/264034/vivo-v23-5g-2-2.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<h3>&ldquo;Selfie Phone&rdquo; chất lượng h&agrave;ng đầu trong ph&acirc;n kh&uacute;c</h3>\n<p>C&oacute; thể n&oacute;i, Vivo V23 5G xứng đ&aacute;ng l&agrave; 1 Selfie Phone chất lượng h&agrave;ng đầu trong ph&acirc;n kh&uacute;c, khi được n&acirc;ng cấp tới 2 camera mặt trước c&oacute; độ ph&acirc;n giải 50 MP v&agrave; 8 MP cho cảm biến g&oacute;c rộng l&ecirc;n đến 105 độ với khả năng lấy n&eacute;t cực tốt, chất lượng chụp ảnh, quay phim được cải tiến r&otilde; rệt so với c&aacute;c thế hệ trước.</p>\n<p>Với cải tiến n&agrave;y, Vivo kh&ocirc;ng chỉ nhắm đến nhu cầu selfie m&agrave; c&ograve;n chụp ảnh số đ&ocirc;ng bằng camera trước, cho h&igrave;nh ảnh chất lượng cao kh&ocirc;ng thua k&eacute;m cụm camera ch&iacute;nh, điều m&agrave; c&aacute;c smartphone kh&aacute;c chưa thực hiện được.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/264034/vivo-v23-5g-3-2.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Cụm camera sau xếp dọc trong m&ocirc;-đun nổi bật, độ ph&acirc;n giải lần lượt l&agrave; 64 MP cho cảm biến ch&iacute;nh, 8 MP cho&nbsp;<a title=\"Camera g&oacute;c rộng, g&oacute;c si&ecirc;u rộng tr&ecirc;n smartphone l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/hoi-dap/camera-goc-rong-goc-sieu-rong-tren-smartphone-la-1172240\" target=\"_blank\" rel=\"noopener\">cảm biến g&oacute;c si&ecirc;u rộng</a>&nbsp;v&agrave; 2 MP&nbsp;<a title=\"Ống k&iacute;nh Macro, chụp ảnh Macro l&agrave; g&igrave;? C&aacute;c lưu &yacute; khi chụp ảnh Macro\" href=\"https://www.thegioididong.com/hoi-dap/che-do-chup-macro-la-gi-907851\" target=\"_blank\" rel=\"noopener\">cảm biến si&ecirc;u cận macro</a>.&nbsp;Khả năng &ldquo;si&ecirc;u chụp đ&ecirc;m&rdquo; cho ph&eacute;p bạn&nbsp;<a title=\"Chế độ chụp đ&ecirc;m - Night mode l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/hoi-dap/che-do-chup-dem-night-mode-la-gi-907873\" target=\"_blank\" rel=\"noopener\">chụp đ&ecirc;m</a>&nbsp;cực r&otilde; n&eacute;t, vượt trội cả về cả năng lấy n&eacute;t v&agrave; đảm bảo độ s&acirc;u, chi tiết của h&igrave;nh ảnh, để d&ugrave; trong ho&agrave;n cảnh n&agrave;o bạn cũng c&oacute; thể chụp được bức ch&acirc;n dung, ảnh nghệ thuật hay phong cảnh thật tuyệt.</p>\n<p>&nbsp;</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/264034/vivo-v23-5g-4-2.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Kh&ocirc;ng chỉ c&oacute; độ ph&acirc;n giải cao, camera của smartphone n&agrave;y c&ograve;n được hỗ trợ c&aacute;c t&iacute;nh năng như khả năng&nbsp;<a title=\"Chế độ autofocus trong chụp ảnh tr&ecirc;n smartphone\" href=\"https://www.thegioididong.com/hoi-dap/che-do-autofocus-trong-chup-anh-tren-smartphone-906408\" target=\"_blank\" rel=\"noopener\">tự động lấy n&eacute;t</a>, lấy n&eacute;t theo mắt để bạn lu&ocirc;n l&agrave; trung t&acirc;m nổi bật của bức h&igrave;nh. Chế độ chụp ch&acirc;n dung sắc n&eacute;t, ch&acirc;n dung tự nhi&ecirc;n hay chế độ ch&acirc;n dung đa phong c&aacute;ch, chụp ảnh hiệu ứng bokeh, mang đến nhiều trải nghiệm s&aacute;ng tạo cho người d&ugrave;ng.</p>\n<h3>Hiệu năng mạnh mẽ với con chip MediaTek Dimensity 920 5G 8 nh&acirc;n</h3>\n<p>X&eacute;t về hiệu năng, Vivo V23 5G cũng c&oacute; 1 cấu h&igrave;nh khủng so với c&aacute;c sản phẩm trong ph&acirc;n kh&uacute;c, nhờ sức mạnh từ chip MediaTek Dimensity 920 5G 8 nh&acirc;n v&agrave; bộ nhớ RAM 8 GB c&oacute; thể mở rộng. Nền tảng n&agrave;y cho ph&eacute;p điện thoại hoạt động ổn định v&agrave; mượt m&agrave; tr&ecirc;n mọi t&aacute;c vụ y&ecirc;u cầu, kể cả chiến game online tốc độ cao với tần số qu&eacute;t hỗ trợ l&ecirc;n đến 90 Hz.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/264034/vivo-v23-5g-5-2.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Điện thoại chạy hệ điều h&agrave;nh Android 12 với giao diện th&acirc;n thiện, hỗ trợ kết nối 5G mang đến kết nối ổn định v&agrave; liền mạch tr&ecirc;n mọi t&aacute;c vụ mạng.</p>\n<h3>Pin tốt, hỗ trợ sạc si&ecirc;u nhanh</h3>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/264034/vivo-v23-5g-6-2.jpg\" alt=\"\" width=\"1020\" height=\"570\" /></p>\n<p>Vivo V23 5G trang bị vi&ecirc;n pin dung lượng 4200 mAh đủ d&ugrave;ng cho nhu cầu sử dụng điện thoại tần suất cơ bản trong ng&agrave;y.</p>\n<p>Nhờ được hỗ trợ&nbsp;<a title=\"Tham khảo sản phẩm điện thoại sạc pin nhanh tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-sac-pin-nhanh\" target=\"_blank\" rel=\"noopener\">sạc pin nhanh</a>&nbsp;44 W, tốc độ phục hồi pin si&ecirc;u tốc để nhanh ch&oacute;ng đưa điện thoại trở lại t&igrave;nh trạng hoạt động ổn định trong c&aacute;c t&igrave;nh huống cấp thiết khi cạn nguồn.</p>\n<p>Vivo V23 5G với thiết kế trẻ trung hợp thời, camera chụp ảnh ấn tượng c&ugrave;ng vi&ecirc;n pin sạc nhanh sẽ ph&ugrave; hợp với hầu hết mọi đối tượng người d&ugrave;ng.</p>', 7, 1, 178, 17, '2022-03-01 22:09:04', 0, 2, 1),
(11, 'Vivo Y72 5G', '<table style=\"border-collapse: collapse; width: 99.975%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 14.5929%;\">Dung lượng pin</td>\n<td style=\"width: 85.2535%;\">4200 mAh</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Bluetooth</td>\n<td style=\"width: 85.2535%;\">v5.2</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Thương hiệu</td>\n<td style=\"width: 85.2535%;\">Vivo</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Xuất xứ thương hiệu</td>\n<td style=\"width: 85.2535%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Camera sau</td>\n<td style=\"width: 85.2535%;\">Ch&iacute;nh 64 MP &amp; Phụ 8 MP, 2 MP</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Camera trước</td>\n<td style=\"width: 85.2535%;\">Ch&iacute;nh 50 MP &amp; Phụ 8 MP</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Chip đồ họa (GPU)</td>\n<td style=\"width: 85.2535%;\">Mali-G68 MC4</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Chip set</td>\n<td style=\"width: 85.2535%;\">MediaTek Dimensity 920 5G 8 nh&acirc;n</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Tốc độ CPU</td>\n<td style=\"width: 85.2535%;\">2 nh&acirc;n 2.5 GHz &amp; 6 nh&acirc;n 2 GHz</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 85.2535%;\">AMOLED, Tần số qu&eacute;t 90 Hz,</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Phụ kiện đi k&egrave;m</td>\n<td style=\"width: 85.2535%;\">Hộp, S&aacute;ch Hướng Dẫn, C&acirc;y Lấy Sim, C&aacute;p Type C - Type A, Tai nghe d&acirc;y đầu Type C, Ốp lưng dẻo trong, Miếng d&aacute;n sẵn m&agrave;n h&igrave;nh, Jack chuyển tai nghe 3.5mm</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Model</td>\n<td style=\"width: 85.2535%;\">V23 5G (8GB/128GB)</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Jack tai nghe</td>\n<td style=\"width: 85.2535%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Số sim</td>\n<td style=\"width: 85.2535%;\">2</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Loại pin</td>\n<td style=\"width: 85.2535%;\">Li-Po</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Loại Sim</td>\n<td style=\"width: 85.2535%;\">Nano SIM</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Chất liệu</td>\n<td style=\"width: 85.2535%;\">Khung kim loại &amp; Mặt lưng k&iacute;nh</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Xuất xứ</td>\n<td style=\"width: 85.2535%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Cổng sạc</td>\n<td style=\"width: 85.2535%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Trọng lượng</td>\n<td style=\"width: 85.2535%;\">181 g</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Quay phim</td>\n<td style=\"width: 85.2535%;\">4K 2160p@30fps FullHD 1080p@120fps FullHD 1080p@30fps FullHD 1080p@60fps HD 720p@240fps HD 720p@30fps HD 720p@60fps</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">RAM</td>\n<td style=\"width: 85.2535%;\">8 GB</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Độ ph&acirc;n giải</td>\n<td style=\"width: 85.2535%;\">Full HD+ (1080 x 2400 Pixels)</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">ROM</td>\n<td style=\"width: 85.2535%;\">128 GB</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 85.2535%;\">6.44 inch</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">T&iacute;nh năng camera</td>\n<td style=\"width: 85.2535%;\">Ban đ&ecirc;m (Night Mode), Chuy&ecirc;n nghiệp (Pro), Hiệu ứng Bokeh, Live Photo, Nh&atilde;n d&aacute;n (AR Stickers), Quay chậm (Slow Motion), Quay video hiển thị k&eacute;p, Si&ecirc;u cận (Macro), To&agrave;n cảnh (Panorama), Tr&ocirc;i nhanh thời gian (Time Lapse), X&oacute;a ph&ocirc;ng</td>\n</tr>\n<tr>\n<td style=\"width: 14.5929%;\">Wifi</td>\n<td style=\"width: 85.2535%;\">Dual-band (2.4 GHz/5 GHz)</td>\n</tr>\n</tbody>\n</table>', '<h3><a href=\"https://www.thegioididong.com/dtdd/vivo-y72-5g\">Vivo Y72 5G</a>&nbsp;mẫu&nbsp;<a href=\"https://www.thegioididong.com/dtdd-5g\">smartphone 5G</a>&nbsp;của&nbsp;<a href=\"https://www.thegioididong.com/dtdd-vivo\">Vivo</a>, m&aacute;y sở hữu một m&agrave;n h&igrave;nh lớn, hiệu năng mạnh mẽ, cụm 3 camera sắc n&eacute;t v&agrave; thời lượng pin ấn tượng, m&aacute;y đ&aacute;p ứng tốt hầu hết nhu cầu sử dụng m&agrave; người d&ugrave;ng cần.</h3>\n<h3>Thiết kế cứng c&aacute;p, sang trọng</h3>\n<p style=\"font-weight: 400;\">Khung viền của Vivo Y72 5G được gia c&ocirc;ng tỉ mỉ với độ ho&agrave;n thiện cao kết hợp với mặt lưng l&agrave;m từ nhựa cao cấp n&ecirc;n c&oacute; độ bền v&agrave; khả năng chịu lực tốt, gi&uacute;p bảo vệ điện thoại khỏi t&aacute;c động của ngoại lực trong qu&aacute; tr&igrave;nh sử dụng.&nbsp;</p>\n<p style=\"font-weight: 400;\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/236431/vivo-y72-5g-001.jpg\" alt=\"\" /></p>\n<p>Trọng lượng lượng của Y72 5G chỉ 193 g mang lại cảm gi&aacute;c cầm nắm rất đầm tay v&agrave; thoải m&aacute;i khi sử dụng trong thời gian d&agrave;i.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236431/vivo-y72-5g-006.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>M&aacute;y sử dụng tấm nền IPS LCD thiết kế kiểu giọt nước với k&iacute;ch thước l&agrave; 6.58 inch c&ugrave;ng độ ph&acirc;n giải Full HD+ (1080 x 2408 pixels) cho chất lượng h&igrave;nh ảnh hiển thị chi tiết, sắc n&eacute;t v&agrave; sống động.</p>\n<p>M&agrave;n h&igrave;nh của Vivo Y72 5G c&oacute; tỷ lệ khung h&igrave;nh 20:9 gi&uacute;p tối ưu h&oacute;a trải nghiệm của bạn từ xem phim, đọc b&aacute;o, chơi game đều sẽ v&ocirc; c&ugrave;ng th&iacute;ch th&uacute;.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236431/vivo-y72-5g-007.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Đặc biệt m&agrave;n h&igrave;nh n&agrave;y g&acirc;y ấn tượng khi chiếm tới 90.6% diện t&iacute;ch mặt trước, hỗ trợ gam m&agrave;u 96% NTSC cho người d&ugrave;ng c&oacute; những ph&uacute;t gi&acirc;y trải nghiệm thị gi&aacute;c rất ch&acirc;n thực.</p>\n<h3>Hiệu năng mạnh mẽ với chip Dimensity 700</h3>\n<p>Vivo Y72 5G sở hữu sức mạnh phần cứng đến từ vi xử l&yacute; Dimensity 700 8 nh&acirc;n của MediaTek, sản xuất tr&ecirc;n tiến tr&igrave;nh 7 nm. Vi xử l&yacute; n&agrave;y n&acirc;ng cấp về kết nối 5G, khả năng gaming, được kỳ vọng sẽ mang trải nghiệm tốt hơn cho người d&ugrave;ng.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236431/vivo-y72-5g-10.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Sau khi tham khảo qua phầm mềm đo hiệu năng Antutu th&igrave; m&aacute;y cho ra con số kh&aacute; ấn tượng 284.138 điểm.&nbsp;Kết hợp với&nbsp;<a title=\"Tham khảo điện thoại c&oacute; RAM 8 GB tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-ram-8gb\" target=\"_blank\" rel=\"noopener\">RAM 8 GB</a>&nbsp;gi&uacute;p m&aacute;y c&oacute; thể dễ d&agrave;ng đa nhiệm nhiều t&aacute;c vụ c&ugrave;ng l&uacute;c m&agrave; kh&ocirc;ng c&ograve;n phải lo hiện tượng giật lag hay gi&aacute;n đoạn khung h&igrave;nh khi sử dụng.</p>\n<p>Hơn nữa, Dimensity 700 hỗ trợ mạng 5G tốc độ cao, sẽ mang đến tốc độ truyền tải nhanh hơn gấp nhiều lần khi so s&aacute;nh với mạng 4G, gi&uacute;p bạn tải l&ecirc;n hoặc tải xuống mọi dữ liệu trong t&iacute;ch tắc.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236431/vivo-y72-5g-6-1.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Vivo Y72 5G c&oacute; dung lượng bộ nhớ trong 128 GB, bạn c&oacute; thể thoải m&aacute;i tải c&aacute;c tựa game nặng, h&igrave;nh ảnh, video cũng như dữ liệu c&aacute; nh&acirc;n tr&ecirc;n thiết bị.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236431/vivo-y72-5g-004.jpg\" alt=\"\" /></p>\n<h3>Hệ thống 3 camera sau ấn tượng</h3>\n<p>Di chuyển đến mặt lưng, chiếc điện thoại n&agrave;y mang tr&ecirc;n m&igrave;nh hệ thống 3 camera xếp dọc trong m&ocirc;-đun h&igrave;nh chữ nhật bao gồm camera ch&iacute;nh 64 MP,&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại smartphone camera chụp h&igrave;nh g&oacute;c rộng\" href=\"https://www.thegioididong.com/dtdd-camera-goc-rong\" target=\"_blank\" rel=\"noopener\">camera g&oacute;c rộng</a>&nbsp;8 MP v&agrave;&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại smartphone camera macro\" href=\"https://www.thegioididong.com/dtdd-camera-macro\" target=\"_blank\" rel=\"noopener\">camera macro</a>&nbsp;2 MP.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236431/vivo-y72-5g-002.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Camera ch&iacute;nh hỗ trợ đầy đủ c&aacute;c t&iacute;nh năng m&agrave; một người d&ugrave;ng cần với khả năng lấy n&eacute;t nhanh trong điều kiện thiếu s&aacute;ng mang đến cho người d&ugrave;ng những bức ảnh xuất sắc.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236431/vivo-y72-5g-6.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Camera selfie của m&aacute;y c&oacute; độ ph&acirc;n giải 16 MP hỗ trợ hầu hết t&iacute;nh năng phổ biến hiện nay như&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại smartphone camera chụp h&igrave;nh xo&aacute; ph&ocirc;ng\" href=\"https://www.thegioididong.com/dtdd-camera-xoa-phong\" target=\"_blank\" rel=\"noopener\">x&oacute;a ph&ocirc;ng</a>, chụp với chế độ panorama, quay phim chất lượng Full HD,... cho người d&ugrave;ng tự tin tỏa s&aacute;ng c&ugrave;ng bạn b&egrave;, người th&acirc;n.</p>\n<p>&nbsp;</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236431/vivo-y72-5g-11.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<h3>Thoải m&aacute;i sử dụng với vi&ecirc;n pin dung lượng lớn 5000 mAh</h3>\n<p>Vivo Y72 5G được trang bị một vi&ecirc;n pin c&oacute; dung lượng 5000 mAh, hỗ trợ&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại smartphone sạc pin nhanh\" href=\"https://www.thegioididong.com/dtdd-sac-pin-nhanh\" target=\"_top\">sạc nhanh</a>&nbsp;18 W th&ocirc;ng qua cổng Type-C gi&uacute;p qu&aacute; tr&igrave;nh sạc r&uacute;t ngắn được rất nhiều thời gian.</p>\n<p>Vivo Y72 5G c&ograve;n được trang bị&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại smartphone c&oacute; bảo mật cảm biến v&acirc;n tay\" href=\"https://www.thegioididong.com/dtdd-bao-mat-van-tay\" target=\"_blank\" rel=\"noopener\">mở kh&oacute;a v&acirc;n tay</a>&nbsp;ở cạnh viền bạn chỉ cần thao t&aacute;c một chạm nhẹ nh&agrave;ng để mở kh&oacute;a m&agrave;n h&igrave;nh, nhanh ch&oacute;ng v&agrave; cực đơn giản.</p>\n<p>Tạm kết, Vivo Y72 5G l&agrave; chiếc điện thoại to&agrave;n diện về thiết kế, cấu h&igrave;nh v&agrave; camera ph&ugrave; hợp với những người y&ecirc;u c&ocirc;ng nghệ c&oacute; nhu cầu chơi game đồ họa cao v&agrave; y&ecirc;u th&iacute;ch chụp ảnh.</p>', 8, 1, 178, 17, '2022-03-01 22:24:56', 0, 2, 1);
INSERT INTO `product` (`id`, `name`, `specifications`, `description`, `width`, `height`, `weight`, `length`, `created_date`, `published`, `brand_id`, `user_id`) VALUES
(12, 'OPPO Reno6 5G', '<table style=\"border-collapse: collapse; width: 99.975%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 38.1464%;\">Dung lượng pin</td>\n<td style=\"width: 61.6999%;\">4300mAh (Typ)</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">Thương hiệu</td>\n<td style=\"width: 61.6999%;\">OPPO</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">Xuất xứ thương hiệu</td>\n<td style=\"width: 61.6999%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">Camera sau</td>\n<td style=\"width: 61.6999%;\">Ch&iacute;nh 64 MP &amp; Phụ 8 MP, 2 MP</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">Camera trước</td>\n<td style=\"width: 61.6999%;\">32MP</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">Chip đồ họa (GPU)</td>\n<td style=\"width: 61.6999%;\">Mali-G68 MC4</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">Chip set</td>\n<td style=\"width: 61.6999%;\">MTK Dimensity 900 5G, tối đa 2.4GHz</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">K&iacute;ch thước</td>\n<td style=\"width: 61.6999%;\">D&agrave;i 163.6 mm - Ngang 74 mm - D&agrave;y 8.3 mm</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td style=\"width: 61.6999%;\">AMOLED</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">Phụ kiện đi k&egrave;m</td>\n<td style=\"width: 61.6999%;\">S&aacute;ch hướng dẩn, c&aacute;p sạc</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">Số sim</td>\n<td style=\"width: 61.6999%;\">2</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">Loại Sim</td>\n<td style=\"width: 61.6999%;\">Nano Sim</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">Xuất xứ</td>\n<td style=\"width: 61.6999%;\">Trung Quốc</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">Trọng lượng</td>\n<td style=\"width: 61.6999%;\">193g</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">RAM</td>\n<td style=\"width: 61.6999%;\">8GB</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">ROM</td>\n<td style=\"width: 61.6999%;\">128GB</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\n<td style=\"width: 61.6999%;\">6.43 inch</td>\n</tr>\n<tr>\n<td style=\"width: 38.1464%;\">Wifi</td>\n<td style=\"width: 61.6999%;\">C&oacute;</td>\n</tr>\n</tbody>\n</table>', '<h3>Sau khi ra mắt&nbsp;<a title=\"Tham khảo điện thoại OPPO Reno5 ch&iacute;nh h&atilde;ng tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd/oppo-reno5\" target=\"_blank\" rel=\"noopener\">OPPO Reno5</a>&nbsp;chưa l&acirc;u th&igrave;&nbsp;<a title=\"Tham khảo điện thoại OPPO ch&iacute;nh h&atilde;ng tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-oppo\" target=\"_blank\" rel=\"noopener\">OPPO</a>&nbsp;lại cho ra mẫu&nbsp;<a title=\"Tham khảo điện thoại kinh doanh tại thegioididong.com\" href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">smartphone</a>&nbsp;mới mang t&ecirc;n&nbsp;<a title=\"Tham khảo điện thoại OPPO Reno6 ch&iacute;nh h&atilde;ng tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd/oppo-reno6\" target=\"_blank\" rel=\"noopener\">OPPO Reno6</a>&nbsp;với h&agrave;ng loạt cải tiến mới về ngoại h&igrave;nh b&ecirc;n ngo&agrave;i lẫn hiệu năng b&ecirc;n trong, mang đến trải nghiệm vượt bật cho người d&ugrave;ng.</h3>\n<h3>Chip Dimensity 900 5G hiệu năng ổn định</h3>\n<p>OPPO Reno6 được trang bị vi xử l&yacute; MediaTek Dimensity 900 đ&aacute;p ứng mọi nhu cầu giải tr&iacute; h&agrave;ng ng&agrave;y, c&oacute; thể chơi tất cả c&aacute;c game phổ biến hiện nay, tạo ấn tượng rất mạnh mẽ cho người d&ugrave;ng trải nghiệm mượt m&agrave; với cấu h&igrave;nh ổn định.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236186/oppo-reno6-1.jpg\" alt=\"\" /></p>\n<p>M&aacute;y hỗ trợ hệ điều h&agrave;nh Android 11 được cải tiến với nhiều t&iacute;nh năng vượt trội. Đi k&egrave;m đ&oacute; l&agrave;&nbsp;<a title=\"Tham khảo điện thoại RAM 8 GB trở l&ecirc;n ch&iacute;nh h&atilde;ng tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-ram-8gb-tro-len\" target=\"_blank\" rel=\"noopener\">RAM 8 GB</a>&nbsp;cho đa nhiệm thoải m&aacute;i nhiều ứng dụng c&ugrave;ng một l&uacute;c.&nbsp;<a title=\"Tham khảo về điện thoại c&oacute; bộ nhớ trong 128 đến 256 GB tại TGDĐ\" href=\"https://www.thegioididong.com/dtdd-rom-128-den-256gb\" target=\"_blank\" rel=\"noopener\">Bộ nhớ trong 128 GB</a>&nbsp;cho bạn thoải m&aacute;i tải những tệp nặng v&agrave; những tựa game y&ecirc;u th&iacute;ch dễ d&agrave;ng hơn.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236186/oppo-reno6-2.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Theo xu hướng hiện nay th&igrave; OPPO Reno6 cũng được trang bị kết nối mạng 5G hiện đại với tốc độ truyền tải dữ liệu nhanh hơn gấp nhiều lần 4G, tải mọi game v&agrave; ứng dụng nặng đều kh&ocirc;ng thể l&agrave;m kh&oacute; được sự mạnh mẽ n&agrave;y.</p>\n<h3>Trải nghiệm th&uacute; vị c&ugrave;ng những bộ ảnh cực chất</h3>\n<p>Mặt sau của OPPO Reno6 sở hữu cụm 3 camera bao gồm: Cảm biến ch&iacute;nh 64 MP,&nbsp;<a title=\"Tham khảo điện thoại camera g&oacute;c si&ecirc;u rộng ch&iacute;nh h&atilde;ng tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-camera-goc-rong\" target=\"_blank\" rel=\"noopener\">camera g&oacute;c si&ecirc;u rộng</a>&nbsp;8 MP,&nbsp;<a title=\"Tham khảo về điện thoại c&oacute; camera macro tại TGDĐ\" href=\"https://www.thegioididong.com/dtdd-camera-macro\" target=\"_blank\" rel=\"noopener\">camera macro</a>&nbsp;2 MP gi&uacute;p người d&ugrave;ng thoải m&aacute;i sử dụng ghi lại những khoảnh khắc h&agrave;ng ng&agrave;y.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236186/oppo-reno6-4.jpg\" alt=\"\" /></p>\n<p>Thiết bị cũng hỗ trợ nhiều chế độ chụp ảnh th&uacute; vị kh&aacute;c như, HDR, chụp x&oacute;a ph&ocirc;ng, quay phim 4K, hỗ trợ quay video Full HD,... đ&aacute;p ứng tốt nhu cầu sử dụng th&ocirc;ng thường.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236186/oppo-reno6-5.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Mặt trước còn được trang bị camera selfie có đ&ocirc;̣ ph&acirc;n giải 32 MP,&nbsp; h&ocirc;̃ trợ tính năng tự động lấy n&eacute;t v&agrave; nhận diện khu&ocirc;n mặt th&ocirc;ng minh giúp người dùng có những bức ảnh chụp trọn vẹn v&agrave; đẹp mắt nhất.</p>\n<h3>Thiết kế thời thượng, đẳng cấp</h3>\n<p>Vẻ ngo&agrave;i mảnh mai v&agrave; thon gọn đến bất ngờ với trọng lượng chỉ 182 g cho bạn cầm nắm thoải m&aacute;i, bỏ t&uacute;i hay cặp đều tiện lợi.</p>\n<p>Reno6 c&oacute; điểm nổi bật so với thế hệ trước l&agrave; thiết kế nguy&ecirc;n khối vu&ocirc;ng vức kh&aacute; giống với&nbsp;<a title=\"Tham khảo th&ocirc;ng tin iPhone 12 tại thegioididong.com\" href=\"https://www.thegioididong.com/dtdd/iphone-12\" target=\"_blank\" rel=\"noopener\">iPhone 12</a>, mặt sau của m&aacute;y được&nbsp;phủ một lớp nh&aacute;m mờ cho độ b&aacute;m v&acirc;n tay &iacute;t hơn, kh&ocirc;ng bị trơn trượt trong qu&aacute; tr&igrave;nh sử dụng, tạo n&ecirc;n sự sang trọng khi mang theo b&ecirc;n m&igrave;nh.&nbsp;</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236186/oppo-reno6-8.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<h3>Giải tr&iacute; sống động m&agrave;n h&igrave;nh Full HD+</h3>\n<p>Sử dụng c&ocirc;ng nghệ m&agrave;n h&igrave;nh AMOLED với k&iacute;ch thước&nbsp;<a title=\"Tham khảo điện thoại 6 inch trở l&ecirc;n ch&iacute;nh h&atilde;ng tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-tu-6-inch\" target=\"_blank\" rel=\"noopener\">6.43 inch</a>&nbsp;c&ugrave;ng độ s&aacute;ng tối đa 750 nits cho t&aacute;i tạo m&agrave;u v&agrave; độ ch&acirc;n thực cao hơn, h&igrave;nh ảnh n&eacute;t hơn, độ tương phản cao gi&uacute;p người d&ugrave;ng c&oacute; thể sử dụng điện thoại dưới mọi điều kiện s&aacute;ng v&agrave; g&oacute;c nh&igrave;n rộng hơn đ&aacute;ng kể.&nbsp;</p>\n<p>Mặt k&iacute;nh của OPPO Reno6 được trang bị k&iacute;nh cường lực Corning Gorilla Glass 5 chịu &aacute;p lực cao khi va chạm v&agrave;o bề mặt cứng cho bạn y&ecirc;n t&acirc;m hơn khi bỏ cặp hay t&uacute;i quần.</p>\n<p>Hỗ trợ<a title=\"Tham khảo về điện thoại bảo mật v&acirc;n tay tại TGDĐ\" href=\"https://www.thegioididong.com/dtdd-bao-mat-van-tay\" target=\"_blank\" rel=\"noopener\">&nbsp;bảo mật v&acirc;n tay</a>&nbsp;dưới m&agrave;n h&igrave;nh cho ph&eacute;p người d&ugrave;ng chỉ cần thao t&aacute;c một chạm nhẹ nh&agrave;ng để mở kh&oacute;a m&agrave;n h&igrave;nh, nhanh ch&oacute;ng v&agrave;&nbsp; tiện lợi m&agrave; kh&ocirc;ng ảnh hưởng đến vẻ thẩm mỹ của chiếc smartphone.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/236186/oppo-reno6-10.jpg\" alt=\"\" /></p>\n<p>Ngo&agrave;i ra, m&agrave;n h&igrave;nh tần số qu&eacute;t&nbsp; 90 Hz v&agrave; tốc độ lấy mẫu cảm ứng từ 180 Hz, mang đến độ mượt m&agrave; trong trải nghiệm.</p>\n<h3>Cả ng&agrave;y tr&agrave;n đầy năng lượng</h3>\n<p>Reno6 sở hữu cho m&igrave;nh vi&ecirc;n pin tương đối khủng, dung lượng&nbsp;<a title=\"Tham khảo về điện thoại c&oacute; dung lượng pin từ 3000 đến 5000 mAh tại TGDĐ\" href=\"https://www.thegioididong.com/dtdd-pin-3000-den-5000-mah\" target=\"_blank\" rel=\"noopener\">4300 mAh</a>. Như vậy việc sử dụng để quay phim, chụp ảnh li&ecirc;n tục l&ecirc;n đến nhiều tiếng kh&ocirc;ng phải l&agrave; qu&aacute; kh&oacute; khăn với chiếc m&aacute;y n&agrave;y.</p>\n<p>M&aacute;y c&ograve;n được trang bị c&ocirc;ng nghệ&nbsp;<a title=\"Tham khảo điện thoại sạc nhanh ch&iacute;nh h&atilde;ng tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-sac-pin-nhanh\" target=\"_blank\" rel=\"noopener\">sạc nhanh</a>&nbsp;65 W, thời gian sạc si&ecirc;u nhanh chỉ với v&agrave;i chục ph&uacute;t, thả ga sử dụng trong một thời gian d&agrave;i m&agrave; đợi kh&ocirc;ng qu&aacute; l&acirc;u.</p>\n<p>T&oacute;m lại, chỉ với gi&aacute; tầm trung bạn đ&atilde; c&oacute; trong tay một chiếc điện thoại c&ugrave;ng nhiều t&iacute;nh năng hấp dẫn, đ&aacute;p ứng c&aacute;c nhu cầu kh&aacute;c nhau, hứa hẹn sẽ l&agrave; mẫu Smartphone ph&ugrave; hợp với nhiều người tin d&ugrave;ng.</p>', 7, 1, 178, 17, '2022-03-01 22:34:35', 0, 5, 1),
(13, 'OPPO Reno5 5G', '<table style=\"border-collapse: collapse; width: 99.975%;\" border=\"1\">\n<tbody>\n<tr>\n<td style=\"width: 14.4649%;\">C&oacute; thuế VAT</td>\n<td style=\"width: 85.5095%;\">C&oacute;</td>\n</tr>\n<tr>\n<td style=\"width: 14.4649%;\">Thương hiệu</td>\n<td style=\"width: 85.5095%;\">OPPO</td>\n</tr>\n<tr>\n<td style=\"width: 14.4649%;\">K&iacute;ch thước</td>\n<td style=\"width: 85.5095%;\">\n<p>D&agrave;i 159.1 mm - Ngang 73.4 mm - D&agrave;y 7.9 mm - Nặng 180 g</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 14.4649%;\">FM radio</td>\n<td style=\"width: 85.5095%;\">Kh&ocirc;ng</td>\n</tr>\n<tr>\n<td style=\"width: 14.4649%;\">Phụ kiện đi k&egrave;m</td>\n<td style=\"width: 85.5095%;\">\n<p>Bộ sản phẩm gồm: Hộp, S&aacute;ch hướng dẫn, C&acirc;y lấy sim, Ốp lưng, C&aacute;p Type C, Củ sạc nhanh rời đầu Type A, Tai nghe d&acirc;y</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 14.4649%;\">Jack tai nghe</td>\n<td style=\"width: 85.5095%;\">3.5 mm</td>\n</tr>\n<tr>\n<td style=\"width: 14.4649%;\">Bộ nhớ khả dụng</td>\n<td style=\"width: 85.5095%;\">128 GB</td>\n</tr>\n<tr>\n<td style=\"width: 14.4649%;\">Số sim</td>\n<td style=\"width: 85.5095%;\">2</td>\n</tr>\n<tr>\n<td style=\"width: 14.4649%;\">Loại pin</td>\n<td style=\"width: 85.5095%;\">Li-po</td>\n</tr>\n<tr>\n<td style=\"width: 14.4649%;\">Loại Sim</td>\n<td style=\"width: 85.5095%;\">Nano</td>\n</tr>\n<tr>\n<td style=\"width: 14.4649%;\">Cổng sạc</td>\n<td style=\"width: 85.5095%;\">Type-C</td>\n</tr>\n<tr>\n<td style=\"width: 14.4649%;\">Trọng lượng</td>\n<td style=\"width: 85.5095%;\">180 g</td>\n</tr>\n<tr>\n<td style=\"width: 14.4649%;\">Wifi</td>\n<td style=\"width: 85.5095%;\">Wi-Fi 802.11 a/b/g/n/ac</td>\n</tr>\n</tbody>\n</table>', '<h3><a title=\"Tham khảo sản phẩm điện thoại OPPO tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-oppo\" target=\"_blank\" rel=\"noopener\">OPPO</a>&nbsp;đ&atilde; tr&igrave;nh l&agrave;ng&nbsp;<a title=\"Tham khảo sản phẩm điện thoại OPPO Reno5 5G tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd/oppo-reno5-5g\" target=\"_blank\" rel=\"noopener\">OPPO Reno5 5G</a>&nbsp;phi&ecirc;n bản kết nối&nbsp;<a title=\"Mạng 5G l&agrave; g&igrave;? C&oacute; những ưu điểm g&igrave; so với 4G?\" href=\"https://www.thegioididong.com/hoi-dap/mang-5g-la-gi-co-nhung-uu-diem-gi-so-voi-4g-1312277\" target=\"_blank\" rel=\"noopener\">5G</a>&nbsp;internet si&ecirc;u nhanh ra thị trường. Chiếc&nbsp;<a title=\"Tham khảo c&aacute;c sản phẩm điện thoại tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">điện thoại</a>&nbsp;với h&agrave;ng loạt c&aacute;c t&iacute;nh năng nổi bật c&ugrave;ng vẻ ngo&agrave;i thời thượng gi&uacute;p t&ocirc;n l&ecirc;n vẻ sang trọng cho người sở hữu.</h3>\n<h3>Từng đường n&eacute;t lấp l&aacute;nh, tỏa s&aacute;ng</h3>\n<p>OPPO Reno5 5G c&oacute; cấu tạo c&aacute;c khung viền xung quanh ho&agrave;n to&agrave;n bằng kim loại cao cấp, mặt lưng l&agrave;m từ nhựa. Chiếc điện thoại được thiết kế tổng thể&nbsp;<a title=\"T&igrave;m hiểu c&aacute;c kiểu thiết kế tr&ecirc;n di động v&agrave; m&aacute;y t&iacute;nh bảng\" href=\"https://www.thegioididong.com/tin-tuc/tim-hieu-cac-kieu-thiet-ke-tren-di-dong-va-may-tin-597153#nguyenkhoi\" target=\"_blank\" rel=\"noopener\">nguy&ecirc;n khối</a>&nbsp;v&ocirc; c&ugrave;ng rắn chắc v&agrave; bo cong mềm mại ở 4 g&oacute;c, mang đến người d&ugrave;ng cảm gi&aacute;c cầm nắm thoải m&aacute;i nhất.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/233460/a22.jpg\" alt=\"\" width=\"1020\" height=\"680\" /></p>\n<p>Reno5 5G chỉ sở hữu 2 phi&ecirc;n bản m&agrave;u sắc một c&aacute;ch tối giản cho người d&ugrave;ng lựa chọn l&agrave;: M&agrave;u bạc v&agrave; đen. Trong đ&oacute;, lớp vỏ của m&agrave;u bạc được phủ kết hợp giữa lớp k&iacute;nh Reno Glow v&agrave; lớp nano Picasus cho sắc &aacute;nh kim cương tr&ecirc;n th&acirc;n m&aacute;y, m&agrave;u đen th&igrave; thanh lịch v&agrave; đơn giản.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/233460/a16.jpg\" alt=\"\" /></p>\n<p>Chiếc điện thoại sở hữu 4 ống k&iacute;nh mặt sau v&agrave; đ&egrave;n LED flash được sắp xếp một c&aacute;ch tinh tế, nằm gọn trong khu&ocirc;n h&igrave;nh chữ nhật, c&ugrave;ng một ống k&iacute;nh selfie với thiết kế đục lỗ sang trọng nằm b&ecirc;n tr&aacute;i m&agrave;n h&igrave;nh.</p>\n<h3>Đem đến sự ch&acirc;n thật trong từng khung h&igrave;nh&nbsp;</h3>\n<p>Reno5 5G trang bị tấm nền&nbsp;<a title=\"M&agrave;n h&igrave;nh AMOLED l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/hoi-dap/man-hinh-amoled-la-gi-905766\" target=\"_blank\" rel=\"noopener\">AMOLED</a>&nbsp;mang khả năng t&aacute;i tạo m&agrave;u sắc tốt, h&igrave;nh ảnh sắc n&eacute;t v&agrave; rực rỡ, ngo&agrave;i ra c&ograve;n tiết kiệm điện năng đ&aacute;ng kể. C&ocirc;ng nghệ m&agrave;n h&igrave;nh cao cấp sẽ cho người d&ugrave;ng những trải nghiệm tuyệt vời ngay khi nhấc smartphone của bạn l&ecirc;n.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/233460/a10.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>M&agrave;n h&igrave;nh của OPPO Reno5 5G c&oacute; độ ph&acirc;n giải&nbsp;<a title=\"Độ ph&acirc;n giải m&agrave;n h&igrave;nh qHD, HD, FullHD, 2K, 4K l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/tin-tuc/do-phan-giai-man-hinh-qhd-hd-fullhd-2k-4k-la-gi--592178#fullhd\" target=\"_blank\" rel=\"noopener\">Full HD+</a>&nbsp;n&eacute;t đến từng chi tiết, k&iacute;ch thước rộng 6.43 inch cho kh&ocirc;ng gian hiển thị thoải m&aacute;i, &ldquo;đ&atilde; mắt&rdquo; nhất. Từ đ&oacute;, những thao t&aacute;c tr&ecirc;n m&aacute;y được dễ d&agrave;ng v&agrave; l&ocirc;i cuốn.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/233460/a7.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Khởi động nhanh ch&oacute;ng v&agrave; bảo mật tuyệt đối với t&iacute;nh năng&nbsp;<a title=\"Tham khảo c&aacute;c sản phẩm điện thoại mở kh&oacute;a v&acirc;n tay tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-bao-mat-van-tay\" target=\"_blank\" rel=\"noopener\">bảo mật v&acirc;n tay</a>&nbsp;v&agrave;&nbsp;<a title=\"Tham khảo c&aacute;c sản phẩm điện thoại bảo mật khu&ocirc;n mặt tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-bao-mat-khuon-mat\" target=\"_blank\" rel=\"noopener\">bảo mật khu&ocirc;n mặt</a>&nbsp;người d&ugrave;ng c&oacute; thể lựa chọn phương ph&aacute;p thuận tiện nhất với m&igrave;nh.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/233460/a8.jpg\" alt=\"\" /></p>\n<p>Bảo vệ vẻ đẹp xuất sắc của m&agrave;n h&igrave;nh Reno5 5G bằng&nbsp;<a title=\"T&igrave;m hiểu k&iacute;nh cường lực smartphone - Corning Gorilla Glass 3+\" href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-kinh-cuong-luc-smartphone-corning-gorilla-glass-3-1288806\" target=\"_blank\" rel=\"noopener\">k&iacute;nh cường lực Corning Gorilla Glass 3+</a>&nbsp;được n&acirc;ng cấp cao khả năng chống chịu va đập, trầy xước v&agrave; độ bền theo thời gian mang đến cho bạn chiếc điện thoại chắc chắn, khỏe khoắn.</p>\n<h3>Reno5 5G chi&ecirc;u mộ mọi t&iacute;nh đồ chụp ảnh, checkin hay blogger</h3>\n<p>OPPO đ&atilde; trang bị một hệ thống m&aacute;y ảnh xuất sắc cho chiếc điện thoại của m&igrave;nh gồm 4 ống k&iacute;nh mặt sau bắt mắt. Camera ch&iacute;nh c&oacute; độ ph&acirc;n giải l&ecirc;n đến 64 MP,&nbsp;<a title=\"Camera g&oacute;c rộng, g&oacute;c si&ecirc;u rộng tr&ecirc;n smartphone l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/hoi-dap/camera-goc-rong-goc-sieu-rong-tren-smartphone-la-1172240\" target=\"_blank\" rel=\"noopener\">camera g&oacute;c si&ecirc;u rộng</a>&nbsp;8 MP, camera macro 2 MP v&agrave; camera đơn sắc 2 MP.&nbsp;</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/233460/a5.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>D&agrave;n m&aacute;y ảnh nh&agrave; OPPO sở hữu tất cả c&aacute;c t&iacute;nh năng hỗ trợ l&agrave;m đẹp v&agrave; chỉnh sửa tối ưu nhất, cho bạn những bức ảnh ho&agrave;n hảo đến từng đường n&eacute;t.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/233460/a6.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>OPPO Reno5 5G sở hữu trọn vẹn c&aacute;c t&iacute;nh năng quay phim với nhiều chế độ kh&aacute;c nhau từ c&ocirc;ng nghệ si&ecirc;u chống rung đến video hiển thị k&eacute;p gi&uacute;p bạn kh&ocirc;ng bỏ lỡ bất kỳ hoạt động đ&aacute;ng nhớ n&agrave;o.</p>\n<p>M&aacute;y ảnh selfie mặt trước c&oacute; độ ph&acirc;n giải l&ecirc;n đến 32 MP, với th&ocirc;ng số lớn n&agrave;y camera selfie của Reno5 5G tự h&agrave;o mang những t&iacute;nh năng tốt kh&ocirc;ng thua k&eacute;m g&igrave; với d&agrave;n camera của mặt sau. Hỗ trợ&nbsp;<a title=\"Chế độ l&agrave;m đẹp (Beautify) tr&ecirc;n smartphone, tablet l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/hoi-dap/che-do-lam-dep-beautify-tren-smartphone-tablet-1172231\" target=\"_blank\" rel=\"noopener\">l&agrave;m đẹp</a>&nbsp;nổi bật l&ecirc;n vẻ thanh t&uacute; v&agrave; tự nhi&ecirc;n tr&ecirc;n khu&ocirc;n mặt bạn.</p>\n<h3><a title=\"T&igrave;m hiểu bộ xử l&yacute; 5G tầm trung Snapdragon 765 / 765G\" href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-bo-xu-ly-5g-tam-trung-snapdragon-765-765g-1237824\" target=\"_blank\" rel=\"noopener\">Snapdragon 765G 8 nh&acirc;n</a>&nbsp;phi&ecirc;n bản chuy&ecirc;n game vượt trội</h3>\n<p>D&ograve;ng chipset 5G tầm trung được trang bị tr&ecirc;n Reno5 5G được ph&aacute;t triển tập trung v&agrave;o hiệu năng gaming mạnh mẽ, bộ xử l&yacute; đồ họa Adreno 620 cung cấp h&igrave;nh ảnh tr&ecirc;n game r&otilde; r&agrave;ng, ch&acirc;n thực.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/233460/765g.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Khi được kiểm tra qua phần mềm Antutu, m&aacute;y cho ra kết quả kh&aacute; ấn tượng với 313.957 điểm ho&agrave;n to&agrave;n đ&aacute;p ứng đủ c&aacute;c t&aacute;c vụ nặng đến từ người d&ugrave;ng, c&aacute;c tựa game đồ hoạ cũng kh&ocirc;ng thể l&agrave;m kh&oacute; được Reno5 5G.</p>\n<p>Kết hợp với&nbsp;<a title=\"Tham khảo điện thoại c&oacute; RAM 8 GB tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-ram-8gb\" target=\"_blank\" rel=\"noopener\">RAM 8 GB</a>&nbsp;cho tốc độ xử l&yacute; cao v&agrave; nhạy, khả năng đa nhiệm mượt m&agrave; v&agrave;&nbsp;<a title=\"Tham khảo điện thoại c&oacute; bộ nhớ 128 GB tại Thegioididong.com\" href=\"https://www.thegioididong.com/dtdd-rom-128gb\" target=\"_blank\" rel=\"noopener\">bộ nhớ trong 128 GB</a>&nbsp;rộng mở dung lượng lưu trữ c&aacute;c th&ocirc;ng tin, ứng dụng, h&igrave;nh ảnh,... m&agrave; bạn cần thiết.</p>\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/233460/a11.jpg\" alt=\"\" width=\"800\" height=\"533\" /></p>\n<p>Trang bị c&ocirc;ng nghệ loa Dolby Atmos &acirc;m thanh sống động, l&ocirc;i cuốn đến từ rạp phim, smartphone mang đến trải nghiệm giải tr&iacute; cảm hứng nhất cho người d&ugrave;ng.</p>\n<h3>Thời đại của c&ocirc;ng nghệ kết nối si&ecirc;u tốc</h3>\n<p>OPPO Reno5 5G hỗ trợ kết nối 5G tốc độ cao cho khả năng tải xuống, đăng l&ecirc;n nhanh tức th&igrave;, người ti&ecirc;u d&ugrave;ng c&oacute; quyền truy cập v&agrave;o bất cứ trải nghiệm chất lượng vượt trội n&agrave;o tr&ecirc;n mạng, c&aacute;c trang phim, trang game,... Reno5 5G đều đ&aacute;p ứng nhanh ch&oacute;ng v&agrave; mượt m&agrave;.</p>\n<h3>SuperVOOC sạc si&ecirc;u nhanh an to&agrave;n v&agrave; tiện lợi</h3>\n<p>Vi&ecirc;n pin&nbsp;<a title=\"So s&aacute;nh pin Li ion v&agrave; pin Li Po\" href=\"https://www.thegioididong.com/hoi-dap/so-sanh-pin-li-ion-va-pin-li-po-651833#lipo\" target=\"_blank\" rel=\"noopener\">Li-Po</a>&nbsp;của Reno5 5G c&oacute; dung lượng 4300 mAh kh&aacute; lớn, smartphone dễ d&agrave;ng đ&aacute;p ứng c&aacute;c nhu cầu hoạt động tr&ecirc;n m&aacute;y suốt cả ng&agrave;y.&nbsp;</p>\n<p>Học tập, l&agrave;m việc v&agrave; giải tr&iacute; thả ga với sự hỗ trợ của&nbsp;<a title=\"T&igrave;m hiểu sạc si&ecirc;u nhanh Super VOOC tr&ecirc;n điện thoại OPPO\" href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-sac-sieu-nhanh-super-vooc-tren-dien-thoai-1172435\" target=\"_blank\" rel=\"noopener\">sạc si&ecirc;u nhanh SuperVOOC</a>&nbsp;l&ecirc;n đến 65 W. Sạc đầy 60% pin chỉ trong 15 ph&uacute;t, đầy 100% pin chỉ trong 35 ph&uacute;t c&ugrave;ng với chế độ&nbsp;<a title=\"Chế độ tiết kiệm pin v&agrave; si&ecirc;u tiết kiệm pin tr&ecirc;n điện thoại l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/hoi-dap/che-do-tiet-kiem-pin-va-sieu-tiet-kiem-pin-tren-dien-thoai-926730\" target=\"_blank\" rel=\"noopener\">tiết kiệm pin</a>&nbsp;gi&uacute;p k&eacute;o d&agrave;i thời gian sử dụng cho bạn bất tận c&ugrave;ng những niềm vui.&nbsp;</p>\n<p>OPPO Reno5 5G mang năng lượng v&agrave; hiệu năng v&ocirc; c&ugrave;ng vượt trội với những t&iacute;nh năng hiện đại nhất từ OPPO, hệ thống camera chất lượng ho&agrave;n hảo, m&agrave;n h&igrave;nh sắc n&eacute;t đi k&egrave;m hiệu năng tốt hứa hẹn sẽ ph&ugrave; hợp với đa dạng người ti&ecirc;u d&ugrave;ng.</p>', 7, 1, 178, 16, '2022-03-01 22:45:41', 0, 5, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product_image`
--

INSERT INTO `product_image` (`id`, `image`, `product_id`) VALUES
(25, 'http://localhost:8000/images/products/1645887482122samsung-galaxy-a22-4g-mint-1-600x600.jpg', 5),
(26, 'http://localhost:8000/images/products/1645887482097samsung-galaxy-a22-4g-mint-1-1.jpg', 5),
(27, 'http://localhost:8000/images/products/1645887482130samsung-galaxy-a22-4g-mint-2-1.jpg', 5),
(28, 'http://localhost:8000/images/products/1645887482106samsung-galaxy-a22-4g-mint-3-1.jpg', 5),
(29, 'http://localhost:8000/images/products/1645887482111samsung-galaxy-a22-4g-mint-4-1.jpg', 5),
(30, 'http://localhost:8000/images/products/1645887482117samsung-galaxy-a22-4g-mint-5-1.jpg', 5),
(31, 'http://localhost:8000/images/products/1645888203900samsung-galaxy-a12-2021-blue-600x600.jpg', 6),
(32, 'http://localhost:8000/images/products/1645888203916samsung-galaxy-a12-xanh-duong-1.jpg', 6),
(33, 'http://localhost:8000/images/products/1645888203920samsung-galaxy-a12-xanh-duong-2.jpg', 6),
(34, 'http://localhost:8000/images/products/1645888203903samsung-galaxy-a12-xanh-duong-3.jpg', 6),
(35, 'http://localhost:8000/images/products/1645888203910samsung-galaxy-a12-xanh-duong-4.jpg', 6),
(36, 'http://localhost:8000/images/products/1645888203913samsung-galaxy-a12-xanh-duong-5.jpg', 6),
(37, 'http://localhost:8000/images/products/1645888203930samsung-galaxy-a12-xanh-duong-6.jpg', 6),
(48, 'http://localhost:8000/images/products/1645781840935iphone-13-pro-sierra-blue-600x600.jpg', 4),
(49, 'http://localhost:8000/images/products/1645781840932iphone-13-pro-xam-4.jpg', 4),
(50, 'http://localhost:8000/images/products/1645781840942iphone-13-pro-xam-5.jpg', 4),
(51, 'http://localhost:8000/images/products/1645781840921iphone-13-pro-blue-2.jpg', 4),
(52, 'http://localhost:8000/images/products/1645781840930iphone-13-pro-blue-3.jpg', 4),
(53, 'http://localhost:8000/images/products/1645781840946iphone-13-pro-blue-4.jpg', 4),
(54, 'http://localhost:8000/images/products/1645781840924iphone-13-pro-xam-1.jpg', 4),
(55, 'http://localhost:8000/images/products/1645781840927iphone-13-pro-xam-2.jpg', 4),
(56, 'http://localhost:8000/images/products/1646145318969vivo-x70-pro-xanh-hong-1-600x600.jpg', 8),
(57, 'http://localhost:8000/images/products/1646145318912vivo-x70-pro-xanh-1-1.jpg', 8),
(58, 'http://localhost:8000/images/products/1646145318937vivo-x70-pro-xanh-4-1.jpg', 8),
(59, 'http://localhost:8000/images/products/1646145318971vivo-x70-pro-xanh-5-1.jpg', 8),
(60, 'http://localhost:8000/images/products/1646145318917vivo-x70-pro-xanh-6-1.jpg', 8),
(61, 'http://localhost:8000/images/products/1646145318923vivo-x70-pro-xanh-7-1.jpg', 8),
(62, 'http://localhost:8000/images/products/1646145318927vivo-x70-pro-xanh-8-1.jpg', 8),
(63, 'http://localhost:8000/images/products/1646145318932vivo-x70-pro-xanh-9-1.jpg', 8),
(64, 'http://localhost:8000/images/products/1646145318960vivo-x70-pro-xanh-10-1.jpg', 8),
(65, 'http://localhost:8000/images/products/1646145318965vivo-x70-pro-xanh-11-1.jpg', 8),
(66, 'http://localhost:8000/images/products/1646146386003vivo-v21-5g-xanh-den-600x600.jpg', 9),
(67, 'http://localhost:8000/images/products/1646146385972vivo-v21-5g-xanh-den-1-org.jpg', 9),
(68, 'http://localhost:8000/images/products/1646146385979vivo-v21-5g-xanh-den-4-org.jpg', 9),
(69, 'http://localhost:8000/images/products/1646146386013vivo-v21-5g-xanh-den-5-org.jpg', 9),
(70, 'http://localhost:8000/images/products/1646146386009vivo-v21-5g-xanh-den-6-org.jpg', 9),
(71, 'http://localhost:8000/images/products/1646146386034vivo-v21-5g-xanh-den-7-org.jpg', 9),
(72, 'http://localhost:8000/images/products/1646146385976vivo-v21-5g-xanh-den-8-org.jpg', 9),
(73, 'http://localhost:8000/images/products/1646146385982vivo-v21-5g-xanh-den-9-org.jpg', 9),
(74, 'http://localhost:8000/images/products/1646146385986vivo-v21-5g-xanh-den-10-org.jpg', 9),
(75, 'http://localhost:8000/images/products/1646146385989vivo-v21-5g-xanh-den-11-org.jpg', 9),
(76, 'http://localhost:8000/images/products/1646147128681vivo-V23-5G-5-1-2-600x600.jpg', 10),
(77, 'http://localhost:8000/images/products/1646147128698vivo-v23-5g-vang-1.jpg', 10),
(78, 'http://localhost:8000/images/products/1646147128730vivo-v23-5g-vang-4.jpg', 10),
(79, 'http://localhost:8000/images/products/1646147128688vivo-v23-5g-vang-5.jpg', 10),
(80, 'http://localhost:8000/images/products/1646147128691vivo-v23-5g-vang-6.jpg', 10),
(81, 'http://localhost:8000/images/products/1646147128695vivo-v23-5g-vang-9.jpg', 10),
(82, 'http://localhost:8000/images/products/1646147128710vivo-v23-5g-vang-10.jpg', 10),
(83, 'http://localhost:8000/images/products/1646147128702vivo-v23-5g-vang-11.jpg', 10),
(84, 'http://localhost:8000/images/products/1646147128726vivo-v23-5g-vang-12.jpg', 10),
(85, 'http://localhost:8000/images/products/1645780767456iphone-12-pro-max-xam-new-600x600.jpg', 3),
(86, 'http://localhost:8000/images/products/1645780767445iphone-12-pro-max-xam-1-org.jpg', 3),
(87, 'http://localhost:8000/images/products/1645780767454iphone-12-pro-max-xam-2-org.jpg', 3),
(88, 'http://localhost:8000/images/products/1645780767482iphone-12-pro-max-xam-3-org.jpg', 3),
(89, 'http://localhost:8000/images/products/1645780767460iphone-12-pro-max-xam-4-org.jpg', 3),
(90, 'http://localhost:8000/images/products/1645780767449iphone-12-pro-max-xam-5-org.jpg', 3),
(91, 'http://localhost:8000/images/products/1645780767464iphone-12-pro-max-xam-6-org.jpg', 3),
(92, 'http://localhost:8000/images/products/1646147761743iphone-12-pro-max-xam-10-org.jpg', 3),
(93, 'http://localhost:8000/images/products/1646147761746iphone-12-pro-max-xam-11-org.jpg', 3),
(94, 'http://localhost:8000/images/products/1646147761750iphone-12-pro-max-xam-12-org.jpg', 3),
(95, 'http://localhost:8000/images/products/1646147985367vivo-y72-5g-blue-600x600.jpg', 11),
(96, 'http://localhost:8000/images/products/1646147985383vivo-y72-5g-xanh-hong-1-1-org.jpg', 11),
(97, 'http://localhost:8000/images/products/1646147985392vivo-y72-5g-xanh-hong-4-1-org.jpg', 11),
(98, 'http://localhost:8000/images/products/1646147985370vivo-y72-5g-xanh-hong-5-1-org.jpg', 11),
(99, 'http://localhost:8000/images/products/1646147985375vivo-y72-5g-xanh-hong-6-1-org.jpg', 11),
(100, 'http://localhost:8000/images/products/1646147985379vivo-y72-5g-xanh-hong-7-1-org.jpg', 11),
(101, 'http://localhost:8000/images/products/1646147985381vivo-y72-5g-xanh-hong-8-1-org.jpg', 11),
(102, 'http://localhost:8000/images/products/1646147985413vivo-y72-5g-xanh-hong-9-1-org.jpg', 11),
(103, 'http://localhost:8000/images/products/1646147985410vivo-y72-5g-xanh-hong-10-1-org.jpg', 11),
(104, 'http://localhost:8000/images/products/1646147985417vivo-y72-5g-xanh-hong-11-1-org.jpg', 11),
(105, 'http://localhost:8000/images/products/1646148577053oppo-reno6-5g-black-600x600.jpg', 12),
(106, 'http://localhost:8000/images/products/1646148577088oppo-reno6-den-1-org.jpg', 12),
(107, 'http://localhost:8000/images/products/1646148577130oppo-reno6-den-4-org.jpg', 12),
(108, 'http://localhost:8000/images/products/1646148577134oppo-reno6-den-5-org.jpg', 12),
(109, 'http://localhost:8000/images/products/1646148577057oppo-reno6-den-6-org.jpg', 12),
(110, 'http://localhost:8000/images/products/1646148577061oppo-reno6-den-8-org.jpg', 12),
(111, 'http://localhost:8000/images/products/1646148577065oppo-reno6-den-11-org.jpg', 12),
(112, 'http://localhost:8000/images/products/1646148577070oppo-reno6-den-12-org.jpg', 12),
(113, 'http://localhost:8000/images/products/1646148577075oppo-reno6-den-13-org.jpg', 12),
(114, 'http://localhost:8000/images/products/1646149124526oppo-reno5-5g-thumb-600x600.jpg', 13),
(115, 'http://localhost:8000/images/products/1646149124480oppo-reno5-5g-bac-1-org.jpg', 13),
(116, 'http://localhost:8000/images/products/1646149124497oppo-reno5-5g-bac-4-org.jpg', 13),
(117, 'http://localhost:8000/images/products/1646149124522oppo-reno5-5g-bac-5-org.jpg', 13),
(118, 'http://localhost:8000/images/products/1646149124484oppo-reno5-5g-bac-6-org.jpg', 13),
(119, 'http://localhost:8000/images/products/1646149124489oppo-reno5-5g-bac-9-org.jpg', 13),
(120, 'http://localhost:8000/images/products/1646149124492oppo-reno5-5g-bac-10-org.jpg', 13),
(121, 'http://localhost:8000/images/products/1646149124500oppo-reno5-5g-bac-11-org.jpg', 13),
(122, 'http://localhost:8000/images/products/1646149124513oppo-reno5-5g-bac-12-org.jpg', 13),
(123, 'http://localhost:8000/images/products/1646149124519oppo-reno5-5g-bac-13-org.jpg', 13);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_option`
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
-- Đang đổ dữ liệu cho bảng `product_option`
--

INSERT INTO `product_option` (`id`, `product_id`, `ram_id`, `rom_id`, `color_id`, `original_price`, `sale_price`, `quantity`, `sold_quantity`) VALUES
(39, 3, 5, 5, 10, 32900000, 31900000, 0, 0),
(40, 3, 5, 5, 3, 32900000, 31900000, 0, 0),
(41, 3, 5, 5, 5, 32900000, 31900000, 0, 0),
(42, 3, 5, 6, 10, 35900000, 34900000, 0, 0),
(43, 3, 5, 6, 3, 35900000, 34900000, 0, 0),
(44, 3, 5, 6, 5, 35900000, 34900000, 0, 0),
(45, 3, 5, 7, 10, 40900000, 38900000, 0, 0),
(46, 3, 5, 7, 3, 40900000, 38900000, 0, 0),
(47, 3, 5, 7, 5, 40900000, 38900000, 0, 0),
(48, 4, 5, 5, 10, 30900000, 29900000, 0, 0),
(49, 4, 5, 5, 3, 30900000, 29900000, 0, 0),
(50, 4, 5, 5, 5, 30900000, 29900000, 0, 0),
(51, 4, 5, 6, 10, 34900000, 31900000, 0, 0),
(52, 4, 5, 6, 3, 34900000, 31900000, 0, 0),
(53, 4, 5, 6, 5, 34900000, 31900000, 0, 0),
(54, 4, 5, 7, 10, 40900000, 39900000, 0, 0),
(55, 4, 5, 7, 3, 40900000, 39900000, 0, 0),
(56, 4, 5, 7, 5, 40900000, 39900000, 0, 0),
(57, 5, 5, 5, 6, 5890000, 5890000, 200, 0),
(58, 5, 5, 5, 12, 5890000, 5890000, 200, 0),
(59, 5, 5, 5, 2, 5890000, 5890000, 200, 0),
(60, 6, 4, 5, 3, 4290000, 4290000, 100, 0),
(61, 6, 4, 5, 9, 4290000, 4290000, 100, 0),
(62, 6, 4, 5, 2, 4290000, 4290000, 100, 0),
(63, 6, 5, 5, 3, 4690000, 4490000, 100, 0),
(64, 6, 5, 5, 9, 4690000, 4490000, 100, 0),
(65, 6, 5, 5, 2, 4690000, 4490000, 100, 0),
(67, 8, 7, 6, 1, 19990000, 18990000, 100, 0),
(68, 9, 6, 5, 14, 9990000, 9990000, 100, 0),
(69, 9, 6, 5, 15, 9990000, 9990000, 100, 0),
(70, 10, 6, 5, 7, 12990000, 11990000, 0, 0),
(71, 10, 6, 5, 14, 12990000, 11990000, 0, 0),
(72, 11, 6, 5, 8, 7990000, 7590000, 0, 0),
(73, 11, 6, 5, 2, 7990000, 7590000, 0, 0),
(74, 12, 6, 5, 2, 12990000, 11990000, 0, 0),
(75, 12, 6, 5, 5, 12990000, 11990000, 0, 0),
(76, 13, 6, 5, 5, 11990000, 8990000, 0, 0),
(77, 13, 6, 5, 2, 11990000, 8990000, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_rating`
--

CREATE TABLE `product_rating` (
  `id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ram_option`
--

CREATE TABLE `ram_option` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ram_option`
--

INSERT INTO `ram_option` (`id`, `name`, `created_date`) VALUES
(1, '1 GB', '2022-01-23 06:00:00'),
(2, '2 GB', '2022-01-23 06:00:00'),
(3, '3 GB', '2022-01-23 06:00:00'),
(4, '4 GB', '2022-01-23 06:00:00'),
(5, '6 GB', '2022-01-23 06:00:00'),
(6, '8 GB', '2022-01-23 06:00:00'),
(7, '12 GB', '2022-01-23 06:00:00'),
(8, '16 GB', '2022-03-01 22:52:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rating_image`
--

CREATE TABLE `rating_image` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `rating_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `receipt`
--

CREATE TABLE `receipt` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_price` bigint(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `receipt`
--

INSERT INTO `receipt` (`id`, `supplier_id`, `user_id`, `total_price`, `created_date`) VALUES
(6, 8, 1, 6850000000, '2022-03-04 14:01:45'),
(7, 9, 1, 1500000000, '2022-03-04 14:10:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `receipt_detail`
--

CREATE TABLE `receipt_detail` (
  `id` int(11) NOT NULL,
  `receipt_id` int(11) DEFAULT NULL,
  `product_option_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `receipt_detail`
--

INSERT INTO `receipt_detail` (`id`, `receipt_id`, `product_option_id`, `quantity`, `price`) VALUES
(22, 6, 57, 100, 5000000),
(23, 6, 58, 100, 5000000),
(24, 6, 59, 100, 5000000),
(25, 6, 60, 100, 3500000),
(26, 6, 61, 100, 3500000),
(27, 6, 62, 100, 3500000),
(28, 6, 63, 100, 4000000),
(29, 6, 64, 100, 4000000),
(30, 6, 65, 100, 4000000),
(31, 6, 67, 100, 15000000),
(32, 6, 68, 100, 8000000),
(33, 6, 69, 100, 8000000),
(34, 7, 57, 100, 5000000),
(35, 7, 58, 100, 5000000),
(36, 7, 59, 100, 5000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rom_option`
--

CREATE TABLE `rom_option` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `rom_option`
--

INSERT INTO `rom_option` (`id`, `name`, `created_date`) VALUES
(1, '8 GB', '2022-01-23 06:00:00'),
(2, '16 GB', '2022-01-23 06:00:00'),
(3, '32 GB', '2022-01-23 06:00:00'),
(4, '64 GB', '2022-01-23 06:00:00'),
(5, '128 GB', '2022-01-23 06:00:00'),
(6, '256 GB', '2022-01-23 06:00:00'),
(7, '512 GB', '2022-01-23 06:00:00'),
(8, '1 TB', '2022-02-25 15:09:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shop_info`
--

CREATE TABLE `shop_info` (
  `id` int(11) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `ward_code` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `shop_info`
--

INSERT INTO `shop_info` (`id`, `logo`, `name`, `description`, `email`, `phone_number`, `province_id`, `district_id`, `ward_code`, `address`) VALUES
(1, 'Mobile Store', 'Công ty TNHH Mobile Store', 'Kinh doanh các sản phẩm điện thoại siêu cấp, cao cấp, trung cấp và phổ thông của các hãng điện thoại như : Apple, Nokia, Sony Ericson, Black Berry, Sam Sung, LG, Lenovo,..Đáp ứng được mọi nhu cầu mua sắm của khách hàng.', 'mobilestore@gmail.com', '0989123123', 220, 1572, '550113', '123 đường 3-2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier`
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
-- Đang đổ dữ liệu cho bảng `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `phone_number`, `description`, `province_id`, `district_id`, `ward_code`, `address`, `created_date`) VALUES
(7, 'FPT Shop', '0989232323', 'Chuyển cung cấp các sản phẩm điện thoại như: Samsung, Iphone, Oppo, Nokia,...', 202, 3695, '90752', 'Lô E2a-7, Đường D1, Khu Công Nghệ Cao', '2022-02-18 19:13:33'),
(8, 'Thế Giới Di Động - Công Ty TNHH Thế Giới Di Động', '0989123123', 'Kinh doanh các sản phẩm điện thoại siêu cấp, cao cấp, trung cấp và phổ thông của các hãng điện thoại như: Apple, Nokia, Sony Ericson, Black Berry, Sam Sung, LG, Lenovo,.. Đáp ứng được mọi nhu cầu mua sắm của khách hàng.', 202, 1455, '21413', 'Phòng 6.5, Tầng 6, Tòa Nhà E. Town 2, 364', '2022-02-18 19:14:37'),
(9, 'Mai Nguyên - Công Ty TNHH Công Nghệ Di Động Mai Nguyên', '0989914912', 'Chuyên cung cấp các sản phẩm điện thoại di động của các hãng danh tiếng như: Nokia, Samsung, Sony. Mang đến cho quý khách hàng những sản phẩm chất lượng nhất cùng giá cả tốt nhất.', 202, 1463, '21810', '117 Nguyễn Bỉnh Khiêm', '2022-02-18 21:41:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
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
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `avatar`, `full_name`, `date_of_birth`, `gender`, `phone_number`, `email`, `password`, `created_date`, `role_id`) VALUES
(1, 'http://localhost:8000/images/avatars/164294239637353704701_154872398857728_8599119731749814272_n.jpg', 'Nguyễn Quốc Huy', '2000-02-04', 1, '0388235023', 'huynguyen@gmail.com', '$2b$10$2AhMLvR4Wy0nhGUiBMDYQe4WdVjw92wcgsVcQz.h3/B1dQ8VFF/Xm', '2022-01-20 16:00:00', 1),
(14, 'http://localhost:8000/images/avatars/default_avatar.png', 'Ngân Kim', NULL, NULL, '0122334455', 'ngankim@gmail.com', '$2b$10$gzvcuTndBzd0HHmaW0MLWuG8o33fILib99c7SJy7aTGgbxvZID5tq', '2022-01-29 21:13:12', 4),
(15, 'http://localhost:8000/images/avatars/default_avatar.png', 'Dương Phạm', NULL, NULL, '0123321123', 'duongpham@gmail.com', '$2b$10$77.PupDIi0bBpiak/5CvzOzXV356qCRjaPwSFWMm7Xtt0WITts.EC', '2022-01-29 21:20:54', 4),
(16, 'http://localhost:8000/images/avatars/default_avatar.png', 'Tứ Trần', NULL, NULL, '0231231123', 'tutran@gmail.com', '$2b$10$rwGuJ4MPintc1LVegtLb9.gRBy4zC0RuHAgFk.lL2som8ZASEcMaG', '2022-01-29 21:22:01', 4),
(17, 'http://localhost:8000/images/avatars/default_avatar.png', 'Trường Giang', NULL, NULL, '0891232132', 'truonggiang@gmail.com', '$2b$10$rqc4pH4tI9mOxbgt5YEfUebdCdZqjQYieor3vK/tZVcCpGpzxcGOu', '2022-02-04 20:39:10', 4),
(27, 'http://localhost:8000/images/avatars/1644842952191istockphoto-1319189527-170667a.jpg', 'Nguyễn Thị Kim Ngân', '2022-02-28', 0, '0123123123', 'kimngan@gmail.com', '$2b$10$WVEB83WVzmVDwB.t4M3B0usPgG51hGIbqE4O2js3twNYcbVX.sJm6', '2022-02-14 19:38:48', 2),
(28, 'http://localhost:8000/images/avatars/default_avatar.png', 'Nguyễn Thị Kiều Oanh', NULL, NULL, '0111123123', 'oanhnguyen@gmail.com', '$2b$10$Zx3/OHLtJEdmo/OqsT2gfe3E3V2K6dhc4Mabr1prBtTx.xN5zKjDy', '2022-02-14 19:39:33', 2),
(29, 'http://localhost:8000/images/avatars/164484250076180692018_p0_master1200.jpg', 'Nguyễn Tuấn Anh', '2000-12-31', 1, '0111222333', 'tuananh@gmail.com', '$2b$10$EqPGS.t4/Seo1kjCX3DCcOuAqpQnce9Vi8A21x5dagmUC3Mi.3vCW', '2022-02-14 19:40:48', 3),
(30, 'http://localhost:8000/images/avatars/1644842916723istockphoto-1350157725-170667a.jpg', 'Nguyễn Thị Phương Linh', '2000-12-31', 0, '0111000123', 'phuonglinh@gmail.com', '$2b$10$qE6nwxKR2gmZi/KDw0cabeJ9I3oDxEIWXyfbpRyS8e/aa9PDH8/b.', '2022-02-14 19:48:05', 2),
(31, 'http://localhost:8000/images/avatars/1644843096515istockphoto-1300658241-170667a.jpg', 'Trần Long Tứ', '1990-05-31', 1, '0123444123', 'longtu@gmail.com', '$2b$10$5xAtWeyiPJvrfmnv/hNEuOpVMjDC8yGF.Mi1aG9JQcc1FCkkrTU6K', '2022-02-14 19:51:35', 3),
(32, 'http://localhost:8000/images/avatars/1644843162012istockphoto-1307615661-170667a.jpg', 'Nguyễn Thanh Thiên', '1995-02-14', 1, '0123123321', 'thanhthien@gmail.com', '$2b$10$gxk8OvsmzIcpXT10QyKuqOXGpJjXlBaVjALCF/vGwoUOp9I2QpmeS', '2022-02-14 19:52:40', 3),
(33, 'http://localhost:8000/images/avatars/1644843332914istockphoto-1319763895-170667a.jpg', 'Johnny Đặng', '2022-02-14', 1, '0111123456', 'johnny@gmail.com', '$2b$10$MpzecdqTaT9X2VNxTVNGv.ZtxIUiBr4KnmYkRdfPbnULd1bv2R30C', '2022-02-14 19:55:31', 2),
(34, 'http://localhost:8000/images/avatars/1644843643597pexels-photo-556666.jpeg', 'Nguyễn Thanh Tuyết', NULL, 0, '0123123999', 'thanhtuyet@gmail.com', '$2b$10$iuvqkWu2/nlH/e2lfkmcr..Oi6Fbp2LplbC33MdsTnWn.rKBJisAy', '2022-02-14 20:00:42', 2),
(35, 'http://localhost:8000/images/avatars/1644843726694pexels-photo-941693.jpeg', 'Trần Phàm', '2022-01-01', 1, '0123123012', 'tranpham@gmail.com', '$2b$10$SVdLNPN/nYm.uCp0CyMC7uuL8BX4VujM5upAMUwvmg0bhkmQesige', '2022-02-14 20:02:05', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_address`
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
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_role`
--

INSERT INTO `user_role` (`id`, `name`) VALUES
(4, 'Khách hàng'),
(2, 'Nhân viên bán hàng'),
(3, 'Nhân viên quản lý kho'),
(1, 'Quản trị');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `viewed_notification`
--

CREATE TABLE `viewed_notification` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_option_id` (`product_option_id`);

--
-- Chỉ mục cho bảng `color_option`
--
ALTER TABLE `color_option`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `coupons_id` (`coupons_id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_option_id` (`product_option_id`);

--
-- Chỉ mục cho bảng `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product_option`
--
ALTER TABLE `product_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `ram_id` (`ram_id`),
  ADD KEY `rom_id` (`rom_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Chỉ mục cho bảng `product_rating`
--
ALTER TABLE `product_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `ram_option`
--
ALTER TABLE `ram_option`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `rating_image`
--
ALTER TABLE `rating_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rating_id` (`rating_id`);

--
-- Chỉ mục cho bảng `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `receipt_detail`
--
ALTER TABLE `receipt_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receipt_id` (`receipt_id`),
  ADD KEY `product_option_id` (`product_option_id`);

--
-- Chỉ mục cho bảng `rom_option`
--
ALTER TABLE `rom_option`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shop_info`
--
ALTER TABLE `shop_info`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- Chỉ mục cho bảng `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `viewed_notification`
--
ALTER TABLE `viewed_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `notification_id` (`notification_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `color_option`
--
ALTER TABLE `color_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `order_tracking`
--
ALTER TABLE `order_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT cho bảng `product_option`
--
ALTER TABLE `product_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT cho bảng `product_rating`
--
ALTER TABLE `product_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ram_option`
--
ALTER TABLE `ram_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `rating_image`
--
ALTER TABLE `rating_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `receipt`
--
ALTER TABLE `receipt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `receipt_detail`
--
ALTER TABLE `receipt_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `rom_option`
--
ALTER TABLE `rom_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `shop_info`
--
ALTER TABLE `shop_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `viewed_notification`
--
ALTER TABLE `viewed_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `banner`
--
ALTER TABLE `banner`
  ADD CONSTRAINT `banner_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_option_id`) REFERENCES `product_option` (`id`);

--
-- Các ràng buộc cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`coupons_id`) REFERENCES `coupons` (`id`);

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_option_id`) REFERENCES `product_option` (`id`);

--
-- Các ràng buộc cho bảng `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD CONSTRAINT `order_tracking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `order_tracking_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `order_tracking_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product_option`
--
ALTER TABLE `product_option`
  ADD CONSTRAINT `product_option_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_option_ibfk_2` FOREIGN KEY (`ram_id`) REFERENCES `ram_option` (`id`),
  ADD CONSTRAINT `product_option_ibfk_3` FOREIGN KEY (`rom_id`) REFERENCES `rom_option` (`id`),
  ADD CONSTRAINT `product_option_ibfk_4` FOREIGN KEY (`color_id`) REFERENCES `color_option` (`id`);

--
-- Các ràng buộc cho bảng `product_rating`
--
ALTER TABLE `product_rating`
  ADD CONSTRAINT `product_rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `product_rating_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `rating_image`
--
ALTER TABLE `rating_image`
  ADD CONSTRAINT `rating_image_ibfk_1` FOREIGN KEY (`rating_id`) REFERENCES `product_rating` (`id`);

--
-- Các ràng buộc cho bảng `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `receipt_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `receipt_detail`
--
ALTER TABLE `receipt_detail`
  ADD CONSTRAINT `receipt_detail_ibfk_1` FOREIGN KEY (`receipt_id`) REFERENCES `receipt` (`id`),
  ADD CONSTRAINT `receipt_detail_ibfk_2` FOREIGN KEY (`product_option_id`) REFERENCES `product_option` (`id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`);

--
-- Các ràng buộc cho bảng `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `viewed_notification`
--
ALTER TABLE `viewed_notification`
  ADD CONSTRAINT `viewed_notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `viewed_notification_ibfk_2` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
