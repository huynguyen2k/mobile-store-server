/* ====================== CREATE TABLES FOR DATABASE ====================== */

CREATE TABLE `USER_ROLE` (
	id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(100) NOT NULL UNIQUE
);

CREATE TABLE `USER` (
	id int PRIMARY KEY AUTO_INCREMENT,
  avatar varchar(255),
  full_name varchar(100),
  date_of_birth date,
  gender boolean,
  phone_number varchar(15) UNIQUE,
  email varchar(100) UNIQUE,
  password varchar(255),
  created_date datetime,
  role_id int NOT NULL,
  FOREIGN KEY (role_id) REFERENCES USER_ROLE(id)
);

CREATE TABLE `USER_ADDRESS` (
	id int PRIMARY KEY AUTO_INCREMENT,
  full_name varchar(100),
  phone_number varchar(15),
  user_id int,
  province_id int,
  district_id int,
  ward_code varchar(30),
  address varchar(100),
  full_address varchar(255),
  is_default boolean,
  FOREIGN KEY (user_id) REFERENCES USER(id)
);

CREATE TABLE `NOTIFICATION` (
	id int PRIMARY KEY AUTO_INCREMENT,
  icon varchar(255),
  created_date datetime,
  title varchar(300),
  content varchar(1000),
  published boolean,
  user_id int,
  FOREIGN KEY (user_id) REFERENCES USER(id)
);


CREATE TABLE `VIEWED_NOTIFICATION` (
	id int PRIMARY KEY AUTO_INCREMENT,
  user_id int,
  notification_id int,
  FOREIGN KEY (user_id) REFERENCES USER(id),
  FOREIGN KEY (notification_id) REFERENCES NOTIFICATION(id)
);

CREATE TABLE `BRAND` (
	id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(100),
  published boolean,
  created_date datetime
);

CREATE TABLE `PRODUCT` (
	id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(300),
  specifications text,
  description text,
  width int,
  height int,
  weight int,
  length int,
  created_date datetime,
  published boolean,
  brand_id int,
  user_id int,
  FOREIGN KEY (brand_id) REFERENCES BRAND(id),
  FOREIGN KEY (user_id) REFERENCES USER(id)
);

CREATE TABLE `PRODUCT_IMAGE` (
	id int PRIMARY KEY AUTO_INCREMENT,
  image varchar(255),
  product_id int,
  FOREIGN KEY (product_id) REFERENCES PRODUCT(id)
);

CREATE TABLE `RAM_OPTION` (
	id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(100),
  created_date datetime
);

CREATE TABLE `ROM_OPTION` (
	id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(100),
  created_date datetime
);

CREATE TABLE `COLOR_OPTION` (
	id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(100),
  created_date datetime
);

CREATE TABLE `PRODUCT_OPTION` (
	id int PRIMARY KEY AUTO_INCREMENT,
  product_id int,
  ram_id int,
  rom_id int,
  color_id int,
  original_price int,
  sale_price int,
  quantity int,
  sold_quantity int,
  FOREIGN KEY (product_id) REFERENCES PRODUCT(id),
  FOREIGN KEY (ram_id) REFERENCES RAM_OPTION(id),
  FOREIGN KEY (rom_id) REFERENCES ROM_OPTION(id),
  FOREIGN KEY (color_id) REFERENCES COLOR_OPTION(id)
);

CREATE TABLE `COUPONS` (
	id int PRIMARY KEY AUTO_INCREMENT,
  code varchar(50),
  created_date datetime,
  start_date datetime,
  end_date datetime,
  quantity int,
  used_quantity int,
  discount_value int,
  user_id int,
  FOREIGN KEY (user_id) REFERENCES USER(id)
);

CREATE TABLE `ORDER_STATUS` (
	id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(100)
);

CREATE TABLE `ORDER` (
	id int PRIMARY KEY AUTO_INCREMENT,
  total_price int,
  delivery_cost int,
  coupons_id int,
  discount_value int,
  status_id int,
  shop_name varchar(100),
  shop_phone varchar(15),
  shop_address varchar(1000),
  customer_id int,
  customer_name varchar(100),
  customer_phone varchar(15),
  customer_address varchar(1000),
  created_date datetime,
  FOREIGN KEY (customer_id) REFERENCES USER(id),
  FOREIGN KEY (status_id) REFERENCES ORDER_STATUS(id),
  FOREIGN KEY (coupons_id) REFERENCES COUPONS(id)
);

CREATE TABLE `ORDER_DETAIL` (
	id int PRIMARY KEY AUTO_INCREMENT,
  price int,
  quantity int,
  order_id int,
  product_option_id int,
  FOREIGN KEY (order_id) REFERENCES `ORDER`(id),
  FOREIGN KEY (product_option_id) REFERENCES `PRODUCT_OPTION`(id)
);

CREATE TABLE `ORDER_TRACKING` (
	id int PRIMARY KEY AUTO_INCREMENT,
  created_date datetime,
  status_id int,
  order_id int,
  user_id int,
  FOREIGN KEY (user_id) REFERENCES USER(id),
  FOREIGN KEY (status_id) REFERENCES ORDER_STATUS(id),
  FOREIGN KEY (order_id) REFERENCES `ORDER`(id)
);

CREATE TABLE `SUPPLIER` (
	id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(100),
  phone_number varchar(15),
  description varchar(1000),
  province_id int,
  district_id int,
  ward_code varchar(30),
  address varchar(100),
  created_date datetime
);

CREATE TABLE `RECEIPT` (
	id int PRIMARY KEY AUTO_INCREMENT,
  supplier_id int,
  user_id int,
  total_price int,
  created_date datetime,
  FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(id),
  FOREIGN KEY (user_id) REFERENCES USER(id)
);

CREATE TABLE `RECEIPT_DETAIL` (
	id int PRIMARY KEY AUTO_INCREMENT,
  receipt_id int,
  product_option_id int,
  quantity int,
  price int,
  FOREIGN KEY (receipt_id) REFERENCES RECEIPT(id),
  FOREIGN KEY (product_option_id) REFERENCES PRODUCT_OPTION(id)
);

CREATE TABLE `CART` (
	id int PRIMARY KEY AUTO_INCREMENT,
  user_id int,
  product_option_id int,
  quantity int,
  created_date datetime,
  FOREIGN KEY (user_id) REFERENCES `USER`(id),
  FOREIGN KEY (product_option_id) REFERENCES `PRODUCT_OPTION`(id)
);

CREATE TABLE `PRODUCT_RATING` (
	id int PRIMARY KEY AUTO_INCREMENT,
  rating int,
  content varchar(1000),
  created_date datetime,
  user_id int,
  product_id int,
  FOREIGN KEY (user_id) REFERENCES `USER`(id),
  FOREIGN KEY (product_id) REFERENCES `PRODUCT`(id)
);

CREATE TABLE `RATING_IMAGE` (
	id int PRIMARY KEY AUTO_INCREMENT,
  image varchar(255),
  rating_id int,
  FOREIGN KEY (rating_id) REFERENCES PRODUCT_RATING(id)
);

CREATE TABLE `BANNER` (
	id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(100),
  image varchar(255),
  published boolean,
  created_date datetime,
  user_id int,
  FOREIGN KEY (user_id) REFERENCES USER(id)
);

CREATE TABLE `SHOP_INFO` (
	id int PRIMARY KEY AUTO_INCREMENT,
  logo varchar(100),
  name varchar(100),
  description text,
  email varchar(255),
  phone_number varchar(15),
  province_id int,
  district_id int,
  ward_code varchar(30),
  address varchar(100)
);

/* ====================== INSERT VALUES INTO USER_ROLE TABLE ====================== */
INSERT INTO USER_ROLE(name) VALUES('Quản trị');
INSERT INTO USER_ROLE(name) VALUES('Nhân viên bán hàng');
INSERT INTO USER_ROLE(name) VALUES('Nhân viên quản lý kho');
INSERT INTO USER_ROLE(name) VALUES('Khách hàng');

/* ====================== INSERT VALUES INTO BRAND TABLE ====================== */
INSERT INTO BRAND(name, published, created_date) VALUES('Samsung', 1, '2022-01-17 12:00:00');
INSERT INTO BRAND(name, published, created_date) VALUES('Vivo', 1, '2022-01-17 12:00:00');
INSERT INTO BRAND(name, published, created_date) VALUES('iPhone', 1, '2022-01-17 12:00:00');
INSERT INTO BRAND(name, published, created_date) VALUES('Xiaomi', 1, '2022-01-17 12:00:00');
INSERT INTO BRAND(name, published, created_date) VALUES('OPPO', 1, '2022-01-17 12:00:00');
INSERT INTO BRAND(name, published, created_date) VALUES('Nokia', 1, '2022-01-17 12:00:00');
INSERT INTO BRAND(name, published, created_date) VALUES('Realme', 1, '2022-01-17 12:00:00');

/* ====================== INSERT VALUES INTO BRAND TABLE ====================== */
INSERT INTO ORDER_STATUS(name) VALUES('Đặt hàng');
INSERT INTO ORDER_STATUS(name) VALUES('Chờ xác nhận');
INSERT INTO ORDER_STATUS(name) VALUES('Đang xử lý');
INSERT INTO ORDER_STATUS(name) VALUES('Đang vận chuyển');
INSERT INTO ORDER_STATUS(name) VALUES('Đã giao hàng');
INSERT INTO ORDER_STATUS(name) VALUES('Hoàn tất');
INSERT INTO ORDER_STATUS(name) VALUES('Đã hủy');

/* ====================== INSERT VALUES INTO RAM_OPTION TABLE ====================== */
INSERT INTO RAM_OPTION(name, created_date) VALUES('1 GB', '2022-01-23 06:00:00');
INSERT INTO RAM_OPTION(name, created_date) VALUES('2 GB', '2022-01-23 06:00:00');
INSERT INTO RAM_OPTION(name, created_date) VALUES('3 GB', '2022-01-23 06:00:00');
INSERT INTO RAM_OPTION(name, created_date) VALUES('4 GB', '2022-01-23 06:00:00');
INSERT INTO RAM_OPTION(name, created_date) VALUES('6 GB', '2022-01-23 06:00:00');
INSERT INTO RAM_OPTION(name, created_date) VALUES('8 GB', '2022-01-23 06:00:00');
INSERT INTO RAM_OPTION(name, created_date) VALUES('12 GB', '2022-01-23 06:00:00');

/* ====================== INSERT VALUES INTO ROM_OPTION TABLE ====================== */
INSERT INTO ROM_OPTION(name, created_date) VALUES('8 GB', '2022-01-23 06:00:00');
INSERT INTO ROM_OPTION(name, created_date) VALUES('16 GB', '2022-01-23 06:00:00');
INSERT INTO ROM_OPTION(name, created_date) VALUES('32 GB', '2022-01-23 06:00:00');
INSERT INTO ROM_OPTION(name, created_date) VALUES('64 GB', '2022-01-23 06:00:00');
INSERT INTO ROM_OPTION(name, created_date) VALUES('128 GB', '2022-01-23 06:00:00');
INSERT INTO ROM_OPTION(name, created_date) VALUES('256 GB', '2022-01-23 06:00:00');
INSERT INTO ROM_OPTION(name, created_date) VALUES('512 GB', '2022-01-23 06:00:00');
INSERT INTO ROM_OPTION(name, created_date) VALUES('1 TB', '2022-01-23 06:00:00');

/* ====================== INSERT VALUES INTO COLOR_OPTION TABLE ====================== */
INSERT INTO COLOR_OPTION(name, created_date) VALUES('Xanh', '2022-01-23 06:00:00');
INSERT INTO COLOR_OPTION(name, created_date) VALUES('Đen', '2022-01-23 06:00:00');
INSERT INTO COLOR_OPTION(name, created_date) VALUES('Xanh dương', '2022-01-23 06:00:00');
INSERT INTO COLOR_OPTION(name, created_date) VALUES('Đỏ', '2022-01-23 06:00:00');
INSERT INTO COLOR_OPTION(name, created_date) VALUES('Bạc', '2022-01-23 06:00:00');
INSERT INTO COLOR_OPTION(name, created_date) VALUES('Xanh lá', '2022-01-23 06:00:00');
INSERT INTO COLOR_OPTION(name, created_date) VALUES('Vàng', '2022-01-23 06:00:00');
INSERT INTO COLOR_OPTION(name, created_date) VALUES('Hồng', '2022-01-23 06:00:00');
INSERT INTO COLOR_OPTION(name, created_date) VALUES('Trắng', '2022-01-23 06:00:00');
INSERT INTO COLOR_OPTION(name, created_date) VALUES('Xám', '2022-01-23 06:00:00');
INSERT INTO COLOR_OPTION(name, created_date) VALUES('Nâu', '2022-01-23 06:00:00');
INSERT INTO COLOR_OPTION(name, created_date) VALUES('Tím', '2022-01-23 06:00:00');
INSERT INTO COLOR_OPTION(name, created_date) VALUES('Cam', '2022-01-23 06:00:00');

/* ====================== INSERT VALUES INTO SHOP_INFO TABLE ====================== */
INSERT INTO COLOR_OPTION(logo, name, email) VALUES('Mobile Store', 'Mobile Store', 'mobilestore@gmail.com');
