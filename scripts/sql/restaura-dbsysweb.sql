-- MySQL dump 10.13  Distrib 5.7.19, for macos10.12 (x86_64)
--
-- Host: localhost    Database: promocity
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
-- Table structure for table `SPRING_SESSION`
--

DROP TABLE IF EXISTS `SPRING_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SPRING_SESSION` (
  `PRIMARY_ID` int(10) NOT NULL AUTO_INCREMENT,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL DEFAULT '6000',
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPRING_SESSION`
--

LOCK TABLES `SPRING_SESSION` WRITE;
/*!40000 ALTER TABLE `SPRING_SESSION` DISABLE KEYS */;
INSERT INTO `SPRING_SESSION` VALUES (2,'dfec736a-e81c-47dc-800c-901a95ba9949',1546576849703,1546576994089,1800,6000,'armando');
/*!40000 ALTER TABLE `SPRING_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPRING_SESSION_ATTRIBUTES`
--

DROP TABLE IF EXISTS `SPRING_SESSION_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SPRING_SESSION_ATTRIBUTES` (
  `SESSION_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_ID`) REFERENCES `SPRING_SESSION` (`SESSION_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPRING_SESSION_ATTRIBUTES`
--

LOCK TABLES `SPRING_SESSION_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `SPRING_SESSION_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `SPRING_SESSION_ATTRIBUTES` VALUES ('dfec736a-e81c-47dc-800c-901a95ba9949','SPRING_SECURITY_CONTEXT','¨\Ì\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0§\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0§\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationToken”™(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList¸%1µ\Ïé\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0cq\0~\0xpsr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0§\0L\0rolet\0Ljava/lang/String;xpt\0ADMINsq\0~\0t\0\nSTOREOWNERsq\0~\0t\0USERxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0§\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$ad9a23a9-8eba-42b1-b270-bb749d9dd77bpsr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0§\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSetÄí—èõÄU\0\0xq\0~\0\nsr\0java.util.TreeSet›òPìï\Ìá[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0§\0\0xpw\0\0\0q\0~\0q\0~\0q\0~\0xpt\0armando'),('dfec736a-e81c-47dc-800c-901a95ba9949','SPRING_SECURITY_SAVED_REQUEST','¨\Ì\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequestX˛†)&uèn\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0êt\0\0sr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\09org.springframework.security.web.savedrequest.SavedCookie@+Çü¿¥f\0I\0maxAgeZ\0secureI\0versionL\0commentq\0~\0L\0domainq\0~\0L\0nameq\0~\0L\0pathq\0~\0L\0valueq\0~\0xpˇˇˇˇ\0\0\0\0\0ppt\0\nJSESSIONIDpt\0 EEA2C12849F6B9F3AEC426FF2112B3A0xsr\0java.util.TreeMap¡ˆ>-%j\Ê\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\Â\Œ\0\0xpw\0\0\0	t\0acceptsq\0~\0\0\0\0w\0\0\0t\0?text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0\rgzip, deflatext\0accept-languagesq\0~\0\0\0\0w\0\0\0t\0pt-brxt\0\nconnectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0cookiesq\0~\0\0\0\0w\0\0\0t\0+JSESSIONID=EEA2C12849F6B9F3AEC426FF2112B3A0xt\0dntsq\0~\0\0\0\0w\0\0\0t\01xt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0upgrade-insecure-requestssq\0~\0\0\0\0w\0\0\0t\01xt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0wMozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.2 Safari/605.1.15xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~¯`ú0˘\Ï\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xpˇˇˇˇt\0BRt\0\0t\0ptq\0~\00q\0~\00xxt\0GETsq\0~\0pw\0\0\0\0xppt\0/t\0http://localhost:8080/t\0httpt\0	localhostt\0/');
/*!40000 ALTER TABLE `SPRING_SESSION_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  KEY `id` (`id`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES ('armando','USER',1),('maria','USER',2),('francisco','USER',3),('carlos','USER',7),('vera','USER',8),('lucia','USER',9),('jota','USER',10),('david','USER',11),('tes','USER',12),('jose','USER',13),('ana','USER',14),('armando','ADMIN',15),('armando','STOREOWNER',16),('maria','STOREOWNER',17),('capitu','USER',18),('foca','USER',19),('foca','STOREOWNER',20),('josesilva','USER',21),('tica','USER',22),('teste','USER',23);
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `my_stores_store_list` VALUES (1,12),(1,13),(2,14);
/*!40000 ALTER TABLE `my_stores_store_list` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (3,'Rua Teste','Fortaleza',-3.7241736,-38.5042015,'Habibs Praia de Iracema',0,'Cear√°'),(4,'Rua Teste','Fortaleza',-3.7244947,-38.5028738,'Caf√© Vida',0,'Cear√°'),(5,'Rua Teste','Fortaleza',-3.7261007,-38.5022274,'Koni Street Japanese',0,'Cear√°'),(6,'Rua Teste','Fortaleza',-3.7255493,-38.499395,'Acaraj√© Cia',0,'Cear√°'),(7,'Rua Teste','Fortaleza',-3.7255493,-38.499395,'Barraca da Boa',0,'Cear√°'),(8,'Rua Teste','Fortaleza',-3.7267484,-38.4984938,'Didi Rei dos Mares',0,'Cear√°'),(9,'Rua Teste','Fortaleza',-3.7267484,-38.4995881,'Sabor de Mar',0,'Cear√°'),(10,'Rua Teste','Fortaleza',-3.7283864,-38.4974209,'Bistr√¥ Garrafeira',0,'Cear√°'),(11,'Rua Teste','Fortaleza',-3.7283864,-38.4974209,'Emp√≥rio Delitalia',0,'Cear√°'),(12,'Rua Teste','Fortaleza',0,0,'Loja da Maria editada',0,'Cear√°'),(13,'teste','Teresina',0,0,'Moda Maria',0,'Piau√≠'),(14,'Avenida Jati√∫ca','Macei√≥',0,0,'Foca Bear',0,'Alagoas'),(15,'Campus do Pici','Fortaleza',-3.7465646,-38.5780218,'Great',1,'Cear√°'),(16,'Campus do Pici','Fortaleza',-3.7464669,-38.5779165,'Cantina da Qu√≠mica',1,'Cear√°'),(17,'Campus do Pici','Fortaleza',-3.7457293,-38.5730363,'Lanchonete Alfa e √îmega',1,'Cear√°'),(18,'Campus do Pici','Fortaleza',-3.7420005,-38.5759716,'Cantina da Engenharia de Pesca',1,'Cear√°'),(19,'Campus do Pici','Fortaleza',-3.7392888,-38.5713145,'Dudes+Lanches',1,'Cear√°'),(20,'Campus do Pici','Fortaleza',-3.7447981,-38.5749708,'Restaurante Universit√°rio  da UFC',1,'Cear√°');
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
  PRIMARY KEY (`username`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('ana','$2a$10$xEyUW9wNFDWcjdvo4orYgeWYWIEUTR0KweCM7jXbfytEDwsuMXyTK',1,15,'ana@gmail.com',0,0,'Ana Maria Braga'),('armando','$2a$10$G21Awy3udH2acuuY3IqTPeJRT5QnuUGCVMydgLLZbjLMjFVJa9O12',1,1,'armando@ufpi.edu.br',0,0,'Armando Soares Sousa'),('brenda','$2a$10$XGgI46HrmD8X4Du.vi2oKeh/8ZFDdrLuK8g9gBjReyfight3RoIBK',1,21,'brenda@gmail.com',0,0,NULL),('capitu','$2a$10$oEaZHj67GPXkR/khMmdgjeMITD7L8dz80IDPtjzKK6kwT2rt2cbGW',1,16,'capitu@gmail.com',0,0,'Maria Capitulina de Amaral'),('carlos','$2a$10$ZxkTB./ZdO92fVoGRkwY4OUEk6uxUTnfB/iRSg1iqzBemMARGVpnu',1,8,'carlos@gmail.com',0,0,'Carlos Nascimento Sampaio'),('david','$2a$10$3gLNDikivHcF0.HcffucOusIgURSRzeTjAkKaUXGHFjIjOItXF1uO',1,12,'dcf@gm.com',0,0,'David Coper Field'),('foca','$2a$10$/.Yfv.iLdBcFg5EiecWgY.gsedEHyM/pyB.KwDkyc8KYNgtucxGcS',1,17,'foca@gmail.cofm',0,0,'Foca da Silva Maramelo'),('Francisco','$2a$10$vKnTJGs54wwOlDXB6QsAxOO3RxK.OSSq8uJLZKjxJ7kd7lg.jhVG2',1,3,'francisco@uol.com.br',0,0,'Francisco da Silva Sauro'),('joao','$2a$10$hRJ0e4Ix3O4GKvryi3h3.urzxFwvOvuxlsbLKKJKPCrx8VJfqeNSO',1,4,'joao@gmail.com',0,0,NULL),('jose','$2a$10$eDKIyxHjiQfQqrjKO9MWnu8spMCmanXWneP72ypm0ShnmxasLfNgO',1,14,'jn@gma.com',0,0,'Jose do Nascimento'),('josesilva','$2a$10$4rvNGVW4ExPT/NEO//U2BeI4UWRKnsUwN0E5MeQR5qXPBCnl54Y3a',1,18,'jose@gmail.com',0,0,'Jose da Silva'),('jota','$2a$10$JNwqetWQWIINWs6QWr0bm.Qe/XTIUNeK2pvYVZdiOc18cAZFzBVv2',1,11,'jotaq@gm.com',0,0,'jota quest'),('lucia','$2a$10$rXgktQhChzxnxelJWGQBEeyczBKGZxGvt7n3ITFuTZQCFDW2U2LVS',1,10,'lbm@gmail.com',0,0,'Lucia Braga de Melo'),('maria','$2a$10$cfYZ4rJn1cl4P2XlYkgZxe7aUa1GHj4ku6Vexi.bxdnxxfldx/7LS',1,2,'maria@gmail.com',-3.7447981,-38.5749708,'Maria Joaquina de Amaral Pereira Goes'),('tes','$2a$10$TdQU8ETpFfYdEUDKxx/TmOkbSwPXGwVP2kon1e74b8ieqCy3qjbDW',1,13,'tersaliaamaral@gmail.com',0,0,'Tersalia do Amaral'),('teste','$2a$10$WaOoIQWkbMkfAGHy0KRHdu/KGwcGKLzf0Hg5gWmw0bNimFIUf.R.e',1,22,'teste@gmail.com',0,0,'Teste da Silva'),('tica','$2a$10$1A7DQ.MoAnGmt9wNhb/o7.BWdMPVlpiGw6Y4/kPPfNDo1F8IjCi26',1,20,'tica@gmail.com',0,0,'Tica da Silva'),('vera','$2a$10$U3BspMHOLefjDFzGmyIYo.Woti72slfkPxEsm57V/HxmHDfTbGpsi',1,9,'vera@gmail.com',0,0,'vera');
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
INSERT INTO `users_id_friends_list` VALUES (3,1),(14,1),(9,1),(8,1),(16,1),(16,20),(2,1),(2,20),(20,16),(20,2),(22,1),(1,2),(1,3),(1,16),(1,14),(1,9),(1,8),(1,22);
/*!40000 ALTER TABLE `users_id_friends_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-26 12:00:41
