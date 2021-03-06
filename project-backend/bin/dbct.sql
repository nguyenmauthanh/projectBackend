-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.3-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for education
CREATE DATABASE IF NOT EXISTS `education` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `education`;

-- Dumping structure for table education.account
CREATE TABLE IF NOT EXISTS `account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `teacher_id` bigint(20) NOT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teacher_id` (`teacher_id`),
  KEY `FK_account_teacher` (`teacher_id`) USING BTREE,
  CONSTRAINT `FK_account_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Dumping data for table education.account: ~8 rows (approximately)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `username`, `password`, `teacher_id`, `status`) VALUES
	(23, 'thanhbi', '$2a$10$uLZibSZZHOMQIcwx6ZrdnO3iRFPVsC.NUYMupy5ywLpUuGjXmIeea', 1, b'1'),
	(24, 'thanhbi1', '$2a$10$w2xKTMTvU7Q.wPMbsOHub.JX5rrb1YCTFhuv.gfbbo.e/yZooV4tK', 2, b'1'),
	(25, 'thanhbi11', '$2a$12$d4T8yhtFF38glDPBbEQICOzhvSDHRvqHAncUc0wr6zzQmOq/1ejY6', 3, b'1'),
	(26, 'hoaithu1231', '$2a$10$wgzaIm/.nCEvSuX6aOlN0ufXus104o20ckGNcLRD4ju5MRifA0FSi', 4, b'0'),
	(27, 'hoaithu12311', '$2a$10$GHW6utGL/KtxaEd7dBR6keOXfX1TF8xpIt/fPEVNlEE/133WwYKC2', 5, b'1'),
	(28, 'a2madmin', '$2a$10$sYY5hJvnfXc/pfcCXd2RoOv9TCY9HEZ/oivs.dPPMcK5ScqNAEStK', 6, b'0'),
	(29, 'a2mUser', '$2a$10$e2MFe493Z3RFatm0F.AjNO.yXd.ZMWPeF1fr.x.rGpXjtC4Kiq6DS', 7, b'1'),
	(30, 'a2muser1', '$2a$10$pQqqQtuy4SpyPqj7VW2/SunCaaxpCPBdjR9t3DuHkAxhONPr4fYC.', 8, b'1');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- Dumping structure for table education.account_role
CREATE TABLE IF NOT EXISTS `account_role` (
  `account_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`account_id`,`role_id`),
  KEY `FK__role` (`role_id`),
  CONSTRAINT `FK__account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table education.account_role: ~8 rows (approximately)
/*!40000 ALTER TABLE `account_role` DISABLE KEYS */;
INSERT INTO `account_role` (`account_id`, `role_id`) VALUES
	(23, 1),
	(24, 2),
	(25, 2),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 2),
	(30, 2);
/*!40000 ALTER TABLE `account_role` ENABLE KEYS */;

-- Dumping structure for table education.class
CREATE TABLE IF NOT EXISTS `class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) NOT NULL,
  `total_stu` int(11) NOT NULL,
  `teacher_id` bigint(20) NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `FK_class_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table education.class: ~8 rows (approximately)
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` (`id`, `class_name`, `total_stu`, `teacher_id`, `status`) VALUES
	(1, '1A', 40, 1, 'Ho???t ?????ng'),
	(2, '2A', 40, 2, 'Ho???t ?????ng'),
	(5, '3A', 40, 3, 'Ho???t ?????ng'),
	(6, '1B', 40, 4, 'Ho???t ?????ng'),
	(7, '4A', 40, 5, 'Ho???t ?????ng'),
	(8, '5A', 40, 6, 'Ho???t ?????ng'),
	(9, '5B', 40, 7, 'Ho???t ?????ng'),
	(10, '4B', 40, 8, 'Ho???t ?????ng'),
	(11, '3B', 40, 9, 'Ho???t ?????ng');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;

-- Dumping structure for table education.class_has_subject
CREATE TABLE IF NOT EXISTS `class_has_subject` (
  `class_id` bigint(20) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `teacher_id` bigint(20) NOT NULL,
  PRIMARY KEY (`class_id`,`subject_id`) USING BTREE,
  KEY `FK_class_has_subject_subject` (`subject_id`),
  KEY `FK_class_has_subject_teacher` (`teacher_id`),
  CONSTRAINT `FK_class_has_subject_class` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_class_has_subject_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_class_has_subject_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table education.class_has_subject: ~34 rows (approximately)
/*!40000 ALTER TABLE `class_has_subject` DISABLE KEYS */;
INSERT INTO `class_has_subject` (`class_id`, `subject_id`, `teacher_id`) VALUES
	(1, 1, 1),
	(1, 5, 1),
	(2, 1, 1),
	(5, 1, 1),
	(6, 1, 1),
	(6, 5, 1),
	(7, 1, 1),
	(8, 1, 1),
	(9, 1, 1),
	(10, 1, 1),
	(11, 1, 1),
	(1, 6, 5),
	(6, 6, 5),
	(1, 2, 6),
	(2, 2, 6),
	(5, 2, 6),
	(6, 2, 6),
	(7, 2, 6),
	(8, 2, 6),
	(9, 2, 6),
	(10, 2, 6),
	(11, 2, 6),
	(1, 3, 8),
	(2, 3, 8),
	(5, 3, 8),
	(6, 3, 8),
	(7, 3, 8),
	(8, 3, 8),
	(9, 3, 8),
	(10, 3, 8),
	(11, 3, 8),
	(1, 4, 9),
	(2, 4, 9),
	(6, 4, 9);
/*!40000 ALTER TABLE `class_has_subject` ENABLE KEYS */;

-- Dumping structure for table education.images
CREATE TABLE IF NOT EXISTS `images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stu_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  `file_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `size` bigint(20) NOT NULL DEFAULT 0,
  `filename` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `location` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_images_student` (`stu_id`),
  KEY `FK_images_parent` (`parent_id`),
  KEY `FK_images_teacher` (`teacher_id`),
  CONSTRAINT `FK_images_parent` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_images_student` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_images_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table education.images: ~1 rows (approximately)
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` (`id`, `stu_id`, `parent_id`, `teacher_id`, `file_type`, `size`, `filename`, `location`) VALUES
	(1, NULL, 29, NULL, '23213', 111, '1111', '111111');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;

-- Dumping structure for table education.parent
CREATE TABLE IF NOT EXISTS `parent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_name` varchar(100) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `birthday` date NOT NULL,
  `gender` varchar(50) COLLATE utf8mb3_bin NOT NULL DEFAULT 'b''0''',
  `address` varchar(200) COLLATE utf8mb3_bin NOT NULL DEFAULT '0',
  `telephone` varchar(15) COLLATE utf8mb3_bin NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8mb3_bin NOT NULL DEFAULT '0',
  `status` varchar(100) COLLATE utf8mb3_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Dumping data for table education.parent: ~14 rows (approximately)
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
INSERT INTO `parent` (`id`, `parent_name`, `birthday`, `gender`, `address`, `telephone`, `email`, `status`) VALUES
	(1, 'Nguy???n V??n Ho??ng', '1971-08-05', 'Nam', 'Nam ?????nh', '0352266017', 'nguyenvanhoang@gmail.com', 'Ho???t ?????ng'),
	(2, 'L?? V??n An', '1967-08-05', 'Nam', 'V??nh ph??c', '056522342', 'levanan224@gmail.com', 'Ho???t ?????ng'),
	(13, 'Nguy???n V??n C?????ng', '1971-06-14', 'Nam', 'B???c Ninh', '0344234422', 'nguyenvancuong@gmail.com', 'Ho???t ?????ng'),
	(14, 'Nguy???n V??n Long', '1981-03-08', 'Nam', 'H?? N???i', '0344234422', 'nguyenvanlong332@gmail.com', 'Ho???t ?????ng'),
	(15, 'Nguy???n V??n Th??nh', '1973-01-08', 'Nam', 'H?? N???i', '0344234422', 'nguyenvanthanh232@gmail.com', 'Ho???t ?????ng'),
	(16, 'Tr???n B?? Long', '1991-02-10', 'Nam', 'B???c Ninh', '0344234422', 'addadada@gmail.com', 'Ho???t ?????ng'),
	(17, 'L?? H???i ???????ng', '1992-12-11', 'Nam', 'Ph?? Y??n', '0344234422', 'addadada@gmail.com', 'Ho???t ?????ng'),
	(18, 'Nguy???n Th??? ??nh Tuy???t', '1985-01-24', 'N???', 'B???c Giang', '0344234422', 'addadada@gmail.com', 'Ho???t ?????ng'),
	(19, 'Nguy???n V??n Giang', '1972-06-13', 'Nam', 'sadsads', '0344234422', 'addadada@gmail.com', '??dsadadsas'),
	(25, 'Nguy???n V??n Giang', '2021-08-15', 'Nam', 'sadsads', '0344234422', 'addadada@gmail.com', '??dsadadsas'),
	(26, 'Nguy???n H???i Giang', '1970-06-17', 'Nam', 'B???c Giang', '0344234422', 'addadada@gmail.com', 'Ho???t ?????ng'),
	(27, 'L?? Ho??ng T???n', '1978-07-10', 'Nam', 'H?? N???i', '0344234422', 'addadada@gmail.com', 'Ho???t ?????ng'),
	(28, 'Nguy???n V??n Long', '1974-06-02', 'Nam', 'sadsads', '0344234422', 'addadada@gmail.com', '??dsadadsas'),
	(29, 'L?? Ho??ng H??', '1973-05-06', 'Nam', '2020-2021', '222222222', 'aaaa@gmail.com', 'aaaa');
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;

-- Dumping structure for table education.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table education.role: ~2 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`) VALUES
	(1, 'Manager'),
	(2, 'Teacher');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table education.student
CREATE TABLE IF NOT EXISTS `student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'b''0''',
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `admission_date` date NOT NULL,
  `status` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- Dumping data for table education.student: ~5 rows (approximately)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`id`, `stu_name`, `birthday`, `gender`, `address`, `admission_date`, `status`) VALUES
	(1, 'Nguy???n V??n H???u', '2000-08-24', 'Nam', 'Nam ?????nhh', '2021-08-05', '??ang h???c'),
	(2, 'L?? Ng???c ??nh', '2000-08-05', 'N???', 'V??nh Ph??c', '2012-06-13', '??ang h???c'),
	(19, 'Tr????ng Th??? Qu??', '2000-08-09', 'N???', 'B???c ninh', '2007-06-09', '??ang h???c'),
	(21, '????? Th??? T?? Oanh', '2014-05-04', 'N???', 'Nam ?????nh', '2013-06-02', '??ang h???c');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- Dumping structure for table education.student_has_parent
CREATE TABLE IF NOT EXISTS `student_has_parent` (
  `stu_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  PRIMARY KEY (`stu_id`,`parent_id`) USING BTREE,
  KEY `FK__parent` (`parent_id`) USING BTREE,
  CONSTRAINT `FK_student_has_parent_parent` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_student_has_parent_student` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table education.student_has_parent: ~8 rows (approximately)
/*!40000 ALTER TABLE `student_has_parent` DISABLE KEYS */;
INSERT INTO `student_has_parent` (`stu_id`, `parent_id`) VALUES
	(1, 25),
	(1, 29),
	(2, 14),
	(2, 28),
	(19, 15),
	(19, 16),
	(21, 13),
	(21, 26);
/*!40000 ALTER TABLE `student_has_parent` ENABLE KEYS */;

-- Dumping structure for table education.subclass_diary
CREATE TABLE IF NOT EXISTS `subclass_diary` (
  `stu_id` bigint(20) NOT NULL,
  `class_id` bigint(20) NOT NULL,
  `year` varchar(50) NOT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`stu_id`,`class_id`),
  KEY `FK_subclass_diary_class` (`class_id`),
  CONSTRAINT `FK_subclass_diary_class` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_subclass_diary_student` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table education.subclass_diary: ~13 rows (approximately)
/*!40000 ALTER TABLE `subclass_diary` DISABLE KEYS */;
INSERT INTO `subclass_diary` (`stu_id`, `class_id`, `year`, `status`) VALUES
	(1, 1, '2016-2017', b'1'),
	(1, 2, '2017-2018', b'1'),
	(1, 5, '2018-2019', b'1'),
	(1, 7, '2019-2020', b'0'),
	(2, 1, '2018-2019', b'1'),
	(2, 2, '2019-2020', b'1'),
	(2, 5, '2020-2021', b'0'),
	(19, 1, '2017-2018', b'1'),
	(19, 2, '2018-2019', b'1'),
	(19, 7, '2020-2021', b'0'),
	(19, 11, '2019-2020', b'1'),
	(21, 1, '2019-2020', b'1'),
	(21, 2, '2020-2021', b'0');
/*!40000 ALTER TABLE `subclass_diary` ENABLE KEYS */;

-- Dumping structure for table education.subject
CREATE TABLE IF NOT EXISTS `subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `status` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table education.subject: ~7 rows (approximately)
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` (`id`, `subject_name`, `status`) VALUES
	(1, 'To??n', '1'),
	(2, 'V??n', '1'),
	(3, 'Ti???ng Anh', '1'),
	(4, 'Th??? d???c', '1'),
	(5, 'H??a h???c', '1'),
	(6, 'V???t l??', '1'),
	(7, 'L???ch s???', '1'),
	(8, '?????a l??', '1');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;

-- Dumping structure for table education.teacher
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `birthday` date NOT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '0',
  `level` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `subject_id` bigint(20) NOT NULL,
  `graduation_year` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '0',
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '0',
  `telephone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '0',
  `email` varchar(200) NOT NULL DEFAULT '0',
  `work_start_date` date NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_teacher_subject` (`subject_id`),
  CONSTRAINT `FK_teacher_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table education.teacher: ~10 rows (approximately)
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`id`, `teacher_name`, `birthday`, `gender`, `level`, `subject_id`, `graduation_year`, `address`, `telephone`, `email`, `work_start_date`, `status`) VALUES
	(1, 'Tr???n V??n An', '1974-08-07', 'Nam', '?????i h???c', 1, '1980', 'Ngh??? An', '0358893017', 'tranvanhoa@gmail.com', '1984-08-07', 'Ho???t ?????ng'),
	(2, 'Nguy???n V??n To??n', '1990-01-08', 'Nam', '?????i h???c', 1, '1995', 'H?? T??nh', '0358893017', 'nguyenvantoan@gmail.com', '2000-08-08', 'ho???t ?????ng'),
	(3, 'Nguy???n V??n H??a', '1985-08-16', 'N???', '?????i h???c', 1, '1990', 'Nam ?????nh', '0359993917', 'nguyenvanhoa@gmail.com', '2016-08-16', 'hoat ?????ng'),
	(4, 'L?? Gia Long', '1994-01-24', 'Nam', '?????i h???c', 6, '1998', 'H?? N???i', '0351125014', 'legialong@gmail.com', '2018-08-10', 'Ho???t ?????ng'),
	(5, 'L?? Ng???c ??nh', '1996-08-18', 'N???', '?????i h???c', 6, '2000', 'Nam ?????nh', '094455961', 'lengocanh@gmail.com', '2010-07-18', 'Ho???t ?????ng'),
	(6, 'Cao Thanh Vinh', '1990-01-20', 'N???', '?????i h???c', 2, '1995', 'H?? N???i', '098454321', 'caothanhvinh@gmail.com', '2016-08-18', 'Ho???t ?????ng'),
	(7, 'Tr????ng Th??? Qu??', '1991-02-23', 'N???', '?????i h???c', 2, '1995', 'B???c Ninh', '093424571', 'truongthiquy@gmail.com', '2014-02-19', 'Ho???t ?????ng'),
	(8, 'Nguy???n Anh Tu???n', '1992-08-18', 'Nam', '?????i h???c', 3, '1996', 'Nam ?????nh', '095726532', 'nguyenanhtuan@gmail.com', '2010-07-27', 'Ho???t ?????ng'),
	(9, '????o H???i Long', '1988-02-10', 'Nam', '?????i h???c', 4, '1993', 'Qu???ng Ning', '098462643', 'daohailong@gmail.com', '2018-03-15', 'Ho???t ?????ng'),
	(10, '????o T???n Tr?????ng', '1988-03-20', 'Nam', '?????i h???c', 5, '1993', 'H???i D????ng', '098676565', 'daotantruong@gmail.com', '2010-08-20', 'Ho???t ?????ng');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;