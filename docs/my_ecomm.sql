-- / Creación de la DB
CREATE DATABASE my_ecomm;
USE my_ecomm;


-- / Creación de las tablas que NO tienen FK
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `colors` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- / Creación de las tablas que tienen FK
CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `image` varchar(255) NULL DEFAULT 'no-image.png',
  `userId` int(10) unsigned DEFAULT NULL,
  `brandId` int(10) unsigned DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  FOREIGN KEY (`brandId`) REFERENCES `brands` (`id`)
) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `category_product` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `productId` int(10) unsigned DEFAULT NULL,
  `categoryId` int(10) unsigned DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`)
) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `color_product` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `productId` int(10) unsigned DEFAULT NULL,
  `colorId` int(10) unsigned DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  FOREIGN KEY (`colorId`) REFERENCES `colors` (`id`)
) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- / Populando las tablas
INSERT INTO `brands` VALUES 
	(DEFAULT, 'Apple', NULL, NULL),
	(DEFAULT, 'Microsoft', NULL, NULL),
	(DEFAULT, 'Asus', NULL, NULL),
	(DEFAULT, 'BGH', NULL, NULL),
	(DEFAULT, 'Dell', NULL, NULL);

INSERT INTO `categories` VALUES 
	(DEFAULT, 'Desktop computers', NULL, NULL),
	(DEFAULT, 'Laptops', NULL, NULL),
	(DEFAULT, 'Tablets', NULL, NULL),
	(DEFAULT, 'Cellphones', NULL, NULL),
	(DEFAULT, 'Tv sets', NULL, NULL);

INSERT INTO `colors` VALUES 
	(DEFAULT, 'yellow', NULL, NULL),
	(DEFAULT, 'blue', NULL, NULL),
	(DEFAULT, 'red', NULL, NULL),
	(DEFAULT, 'white', NULL, NULL),
	(DEFAULT, 'black', NULL, NULL);

INSERT INTO `users` (`firstName`, `lastName`, `email`, `password`) 
VALUES
	('Jon', 'Doe', 'jondoe@email.com', '123abc'),
	('Jane', 'Doe', 'janedoe@email.com', '123abc'),
	('Jon', 'Snow', 'jonsnow@email.com', '123abc');
	