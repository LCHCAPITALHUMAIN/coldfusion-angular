-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.72-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for conf
CREATE DATABASE IF NOT EXISTS `conf` /*!40100 DEFAULT CHARACTER SET cp1256 */;
USE `conf`;


-- Dumping structure for table conf.conferences
CREATE TABLE IF NOT EXISTS `conferences` (
  `id` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `shortdesc` varchar(250) NOT NULL,
  `registrationurl` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1256;

-- Dumping data for table conf.conferences: ~3 rows (approximately)
/*!40000 ALTER TABLE `conferences` DISABLE KEYS */;
INSERT INTO `conferences` (`id`, `title`, `startdate`, `enddate`, `shortdesc`, `registrationurl`) VALUES
	('1', 'CFSummit2013', '2013-10-23 05:20:01', '2013-10-25 05:20:19', 'Annual ColdFusion Developer Conference', 'somelink'),
	('2', 'Adobe Max', '2014-10-23 05:20:01', '2014-10-25 05:20:19', 'Annual Adobe Conference', 'somelink'),
	('3', 'SOTR', '2014-10-23 05:20:01', '2014-10-25 05:20:19', 'Web Developer Adobe Conference', 'somelink');
/*!40000 ALTER TABLE `conferences` ENABLE KEYS */;


-- Dumping structure for table conf.registration
CREATE TABLE IF NOT EXISTS `registration` (
  `userid` varchar(50) NOT NULL,
  `confid` varchar(50) NOT NULL,
  PRIMARY KEY (`userid`,`confid`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1256;

-- Dumping data for table conf.registration: ~2 rows (approximately)
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` (`userid`, `confid`) VALUES
	('1', '1');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;


-- Dumping structure for table conf.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `passowrd` varchar(50) DEFAULT NULL,
  `twitter` varchar(50) DEFAULT NULL,
  `blog` varchar(50) DEFAULT NULL,
  `image` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1256;

-- Dumping data for table conf.users: ~4 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `firstname`, `lastname`, `passowrd`, `twitter`, `blog`, `image`) VALUES
	('1', 'abc@def.com', 'fName', 'lName', 'pwd', NULL, 'somelink', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
