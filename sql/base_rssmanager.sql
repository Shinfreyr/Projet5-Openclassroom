-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 18 mai 2018 à 20:53
-- Version du serveur :  10.1.31-MariaDB
-- Version de PHP :  7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `base_rssmanager`
--

-- --------------------------------------------------------

--
-- Structure de la table `accounts`
--

CREATE TABLE `accounts` (
  `idAccount` int(11) NOT NULL,
  `pseudoAccount` varchar(60) NOT NULL,
  `emailAccount` varchar(60) NOT NULL,
  `avatarAccount` varchar(275) NOT NULL,
  `statusAccount` varchar(25) NOT NULL,
  `passAccount` varchar(275) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `accounts`
--

INSERT INTO `accounts` (`idAccount`, `pseudoAccount`, `emailAccount`, `avatarAccount`, `statusAccount`, `passAccount`) VALUES
(9, 'Test', 'test@test.test', 'defautUser.jpg', 'User', '$2y$10$STVs/xKM/akFzjsGJo1XuegqzNQO1OoM9jqU0YpgNYZp2fqRvdxXm'),
(10, 'Test2', 'test2@test2.test2', 'defautUser.jpg', 'User', '$2y$10$kIT50dBYhLvD8qXZ3x2F7Ok5sjNClk77V5u/N.dRZ8NU6AzC3hLEO');

-- --------------------------------------------------------

--
-- Structure de la table `cerclelink`
--

CREATE TABLE `cerclelink` (
  `idCercleLink` int(11) NOT NULL,
  `nameCircle` varchar(275) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `chats`
--

CREATE TABLE `chats` (
  `idChat` int(11) NOT NULL,
  `contentChat` varchar(275) NOT NULL,
  `dateChat` datetime NOT NULL,
  `idAccount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chats`
--

INSERT INTO `chats` (`idChat`, `contentChat`, `dateChat`, `idAccount`) VALUES
(1, 'Test1', '2018-05-07 13:06:11', 9),
(2, 'jfhakjkhalzjh hazlkfjljza afhhkjfhda zazh kahfklhlifh aahfkjaljdlifhaejr afzjkhrfkjazhkjgzaherkjr azjhrkuerj ehajrjbfaergaklzhfkaznkzahrkg ajkhrkjhearjkaj zjhjahjrhazkrhakjzr zajkzhrjahezjhejahekhaj hahjkrhajkzheajk', '2018-05-07 13:06:24', 9),
(3, 'gdsgsgsdsg g zq qz ', '2018-05-07 13:08:40', 9),
(4, 'fdgregdgrgerrfe', '2018-05-07 13:20:29', 9),
(5, 'fhtthergrrzfzrz', '2018-05-07 13:20:29', 9),
(6, 'vsdfdsdfds', '2018-05-07 13:39:18', 9),
(7, 'gregzegze', '2018-05-07 14:33:35', 10),
(8, 'kjmiktjtyhf', '2018-05-07 14:54:43', 10),
(9, 'fefefezfeezf', '2018-05-07 14:59:09', 9),
(10, 'Coucou c\'est un nouveau test.', '2018-05-14 12:56:46', 9),
(11, 'Voici un second!!!', '2018-05-14 15:25:17', 9);

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `idComment` int(11) NOT NULL,
  `contentComment` varchar(1000) NOT NULL,
  `dateComment` date NOT NULL,
  `idPost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `connect`
--

CREATE TABLE `connect` (
  `idAccount` int(11) NOT NULL,
  `idCercleLink` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `deffine`
--

CREATE TABLE `deffine` (
  `idRssCategory` int(11) NOT NULL,
  `idRss` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `invitation`
--

CREATE TABLE `invitation` (
  `idInvitation` int(11) NOT NULL,
  `contentInvitation` varchar(275) NOT NULL,
  `dateInvitation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `invite`
--

CREATE TABLE `invite` (
  `idAccount` int(11) NOT NULL,
  `idInvitation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `idPost` int(11) NOT NULL,
  `titrePost` varchar(275) NOT NULL,
  `contenuPost` varchar(1000) DEFAULT NULL,
  `datePost` date NOT NULL,
  `idRss` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rss`
--

CREATE TABLE `rss` (
  `idRss` int(11) NOT NULL,
  `urlRss` varchar(275) NOT NULL,
  `nameRss` varchar(275) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rsscategories`
--

CREATE TABLE `rsscategories` (
  `idRssCategory` int(11) NOT NULL,
  `nameRssCategory` varchar(275) NOT NULL,
  `idAccount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`idAccount`);

--
-- Index pour la table `cerclelink`
--
ALTER TABLE `cerclelink`
  ADD PRIMARY KEY (`idCercleLink`);

--
-- Index pour la table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`idChat`),
  ADD KEY `FK_chats_idAccount` (`idAccount`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`idComment`),
  ADD KEY `FK_comments_idPost` (`idPost`);

--
-- Index pour la table `connect`
--
ALTER TABLE `connect`
  ADD PRIMARY KEY (`idAccount`,`idCercleLink`),
  ADD KEY `FK_connect_idCercleLink` (`idCercleLink`);

--
-- Index pour la table `deffine`
--
ALTER TABLE `deffine`
  ADD PRIMARY KEY (`idRssCategory`,`idRss`),
  ADD KEY `FK_deffine_idRss` (`idRss`);

--
-- Index pour la table `invitation`
--
ALTER TABLE `invitation`
  ADD PRIMARY KEY (`idInvitation`);

--
-- Index pour la table `invite`
--
ALTER TABLE `invite`
  ADD PRIMARY KEY (`idAccount`,`idInvitation`),
  ADD KEY `FK_invite_idInvitation` (`idInvitation`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`idPost`),
  ADD KEY `FK_posts_idRss` (`idRss`);

--
-- Index pour la table `rss`
--
ALTER TABLE `rss`
  ADD PRIMARY KEY (`idRss`);

--
-- Index pour la table `rsscategories`
--
ALTER TABLE `rsscategories`
  ADD PRIMARY KEY (`idRssCategory`),
  ADD KEY `FK_rssCategories_idAccount` (`idAccount`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `idAccount` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `cerclelink`
--
ALTER TABLE `cerclelink`
  MODIFY `idCercleLink` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `chats`
--
ALTER TABLE `chats`
  MODIFY `idChat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `idComment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `invitation`
--
ALTER TABLE `invitation`
  MODIFY `idInvitation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `idPost` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rss`
--
ALTER TABLE `rss`
  MODIFY `idRss` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rsscategories`
--
ALTER TABLE `rsscategories`
  MODIFY `idRssCategory` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `FK_chats_idAccount` FOREIGN KEY (`idAccount`) REFERENCES `accounts` (`idAccount`);

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_comments_idPost` FOREIGN KEY (`idPost`) REFERENCES `posts` (`idPost`);

--
-- Contraintes pour la table `connect`
--
ALTER TABLE `connect`
  ADD CONSTRAINT `FK_connect_idAccount` FOREIGN KEY (`idAccount`) REFERENCES `accounts` (`idAccount`),
  ADD CONSTRAINT `FK_connect_idCercleLink` FOREIGN KEY (`idCercleLink`) REFERENCES `cerclelink` (`idCercleLink`);

--
-- Contraintes pour la table `deffine`
--
ALTER TABLE `deffine`
  ADD CONSTRAINT `FK_deffine_idRss` FOREIGN KEY (`idRss`) REFERENCES `rss` (`idRss`),
  ADD CONSTRAINT `FK_deffine_idRssCategory` FOREIGN KEY (`idRssCategory`) REFERENCES `rsscategories` (`idRssCategory`);

--
-- Contraintes pour la table `invite`
--
ALTER TABLE `invite`
  ADD CONSTRAINT `FK_invite_idAccount` FOREIGN KEY (`idAccount`) REFERENCES `accounts` (`idAccount`),
  ADD CONSTRAINT `FK_invite_idInvitation` FOREIGN KEY (`idInvitation`) REFERENCES `invitation` (`idInvitation`);

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `FK_posts_idRss` FOREIGN KEY (`idRss`) REFERENCES `rss` (`idRss`);

--
-- Contraintes pour la table `rsscategories`
--
ALTER TABLE `rsscategories`
  ADD CONSTRAINT `FK_rssCategories_idAccount` FOREIGN KEY (`idAccount`) REFERENCES `accounts` (`idAccount`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
