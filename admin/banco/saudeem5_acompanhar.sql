-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 27, 2020 at 11:16 AM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `acompanhar`
--
CREATE DATABASE IF NOT EXISTS `acompanhar` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `acompanhar`;

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
CREATE TABLE IF NOT EXISTS `areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc_area` varchar(225) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `desc_area`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'Comunicação', 1, '2019-10-17 00:00:00', NULL),
(2, 'Habilidade Social', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `atendimentos`
--

DROP TABLE IF EXISTS `atendimentos`;
CREATE TABLE IF NOT EXISTS `atendimentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pacientes_id` int(11) NOT NULL,
  `profissionais_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_consultas_pacientes_idx` (`pacientes_id`),
  KEY `fk_consultas_profissionais1_idx` (`profissionais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atendimentos`
--

INSERT INTO `atendimentos` (`id`, `pacientes_id`, `profissionais_id`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 43, 154, 1, '2019-06-16', NULL),
(2, 44, 154, 1, '2019-05-16', NULL),
(3, 45, 154, 1, '2019-04-26', NULL),
(4, 46, 154, 1, '2019-05-16', NULL),
(5, 59, 170, 1, '2019-10-15', NULL),
(6, 46, 158, 1, '2019-10-16', NULL),
(7, 56, 154, 1, '2019-10-16', NULL),
(8, 61, 181, 1, '2019-10-16', NULL),
(9, 46, 166, 1, '2019-10-17', NULL),
(10, 47, 156, 1, '2019-10-17', NULL),
(11, 44, 154, 1, '2019-10-17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
CREATE TABLE IF NOT EXISTS `audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `query` text,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `avaliacoes`
--

DROP TABLE IF EXISTS `avaliacoes`;
CREATE TABLE IF NOT EXISTS `avaliacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atendimentos_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `consultas_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_table1_consultas1_idx` (`consultas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `avaliacoes`
--

INSERT INTO `avaliacoes` (`id`, `atendimentos_id`, `status`, `createdAt`, `updatedAt`, `consultas_id`) VALUES
(12, 8, 1, '2019-10-17 00:00:00', NULL, NULL),
(13, 8, 1, '2019-10-17 00:00:00', NULL, NULL),
(14, 8, 1, '2019-10-17 00:00:00', NULL, NULL),
(15, 8, 1, '2019-10-17 00:00:00', NULL, NULL),
(16, 8, 1, '2019-10-17 00:00:00', NULL, NULL),
(17, 8, 1, '2019-10-17 00:00:00', NULL, NULL),
(18, 7, 1, '2019-10-17 00:00:00', NULL, NULL),
(19, 8, 1, '2019-10-17 00:00:00', NULL, NULL),
(20, 5, 1, '2019-10-17 00:00:00', NULL, NULL),
(21, 8, 1, '2019-10-17 00:00:00', NULL, NULL),
(22, 8, 1, '2019-10-17 00:00:00', NULL, NULL),
(23, 9, 1, '2019-10-17 00:00:00', NULL, NULL),
(24, 9, 1, '2019-10-17 00:00:00', NULL, NULL),
(25, 2, 1, '2019-10-17 00:00:00', NULL, NULL),
(26, 10, 1, '2019-10-17 00:00:00', NULL, NULL),
(27, 11, 1, '2019-10-17 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(45) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `timestamp` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`id`),
  KEY `last_actvity_idx` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('02nrl75a4mbssgbgghejmh509ao9kv47', '::1', 1571281503, '__ci_last_regenerate|i:1571281486;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('089ekccffusjpn7jg9cjjca0ojhcvn5u', '::1', 1559328419, '__ci_last_regenerate|i:1559328153;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('13au6kg2gos7a2dhgqhdlol79dfi4pkk', '::1', 1559758294, '__ci_last_regenerate|i:1559758288;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('13s9q7cj5c0dd8f9f8mu90ge83n6i12m', '50.63.12.204', 1583705148, '__ci_last_regenerate|i:1583705148;'),
('171c8e6ucra91nrkbo8djheigc8s2842', '::1', 1571254697, '__ci_last_regenerate|i:1571254637;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('1d09mrlh0t8q6qc3g00g83pfmge93jed', '::1', 1559761677, '__ci_last_regenerate|i:1559761677;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('1fv8u7a4nhk5dirlmhvt0g7rcopg8qnt', '::1', 1560728821, '__ci_last_regenerate|i:1560728572;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('1iq05gi0imgoj5iu0rtb1c1b6v8650nf', '::1', 0, '__ci_last_regenerate|i:1559325918;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('20m3i2o0cjan07m2t86os11qi8if5nrk', '::1', 1571284664, '__ci_last_regenerate|i:1571284367;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('21d6ua09ut046fnb4deupbpa7f2ftoga', '::1', 1571292518, '__ci_last_regenerate|i:1571292218;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('29hmhcar27a1paste1t6gk28jkbsh9ga', '::1', 1571287183, '__ci_last_regenerate|i:1571286991;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('2lohnfj5c8heqcquk1l01gl3dtc8u9pk', '::1', 1571285988, '__ci_last_regenerate|i:1571285758;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('3hlab8mts361kib1pvv0sdnb34n2q3ur', '::1', 1560730779, '__ci_last_regenerate|i:1560730673;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('3icltq1rdn66s0vsr9kmaqbd54g9l75r', '::1', 1560734510, '__ci_last_regenerate|i:1560734508;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('3tbsckm76ak8j88ud5o9hbgt5aog2vj4', '::1', 1571293572, '__ci_last_regenerate|i:1571293461;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('41q835mrddbrapdvpg2tdnevpotom77e', '::1', 1571294097, '__ci_last_regenerate|i:1571293801;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}msg_error|s:25:\"Registro não encontrado!\";__ci_vars|a:1:{s:9:\"msg_error\";s:3:\"old\";}'),
('42khm73u87fp9bnii2c29ivotp9iiht8', '::1', 1560728518, '__ci_last_regenerate|i:1560728245;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('475s88dsonp3esvff5ia1gt0974teg57', '::1', 1560880250, '__ci_last_regenerate|i:1560880242;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('4qriqg2t32dfk10hk67b70c41c6k6e02', '::1', 1571285539, '__ci_last_regenerate|i:1571285310;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('4vr2v732bbu81502d8n67lceo624ibj3', '::1', 1571287852, '__ci_last_regenerate|i:1571287619;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('51bg6m6j86qacpko05b4dq0jkr24dp8l', '::1', 1571326151, '__ci_last_regenerate|i:1571326151;'),
('59p3a8fcneg1oq57oec48uaihl3aj59l', '200.137.171.24', 1571338818, '__ci_last_regenerate|i:1571338818;'),
('5ak5r34jo7n9k10ul5kgktj66lknf7si', '::1', 1571286331, '__ci_last_regenerate|i:1571286158;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('68vupj276futp6qa6onuvej02s6odsls', '::1', 1571276671, '__ci_last_regenerate|i:1571276525;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('6kmabb44lbvvgqquhu1q0ag36cpdr4i7', '::1', 1559764123, '__ci_last_regenerate|i:1559764123;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('6ljli3a2mh4nuopq42ked1raomv1bmnl', '::1', 1560898791, '__ci_last_regenerate|i:1560898791;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('6r42ahgi9c4dm3nfcdkp5sqs67d43amq', '::1', 1560722754, '__ci_last_regenerate|i:1560722754;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('7ad89774e86601178c27e33c936d7f61b8b50720', '35.228.46.165', 1596404840, '__ci_last_regenerate|i:1596404839;'),
('7at3amg2il8m73mp23nj7dh6bohdkjlo', '::1', 1560731170, '__ci_last_regenerate|i:1560731101;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('80d1cfgbql9d4gp6165r30b2el6knn2g', '::1', 1571254583, '__ci_last_regenerate|i:1571254335;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('855ffrc11dbpp0kc1j6c6bjihbrdsmdg', '::1', 1571325613, '__ci_last_regenerate|i:1571325499;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('8jka8sdvq95ua7h55ar5qllgfmccl0di', '::1', 1560727714, '__ci_last_regenerate|i:1560727482;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('8qhbkppb2i7rqvud3n5mcemvd5rb3sri', '177.193.31.136', 1576523855, '__ci_last_regenerate|i:1576523789;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('8vg2933ju3gnp5lflcd3ilaman08j6or', '::1', 1560899553, '__ci_last_regenerate|i:1560899293;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('95uh09cs5dggfjkmdstcp1ths9ksq8t1', '::1', 1560879306, '__ci_last_regenerate|i:1560879285;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('96d1o2a98s7tmajsuo9m80g4i3fpuagi', '::1', 1559759146, '__ci_last_regenerate|i:1559759119;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('9eltq0bvm66hopmke1qvk30k754pvg08', '::1', 1560740187, '__ci_last_regenerate|i:1560740114;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('9g8qfjtsf78rv226ksr94328lf7daatr', '::1', 1571165009, '__ci_last_regenerate|i:1571165009;'),
('9q2jt32kokd2k9srlumkstts0cj30bl8', '::1', 1571291221, '__ci_last_regenerate|i:1571291115;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('a5lers28e41eou56hb4ll5ct8kg03quo', '::1', 1560784726, '__ci_last_regenerate|i:1560784726;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('abchbr46rbpt537ntenlbs4eq46gs52i', '::1', 1571252337, '__ci_last_regenerate|i:1571252337;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('add2b0muontqi75ui3dp21u3fdcn1bhj', '::1', 1571292733, '__ci_last_regenerate|i:1571292546;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}msg_error|s:25:\"Registro não encontrado!\";__ci_vars|a:1:{s:9:\"msg_error\";s:3:\"old\";}'),
('b87i7knctgn74ckto6jfm181985qg1gm', '::1', 1571289779, '__ci_last_regenerate|i:1571289485;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}msg_success|s:32:\"Registro adicionado com sucesso!\";__ci_vars|a:1:{s:11:\"msg_success\";s:3:\"old\";}'),
('bo46rno8ocnu4sfu21ilnfaou6adt2cn', '52.187.151.42', 1594276129, '__ci_last_regenerate|i:1594276126;'),
('botu0qc2qemeivubn66n9k4e1hbjn4is', '::1', 1571289393, '__ci_last_regenerate|i:1571289130;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('bs1spnrmkkb471um8sngdidsbm0u9g98', '200.137.171.24', 1571336377, '__ci_last_regenerate|i:1571336230;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('cfo9qnjenhdqgtiseknj2dmqrbplg8o6', '::1', 1560884074, '__ci_last_regenerate|i:1560884048;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('crju5q46afvltim46dafi3s9055q1uqs', '::1', 1559762600, '__ci_last_regenerate|i:1559762480;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('cvbrbj3cne69ngp6t5m9se0qcgg10tuu', '::1', 1560899001, '__ci_last_regenerate|i:1560898991;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('durni2i11r8hhb3ulf9n6psjis6i2hh8', '::1', 1571290730, '__ci_last_regenerate|i:1571290485;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('e0h79i75sv8q0m7oq1et96pg1c3rr1ep', '185.128.26.24', 1576028574, '__ci_last_regenerate|i:1576028574;'),
('e5qnrrek64hp319ieviqgv43ojpfp1tf', '::1', 1571290069, '__ci_last_regenerate|i:1571289802;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('edjcsvehluj8e12m0d3be2ks4djhgtcn', '::1', 1560722457, '__ci_last_regenerate|i:1560722441;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('edsogm6ot846jg0q3a0b9fdicmp57ddq', '::1', 1562014728, '__ci_last_regenerate|i:1562014727;'),
('egjhhdesqop4m0ksmhkf95609gdb1f2q', '::1', 1571293451, '__ci_last_regenerate|i:1571293156;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}msg_error|s:25:\"Registro não encontrado!\";__ci_vars|a:1:{s:9:\"msg_error\";s:3:\"old\";}'),
('epri7llrm1lugj5coj77bsk39esmae3o', '::1', 1560720864, '__ci_last_regenerate|i:1560720804;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}msg_success|s:43:\"Perfil Desenvolvedores editado com sucesso!\";__ci_vars|a:1:{s:11:\"msg_success\";s:3:\"old\";}'),
('f3sebia7j7lbajav0f361n20tsthn9p2', '::1', 1559761524, '__ci_last_regenerate|i:1559761267;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('g1qov7tfiu4kccrjo8qdqfojq62cn2uk', '::1', 1571252300, '__ci_last_regenerate|i:1571252002;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('gernag40t2gkrutqns07i4haab72h81c', '::1', 1571286853, '__ci_last_regenerate|i:1571286667;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('gfpctrqdltnr930ukfh20o071t0f5p17', '::1', 1560730235, '__ci_last_regenerate|i:1560729946;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('h4lnqr8fg4ulc4dfb5shpcvfbdm3spvq', '::1', 1559759643, '__ci_last_regenerate|i:1559759595;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('h8q2q0jcaon8r8if7ijd6fooc3rko6uf', '::1', 1559760517, '__ci_last_regenerate|i:1559760442;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('hmq9i8sdccgk4jmet929fcmatr98pveu', '::1', 1559327844, '__ci_last_regenerate|i:1559327844;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('hojmf4i0ojpkqb4fr96i4gio3q2g2jum', '::1', 1571289007, '__ci_last_regenerate|i:1571288775;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('hqo5ifric7t8f0fme8ufp3bjdni0lq1i', '::1', 1560739418, '__ci_last_regenerate|i:1560739323;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('j6tr1oclbicuulve4thr4ludimpq2nrv', '::1', 1571163767, '__ci_last_regenerate|i:1571163557;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('jbe2cni2bbn3vd1p0s302kjkt4i9i9ik', '::1', 1571285229, '__ci_last_regenerate|i:1571284978;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('jbedske2ei4h8j9aheqc4lffgrompqhf', '::1', 0, '__ci_last_regenerate|i:1559326547;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('jdteels2s2gl1b0r2gs6kud4fohkt71p', '::1', 1562035668, '__ci_last_regenerate|i:1562035668;'),
('jgeta82v27bndqa35hpu4isluaj5lir8', '::1', 1571273982, '__ci_last_regenerate|i:1571273953;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('jiik6nltqv2bhh90fv2no03qae0rs0jq', '::1', 1559328691, '__ci_last_regenerate|i:1559328583;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('jkob1k2khgncb0a5hkddakishqvigsh8', '200.137.171.24', 1571335841, '__ci_last_regenerate|i:1571335636;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}msg_error|s:25:\"Registro não encontrado!\";__ci_vars|a:1:{s:9:\"msg_error\";s:3:\"old\";}'),
('jpu2l0jak5i9cmcrhq14ptpfk0dkrr3p', '::1', 1560899336, '__ci_last_regenerate|i:1560899336;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('jsfc8s5000gk4esfomkl6mt38j3ponv3', '::1', 1571293108, '__ci_last_regenerate|i:1571292854;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}msg_error|s:25:\"Registro não encontrado!\";__ci_vars|a:1:{s:9:\"msg_error\";s:3:\"old\";}'),
('k6vje5lu8873mcepqr4ctmdmvkkp5b2g', '::1', 1559763479, '__ci_last_regenerate|i:1559763180;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('k8k4cltbo0b0bk1754snve42lbl67a43', '::1', 1560729646, '__ci_last_regenerate|i:1560729411;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('kbraes11s265qsr5gdmc662052l1poro', '::1', 1559331220, '__ci_last_regenerate|i:1559331220;'),
('l30t2m0651g1giaoojssgi75lp2u82t6', '::1', 1571278393, '__ci_last_regenerate|i:1571278206;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('lqggmctnaaildqsrknbn2nn64f7tsjmm', '::1', 1571326497, '__ci_last_regenerate|i:1571326497;'),
('lr5uvp3478j4vmcj9u2vn0eprkk99thr', '54.70.229.152', 1587192694, '__ci_last_regenerate|i:1587192694;'),
('lt3hobvoq28earr6huf73kp7n9gtdv7c', '::1', 1571287945, '__ci_last_regenerate|i:1571287929;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('m47oop054ma6gors9md92rqovfru6kh9', '::1', 1571332977, '__ci_last_regenerate|i:1571332961;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('mfdcd7t176e7o3ptcmjrb06jeem8evot', '::1', 1559329134, '__ci_last_regenerate|i:1559329038;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('mfl39bipapi1211dj824ovj1jgadcqh3', '::1', 1571287476, '__ci_last_regenerate|i:1571287297;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('micar9264mpirdma5a9ko2nl7q6mm3v8', '::1', 1571254037, '__ci_last_regenerate|i:1571253771;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}msg_success|s:32:\"Registro adicionado com sucesso!\";__ci_vars|a:1:{s:11:\"msg_success\";s:3:\"old\";}'),
('n1tlf4u8v9115q6vm4qje1ca6vhj96ot', '::1', 1560899736, '__ci_last_regenerate|i:1560899602;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('nj1ll07sgushbapg3idmsns5s18rssg5', '::1', 1560740068, '__ci_last_regenerate|i:1560739794;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('njq6bcqoq5c5su41cu5upgkg9egkgrc2', '50.63.12.204', 1583705148, '__ci_last_regenerate|i:1583705148;'),
('p29tvr2rctl4u8erfmnol7mhe3r5rj9u', '::1', 1560728142, '__ci_last_regenerate|i:1560727938;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('plv51moc4bljjn8lcbaptg34sh3bi6nv', '::1', 1560797971, '__ci_last_regenerate|i:1560797962;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('q0j1348ok6tju3p4nutfguen3dlv8oeg', '::1', 1571284961, '__ci_last_regenerate|i:1571284669;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('qcmr9fvbt3dsh7bjukj9p9fcba5nbgfj', '200.137.171.24', 1571338081, '__ci_last_regenerate|i:1571338029;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}msg_error|s:25:\"Registro não encontrado!\";__ci_vars|a:1:{s:9:\"msg_error\";s:3:\"old\";}'),
('qg06l51j7r385hrbgn59mupi192rpg2o', '::1', 1559762075, '__ci_last_regenerate|i:1559762075;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('rctsqflth1kqo2tct8isp2368ld8lncv', '::1', 1571252001, '__ci_last_regenerate|i:1571251701;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('rvoj27p3aabc0cqo8o55k452h8cvdrh4', '179.211.230.78', 1571438023, '__ci_last_regenerate|i:1571438023;'),
('s1ga446tmdc2iicgud06u8nq9k6hm4u6', '::1', 1560722120, '__ci_last_regenerate|i:1560721858;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('s7rkkl97n9f6vie59f0pfla5e9977g1t', '::1', 1560880014, '__ci_last_regenerate|i:1560879884;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('sfne52h88qfpo74v64pd21e3h2vs8g5p', '::1', 1560899740, '__ci_last_regenerate|i:1560899671;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('t1hccmecptccd6k1erhpika665605qo6', '::1', 1571294277, '__ci_last_regenerate|i:1571294277;'),
('ti5i881mg5hga747t2kddqtjkh8ebifk', '::1', 1559763696, '__ci_last_regenerate|i:1559763482;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('tsnckl8f64mne7cpvv169g84omuh81sa', '::1', 1559331160, '__ci_last_regenerate|i:1559330874;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('u5qtsvnecmtsbrge454u9aemnr5sa5os', '::1', 1571291721, '__ci_last_regenerate|i:1571291593;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}msg_error|s:25:\"Registro não encontrado!\";__ci_vars|a:1:{s:9:\"msg_error\";s:3:\"old\";}'),
('u67mebj352i7vr520l85qq2lbr8pir8c', '::1', 1559761244, '__ci_last_regenerate|i:1559760966;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('u6c8d1f2tu752ec184ogucdh5er989pu', '::1', 1571291079, '__ci_last_regenerate|i:1571290799;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('unb278gel7183jjud8gtp2r6t6hnd5rl', '::1', 1571292200, '__ci_last_regenerate|i:1571291910;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}msg_error|s:25:\"Registro não encontrado!\";__ci_vars|a:1:{s:9:\"msg_error\";s:3:\"old\";}'),
('us8plm534mrjlpifjtobna2kb5fjbp3f', '::1', 1571252780, '__ci_last_regenerate|i:1571252780;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}'),
('vthvphige3e6vgof6kofe8int9n1ihlc', '::1', 1571290484, '__ci_last_regenerate|i:1571290184;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"1\";s:11:\"clientes_id\";N;}'),
('vv40ldp4ihbhpo3nfq699a4v5f9hes48', '::1', 1560900158, '__ci_last_regenerate|i:1560900131;userdata|a:6:{s:2:\"id\";s:1:\"2\";s:4:\"nome\";s:14:\"Bruno Carvalho\";s:7:\"usuario\";s:8:\"brunoscv\";s:6:\"perfis\";a:1:{i:0;s:1:\"4\";}s:9:\"principal\";s:1:\"0\";s:11:\"clientes_id\";N;}');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_empresa` varchar(100) NOT NULL,
  `nome_responsavel` varchar(100) NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  `telefone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `configuracoes` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conselhos`
--

DROP TABLE IF EXISTS `conselhos`;
CREATE TABLE IF NOT EXISTS `conselhos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_conselho` varchar(120) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `conselhos`
--

INSERT INTO `conselhos` (`id`, `nome_conselho`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'COREN', 1, '2019-01-08', '2019-03-27'),
(2, 'CRAS', 1, '2019-01-08', '2019-01-08'),
(3, 'CRF', 1, '2019-01-08', '2019-01-08'),
(4, 'CREFITO', 1, '2019-01-08', NULL),
(5, 'CRFA', 1, '2019-01-08', '2019-01-08'),
(6, 'CRM', 1, '2019-01-08', '2019-01-08'),
(7, 'CRV', 1, '2019-01-08', '2019-01-08'),
(8, 'CRN', 1, '2019-01-08', '2019-01-08'),
(9, 'CRO', 1, '2019-01-08', '2019-01-08'),
(10, 'CRP', 1, '2019-01-08', '2019-01-08'),
(11, 'CREFONO', 1, '2019-01-08', '2019-01-08'),
(12, 'OUT', 1, '2019-01-08', '2019-03-27');

-- --------------------------------------------------------

--
-- Table structure for table `convenios`
--

DROP TABLE IF EXISTS `convenios`;
CREATE TABLE IF NOT EXISTS `convenios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_convenio` varchar(180) DEFAULT NULL,
  `telefone_convenio` varchar(20) DEFAULT NULL,
  `email_convenio` varchar(80) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `convenios`
--

INSERT INTO `convenios` (`id`, `nome_convenio`, `telefone_convenio`, `email_convenio`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'GEAP', NULL, NULL, 1, '2019-01-08', '2019-03-27'),
(2, 'INTERMED', NULL, NULL, 1, '2019-01-09', '2019-01-09'),
(3, 'FUSEX', NULL, NULL, 1, '2019-01-09', '2019-01-09'),
(4, 'POSTAL SAUDE', NULL, NULL, 1, '2019-01-08', '2019-01-08'),
(5, 'PRO SOCIAL', NULL, NULL, 1, '2019-01-08', '2019-01-08'),
(6, 'UNIMED', NULL, NULL, 1, '2019-01-09', NULL),
(7, 'HUMANA', NULL, NULL, 1, '2019-05-16', '2019-05-16');

-- --------------------------------------------------------

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
CREATE TABLE IF NOT EXISTS `especialidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_espec` varchar(180) DEFAULT NULL,
  `status` varchar(180) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `especialidades`
--

INSERT INTO `especialidades` (`id`, `nome_espec`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'Psicologia', '1', '2017-09-26', NULL),
(2, 'Fonoaudiologia', '1', '2017-09-26', NULL),
(3, 'Nutrição', '1', '2017-09-26', NULL),
(4, 'Psicopedagogia', '1', '2017-09-26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(180) DEFAULT NULL,
  `uf` varchar(4) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estados`
--

INSERT INTO `estados` (`id`, `descricao`, `uf`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'Acre', 'AC', 1, '2018-12-05', '2018-12-05'),
(2, 'Alagoas', 'AL', 1, '2018-12-05', '2018-12-05'),
(3, 'Amazonas', 'AM', 1, '2018-12-05', '2018-12-05'),
(4, 'Amapá', 'AP', 1, '2018-12-05', '2018-12-05'),
(5, 'Bahia', 'BA', 1, '2018-12-05', '2018-12-05'),
(6, 'Ceará', 'CE', 1, '2018-12-05', '2018-12-05'),
(7, 'Distrito Federal', 'DF', 1, '2018-12-05', '2018-12-05'),
(8, 'Espirito Santo', 'ES', 1, '2018-12-05', '2018-12-05'),
(9, 'Goiás', 'GO', 1, '2018-12-05', '2018-12-05'),
(10, 'Maranhão', 'MA', 1, '2018-12-05', '2018-12-05'),
(11, 'Minas Gerais', 'MG', 1, '2018-12-05', '2018-12-05'),
(12, 'Mato Grosso do Sul', 'MS', 1, '2018-12-05', '2018-12-05'),
(13, 'Mato Grosso', 'MT', 1, '2018-12-05', '2018-12-05'),
(14, 'Pará', 'PA', 1, '2018-12-05', '2018-12-05'),
(15, 'Paraiba', 'PB', 1, '2018-12-05', '2018-12-05'),
(16, 'Pernambuco', 'PE', 1, '2018-12-05', '2018-12-05'),
(17, 'Piauí', 'PI', 1, '2018-12-05', '2018-12-05'),
(18, 'Paraná', 'PR', 1, '2018-12-05', '2018-12-05'),
(19, 'Rio de Janeiro', 'RJ', 1, '2018-12-05', '2018-12-05'),
(20, 'Rio Grande no Norte', 'RN', 1, '2018-12-05', '2018-12-05'),
(21, 'Rondônia', 'RO', 1, '2018-12-05', '2018-12-05'),
(22, 'Roraima', 'RR', 1, '2018-12-05', '2018-12-05'),
(23, 'Rio Grande do Sul', 'RS', 1, '2018-12-05', '2018-12-05'),
(24, 'Santa Catarina', 'SC', 1, '2018-12-05', '2018-12-05'),
(25, 'Sergipe', 'SE', 1, '2018-12-05', '2018-12-05'),
(26, 'São Paulo', 'SP', 1, '2018-12-05', '2018-12-05'),
(27, 'Tocantins', 'TO', 1, '2018-12-05', '2018-12-05');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menus_id` int(11) DEFAULT NULL,
  `descricao` varchar(45) NOT NULL,
  `url` varchar(45) NOT NULL,
  `icone` varchar(45) NOT NULL,
  `createdAt` varchar(45) NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menus_menus1_idx` (`menus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menus_id`, `descricao`, `url`, `icone`, `createdAt`, `updatedAt`) VALUES
(1, NULL, 'Acompanhar', '/dashboard', 'fa fa-book', '2017-04-19 21:09:19', '2019-06-18 20:22:34'),
(2, NULL, 'Configurações', '#', 'fa fa-cogs', '2016-07-14 12:19:59', '2017-01-09 17:41:39'),
(3, 2, 'Menus', '/menus', 'fa fa-list', '2016-07-14 12:20:21', NULL),
(4, 2, 'Usuarios', '/usuarios', 'fa fa-user', '2016-07-14 12:20:42', NULL),
(5, 2, 'Perfis de Acesso', '/perfis', 'fa fa-group', '2016-07-14 12:21:01', '2016-07-14 12:21:47'),
(12, NULL, 'Cadastros', '', 'fa fa-book', '2019-05-31 15:43:30', NULL),
(13, 12, 'Pacientes', '/pacientes', 'fa fa-users', '2019-05-31 15:43:56', NULL),
(14, 12, 'Profissionais', '/profissionais', 'fa fa-user-md', '2019-05-31 15:45:51', NULL),
(15, 12, 'Especialidades', '/especialidades', 'fa fa-stethoscope', '2019-05-31 15:46:13', NULL),
(16, 12, 'Conselhos', '/conselhos', 'fa fa-medkit', '2019-05-31 15:46:35', NULL),
(17, 12, 'Responsáveis', '/responsaveis', 'fa fa-users', '2019-06-05 15:47:57', NULL),
(19, NULL, 'Consultas', '', 'fa fa-stethoscope', '2019-06-16 20:44:19', '2019-10-16 15:54:48'),
(20, 19, 'Atendimentos', '/atendimentos', 'fa fa-stethoscope', '2019-10-16 15:55:25', '2019-10-16 16:23:11'),
(21, 19, 'Avaliações', '/avaliacoes', 'fa fa-file-text', '2019-10-16 15:55:59', '2019-10-16 16:23:42');

-- --------------------------------------------------------

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE IF NOT EXISTS `pacientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pac` varchar(180) DEFAULT NULL,
  `telefone_pac` varchar(20) DEFAULT NULL,
  `telefonedois_pac` varchar(120) DEFAULT NULL,
  `carteira_pac` varchar(80) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `nome_responsavel` varchar(120) DEFAULT NULL,
  `cep_pac` varchar(45) DEFAULT NULL,
  `endereco_pac` varchar(180) DEFAULT NULL,
  `numero_pac` varchar(45) DEFAULT NULL,
  `complemento_pac` varchar(255) DEFAULT NULL,
  `bairro_pac` varchar(120) DEFAULT NULL,
  `cidade_pac` varchar(180) DEFAULT NULL,
  `uf_pac` varchar(4) DEFAULT NULL,
  `convenios_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pacientes_convenios1_idx` (`convenios_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pacientes`
--

INSERT INTO `pacientes` (`id`, `nome_pac`, `telefone_pac`, `telefonedois_pac`, `carteira_pac`, `data_nasc`, `nome_responsavel`, `cep_pac`, `endereco_pac`, `numero_pac`, `complemento_pac`, `bairro_pac`, `cidade_pac`, `uf_pac`, `convenios_id`, `status`, `createdAt`, `updatedAt`) VALUES
(43, 'AMANDA ELOÍSA CARVALHO', '(86)99570-1348', '', '997602009693005', NULL, '', '', 'QUADRA D, BLOCO D09, APT:01/CONDOMÍNIO BOSQUE SUL', '', '', 'TERESINA SUL', 'TERESINA', 'PI', 7, 1, '2019-01-10', '2019-01-16'),
(44, 'AURI ODORICA DE OLIVEIRA SOARES ', '(86)99413-8554', NULL, '997832000491013', NULL, '', '', 'R BONIFACIO DE ABREU / REFERENCIA: COLÉGIO EISTEIM', '3949', NULL, 'MORADA DO SOL', 'TERESINA', 'PI', 7, 1, '2019-01-10', '2019-01-10'),
(45, 'AYRIANE COSTA AYRES', '(86)99981-9757', '8699946592', '990010000750574', NULL, '', '', 'Q-14 SETOR C - C-07 - MOCAMBINHO I', '', '', 'MOCAMBINHO I', 'TERESINA', 'PI', 7, 1, '2019-01-10', '2019-01-16'),
(46, 'CARLOS FORTES DE SAMPAIO', '(86)32321-310', '999916868', '990010000530248', NULL, '', '', 'RUA NAPOLEÃO LIMA, ED. PAULO MARQUES ', '1281, AP - 602, ', '', 'JÓQUEI', 'TERESINA', 'PI', 7, 1, '2019-01-16', '2019-01-16'),
(47, 'CARLOS HENRIQUE NUNES PEREIRA', '(86)98882-8895', '994230573', '990010000850234', NULL, '', '', 'QUADRA - 24 , CASA 16 ', '', 'PRÓX. AO INSTITUTO TAIEL DE ENSINO', 'PARQUE BRASIL I', 'TERESINA', 'PI', 7, 1, '2019-01-16', '2019-01-16'),
(48, 'DAMIANA PEREIRA DE OLIVEIRA', '(86)99922-2538', '3233-5209   , 99808-3008', '990010000532909', NULL, '', '', 'RESIDENCIAL TAQUARI', 'QUADRA- D CASA 28', 'PRÓXIMO A IGREJA, QUARTA RUA A DIREITA', 'VALE QUEM TEM', 'TERESINA', 'PI', 7, 1, '2019-01-16', '2019-01-16'),
(49, 'DAVI DE ARAÚJO LIMA', '(86)98806-6376', '99961-1457', '990010001192885', NULL, '', '', 'CASA- 10', '', '', 'CONJUNTO CRISTO REI', 'TERESINA', 'PI', 7, 1, '2019-01-16', NULL),
(50, 'EUGÊNIO FERNANDES DE SOUSA', '(86)3222-0908', '8699561-0511', '990010001200616', NULL, '', '', 'RUA GABRIEL FERREIRA', '1095', 'PRÓX. AO F. CARVALHO', 'CENTRO/SUL', 'TERESINA ', 'PI', 7, 1, '2019-01-16', NULL),
(51, 'FRANCINEIDE DA COSTA MARQUES', '(86)3214-2974', '99427-2347', '990010001202600', NULL, '', '', 'AV. DUQUE DE CAXIAS, IMALAIA D- 101, RES. COLINAS DO POTY', '2960', '', 'PRIMAVERA', 'TERESINA', 'PI', 7, 1, '2019-01-16', NULL),
(52, 'FRANCISCA MARIA DE CASTRO', '(86)98810-1331', '98827-2369 - 988573393', '990010000815021', NULL, '', '', 'RUA JOSÉ CONSTÂNCIO (RUA 12 ), ', '1199', 'RUA QUARTEL , EM FRENTE AO CAMPO DO CRUZEIRO', 'PARQUE PIAUÍ ', 'TIMON', 'MA', 7, 1, '2019-01-16', NULL),
(53, 'FRANCISCO ALVES DE ALMEIDA', '(86)99981-3475', '32322106', '990010001241789', NULL, '', '', 'AVENIDA VILMARI', '2150', 'EM FRENTE AO CASARÃO', 'SÃO CRISTOVÃO', 'TERESINA', 'PI', 7, 1, '2019-01-16', NULL),
(54, 'ISAURA DAS CHAGAS MARTINS AZEVEDO', '(86)88177-778', '3213-4414/ 98836-9777/ 98825-2351', '990010001090845', NULL, '', '', 'RUA PARÁ', '937', 'PRÓX. CEMITÉRIO SÃO JOSÉ  ', 'MATINHA', 'TERESINA ', 'PI', 7, 1, '2019-01-16', NULL),
(55, 'JOANA DE AZEVEDO GUIMARÃES', '(86)98825-2351', '', '990010001158474', NULL, '', '', 'RUA DR. FRANCISCO ALMEIDA', '1160', '', 'ININGA', 'TERESINA', 'PI', 7, 1, '2019-01-16', NULL),
(56, 'JOÃO PAULO DA SILVA ALMONDES', '(86)98811-9581', '999077120', '997601002873000', NULL, '', '', 'RESIDENCIAL WALL FERRAZ ', 'QUADRA - C, BLOCO - 02', 'PRÓX. AO BALÃO DA PRF', 'PORTO ALEGRE ', 'TERESINA', 'PI', 7, 1, '2019-01-16', NULL),
(57, 'JOSÉ CRESO FERRO GOMES BARROS', '(86)32191-754', '32272498', '990010001205510', NULL, '', '', 'QUADRA - I , CASA - 14', '', '', 'RESIDENCIAL ESPLANADA', 'TERESINA', 'PI', 7, 1, '2019-01-16', NULL),
(58, 'JOSEFA RODRIGUES LOPES', '(98)98833-2344', '32257997', '990010001598407', NULL, '', '', 'RUA LUCRÉCIO DANTAS AVELINO', '442', '', 'ÁGUA MINERAL', 'TERESINA', 'PI', 7, 1, '2019-01-16', NULL),
(59, 'JÚLIA ANDRADE DE OLIVEIRA', '(98)98146-5529', '3212-4383', '990010000486966', NULL, '', '', 'RUA SÃO JOÃO ', '850', 'PRÓX. AO ESTÁDIO MIGUEL LIMA', 'SANTO ANTONIO', 'TIMON', 'MA', 7, 1, '2019-01-16', NULL),
(60, 'LARA NYCOLLE CASTRO FÉLIX', '(86)99806-0137', '98150-5374', '997601339684001', NULL, '', '', 'QUADRA - G, CASA- 38', '', 'PERTO DO CLUBE DA CEPISA', 'RESIDENCIAL PEDRO BALSI', 'TERESINA', 'PI', 7, 1, '2019-01-16', NULL),
(61, 'MANOEL EUFRAZINO MELO', '(86)32361-221', '98875-9808', '997606397744004', NULL, '', '', 'QUADRA- 150,CASA-10 ', '', '', 'DIRCEU- 1 , EM FRENTE GINÁSIO EDIMILSON, JORGE', 'TERESINA', 'PI', 7, 1, '2019-01-16', NULL),
(62, 'MARIA BERNADETE FERREIRA DE SOUSA', '(86)98850-4904', '98896-4012', '990010001303032', NULL, '', '', 'AVENIDA TERESINA', '715', '', 'PARQUE PIAUÍ , PRÓX. AO COMERCIAL CARVALHO E A CASA DO CHICO LEITOA', 'TIMON', 'MA', 7, 1, '2019-01-16', NULL),
(63, 'MARIA CLEOPHAS ARAÚJO COSTA', '(86)32225-942', '3234-1044 , 9 99885833 , 9 8853-5833, 3234-1473', '990010000970507', NULL, '', '', 'RUA JOSÉ OMATH COM A RUA ACRE', '3185', '', 'ILHOTAS , PRÓX. ACADEMIA FORMA FÍSICA', 'TERESINA', 'PI', 7, 1, '2019-01-17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paciente_responsavel`
--

DROP TABLE IF EXISTS `paciente_responsavel`;
CREATE TABLE IF NOT EXISTS `paciente_responsavel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pacientes_id` int(11) NOT NULL,
  `responsaveis_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_paciente_responsavel_pacientes1_idx` (`pacientes_id`),
  KEY `fk_paciente_responsavel_responsaveis1_idx` (`responsaveis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paciente_responsavel`
--

INSERT INTO `paciente_responsavel` (`id`, `pacientes_id`, `responsaveis_id`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 44, 1, 1, '2019-06-05', NULL),
(2, 44, 2, 1, '2019-06-05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `perfis`
--

DROP TABLE IF EXISTS `perfis`;
CREATE TABLE IF NOT EXISTS `perfis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perfis`
--

INSERT INTO `perfis` (`id`, `descricao`, `createdAt`, `updatedAt`) VALUES
(2, 'Gerentes', '2016-07-14 12:21:26', '2019-06-16 18:34:01'),
(3, 'Profissionais', '2017-03-07 11:46:59', '2019-06-16 18:34:16'),
(4, 'Desenvolvedores', '2017-03-14 23:41:06', '2019-10-16 15:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `perfis_menus`
--

DROP TABLE IF EXISTS `perfis_menus`;
CREATE TABLE IF NOT EXISTS `perfis_menus` (
  `perfis_id` int(11) NOT NULL,
  `menus_id` int(11) NOT NULL,
  PRIMARY KEY (`perfis_id`,`menus_id`),
  KEY `fk_perfis_has_menus_menus1_idx` (`menus_id`),
  KEY `fk_perfis_has_menus_perfis1_idx` (`perfis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perfis_menus`
--

INSERT INTO `perfis_menus` (`perfis_id`, `menus_id`) VALUES
(2, 1),
(3, 1),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(2, 12),
(4, 12),
(2, 13),
(4, 13),
(2, 14),
(4, 14),
(2, 15),
(4, 15),
(2, 16),
(4, 16),
(2, 17),
(4, 17),
(4, 19),
(4, 20),
(4, 21);

-- --------------------------------------------------------

--
-- Table structure for table `perguntas`
--

DROP TABLE IF EXISTS `perguntas`;
CREATE TABLE IF NOT EXISTS `perguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc_pergunta` varchar(225) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `areas_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_perguntas_areas1_idx` (`areas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perguntas`
--

INSERT INTO `perguntas` (`id`, `desc_pergunta`, `tipo`, `status`, `createdAt`, `updatedAt`, `areas_id`) VALUES
(1, 'Volta os olhos e a cabeça em direção ao som.', 1, 1, '2019-10-17 00:00:00', NULL, 1),
(2, 'Ouve, pelo menos momentaneamente, quando o educador fala.', 1, 1, '2019-10-17 00:00:00', NULL, 1),
(3, 'Sorri como resposta à presença do educador.', 2, 1, '2019-10-17 00:00:00', NULL, 1),
(4, 'Sorri como resposta à presença de uma pessoa da família, para além do educador.', 2, 1, '2019-10-17 00:00:00', NULL, 1),
(5, 'Estende os braços quando o educador diz: \"Vem cá\" ou \"Upa\".', 1, 1, '2019-10-17 00:00:00', NULL, 1),
(6, 'Demonstra compreender a palavra \"não\".', 1, 1, '2019-10-17 00:00:00', NULL, 1),
(7, 'Imita os sons de um adulto imediatamente ao ouvir.', 2, 1, '2019-10-17 00:00:00', NULL, 1),
(8, 'Demonstra compreender o significado de pelo menos 10 palavras.', 1, 1, '2019-10-17 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `profissionais`
--

DROP TABLE IF EXISTS `profissionais`;
CREATE TABLE IF NOT EXISTS `profissionais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_prof` varchar(180) DEFAULT NULL,
  `telefone_prof` varchar(18) DEFAULT NULL,
  `conselhos_id` int(11) NOT NULL,
  `num_conselho_prof` varchar(50) DEFAULT NULL,
  `estados_id` int(11) NOT NULL,
  `especialidades_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profissionais_especialidades1_idx` (`especialidades_id`),
  KEY `fk_profissionais_estados1_idx` (`estados_id`),
  KEY `fk_profissionais_conselhos1_idx` (`conselhos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profissionais`
--

INSERT INTO `profissionais` (`id`, `nome_prof`, `telefone_prof`, `conselhos_id`, `num_conselho_prof`, `estados_id`, `especialidades_id`, `status`, `createdAt`, `updatedAt`) VALUES
(153, 'PEDRO HENRIQUE RODRIGUES PINHEIRO ', '(86)99929-4454', 4, '170.555-F', 17, 2, 1, '2019-01-08', '2019-03-28'),
(154, 'AMARA REGINA CAMBOIM RIBEIRO', '(86)98118-0424', 4, '196.037-F', 17, 2, 1, '2019-01-08', '2019-03-28'),
(155, 'ANA CAROLINA CESAR MENÊSES ', '(86)99910-4236', 4, '133.975-F', 17, 2, 1, '2019-01-08', '2019-01-10'),
(156, 'ANA MOEMA ARRAES EVELIM SOARES ', '(86)99993-4083', 10, '21/01775', 17, 1, 1, '2019-01-08', '2019-01-10'),
(157, 'ANDRESSA TASSIA DE OLIVEIRA ALVES', '(86)98119-2153', 11, '11.620', 17, 3, 1, '2019-01-08', '2019-01-10'),
(158, 'ANTÔNIA ROSANNYA PEDROSA CHAVES', '(86)99985-1229', 4, '18806-TO', 17, 1, 1, '2019-01-10', '2019-01-10'),
(159, 'ÁUREA RÉGIA CORREIA GONÇALVES', '(86)99938-8148', 4, '18807-TO', 17, 1, 1, '2019-01-10', '2019-01-10'),
(160, 'CARLOS CELSO BEZERRA DE SOUSA NETO', '(86)98190-9773', 4, '220.554-F', 17, 2, 1, '2019-01-10', '2019-01-10'),
(161, 'CAIO VINÍCIUS DO NASCIMENTO VASCONCELOS', '(86)98866-9555', 4, '190.719-F', 17, 2, 1, '2019-01-10', '2019-01-10'),
(162, 'CAROLINE FERNANDA DA COSTA SILVA', '(86)99913-3171', 10, '21/03478', 17, 1, 1, '2019-01-10', NULL),
(163, 'EDNA MARIA FERNANDES DE CARVALHO', '(86)99944-7608', 4, '206.734 – F ', 17, 2, 1, '2019-01-10', NULL),
(164, 'EDUARDO DE SOUSA COELHO', '(86)99954-8286', 4, '234.175 – F', 17, 2, 1, '2019-01-10', NULL),
(165, 'ELAINE CRISTINA DA COSTA MENESES', '(86)98191-0113', 4, '210.198-F', 17, 2, 1, '2019-01-10', NULL),
(166, 'ELAYNE RODRIGUES FLORES', '(86)99917-2726', 4, '159.133 – F ', 17, 2, 1, '2019-01-10', NULL),
(167, 'GHEYNYSON NUNES ASSUNÇÃO', '(86)98876-4839', 11, '11997', 17, 1, 1, '2019-01-10', NULL),
(168, 'JACIARA DO NASCIMENTO COSTA', '(86)99510-9562', 4, '11181', 17, 3, 1, '2019-01-10', NULL),
(169, 'JESSÉ LOPES SMITH JUNIOR ', '(86)99823-4072', 4, '189.509-F', 17, 2, 1, '2019-01-10', NULL),
(170, 'JESSIKA HELENA BEZERRA DA ROCHA', '(86)99434-2516', 10, '21/01643 ', 17, 1, 1, '2019-01-10', NULL),
(171, 'JOÃO PAULO SOARES LIMA COELHO', '(86)99957-6154', 4, '234.847 – F ', 17, 2, 1, '2019-01-10', NULL),
(172, 'JOSÉ SALES DIAS NETO', '(86)99441-6699', 4, '166.568-F', 17, 2, 1, '2019-01-10', NULL),
(173, 'JOYCE DIAS MACEDO BRITO', '(89)98114-1785', 8, '8952  ', 17, 2, 1, '2019-01-10', NULL),
(174, 'JULYANE DO AMARAL DE MOURA SANTOS', '(86)98181-0287', 4, '18810 – TO ', 17, 1, 1, '2019-01-10', NULL),
(175, 'KARLLA LORENNA AGUIAR MACHADO', '(86)99860-4372', 4, '161.107 – F ', 17, 2, 1, '2019-01-10', NULL),
(176, 'LARYSSA RAWENNA ROCHA SANTOS', '(86)99819-9820', 4, '182.166-F', 17, 2, 1, '2019-01-10', NULL),
(177, 'LETÍCIA BONA ANDRADE', '(86)99429-5344', 4, '211.738 – F ', 17, 2, 1, '2019-01-10', NULL),
(178, 'LÍVIA BALDOINO CARDOSO', '(86)99975-8589', 11, '11609 ', 17, 3, 1, '2019-01-10', NULL),
(179, 'LORENA POLLIANA COELHO CUNHA', '(86)99955-2499', 4, '222.941 – F ', 17, 2, 1, '2019-01-10', NULL),
(180, 'LUANA CABRAL BEZERRA', '(86)99464-9347', 4, '229.315 – F', 17, 2, 1, '2019-01-10', NULL),
(181, 'LUANA NAYARA DOS SANTOS SOUSA', '(86)99447-3669', 4, '175715-F', 17, 2, 1, '2019-01-10', NULL),
(182, 'MARCUS VINÍCIUS PRADO MOURÃO ', '(86)99929-1796', 4, '101.134 – F ', 17, 2, 1, '2019-01-10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `responsaveis`
--

DROP TABLE IF EXISTS `responsaveis`;
CREATE TABLE IF NOT EXISTS `responsaveis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_resp` varchar(180) DEFAULT NULL,
  `cpf_resp` varchar(45) DEFAULT NULL,
  `telefone_resp` varchar(45) DEFAULT NULL,
  `telefonedois_resp` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `responsaveis`
--

INSERT INTO `responsaveis` (`id`, `nome_resp`, `cpf_resp`, `telefone_resp`, `telefonedois_resp`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'Flavio Lima', '123.565.484-84', '(86)9848-4848', '(86)89484-9849', 1, '2019-06-05', NULL),
(2, 'Claudia Machado', '212.351.188-15', '(81)5181-5181', '(84)15186-5185', 1, '2019-06-05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `respostas`
--

DROP TABLE IF EXISTS `respostas`;
CREATE TABLE IF NOT EXISTS `respostas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avaliacoes_id` int(11) NOT NULL,
  `perguntas_id` int(11) NOT NULL,
  `valor` varchar(2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `consultas_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_respostas_perguntas1_idx` (`perguntas_id`),
  KEY `fk_respostas_avaliacoes1_idx` (`avaliacoes_id`),
  KEY `fk_respostas_consultas1_idx` (`consultas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='			';

--
-- Dumping data for table `respostas`
--

INSERT INTO `respostas` (`id`, `avaliacoes_id`, `perguntas_id`, `valor`, `status`, `createdAt`, `updatedAt`, `consultas_id`) VALUES
(14, 12, 1, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(15, 12, 2, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(16, 12, 3, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(17, 12, 4, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(18, 12, 5, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(19, 12, 6, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(20, 12, 7, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(21, 12, 8, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(22, 13, 1, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(23, 13, 2, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(24, 13, 3, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(25, 13, 4, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(26, 13, 5, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(27, 13, 6, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(28, 13, 7, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(29, 13, 8, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(30, 14, 1, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(31, 14, 2, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(32, 14, 3, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(33, 14, 4, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(34, 14, 5, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(35, 14, 6, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(36, 14, 7, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(37, 14, 8, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(38, 15, 1, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(39, 15, 2, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(40, 15, 3, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(41, 15, 4, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(42, 15, 5, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(43, 15, 6, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(44, 15, 7, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(45, 15, 8, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(46, 16, 1, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(47, 16, 2, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(48, 16, 3, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(49, 16, 4, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(50, 16, 5, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(51, 16, 6, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(52, 16, 7, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(53, 16, 8, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(54, 17, 1, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(55, 17, 2, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(56, 17, 3, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(57, 17, 4, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(58, 17, 5, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(59, 17, 6, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(60, 17, 7, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(61, 17, 8, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(62, 18, 1, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(63, 18, 2, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(64, 18, 3, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(65, 18, 4, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(66, 18, 5, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(67, 18, 6, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(68, 18, 7, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(69, 18, 8, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(70, 19, 1, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(71, 19, 2, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(72, 19, 3, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(73, 19, 4, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(74, 19, 5, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(75, 19, 6, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(76, 19, 7, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(77, 19, 8, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(78, 20, 1, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(79, 20, 2, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(80, 20, 3, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(81, 20, 4, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(82, 20, 5, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(83, 20, 6, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(84, 20, 7, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(85, 20, 8, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(86, 21, 1, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(87, 21, 2, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(88, 21, 3, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(89, 21, 4, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(90, 21, 5, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(91, 21, 6, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(92, 21, 7, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(93, 21, 8, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(94, 22, 1, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(95, 22, 2, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(96, 22, 3, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(97, 22, 4, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(98, 22, 5, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(99, 22, 6, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(100, 22, 7, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(101, 22, 8, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(102, 23, 1, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(103, 23, 2, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(104, 23, 3, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(105, 23, 4, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(106, 23, 5, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(107, 23, 6, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(108, 23, 7, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(109, 23, 8, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(110, 24, 1, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(111, 24, 2, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(112, 24, 3, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(113, 24, 4, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(114, 24, 5, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(115, 24, 6, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(116, 24, 7, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(117, 24, 8, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(118, 25, 1, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(119, 25, 2, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(120, 25, 3, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(121, 25, 4, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(122, 25, 5, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(123, 25, 6, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(124, 25, 7, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(125, 25, 8, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(126, 26, 1, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(127, 26, 2, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(128, 26, 3, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(129, 26, 4, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(130, 26, 5, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(131, 26, 6, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(132, 26, 7, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(133, 26, 8, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(134, 27, 1, '2', 1, '2019-10-17 00:00:00', NULL, NULL),
(135, 27, 2, '1', 1, '2019-10-17 00:00:00', NULL, NULL),
(136, 27, 3, '0', 1, '2019-10-17 00:00:00', NULL, NULL),
(137, 27, 4, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(138, 27, 5, 'N', 1, '2019-10-17 00:00:00', NULL, NULL),
(139, 27, 6, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(140, 27, 7, 'D', 1, '2019-10-17 00:00:00', NULL, NULL),
(141, 27, 8, 'D', 1, '2019-10-17 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `valor` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `descricao`, `valor`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'Ativo', 1, 1, '2019-05-16', '2019-05-16'),
(2, 'Inativo', 0, 1, '2019-05-16', '2019-05-16');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(200) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `senha` varchar(250) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `clientes_id` int(11) DEFAULT NULL,
  `principal` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_usuarios_clientes1_idx` (`clientes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `nome`, `email`, `telefone`, `senha`, `createdAt`, `updatedAt`, `clientes_id`, `principal`) VALUES
(2, 'brunoscv', 'Bruno Carvalho', 'bruno@gmail.com', NULL, 'A0/nKkR2aSEgf7RrWq7WhKF9XigwITJXcsv2+O4YUs+wa05fF0Zc0kGzwDyOEOxO3UwL+AOWNUjKb7eDCAOVvA==', '2017-01-09 18:29:54', '2019-10-16 15:57:56', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_perfis`
--

DROP TABLE IF EXISTS `usuarios_perfis`;
CREATE TABLE IF NOT EXISTS `usuarios_perfis` (
  `usuarios_id` int(11) NOT NULL,
  `perfis_id` int(11) NOT NULL,
  PRIMARY KEY (`usuarios_id`,`perfis_id`),
  KEY `fk_usuarios_has_perfis_perfis1_idx` (`perfis_id`),
  KEY `fk_usuarios_has_perfis_usuarios1_idx` (`usuarios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios_perfis`
--

INSERT INTO `usuarios_perfis` (`usuarios_id`, `perfis_id`) VALUES
(2, 4);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD CONSTRAINT `fk_consultas_pacientes` FOREIGN KEY (`pacientes_id`) REFERENCES `pacientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_consultas_profissionais1` FOREIGN KEY (`profissionais_id`) REFERENCES `profissionais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD CONSTRAINT `fk_table1_consultas1` FOREIGN KEY (`consultas_id`) REFERENCES `atendimentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `fk_menus_menus1` FOREIGN KEY (`menus_id`) REFERENCES `menus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `fk_pacientes_convenios1` FOREIGN KEY (`convenios_id`) REFERENCES `convenios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `paciente_responsavel`
--
ALTER TABLE `paciente_responsavel`
  ADD CONSTRAINT `fk_paciente_responsavel_pacientes1` FOREIGN KEY (`pacientes_id`) REFERENCES `pacientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_paciente_responsavel_responsaveis1` FOREIGN KEY (`responsaveis_id`) REFERENCES `responsaveis` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `perfis_menus`
--
ALTER TABLE `perfis_menus`
  ADD CONSTRAINT `fk_perfis_has_menus_menus1` FOREIGN KEY (`menus_id`) REFERENCES `menus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_perfis_has_menus_perfis1` FOREIGN KEY (`perfis_id`) REFERENCES `perfis` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `perguntas`
--
ALTER TABLE `perguntas`
  ADD CONSTRAINT `fk_perguntas_areas1` FOREIGN KEY (`areas_id`) REFERENCES `areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `profissionais`
--
ALTER TABLE `profissionais`
  ADD CONSTRAINT `fk_profissionais_conselhos1` FOREIGN KEY (`conselhos_id`) REFERENCES `conselhos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_profissionais_especialidades1` FOREIGN KEY (`especialidades_id`) REFERENCES `especialidades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_profissionais_estados1` FOREIGN KEY (`estados_id`) REFERENCES `estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `respostas`
--
ALTER TABLE `respostas`
  ADD CONSTRAINT `fk_respostas_avaliacoes1` FOREIGN KEY (`avaliacoes_id`) REFERENCES `avaliacoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_respostas_consultas1` FOREIGN KEY (`consultas_id`) REFERENCES `atendimentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_respostas_perguntas1` FOREIGN KEY (`perguntas_id`) REFERENCES `perguntas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usuarios_perfis`
--
ALTER TABLE `usuarios_perfis`
  ADD CONSTRAINT `fk_usuarios_has_perfis_perfis1` FOREIGN KEY (`perfis_id`) REFERENCES `perfis` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarios_has_perfis_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
