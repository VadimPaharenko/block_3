-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 24 2020 г., 16:55
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `block3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `img` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `img`) VALUES
(2, 'auto', 'https://s0.rbk.ru/v6_top_pics/media/img/7/68/755873760507687.jpg'),
(3, 'mobile', 'https://img.mvideo.ru/Pdb/30041492b.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `img` tinytext NOT NULL,
  `phone` tinytext NOT NULL,
  `e-mail` tinytext NOT NULL,
  `request` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `img`, `phone`, `e-mail`, `request`) VALUES
(1, 'Василий', 'https://n1s2.hsmedia.ru/b1/aa/6b/b1aa6b0333441bdcb60f9e106084082f/300x300_21_0704cf6f8e6f974d71708e46b653343a@620x620_0xc0a839a2_7954200861464173459.jpeg', '88005553535', 'basta@mail.ru', 'угу');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `header` tinytext NOT NULL,
  `anons` text NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `header`, `anons`, `date`, `description`) VALUES
(1, 'что-то произошло', 'что-то произошло в городе', '2020-07-08', 'что-то произошло в городе Караганда');

-- --------------------------------------------------------

--
-- Структура таблицы `prod and cat connect`
--

CREATE TABLE `prod and cat connect` (
  `prod_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `prod and cat connect`
--

INSERT INTO `prod and cat connect` (`prod_id`, `cat_id`) VALUES
(1, 2),
(2, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `img` tinytext NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  `main_cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `img`, `price`, `description`, `main_cat_id`) VALUES
(1, 'honda cr-v', 'https://auto.honda.ru/local/static/dist/img/auto/model/model-cr-v.png', 12, 'какой-то текст про то, что хонда супер', 2),
(2, 'nokia 6', 'https://cdn.svyaznoy.ru/upload/iblock/981/3650435_12.jpg/resize/483x483/hq/', 22, 'nokia super', 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `prod and cat connect`
--
ALTER TABLE `prod and cat connect`
  ADD PRIMARY KEY (`prod_id`,`cat_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_cat_id` (`main_cat_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `prod and cat connect`
--
ALTER TABLE `prod and cat connect`
  ADD CONSTRAINT `prod and cat connect_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `prod and cat connect_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `product` (`id`);

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`main_cat_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
