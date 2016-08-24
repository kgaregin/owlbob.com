-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 12 2016 г., 01:23
-- Версия сервера: 5.7.11
-- Версия PHP: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `png32649`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE IF NOT EXISTS `authors` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`id`, `name`) VALUES
(1, 'Schumann, Robert, 1810-1856'),
(2, 'Gouvy, Th. (Theodore), 1819-1898'),
(3, 'Raff, Joachim, 1822-1882'),
(4, 'Lalo, Edouard, 1823-1892');

-- --------------------------------------------------------

--
-- Структура таблицы `AuthorsCompositions`
--

CREATE TABLE IF NOT EXISTS `AuthorsCompositions` (
  `author_id` int(11) unsigned NOT NULL,
  `composition_id` int(11) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `AuthorsCompositions`
--

INSERT INTO `AuthorsCompositions` (`author_id`, `composition_id`) VALUES
(1, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `compositions`
--

CREATE TABLE IF NOT EXISTS `compositions` (
  `id` int(11) unsigned NOT NULL,
  `name` text COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `path` varchar(255) COLLATE utf8_bin NOT NULL,
  `published` text COLLATE utf8_bin NOT NULL COMMENT 'publish date',
  `created` text COLLATE utf8_bin COMMENT 'composition create date',
  `tags` text COLLATE utf8_bin NOT NULL COMMENT 'tags',
  `genre` text COLLATE utf8_bin,
  `instrument` text COLLATE utf8_bin
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `compositions`
--

INSERT INTO `compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`, `genre`, `instrument`) VALUES
(1, 'Trio fur Pianoforte, Violine und Violoncell : Op. 63', 'Unknown', 'triofurpianofortschu_0', 'Leipzig : Bei Breitkopf Hartel', '1848', 'Piano trios', 'Unknown', 'Unknown'),
(2, '1er trio pour piano, violon et violoncelle, op. 8', 'Unknown', '1ertriopourpianogouv', 'Leipzig : Breitkopf Hartel', '1853', 'Piano trios', 'Unknown', 'Unknown'),
(3, '1er trio pour piano, violon et violoncelle, op. 8', 'Unknown', '1ertriopourpianogouv_0', 'Leipzig : Breitkopf Hartel', '1853', 'Piano trios', 'Unknown', 'Unknown'),
(4, '1er trio pour piano, violon et violoncelle, op. 8', 'Unknown', '1ertriopourpianogouv_1', 'Leipzig : Breitkopf Hartel', '1853', 'Piano trios', 'Unknown', 'Unknown'),
(5, '1. grosses Trio, C moll, fur Pianoforte, Violine und Violoncell. Op. 102', 'Unknown', '1grossestriocmolraff', 'Leipzig, Schuberth', '1861', 'Piano trios', 'Unknown', 'Unknown'),
(6, '1. grosses Trio, C moll, fur Pianoforte, Violine und Violoncell. Op. 102', 'Unknown', '1grossestriocmolraff_0', 'Leipzig, Schuberth', '1861', 'Piano trios', 'Unknown', 'Unknown'),
(7, '2e. trio (si mineur) pour piano, violon et violoncelle', 'Unknown', '2etriosimineurpo00lalo', '2016-05-10', '1877', 'Piano trios', 'Unknown', 'Unknown');

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) unsigned NOT NULL COMMENT 'image id',
  `filename` varchar(64) COLLATE utf8_bin NOT NULL,
  `page` int(11) unsigned NOT NULL,
  `composition_id` int(11) unsigned NOT NULL,
  `cleaner_version` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES
(1, '0001.png', 1, 1, 'Unknown'),
(2, '0002.png', 2, 1, 'Unknown'),
(3, '0003.png', 3, 1, 'Unknown'),
(4, '0004.png', 4, 1, 'Unknown'),
(5, '0005.png', 5, 1, 'Unknown'),
(6, '0006.png', 6, 1, 'Unknown'),
(7, '0007.png', 7, 1, 'Unknown'),
(8, '0008.png', 8, 1, 'Unknown'),
(9, '0009.png', 9, 1, 'Unknown'),
(10, '0010.png', 10, 1, 'Unknown'),
(11, '0011.png', 11, 1, 'Unknown'),
(12, '0012.png', 12, 1, 'Unknown'),
(13, '0013.png', 13, 1, 'Unknown'),
(14, '0014.png', 14, 1, 'Unknown'),
(15, '0016.png', 15, 1, 'Unknown'),
(16, '0017.png', 16, 1, 'Unknown'),
(17, '0018.png', 17, 1, 'Unknown'),
(18, '0001.png', 1, 2, 'Unknown'),
(19, '0002.png', 2, 2, 'Unknown'),
(20, '0003.png', 3, 2, 'Unknown'),
(21, '0004.png', 4, 2, 'Unknown'),
(22, '0005.png', 5, 2, 'Unknown'),
(23, '0006.png', 6, 2, 'Unknown'),
(24, '0007.png', 7, 2, 'Unknown'),
(25, '0008.png', 8, 2, 'Unknown'),
(26, '0009.png', 9, 2, 'Unknown'),
(27, '0010.png', 10, 2, 'Unknown'),
(28, '0011.png', 11, 2, 'Unknown'),
(29, '0012.png', 12, 2, 'Unknown'),
(30, '0013.png', 13, 2, 'Unknown'),
(31, '0014.png', 14, 2, 'Unknown'),
(32, '0016.png', 15, 2, 'Unknown'),
(33, '0017.png', 16, 2, 'Unknown'),
(34, '0018.png', 17, 2, 'Unknown'),
(35, '0001.png', 1, 3, 'Unknown'),
(36, '0002.png', 2, 3, 'Unknown'),
(37, '0003.png', 3, 3, 'Unknown'),
(38, '0004.png', 4, 3, 'Unknown'),
(39, '0005.png', 5, 3, 'Unknown'),
(40, '0006.png', 6, 3, 'Unknown'),
(41, '0007.png', 7, 3, 'Unknown'),
(42, '0008.png', 8, 3, 'Unknown'),
(43, '0009.png', 9, 3, 'Unknown'),
(44, '0010.png', 10, 3, 'Unknown'),
(45, '0011.png', 11, 3, 'Unknown'),
(46, '0012.png', 12, 3, 'Unknown'),
(47, '0013.png', 13, 3, 'Unknown'),
(48, '0014.png', 14, 3, 'Unknown'),
(49, '0015.png', 15, 3, 'Unknown'),
(50, '0016.png', 16, 3, 'Unknown'),
(51, '0017.png', 17, 3, 'Unknown'),
(52, '0018.png', 18, 3, 'Unknown'),
(53, '0019.png', 19, 3, 'Unknown'),
(54, '0020.png', 20, 3, 'Unknown'),
(55, '0021.png', 21, 3, 'Unknown'),
(56, '0022.png', 22, 3, 'Unknown'),
(57, '0023.png', 23, 3, 'Unknown'),
(58, '0024.png', 24, 3, 'Unknown'),
(59, '0025.png', 25, 3, 'Unknown'),
(60, '0026.png', 26, 3, 'Unknown'),
(61, '0027.png', 27, 3, 'Unknown'),
(62, '0028.png', 28, 3, 'Unknown'),
(63, '0029.png', 29, 3, 'Unknown'),
(64, '0030.png', 30, 3, 'Unknown'),
(65, '0031.png', 31, 3, 'Unknown'),
(66, '0032.png', 32, 3, 'Unknown'),
(67, '0033.png', 33, 3, 'Unknown'),
(68, '0034.png', 34, 3, 'Unknown'),
(69, '0035.png', 35, 3, 'Unknown'),
(70, '0036.png', 36, 3, 'Unknown'),
(71, '0037.png', 37, 3, 'Unknown'),
(72, '0038.png', 38, 3, 'Unknown'),
(73, '0039.png', 39, 3, 'Unknown'),
(74, '0040.png', 40, 3, 'Unknown'),
(75, '0041.png', 41, 3, 'Unknown'),
(76, '0042.png', 42, 3, 'Unknown'),
(77, '0043.png', 43, 3, 'Unknown'),
(78, '0044.png', 44, 3, 'Unknown'),
(79, '0045.png', 45, 3, 'Unknown'),
(80, '0046.png', 46, 3, 'Unknown'),
(81, '0047.png', 47, 3, 'Unknown'),
(82, '0048.png', 48, 3, 'Unknown'),
(83, '0049.png', 49, 3, 'Unknown'),
(84, '0050.png', 50, 3, 'Unknown'),
(85, '0051.png', 51, 3, 'Unknown'),
(86, '0052.png', 52, 3, 'Unknown'),
(87, '0053.png', 53, 3, 'Unknown'),
(88, '0054.png', 54, 3, 'Unknown'),
(89, '0055.png', 55, 3, 'Unknown'),
(90, '0056.png', 56, 3, 'Unknown'),
(91, '0057.png', 57, 3, 'Unknown'),
(92, '0058.png', 58, 3, 'Unknown'),
(93, '0000.png', 1, 4, 'Unknown'),
(94, '0001.png', 2, 4, 'Unknown'),
(95, '0002.png', 3, 4, 'Unknown'),
(96, '0003.png', 4, 4, 'Unknown'),
(97, '0004.png', 5, 4, 'Unknown'),
(98, '0005.png', 6, 4, 'Unknown'),
(99, '0006.png', 7, 4, 'Unknown'),
(100, '0007.png', 8, 4, 'Unknown'),
(101, '0008.png', 9, 4, 'Unknown'),
(102, '0009.png', 10, 4, 'Unknown'),
(103, '0010.png', 11, 4, 'Unknown'),
(104, '0011.png', 12, 4, 'Unknown'),
(105, '0012.png', 13, 4, 'Unknown'),
(106, '0001.png', 1, 5, 'Unknown'),
(107, '0002.png', 2, 5, 'Unknown'),
(108, '0003.png', 3, 5, 'Unknown'),
(109, '0004.png', 4, 5, 'Unknown'),
(110, '0005.png', 5, 5, 'Unknown'),
(111, '0006.png', 6, 5, 'Unknown'),
(112, '0007.png', 7, 5, 'Unknown'),
(113, '0008.png', 8, 5, 'Unknown'),
(114, '0009.png', 9, 5, 'Unknown'),
(115, '0010.png', 10, 5, 'Unknown'),
(116, '0011.png', 11, 5, 'Unknown'),
(117, '0012.png', 12, 5, 'Unknown'),
(118, '0013.png', 13, 5, 'Unknown'),
(119, '0014.png', 14, 5, 'Unknown'),
(120, '0015.png', 15, 5, 'Unknown'),
(121, '0016.png', 16, 5, 'Unknown'),
(122, '0017.png', 17, 5, 'Unknown'),
(123, '0018.png', 18, 5, 'Unknown'),
(124, '0019.png', 19, 5, 'Unknown'),
(125, '0020.png', 20, 5, 'Unknown'),
(126, '0021.png', 21, 5, 'Unknown'),
(127, '0001.png', 1, 6, 'Unknown'),
(128, '0002.png', 2, 6, 'Unknown'),
(129, '0003.png', 3, 6, 'Unknown'),
(130, '0004.png', 4, 6, 'Unknown'),
(131, '0005.png', 5, 6, 'Unknown'),
(132, '0006.png', 6, 6, 'Unknown'),
(133, '0007.png', 7, 6, 'Unknown'),
(134, '0008.png', 8, 6, 'Unknown'),
(135, '0009.png', 9, 6, 'Unknown'),
(136, '0010.png', 10, 6, 'Unknown'),
(137, '0011.png', 11, 6, 'Unknown'),
(138, '0012.png', 12, 6, 'Unknown'),
(139, '0013.png', 13, 6, 'Unknown'),
(140, '0014.png', 14, 6, 'Unknown'),
(141, '0015.png', 15, 6, 'Unknown'),
(142, '0016.png', 16, 6, 'Unknown'),
(143, '0017.png', 17, 6, 'Unknown'),
(144, '0018.png', 18, 6, 'Unknown'),
(145, '0019.png', 19, 6, 'Unknown'),
(146, '0020.png', 20, 6, 'Unknown'),
(147, '0021.png', 21, 6, 'Unknown'),
(148, '0001.png', 1, 7, 'Unknown'),
(149, '0002.png', 2, 7, 'Unknown'),
(150, '0003.png', 3, 7, 'Unknown'),
(151, '0004.png', 4, 7, 'Unknown'),
(152, '0005.png', 5, 7, 'Unknown'),
(153, '0006.png', 6, 7, 'Unknown'),
(154, '0007.png', 7, 7, 'Unknown'),
(155, '0008.png', 8, 7, 'Unknown'),
(156, '0009.png', 9, 7, 'Unknown'),
(157, '0010.png', 10, 7, 'Unknown'),
(158, '0011.png', 11, 7, 'Unknown'),
(159, '0012.png', 12, 7, 'Unknown'),
(160, '0013.png', 13, 7, 'Unknown'),
(161, '0014.png', 14, 7, 'Unknown'),
(162, '0015.png', 15, 7, 'Unknown'),
(163, '0016.png', 16, 7, 'Unknown'),
(164, '0017.png', 17, 7, 'Unknown'),
(165, '0018.png', 18, 7, 'Unknown'),
(166, '0019.png', 19, 7, 'Unknown'),
(167, '0020.png', 20, 7, 'Unknown'),
(168, '0021.png', 21, 7, 'Unknown'),
(169, '0022.png', 22, 7, 'Unknown'),
(170, '0023.png', 23, 7, 'Unknown'),
(171, '0024.png', 24, 7, 'Unknown'),
(172, '0025.png', 25, 7, 'Unknown'),
(173, '0026.png', 26, 7, 'Unknown'),
(174, '0027.png', 27, 7, 'Unknown'),
(175, '0028.png', 28, 7, 'Unknown'),
(176, '0029.png', 29, 7, 'Unknown'),
(177, '0030.png', 30, 7, 'Unknown'),
(178, '0031.png', 31, 7, 'Unknown'),
(179, '0032.png', 32, 7, 'Unknown'),
(180, '0033.png', 33, 7, 'Unknown'),
(181, '0034.png', 34, 7, 'Unknown'),
(182, '0035.png', 35, 7, 'Unknown'),
(183, '0036.png', 36, 7, 'Unknown'),
(184, '0037.png', 37, 7, 'Unknown'),
(185, '0038.png', 38, 7, 'Unknown'),
(186, '0039.png', 39, 7, 'Unknown'),
(187, '0040.png', 40, 7, 'Unknown'),
(188, '0041.png', 41, 7, 'Unknown'),
(189, '0042.png', 42, 7, 'Unknown'),
(190, '0043.png', 43, 7, 'Unknown'),
(191, '0044.png', 44, 7, 'Unknown'),
(192, '0045.png', 45, 7, 'Unknown'),
(193, '0046.png', 46, 7, 'Unknown'),
(194, '0047.png', 47, 7, 'Unknown'),
(195, '0048.png', 48, 7, 'Unknown'),
(196, '0049.png', 49, 7, 'Unknown'),
(197, '0050.png', 50, 7, 'Unknown'),
(198, '0051.png', 51, 7, 'Unknown'),
(199, '0052.png', 52, 7, 'Unknown'),
(200, '0053.png', 53, 7, 'Unknown'),
(201, '0054.png', 54, 7, 'Unknown'),
(202, '0055.png', 55, 7, 'Unknown'),
(203, '0056.png', 56, 7, 'Unknown');

-- --------------------------------------------------------

--
-- Структура таблицы `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) unsigned NOT NULL,
  `table_name` text COLLATE utf8_bin,
  `query` text COLLATE utf8_bin,
  `response` text COLLATE utf8_bin,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `logs`
--

INSERT INTO `logs` (`id`, `table_name`, `query`, `response`, `date_time`) VALUES
(1, 'authors', 'INSERT INTO  `png32649`.`authors`\r\n                                          (`id` ,`name`)\r\n                                   VALUES (NULL ,  ''Schumann, Robert, 1810-1856'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(2, 'compositions', 'INSERT INTO  `png32649`.`compositions`\r\n                                         (`id`, `name`, `description`, `path`, `published`, `created`, `tags`, `genre`, `instrument`)\r\n                                  VALUES (NULL, ''Trio fur Pianoforte, Violine und Violoncell : Op. 63'',\r\n                                          ''Unknown'', ''img/triofurpianofortschu_0/'', ''Leipzig : Bei Breitkopf Hartel'',\r\n                                          ''1848'', ''Piano trios'', ''Unknown'', ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(3, 'AuthorsCompositions', 'INSERT INTO  `png32649`.`AuthorsCompositions`\r\n                                          (`author_id` ,`composition_id`)\r\n                                   VALUES (1, 1);\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(4, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0001.png'', ''1'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(5, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0002.png'', ''2'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(6, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0003.png'', ''3'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(7, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0004.png'', ''4'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(8, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0005.png'', ''5'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(9, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0006.png'', ''6'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(10, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0007.png'', ''7'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(11, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0008.png'', ''8'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(12, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0009.png'', ''9'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(13, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0010.png'', ''10'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(14, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0011.png'', ''11'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(15, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0012.png'', ''12'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(16, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0013.png'', ''13'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(17, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0014.png'', ''14'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(18, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0016.png'', ''15'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(19, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0017.png'', ''16'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(20, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0018.png'', ''17'',\r\n                                           1, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:48:13'),
(21, 'authors', 'INSERT INTO  `png32649`.`authors`\r\n                                          (`id` ,`name`)\r\n                                   VALUES (NULL ,  ''Gouvy, Th. (Theodore), 1819-1898'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(22, 'compositions', 'INSERT INTO  `png32649`.`compositions`\r\n                                         (`id`, `name`, `description`, `path`, `published`, `created`, `tags`, `genre`, `instrument`)\r\n                                  VALUES (NULL, ''1er trio pour piano, violon et violoncelle, op. 8'',\r\n                                          ''Unknown'', ''img/1ertriopourpianogouv/'', ''Leipzig : Breitkopf Hartel'',\r\n                                          ''1853'', ''Piano trios'', ''Unknown'', ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(23, 'AuthorsCompositions', 'INSERT INTO  `png32649`.`AuthorsCompositions`\r\n                                          (`author_id` ,`composition_id`)\r\n                                   VALUES (2, 2);\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(24, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0001.png'', ''1'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(25, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0002.png'', ''2'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(26, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0003.png'', ''3'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(27, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0004.png'', ''4'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(28, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0005.png'', ''5'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(29, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0006.png'', ''6'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(30, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0007.png'', ''7'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(31, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0008.png'', ''8'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(32, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0009.png'', ''9'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(33, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0010.png'', ''10'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(34, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0011.png'', ''11'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(35, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0012.png'', ''12'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(36, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0013.png'', ''13'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(37, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0014.png'', ''14'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(38, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0016.png'', ''15'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(39, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0017.png'', ''16'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(40, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0018.png'', ''17'',\r\n                                           2, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 17:55:43'),
(41, 'compositions', 'INSERT INTO  `png32649`.`compositions`\r\n                                         (`id`, `name`, `description`, `path`, `published`, `created`, `tags`, `genre`, `instrument`)\r\n                                  VALUES (NULL, ''1er trio pour piano, violon et violoncelle, op. 8'',\r\n                                          ''Unknown'', ''img/1ertriopourpianogouv_0/'', ''Leipzig : Breitkopf Hartel'',\r\n                                          ''1853'', ''Piano trios'', ''Unknown'', ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(42, 'AuthorsCompositions', 'INSERT INTO  `png32649`.`AuthorsCompositions`\r\n                                          (`author_id` ,`composition_id`)\r\n                                   VALUES (2, 3);\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(43, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0001.png'', ''1'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(44, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0002.png'', ''2'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(45, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0003.png'', ''3'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(46, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0004.png'', ''4'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(47, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0005.png'', ''5'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(48, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0006.png'', ''6'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(49, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0007.png'', ''7'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(50, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0008.png'', ''8'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(51, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0009.png'', ''9'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(52, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0010.png'', ''10'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(53, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0011.png'', ''11'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(54, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0012.png'', ''12'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(55, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0013.png'', ''13'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(56, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0014.png'', ''14'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(57, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0015.png'', ''15'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(58, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0016.png'', ''16'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(59, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0017.png'', ''17'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(60, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0018.png'', ''18'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(61, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0019.png'', ''19'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(62, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0020.png'', ''20'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(63, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0021.png'', ''21'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(64, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0022.png'', ''22'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(65, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0023.png'', ''23'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(66, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0024.png'', ''24'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(67, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0025.png'', ''25'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(68, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0026.png'', ''26'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(69, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0027.png'', ''27'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(70, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0028.png'', ''28'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:43'),
(71, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0029.png'', ''29'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(72, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0030.png'', ''30'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(73, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0031.png'', ''31'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(74, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0032.png'', ''32'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(75, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0033.png'', ''33'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(76, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0034.png'', ''34'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(77, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0035.png'', ''35'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(78, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0036.png'', ''36'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(79, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0037.png'', ''37'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(80, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0038.png'', ''38'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(81, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0039.png'', ''39'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(82, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0040.png'', ''40'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(83, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0041.png'', ''41'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(84, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0042.png'', ''42'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(85, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0043.png'', ''43'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(86, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0044.png'', ''44'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(87, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0045.png'', ''45'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(88, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0046.png'', ''46'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(89, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0047.png'', ''47'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(90, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0048.png'', ''48'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(91, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0049.png'', ''49'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(92, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0050.png'', ''50'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(93, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0051.png'', ''51'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(94, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0052.png'', ''52'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(95, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0053.png'', ''53'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(96, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0054.png'', ''54'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(97, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0055.png'', ''55'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(98, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0056.png'', ''56'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(99, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0057.png'', ''57'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(100, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0058.png'', ''58'',\r\n                                           3, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:27:44'),
(101, 'compositions', 'INSERT INTO  `png32649`.`compositions`\r\n                                         (`id`, `name`, `description`, `path`, `published`, `created`, `tags`, `genre`, `instrument`)\r\n                                  VALUES (NULL, ''1er trio pour piano, violon et violoncelle, op. 8'',\r\n                                          ''Unknown'', ''img/1ertriopourpianogouv_1/'', ''Leipzig : Breitkopf Hartel'',\r\n                                          ''1853'', ''Piano trios'', ''Unknown'', ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:34:30'),
(102, 'AuthorsCompositions', 'INSERT INTO  `png32649`.`AuthorsCompositions`\r\n                                          (`author_id` ,`composition_id`)\r\n                                   VALUES (2, 4);\r\n                            ', 'All done (OK)', '2016-05-10 18:34:30'),
(103, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0000.png'', ''1'',\r\n                                           4, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:34:30'),
(104, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0001.png'', ''2'',\r\n                                           4, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:34:30'),
(105, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0002.png'', ''3'',\r\n                                           4, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:34:30'),
(106, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0003.png'', ''4'',\r\n                                           4, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:34:30'),
(107, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0004.png'', ''5'',\r\n                                           4, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:34:30'),
(108, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0005.png'', ''6'',\r\n                                           4, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:34:30'),
(109, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0006.png'', ''7'',\r\n                                           4, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:34:30'),
(110, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0007.png'', ''8'',\r\n                                           4, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:34:30'),
(111, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0008.png'', ''9'',\r\n                                           4, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:34:30'),
(112, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0009.png'', ''10'',\r\n                                           4, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:34:30'),
(113, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0010.png'', ''11'',\r\n                                           4, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:34:30'),
(114, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0011.png'', ''12'',\r\n                                           4, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:34:30'),
(115, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0012.png'', ''13'',\r\n                                           4, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:34:30'),
(116, 'authors', 'INSERT INTO  `png32649`.`authors`\r\n                                          (`id` ,`name`)\r\n                                   VALUES (NULL ,  ''Raff, Joachim, 1822-1882'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(117, 'compositions', 'INSERT INTO  `png32649`.`compositions`\r\n                                         (`id`, `name`, `description`, `path`, `published`, `created`, `tags`, `genre`, `instrument`)\r\n                                  VALUES (NULL, ''1. grosses Trio, C moll, fur Pianoforte, Violine und Violoncell. Op. 102'',\r\n                                          ''Unknown'', ''img/1grossestriocmolraff/'', ''Leipzig, Schuberth'',\r\n                                          ''1861'', ''Piano trios'', ''Unknown'', ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(118, 'AuthorsCompositions', 'INSERT INTO  `png32649`.`AuthorsCompositions`\r\n                                          (`author_id` ,`composition_id`)\r\n                                   VALUES (3, 5);\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(119, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0001.png'', ''1'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(120, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0002.png'', ''2'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(121, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0003.png'', ''3'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(122, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0004.png'', ''4'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(123, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0005.png'', ''5'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(124, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0006.png'', ''6'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(125, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0007.png'', ''7'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(126, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0008.png'', ''8'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(127, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0009.png'', ''9'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(128, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0010.png'', ''10'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(129, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0011.png'', ''11'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(130, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0012.png'', ''12'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(131, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0013.png'', ''13'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(132, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0014.png'', ''14'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(133, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0015.png'', ''15'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(134, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0016.png'', ''16'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00');
INSERT INTO `logs` (`id`, `table_name`, `query`, `response`, `date_time`) VALUES
(135, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0017.png'', ''17'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(136, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0018.png'', ''18'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(137, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0019.png'', ''19'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(138, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0020.png'', ''20'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(139, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0021.png'', ''21'',\r\n                                           5, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:44:00'),
(140, 'compositions', 'INSERT INTO  `png32649`.`compositions`\r\n                                         (`id`, `name`, `description`, `path`, `published`, `created`, `tags`, `genre`, `instrument`)\r\n                                  VALUES (NULL, ''1. grosses Trio, C moll, fur Pianoforte, Violine und Violoncell. Op. 102'',\r\n                                          ''Unknown'', ''img/1grossestriocmolraff_0/'', ''Leipzig, Schuberth'',\r\n                                          ''1861'', ''Piano trios'', ''Unknown'', ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(141, 'AuthorsCompositions', 'INSERT INTO  `png32649`.`AuthorsCompositions`\r\n                                          (`author_id` ,`composition_id`)\r\n                                   VALUES (3, 6);\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(142, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0001.png'', ''1'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(143, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0002.png'', ''2'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(144, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0003.png'', ''3'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(145, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0004.png'', ''4'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(146, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0005.png'', ''5'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(147, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0006.png'', ''6'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(148, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0007.png'', ''7'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(149, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0008.png'', ''8'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(150, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0009.png'', ''9'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(151, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0010.png'', ''10'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(152, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0011.png'', ''11'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(153, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0012.png'', ''12'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(154, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0013.png'', ''13'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(155, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0014.png'', ''14'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(156, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0015.png'', ''15'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(157, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0016.png'', ''16'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(158, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0017.png'', ''17'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(159, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0018.png'', ''18'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(160, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0019.png'', ''19'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(161, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0020.png'', ''20'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(162, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0021.png'', ''21'',\r\n                                           6, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 18:54:00'),
(163, 'authors', 'INSERT INTO  `png32649`.`authors`\r\n                                          (`id` ,`name`)\r\n                                   VALUES (NULL ,  ''Lalo, Edouard, 1823-1892'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(164, 'compositions', 'INSERT INTO  `png32649`.`compositions`\r\n                                         (`id`, `name`, `description`, `path`, `published`, `created`, `tags`, `genre`, `instrument`)\r\n                                  VALUES (NULL, ''2e. trio (si mineur) pour piano, violon et violoncelle'',\r\n                                          ''Unknown'', ''img/2etriosimineurpo00lalo/'', ''2016-05-10'',\r\n                                          ''1877'', ''Piano trios'', ''Unknown'', ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(165, 'AuthorsCompositions', 'INSERT INTO  `png32649`.`AuthorsCompositions`\r\n                                          (`author_id` ,`composition_id`)\r\n                                   VALUES (4, 7);\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(166, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0001.png'', ''1'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(167, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0002.png'', ''2'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(168, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0003.png'', ''3'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(169, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0004.png'', ''4'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(170, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0005.png'', ''5'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(171, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0006.png'', ''6'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(172, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0007.png'', ''7'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(173, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0008.png'', ''8'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(174, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0009.png'', ''9'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(175, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0010.png'', ''10'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(176, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0011.png'', ''11'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(177, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0012.png'', ''12'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(178, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0013.png'', ''13'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(179, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0014.png'', ''14'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(180, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0015.png'', ''15'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(181, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0016.png'', ''16'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(182, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0017.png'', ''17'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(183, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0018.png'', ''18'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:10'),
(184, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0019.png'', ''19'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(185, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0020.png'', ''20'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(186, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0021.png'', ''21'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(187, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0022.png'', ''22'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(188, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0023.png'', ''23'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(189, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0024.png'', ''24'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(190, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0025.png'', ''25'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(191, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0026.png'', ''26'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(192, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0027.png'', ''27'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(193, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0028.png'', ''28'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(194, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0029.png'', ''29'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(195, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0030.png'', ''30'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(196, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0031.png'', ''31'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(197, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0032.png'', ''32'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(198, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0033.png'', ''33'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(199, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0034.png'', ''34'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(200, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0035.png'', ''35'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(201, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0036.png'', ''36'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(202, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0037.png'', ''37'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(203, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0038.png'', ''38'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(204, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0039.png'', ''39'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(205, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0040.png'', ''40'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(206, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0041.png'', ''41'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(207, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0042.png'', ''42'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(208, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0043.png'', ''43'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(209, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0044.png'', ''44'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(210, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0045.png'', ''45'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(211, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0046.png'', ''46'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(212, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0047.png'', ''47'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(213, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0048.png'', ''48'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(214, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0049.png'', ''49'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(215, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0050.png'', ''50'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(216, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0051.png'', ''51'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(217, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0052.png'', ''52'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(218, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0053.png'', ''53'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(219, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0054.png'', ''54'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(220, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0055.png'', ''55'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11'),
(221, 'images', 'INSERT INTO  `png32649`.`images`\r\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\r\n                                   VALUES (NULL, ''0056.png'', ''56'',\r\n                                           7, ''Unknown'');\r\n                            ', 'All done (OK)', '2016-05-10 19:16:11');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`,`name`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `id_2` (`id`),
  ADD KEY `id_3` (`id`),
  ADD FULLTEXT KEY `name_2` (`name`);

--
-- Индексы таблицы `AuthorsCompositions`
--
ALTER TABLE `AuthorsCompositions`
  ADD KEY `authors_id` (`author_id`),
  ADD KEY `compositions_id` (`composition_id`);

--
-- Индексы таблицы `compositions`
--
ALTER TABLE `compositions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `path` (`path`),
  ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `compositions`
  ADD FULLTEXT KEY `name_2` (`name`);

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `composition_id` (`id`),
  ADD KEY `id` (`composition_id`);

--
-- Индексы таблицы `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `compositions`
--
ALTER TABLE `compositions`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'image id',AUTO_INCREMENT=204;
--
-- AUTO_INCREMENT для таблицы `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=222;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
