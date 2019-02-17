-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 17-02-2019 a las 19:53:51
-- Versión del servidor: 5.7.19
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `processimlabs_test_rg`
--
CREATE DATABASE IF NOT EXISTS `processimlabs_test_rg` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `processimlabs_test_rg`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `courses_id` int(11) NOT NULL AUTO_INCREMENT,
  `courses_name` text NOT NULL,
  `courses_descrption` text,
  `courses_start_date` date NOT NULL,
  `courses_final_date` date NOT NULL,
  `courses_students` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`courses_id`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`courses_id`, `courses_name`, `courses_descrption`, `courses_start_date`, `courses_final_date`, `courses_students`, `status_id`) VALUES
(1, 'VUE JS 2', 'Aprender a desarrollar usando el Framework de JS VUE JS 2', '2019-02-14', '2019-03-14', 15, 1),
(2, 'Laravel', 'Aprende a crea tu primera app en laravel', '2019-02-28', '2019-03-28', 25, 1),
(3, 'Node JS', 'Desarrolla tu primera api con Node JS', '2019-01-20', '2019-04-30', 40, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_description` text NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`status_id`, `status_description`) VALUES
(1, 'Creada'),
(2, 'Corriendo'),
(3, 'Finalizada');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
