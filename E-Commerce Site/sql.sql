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

/*Table structure for table `buy` */

DROP TABLE IF EXISTS `buy`;

CREATE TABLE `buy` (
  `buy_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`buy_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `buy` */

insert  into `buy`(`buy_id`,`product_id`,`image`,`amount`,`quantity`,`total`) values 
(1,5,'static/uploads/254d7b6d-2b96-42d2-8682-af990bec0ea2abc.jpg','100','2','200'),
(2,6,'static/uploads/ac2bcde4-da6b-4890-a080-a8006adc12ebabc.jpg','ffdj','dfd','jdjfj'),
(3,6,'static/uploads/457e0b0d-64f1-4453-9dbf-37272a306fe4abc.jpg','ffdj','dfd','jdjfj'),
(4,6,'static/uploads/191292b8-0835-44e6-85e1-1cdf0200ea87abc.jpg','fbh','2','chj');

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`chat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `chat` */

insert  into `chat`(`chat_id`,`sender_id`,`receiver_id`,`message`,`date`) values 
(1,5,9,'hai','2022-12-19'),
(2,5,9,'hai','2022-12-19'),
(3,5,8,'hai','2022-12-19'),
(4,5,8,'hello','2022-12-19'),
(5,9,5,'hai','2022-12-19'),
(6,5,8,'hell','2022-12-19'),
(7,5,9,'hello','2022-12-19'),
(8,5,8,'hai','2022-12-19'),
(9,5,9,'hai','2022-12-19'),
(10,5,9,'hai','2022-12-19'),
(11,5,9,'hai','2022-12-19'),
(12,9,5,'hai','2022-12-19'),
(13,9,5,'hai','2022-12-19'),
(14,9,5,'how are you','2022-12-19'),
(15,9,5,'hai','2022-12-19'),
(16,9,5,'lhellooo','2022-12-19'),
(17,5,9,'yes','2022-12-19'),
(18,5,9,'yes','2022-12-19'),
(19,9,5,'how are you','2022-12-19'),
(20,5,9,'yes','2022-12-19'),
(21,5,9,'fine','2022-12-19'),
(22,9,5,'hai','2022-12-19'),
(23,5,9,'what you want','2022-12-19'),
(24,9,5,'hi','2022-12-19'),
(25,9,5,'hi','2022-12-19'),
(26,9,5,'higjo','2022-12-19'),
(27,5,16,'hai','2022-12-20'),
(28,5,16,'hello','2022-12-20');

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

/*Table structure for table `order_details` */

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `order_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_master_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`order_details_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `order_details` */

insert  into `order_details`(`order_details_id`,`order_master_id`,`product_id`,`quantity`,`amount`) values 
(1,1,3,'3','300'),
(2,1,5,'1','5'),
(3,2,6,'1','25000'),
(4,3,8,'1','5');

/*Table structure for table `order_master` */

DROP TABLE IF EXISTS `order_master`;

CREATE TABLE `order_master` (
  `order_master_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`order_master_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `order_master` */

insert  into `order_master`(`order_master_id`,`user_id`,`shop_id`,`date_time`,`total`,`status`) values 
(1,1,1,'2022-12-17','305','paid'),
(2,1,1,'2022-12-20','25000','paid'),
(3,1,1,'2022-12-20','5','paid');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payment` int(11) NOT NULL AUTO_INCREMENT,
  `order_master_id` int(11) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`payment`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`payment`,`order_master_id`,`amount`,`date`) values 
(1,1,'1000000','2022-09-12'),
(2,1,'1000000','2022-09-12'),
(3,1,'1000000','2022-09-12'),
(4,1,'500000','2022-12-20'),
(5,1,'500000','2022-12-20'),
(6,1,'500000','2022-12-20'),
(7,2,'25000','2022-12-20'),
(8,2,'25000','2022-12-20'),
(9,2,'25000','2022-12-20'),
(10,2,'25000','2022-12-20'),
(11,2,'25000','2022-12-20'),
(12,2,'25000','2022-12-20'),
(13,2,'25000','2022-12-20'),
(14,2,'25000','2022-12-20'),
(15,2,'25000','2022-12-20'),
(16,3,'5','2022-12-20'),
(17,3,'5','2022-12-20');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `cost` varchar(100) DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `product` */

/*Table structure for table `product_category` */

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `product_category` */

insert  into `product_category`(`category_id`,`category_name`) values 
(1,'phone'),
(4,'bba');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `products` */

insert  into `products`(`product_id`,`category_id`,`vendor_id`,`shop_id`,`product_name`,`details`,`price`,`image`) values 
(3,4,3,1,'asfi','resdfghjkl','5','static/image/ee17ace7-af0f-4f69-a652-d8e6e126c3aa1.jfif'),
(5,4,3,1,'pharmacy','HGKJGJ','500000','static/image/6abcf318-e6fb-49a0-9845-b47f8bd6c9365.jfif'),
(6,1,3,1,'dfjkfs','qwertyuiop sdfghjkl','25000','static/image/d793950d-5709-499b-8aee-b6944671495bb525bed6f73324f03073f17a41b82038.jpg'),
(7,4,3,1,'jjjk','resdfghjkl','100','static/image/65358935-27db-42d3-b57a-9716dc276c2f2..jfif'),
(8,1,3,1,'dfjkfs','qwertyuiop sdfghjkl','5','static/image/c3b75513-3083-4990-ba32-d847ac5baa1714-149043_beach-backgrounds-11-nice-wallpaper-background-and-desktop.jpg');

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `review` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `rating` */

insert  into `rating`(`rating_id`,`user_id`,`rating`,`review`) values 
(1,5,'3.0','ham'),
(2,5,'3.0','ham'),
(3,5,'2.0',''),
(4,5,'2.0','dz'),
(5,5,'2.0','dz'),
(6,5,'3.0','fuh'),
(7,5,'2.0','hjk'),
(8,5,'2.0','ejaj'),
(9,5,'3.0','gij'),
(10,5,'5.0','ghgg');

/*Table structure for table `ratings` */

DROP TABLE IF EXISTS `ratings`;

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `rate` varchar(100) DEFAULT NULL,
  `review` varchar(100) DEFAULT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `ratings` */

insert  into `ratings`(`rating_id`,`user_id`,`product_id`,`rate`,`review`,`date_time`) values 
(1,5,5,'2','ok','2022-09-12 15:43:50'),
(2,5,5,'1','ok','2022-09-12 15:44:13'),
(3,5,5,'3','ok','2022-09-12 17:04:50'),
(4,5,5,'2','ok','2022-09-13 12:08:31'),
(5,5,6,'4','ok','2022-09-13 12:11:00'),
(6,5,5,'3','ok','2022-12-20 14:57:14'),
(7,5,5,'3','ok','2022-12-20 14:57:22'),
(8,5,5,'3','ok','2022-12-20 14:59:18');

/*Table structure for table `shops` */

DROP TABLE IF EXISTS `shops`;

CREATE TABLE `shops` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `shop_name` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `shops` */

insert  into `shops`(`shop_id`,`login_id`,`shop_name`,`place`,`landmark`,`phone`,`email`,`status`) values 
(1,2,'shop','ernakulam','qwertyuio','1234567890','shop@gimal.com','accept'),
(2,12,'shop1','ernakulam','qwertyuio','9495795394','renukakamath2@gmail.com','reject');

/*Table structure for table `stocks` */

DROP TABLE IF EXISTS `stocks`;

CREATE TABLE `stocks` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `stocks` */

insert  into `stocks`(`stock_id`,`product_id`,`quantity`,`date_time`) values 
(1,3,'1000','2022-09-12'),
(2,3,'1000','2022-09-12'),
(3,3,'1000','2022-09-12');

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

/*Table structure for table `vendors` */

DROP TABLE IF EXISTS `vendors`;

CREATE TABLE `vendors` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  `est_year` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `vendors` */

insert  into `vendors`(`vendor_id`,`company_name`,`details`,`est_year`) values 
(3,'ren','ren','1998');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
