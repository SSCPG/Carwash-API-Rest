CREATE DATABASE IF NOT EXISTS carwash;

USE carwash;

--POSIBLES CATEGORIAS DE PRODUCTOS: 
-- F : Filtros
-- A : Aceites

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-12-2023 a las 16:27:54
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carwash`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aceites`
--

CREATE TABLE `aceites` (
  `idProducto` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `viscosidad` varchar(50) NOT NULL,
  `unidad_por_empaque` int(11) NOT NULL,
  `precio_compra_empaque` decimal(10,2) NOT NULL,
  `precio_compra_unidad` decimal(10,2) NOT NULL,
  `precio_venta_empaque` decimal(10,2) NOT NULL,
  `precio_venta_unidad` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `aceites`
--

INSERT INTO `aceites` (`idProducto`, `marca`, `tipo`, `viscosidad`, `unidad_por_empaque`, `precio_compra_empaque`, `precio_compra_unidad`, `precio_venta_empaque`, `precio_venta_unidad`) VALUES
('CA10W40', 'Castrol', 'Sintético', '10W-40', 12, '50.00', '4.17', '75.00', '10.00'),
('CHR10W20', 'Chronus', 'Semi-sintético', '10W20', 6, '12.00', '2.00', '24.00', '4.00'),
('GUL20W50', 'Gulf', 'Mineral', '20W50', 20, '40.00', '2.00', '80.00', '6.00'),
('SHE20W50', 'Shell', 'Semi-sintético', '20W50', 10, '55.00', '5.50', '70.00', '7.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` varchar(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombre`, `apellido`, `telefono`, `email`, `direccion`) VALUES
('28063634', 'Santiago', 'Briceno', '4122786751', 'Santiagogbf2000@Gmail.com', 'Guacara, Cdad. Alianza'),
('28402367', 'Andres', 'Pausin', '4127654322', 'CorreoDeAndres@Gmail.com', 'Naguanagua, Valle Real'),
('7653463737', 'Walter', 'White', '4127658822', 'BreakingBad@Gmail.com', 'Albuquerque, Nuevo Mexico, Estados Unidos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuerpo_pedido`
--

CREATE TABLE `cuerpo_pedido` (
  `idPedido` varchar(50) NOT NULL,
  `idProducto` varchar(50) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuerpo_pedido`
--

INSERT INTO `cuerpo_pedido` (`idPedido`, `idProducto`, `cantidad`, `total`) VALUES
('P-00000001', 'APUROLATOR-ACEITE', 5, '100.00'),
('P-00000001', 'CA10W40', 20, '200.00'),
('P-00000001', 'CHR10W20', 12, '48.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `filtros`
--

CREATE TABLE `filtros` (
  `idProducto` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `precioCompra` decimal(10,2) NOT NULL,
  `precioVenta` decimal(10,2) NOT NULL,
  `modelo_vehiculo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `filtros`
--

-- INSERT INTO `filtros` (`idProducto`, `tipo`, `marca`, `precioCompra`, `precioVenta`, `modelo_vehiculo`) VALUES
-- ('APUROLATOR-ACEITE', 'Aceite', 'Apurolator', '5.00', '20.00', 'F-50, Hilux, Runner'),
-- ('BOSCH-AIRE', 'Aire', 'BOSCH', '10.00', '20.00', 'Aveo, Fiesta, Optra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idCategoria` varchar(50) NOT NULL,
  `idProducto` varchar(50) NOT NULL,
  `stock_min` int(11) NOT NULL,
  `stock_max` int(11) NOT NULL,
  `stock_actual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`idCategoria`, `idProducto`, `stock_min`, `stock_max`, `stock_actual`) VALUES
('A', 'CA10W40', 12, 56, 10),
('A', 'CHR10W20', 12, 36, 4),
('A', 'GUL20W50', 12, 40, 13),
('A', 'SHE20W50', 12, 60, 50),
('F', 'APUROLATOR-ACEITE', 12, 24, 8),
('F', 'BOSCH-AIRE', 12, 25, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` varchar(11) NOT NULL,
  `idCliente` varchar(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `abono` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idPedido`, `idCliente`, `monto`, `abono`, `fecha`) VALUES
('P-00000001', '7653463737', '390.00', '100.00', '2023-12-08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `washservice`
--

CREATE TABLE `washservice` (
  `id` int(11) NOT NULL,
  `idPedido` varchar(50) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  `tipoServicio` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `washservice`
--

INSERT INTO `washservice` (`id`, `idPedido`, `placa`, `fecha`, `tipoServicio`, `marca`, `modelo`, `precio`) VALUES
(19, 'P-00000001', 'ABC123', '2023-12-08', 'Completo', 'Ford', 'F-50', '22.00'),
(20, 'P-00000001', 'AX150AB', '2023-12-08', 'Completo', 'Kia', 'Pregio', '20.00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aceites`
--
ALTER TABLE `aceites`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `cuerpo_pedido`
--
ALTER TABLE `cuerpo_pedido`
  ADD PRIMARY KEY (`idPedido`,`idProducto`) USING BTREE;

--
-- Indices de la tabla `filtros`
--
ALTER TABLE `filtros`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idCategoria`,`idProducto`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`);

--
-- Indices de la tabla `washservice`
--
ALTER TABLE `washservice`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `washservice`
--
ALTER TABLE `washservice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


SELECT 
  i.idProducto, 
  i.stock_min, 
  i.stock_max, 
  i.stock_actual, 
  f.marca, 
  f.tipo, 
  f.precioCompra,
  f.precioVenta,
  f.modelo_vehiculo
FROM inventario i
INNER JOIN filtros f ON i.idProducto = f.idProducto
WHERE i.idCategoria = 'F';

SELECT 
  i.idProducto, 
  i.stock_min, 
  i.stock_max, 
  i.stock_actual, 
  a.marca, 
  a.tipo,
  a.viscosidad, 
  a.unidad_por_empaque,
  a.precio_compra_unidad,
  a.precio_compra_empaque,
  a.precio_venta_unidad,
  a.precio_venta_empaque
FROM inventario i
INNER JOIN aceites a ON i.idProducto = a.idProducto
WHERE i.idCategoria = 'A';

SELECT * FROM washservice WHERE tipoServicio = 'Completo';

SELECT * FROM washservice WHERE tipoServicio = 'Básico';

SELECT idPedido, nombre, apellido, monto, abono, fecha FROM pedido INNER JOIN cliente ON pedido.idCliente = cliente.idCliente;

INSERT INTO filtros (idProducto, marca, tipo, precioCompra, precioVenta, modelo_vehiculo)
VALUES (1, 'Marca1', 'Tipo1', 10.00, 20.00, 'Modelo1'),
     (2, 'Marca2', 'Tipo2', 15.00, 25.00, 'Modelo2'),
     (3, 'Marca3', 'Tipo3', 12.00, 22.00, 'Modelo3'),
     (4, 'Marca4', 'Tipo4', 18.00, 28.00, 'Modelo4'),
     (5, 'Marca5', 'Tipo5', 14.00, 24.00, 'Modelo5'),
     (6, 'Marca6', 'Tipo6', 16.00, 26.00, 'Modelo6'),
     (7, 'Marca7', 'Tipo7', 11.00, 21.00, 'Modelo7'),
     (8, 'Marca8', 'Tipo8', 13.00, 23.00, 'Modelo8'),
     (9, 'Marca9', 'Tipo9', 17.00, 27.00, 'Modelo9'),
     (10, 'Marca10', 'Tipo10', 19.00, 29.00, 'Modelo10'),
     (11, 'Marca11', 'Tipo11', 10.50, 20.50, 'Modelo11'),
     (12, 'Marca12', 'Tipo12', 15.50, 25.50, 'Modelo12'),
     (13, 'Marca13', 'Tipo13', 12.50, 22.50, 'Modelo13'),
     (14, 'Marca14', 'Tipo14', 18.50, 28.50, 'Modelo14'),
     (15, 'Marca15', 'Tipo15', 14.50, 24.50, 'Modelo15'),
     (16, 'Marca16', 'Tipo16', 16.50, 26.50, 'Modelo16'),
     (17, 'Marca17', 'Tipo17', 11.50, 21.50, 'Modelo17'),
     (18, 'Marca18', 'Tipo18', 13.50, 23.50, 'Modelo18'),
     (19, 'Marca19', 'Tipo19', 17.50, 27.50, 'Modelo19'),
     (20, 'Marca20', 'Tipo20', 19.50, 29.50, 'Modelo20');

INSERT INTO inventario (idCategoria, idProducto, stock_min, stock_max, stock_actual)
VALUES ('F', 1, 12, 24, 8),
     ('F', 2, 12, 25, 13),
     ('F', 3, 12, 26, 18),
     ('F', 4, 12, 27, 23),
     ('F', 5, 12, 28, 28),
     ('F', 6, 12, 29, 33),
     ('F', 7, 12, 30, 38),
     ('F', 8, 12, 31, 43),
     ('F', 9, 12, 32, 48),
     ('F', 10, 12, 33, 53),
     ('F', 11, 12, 34, 58),
     ('F', 12, 12, 35, 63),
     ('F', 13, 12, 36, 68),
     ('F', 14, 12, 37, 73),
     ('F', 15, 12, 38, 78),
     ('F', 16, 12, 39, 83),
     ('F', 17, 12, 40, 88),
     ('F', 18, 12, 41, 93),
     ('F', 19, 12, 42, 98),
     ('F', 20, 12, 43, 103);

