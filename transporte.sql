-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-12-2021 a las 00:14:41
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `transporte`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

DROP TABLE IF EXISTS `novedades`;
CREATE TABLE IF NOT EXISTS `novedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `subtitulo` text NOT NULL,
  `cuerpo` text NOT NULL,
  `img_id` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `novedades`
--

INSERT INTO `novedades` (`id`, `titulo`, `subtitulo`, `cuerpo`, `img_id`) VALUES
(1, 'Última luna llena del año 2021: cuándo se verá la luna fría', 'Este será el último evento astronómico del año. Conoce las últimas noticias de la última luna llena del año 2021.', 'Antes de cerrar este periodo y dar inicio al Año Nuevo 2022, las personas serán testigos de lo que será la última Luna llena, también identificada como Luna fría, por el mes en que se muestra. Este se convertirá en uno de los espectáculos astronómicos más esperados por los estudiosos y fanáticos del universo, ya que tendrá una duración de 15 horas, aproximadamente.', NULL),
(2, 'Piura: destruyeron 400 cajas de cerveza decomisadas durante el toque de queda', 'Las botellas de cerveza fueron vaciadas en el botadero de Tambogrande. Los productos fueron incautados en reuniones familiares, bares y cantinas.', 'El Área de Fiscalización de la Municipalidad de Tambogrande, en Piura, procedió al vaciado de la cerveza contenida en las botellas de 400 cajas decomisadas durante los operativos que realizaron desde que se declaró la pandemia de la COVID-19 hasta la fecha, y que eran comercializadas durante el toque de queda. Los productos habían sido incautados en reuniones familiares, bares y cantinas.\r\n\r\nLa medida se realizó en el botadero de Tambogrande y está amparada en el Decreto Supremo N° 179-2020 dado en el marco de las medidas dictadas por el Gobierno Central para prevenir y combatir los contagios del coronavirus, acciones entre las que figuran la prohibición de la venta de bebidas alcohólicas durante el horario de inmovilidad social, lo cual fue desacatado en diferentes lugares del distrito.', NULL),
(3, 'Buscan en Cisjordania a los autores del ataque terrorista que mató a un colono israelí', 'Yehuda Dimentman, de 25 años, murió a causa de las heridas sufridas el jueves por la noche, después de haber sido víctima de disparos contra el coche en el que viajaba', 'Los soldados israelíes buscan este viernes en Cisjordania a los autores de un ataque terrorista que causó la muerte de un colono israelí y dejó dos heridos. Yehuda Dimentman, de 25 años, murió a causa de las heridas sufridas el jueves por la noche, después de haber sido víctima de disparos contra el coche en el que viajaba.\r\n\r\nEl conductor del vehículo y otro pasajero sufrieron heridas leves.\r\n\r\n\r\nEl ejército israelí informó haber desplegado batallones adicionales y fuerzas especiales para localizar a los atacantes que, según el ejército, son palestinos.\r\n\r\nEl jefe del Estado Mayor de Israel, el general Aviv Kochavi, indicó en un comunicado que se están utilizando herramientas de inteligencia, fuerzas de combate y que se van a expandir las operaciones, si es necesario.\r\n\r\n“No vamos a parar hasta que capturemos a los terroristas”, indicó Kochavi, quien visitó el lugar del ataque.', NULL),
(4, 'CDMX: Hospital Veterinario reabre sus puertas después de un año', 'El hospital ubicado en la alcaldía de Iztapalapa, cuenta con Unidad de Cuidados intensivos, área de rehabilitación física, electoterapia, rayos x, laboratorio clínico, cirugías de esterilización y consultas médicas generales', 'Tras casi un año de haber cerrado sus puertas por la pandemia de Covid-19, el Hospital Veterinario de la Ciudad de México reaperturó la atención para perros y gatos en sus instalaciones. A través de las redes sociales, la Secretaría del Medio Ambiente (Sedema) informó sobre la atención médica que se comenzará a brindar a aquellos animales que cuenten con Registro Único de Animales de Compañía (RUAC).\r\nAl interior de las instalaciones se recibirán a 300 pacientes durante las 24 horas del día entre lunes a viernes. Unidad de Cuidados intensivos, vacunas, cirugías de esterilización así como área de rehabilitación física, son algunas de los servicios que se brindan al interior del hospital.\r\n\r\nAdemás de ser el primer hospital veterinario público de la ciudad, esta clínica es considerada una de los mejores de Latinoamérica, teniendo acceso a atención especializada de alta calidad a un bajo costo. Los costos de los servicios en su gran mayoría son gratuitos, no obstante, aquellos procedimientos adicionales, cuentan con precios accesibles para la ciudadanía.', NULL),
(7, 'Prueba', 'prueba', 'prueba contenido', NULL),
(6, 'funciona', 'funciona', 'funciona', NULL),
(8, 'modificacion', 'modificancion', 'modificacion', 'k9qptqhjg8ifltloci75'),
(9, 'asdfsdfsd', 'sdfsdfdsasdd', 'sdfdsfsdfsd', ''),
(11, 'Prueba img 3', 'sjdlsdm', 'sjfldnsldc', 'udvrkgyodimcknwtc76w');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`) VALUES
(1, 'flavia', '81dc9bdb52d04dc20036dbd8313ed055'),
(2, 'melina', '285da2198b2b496c9d447cc4ac6b0734');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
