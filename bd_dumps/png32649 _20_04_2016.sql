-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Апр 20 2016 г., 19:07
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
(1, 'Undefined');

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
(1, 1);

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
(7, 'Undefined', 'Undefined', 'Undefined', '2016-04-20', '0000-00-00', 'Undefined');

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
(14, 'Undefined', 14, 1, 'Undefined');

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
(20, 'images', 'INSERT INTO `png32649`.`images` (`id`, `filename`, `page`, `composition_id`, `cleaner_version`) VALUES (\'NULL\', \'Undefined\', \'14\', \'1\', \'Undefined\'); ', 'All done (OK)', '2016-04-20 15:58:12');

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
  ADD UNIQUE KEY `id` (`id`);

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `compositions`
--
ALTER TABLE `compositions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'image id', AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `AuthorsCompositions`
--
ALTER TABLE `AuthorsCompositions`
  ADD CONSTRAINT `authorscompositions_ibfk_2` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `authorscompositions_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
