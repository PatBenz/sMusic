-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2015 at 03:50 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `itunes`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `albumID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `artist` varchar(100) NOT NULL,
  `year` year(4) NOT NULL,
  `genre` varchar(45) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`albumID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`albumID`, `name`, `artist`, `year`, `genre`, `price`) VALUES
(1, 'Thriller', 'Michael Jackson', 1982, 'Pop', 15),
(2, 'Mistral Gagnant', 'Renaud Sechan', 1985, 'Pop', 15);

-- --------------------------------------------------------

--
-- Table structure for table `albumsong`
--

CREATE TABLE IF NOT EXISTS `albumsong` (
  `albumSongID` int(11) NOT NULL AUTO_INCREMENT,
  `Album_albumID` int(11) NOT NULL,
  `Song_songID` int(11) NOT NULL,
  PRIMARY KEY (`albumSongID`),
  KEY `fk_ALBUMSONG_Album_idx` (`Album_albumID`),
  KEY `fk_ALBUMSONG_Song1_idx` (`Song_songID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `albumsong`
--

INSERT INTO `albumsong` (`albumSongID`, `Album_albumID`, `Song_songID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `roleID` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleID`, `role`) VALUES
(1, 'administrateur'),
(2, 'utilisateur');

-- --------------------------------------------------------

--
-- Table structure for table `song`
--

CREATE TABLE IF NOT EXISTS `song` (
  `songID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `artist` varchar(100) NOT NULL,
  `year` int(11) NOT NULL,
  `genre` varchar(45) NOT NULL,
  `songPrice` float NOT NULL,
  `duration` varchar(10) NOT NULL,
  PRIMARY KEY (`songID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `song`
--

INSERT INTO `song` (`songID`, `title`, `artist`, `year`, `genre`, `songPrice`, `duration`) VALUES
(1, 'Billy Jean', 'Michael Jackson', 1985, 'Pop', 2.68, '3:45'),
(2, 'Beat it', 'Michael Jackson', 1985, 'Pop', 2.75, '3:55'),
(3, 'Mistral Gagnant', 'Renaud Sechan', 1985, 'Variété', 2.68, '4:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `Role_roleID` int(11) NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `fk_Users_Role1_idx` (`Role_roleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `firstName`, `lastName`, `email`, `phoneNumber`, `Role_roleID`) VALUES
(1, 'admin', 'admin', 'Adam', 'Antoine', 'admin@admin.com', '+32 457 89 63 02', 1),
(2, 'user5678', 'user', 'Jean', 'Cabot', 'jcabot@woozoo.fr', '+32 484 78 96 12', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `albumsong`
--
ALTER TABLE `albumsong`
  ADD CONSTRAINT `fk_ALBUMSONG_Album` FOREIGN KEY (`Album_albumID`) REFERENCES `album` (`albumID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ALBUMSONG_Song1` FOREIGN KEY (`Song_songID`) REFERENCES `song` (`songID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_Users_Role1` FOREIGN KEY (`Role_roleID`) REFERENCES `role` (`roleID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
