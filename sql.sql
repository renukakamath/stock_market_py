/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - e_commerce_py
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`e_commerce_py` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `e_commerce_py`;

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `complaint` varchar(100) DEFAULT NULL,
  `reply` varchar(100) DEFAULT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

insert  into `complaints`(`complaint_id`,`user_id`,`complaint`,`reply`,`date_time`) values 
(1,5,'good','pending','2022-09-12 15:59:20'),
(2,5,'good','pending','2022-09-12 16:04:37'),
(3,1,'bad','ok','2022-09-12 16:09:08');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`user_type`) values 
(3,'admin','admin','admin'),
(2,'shop','shop','shop'),
(6,'null','null','user'),
(5,'user','user','user'),
(7,'null','null','user'),
(8,' bb','hhh','user'),
(9,'hello','hello','user'),
(10,'hai','hai123','user'),
(20,'user123','uder123','user'),
(12,'shop1','shop1','block'),
(16,'user','place','user'),
(17,'heyeh','hduje','user'),
(18,'giii','huj','user');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `house_name` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`user_id`,`login_id`,`first_name`,`last_name`,`house_name`,`place`,`latitude`,`longitude`,`pincode`,`phone`,`email`) values 
(1,5,'user','userrr','sdfghjkl fghjk','kerala','qwertyuio',NULL,'682032','1234567890','renukakamath2@gmail.com'),
(2,8,'cui','ggg','vgh',' bb','hhh',NULL,'cui','ggg','vgh'),
(3,9,'cui','ggg','vgh','palakkad','9.9763105','76.2862012','cui','ggg','vgh'),
(4,10,'cui','ggg','vgh','goa','9.9763105','76.2862012','cui','ggg','vgh'),
(6,16,'hai','fhgh','thkji ghhj','ykkj','9.9763105','76.2862012','126486','1234567890','regbyj@gmail.com'),
(7,17,'hwi','heuwu','geyeu','geye','9.9763105','76.2862012','653','65656','bdyeu'),
(8,18,'gij','gyu','huu','gy6u','9.9763105','76.2862012','66555','856663','cfuiu'),
(10,20,'fuk','fii','dgui','ernakulam ','9.9763105','76.2862012','682032','4568889','fyukk@gmail');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
