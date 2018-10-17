-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 17 okt 2018 om 15:18
-- Serverversie: 10.1.21-MariaDB
-- PHP-versie: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `classes`
--

CREATE TABLE `classes` (
  `id` int(10) NOT NULL,
  `class_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `projects`
--

CREATE TABLE `projects` (
  `id` int(10) NOT NULL,
  `pro_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `students`
--

CREATE TABLE `students` (
  `id` int(10) NOT NULL,
  `st_address` varchar(255) NOT NULL,
  `st_email` varchar(255) NOT NULL,
  `id_class` int(10) NOT NULL,
  `id_project` int(10) NOT NULL,
  `id_user` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `subjects`
--

CREATE TABLE `subjects` (
  `id` int(10) NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  `id_class` int(10) NOT NULL,
  `id_teacher` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `teachers`
--

CREATE TABLE `teachers` (
  `id` int(10) NOT NULL,
  `teach_email` varchar(255) NOT NULL,
  `id_subject` int(10) NOT NULL,
  `id_project` int(10) NOT NULL,
  `id_user` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `u_name` varchar(255) NOT NULL,
  `u_email` varchar(255) NOT NULL,
  `u_pwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users_projects`
--

CREATE TABLE `users_projects` (
  `id_user` int(10) NOT NULL,
  `id_project` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_students_classes` (`id_class`),
  ADD KEY `fk_students_projects` (`id_project`),
  ADD KEY `fk_students_users` (`id_user`);

--
-- Indexen voor tabel `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_subjects_teachers` (`id_teacher`),
  ADD KEY `fk_subjects_classes` (`id_class`);

--
-- Indexen voor tabel `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_teachers_subjects` (`id_subject`),
  ADD KEY `fk_teachers_projects` (`id_project`),
  ADD KEY `fk_teachers_users` (`id_user`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users_projects`
--
ALTER TABLE `users_projects`
  ADD KEY `fk_user_project` (`id_user`),
  ADD KEY `fk_user_project_projects` (`id_project`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_students_classes` FOREIGN KEY (`id_class`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `fk_students_projects` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `fk_students_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Beperkingen voor tabel `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `fk_subjects_classes` FOREIGN KEY (`id_class`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `fk_subjects_teachers` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `fk_subjects_users` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id`);

--
-- Beperkingen voor tabel `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `fk_teachers_projects` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `fk_teachers_subjects` FOREIGN KEY (`id_subject`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `fk_teachers_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Beperkingen voor tabel `users_projects`
--
ALTER TABLE `users_projects`
  ADD CONSTRAINT `fk_user_project` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_user_project_projects` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
