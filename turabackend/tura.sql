-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Máj 01. 19:22
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `tura`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jelentkezes`
--

CREATE TABLE `jelentkezes` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `tura_id` bigint(20) UNSIGNED NOT NULL,
  `jelentkezes_datuma` date NOT NULL,
  `fizetve` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `jelentkezes`
--

INSERT INTO `jelentkezes` (`user_id`, `tura_id`, `jelentkezes_datuma`, `fizetve`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-07-05', 1, '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(3, 3, '2024-03-18', 0, '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(6, 6, '2024-09-05', 1, '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(6, 7, '2024-08-13', 1, '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(7, 4, '2024-08-06', 1, '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(7, 5, '2024-03-11', 1, '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(9, 6, '2024-03-22', 1, '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(10, 9, '2024-03-17', 1, '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(11, 2, '2024-03-17', 1, '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(11, 7, '2024-07-04', 1, '2024-04-06 13:35:46', '2024-04-06 13:35:46');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '2024_04_06_135630_create_turatipuses_table', 1),
(3, '2024_04_06_135659_create_turavezetos_table', 1),
(4, '2024_04_06_135721_create_turas_table', 1),
(5, '2024_04_06_135750_create_jelentkezes_table', 1),
(6, '2024_04_06_152641_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `turas`
--

CREATE TABLE `turas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipus_id` bigint(20) UNSIGNED NOT NULL,
  `idopont` date NOT NULL,
  `turavezeto` bigint(20) UNSIGNED NOT NULL,
  `ar` int(11) NOT NULL,
  `min_letszam` int(11) NOT NULL,
  `max_letszam` int(11) NOT NULL,
  `statusz` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `turas`
--

INSERT INTO `turas` (`id`, `tipus_id`, `idopont`, `turavezeto`, `ar`, `min_letszam`, `max_letszam`, `statusz`) VALUES
(1, 6, '2024-05-23', 6, 4, 43, 86, 0),
(2, 12, '2024-09-05', 6, 3, 14, 62, 0),
(3, 8, '2024-07-06', 4, 1, 7, 79, 0),
(4, 10, '2024-06-09', 8, 3, 49, 57, 0),
(5, 7, '2024-08-29', 2, 3, 48, 65, 0),
(6, 8, '2024-07-09', 11, 3, 30, 67, 0),
(7, 2, '2024-05-12', 3, 2, 24, 84, 0),
(8, 13, '2024-07-01', 10, 3, 43, 94, 0),
(9, 15, '2024-06-23', 7, 5, 9, 72, 0),
(10, 12, '2024-05-05', 9, 2, 25, 54, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `turatipuses`
--

CREATE TABLE `turatipuses` (
  `tipus_id` bigint(20) UNSIGNED NOT NULL,
  `turanev` varchar(255) NOT NULL,
  `tajegyseg` varchar(255) NOT NULL,
  `nehezseg` varchar(255) NOT NULL,
  `tavolsag` int(11) NOT NULL,
  `szintkulonbseg` int(11) NOT NULL,
  `kerekpar` tinyint(1) NOT NULL,
  `indulashelye` varchar(255) NOT NULL,
  `erkezeshelye` varchar(255) NOT NULL,
  `leiras` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `turatipuses`
--

INSERT INTO `turatipuses` (`tipus_id`, `turanev`, `tajegyseg`, `nehezseg`, `tavolsag`, `szintkulonbseg`, `kerekpar`, `indulashelye`, `erkezeshelye`, `leiras`) VALUES
(1, 'Nagybörzsönyi_kör', 'Börzsöny', 'nehéz', 51, 900, 1, 'Szob', 'Szob', 'Szob-Ipolynádasd-Letkés-Ipolytölgyes-Nagybörzsöny--Farkas-völgy--Nagyírtás-Kisinóczi th.-Kóspallag-Márianosztra-Szob'),
(2, 'Pilis_kör', 'Pilis', 'nehéz', 42, 800, 1, 'Dorog', 'Dorog', 'Dorog-Kesztölc-Klastrompuszta-PilisSzántó-Pilisszentkereszt--Két-bükkfa-nyereg--Pilisszentlélek--Esztergom-Kertváros--Dorog'),
(3, 'Dunakanyar_kör', 'Dunakanyar', 'nehéz', 55, 600, 1, 'Szentendre', 'Szentendre', 'Szentendre-Skanzen--Papp-rét---Apátkúti-völgy-Visegrád-Nagymaros-Kismaros-Verőce-Vác-Tahitótfalu-Pócsmegyer-Szentendrei-sziget-Szentendre'),
(4, 'Bakonybél_körút', 'Bakony', 'középnehéz', 11, 400, 0, 'Bakonybél', 'Bakonybél', 'Bakonybél--Szarvad-árok--Odvaskő-barlang--Gerence-völgy--Tábor-hegy, Széchenyi-emlékkő--Bakonybél'),
(5, 'Dunakanyar-panoráma', 'Börzsöny', 'középnehéz', 9, 500, 0, 'Nagymaros', 'Zebegény', 'Nagymaros--Rigó-hegy-Szent_mihály-hegy--Ördög-hegy--Dobozi-orom--Borosktyán-kő--Zebegény'),
(6, 'ut', 'Tolna', '1', 29, 92, 0, 'qui', 'veniam', 'officiis'),
(7, 'itaque', 'Bács-Kiskun', '3', 11, 994, 1, 'enim', 'autem', 'quia'),
(8, 'reprehenderit', 'Győr-Moson-Sopron', '3', 45, 319, 1, 'sapiente', 'nihil', 'corrupti'),
(9, 'enim', 'Tolna', '3', 72, 330, 1, 'dolores', 'iure', 'ab'),
(10, 'est', 'Budapest', '4', 39, 841, 1, 'sint', 'et', 'quae'),
(11, 'placeat', 'Békés', '2', 96, 844, 0, 'et', 'qui', 'officia'),
(12, 'sint', 'Komárom-Esztergom', '5', 71, 984, 1, 'eum', 'in', 'nihil'),
(13, 'qui', 'Tolna', '2', 81, 814, 0, 'qui', 'reiciendis', 'molestias'),
(14, 'est', 'Pest', '5', 56, 348, 1, 'quisquam', 'magni', 'ab'),
(15, 'quasi', 'Pest', '5', 86, 333, 0, 'expedita', 'maxime', 'est');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `turavezetos`
--

CREATE TABLE `turavezetos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cim` varchar(255) NOT NULL,
  `telefonszam` varchar(255) NOT NULL,
  `belepesdatuma` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `turavezetos`
--

INSERT INTO `turavezetos` (`id`, `name`, `email`, `cim`, `telefonszam`, `belepesdatuma`) VALUES
(1, 'Karcsi', 'karcsi@zorotour.hu', '1212 Csepel u. 2.', '+36901234567', '2020-05-15'),
(2, 'Soós Patrícia PhD', 'kornel.halasz@vass.com', '8730 Nagykanizsa, Dorián lejtő 54. 08. emelet', '8257239', '2003-10-15'),
(3, 'Gróf Bogdánné Olívia', 'oliver.balog@budai.com', '3965 Budapest, Martina út 130. 02. ajtó', '8684250', '2007-11-17'),
(4, 'Ifj. Ráczné Gitta', 'cszekely@szilagyi.com', '5353 Debrecen, Julianna sétaút 963. 31. ajtó', '7163491', '2010-06-05'),
(5, 'Faragó Szervácné', 'ramona51@yahoo.com', '6367 Szeged, Somogyi gát 21.', '8212648', '2008-11-19'),
(6, 'Mészárosné Farkas Emőke', 'geza30@gmail.com', '4058 Budapest, Balázs sor 410.', '8824802', '2020-07-02'),
(7, 'Pásztor Sándor', 'laszlo.takacs@jonas.info', '2560 Budapest, Bogdán tere 98.', '5950989', '2004-03-18'),
(8, 'Dobos Mihályné', 'patricia.pataki@hotmail.com', '7559 Budapest, Pataki dűlőút 16. 52. ajtó', '6557524', '2020-07-23'),
(9, 'Novák Ármin PhD', 'npapp@hotmail.com', '3086 Budapest, Zétény mélyút 640.', '4282408', '2017-02-04'),
(10, 'Kis Boglárka', 'kiraly.balazs@horvath.com', '9526 Békéscsaba, Benedek orom 31. 30. emelet', '6620732', '2014-05-03'),
(11, 'Özv. Bodnár Mihályné', 'zeteny42@yahoo.com', '0017 Hódmezővásárhely, Gitta utca 488.', '579286', '2007-05-14');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `regisztracio_datuma` date NOT NULL,
  `telefonszam` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `regisztracio_datuma`, `telefonszam`, `email_verified_at`, `password`, `permission`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@zorotours.com', '2023-01-15', '+36901234567', '2024-04-01 12:17:06', '$2y$12$p0C34vPt1gb.Z3FDymqLBOLZcJ974wCcQu5iHcDcoTv1rK/oDrDSu', 'admin', NULL, '2024-04-06 13:34:08', '2024-04-06 13:34:08'),
(2, 'User', 'user@zorotours.com', '2023-01-15', '+36901234567', NULL, '$2y$12$vQdFC1oypNSkRVuL7vVMse0KzA6DIDNo2iPcjx0MH6K8TVjaCkOsu', 'user', NULL, '2024-04-06 13:34:09', '2024-04-06 13:34:09'),
(3, 'Test User', 'test@example.com', '2006-04-02', '2439268', '2024-04-06 13:34:15', '$2y$12$x1iTgKVgDLH5GBkepNaxzOLcIW1IpfvrBfp7pHc7wAESaDCDNbSu2', 'user', 'CGh6WXwYLO', '2024-04-06 13:34:15', '2024-04-06 13:34:15'),
(4, 'Dr. Hegedüs Noelné', 'fsandor@example.org', '2005-09-21', '4894672', '2024-04-06 13:35:46', '$2y$12$7AdjAc4Q1DEjlHqWJZHWEebCO2ycSkSN/28Rq/sTD5mX3mblrJWM6', 'user', '47G66D3MVp', '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(5, 'Ifj. Pintér Ottó PhD', 'sandor.nagy@example.org', '2010-11-17', '453939', '2024-04-06 13:35:46', '$2y$12$7AdjAc4Q1DEjlHqWJZHWEebCO2ycSkSN/28Rq/sTD5mX3mblrJWM6', 'user', 'HhayEnfwm5', '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(6, 'Török Attila', 'bence28@example.net', '2016-05-13', '2354456', '2024-04-06 13:35:46', '$2y$12$7AdjAc4Q1DEjlHqWJZHWEebCO2ycSkSN/28Rq/sTD5mX3mblrJWM6', 'user', 'n4vXkaoCIj', '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(7, 'Csonka Albert', 'gkis@example.com', '2010-07-27', '1996788', '2024-04-06 13:35:46', '$2y$12$7AdjAc4Q1DEjlHqWJZHWEebCO2ycSkSN/28Rq/sTD5mX3mblrJWM6', 'user', '5NZ1Mn5gQv', '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(8, 'Gróf Sipos Emőke', 'virag.balazs@example.org', '2001-12-03', '5823662', '2024-04-06 13:35:46', '$2y$12$7AdjAc4Q1DEjlHqWJZHWEebCO2ycSkSN/28Rq/sTD5mX3mblrJWM6', 'user', '7Qn9Ch1v5A', '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(9, 'Lakatos Gabriella PhD', 'toth.szandra@example.net', '2007-12-04', '8280072', '2024-04-06 13:35:46', '$2y$12$7AdjAc4Q1DEjlHqWJZHWEebCO2ycSkSN/28Rq/sTD5mX3mblrJWM6', 'user', 'mFPMCgXDUK', '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(10, 'Bakos Géza', 'kiraly.adam@example.org', '2022-07-20', '6376193', '2024-04-06 13:35:46', '$2y$12$7AdjAc4Q1DEjlHqWJZHWEebCO2ycSkSN/28Rq/sTD5mX3mblrJWM6', 'user', 'WES6gFZCjX', '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(11, 'Gulyásné Illés Dalma', 'fanni10@example.net', '2013-09-17', '7447274', '2024-04-06 13:35:46', '$2y$12$7AdjAc4Q1DEjlHqWJZHWEebCO2ycSkSN/28Rq/sTD5mX3mblrJWM6', 'user', '7ePe6GX2s6', '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(12, 'Özv. Kovács Noelné', 'chalasz@example.org', '2016-12-22', '7561328', '2024-04-06 13:35:46', '$2y$12$7AdjAc4Q1DEjlHqWJZHWEebCO2ycSkSN/28Rq/sTD5mX3mblrJWM6', 'user', 'CyCg9SBhLp', '2024-04-06 13:35:46', '2024-04-06 13:35:46'),
(13, 'Bodnár-Tamás Andrea', 'peter27@example.com', '2021-12-29', '1986815', '2024-04-06 13:35:46', '$2y$12$7AdjAc4Q1DEjlHqWJZHWEebCO2ycSkSN/28Rq/sTD5mX3mblrJWM6', 'user', 'gBqwq9qrxP', '2024-04-06 13:35:46', '2024-04-06 13:35:46');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `jelentkezes`
--
ALTER TABLE `jelentkezes`
  ADD PRIMARY KEY (`user_id`,`tura_id`),
  ADD KEY `jelentkezes_tura_id_foreign` (`tura_id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- A tábla indexei `turas`
--
ALTER TABLE `turas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `turas_tipus_id_foreign` (`tipus_id`),
  ADD KEY `turas_turavezeto_foreign` (`turavezeto`);

--
-- A tábla indexei `turatipuses`
--
ALTER TABLE `turatipuses`
  ADD PRIMARY KEY (`tipus_id`);

--
-- A tábla indexei `turavezetos`
--
ALTER TABLE `turavezetos`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `turas`
--
ALTER TABLE `turas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `turatipuses`
--
ALTER TABLE `turatipuses`
  MODIFY `tipus_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `turavezetos`
--
ALTER TABLE `turavezetos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `jelentkezes`
--
ALTER TABLE `jelentkezes`
  ADD CONSTRAINT `jelentkezes_tura_id_foreign` FOREIGN KEY (`tura_id`) REFERENCES `turas` (`id`),
  ADD CONSTRAINT `jelentkezes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Megkötések a táblához `turas`
--
ALTER TABLE `turas`
  ADD CONSTRAINT `turas_tipus_id_foreign` FOREIGN KEY (`tipus_id`) REFERENCES `turatipuses` (`tipus_id`),
  ADD CONSTRAINT `turas_turavezeto_foreign` FOREIGN KEY (`turavezeto`) REFERENCES `turavezetos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
