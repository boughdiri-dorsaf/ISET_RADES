-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 26, 2021 at 08:20 AM
-- Server version: 8.0.13-4
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `5mrruYpkTT`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresse`
--

CREATE TABLE `adresse` (
  `id_adresse` int(11) NOT NULL,
  `code_postale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gouvernorat_adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pays` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

CREATE TABLE `classe` (
  `id_classe` int(11) NOT NULL COMMENT 'exemple : MPDAM, L3-DSI2',
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_responsable` int(11) NOT NULL,
  `nb_etudiant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `classe`
--

INSERT INTO `classe` (`id_classe`, `libelle`, `id_responsable`, `nb_etudiant`) VALUES
(1, 'master1', 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `id_club` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_creation` date NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_domaine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `competence`
--

CREATE TABLE `competence` (
  `id_competence` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `niveau` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cursus`
--

CREATE TABLE `cursus` (
  `id_cursus` int(11) NOT NULL,
  `annee` date NOT NULL,
  `moyenne` double NOT NULL,
  `credit` int(11) NOT NULL,
  `mention` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note_pfe` double NOT NULL,
  `id_domaine` int(11) NOT NULL,
  `id_etablissement` int(11) NOT NULL,
  `id_specialite` int(11) NOT NULL,
  `id_niveau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cv`
--

CREATE TABLE `cv` (
  `id_cv` int(11) NOT NULL,
  `specialite` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_competence` int(11) NOT NULL,
  `id_experience` int(11) NOT NULL,
  `fichier_cv` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demande_club`
--

CREATE TABLE `demande_club` (
  `id_demande_club` int(11) NOT NULL,
  `date` date NOT NULL,
  `motivation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `statut` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_club` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demande_master`
--

CREATE TABLE `demande_master` (
  `id_demande` int(11) NOT NULL,
  `date_inscrit` date NOT NULL,
  `etat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_master` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `fichier` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demande_stage_entreprise`
--

CREATE TABLE `demande_stage_entreprise` (
  `id_demande_stage_entreprise` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_offre_stage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demande_stage_etudiant`
--

CREATE TABLE `demande_stage_etudiant` (
  `id_demande` int(11) NOT NULL,
  `date_demande` date NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `etat` int(1) NOT NULL,
  `id_etudiant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `departement`
--

CREATE TABLE `departement` (
  `id_departement` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `domaine`
--

CREATE TABLE `domaine` (
  `id_domaine` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enseignant`
--

CREATE TABLE `enseignant` (
  `id_enseignant` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enseignement`
--

CREATE TABLE `enseignement` (
  `id_enseignement` int(11) NOT NULL,
  `id_salle` int(11) NOT NULL,
  `id_seance` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_enseignant` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `statut` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `qr_code` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `entreprise`
--

CREATE TABLE `entreprise` (
  `id_entreprises` int(11) NOT NULL,
  `nom_societe` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `num_reg_commerce` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `localisation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_web` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_domaine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `entretien`
--

CREATE TABLE `entretien` (
  `id_entretien` int(11) NOT NULL,
  `date` date NOT NULL,
  `heure` date NOT NULL,
  `salle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_professeur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `etablissement`
--

CREATE TABLE `etablissement` (
  `id_etablissement` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_adresse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `etudiant`
--

CREATE TABLE `etudiant` (
  `id_etudiant` int(11) NOT NULL,
  `gouvern_naissance` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `situation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_departement` int(11) NOT NULL,
  `id_cursus` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `evenement`
--

CREATE TABLE `evenement` (
  `id_event` int(11) NOT NULL,
  `date` date NOT NULL,
  `duree` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `heure` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `id_club` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url_fichier` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `id_experience` int(11) NOT NULL,
  `nom_entreprise` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `post` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inscription`
--

CREATE TABLE `inscription` (
  `id_inscription` int(11) NOT NULL,
  `date_inscription` date NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `justif_papier`
--

CREATE TABLE `justif_papier` (
  `id_justifPapier` int(11) NOT NULL,
  `raison` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `type_papier` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_etudiant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master`
--

CREATE TABLE `master` (
  `id_master` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_departement` int(11) NOT NULL,
  `seuil_admission` int(11) NOT NULL,
  `seuil_admis_attente` int(11) NOT NULL,
  `date_fin_master` date NOT NULL,
  `id_etablissement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matiere`
--

CREATE TABLE `matiere` (
  `id_matiere` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `charge_horaire` int(11) NOT NULL,
  `id_type_enseignement` int(11) NOT NULL,
  `id_semestre` int(11) NOT NULL,
  `id_niveau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `membre`
--

CREATE TABLE `membre` (
  `id_membre` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `equipe` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id_message` int(11) NOT NULL,
  `message_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_message` date NOT NULL,
  `id_user_sender` int(11) NOT NULL,
  `id_user_receiver` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `niveau`
--

CREATE TABLE `niveau` (
  `id_niveau` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offre_stage`
--

CREATE TABLE `offre_stage` (
  `id_offre_stage` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `duree` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `etat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cahier_charge` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_entreprise` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `option`
--

CREATE TABLE `option` (
  `id_option` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_niveau` int(11) NOT NULL,
  `id_parcours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `papier_administratif`
--

CREATE TABLE `papier_administratif` (
  `id_papierAdministratif` int(11) NOT NULL,
  `date` date NOT NULL,
  `type_papier` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_etudiant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parcours`
--

CREATE TABLE `parcours` (
  `id_parcours` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participer_club`
--

CREATE TABLE `participer_club` (
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_club` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participer_event`
--

CREATE TABLE `participer_event` (
  `id_etudiant` int(11) NOT NULL,
  `id_evenement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `poste_entreprise`
--

CREATE TABLE `poste_entreprise` (
  `id_poste` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presence_enseignant`
--

CREATE TABLE `presence_enseignant` (
  `id_enseignement` int(11) NOT NULL,
  `etat` bit(1) NOT NULL DEFAULT b'1',
  `id_presence_enseignant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presence_etudiant`
--

CREATE TABLE `presence_etudiant` (
  `id_presence` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_enseignement` int(11) NOT NULL,
  `etat` bit(1) NOT NULL DEFAULT b'0',
  `localisation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time` date NOT NULL,
  `id_seance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `professeur`
--

CREATE TABLE `professeur` (
  `id_professeur` int(11) NOT NULL,
  `id_departement` int(11) NOT NULL,
  `id_option` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publication_club`
--

CREATE TABLE `publication_club` (
  `id_publication` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `heure` int(11) NOT NULL,
  `url_document` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_member` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reclamation`
--

CREATE TABLE `reclamation` (
  `id_reclamation` int(11) NOT NULL,
  `type_reclamation` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contenu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `statut` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_reclamation` date NOT NULL,
  `id_etudiant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `responsable_entreprise`
--

CREATE TABLE `responsable_entreprise` (
  `id_responsable_entreprise` int(11) NOT NULL,
  `id_entreprise` int(11) NOT NULL,
  `id_poste_entreprise` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `responsable_group`
--

CREATE TABLE `responsable_group` (
  `id_responsable_group` int(11) NOT NULL,
  `qualite` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `responsable_group`
--

INSERT INTO `responsable_group` (`id_responsable_group`, `qualite`, `id_user`) VALUES
(1, 'bien qualite', 1111111112);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `libelle`) VALUES
(1, 'etudiant');

-- --------------------------------------------------------

--
-- Table structure for table `rubrique`
--

CREATE TABLE `rubrique` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `score` double NOT NULL,
  `coefficient` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_entretien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

CREATE TABLE `salle` (
  `id_salle` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `capacite` int(11) NOT NULL,
  `localisation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_type_salle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `salle`
--

INSERT INTO `salle` (`id_salle`, `libelle`, `capacite`, `localisation`, `id_type_salle`) VALUES
(1111111111, '1111111111', 1111111111, '1111111111', 1111111111);

-- --------------------------------------------------------

--
-- Table structure for table `seance`
--

CREATE TABLE `seance` (
  `id_seance` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_debut_seance` date NOT NULL,
  `date_fin_seance` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `semestre`
--

CREATE TABLE `semestre` (
  `id_semestre` int(11) NOT NULL,
  `num_semestre` int(11) NOT NULL,
  `date_debut_annee_univ` date NOT NULL,
  `date_fin_annee_univ` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `specialite`
--

CREATE TABLE `specialite` (
  `id_specialite` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_enseignement`
--

CREATE TABLE `type_enseignement` (
  `id_type_enseignant` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_salle`
--

CREATE TABLE `type_salle` (
  `id_typeSalle` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `cin` text COLLATE utf8_unicode_ci NOT NULL,
  `sexe` text COLLATE utf8_unicode_ci NOT NULL,
  `num_passport` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `date_naissance` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `password`, `id_role`, `id_user`, `nom`, `prenom`, `age`, `cin`, `sexe`, `num_passport`, `date_naissance`) VALUES
('responsable@gmail.com', '123456789', 1, 1111111112, 'ahmed', 'benali', 45, '123456789', 'female', '', '2021-04-14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id_adresse`),
  ADD KEY `FK_PersonOrderml6` (`id_user`);

--
-- Indexes for table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id_classe`),
  ADD KEY `FK_PersonOrder7` (`id_responsable`);

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`id_club`),
  ADD KEY `id_domaine` (`id_domaine`);

--
-- Indexes for table `competence`
--
ALTER TABLE `competence`
  ADD PRIMARY KEY (`id_competence`);

--
-- Indexes for table `cursus`
--
ALTER TABLE `cursus`
  ADD PRIMARY KEY (`id_cursus`),
  ADD KEY `FK_PersonOrder36` (`id_domaine`),
  ADD KEY `FK_PersonOrder37` (`id_etablissement`),
  ADD KEY `FK_PersonOrder38` (`id_specialite`),
  ADD KEY `id_niveau` (`id_niveau`);

--
-- Indexes for table `cv`
--
ALTER TABLE `cv`
  ADD PRIMARY KEY (`id_cv`),
  ADD KEY `id_etudiant` (`id_etudiant`),
  ADD KEY `FK_PersonOrder41` (`id_competence`),
  ADD KEY `FK_PersonOrder40` (`id_experience`);

--
-- Indexes for table `demande_club`
--
ALTER TABLE `demande_club`
  ADD PRIMARY KEY (`id_demande_club`),
  ADD KEY `FK_PersonOrder28` (`id_club`),
  ADD KEY `FK_PersonOrder29` (`id_etudiant`);

--
-- Indexes for table `demande_master`
--
ALTER TABLE `demande_master`
  ADD PRIMARY KEY (`id_demande`),
  ADD KEY `FK_PersonOrder30` (`id_master`),
  ADD KEY `FK_PersonOrder631` (`id_etudiant`);

--
-- Indexes for table `demande_stage_entreprise`
--
ALTER TABLE `demande_stage_entreprise`
  ADD PRIMARY KEY (`id_demande_stage_entreprise`),
  ADD KEY `FK_PersonOrder48d07` (`id_offre_stage`),
  ADD KEY `FK_PersonOrder45d08` (`id_etudiant`);

--
-- Indexes for table `demande_stage_etudiant`
--
ALTER TABLE `demande_stage_etudiant`
  ADD PRIMARY KEY (`id_demande`),
  ADD KEY `FK_PersonOrder42` (`id_etudiant`);

--
-- Indexes for table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`id_departement`);

--
-- Indexes for table `domaine`
--
ALTER TABLE `domaine`
  ADD PRIMARY KEY (`id_domaine`);

--
-- Indexes for table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`id_enseignant`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `enseignement`
--
ALTER TABLE `enseignement`
  ADD PRIMARY KEY (`id_enseignement`),
  ADD KEY `id_classe` (`id_classe`),
  ADD KEY `id_enseignant` (`id_enseignant`),
  ADD KEY `id_matiere` (`id_matiere`),
  ADD KEY `id_salle` (`id_salle`),
  ADD KEY `id_seance` (`id_seance`);

--
-- Indexes for table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`id_entreprises`),
  ADD KEY `id_domaine` (`id_domaine`);

--
-- Indexes for table `entretien`
--
ALTER TABLE `entretien`
  ADD PRIMARY KEY (`id_entretien`),
  ADD KEY `FK_PersonOrder32` (`id_professeur`),
  ADD KEY `FK_PersonOrder33` (`id_etudiant`);

--
-- Indexes for table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`id_etablissement`),
  ADD KEY `id_adresse` (`id_adresse`);

--
-- Indexes for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id_etudiant`),
  ADD KEY `FK_PersonOrder60` (`id_classe`),
  ADD KEY `FK_PersonOrder61` (`id_departement`),
  ADD KEY `FK_PersonOrder62` (`id_cursus`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`id_event`),
  ADD KEY `FK_PersonOrder21` (`id_club`);

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`id_experience`);

--
-- Indexes for table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id_inscription`),
  ADD KEY `id_classe` (`id_classe`),
  ADD KEY `id_etudiant` (`id_etudiant`);

--
-- Indexes for table `justif_papier`
--
ALTER TABLE `justif_papier`
  ADD PRIMARY KEY (`id_justifPapier`),
  ADD KEY `FK_PersonOrder10` (`id_etudiant`);

--
-- Indexes for table `master`
--
ALTER TABLE `master`
  ADD PRIMARY KEY (`id_master`),
  ADD KEY `id_etablissement` (`id_etablissement`);

--
-- Indexes for table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id_matiere`),
  ADD KEY `FK_PersonOrder4` (`id_type_enseignement`),
  ADD KEY `FK_PersonOrder5` (`id_semestre`),
  ADD KEY `FK_PersonOrder6` (`id_niveau`);

--
-- Indexes for table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`id_membre`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `id_user_receiver` (`id_user_receiver`),
  ADD KEY `id_user_sender` (`id_user_sender`);

--
-- Indexes for table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`id_niveau`);

--
-- Indexes for table `offre_stage`
--
ALTER TABLE `offre_stage`
  ADD PRIMARY KEY (`id_offre_stage`),
  ADD KEY `FK_PersonOrderzfdfd51` (`id_entreprise`);

--
-- Indexes for table `option`
--
ALTER TABLE `option`
  ADD PRIMARY KEY (`id_option`),
  ADD KEY `FK_PersonOrder2` (`id_niveau`),
  ADD KEY `FK_PersonOrder3` (`id_parcours`);

--
-- Indexes for table `papier_administratif`
--
ALTER TABLE `papier_administratif`
  ADD PRIMARY KEY (`id_papierAdministratif`),
  ADD KEY `FK_PersonOrder9` (`id_etudiant`);

--
-- Indexes for table `parcours`
--
ALTER TABLE `parcours`
  ADD PRIMARY KEY (`id_parcours`);

--
-- Indexes for table `participer_club`
--
ALTER TABLE `participer_club`
  ADD PRIMARY KEY (`id_etudiant`,`id_club`),
  ADD KEY `FK_PersonOrder25` (`id_club`);

--
-- Indexes for table `participer_event`
--
ALTER TABLE `participer_event`
  ADD PRIMARY KEY (`id_etudiant`,`id_evenement`),
  ADD KEY `FK_PersonOrder20` (`id_evenement`);

--
-- Indexes for table `poste_entreprise`
--
ALTER TABLE `poste_entreprise`
  ADD PRIMARY KEY (`id_poste`);

--
-- Indexes for table `presence_enseignant`
--
ALTER TABLE `presence_enseignant`
  ADD PRIMARY KEY (`id_presence_enseignant`),
  ADD KEY `id_enseignement` (`id_enseignement`);

--
-- Indexes for table `presence_etudiant`
--
ALTER TABLE `presence_etudiant`
  ADD PRIMARY KEY (`id_presence`),
  ADD KEY `id_etudiant` (`id_etudiant`),
  ADD KEY `id_enseignement` (`id_enseignement`),
  ADD KEY `id_seance` (`id_seance`);

--
-- Indexes for table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`id_professeur`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_departement` (`id_departement`),
  ADD KEY `id_option` (`id_option`);

--
-- Indexes for table `publication_club`
--
ALTER TABLE `publication_club`
  ADD PRIMARY KEY (`id_publication`),
  ADD KEY `FK_PersonOrder23` (`id_member`);

--
-- Indexes for table `reclamation`
--
ALTER TABLE `reclamation`
  ADD PRIMARY KEY (`id_reclamation`),
  ADD KEY `FK_PersonOrder8` (`id_etudiant`);

--
-- Indexes for table `responsable_entreprise`
--
ALTER TABLE `responsable_entreprise`
  ADD PRIMARY KEY (`id_responsable_entreprise`),
  ADD KEY `FK_PersonOrderzfdfdg51` (`id_entreprise`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_poste_entreprise` (`id_poste_entreprise`);

--
-- Indexes for table `responsable_group`
--
ALTER TABLE `responsable_group`
  ADD PRIMARY KEY (`id_responsable_group`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `rubrique`
--
ALTER TABLE `rubrique`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_PersonOrder34` (`id_entretien`);

--
-- Indexes for table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id_salle`),
  ADD KEY `FK_PersonOrder11` (`id_type_salle`);

--
-- Indexes for table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`id_seance`);

--
-- Indexes for table `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`id_semestre`);

--
-- Indexes for table `specialite`
--
ALTER TABLE `specialite`
  ADD PRIMARY KEY (`id_specialite`);

--
-- Indexes for table `type_enseignement`
--
ALTER TABLE `type_enseignement`
  ADD PRIMARY KEY (`id_type_enseignant`);

--
-- Indexes for table `type_salle`
--
ALTER TABLE `type_salle`
  ADD PRIMARY KEY (`id_typeSalle`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id_adresse` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classe`
--
ALTER TABLE `classe`
  MODIFY `id_classe` int(11) NOT NULL AUTO_INCREMENT COMMENT 'exemple : MPDAM, L3-DSI2', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `club`
--
ALTER TABLE `club`
  MODIFY `id_club` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `competence`
--
ALTER TABLE `competence`
  MODIFY `id_competence` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cursus`
--
ALTER TABLE `cursus`
  MODIFY `id_cursus` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cv`
--
ALTER TABLE `cv`
  MODIFY `id_cv` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `demande_club`
--
ALTER TABLE `demande_club`
  MODIFY `id_demande_club` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `demande_master`
--
ALTER TABLE `demande_master`
  MODIFY `id_demande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `demande_stage_entreprise`
--
ALTER TABLE `demande_stage_entreprise`
  MODIFY `id_demande_stage_entreprise` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `demande_stage_etudiant`
--
ALTER TABLE `demande_stage_etudiant`
  MODIFY `id_demande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departement`
--
ALTER TABLE `departement`
  MODIFY `id_departement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `domaine`
--
ALTER TABLE `domaine`
  MODIFY `id_domaine` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `id_enseignant` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enseignement`
--
ALTER TABLE `enseignement`
  MODIFY `id_enseignement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `id_entreprises` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entretien`
--
ALTER TABLE `entretien`
  MODIFY `id_entretien` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `id_etablissement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id_etudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1111111112;

--
-- AUTO_INCREMENT for table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `id_experience` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id_inscription` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `justif_papier`
--
ALTER TABLE `justif_papier`
  MODIFY `id_justifPapier` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master`
--
ALTER TABLE `master`
  MODIFY `id_master` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id_matiere` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membre`
--
ALTER TABLE `membre`
  MODIFY `id_membre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `id_niveau` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offre_stage`
--
ALTER TABLE `offre_stage`
  MODIFY `id_offre_stage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `option`
--
ALTER TABLE `option`
  MODIFY `id_option` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `papier_administratif`
--
ALTER TABLE `papier_administratif`
  MODIFY `id_papierAdministratif` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parcours`
--
ALTER TABLE `parcours`
  MODIFY `id_parcours` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poste_entreprise`
--
ALTER TABLE `poste_entreprise`
  MODIFY `id_poste` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `presence_enseignant`
--
ALTER TABLE `presence_enseignant`
  MODIFY `id_presence_enseignant` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `presence_etudiant`
--
ALTER TABLE `presence_etudiant`
  MODIFY `id_presence` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `id_professeur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publication_club`
--
ALTER TABLE `publication_club`
  MODIFY `id_publication` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reclamation`
--
ALTER TABLE `reclamation`
  MODIFY `id_reclamation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `responsable_entreprise`
--
ALTER TABLE `responsable_entreprise`
  MODIFY `id_responsable_entreprise` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `responsable_group`
--
ALTER TABLE `responsable_group`
  MODIFY `id_responsable_group` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rubrique`
--
ALTER TABLE `rubrique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salle`
--
ALTER TABLE `salle`
  MODIFY `id_salle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1111111112;

--
-- AUTO_INCREMENT for table `seance`
--
ALTER TABLE `seance`
  MODIFY `id_seance` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `semestre`
--
ALTER TABLE `semestre`
  MODIFY `id_semestre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specialite`
--
ALTER TABLE `specialite`
  MODIFY `id_specialite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_enseignement`
--
ALTER TABLE `type_enseignement`
  MODIFY `id_type_enseignant` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_salle`
--
ALTER TABLE `type_salle`
  MODIFY `id_typeSalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1111111113;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `FK_PersonOrderml6` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `FK_PersonOrder7` FOREIGN KEY (`id_responsable`) REFERENCES `responsable_group` (`id_responsable_group`);

--
-- Constraints for table `club`
--
ALTER TABLE `club`
  ADD CONSTRAINT `club_ibfk_1` FOREIGN KEY (`id_domaine`) REFERENCES `domaine` (`id_domaine`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `cursus`
--
ALTER TABLE `cursus`
  ADD CONSTRAINT `FK_PersonOrder36` FOREIGN KEY (`id_domaine`) REFERENCES `domaine` (`id_domaine`),
  ADD CONSTRAINT `FK_PersonOrder37` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id_etablissement`),
  ADD CONSTRAINT `FK_PersonOrder38` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id_specialite`),
  ADD CONSTRAINT `cursus_ibfk_1` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id_niveau`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `cv`
--
ALTER TABLE `cv`
  ADD CONSTRAINT `FK_PersonOrder40` FOREIGN KEY (`id_experience`) REFERENCES `experience` (`id_experience`),
  ADD CONSTRAINT `FK_PersonOrder41` FOREIGN KEY (`id_competence`) REFERENCES `competence` (`id_competence`),
  ADD CONSTRAINT `cv_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Constraints for table `demande_club`
--
ALTER TABLE `demande_club`
  ADD CONSTRAINT `FK_PersonOrder27` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`),
  ADD CONSTRAINT `FK_PersonOrder28` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`),
  ADD CONSTRAINT `FK_PersonOrder29` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Constraints for table `demande_master`
--
ALTER TABLE `demande_master`
  ADD CONSTRAINT `FK_PersonOrder30` FOREIGN KEY (`id_master`) REFERENCES `master` (`id_master`),
  ADD CONSTRAINT `FK_PersonOrder631` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Constraints for table `demande_stage_entreprise`
--
ALTER TABLE `demande_stage_entreprise`
  ADD CONSTRAINT `FK_PersonOrder45d08` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `FK_PersonOrder46` FOREIGN KEY (`id_offre_stage`) REFERENCES `offre_stage` (`id_offre_stage`),
  ADD CONSTRAINT `FK_PersonOrder47` FOREIGN KEY (`id_offre_stage`) REFERENCES `offre_stage` (`id_offre_stage`),
  ADD CONSTRAINT `FK_PersonOrder4807` FOREIGN KEY (`id_offre_stage`) REFERENCES `offre_stage` (`id_offre_stage`),
  ADD CONSTRAINT `FK_PersonOrder487` FOREIGN KEY (`id_offre_stage`) REFERENCES `offre_stage` (`id_offre_stage`),
  ADD CONSTRAINT `FK_PersonOrder48d07` FOREIGN KEY (`id_offre_stage`) REFERENCES `offre_stage` (`id_offre_stage`);

--
-- Constraints for table `demande_stage_etudiant`
--
ALTER TABLE `demande_stage_etudiant`
  ADD CONSTRAINT `FK_PersonOrder42` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Constraints for table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `enseignant_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `enseignement`
--
ALTER TABLE `enseignement`
  ADD CONSTRAINT `enseignement_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `enseignement_ibfk_2` FOREIGN KEY (`id_enseignant`) REFERENCES `enseignant` (`id_enseignant`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `enseignement_ibfk_3` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `enseignement_ibfk_4` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id_salle`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `enseignement_ibfk_5` FOREIGN KEY (`id_seance`) REFERENCES `seance` (`id_seance`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `entreprise`
--
ALTER TABLE `entreprise`
  ADD CONSTRAINT `entreprise_ibfk_1` FOREIGN KEY (`id_domaine`) REFERENCES `domaine` (`id_domaine`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `entretien`
--
ALTER TABLE `entretien`
  ADD CONSTRAINT `FK_PersonOrder32` FOREIGN KEY (`id_professeur`) REFERENCES `professeur` (`id_professeur`),
  ADD CONSTRAINT `FK_PersonOrder33` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Constraints for table `etablissement`
--
ALTER TABLE `etablissement`
  ADD CONSTRAINT `etablissement_ibfk_1` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `FK_PersonOrder60` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`),
  ADD CONSTRAINT `FK_PersonOrder61` FOREIGN KEY (`id_departement`) REFERENCES `departement` (`id_departement`),
  ADD CONSTRAINT `FK_PersonOrder62` FOREIGN KEY (`id_cursus`) REFERENCES `cursus` (`id_cursus`),
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `FK_PersonOrder21` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`);

--
-- Constraints for table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `justif_papier`
--
ALTER TABLE `justif_papier`
  ADD CONSTRAINT `FK_PersonOrder10` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Constraints for table `master`
--
ALTER TABLE `master`
  ADD CONSTRAINT `master_ibfk_1` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id_etablissement`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `FK_PersonOrder4` FOREIGN KEY (`id_type_enseignement`) REFERENCES `type_enseignement` (`id_type_enseignant`),
  ADD CONSTRAINT `FK_PersonOrder5` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id_semestre`),
  ADD CONSTRAINT `FK_PersonOrder6` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id_niveau`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`id_user_receiver`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`id_user_sender`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `offre_stage`
--
ALTER TABLE `offre_stage`
  ADD CONSTRAINT `FK_PersonOrderzfdfd51` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprises`);

--
-- Constraints for table `option`
--
ALTER TABLE `option`
  ADD CONSTRAINT `FK_PersonOrder1` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id_niveau`),
  ADD CONSTRAINT `FK_PersonOrder2` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id_niveau`),
  ADD CONSTRAINT `FK_PersonOrder3` FOREIGN KEY (`id_parcours`) REFERENCES `parcours` (`id_parcours`);

--
-- Constraints for table `papier_administratif`
--
ALTER TABLE `papier_administratif`
  ADD CONSTRAINT `FK_PersonOrder9` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Constraints for table `participer_club`
--
ALTER TABLE `participer_club`
  ADD CONSTRAINT `FK_PersonOrder24` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_PersonOrder25` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`);

--
-- Constraints for table `participer_event`
--
ALTER TABLE `participer_event`
  ADD CONSTRAINT `FK_PersonOrder12` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `FK_PersonOrder14` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `FK_PersonOrder19` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `FK_PersonOrder20` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id_event`);

--
-- Constraints for table `presence_enseignant`
--
ALTER TABLE `presence_enseignant`
  ADD CONSTRAINT `presence_enseignant_ibfk_1` FOREIGN KEY (`id_enseignement`) REFERENCES `enseignement` (`id_enseignement`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `presence_etudiant`
--
ALTER TABLE `presence_etudiant`
  ADD CONSTRAINT `presence_etudiant_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `presence_etudiant_ibfk_2` FOREIGN KEY (`id_enseignement`) REFERENCES `enseignement` (`id_enseignement`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `presence_etudiant_ibfk_3` FOREIGN KEY (`id_seance`) REFERENCES `seance` (`id_seance`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `professeur`
--
ALTER TABLE `professeur`
  ADD CONSTRAINT `professeur_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `professeur_ibfk_2` FOREIGN KEY (`id_departement`) REFERENCES `departement` (`id_departement`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `professeur_ibfk_3` FOREIGN KEY (`id_option`) REFERENCES `option` (`id_option`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `publication_club`
--
ALTER TABLE `publication_club`
  ADD CONSTRAINT `FK_PersonOrder23` FOREIGN KEY (`id_member`) REFERENCES `membre` (`id_membre`);

--
-- Constraints for table `reclamation`
--
ALTER TABLE `reclamation`
  ADD CONSTRAINT `FK_PersonOrder8` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Constraints for table `responsable_entreprise`
--
ALTER TABLE `responsable_entreprise`
  ADD CONSTRAINT `FK_PersonOrderzfdfdg51` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprises`),
  ADD CONSTRAINT `responsable_entreprise_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `responsable_entreprise_ibfk_2` FOREIGN KEY (`id_poste_entreprise`) REFERENCES `poste_entreprise` (`id_poste`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `responsable_group`
--
ALTER TABLE `responsable_group`
  ADD CONSTRAINT `responsable_group_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `rubrique`
--
ALTER TABLE `rubrique`
  ADD CONSTRAINT `FK_PersonOrder34` FOREIGN KEY (`id_entretien`) REFERENCES `entretien` (`id_entretien`);

--
-- Constraints for table `salle`
--
ALTER TABLE `salle`
  ADD CONSTRAINT `FK_PersonOrder11` FOREIGN KEY (`id_type_salle`) REFERENCES `salle` (`id_salle`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
