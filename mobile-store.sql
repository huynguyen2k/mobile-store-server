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
    FOREIGN KEY (user_id) REFERENCES USER(id)
);

CREATE TABLE `NOTIFICATION` (
	id int PRIMARY KEY AUTO_INCREMENT,
   	icon varchar(255),
    created_date datetime,
    title varchar(300),
    content varchar(1000),
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

CREATE TABLE `PRODUCT_INVENTORY` (
	id int PRIMARY KEY AUTO_INCREMENT,
    total int,
    sold int
);

CREATE TABLE `PRODUCT_OPTION` (
	id int PRIMARY KEY AUTO_INCREMENT,
    product_id int,
    ram_id int,
    rom_id int,
    color_id int,
    original_price int,
    sale_price int,
    inventory_id int,
    FOREIGN KEY (product_id) REFERENCES PRODUCT(id),
    FOREIGN KEY (ram_id) REFERENCES RAM_OPTION(id),
    FOREIGN KEY (rom_id) REFERENCES ROM_OPTION(id),
    FOREIGN KEY (color_id) REFERENCES COLOR_OPTION(id),
    FOREIGN KEY (inventory_id) REFERENCES PRODUCT_INVENTORY(id)
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
    created_date datetime,
    customer_id int,
    status_id int,
    coupons_id int,
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
    user_id int,
    order_id int,
    FOREIGN KEY (user_id) REFERENCES USER(id),
    FOREIGN KEY (status_id) REFERENCES ORDER_STATUS(id),
    FOREIGN KEY (order_id) REFERENCES `ORDER`(id)
);

CREATE TABLE `CART` (
	id int PRIMARY KEY AUTO_INCREMENT,
    user_id int,
    product_option_id int,
    quantity int,
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

/* ====================== INSERT VALUES INTO USER_ROLE TABLE ====================== */
INSERT INTO USER_ROLE(name) VALUES('Quản trị');
INSERT INTO USER_ROLE(name) VALUES('Nhân viên');
INSERT INTO USER_ROLE(name) VALUES('Khách hàng');


/* ====================== INSERT VALUES INTO BRAND TABLE ====================== */
INSERT INTO BRAND(name, created_date) VALUES('Samsung', '2022-01-17 00:00:00');
INSERT INTO BRAND(name, created_date) VALUES('Vivo', '2022-01-17 00:00:00');
INSERT INTO BRAND(name, created_date) VALUES('Iphone', '2022-01-17 00:00:00');
INSERT INTO BRAND(name, created_date) VALUES('Xiaomi', '2022-01-17 00:00:00');
INSERT INTO BRAND(name, created_date) VALUES('OPPO', '2022-01-17 00:00:00');
INSERT INTO BRAND(name, created_date) VALUES('Nokia', '2022-01-17 00:00:00');
INSERT INTO BRAND(name, created_date) VALUES('Realme', '2022-01-17 00:00:00');

/* ====================== INSERT VALUES INTO BRAND TABLE ====================== */
INSERT INTO ORDER_STATUS(name) VALUES('Đang chờ');
INSERT INTO ORDER_STATUS(name) VALUES('Xác nhận');
INSERT INTO ORDER_STATUS(name) VALUES('Đang giao');
INSERT INTO ORDER_STATUS(name) VALUES('Đã giao');
INSERT INTO ORDER_STATUS(name) VALUES('Đã hủy');
