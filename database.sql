-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 23 2024 г., 16:52
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `database`
--

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id` int NOT NULL,
  `path` varchar(255) NOT NULL,
  `restaurants_or_caffe_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `path`, `restaurants_or_caffe_id`) VALUES
(2, '/cairac.jpg', 9),
(3, '/ricardo.jpg', 7),
(4, '/steicHaw.jpg', 8),
(5, '/roxberry.jpg', 11),
(6, '/cascad.jpg', 12),
(7, '/sultan.jpg', 13),
(8, '/love&Dubai.jpg', 14),
(9, '/greenBoxjpg.jpg', 15),
(10, '/Zhibek Zholy.png', 16),
(11, '/Burger Brothers.jpg', 17),
(12, '/Coffee Code.jpg', 18),
(13, '/harlem.jpg', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_03_22_140754_create_caffes_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `restaurants_or_caffes`
--

CREATE TABLE `restaurants_or_caffes` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('restaurant','cafe') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `about` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `restaurants_or_caffes`
--

INSERT INTO `restaurants_or_caffes` (`id`, `name`, `type`, `price`, `about`) VALUES
(7, 'Ricardo', 'restaurant', '6000.00', '?Ricardo? ? это первое в Казахстане авторское кафе от всемирно известного шеф-повара Димы Советова. Открытое в 2017 году в самом сердце Алматы, это заведение изменило представление горожан о фастфуде, утвердив вкус и качество на первом месте. Уникальный формат ?Ricardo? сочетает в себе концепции фастфуда и ресторанного сервиса: идеальное место для делового обеда, корпоративного мероприятия, дружеской встречи или романтического ужина.'),
(8, 'Стейкхаус', 'restaurant', '10000.00', 'Стейк-хаус бар Алматы'),
(9, 'Кайрак', 'cafe', '2500.00', 'Огромное ассортимент рыбы и мяса'),
(10, 'Харлеем', 'cafe', '12000.00', 'Красивый вечерний вид на город'),
(11, 'Roxberry', 'restaurant', '5000.00', 'Ресторан известен своей кухней и интерьером'),
(12, 'Каскад', 'cafe', '3000.00', 'Один из старейших кафе в городе'),
(13, 'Sultan', 'restaurant', '8000.00', 'Ресторан Sultan предлагает уникальную атмосферу восточного гостеприимства и изысканной кухни. Изысканные блюда, приготовленные по оригинальным рецептам, порадуют даже самых взыскательных гурманов.'),
(14, 'Love&Dubai', 'restaurant', '6000.00', 'Love&Dubai ? это уютное и стильное заведение в центре Алматы, которое совмещает в себе приятные моменты отдыха с высококлассным сервисом и разнообразным меню.'),
(15, 'GreenBox', 'cafe', '3500.00', 'Кафе GreenBox предлагает своим гостям не только великолепный интерьер и атмосферу, но и самые свежие и вкусные блюда здорового питания.'),
(16, 'Zhibek Zholy', 'cafe', '3000.00', 'Кафе Zhibek Zholy находится в историческом центре города и предлагает богатое меню с элементами национальной и европейской кухонь.'),
(17, 'Burger Brothers', 'restaurant', '4500.00', 'Burger Brothers ? это место, где можно насладиться ароматными бургерами и приятной атмосферой в компании семьи и друзей.'),
(18, 'Coffee Code', 'cafe', '2000.00', 'Кафе Coffee Code ? это идеальное место для любителей ароматного кофе и вкусных десертов, где каждый гость может провести время с пользой и удовольствием.');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `restaurants_or_caffe_id` int NOT NULL,
  `rating` int NOT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `restaurants_or_caffe_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(7, 7, 5, 'Отличное место, вкусная еда и приятная атмосфера.', '2024-03-23 10:34:11', '0000-00-00 00:00:00'),
(8, 7, 4, 'Хороший сервис, но цены могли бы быть ниже.', '2024-03-23 10:34:11', '0000-00-00 00:00:00'),
(9, 8, 5, 'Идеальный стейк! Очень вкусно.', '2024-03-23 10:34:11', '0000-00-00 00:00:00'),
(10, 8, 4, 'Хорошее место, но шумновато.', '2024-03-23 10:34:11', '0000-00-00 00:00:00'),
(11, 9, 3, 'Обычное кафе, ничего особенного.', '2024-03-23 10:34:11', '0000-00-00 00:00:00'),
(12, 9, 2, 'Не понравилось обслуживание, ожидание было долгим.', '2024-03-23 10:34:11', '0000-00-00 00:00:00'),
(13, 10, 4, 'Отличная атмосфера и вид из окна.', '2024-03-23 10:34:11', '0000-00-00 00:00:00'),
(14, 10, 5, 'Очень вкусный кофе и десерты.', '2024-03-23 10:34:11', '0000-00-00 00:00:00'),
(15, 11, 5, 'Лучшие бургеры в городе!', '2024-03-23 10:34:11', '0000-00-00 00:00:00'),
(16, 11, 3, 'Цены завышены, порции небольшие.', '2024-03-23 10:34:11', '0000-00-00 00:00:00'),
(17, 12, 4, 'Вкусные блюда и приятное обслуживание.', '2024-03-23 10:34:11', '0000-00-00 00:00:00'),
(18, 12, 4, 'Кофе вкусный, но цены высокие.', '2024-03-23 10:34:11', '0000-00-00 00:00:00'),
(19, 13, 4, 'Понравилась атмосфера, приятное место для встреч с друзьями.', '2024-03-23 10:34:41', '0000-00-00 00:00:00'),
(20, 13, 5, 'Очень вкусные и креативные блюда, рекомендую!', '2024-03-23 10:34:41', '0000-00-00 00:00:00'),
(21, 14, 3, 'Среднее качество еды, но дешево.', '2024-03-23 10:34:41', '0000-00-00 00:00:00'),
(22, 14, 2, 'Не понравилось обслуживание, официанты были не вежливы.', '2024-03-23 10:34:41', '0000-00-00 00:00:00'),
(23, 15, 5, 'Отличное место, чтобы отдохнуть и насладиться вкусной кухней.', '2024-03-23 10:34:41', '0000-00-00 00:00:00'),
(24, 15, 4, 'Хороший выбор блюд и напитков, атмосфера восхитительная.', '2024-03-23 10:34:41', '0000-00-00 00:00:00'),
(25, 16, 4, 'Качественная и вкусная еда, атмосфера непринужденная.', '2024-03-23 10:34:41', '0000-00-00 00:00:00'),
(26, 16, 5, 'Очень уютное и приятное кафе, обязательно вернемся снова.', '2024-03-23 10:34:41', '0000-00-00 00:00:00'),
(27, 17, 3, 'Бургеры нормальные, но ничем не выделяются.', '2024-03-23 10:34:41', '0000-00-00 00:00:00'),
(28, 17, 4, 'Приятное место, чтобы провести время с друзьями.', '2024-03-23 10:34:41', '0000-00-00 00:00:00'),
(29, 18, 5, 'Очень вкусные и полезные блюда, всегда приятно посещать это кафе.', '2024-03-23 10:34:41', '0000-00-00 00:00:00'),
(30, 18, 4, 'Хорошая атмосфера и вежливый персонал.', '2024-03-23 10:34:41', '0000-00-00 00:00:00'),
(58, 18, 4, NULL, '2024-03-23 09:26:35', '2024-03-23 09:26:35'),
(59, 9, 4, NULL, '2024-03-23 09:27:57', '2024-03-23 09:27:57'),
(60, 7, 4, NULL, '2024-03-23 09:43:30', '2024-03-23 09:43:30'),
(61, 7, 4, NULL, '2024-03-23 10:43:23', '2024-03-23 10:43:23');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_or_caffe_id` (`restaurants_or_caffe_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `restaurants_or_caffes`
--
ALTER TABLE `restaurants_or_caffes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_or_cafe_id` (`restaurants_or_caffe_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `restaurants_or_caffes`
--
ALTER TABLE `restaurants_or_caffes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`restaurants_or_caffe_id`) REFERENCES `restaurants_or_caffes` (`id`);

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`restaurants_or_caffe_id`) REFERENCES `restaurants_or_caffes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
