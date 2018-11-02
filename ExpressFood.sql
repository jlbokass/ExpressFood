-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 27, 2018 at 05:05 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ExpressFood`
--

-- --------------------------------------------------------

--
-- Table structure for table `Adresse`
--

CREATE TABLE `Adresse` (
  `id_Adresse` int(11) NOT NULL,
  `numero_Adresse` int(11) NOT NULL,
  `nom_Rue` varchar(100) NOT NULL,
  `nom_Ville` varchar(100) NOT NULL,
  `Code_Postal` int(11) NOT NULL,
  `immeuble` varchar(100) DEFAULT NULL,
  `digicode` int(11) DEFAULT NULL,
  `numero_Porte` int(11) DEFAULT NULL,
  `coordonneesGPS` decimal(20,15) NOT NULL,
  `Autre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Adresse`
--

INSERT INTO `Adresse` (`id_Adresse`, `numero_Adresse`, `nom_Rue`, `nom_Ville`, `Code_Postal`, `immeuble`, `digicode`, `numero_Porte`, `coordonneesGPS`, `Autre`) VALUES
(1, 1, 'Route de Bigard', 'Saint_Selve', 33610, NULL, NULL, NULL, '12.780000000000000', ''),
(2, 44, 'Rue Promis', 'Bordeaux', 33000, NULL, NULL, NULL, '15.780000000000000', '');

-- --------------------------------------------------------

--
-- Table structure for table `Categorie`
--

CREATE TABLE `Categorie` (
  `id_Categorie` int(11) NOT NULL,
  `nom_Categorie` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Categorie`
--

INSERT INTO `Categorie` (`id_Categorie`, `nom_Categorie`) VALUES
(1, 'Plat du jour'),
(2, 'Dessert');

-- --------------------------------------------------------

--
-- Table structure for table `Client`
--

CREATE TABLE `Client` (
  `id_Client` int(11) NOT NULL,
  `civilite` tinyint(4) NOT NULL,
  `raison_Social` varchar(100) DEFAULT NULL,
  `nomClient` varchar(100) NOT NULL,
  `prenom_Client` varchar(100) NOT NULL,
  `date_Naissance_client` date DEFAULT NULL,
  `telephone_Client` int(11) DEFAULT NULL,
  `email_Client` varchar(100) NOT NULL,
  `numCB` int(11) DEFAULT NULL,
  `login_Client` varchar(100) NOT NULL,
  `pass_Client` varchar(100) NOT NULL,
  `date_Inscription` datetime NOT NULL,
  `id_Adresse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Client`
--

INSERT INTO `Client` (`id_Client`, `civilite`, `raison_Social`, `nomClient`, `prenom_Client`, `date_Naissance_client`, `telephone_Client`, `email_Client`, `numCB`, `login_Client`, `pass_Client`, `date_Inscription`, `id_Adresse`) VALUES
(3, 0, NULL, 'Diaw', 'Borris', '1977-05-09', 655441122, 'jdsfef@gmail.com', NULL, 'borrisdiaw', '*A0B52B8470A382C1B3ECF9F91B8B67B4622B636A', '2018-07-02 00:00:00', 1),
(4, 1, NULL, 'Parker', 'Tony', '1985-10-09', 688552233, 'tony@gmail.com', NULL, 'tonyparker', '*A3E2A4D7BE4418B9D4694A905E967D7264EEF446', '2018-10-24 00:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Commande`
--

CREATE TABLE `Commande` (
  `id_Commande` int(11) NOT NULL,
  `date_Commande` datetime NOT NULL,
  `prix_HT` decimal(5,2) NOT NULL,
  `date_Modification` datetime DEFAULT NULL,
  `statut_Commande` varchar(100) NOT NULL,
  `debut_Commande` datetime NOT NULL,
  `Fin_Commande` datetime NOT NULL,
  `id_Client` int(11) NOT NULL,
  `id_Adresse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Commande`
--

INSERT INTO `Commande` (`id_Commande`, `date_Commande`, `prix_HT`, `date_Modification`, `statut_Commande`, `debut_Commande`, `Fin_Commande`, `id_Client`, `id_Adresse`) VALUES
(1, '2018-10-27 13:17:00', '22.65', NULL, 'En cours de livraison', '2018-10-27 13:11:00', '2018-10-27 13:17:00', 3, 1),
(2, '2018-10-27 18:10:00', '22.00', NULL, 'En attente de livraison', '2018-10-27 18:05:00', '2018-10-27 18:10:00', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Cuisinier`
--

CREATE TABLE `Cuisinier` (
  `id_Cuisinier` int(11) NOT NULL,
  `nom_Cuisinier` varchar(100) NOT NULL,
  `prenom_Cuisinier` varchar(100) NOT NULL,
  `telephone_Cuisinier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Cuisinier`
--

INSERT INTO `Cuisinier` (`id_Cuisinier`, `nom_Cuisinier`, `prenom_Cuisinier`, `telephone_Cuisinier`) VALUES
(1, 'Bokassa', 'Jean', 782668932),
(2, 'Labuzan', 'Gaelle', 688332145);

-- --------------------------------------------------------

--
-- Table structure for table `Ligne_Commande`
--

CREATE TABLE `Ligne_Commande` (
  `id_Commande` int(11) NOT NULL,
  `id_Repas` int(11) NOT NULL,
  `quantite_Repas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Livraison_Confirmee`
--

CREATE TABLE `Livraison_Confirmee` (
  `id_Livreur` int(11) NOT NULL,
  `id_Commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Livraison_Confirmee`
--

INSERT INTO `Livraison_Confirmee` (`id_Livreur`, `id_Commande`) VALUES
(2, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Livreur`
--

CREATE TABLE `Livreur` (
  `id_Livreur` int(11) NOT NULL,
  `nom_Livreur` varchar(100) NOT NULL,
  `Prenom_Livreur` varchar(100) NOT NULL,
  `telephone_Livreur` int(11) NOT NULL,
  `statut_Livreur` varchar(100) NOT NULL,
  `position_GPS_Livreur` decimal(20,15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Livreur`
--

INSERT INTO `Livreur` (`id_Livreur`, `nom_Livreur`, `Prenom_Livreur`, `telephone_Livreur`, `statut_Livreur`, `position_GPS_Livreur`) VALUES
(1, 'Bokassa', 'Jean-Carl', 655441278, 'Libre', '45.785400000000000'),
(2, 'Praud', 'Maxime', 689744512, 'Occupé', '254.784510000000000');

-- --------------------------------------------------------

--
-- Table structure for table `Repas`
--

CREATE TABLE `Repas` (
  `id_Repas` int(11) NOT NULL,
  `nom_Repas` varchar(100) NOT NULL,
  `descriptif_Repas` varchar(100) NOT NULL,
  `date_Cuisine` date NOT NULL,
  `quantite` int(11) NOT NULL,
  `prixHT` decimal(5,2) NOT NULL,
  `taux_TVA` decimal(5,2) NOT NULL,
  `photo_Repas` varchar(100) NOT NULL,
  `id_Categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Repas`
--

INSERT INTO `Repas` (`id_Repas`, `nom_Repas`, `descriptif_Repas`, `date_Cuisine`, `quantite`, `prixHT`, `taux_TVA`, `photo_Repas`, `id_Categorie`) VALUES
(1, 'Gombo', 'Bon gombo', '2018-10-26', 25, '10.50', '0.80', 'https://unsplash.com/photos/HYpXP6Zk1dw', 1),
(2, 'Gâteau au chocolat ', 'gâteau au chocolat très bon !', '2018-10-26', 25, '10.50', '0.80', 'https://unsplash.com/photos/HYpXP6Zk1dw', 2),
(3, 'Steak Frites', 'Un steak et ds frites', '2018-10-26', 25, '10.50', '0.80', 'https://unsplash.com/photos/HYpXP6Zk1dw', 1),
(4, 'Tarte aux pommes', 'Tarte aux pomme fait maison', '2018-10-26', 25, '10.50', '0.80', 'https://unsplash.com/photos/HYpXP6Zk1dw', 2);

-- --------------------------------------------------------

--
-- Table structure for table `RepasCuisinier`
--

CREATE TABLE `RepasCuisinier` (
  `id_Cuisinier` int(11) NOT NULL,
  `id_Repas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Stock_Livreur`
--

CREATE TABLE `Stock_Livreur` (
  `id_Repas` int(11) NOT NULL,
  `id_Livreur` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Stock_Livreur`
--

INSERT INTO `Stock_Livreur` (`id_Repas`, `id_Livreur`, `quantite`) VALUES
(1, 1, 10),
(2, 1, 10),
(3, 2, 10),
(4, 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `Velo`
--

CREATE TABLE `Velo` (
  `id_Velo` int(11) NOT NULL,
  `velo_Controle` tinyint(1) NOT NULL,
  `date_Revision` datetime NOT NULL,
  `statut_Velo` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Velo`
--

INSERT INTO `Velo` (`id_Velo`, `velo_Controle`, `date_Revision`, `statut_Velo`) VALUES
(1, 1, '2018-10-26 10:00:00', 1),
(2, 1, '2018-10-26 10:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `VeloLivreur`
--

CREATE TABLE `VeloLivreur` (
  `id_Velo` int(11) NOT NULL,
  `id_Livreur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VeloLivreur`
--

INSERT INTO `VeloLivreur` (`id_Velo`, `id_Livreur`) VALUES
(2, 1),
(1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Adresse`
--
ALTER TABLE `Adresse`
  ADD PRIMARY KEY (`id_Adresse`);

--
-- Indexes for table `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`id_Categorie`);

--
-- Indexes for table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`id_Client`),
  ADD KEY `adresse_client_fk` (`id_Adresse`);

--
-- Indexes for table `Commande`
--
ALTER TABLE `Commande`
  ADD PRIMARY KEY (`id_Commande`),
  ADD KEY `adresse_commande_fk` (`id_Adresse`),
  ADD KEY `client_commande_fk` (`id_Client`);

--
-- Indexes for table `Cuisinier`
--
ALTER TABLE `Cuisinier`
  ADD PRIMARY KEY (`id_Cuisinier`);

--
-- Indexes for table `Ligne_Commande`
--
ALTER TABLE `Ligne_Commande`
  ADD PRIMARY KEY (`id_Commande`,`id_Repas`),
  ADD KEY `repas_ligne_commande_fk` (`id_Repas`);

--
-- Indexes for table `Livraison_Confirmee`
--
ALTER TABLE `Livraison_Confirmee`
  ADD PRIMARY KEY (`id_Livreur`,`id_Commande`),
  ADD KEY `commande_livraison_confirmee_fk` (`id_Commande`);

--
-- Indexes for table `Livreur`
--
ALTER TABLE `Livreur`
  ADD PRIMARY KEY (`id_Livreur`),
  ADD UNIQUE KEY `livreur_idx` (`nom_Livreur`,`Prenom_Livreur`,`statut_Livreur`);

--
-- Indexes for table `Repas`
--
ALTER TABLE `Repas`
  ADD PRIMARY KEY (`id_Repas`),
  ADD KEY `categorie_repas_fk` (`id_Categorie`);

--
-- Indexes for table `RepasCuisinier`
--
ALTER TABLE `RepasCuisinier`
  ADD PRIMARY KEY (`id_Cuisinier`,`id_Repas`),
  ADD KEY `repas_repascuisinier_fk` (`id_Repas`);

--
-- Indexes for table `Stock_Livreur`
--
ALTER TABLE `Stock_Livreur`
  ADD PRIMARY KEY (`id_Repas`,`id_Livreur`),
  ADD KEY `livreur_stock_livreur_fk` (`id_Livreur`);

--
-- Indexes for table `Velo`
--
ALTER TABLE `Velo`
  ADD PRIMARY KEY (`id_Velo`);

--
-- Indexes for table `VeloLivreur`
--
ALTER TABLE `VeloLivreur`
  ADD PRIMARY KEY (`id_Velo`,`id_Livreur`),
  ADD KEY `livreur_velolivreur_fk` (`id_Livreur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Adresse`
--
ALTER TABLE `Adresse`
  MODIFY `id_Adresse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Categorie`
--
ALTER TABLE `Categorie`
  MODIFY `id_Categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Client`
--
ALTER TABLE `Client`
  MODIFY `id_Client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Commande`
--
ALTER TABLE `Commande`
  MODIFY `id_Commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Cuisinier`
--
ALTER TABLE `Cuisinier`
  MODIFY `id_Cuisinier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Livreur`
--
ALTER TABLE `Livreur`
  MODIFY `id_Livreur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Repas`
--
ALTER TABLE `Repas`
  MODIFY `id_Repas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Velo`
--
ALTER TABLE `Velo`
  MODIFY `id_Velo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Client`
--
ALTER TABLE `Client`
  ADD CONSTRAINT `adresse_client_fk` FOREIGN KEY (`id_Adresse`) REFERENCES `Adresse` (`id_Adresse`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Commande`
--
ALTER TABLE `Commande`
  ADD CONSTRAINT `adresse_commande_fk` FOREIGN KEY (`id_Adresse`) REFERENCES `Adresse` (`id_Adresse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `client_commande_fk` FOREIGN KEY (`id_Client`) REFERENCES `Client` (`id_Client`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Ligne_Commande`
--
ALTER TABLE `Ligne_Commande`
  ADD CONSTRAINT `commande_ligne_commande_fk` FOREIGN KEY (`id_Commande`) REFERENCES `Commande` (`id_Commande`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `repas_ligne_commande_fk` FOREIGN KEY (`id_Repas`) REFERENCES `Repas` (`id_Repas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Livraison_Confirmee`
--
ALTER TABLE `Livraison_Confirmee`
  ADD CONSTRAINT `commande_livraison_confirmee_fk` FOREIGN KEY (`id_Commande`) REFERENCES `Commande` (`id_Commande`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `livreur_livraison_confirmee_fk` FOREIGN KEY (`id_Livreur`) REFERENCES `Livreur` (`id_Livreur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Repas`
--
ALTER TABLE `Repas`
  ADD CONSTRAINT `categorie_repas_fk` FOREIGN KEY (`id_Categorie`) REFERENCES `Categorie` (`id_Categorie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `RepasCuisinier`
--
ALTER TABLE `RepasCuisinier`
  ADD CONSTRAINT `cuisinier_repascuisinier_fk` FOREIGN KEY (`id_Cuisinier`) REFERENCES `Cuisinier` (`id_Cuisinier`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `repas_repascuisinier_fk` FOREIGN KEY (`id_Repas`) REFERENCES `Repas` (`id_Repas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Stock_Livreur`
--
ALTER TABLE `Stock_Livreur`
  ADD CONSTRAINT `livreur_stock_livreur_fk` FOREIGN KEY (`id_Livreur`) REFERENCES `Livreur` (`id_Livreur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `repas_stock_livreur_fk` FOREIGN KEY (`id_Repas`) REFERENCES `Repas` (`id_Repas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `VeloLivreur`
--
ALTER TABLE `VeloLivreur`
  ADD CONSTRAINT `livreur_velolivreur_fk` FOREIGN KEY (`id_Livreur`) REFERENCES `Livreur` (`id_Livreur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `velo_velolivreur_fk` FOREIGN KEY (`id_Velo`) REFERENCES `Velo` (`id_Velo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
