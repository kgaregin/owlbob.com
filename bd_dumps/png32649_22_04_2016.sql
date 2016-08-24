-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Апр 22 2016 г., 12:15
-- Версия сервера: 5.5.45
-- Версия PHP: 5.6.12

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

CREATE TABLE `authors` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`id`, `name`) VALUES
(1, 'Undefined'),
(2, 'Hachi'),
(3, 'Montana'),
(4, 'Diego'),
(5, 'Hachik'),
(6, 'HelloKitty'),
(7, 'Tolik'),
(8, 'Odri'),
(10, 'Pizdec');

-- --------------------------------------------------------

--
-- Структура таблицы `AuthorsCompositions`
--

CREATE TABLE `AuthorsCompositions` (
  `author_id` int(11) UNSIGNED NOT NULL,
  `composition_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `AuthorsCompositions`
--

INSERT INTO `AuthorsCompositions` (`author_id`, `composition_id`) VALUES
(1, 1),
(2, 1),
(2, 8),
(2, 9),
(3, 9),
(4, 9),
(10, 1),
(10, 12);

-- --------------------------------------------------------

--
-- Структура таблицы `compositions`
--

CREATE TABLE `compositions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(256) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `path` varchar(255) COLLATE utf8_bin NOT NULL,
  `published` date NOT NULL COMMENT 'publish date',
  `created` date NOT NULL COMMENT 'composition create date',
  `tags` text COLLATE utf8_bin NOT NULL COMMENT 'tags'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `compositions`
--

INSERT INTO `compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES
(1, 'Undefined', 'Undefined', 'Undefined', '2016-04-20', '0000-00-00', 'Undefined'),
(8, 'Fuking composition', 'Fuking description', 'fuckingpath', '2016-04-21', '0000-00-00', 'fuck tags'),
(9, 'Fuking composition', 'Fuking description', 'fuckingpat', '2016-04-21', '0000-00-00', 'fuck tags'),
(12, 'Undefined', 'Undefined', 'xyec', '2016-04-21', '0000-00-00', 'Undefined');

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'image id',
  `filename` varchar(64) COLLATE utf8_bin NOT NULL,
  `page` int(11) UNSIGNED NOT NULL,
  `composition_id` int(11) UNSIGNED NOT NULL,
  `cleaner_version` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES
(1, 'Undefined', 1, 1, 'Undefined'),
(2, 'Undefined', 2, 1, 'Undefined'),
(3, 'Undefined', 3, 1, 'Undefined'),
(4, 'Undefined', 4, 1, 'Undefined'),
(5, 'Undefined', 5, 1, 'Undefined'),
(6, 'Undefined', 6, 1, 'Undefined'),
(7, 'Undefined', 7, 1, 'Undefined'),
(8, 'Undefined', 8, 1, 'Undefined'),
(9, 'Undefined', 9, 1, 'Undefined'),
(10, 'Undefined', 10, 1, 'Undefined'),
(11, 'Undefined', 11, 1, 'Undefined'),
(12, 'Undefined', 12, 1, 'Undefined'),
(13, 'Undefined', 13, 1, 'Undefined'),
(14, 'Undefined', 14, 1, 'Undefined'),
(15, 'Undefined', 15, 1, 'Undefined'),
(16, 'Undefined', 16, 1, 'Undefined'),
(17, 'Undefined', 17, 1, 'Undefined'),
(18, 'fuckingpath', 1, 8, 'Undefined'),
(19, 'fuckingpath3', 2, 8, '1'),
(20, 'fuckingpath88', 3, 8, '1'),
(21, 'fuckingpath88', 4, 8, '1'),
(22, 'fuckingpath88', 5, 8, '1'),
(23, 'fuckingpath88', 6, 8, '1'),
(24, 'fuckingpath88', 88, 8, '1'),
(25, 'fuckingpath88', 8, 8, '1'),
(26, 'fuckingpath88', 89, 8, '1'),
(27, 'fuckingpath88', 90, 8, '1'),
(28, 'fuckingpath88', 9, 8, '1'),
(29, 'fuckingpath10', 10, 8, '1'),
(30, 'fuckingpath10', 91, 8, '1'),
(31, 'fuckingpath18', 18, 8, '1'),
(32, 'fuckingpath18', 21, 8, '1'),
(33, 'fuckingpath19', 211, 9, '1'),
(34, 'fuckingpath19', 212, 9, '1'),
(35, 'fuckingpath19', 213, 9, '1'),
(36, 'fuckingpath19', 214, 9, '1'),
(42, 'fuckingpath19', 215, 9, '1'),
(48, 'fuckingpath19', 216, 9, '1'),
(49, 'Undefined', 18, 1, 'Undefined'),
(52, 'Undefined', 19, 1, 'Undefined'),
(53, 'xyec24', 24, 12, 'Undefined'),
(54, 'xyec24', 10, 12, 'Undefined'),
(55, 'xyec24', 25, 12, 'Undefined'),
(60, 'xyec24', 26, 12, 'Undefined');

-- --------------------------------------------------------

--
-- Структура таблицы `logs`
--

CREATE TABLE `logs` (
  `id` int(11) UNSIGNED NOT NULL,
  `table_name` text COLLATE utf8_bin,
  `query` text COLLATE utf8_bin,
  `response` text COLLATE utf8_bin,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `logs`
--

INSERT INTO `logs` (`id`, `table_name`, `query`, `response`, `date_time`) VALUES
(3, '', '', 'Failed to login', '2016-04-20 14:38:55'),
(4, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'4\', \'1\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 15:00:41'),
(5, 'images', 'INSERT INTO  `png32649`.`images`\n                                          (`id`, `filename`, `page`, `composition_id`, `cleaner_version`)\n                                   VALUES (\'NULL\', \'Undefined\', \'5\',\n                                           \'1\', \'Undefined\');\n                            ', 'All done (OK)', '2016-04-20 15:01:43'),
(6, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'6\', \'1\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 15:08:20'),
(7, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'NULL\', \'Undefined\', \'Undefined\', \'Undefined\', \'2016-04-20\', \'0000-00-00\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 15:09:30'),
(8, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'7\', \'1\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 15:09:30'),
(9, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'8\', \'1\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 15:09:45'),
(10, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'NULL\', \'Undefined\', \'Undefined\', \'Undefined\', \'2016-04-20\', \'0000-00-00\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 15:41:43'),
(11, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'9\', \'1\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 15:41:43'),
(12, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'NULL\', \'Undefined\', \'Undefined\', \'Undefined\', \'2016-04-20\', \'0000-00-00\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 15:44:27'),
(13, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'10\', \'1\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 15:44:27'),
(14, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'NULL\', \'Undefined\', \'Undefined\', \'Undefined\', \'2016-04-20\', \'0000-00-00\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 15:51:04'),
(15, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'11\', \'1\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 15:51:04'),
(16, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'12\', \'1\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 15:52:56'),
(17, '', '', 'Failed to login', '2016-04-20 15:57:30'),
(18, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'13\', \'1\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 15:57:41'),
(19, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'NULL\', \'Undefined\', \'Undefined\', \'Undefined\', \'2016-04-20\', \'0000-00-00\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 15:58:12'),
(20, 'images', NULL, 'All done (OK)', '2016-04-20 15:58:12'),
(21, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'15\', \'1\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 23:08:05'),
(22, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'16\', \'1\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 23:13:28'),
(23, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'NULL\' , \'Hachi\'); ', 'All done (OK)', '2016-04-20 23:14:54'),
(24, 'AuthorsCompositions', 'INSERT INTO `png32649`.`AuthorsCompositions` (`author_id` ,`composition_id`) VALUES (\'2\', \'1\'); ', 'All done (OK)', '2016-04-20 23:14:54'),
(25, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'17\', \'1\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 23:14:54'),
(26, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'NULL\', \'Fuking composition\', \'Fuking description\', \'fuckingpath\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'All done (OK)', '2016-04-20 23:27:39'),
(27, 'AuthorsCompositions', 'INSERT INTO `png32649`.`AuthorsCompositions` (`author_id` ,`composition_id`) VALUES (\'2\', \'8\'); ', 'All done (OK)', '2016-04-20 23:27:39'),
(28, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath\', \'1\', \'8\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 23:27:39'),
(29, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath3\', \'2\', \'8\', \'1\'); ', 'All done (OK)', '2016-04-20 23:28:38'),
(30, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath88\', \'3\', \'8\', \'1\'); ', 'All done (OK)', '2016-04-20 23:29:07'),
(31, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath88\', \'4\', \'8\', \'1\'); ', 'All done (OK)', '2016-04-20 23:39:44'),
(32, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath88\', \'5\', \'8\', \'1\'); ', 'All done (OK)', '2016-04-20 23:41:57'),
(33, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath88\', \'6\', \'8\', \'1\'); ', 'All done (OK)', '2016-04-20 23:43:08'),
(34, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath88\', \'88\', \'8\', \'1\'); ', 'All done (OK)', '2016-04-20 23:44:02'),
(35, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath88\', \'8\', \'8\', \'1\'); ', 'All done (OK)', '2016-04-20 23:44:22'),
(36, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath88\', \'89\', \'8\', \'1\'); ', 'All done (OK)', '2016-04-20 23:44:35'),
(37, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath88\', \'90\', \'8\', \'1\'); ', 'All done (OK)', '2016-04-20 23:50:05'),
(38, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath88\', \'9\', \'8\', \'1\'); ', 'All done (OK)', '2016-04-20 23:50:28'),
(39, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath10\', \'10\', \'8\', \'1\'); ', 'All done (OK)', '2016-04-20 23:50:40'),
(40, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath10\', \'91\', \'8\', \'1\'); ', 'All done (OK)', '2016-04-20 23:50:46'),
(41, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath18\', \'18\', \'8\', \'1\'); ', 'All done (OK)', '2016-04-20 23:51:05'),
(42, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath18\', \'21\', \'8\', \'1\'); ', 'All done (OK)', '2016-04-20 23:51:12'),
(43, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'NULL\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'All done (OK)', '2016-04-20 23:51:52'),
(44, 'AuthorsCompositions', 'INSERT INTO `png32649`.`AuthorsCompositions` (`author_id` ,`composition_id`) VALUES (\'2\', \'9\'); ', 'All done (OK)', '2016-04-20 23:51:52'),
(45, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'9\', \'1\'); ', 'All done (OK)', '2016-04-20 23:51:52'),
(46, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'212\', \'9\', \'1\'); ', 'All done (OK)', '2016-04-20 23:51:57'),
(47, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'NULL\' , \'Montana\'); ', 'All done (OK)', '2016-04-20 23:52:54'),
(48, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'NULL\' , \'Diego\'); ', 'All done (OK)', '2016-04-20 23:52:54'),
(49, 'AuthorsCompositions', 'INSERT INTO `png32649`.`AuthorsCompositions` (`author_id` ,`composition_id`) VALUES (\'3\', \'9\'); ', 'All done (OK)', '2016-04-20 23:52:54'),
(50, 'AuthorsCompositions', 'INSERT INTO `png32649`.`AuthorsCompositions` (`author_id` ,`composition_id`) VALUES (\'4\', \'9\'); ', 'All done (OK)', '2016-04-20 23:52:54'),
(51, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'213\', \'9\', \'1\'); ', 'All done (OK)', '2016-04-20 23:52:54'),
(52, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'214\', \'9\', \'1\'); ', 'All done (OK)', '2016-04-20 23:53:08'),
(53, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'NULL\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'Failed to get response (Unexpected error occurred. Response given not numeric.)', '2016-04-20 23:58:36'),
(54, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'NULL\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'Failed to get response (Unexpected error occurred. Response given not numeric.)', '2016-04-21 00:15:05'),
(55, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'NULL\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'fuckingpat\' for key \'path\'', '2016-04-21 00:30:47'),
(56, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'NULL\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error. Duplicate entry \'fuckingpat\' for key \'path\'', '2016-04-21 00:38:11'),
(57, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error. Duplicate entry \'1\' for key \'PRIMARY\'', '2016-04-21 00:39:16'),
(58, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error. Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)', '2016-04-21 00:39:31'),
(59, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: ', '2016-04-21 08:01:26'),
(60, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: ', '2016-04-21 08:16:15'),
(61, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: ', '2016-04-21 08:16:37'),
(62, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)<br/>', '2016-04-21 08:19:04'),
(63, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)<br/>', '2016-04-21 08:19:26'),
(64, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'215\', \'9\', \'1\'); ', 'All done (OK)', '2016-04-21 08:19:49'),
(65, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<br/>', '2016-04-21 08:20:31'),
(66, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<br/>Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)<br/>', '2016-04-21 08:20:31'),
(67, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'\n', '2016-04-21 08:23:18'),
(68, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'\nCannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)\n', '2016-04-21 08:23:18'),
(69, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>', '2016-04-21 08:38:36'),
(70, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)<|s|>', '2016-04-21 08:38:36'),
(71, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>', '2016-04-21 08:48:53'),
(72, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)<|s|>', '2016-04-21 08:48:53'),
(73, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>', '2016-04-21 08:52:44'),
(74, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)<|s|>', '2016-04-21 08:52:44'),
(75, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>', '2016-04-21 08:53:16'),
(76, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)<|s|>', '2016-04-21 08:53:16'),
(77, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>', '2016-04-21 09:00:38'),
(78, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)<|s|>', '2016-04-21 09:00:38'),
(79, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>', '2016-04-21 09:00:53'),
(80, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)<|s|>', '2016-04-21 09:00:53'),
(81, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>', '2016-04-21 09:01:02'),
(82, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)<|s|>', '2016-04-21 09:01:02'),
(83, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>', '2016-04-21 09:01:14'),
(84, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)<|s|>', '2016-04-21 09:01:14'),
(85, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>', '2016-04-21 09:01:27'),
(86, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)<|s|>', '2016-04-21 09:01:27'),
(87, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'NULL\' , \'Hachi\'); ', 'DB error: Duplicate entry \'Hachi\' for key \'name\'<|s|>', '2016-04-21 09:01:51'),
(88, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>', '2016-04-21 09:12:03'),
(89, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'<|s|>Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)<|s|>', '2016-04-21 09:12:03'),
(90, '', '', 'Failed to login', '2016-04-21 09:13:19'),
(91, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', '', '2016-04-21 09:40:43'),
(92, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', '', '2016-04-21 09:40:43'),
(93, '', '', 'Failed to login', '2016-04-21 09:44:45'),
(94, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', '', '2016-04-21 09:45:00'),
(95, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', '', '2016-04-21 09:45:00'),
(96, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'Duplicate entry \'1\' for key \'PRIMARY\'', '2016-04-21 09:47:28'),
(97, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)', '2016-04-21 09:47:28'),
(98, '', '', 'Failed to login', '2016-04-21 09:50:31'),
(99, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', '', '2016-04-21 09:50:48'),
(100, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', '', '2016-04-21 09:50:48'),
(101, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'Duplicate entry \'1\' for key \'PRIMARY\'', '2016-04-21 09:53:03'),
(102, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)', '2016-04-21 09:53:03'),
(103, '', '', 'Failed to login', '2016-04-21 09:53:07'),
(104, '', '', 'Failed to login', '2016-04-21 09:55:14'),
(105, '', '', 'Failed to login', '2016-04-21 09:55:29'),
(106, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'Duplicate entry \'1\' for key \'PRIMARY\'', '2016-04-21 09:55:37'),
(107, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)', '2016-04-21 09:55:37'),
(108, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'Duplicate entry \'1\' for key \'PRIMARY\'', '2016-04-21 09:55:42'),
(109, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'', '2016-04-21 09:55:45'),
(110, '', '', 'No task given (nothing 2 do here)', '2016-04-21 09:56:00'),
(111, '', '', 'No task given (nothing 2 do here)', '2016-04-21 09:56:05'),
(112, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'216\', \'9\', \'1\'); ', 'All done (OK)', '2016-04-21 09:56:08'),
(113, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'', '2016-04-21 09:59:13'),
(114, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)', '2016-04-21 09:59:13'),
(115, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'5\' , \'Hachi\'); ', 'DB error: Duplicate entry \'Hachi\' for key \'name\'', '2016-04-21 10:00:52'),
(116, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'6\' , \'Montana\'); ', 'DB error: Duplicate entry \'Montana\' for key \'name\'', '2016-04-21 10:00:52'),
(117, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'7\' , \'Diego\'); ', 'DB error: Duplicate entry \'Diego\' for key \'name\'', '2016-04-21 10:00:52'),
(118, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'', '2016-04-21 10:00:52'),
(119, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)', '2016-04-21 10:00:52'),
(120, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'5\' , \'Hachik\'); ', 'All done (OK)', '2016-04-21 10:01:27'),
(121, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'6\' , \'Montana\'); ', 'DB error: Duplicate entry \'Montana\' for key \'name\'', '2016-04-21 10:01:27'),
(122, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'7\' , \'Diego\'); ', 'DB error: Duplicate entry \'Diego\' for key \'name\'', '2016-04-21 10:01:27'),
(123, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'', '2016-04-21 10:01:27'),
(124, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)', '2016-04-21 10:01:27'),
(125, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'5\' , \'Hachik\'); ', 'DB error: Duplicate entry \'5-Hachik\' for key \'PRIMARY\'', '2016-04-21 10:01:31'),
(126, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'6\' , \'Montana\'); ', 'DB error: Duplicate entry \'Montana\' for key \'name\'', '2016-04-21 10:01:31'),
(127, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'7\' , \'Diego\'); ', 'DB error: Duplicate entry \'Diego\' for key \'name\'', '2016-04-21 10:01:31'),
(128, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'', '2016-04-21 10:01:31'),
(129, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)', '2016-04-21 10:01:31'),
(130, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'5\' , \'Hachik\'); ', 'DB error: Duplicate entry \'5-Hachik\' for key \'PRIMARY\'', '2016-04-21 10:02:44'),
(131, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'6\' , \'Montana\'); ', 'DB error: Duplicate entry \'Montana\' for key \'name\'', '2016-04-21 10:02:44'),
(132, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'7\' , \'Diego\'); ', 'DB error: Duplicate entry \'Diego\' for key \'name\'', '2016-04-21 10:02:44'),
(133, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'', '2016-04-21 10:02:44'),
(134, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)', '2016-04-21 10:02:44'),
(135, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'5\' , \'Hachik\'); ', 'DB error: Duplicate entry \'5-Hachik\' for key \'PRIMARY\'', '2016-04-21 10:02:47'),
(136, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'6\' , \'Montana\'); ', 'DB error: Duplicate entry \'Montana\' for key \'name\'', '2016-04-21 10:02:47'),
(137, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'7\' , \'Diego\'); ', 'DB error: Duplicate entry \'Diego\' for key \'name\'', '2016-04-21 10:02:47'),
(138, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'', '2016-04-21 10:02:47'),
(139, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)', '2016-04-21 10:02:47'),
(140, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'5\' , \'Hachik\'); ', 'DB error: Duplicate entry \'5-Hachik\' for key \'PRIMARY\'', '2016-04-21 10:02:53'),
(141, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'6\' , \'Montana\'); ', 'DB error: Duplicate entry \'Montana\' for key \'name\'', '2016-04-21 10:02:53'),
(142, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'7\' , \'Diego\'); ', 'DB error: Duplicate entry \'Diego\' for key \'name\'', '2016-04-21 10:02:53'),
(143, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'', '2016-04-21 10:02:53'),
(144, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)', '2016-04-21 10:02:53'),
(145, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'5\' , \'Hachi\'); ', 'DB error: Duplicate entry \'5\' for key \'id\'', '2016-04-21 10:03:00'),
(146, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'6\' , \'Montana\'); ', 'DB error: Duplicate entry \'Montana\' for key \'name\'', '2016-04-21 10:03:00'),
(147, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'7\' , \'Diego\'); ', 'DB error: Duplicate entry \'Diego\' for key \'name\'', '2016-04-21 10:03:00'),
(148, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'', '2016-04-21 10:03:00'),
(149, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)', '2016-04-21 10:03:00'),
(150, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'5\' , \'Hachi\'); ', 'DB error: Duplicate entry \'5\' for key \'id\'', '2016-04-21 10:04:00'),
(151, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'6\' , \'Montana\'); ', 'DB error: Duplicate entry \'Montana\' for key \'name\'', '2016-04-21 10:04:00'),
(152, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'7\' , \'Diego\'); ', 'DB error: Duplicate entry \'Diego\' for key \'name\'', '2016-04-21 10:04:00'),
(153, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'1\', \'Fuking composition\', \'Fuking description\', \'fuckingpat\', \'2016-04-21\', \'0000-00-00\', \'fuck tags\'); ', 'DB error: Duplicate entry \'1\' for key \'PRIMARY\'', '2016-04-21 10:04:00'),
(154, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'fuckingpath19\', \'211\', \'5\', \'1\'); ', 'DB error: Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)', '2016-04-21 10:04:00'),
(155, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'8\' , \'Odri\'); ', 'All done (OK)', '2016-04-21 10:04:47'),
(156, '', '', 'Failed to login', '2016-04-21 10:32:25'),
(157, '', '', 'Failed to login', '2016-04-21 14:30:38'),
(158, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'18\', \'1\', \'Undefined\'); ', 'All done (OK)', '2016-04-21 14:31:22'),
(159, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'NULL\' , \'Undefined\'); ', 'DB error: Duplicate entry \'Undefined\' for key \'name\'', '2016-04-21 14:33:10'),
(160, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'NULL\', \'Undefined\', \'Undefined\', \'Undefined\', \'2016-04-21\', \'0000-00-00\', \'Undefined\'); ', 'DB error: Duplicate entry \'Undefined\' for key \'path\'', '2016-04-21 14:33:10'),
(161, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'Undefined\', \'Undefined\', \'Undefined\'); ', 'DB error: Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)', '2016-04-21 14:33:10'),
(162, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'6\' , \'HelloKitty\'); ', 'All done (OK)', '2016-04-21 14:34:31'),
(163, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'7\' , \'Tolik\'); ', 'All done (OK)', '2016-04-21 14:34:31'),
(164, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'NULL\', \'Undefined\', \'Undefined\', \'Undefined\', \'2016-04-21\', \'0000-00-00\', \'Undefined\'); ', 'DB error: Duplicate entry \'Undefined\' for key \'path\'', '2016-04-21 14:34:31'),
(165, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'Undefined\', \'Undefined\', \'Undefined\'); ', 'DB error: Cannot add or update a child row: a foreign key constraint fails (`png32649`.`images`, CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE)', '2016-04-21 14:34:31'),
(166, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'6\' , \'HelloKitty\'); ', 'DB error: Duplicate entry \'6-HelloKitty\' for key \'PRIMARY\'', '2016-04-21 14:34:45'),
(167, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'7\' , \'Tolik\'); ', 'DB error: Duplicate entry \'7-Tolik\' for key \'PRIMARY\'', '2016-04-21 14:34:45'),
(168, 'authors', 'INSERT INTO `png32649`.`authors` (`id` ,`name`) VALUES (\'NULL\' , \'Pizdec\'); ', 'All done (OK)', '2016-04-21 14:36:40'),
(169, 'AuthorsCompositions', 'INSERT INTO `png32649`.`AuthorsCompositions` (`author_id` ,`composition_id`) VALUES (\'10\', \'1\'); ', 'All done (OK)', '2016-04-21 14:36:40'),
(170, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'19\', \'1\', \'Undefined\'); ', 'All done (OK)', '2016-04-21 14:36:40'),
(171, 'compositions', 'INSERT INTO `png32649`.`compositions` (`id`, `name`, `description`, `path`, `published`, `created`, `tags`) VALUES (\'NULL\', \'Undefined\', \'Undefined\', \'xyec\', \'2016-04-21\', \'0000-00-00\', \'Undefined\'); ', 'All done (OK)', '2016-04-21 14:38:37'),
(172, 'AuthorsCompositions', 'INSERT INTO `png32649`.`AuthorsCompositions` (`author_id` ,`composition_id`) VALUES (\'10\', \'12\'); ', 'All done (OK)', '2016-04-21 14:38:37'),
(173, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'xyec24\', \'24\', \'12\', \'Undefined\'); ', 'All done (OK)', '2016-04-21 14:38:37'),
(174, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'xyec24\', \'10\', \'12\', \'Undefined\'); ', 'All done (OK)', '2016-04-21 14:39:05'),
(175, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'xyec24\', \'25\', \'12\', \'Undefined\'); ', 'All done (OK)', '2016-04-21 14:39:22'),
(176, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'60\', \'xyec24\', \'26\', \'12\', \'Undefined\'); ', 'All done (OK)', '2016-04-21 14:41:36'),
(177, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'60\', \'xyec24\', \'27\', \'12\', \'Undefined\'); ', 'DB error: Duplicate entry \'60\' for key \'PRIMARY\'', '2016-04-21 14:41:43');

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
  ADD KEY `id_3` (`id`);

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
  ADD UNIQUE KEY `path` (`path`);

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `compositions`
--
ALTER TABLE `compositions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'image id', AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT для таблицы `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `AuthorsCompositions`
--
ALTER TABLE `AuthorsCompositions`
  ADD CONSTRAINT `authorscompositions_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `authorscompositions_ibfk_2` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
