-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Ноя 07 2022 г., 05:15
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_voytenko5494_velosiped`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Bike`
--

CREATE TABLE `Bike` (
  `id` int NOT NULL COMMENT 'ИД велосипеда',
  `id_type` int NOT NULL COMMENT 'ИД типа велосипеда',
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Марка',
  `serial_number` int NOT NULL COMMENT 'Серийный номер'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Велосипед';

-- --------------------------------------------------------

--
-- Структура таблицы `Customers`
--

CREATE TABLE `Customers` (
  `id` int NOT NULL COMMENT 'ИД клиента',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ФИО',
  `id_parent` int NOT NULL COMMENT 'ИД родителя в таблице'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Order`
--

CREATE TABLE `Order` (
  `id` int NOT NULL COMMENT 'ИД заказа',
  `id_bike` int NOT NULL COMMENT 'ИД велосипеда',
  `id_rate` int NOT NULL COMMENT 'ИД тарифа',
  `id_customer` int NOT NULL COMMENT 'ИД клиента',
  `id_time` int NOT NULL COMMENT 'ИД времени'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Заказ';

-- --------------------------------------------------------

--
-- Структура таблицы `Rate`
--

CREATE TABLE `Rate` (
  `id` int NOT NULL COMMENT 'ИД тарифа',
  `price` float NOT NULL COMMENT 'Цена',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Наименование тарифа'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Тариф';

-- --------------------------------------------------------

--
-- Структура таблицы `Time`
--

CREATE TABLE `Time` (
  `id` int NOT NULL COMMENT 'ИД записи',
  `start` datetime NOT NULL COMMENT 'Время начала аренды',
  `deadline` datetime NOT NULL COMMENT 'Время лимита аренды',
  `finish` datetime NOT NULL COMMENT 'Фактическое время окончания аренды'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Время заказа';

-- --------------------------------------------------------

--
-- Структура таблицы `Type`
--

CREATE TABLE `Type` (
  `id` int NOT NULL COMMENT 'ИД типа',
  `type` varchar(255) NOT NULL COMMENT 'Тип велосипеда'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Тип велосипеда';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Bike`
--
ALTER TABLE `Bike`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type` (`id_type`);

--
-- Индексы таблицы `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Order`
--
ALTER TABLE `Order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bike` (`id_bike`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_rate` (`id_rate`),
  ADD KEY `id_time` (`id_time`);

--
-- Индексы таблицы `Rate`
--
ALTER TABLE `Rate`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Time`
--
ALTER TABLE `Time`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Type`
--
ALTER TABLE `Type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Bike`
--
ALTER TABLE `Bike`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ИД велосипеда';

--
-- AUTO_INCREMENT для таблицы `Customers`
--
ALTER TABLE `Customers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ИД клиента';

--
-- AUTO_INCREMENT для таблицы `Order`
--
ALTER TABLE `Order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ИД заказа';

--
-- AUTO_INCREMENT для таблицы `Rate`
--
ALTER TABLE `Rate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ИД тарифа';

--
-- AUTO_INCREMENT для таблицы `Time`
--
ALTER TABLE `Time`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ИД записи';

--
-- AUTO_INCREMENT для таблицы `Type`
--
ALTER TABLE `Type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ИД типа';

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Bike`
--
ALTER TABLE `Bike`
  ADD CONSTRAINT `Bike_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `Type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Order`
--
ALTER TABLE `Order`
  ADD CONSTRAINT `Order_ibfk_1` FOREIGN KEY (`id_bike`) REFERENCES `Bike` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Order_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `Customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Order_ibfk_3` FOREIGN KEY (`id_rate`) REFERENCES `Rate` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Order_ibfk_4` FOREIGN KEY (`id_time`) REFERENCES `Time` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
