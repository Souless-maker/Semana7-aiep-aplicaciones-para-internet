-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2025 a las 22:11:12
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `el_faro_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `contenido` text NOT NULL,
  `resumen` varchar(300) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `titulo`, `contenido`, `resumen`, `imagen`, `categoria_id`, `usuario_id`, `fecha_publicacion`, `activo`) VALUES
(1, 'Inauguración del nuevo centro comunitario', 'El alcalde inauguró oficialmente el nuevo centro comunitario que servirá a más de 500 familias de la zona norte de la ciudad. Las instalaciones cuentan con biblioteca, sala de computación y espacios recreativos.', 'Nuevo centro comunitario beneficiará a 500 familias de la zona norte', NULL, 1, 1, '2025-09-24 20:33:26', 1),
(2, 'Torneo de fútbol amateur 2025', 'Se dio inicio al torneo de fútbol amateur con la participación de 12 equipos locales. Los partidos se realizarán todos los fines de semana en el estadio municipal.', '12 equipos participan en el nuevo torneo de fútbol amateur', NULL, 2, 1, '2025-09-24 20:33:26', 1),
(3, 'Festival de música folclórica', 'Este fin de semana se realizará el tradicional festival de música folclórica en la plaza principal. Participarán grupos locales y artistas invitados de la región.', 'Festival de música folclórica este fin de semana en la plaza principal', NULL, 3, 1, '2025-09-24 20:33:26', 1),
(4, 'Nuevas inversiones impulsan el comercio local', 'El comercio local registra un crecimiento del 15% en el último trimestre gracias a nuevas inversiones en el sector turístico y gastronómico de la ciudad.', 'Comercio local crece 15% impulsado por inversiones en turismo', NULL, 4, 1, '2025-09-24 20:33:26', 1),
(5, 'Implementación de fibra óptica en sectores rurales', 'La empresa de telecomunicaciones anunció la extensión de la red de fibra óptica hacia los sectores rurales, beneficiando a más de 200 familias con internet de alta velocidad.', 'Fibra óptica llegará a sectores rurales beneficiando a 200 familias', NULL, 5, 1, '2025-09-24 20:33:26', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `slug` varchar(100) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `slug`, `activo`, `fecha_creacion`) VALUES
(1, 'Noticias Locales', 'Noticias y eventos de la comunidad local', 'nacional', 1, '2025-09-24 20:33:26'),
(2, 'Deportes', 'Información deportiva y resultados', 'internacional', 1, '2025-09-24 20:33:26'),
(3, 'Cultura', 'Eventos culturales y artísticos', 'cultura', 1, '2025-09-24 20:33:26'),
(4, 'Economía', 'Noticias económicas y financieras', 'economia', 1, '2025-09-24 20:33:26'),
(5, 'Tecnología', 'Avances tecnológicos y digitales', 'tecnologia', 1, '2025-09-24 20:33:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `asunto` varchar(150) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_envio` timestamp NOT NULL DEFAULT current_timestamp(),
  `leido` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tipo_usuario` enum('admin','usuario') DEFAULT 'usuario',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `tipo_usuario`, `fecha_registro`, `activo`) VALUES
(1, 'Administrador', 'admin@elfaro.cl', '$2y$10$H.QXujp0kcrdunylrqSaXenHIUYuqjEIgvsDG5OFOjW5EaX.95zJq', 'admin', '2025-09-24 20:33:26', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_articulos_categoria` (`categoria_id`),
  ADD KEY `idx_articulos_usuario` (`usuario_id`),
  ADD KEY `idx_articulos_fecha` (`fecha_publicacion`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_contactos_fecha` (`fecha_envio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `articulos_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
