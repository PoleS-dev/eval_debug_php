-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 17 avr. 2025 à 12:41
-- Version du serveur : 8.0.41-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `forum1`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modification_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_subject` int UNSIGNED NOT NULL,
  `id_user` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `creation_date`, `modification_date`, `id_subject`, `id_user`) VALUES
(2, 'Les jointures SQL', 'Contenu SQL', '2025-04-16 14:23:01', '2025-04-16 14:23:01', 2, 2),
(3, 'trux', 'merci beaucoup', '2025-04-16 00:00:00', '2025-04-16 15:36:48', 1, 4),
(4, 'salut', 'au revoir', '2025-04-16 00:00:00', '2025-04-16 15:37:43', 1, 4),
(5, 'salut', 'au revoir', '2025-04-16 00:00:00', '2025-04-16 15:38:13', 1, 4),
(7, 'création application web', 'On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions,', '2025-04-16 00:00:00', '2025-04-16 00:00:00', 1, 6),
(8, 'trux', 'trux et moi', '2025-04-16 00:00:00', '2025-04-16 23:28:11', 3, 6),
(9, 'Cundo', 'bonjour le monde !', '2025-04-17 00:00:00', '2025-04-17 00:00:00', 1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Structure de la table `subject`
--

CREATE TABLE `subject` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_user` int UNSIGNED NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `subject`
--

INSERT INTO `subject` (`id`, `title`, `description`, `creation_date`, `id_user`) VALUES
(1, 'PHP', 'Programmation côté serveur', '2025-04-16 14:23:01', 5),
(2, 'SQL', 'Langage de base de données', '2025-04-16 14:23:01', 5),
(3, 'test', 'dexs,iki deer', '2025-04-16 00:00:00', 5),
(4, 'bonjour le monde', 'ecriture de test ', '2025-04-16 00:00:00', 6),
(5, 'sujet test ', 'je suis un test', '2025-04-17 00:00:00', 7);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int UNSIGNED NOT NULL,
  `pseudo` varchar(100) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `register_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_role` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `pseudo`, `mail`, `password`, `register_date`, `id_role`) VALUES
(1, 'Alice', 'alice@example.com', 'hashed_pw1', '2025-04-16 14:23:01', 1),
(2, 'Bob', 'bob@example.com', 'Hashed_pw2?', '2025-04-16 14:23:01', 1),
(3, 'Cundohh', 'boby@example.com', '$2y$10$FcsmgszI6qhBtvZDcPQP9ep3actdltxOu4yN8TB2uwnBQQFFbGwPC', '2025-04-16 00:00:00', 1),
(4, 'CundoVras', 'bobooo@example.com', '$2y$10$UlDCCENaeAYLoGPN1n29zORca1XEvM5OC5kaepNymF9wHMrMG74rC', '2025-04-16 00:00:00', 1),
(5, 'Rootvaras', 'bab@example.com', '$2y$10$mxcI4mq1/tTnxIW6GYbMnuiaM9esAAgUZxsuK5XExuztmwlYjf8A2', '2025-04-16 00:00:00', 1),
(6, 'rootfacu', 'bad@example.com', '$2y$10$Us98E9LIouNNHJK6cjQa7elum5qk.KhSYlWaiIP.tCwjwwCGMNCpK', '2025-04-16 00:00:00', 1),
(7, 'Cundofavaras', 'bady@example.com', '$2y$10$ER1tfSMz4DNyy8ILgaMR3u7tugYaQEZmMpKsD3Kn.lAl/UDxVyZkG', '2025-04-17 00:00:00', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_subject` (`id_subject`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_subject_user` (`id_user`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`id_subject`) REFERENCES `subject` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `fk_subject_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
