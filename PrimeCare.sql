-- MariaDB dump 10.19  Distrib 10.4.19-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: PrimeCare
-- ------------------------------------------------------
-- Server version	10.4.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `appointment_id` varchar(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `consultation_duration` time DEFAULT NULL,
  `medical_record_number` varchar(11) DEFAULT NULL,
  `doctor_id` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `appointment_ibfk_1` (`medical_record_number`),
  KEY `appointment_ibfk_2` (`doctor_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`medical_record_number`) REFERENCES `patients` (`medical_record_number`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES ('APPT201','2024-08-01','09:00:00','00:30:00','MRN001','DC001'),('APPT202','2024-08-01','10:30:00','00:45:00','MRN002','DC002'),('APPT203','2024-08-01','13:00:00','01:00:00','MRN003','DC003'),('APPT204','2024-08-02','11:00:00','00:30:00','MRN004','DC004'),('APPT205','2024-08-02','14:00:00','00:30:00','MRN005','DC005');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `doctor_id` varchar(11) NOT NULL,
  `doctor_full_name` varchar(100) NOT NULL,
  `doctor_specialization` varchar(100) DEFAULT NULL,
  `doctor_phone_number` varchar(15) DEFAULT NULL,
  `doctor_email_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES ('DC001','Dr. Max Leffriant','Pediatrics','62875268426','dr.max.leffriant@primecarehospital.org'),('DC002','Dr. Nadia Maher','Neurology','6287354921','dr.nadia.maher@primecarehospital.org'),('DC003','Dr. Elena Benedict','Dermatology','6282263225','dr.elena.benedict@primecarehospital.org'),('DC004','Dr. Isabelle Becker','Orthopedics','6283326912','dr.isabelle.becker@primecarehospital.org'),('DC005','Dr. Eric Mayor','Pulmonology','6282975329','dr.eric.mayor@primecarehospital.org');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_prescription`
--

DROP TABLE IF EXISTS `medical_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medical_prescription` (
  `prescription_number` varchar(11) NOT NULL,
  `medication_code` varchar(11) NOT NULL,
  PRIMARY KEY (`prescription_number`,`medication_code`),
  KEY `medical_prescription_ibfk_2` (`medication_code`),
  CONSTRAINT `medical_prescription_ibfk_1` FOREIGN KEY (`prescription_number`) REFERENCES `prescriptions` (`prescription_number`),
  CONSTRAINT `medical_prescription_ibfk_2` FOREIGN KEY (`medication_code`) REFERENCES `medication` (`medication_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_prescription`
--

LOCK TABLES `medical_prescription` WRITE;
/*!40000 ALTER TABLE `medical_prescription` DISABLE KEYS */;
INSERT INTO `medical_prescription` VALUES ('PN101','MC001'),('PN102','MC002'),('PN103','MC003'),('PN104','MC004'),('PN105','MC005');
/*!40000 ALTER TABLE `medical_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medication` (
  `medication_code` varchar(11) NOT NULL,
  `medication_name` varchar(100) NOT NULL,
  `medication_description` text DEFAULT NULL,
  `medication_category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`medication_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES ('MC001','Amoxicillin','Antibiotic used to treat bacterial infections in children','Pediatrics'),('MC002','Gabapentin','Used to treat nerve pain and seizures','Neurology'),('MC003','Hydrocortisone','Cream used for treating skin inflammation and rashes','Dermatology'),('MC004','Ibuprofen','Pain reliever commonly used for joint pain and inflammation','Orthopedics'),('MC005','Albuterol','Inhaler for relieving asthma symptoms and other breathing issues','Pulmonology');
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `medical_record_number` varchar(11) NOT NULL,
  `patient_full_name` varchar(100) NOT NULL,
  `patient_gender` char(1) NOT NULL,
  `patient_date_of_birth` date NOT NULL,
  `patient_address` varchar(15) DEFAULT NULL,
  `patient_email_address` varchar(100) DEFAULT NULL,
  `patient_phone_number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`medical_record_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES ('MRN001','Milo Rossi','F','2000-03-14','92 Oakwood Stre','milo.rossi@gmail.com','62838555991'),('MRN002','Rafael Moreno','M','1999-11-08','23 Banyan Road','rafael.moreno@gmail.com','62859555644'),('MRN003','Lauren Amelia','F','2002-04-30','45 Orchid Avenu','lauren.amelia@gmail.com','62838559757'),('MRN004','Leo Huang','M','2001-07-28','34 Mango Hills','leo.huang@gmail.com','62878532962'),('MRN005','Sofia Hermann','F','2003-01-05','72 Jasmine Aven','sofia.hermann@gmail.com','62859429651');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescriptions` (
  `prescription_number` varchar(11) NOT NULL,
  `prescription_date` date NOT NULL,
  `prescription_dose` varchar(50) DEFAULT NULL,
  `prescription_notes` text DEFAULT NULL,
  `medical_record_number` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`prescription_number`),
  KEY `prescriptions_ibfk_1` (`medical_record_number`),
  CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`medical_record_number`) REFERENCES `patients` (`medical_record_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES ('PN101','2024-08-01','500mg','Take one tablet every 6 hours.','MRN001'),('PN102','2024-08-01','200mg','Take two tablets daily after meals.','MRN002'),('PN103','2024-08-01','5ml','Administer 5ml syrup every 8 hours.','MRN003'),('PN104','2024-08-02','100mg','Apply cream twice a day on the affected area.','MRN004'),('PN105','2024-08-02','2 inhalations','Use two inhalations as needed for asthma.','MRN005');
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-09 20:25:29
