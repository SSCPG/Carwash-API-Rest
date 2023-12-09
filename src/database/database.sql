-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2023 a las 23:01:32
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

INSERT INTO `filtros` (`idProducto`, `tipo`, `marca`, `precioCompra`, `precioVenta`, `modelo_vehiculo`) VALUES
('APUROLATOR-ACEITE', 'Aceite', 'Apurolator', '5.00', '20.00', 'F-50, Hilux, Runner'),
('BOSCH-AIRE', 'Aire', 'BOSCH', '10.00', '20.00', 'Aveo, Fiesta, Optra');

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
('A', 'GUL20W50', 12, 40, 16),
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
