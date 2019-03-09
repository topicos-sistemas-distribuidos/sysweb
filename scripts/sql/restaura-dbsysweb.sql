-- MySQL dump 10.13  Distrib 5.7.19, for macos10.12 (x86_64)
--
-- Host: localhost    Database: dbsysweb
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `my_stores`
--

DROP TABLE IF EXISTS `my_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_stores` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3bexvrd7jqwscshcimd33r2vx` (`user_id`),
  CONSTRAINT `FK3bexvrd7jqwscshcimd33r2vx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_stores`
--

LOCK TABLES `my_stores` WRITE;
/*!40000 ALTER TABLE `my_stores` DISABLE KEYS */;
INSERT INTO `my_stores` VALUES (1,2),(2,17);
/*!40000 ALTER TABLE `my_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_stores_store_list`
--

DROP TABLE IF EXISTS `my_stores_store_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_stores_store_list` (
  `my_stores_id` bigint(20) NOT NULL,
  `store_list_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_hqsmj92qvrsu20nvjv42gjwgr` (`store_list_id`),
  KEY `FK1fbji8bf4ic83ems7dvxa7mcr` (`my_stores_id`),
  CONSTRAINT `FK1fbji8bf4ic83ems7dvxa7mcr` FOREIGN KEY (`my_stores_id`) REFERENCES `my_stores` (`id`),
  CONSTRAINT `FK2ycadl6ruglvsydm1n0ld463r` FOREIGN KEY (`store_list_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_stores_store_list`
--

LOCK TABLES `my_stores_store_list` WRITE;
/*!40000 ALTER TABLE `my_stores_store_list` DISABLE KEYS */;
INSERT INTO `my_stores_store_list` VALUES (1,12),(1,13),(1,21),(2,14);
/*!40000 ALTER TABLE `my_stores_store_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'USER'),(3,'STOREOWNER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `radius` double NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (3,'Rua Teste','Fortaleza',-3.7241736,-38.5042015,'Habibs Praia de Iracema',0,'Ceará'),(4,'Rua Teste','Fortaleza',-3.7244947,-38.5028738,'Café Vida',0,'Ceará'),(5,'Rua Teste','Fortaleza',-3.7261007,-38.5022274,'Koni Street Japanese',0,'Ceará'),(6,'Rua Teste','Fortaleza',-3.7255493,-38.499395,'Acarajé Cia',0,'Ceará'),(7,'Rua Teste','Fortaleza',-3.7255493,-38.499395,'Barraca da Boa',0,'Ceará'),(8,'Rua Teste','Fortaleza',-3.7267484,-38.4984938,'Didi Rei dos Mares',0,'Ceará'),(9,'Rua Teste','Fortaleza',-3.7267484,-38.4995881,'Sabor de Mar',0,'Ceará'),(10,'Rua Teste','Fortaleza',-3.7283864,-38.4974209,'Bistrô Garrafeira',0,'Ceará'),(11,'Rua Teste','Fortaleza',-3.7283864,-38.4974209,'Empório Delitalia',0,'Ceará'),(12,'Rua Teste','Fortaleza',0,0,'Loja da Maria editada',0,'Ceará'),(13,'teste2','Teresina',0,0,'Moda Maria',0,'Piauí'),(14,'Avenida Jatiúca','Maceió',0,0,'Foca Bear',0,'Alagoas'),(15,'Campus do Pici','Fortaleza',-3.7465646,-38.5780218,'Great',1,'Ceará'),(16,'Campus do Pici','Fortaleza',-3.7464669,-38.5779165,'Cantina da Química',1,'Ceará'),(17,'Campus do Pici','Fortaleza',-3.7457293,-38.5730363,'Lanchonete Alfa e Ômega',1,'Ceará'),(18,'Campus do Pici','Fortaleza',-3.7420005,-38.5759716,'Cantina da Engenharia de Pesca',1,'Ceará'),(19,'Campus do Pici','Fortaleza',-3.7392888,-38.5713145,'Dudes+Lanches',1,'Ceará'),(20,'Campus do Pici','Fortaleza',-3.7447981,-38.5749708,'Restaurante Universitário  da UFC',1,'Ceará'),(21,'Rua Teste de novo','Teresina',0,0,'Teresina Moda Mais',0,'Piauí');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `completename` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('ana','$2a$10$xEyUW9wNFDWcjdvo4orYgeWYWIEUTR0KweCM7jXbfytEDwsuMXyTK',1,15,'ana@gmail.com',0,0,'Ana Maria Braga','Ana Maria Braga'),('armando','$2a$10$G21Awy3udH2acuuY3IqTPeJRT5QnuUGCVMydgLLZbjLMjFVJa9O12',1,1,'armando@ufpi.edu.br',0,0,'Armando Soares Sousa','Armando Soares Sousa'),('brenda','$2a$10$XGgI46HrmD8X4Du.vi2oKeh/8ZFDdrLuK8g9gBjReyfight3RoIBK',1,21,'brenda@gmail.com',0,0,NULL,NULL),('capitu','$2a$10$oEaZHj67GPXkR/khMmdgjeMITD7L8dz80IDPtjzKK6kwT2rt2cbGW',1,16,'capitu@gmail.com',0,0,'Maria Capitulina de Amaral','Maria Capitulina de Amaral'),('carlos','$2a$10$ZxkTB./ZdO92fVoGRkwY4OUEk6uxUTnfB/iRSg1iqzBemMARGVpnu',1,8,'carlos@gmail.com',0,0,'Carlos Nascimento Sampaio','Carlos Nascimento Sampaio'),('david','$2a$10$3gLNDikivHcF0.HcffucOusIgURSRzeTjAkKaUXGHFjIjOItXF1uO',1,12,'dcf@gm.com',0,0,'David Coper Field','David Coper Field'),('foca','$2a$10$/.Yfv.iLdBcFg5EiecWgY.gsedEHyM/pyB.KwDkyc8KYNgtucxGcS',1,17,'foca@gmail.cofm',0,0,'Foca da Silva Maramelo','Foca da Silva Maramelo'),('Francisco','$2a$10$vKnTJGs54wwOlDXB6QsAxOO3RxK.OSSq8uJLZKjxJ7kd7lg.jhVG2',1,3,'francisco@uol.com.br',0,0,'Francisco da Silva Sauro','Francisco da Silva Sauro'),('joao','$2a$10$hRJ0e4Ix3O4GKvryi3h3.urzxFwvOvuxlsbLKKJKPCrx8VJfqeNSO',1,4,'joao@gmail.com',0,0,NULL,NULL),('jose','$2a$10$eDKIyxHjiQfQqrjKO9MWnu8spMCmanXWneP72ypm0ShnmxasLfNgO',1,14,'jn@gma.com',0,0,'Jose do Nascimento','Jose do Nascimento'),('josesilva','$2a$10$4rvNGVW4ExPT/NEO//U2BeI4UWRKnsUwN0E5MeQR5qXPBCnl54Y3a',1,18,'jose@gmail.com',0,0,'Jose da Silva','Jose da Silva'),('jota','$2a$10$JNwqetWQWIINWs6QWr0bm.Qe/XTIUNeK2pvYVZdiOc18cAZFzBVv2',1,11,'jotaq@gm.com',0,0,'jota quest','jota quest'),('lucia','$2a$10$rXgktQhChzxnxelJWGQBEeyczBKGZxGvt7n3ITFuTZQCFDW2U2LVS',1,10,'lbm@gmail.com',0,0,'Lucia Braga de Melo','Lucia Braga de Melo'),('maria','$2a$10$cfYZ4rJn1cl4P2XlYkgZxe7aUa1GHj4ku6Vexi.bxdnxxfldx/7LS',1,2,'maria@gmail.com',-3.7447981,-38.5749708,'Maria Joaquina de Amaral Pereira Goes','Maria Joaquina de Amaral Pereira Goes'),('tes','$2a$10$TdQU8ETpFfYdEUDKxx/TmOkbSwPXGwVP2kon1e74b8ieqCy3qjbDW',1,13,'tersaliaamaral@gmail.com',0,0,'Tersalia do Amaral','Tersalia do Amaral'),('teste','$2a$10$WaOoIQWkbMkfAGHy0KRHdu/KGwcGKLzf0Hg5gWmw0bNimFIUf.R.e',1,22,'teste@gmail.com',0,0,'Teste da Silva','Teste da Silva'),('teste2','$2a$10$EzqxvWsCzU6ycTx5E068RuoS877vpDSBRENG0/E/I9e6QE4RfuoFa',1,23,'teste2@gmail.com',0,0,'Novo Teste para o Banco dbsysweb','Novo Teste para o Banco dbsysweb'),('teste3','$2a$10$wBnidZd54z6T5gxo3SaPkud845kAZjZr6mTCd8GxnKb7yj9e4Rrji',1,24,'teste3@gmail.com',0,0,'Teste3 da Silva','Teste3 da Silva'),('tica','$2a$10$1A7DQ.MoAnGmt9wNhb/o7.BWdMPVlpiGw6Y4/kPPfNDo1F8IjCi26',1,20,'tica@gmail.com',0,0,'Tica da Silva','Tica da Silva'),('vera','$2a$10$U3BspMHOLefjDFzGmyIYo.Woti72slfkPxEsm57V/HxmHDfTbGpsi',1,9,'vera@gmail.com',0,0,'vera','vera');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_id_friends_list`
--

DROP TABLE IF EXISTS `users_id_friends_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_id_friends_list` (
  `users_id` bigint(20) NOT NULL,
  `id_friends_list_id` bigint(20) NOT NULL,
  KEY `FKp11f0yltpucd9ixa4bu6fs5cc` (`id_friends_list_id`),
  KEY `FK2aeyr0g8968dlig9qtkrqwvcl` (`users_id`),
  CONSTRAINT `FK2aeyr0g8968dlig9qtkrqwvcl` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKp11f0yltpucd9ixa4bu6fs5cc` FOREIGN KEY (`id_friends_list_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_id_friends_list`
--

LOCK TABLES `users_id_friends_list` WRITE;
/*!40000 ALTER TABLE `users_id_friends_list` DISABLE KEYS */;
INSERT INTO `users_id_friends_list` VALUES (14,1),(16,1),(16,20),(20,16),(20,2),(22,1),(3,1),(3,2),(9,1),(9,2),(2,1),(2,20),(2,3),(2,9),(2,23),(23,1),(23,2),(1,2),(1,3),(1,16),(1,14),(1,9),(1,8),(1,22),(1,23),(1,17),(8,1),(8,17),(17,1),(17,8);
/*!40000 ALTER TABLE `users_id_friends_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `users_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  KEY `FK15d410tj6juko0sq9k4km60xq` (`roles_id`),
  KEY `FKml90kef4w2jy7oxyqv742tsfc` (`users_id`),
  CONSTRAINT `FK15d410tj6juko0sq9k4km60xq` FOREIGN KEY (`roles_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKml90kef4w2jy7oxyqv742tsfc` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(1,2),(1,3),(2,2),(2,3),(3,2),(4,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(20,2),(21,2),(22,2),(23,2),(24,2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-09 18:12:40
