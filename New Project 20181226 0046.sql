-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.12-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema chirpdb
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ chirpdb;
USE chirpdb;

--
-- Table structure for table `chirpdb`.`post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `idpost` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpost`),
  KEY `fk_post_user_idx` (`iduser`),
  CONSTRAINT `fk_post_user` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chirpdb`.`post`
--

/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`idpost`,`iduser`,`title`,`description`,`date`,`status`) VALUES 
 (1,5,'Angular JS','AngularJS is a JavaScript-based open-source front-end web application framework mainly maintained by Google and by a community of individuals and corporations to address many of the challenges encount','2018-12-25 11:22:34','active'),
 (2,6,'JDK 10','Download and install the Java Development Kit (JDK) for your platform. ... You can download JDK and JRE from Java SE Development Kit Downloads page. ... Installation of JDK and JRE on Oracle Solaris: ','2018-12-25 11:33:43','active'),
 (3,5,'Node JS','Node.js is an open-source, cross-platform JavaScript run-time environment that executes JavaScript code outside of a browser.','2018-12-25 11:35:25','active'),
 (4,5,'react JS','React makes it painless to create interactive UIs. Design simple views for each state in your application, and React will efficiently update and render just the right components when your data changes','2018-12-25 11:45:33','active');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;


--
-- Table structure for table `chirpdb`.`user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chirpdb`.`user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`iduser`,`name`,`contact`,`email`,`password`,`user_type`,`status`) VALUES 
 (4,'Iroshana Ranasinghe','0705583939','iroshanaofficial@gmail.com','2cfe534aa66900e81f6f20b02826b6132d2df8de','admin','active'),
 (5,'Dilshan Iroshana','0713258327','dilshaniroshana@gmail.com','87e8db4f2338ba69baa1c7d4e60969caf4f06d9e','user','active'),
 (6,'Ranasinghe Dilshan','0718425978','ranasighe@gmail.com','a597e93b58685131d0c053d556f9614fe67f7fbc','user','active');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
