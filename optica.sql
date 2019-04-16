-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-04-2019 a las 09:35:37
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ulleres`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Address`
--

CREATE TABLE `Address` (
  `idAddress` int(11) NOT NULL,
  `street` varchar(100) NOT NULL,
  `number` varchar(10) DEFAULT NULL,
  `flat` varchar(5) DEFAULT NULL,
  `door` varchar(5) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(5) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Address`
--

INSERT INTO `Address` (`idAddress`, `street`, `number`, `flat`, `door`, `city`, `zip`, `country`) VALUES
(1, 'marti', '2', NULL, NULL, 'Barcelona', '08024', 'Spain'),
(2, 'vilafranca', '3', '3', '1', 'Badajoz', '05043', 'Spain');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Client`
--

CREATE TABLE `Client` (
  `idClient` int(11) NOT NULL,
  `nameClient` varchar(100) NOT NULL,
  `idAddress` int(11) NOT NULL,
  `telfClient` varchar(15) NOT NULL,
  `emailClient` varchar(100) NOT NULL,
  `registrationDate` date NOT NULL,
  `recommendedBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Client`
--

INSERT INTO `Client` (`idClient`, `nameClient`, `idAddress`, `telfClient`, `emailClient`, `registrationDate`, `recommendedBy`) VALUES
(1, 'Alicia', 1, '555-5555', 'alicia@email.com', '2019-04-10', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Employee`
--

CREATE TABLE `Employee` (
  `idEmployee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Employee`
--

INSERT INTO `Employee` (`idEmployee`) VALUES
(60),
(61);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Glasses`
--

CREATE TABLE `Glasses` (
  `idGlasses` int(11) NOT NULL,
  `idSeller` int(11) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `graduation` decimal(10,0) NOT NULL,
  `frame` set('flotant','pasta','metalica') NOT NULL,
  `frameColor` varchar(50) NOT NULL,
  `glassColor` varchar(50) NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Glasses`
--

INSERT INTO `Glasses` (`idGlasses`, `idSeller`, `brand`, `graduation`, `frame`, `frameColor`, `glassColor`, `price`) VALUES
(200, 100, 'seewee', '2', 'pasta', 'rojo', 'turquesa', '100');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Sale`
--

CREATE TABLE `Sale` (
  `idSale` int(11) NOT NULL,
  `idEmployee` int(11) NOT NULL,
  `idGlasses` int(11) NOT NULL,
  `idClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Sale`
--

INSERT INTO `Sale` (`idSale`, `idEmployee`, `idGlasses`, `idClient`) VALUES
(300, 60, 200, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Seller`
--

CREATE TABLE `Seller` (
  `idSeller` int(11) NOT NULL,
  `nameSeller` varchar(150) NOT NULL,
  `idAddress` int(11) NOT NULL,
  `telfSeller` varchar(15) NOT NULL,
  `faxSeller` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Seller`
--

INSERT INTO `Seller` (`idSeller`, `nameSeller`, `idAddress`, `telfSeller`, `faxSeller`) VALUES
(100, 'GafasBcn', 2, '666-6666', '777-7777');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`idAddress`);

--
-- Indices de la tabla `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`idClient`),
  ADD KEY `idAddress` (`idAddress`);

--
-- Indices de la tabla `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`idEmployee`);

--
-- Indices de la tabla `Glasses`
--
ALTER TABLE `Glasses`
  ADD PRIMARY KEY (`idGlasses`),
  ADD KEY `idSeller` (`idSeller`);

--
-- Indices de la tabla `Sale`
--
ALTER TABLE `Sale`
  ADD PRIMARY KEY (`idSale`),
  ADD KEY `idGlasses` (`idGlasses`),
  ADD KEY `idClient` (`idClient`),
  ADD KEY `idEmployee` (`idEmployee`);

--
-- Indices de la tabla `Seller`
--
ALTER TABLE `Seller`
  ADD PRIMARY KEY (`idSeller`),
  ADD KEY `idAddress` (`idAddress`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Client`
--
ALTER TABLE `Client`
  ADD CONSTRAINT `Client_ibfk_1` FOREIGN KEY (`idAddress`) REFERENCES `Address` (`idAddress`);

--
-- Filtros para la tabla `Glasses`
--
ALTER TABLE `Glasses`
  ADD CONSTRAINT `Glasses_ibfk_1` FOREIGN KEY (`idSeller`) REFERENCES `Seller` (`idSeller`);

--
-- Filtros para la tabla `Sale`
--
ALTER TABLE `Sale`
  ADD CONSTRAINT `Sale_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `Client` (`idClient`),
  ADD CONSTRAINT `Sale_ibfk_2` FOREIGN KEY (`idGlasses`) REFERENCES `Glasses` (`idGlasses`),
  ADD CONSTRAINT `Sale_ibfk_3` FOREIGN KEY (`idEmployee`) REFERENCES `Employee` (`idEmployee`);

--
-- Filtros para la tabla `Seller`
--
ALTER TABLE `Seller`
  ADD CONSTRAINT `Seller_ibfk_1` FOREIGN KEY (`idAddress`) REFERENCES `Address` (`idAddress`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
