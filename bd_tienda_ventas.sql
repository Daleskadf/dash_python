-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para tienda_ventas
CREATE DATABASE IF NOT EXISTS `tienda_ventas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `tienda_ventas`;

-- Volcando estructura para tabla tienda_ventas.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_ventas.productos: ~8 rows (aproximadamente)
INSERT INTO `productos` (`id`, `nombre`, `categoria`, `precio`) VALUES
	(1, 'Laptop', 'Tecnología', 2500.00),
	(2, 'Smartphone', 'Tecnología', 1500.00),
	(3, 'Mouse', 'Accesorios', 50.00),
	(4, 'Teclado', 'Accesorios', 120.00),
	(5, 'Silla Gamer', 'Muebles', 800.00),
	(6, 'Monitor', 'Tecnología', 1100.00),
	(7, 'Tablet', 'Tecnología', 900.00),
	(8, 'Audífonos', 'Accesorios', 200.00);

-- Volcando estructura para tabla tienda_ventas.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_ventas.ventas: ~20 rows (aproximadamente)
INSERT INTO `ventas` (`id`, `producto_id`, `cantidad`, `fecha`) VALUES
	(1, 1, 2, '2024-04-01'),
	(2, 2, 1, '2024-04-02'),
	(3, 3, 10, '2024-04-03'),
	(4, 4, 5, '2024-04-03'),
	(5, 5, 1, '2024-04-04'),
	(6, 6, 2, '2024-04-05'),
	(7, 7, 3, '2024-04-06'),
	(8, 8, 4, '2024-04-07'),
	(9, 1, 1, '2024-04-08'),
	(10, 3, 2, '2024-04-08'),
	(11, 2, 2, '2024-04-09'),
	(12, 4, 3, '2024-04-10'),
	(13, 5, 1, '2024-04-11'),
	(14, 6, 1, '2024-04-12'),
	(15, 7, 1, '2024-04-13'),
	(16, 2, 1, '2024-04-14'),
	(17, 1, 1, '2024-04-15'),
	(18, 8, 2, '2024-04-15'),
	(19, 3, 5, '2024-04-16'),
	(20, 4, 4, '2024-04-17');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
