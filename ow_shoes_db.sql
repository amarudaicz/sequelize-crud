-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2022 a las 02:52:24
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ow_shoes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colors_guide`
--

CREATE TABLE `colors_guide` (
  `id` int(11) NOT NULL,
  `color_arg` varchar(60) NOT NULL,
  `color_us` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `colors_guide`
--

INSERT INTO `colors_guide` (`id`, `color_arg`, `color_us`) VALUES
(1, 'Verde', 'Green'),
(2, 'Rojo', 'Red'),
(3, 'Gris', 'Grey');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  `total` mediumint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status`, `date`, `total`) VALUES
(1, 61, 'current', '2022-11-15 19:33:35', 5326796),
(2, 68, 'current', '2022-11-15 19:34:03', 0),
(3, 72, 'current', '2022-11-17 02:15:19', 45000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `product_model_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_variant_id`, `product_model_id`, `price`, `quantity`) VALUES
(266, 1, 424, 256, 15600, 1),
(267, 1, 432, 259, 15600, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(50) NOT NULL,
  `price` mediumint(9) NOT NULL,
  `price_offer` mediumint(9) NOT NULL,
  `descripcion_1` varchar(300) NOT NULL,
  `descripcion_2` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `title`, `subtitle`, `price`, `price_offer`, `descripcion_1`, `descripcion_2`) VALUES
(256, 'NIKE SB DUNK HIGH PRO QS', 'PRO QS', 15600, 12000, 'El KCDC SB Dunk High Pro es la culminación de 20 años de compromiso y representa lo que vendrá. Con rosas vibrantes como la base de la combinación de colores, el KCDC Dunk High agrega negro audaz contrastante desde el Nike Swoosh icónico hasta la plantilla de marca.', 'Extendido hasta el sistema de agujetas, cada par cuenta con dos opciones de agujetas de la marca y ojales en latón antiguo, todo esto sobre una suela de goma transparente especial acabada con el logotipo de la marca KCDC en la plantilla.'),
(259, 'ZOOM LEBRON', 'III QS', 42599, 32599, 'Además de la cancha, la barbería siempre ha sido un lugar especial para Lebron, donde puede expresarse. Es allí donde LeBron y muchas otras generaciones han podido sentarse, renovarse y tener conversaciones informales sobre la actualidad a lo largo de la vida.', 'Inspirado en estos lugares, este Zoom LeBron 3 mantiene un look impecable. Con cuero de charol y\r\nnobuk premium, las franjas rojas, blancas y azules representan los icónicos postes de las barberías\r\nmientras que los detalles en plata metalizado son un guiño a las herramientas de los barberos.'),
(260, 'AIR TRAINER 1 SP ', '“LIGHT SMOKE GREY”', 45699, 13599, 'Diseñado para llevarte a todas partes, el zapatilla de cross original del 87 te permite ir de una zona a otra con estilo.', 'Los detalles como la correa en el antepié mantienen el atractivo retro que te gusta, mientras que los gráficos\r\nreflejantes y los detalles iridiscentes te ayudan a destacar. Entonces, ¿adónde lo llevarás?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_categories`
--

CREATE TABLE `products_categories` (
  `id` smallint(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_colors`
--

CREATE TABLE `products_colors` (
  `id` int(11) NOT NULL,
  `product_model_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products_colors`
--

INSERT INTO `products_colors` (`id`, `product_model_id`, `color_id`) VALUES
(99, 256, 1),
(100, 256, 2),
(101, 256, 3),
(104, 259, 3),
(105, 260, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_images`
--

CREATE TABLE `products_images` (
  `id` int(11) NOT NULL,
  `product_model_id` int(11) DEFAULT NULL,
  `detail_images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `thumbnail_image` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products_images`
--

INSERT INTO `products_images` (`id`, `product_model_id`, `detail_images`, `thumbnail_image`) VALUES
(57, 256, '[\"10-19-2022-NIKE-SB DUNK HIGH PRO QS 2.webp\",\"10-19-2022-NIKE-SB DUNK HIGH PRO QS 3.webp\",\"10-19-2022-NIKE-SB DUNK HIGH PRO QS 4.webp\",\"10-19-2022-NIKE-SB DUNK HIGH PRO QS 5 - copia.webp\",\"10-19-2022-NIKE-SB DUNK HIGH PRO QS 5.webp\",\"10-19-2022-NIKE-SB DUNK HIGH PRO QS 6.webp\"]', '10-20-2022-9100d258-5595-4d5c-adb2-7539f0ba16e0.webp'),
(60, 259, '[\"10-20-2022-0b70e3e1-a0bf-4dfa-bff9-2e1cbea45914.webp\",\"10-20-2022-1eeec4f0-6b00-428d-95b9-a0ac3853fa46.webp\",\"10-20-2022-5da1bf9b-6419-4f96-a8b0-31be2b982773.webp\",\"10-20-2022-48c703d9-056c-439f-80fc-d47cc9e105cb.webp\",\"10-20-2022-61fd448f-9ec8-4112-a654-f4fd52c5cbe7.webp\",\"10-20-2022-732552f2-44a0-4a38-b7a8-37d49d3ed9cc.webp\"]', '10-20-2022-d5d2cc9c-8c17-4068-b9c4-3f8e35c68026.webp'),
(61, 260, '[\"10-20-2022-0e7bfcbd-7ff5-4221-9289-52a686301c54.webp\",\"10-20-2022-1b78ebec-91ef-4ff3-9f92-b7bbcb43dfaa.webp\",\"10-20-2022-9fd3bf8c-1a3e-436d-90ce-f22c2446b37a.webp\",\"10-20-2022-a54c47d3-0c47-4587-a28f-08f3a775afd4.webp\",\"10-20-2022-air-trainer-1-sp-âlight-smoke-greyâ.jpeg\",\"10-20-2022-ff3c93d6-33d8-45ee-b871-db0f73221450.webp\"]', '10-20-2022-8b46721e-33b7-477b-b6f7-fe55e7566ea3.webp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_sizes`
--

CREATE TABLE `products_sizes` (
  `id` int(11) NOT NULL,
  `product_model_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products_sizes`
--

INSERT INTO `products_sizes` (`id`, `product_model_id`, `size_id`) VALUES
(101, 256, 14),
(102, 256, 9),
(103, 256, 13),
(104, 256, 15),
(105, 256, 11),
(106, 256, 12),
(107, 256, 10),
(111, 259, 15),
(112, 259, 13),
(113, 259, 14),
(114, 259, 11),
(115, 259, 9),
(116, 259, 12),
(117, 259, 10),
(118, 260, 10),
(119, 260, 9),
(120, 260, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_variants`
--

CREATE TABLE `products_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `size_id` int(11) NOT NULL,
  `color_id` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `sku` text NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products_variants`
--

INSERT INTO `products_variants` (`id`, `product_id`, `size_id`, `color_id`, `price`, `sku`, `stock`) VALUES
(413, 256, 15, 2, 15600, 'NIKE-AIR MAX-T15-C2', 0),
(415, 256, 13, 2, 15600, 'NIKE-AIR MAX-T13-C2', 0),
(416, 256, 14, 2, 15600, 'NIKE-AIR MAX-T14-C2', 0),
(417, 256, 12, 2, 15600, 'NIKE-AIR MAX-T12-C2', 0),
(418, 256, 10, 2, 15600, 'NIKE-AIR MAX-T10-C2', 1),
(419, 256, 11, 2, 15600, 'NIKE-AIR MAX-T11-C2', 0),
(422, 256, 15, 1, 15600, 'NIKE-AIR MAX-T15-C1', 0),
(423, 256, 14, 1, 15600, 'NIKE-AIR MAX-T14-C1', 0),
(424, 256, 10, 1, 15600, 'NIKE-AIR MAX-T10-C1', 1),
(425, 256, 13, 1, 15600, 'NIKE-AIR MAX-T13-C1', 0),
(426, 256, 12, 1, 15600, 'NIKE-AIR MAX-T12-C1', 1),
(427, 256, 9, 1, 15600, 'NIKE-AIR MAX-T9-C1', 0),
(428, 256, 11, 1, 15600, 'NIKE-AIR MAX-T11-C1', 1),
(429, 256, 9, 2, 15600, 'NIKE-AIR MAX-T9-C2', 1),
(430, 256, 15, 3, 15600, 'NIKE-AIR MAX-T15-C3', 1),
(431, 256, 14, 3, 15600, 'NIKE-AIR MAX-T14-C3', 1),
(432, 256, 10, 3, 15600, 'NIKE-AIR MAX-T10-C3', 1),
(433, 256, 12, 3, 15600, 'NIKE-AIR MAX-T12-C3', 0),
(434, 256, 9, 3, 15600, 'NIKE-AIR MAX-T9-C3', 0),
(435, 256, 11, 3, 15600, 'NIKE-AIR MAX-T11-C3', 0),
(436, 256, 13, 3, 15600, 'NIKE-AIR MAX-T13-C3', 1),
(443, 259, 14, 3, 42599, 'ZOOM-LEBRON-T14-C3', 10),
(444, 259, 15, 3, 42599, 'ZOOM-LEBRON-T15-C3', 12),
(445, 259, 12, 3, 42599, 'ZOOM-LEBRON-T12-C3', 1),
(446, 259, 11, 3, 42599, 'ZOOM-LEBRON-T11-C3', 0),
(447, 259, 10, 3, 42599, 'ZOOM-LEBRON-T10-C3', 1),
(448, 259, 9, 3, 42599, 'ZOOM-LEBRON-T9-C3', 0),
(449, 259, 13, 3, 42599, 'ZOOM-LEBRON-T13-C3', 1),
(450, 260, 11, 3, 45699, 'AIR-TRAINER 1 SP -T11-C3', 1),
(451, 260, 10, 3, 45699, 'AIR-TRAINER 1 SP -T10-C3', 1),
(452, 260, 9, 3, 45699, 'AIR-TRAINER 1 SP -T9-C3', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sizes_guide`
--

CREATE TABLE `sizes_guide` (
  `id` int(11) NOT NULL,
  `size_us` double NOT NULL,
  `size_arg` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sizes_guide`
--

INSERT INTO `sizes_guide` (`id`, `size_us`, `size_arg`) VALUES
(9, 6.5, 38),
(10, 7, 39),
(11, 7.5, 39.5),
(12, 8, 40),
(13, 8.5, 41),
(14, 9, 42),
(15, 10, 43);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` smallint(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `age` int(11) NOT NULL,
  `role` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `age`, `role`, `password`) VALUES
(1, 'Amaru Daicz', 'amarudaicz@gmail.com', 22, 'user', '$2a$10$a4fsPAd9OguaV/RvjhYdK.oaU/7kMeFPdLIB2WeV9XyIvMLwShcay'),
(60, 'Agustina Aragón', 'agusaragonnx@gmail.com', 0, 'user', '$2a$10$41cEkIH5zvmB2iKlu2dPQudWOOygvTzrpZ2Bx01NwMo.E6ZlGTKn2'),
(61, 'carlos', 'carlitos@gmail.com', 0, 'user', '$2a$10$LoWtdoNMyGHe6N2Vnn6UYuXNIQ2k0nmFE6TU9AmZ8pM3nhjExQn.a'),
(62, 'Agustina Aragón', 'agusaragonn1x@gmail.com', 0, 'user', '$2a$10$vVhNOsa1GJ44XK6hgeCz8O55bU4EDxyb8v.lI2MRXgyE0iCWllcD2'),
(63, 'Agustina Aragón', 'agusaragonnx2@gmail.com', 0, 'user', '$2a$10$qORlB8aKQycsBlvH2qrnhOQJCYnEuwEi6BTb4LxmEO.cVlwwqRrkO'),
(64, 'carlos', 'agusarago312nnx@gmail.com', 0, 'user', '$2a$10$vUbPm1djMYEW42h6RQ83LO8NwFsuDZ6amGnzUKFldy/.ilEF5gC9u'),
(65, 'Agustina Aragón', 'agusaragon23nx@gmail.com', 0, 'user', '$2a$10$uV8kZpUrj8oNMFHMk7KWT.N4shQen47KTOhsRYFXzzmUubX31uVy.'),
(66, 'Agustina Aragón', 'agusar3agonnx@gmail.com', 0, 'user', '$2a$10$rg.yrJuLC2YUkW/VmVQweO86o0.BlzZS880uGUH310yufWH.Cse0y'),
(67, 'Agustina Aragón', 'agusaragodsnnx@gmail.com', 0, 'user', '$2a$10$VmmJmYfGLz1KPz3QEcND8OYNCncNLjx2OOuS2WXESoXDir0HX97V2'),
(68, 'Agustina Aragónnnnn', 'carlitos@gmail.coms', 0, 'user', '$2a$10$uvZnO.Ia6NHGT52IcaAVkeGhZcxntJ/We6P592iSalpm91wTbJSPy'),
(69, 'Agustina Aragónew', 'carlitos@gmail.comdd', 0, 'user', '$2a$10$dYAVQfhQ4K57TryLJpYDf.PpDZVaiNtA1SO/vy69S8QB6gzIWmuLO'),
(70, 'amaru', 'amaru_rap2012@hotmail.com', 0, 'user', '$2a$10$V2ScJkHcVD1BdwI351t0DOoRaOVnJKH5Sv1oLiSyxxGO6px1LqBiS'),
(71, 'Agustina Aragón', 'carlitos@gmail.coml', 0, 'user', '$2a$10$lzFFFdgjzLvcH2CWeofMYOpXzuVYcwai9pMuSTw67EwGPifHri1py'),
(72, 'Amaru Daicz', 'test@test.com', 0, 'user', '$2a$10$ZuPHmgHVDgN8GycRgA1GzexaIFIvbdH.WGVVBCh9Cae6vt4HeANjO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `colors_guide`
--
ALTER TABLE `colors_guide`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_variant_id`),
  ADD KEY `order_details_ibfk_3` (`product_model_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products_categories`
--
ALTER TABLE `products_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `products_colors`
--
ALTER TABLE `products_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `products_colors_ibfk_3` (`product_model_id`);

--
-- Indices de la tabla `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_images_ibfk_1` (`product_model_id`);

--
-- Indices de la tabla `products_sizes`
--
ALTER TABLE `products_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_sizes_ibfk_2` (`size_id`),
  ADD KEY `products_sizes_ibfk_3` (`product_model_id`);

--
-- Indices de la tabla `products_variants`
--
ALTER TABLE `products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `size_id` (`size_id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `products_variants_ibfk_1` (`product_id`);

--
-- Indices de la tabla `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `sizes_guide`
--
ALTER TABLE `sizes_guide`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `colors_guide`
--
ALTER TABLE `colors_guide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT de la tabla `products_categories`
--
ALTER TABLE `products_categories`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `products_colors`
--
ALTER TABLE `products_colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT de la tabla `products_images`
--
ALTER TABLE `products_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `products_sizes`
--
ALTER TABLE `products_sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT de la tabla `products_variants`
--
ALTER TABLE `products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;

--
-- AUTO_INCREMENT de la tabla `sizes_guide`
--
ALTER TABLE `sizes_guide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_variant_id`) REFERENCES `products_variants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`product_model_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `products_categories`
--
ALTER TABLE `products_categories`
  ADD CONSTRAINT `products_categories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `products_colors`
--
ALTER TABLE `products_colors`
  ADD CONSTRAINT `products_colors_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `colors_guide` (`id`),
  ADD CONSTRAINT `products_colors_ibfk_3` FOREIGN KEY (`product_model_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `products_images`
--
ALTER TABLE `products_images`
  ADD CONSTRAINT `products_images_ibfk_1` FOREIGN KEY (`product_model_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `products_sizes`
--
ALTER TABLE `products_sizes`
  ADD CONSTRAINT `products_sizes_ibfk_2` FOREIGN KEY (`size_id`) REFERENCES `sizes_guide` (`id`),
  ADD CONSTRAINT `products_sizes_ibfk_3` FOREIGN KEY (`product_model_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `products_variants`
--
ALTER TABLE `products_variants`
  ADD CONSTRAINT `products_variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_variants_ibfk_2` FOREIGN KEY (`size_id`) REFERENCES `sizes_guide` (`id`),
  ADD CONSTRAINT `products_variants_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `colors_guide` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
