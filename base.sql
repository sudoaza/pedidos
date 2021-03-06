-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 18-02-2013 a las 03:12:59
-- Versión del servidor: 5.5.28-1
-- Versión de PHP: 5.4.4-10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `lodefede`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth`
--

CREATE TABLE IF NOT EXISTS `auth` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(12) unsigned NOT NULL,
  `password` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `challenge` text COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `failed` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrio`
--

CREATE TABLE IF NOT EXISTS `barrio` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `barrio`
--

INSERT INTO `barrio` (`id`, `nombre`) VALUES
(1, 'Núñez'),
(2, 'Recoleta'),
(3, 'Balvanera'),
(4, 'Retiro'),
(5, 'Palermo'),
(6, 'Belgrano'),
(7, 'Saavedra'),
(8, 'San Nicolás'),
(9, 'Almagro'),
(10, 'Villa Crespo'),
(11, 'Monserrat'),
(12, 'Caballito'),
(13, 'Flores'),
(14, 'Floresta'),
(15, 'Vélez Sarsfield'),
(16, 'Villa Luro'),
(17, 'Liniers'),
(18, 'San Cristóbal'),
(19, 'Parque Patricios'),
(20, 'Barracas'),
(21, 'Villa Urquiza'),
(22, 'Villa Gral.mitre'),
(23, 'Villa Santa Rita'),
(24, 'Versalles'),
(25, 'Paternal'),
(26, 'Villa del Parque'),
(27, 'Agronomía'),
(28, 'Villa Devoto'),
(29, 'Chacarita'),
(30, 'Villa Ortúzar'),
(31, 'Colegiales'),
(32, 'Puerto Madero'),
(33, 'San Telmo'),
(34, 'Parque Chacabuco'),
(35, 'Constitución'),
(36, 'Boedo'),
(37, 'Boca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE IF NOT EXISTS `horario` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id`, `descripcion`) VALUES
(1, '08:30 - 10:00'),
(2, '10:00 - 11:30'),
(3, '11:30 - 13:00'),
(5, '16:30 - 18:00'),
(4, '13:00 - 14:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(10) NOT NULL,
  `producto_id` int(10) NOT NULL,
  `cantidad` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `estado` enum('sinconfirmar','confirmado','entregado','cancelado') NOT NULL,
  `user_id` int(10) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_entrega` date NOT NULL,
  `recorrido_id` int(10) NOT NULL,
  `observaciones` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Promo 1', 'LA mas mejor'),
(2, 'Promo 2', 'Casi tan buena como promo 1'),
(3, 'Promo 3', 'Te damos los restos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recorrido`
--

CREATE TABLE IF NOT EXISTS `recorrido` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `barrio_id` int(10) NOT NULL,
  `horario_id` int(10) NOT NULL,
  `domingo` tinyint(1) NOT NULL,
  `lunes` tinyint(1) NOT NULL,
  `martes` tinyint(1) NOT NULL,
  `miercoles` tinyint(1) NOT NULL,
  `jueves` tinyint(1) NOT NULL,
  `viernes` tinyint(1) NOT NULL,
  `sabado` tinyint(1) NOT NULL,
  `cupo` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `recorrido`
--

INSERT INTO `recorrido` (`id`, `barrio_id`, `horario_id`, `domingo`, `lunes`, `martes`, `miercoles`, `jueves`, `viernes`, `sabado`, `cupo`) VALUES
(1, 3, 1, 0, 1, 1, 1, 1, 1, 0, 0),
(2, 3, 2, 0, 1, 1, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(128) COLLATE utf8_bin NOT NULL,
  `apellido` varchar(128) COLLATE utf8_bin NOT NULL,
  `telefono` varchar(20) COLLATE utf8_bin NOT NULL,
  `calle` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `numero` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `direccion` varchar(128) COLLATE utf8_bin NOT NULL,
  `piso` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `depto` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `barrio_id` int(10) DEFAULT NULL,
  `estado` enum('sinconfirmar','confirmado','suspendido') COLLATE utf8_bin NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uri` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
