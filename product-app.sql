CREATE DATABASE  IF NOT EXISTS `product-app` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `product-app`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 192.168.2.71    Database: product-app
-- ------------------------------------------------------
-- Server version	5.6.40

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `categorypath` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'clothing','category/clothing',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('0646055060a77c0fe87dcbcca5649db33f27bc5d868b193b625f929bb9e6368fcd8c373b267b8e46',1,2,NULL,'[]',0,'2018-09-05 10:41:06','2018-09-05 10:41:06','2019-09-05 10:41:06'),('08ddd4bfdec65d3667fbb0c70d48a094c3538bd710e92adf08d49da1bdf86f210b47d6122a3f4538',1,2,NULL,'[]',0,'2018-09-06 18:53:36','2018-09-06 18:53:36','2019-09-06 18:53:36'),('0ad5643b70d260b60928d462a4d333618a875e946efd07abee4e9a630ae5c723b24d451a64b3d942',1,2,NULL,'[]',0,'2018-09-06 18:56:19','2018-09-06 18:56:19','2019-09-06 18:56:19'),('10b75cc30fe8013a7266e26dd76492f9fc9456111db41dd9abdf706afd7feda121d6ed8e33923fca',1,2,NULL,'[]',0,'2018-09-05 10:11:07','2018-09-05 10:11:07','2019-09-05 10:11:07'),('29db77d20b8769984f4f7f6884e840c3d903f498ff6153c9a8b01fb82ca2503956e3f494e3e1ef2c',1,2,NULL,'[]',0,'2018-09-05 10:12:03','2018-09-05 10:12:03','2019-09-05 10:12:03'),('31620b154ab7021c659247bcaaaa65e3903050b5757fe4c7bae0610630f437bce264b02b68fad4df',1,2,NULL,'[]',0,'2018-09-05 09:46:32','2018-09-05 09:46:32','2019-09-05 09:46:32'),('319dbe93ab14820f0a5e820a67d2c82d98f3a73155e19219dc22dc69dc206a9a5e32ad92bc59df0f',1,2,NULL,'[]',0,'2018-09-05 09:43:53','2018-09-05 09:43:53','2019-09-05 09:43:53'),('460946d4523853c96ac4d811a9b3d7b2db6f93cf1a45616cbca726a1de8502ed358313e5cba5d4c9',1,2,NULL,'[]',0,'2018-09-05 09:47:31','2018-09-05 09:47:31','2019-09-05 09:47:31'),('494c6fd42635104277123254bd6bb6d60229067c75e3805f201c62c03f76959776bbed58950dbd6b',1,2,NULL,'[]',0,'2018-09-05 11:04:32','2018-09-05 11:04:32','2019-09-05 11:04:32'),('50147fa539f9d7ee31e2db05b01bee2f41b9724568d2fd0edc565caf69f7a51d90d1de4bf2ff15c8',1,2,NULL,'[]',0,'2018-09-05 09:47:48','2018-09-05 09:47:48','2019-09-05 09:47:48'),('6a1939da359d08a66120dde02ab4aed6f30b2a6e389d5f5d1db745e378fa605922bdaa73ba2fe510',1,2,NULL,'[]',0,'2018-09-05 09:47:43','2018-09-05 09:47:43','2019-09-05 09:47:43'),('6ff96a2039d08c0c5fd1eb396ecf0e379da71cd94002b6d5376d9fe5a219e0a90fc65e66e7ee865f',1,2,NULL,'[]',0,'2018-09-05 10:11:14','2018-09-05 10:11:14','2019-09-05 10:11:14'),('96c88d7d9fe29c6ad3eda163c25111d7948b3bc04b4af81044c5e25fc2c3e7406bce41874d802e71',1,2,NULL,'[]',0,'2018-09-05 10:55:22','2018-09-05 10:55:22','2019-09-05 10:55:22'),('97728ec2aff198c86716bfe9f16b6336aded1ba2e9538d3c8d88602f7c26adefef2828e432e10888',1,2,NULL,'[]',0,'2018-09-05 09:49:15','2018-09-05 09:49:15','2019-09-05 09:49:15'),('9dc22eb862fc6e6498b3a410763b467b23d299e0104f28f7c585f4d530ee8cedb110ad8b11793d52',1,2,NULL,'[]',0,'2018-09-05 09:43:34','2018-09-05 09:43:34','2019-09-05 09:43:34'),('a0d69f1b2a908d435a366c6744369b92c4b15d2a033767692b7cc754ca0378939e177e2c7eb019cd',1,2,NULL,'[]',0,'2018-09-06 18:05:49','2018-09-06 18:05:49','2019-09-06 18:05:49'),('a73755935ce8757cb970d93039b6c685c3b27a2972630ee349f6b17bfb1bd29952663d8be72ab5bd',1,2,NULL,'[]',0,'2018-09-07 05:37:24','2018-09-07 05:37:24','2019-09-07 05:37:24'),('a7add424342d042cd63c8f018495c9b95d6d06be28f105a03de89b4fb1533e466e2617ff3e16cdad',1,2,NULL,'[]',0,'2018-09-05 09:47:52','2018-09-05 09:47:52','2019-09-05 09:47:52'),('abc30b32672ffc3e26d61b9c1834e2cd11b7390afb7d2ff7ba601a7ca772d2a41c7d7467a505fb37',1,2,NULL,'[]',0,'2018-09-05 11:14:54','2018-09-05 11:14:54','2019-09-05 11:14:54'),('b1fec5f46ea8ae086a2bf3d3d9863fc5f9ae1605dcf22a788edb2607972f3c3cbde76531767d03cc',1,2,NULL,'[]',0,'2018-09-06 18:52:56','2018-09-06 18:52:56','2019-09-06 18:52:56'),('c9d49286dce28f42a75d45080c7d26e248b40deb738bb2cef6a6ccd4c6a1c22ec36692d0c5d69ad9',1,2,NULL,'[]',0,'2018-09-06 15:19:44','2018-09-06 15:19:44','2019-09-06 15:19:44'),('d08c545786574f292f567e03b7dff70aadadb854d2fe06b87b914ce05ca2224b963fbd4878f9feef',1,2,NULL,'[]',0,'2018-09-05 10:15:01','2018-09-05 10:15:01','2019-09-05 10:15:01'),('ebe54531fa619bd57612f4c3de9990357c32528c1178f872fe9f32f9b323ac426e8334a80c8f7f3a',1,2,NULL,'[]',0,'2018-09-06 17:08:43','2018-09-06 17:08:43','2019-09-06 17:08:43'),('f060c7b3e62a6b98cd0014ff766ea5caacfd4c3fc0f4ef2b435a9e4d6ff39a3db61e37a873035cfa',1,2,NULL,'[]',0,'2018-09-05 11:24:11','2018-09-05 11:24:11','2019-09-05 11:24:11'),('ffe1f95bbdd4c921711f607d07f6a960d843f51062f97b8ca1fa312bb6f268e8d29e9996d393c66c',1,2,NULL,'[]',0,'2018-09-05 09:40:52','2018-09-05 09:40:52','2019-09-05 09:40:52');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','uici4XgbbRgq17XPrnRLYdRxupS63Eae64fwLoap','http://localhost',1,0,0,'2018-09-05 09:05:36','2018-09-05 09:05:36'),(2,NULL,'Laravel Password Grant Client','6oXfASbuxoSStwSlh9XYtc0g9EYTrttKYyNIOz3y','http://localhost',0,1,0,'2018-09-05 09:05:36','2018-09-05 09:05:36');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2018-09-05 09:05:36','2018-09-05 09:05:36');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` VALUES ('0e2877cd8161e7c6da685c69784dead8952a8e46a1e2aa1ea67255dcc5d995e4d9a6d31bdbaa6018','b1fec5f46ea8ae086a2bf3d3d9863fc5f9ae1605dcf22a788edb2607972f3c3cbde76531767d03cc',0,'2019-09-06 18:52:56'),('22c9512f841c2eb3f7d34ef793346bea3fd87b51a7c28777ce6887638a18e8e0140fd61b0cec347e','10b75cc30fe8013a7266e26dd76492f9fc9456111db41dd9abdf706afd7feda121d6ed8e33923fca',0,'2019-09-05 10:11:07'),('2ae16dd214580ced72beaf6e372e5b63931508ad80c112937c1a9dd84d2640fb2e62fdc34f4986d4','0646055060a77c0fe87dcbcca5649db33f27bc5d868b193b625f929bb9e6368fcd8c373b267b8e46',0,'2019-09-05 10:41:06'),('361eaa439072dd801aaf75aeb9863ec9ce31c34826ebc97c5413e93c90995f09813502151c4d1c72','97728ec2aff198c86716bfe9f16b6336aded1ba2e9538d3c8d88602f7c26adefef2828e432e10888',0,'2019-09-05 09:49:15'),('3e08cb8c57a2d8f44bc316dc4c57079b69256f2b48fc98fbb86e4d9a2a0fc293f5e32d1e539ee51a','29db77d20b8769984f4f7f6884e840c3d903f498ff6153c9a8b01fb82ca2503956e3f494e3e1ef2c',0,'2019-09-05 10:12:03'),('4d28daef4936c6bc4a1b5d3c3545ee24f663c76b3cccf0a95e6dcbfe25b346e263d6a5bec8e5696d','6a1939da359d08a66120dde02ab4aed6f30b2a6e389d5f5d1db745e378fa605922bdaa73ba2fe510',0,'2019-09-05 09:47:43'),('5388230dd13e3dc9b9ea6c3189fded7c821a5a307c134596f3c142a4cf5f4006ab8f6c5461858d0f','6ff96a2039d08c0c5fd1eb396ecf0e379da71cd94002b6d5376d9fe5a219e0a90fc65e66e7ee865f',0,'2019-09-05 10:11:14'),('5a97221093cd1ee3afdb369d71585fb0a7378b0dd259572dcd9dbd6de2879d96e61e244e158ff229','ffe1f95bbdd4c921711f607d07f6a960d843f51062f97b8ca1fa312bb6f268e8d29e9996d393c66c',0,'2019-09-05 09:40:52'),('605c696a3603b5b51cb4efb8a74efd763c5e59dd92340787fd87e8376f86e50f52354ebda0c3ad29','abc30b32672ffc3e26d61b9c1834e2cd11b7390afb7d2ff7ba601a7ca772d2a41c7d7467a505fb37',0,'2019-09-05 11:14:54'),('6223eb3665adb4608607ffa4e92a0a2061a653a14f269b820aaf687ae2f180bed32020aa15d82b59','494c6fd42635104277123254bd6bb6d60229067c75e3805f201c62c03f76959776bbed58950dbd6b',0,'2019-09-05 11:04:32'),('6f3a64d1bf202d878f778429d5db7bf85afb5d17ad73dcd0939749af7582c448408fcf4c0b56ef6b','0ad5643b70d260b60928d462a4d333618a875e946efd07abee4e9a630ae5c723b24d451a64b3d942',0,'2019-09-06 18:56:19'),('7847971d370182ff978165f65c8f442cc13289cbac94d6d0da7f1720612cea03e9c8131601d6b668','9dc22eb862fc6e6498b3a410763b467b23d299e0104f28f7c585f4d530ee8cedb110ad8b11793d52',0,'2019-09-05 09:43:34'),('8f8bcd0e7d98357d97382df39ac9b5a4ade2bffe9bc886e3b80cb612a85b570ab775870d4e149e17','c9d49286dce28f42a75d45080c7d26e248b40deb738bb2cef6a6ccd4c6a1c22ec36692d0c5d69ad9',0,'2019-09-06 15:19:44'),('9949663a5c95acc4ec340e008dda43c1493a7e2e732120fda0e10f718a480775b9c286c80d8ea82c','31620b154ab7021c659247bcaaaa65e3903050b5757fe4c7bae0610630f437bce264b02b68fad4df',0,'2019-09-05 09:46:32'),('a696a37b6416c12a1d5c0485a145ea3a2b97bf573ebae29454e1741b12717e8300ff58bb8c9a65ed','d08c545786574f292f567e03b7dff70aadadb854d2fe06b87b914ce05ca2224b963fbd4878f9feef',0,'2019-09-05 10:15:01'),('a86f77043aa2fa753972b8c3b09c3457ecc0209fd212b17d40f8cedc50251927e4610c3cdc7efe99','f060c7b3e62a6b98cd0014ff766ea5caacfd4c3fc0f4ef2b435a9e4d6ff39a3db61e37a873035cfa',0,'2019-09-05 11:24:11'),('b1bdc571989a6b1f1466e1a258d5c957a9493a895ab17f7479e595eb7cbcd7f38cccbf2a24ac5aa9','460946d4523853c96ac4d811a9b3d7b2db6f93cf1a45616cbca726a1de8502ed358313e5cba5d4c9',0,'2019-09-05 09:47:31'),('b74b81e15d4f31bf061f2cec18f529871c88e9852b08525cb7c3a6a4dedcfbb9e81abf8b9704fafb','319dbe93ab14820f0a5e820a67d2c82d98f3a73155e19219dc22dc69dc206a9a5e32ad92bc59df0f',0,'2019-09-05 09:43:53'),('b9527395279296b68e868ccb967f08278df579480962fdd087d1d9e7e7b6423986e3d23ae6fdd891','a7add424342d042cd63c8f018495c9b95d6d06be28f105a03de89b4fb1533e466e2617ff3e16cdad',0,'2019-09-05 09:47:52'),('c9e0364c279841618dc9a7169584e2bc3f807b1178da67ec4093e3b589abb586d253368409941f4c','50147fa539f9d7ee31e2db05b01bee2f41b9724568d2fd0edc565caf69f7a51d90d1de4bf2ff15c8',0,'2019-09-05 09:47:48'),('cd3fea7513f26f489f12068edef20b8ff42a591b61f3daec97d9a8802a0451252f82fb093938c4ed','08ddd4bfdec65d3667fbb0c70d48a094c3538bd710e92adf08d49da1bdf86f210b47d6122a3f4538',0,'2019-09-06 18:53:36'),('d489957d3002bef548d5ab9ea36d4707aeb8df9b410388419c8bd524b7f29e4dcc9bbaf4b71cafd7','ebe54531fa619bd57612f4c3de9990357c32528c1178f872fe9f32f9b323ac426e8334a80c8f7f3a',0,'2019-09-06 17:08:43'),('d9cf5bb9f1941a6456a47458bd5ec7fa0ca4dedb3e596c800148b57a2f930a39fbcc692366271979','a73755935ce8757cb970d93039b6c685c3b27a2972630ee349f6b17bfb1bd29952663d8be72ab5bd',0,'2019-09-07 05:37:24'),('e6011e57e69ea9859d0117dd59d4a5f2510710895c5b88f2ee15ffd4e274f0ab063646b966767830','96c88d7d9fe29c6ad3eda163c25111d7948b3bc04b4af81044c5e25fc2c3e7406bce41874d802e71',0,'2019-09-05 10:55:22'),('f41fc4e88ec033fcb285a473a8c6df4118d899896927112225a96ff69be8038951c0f06d72421a5d','a0d69f1b2a908d435a366c6744369b92c4b15d2a033767692b7cc754ca0378939e177e2c7eb019cd',0,'2019-09-06 18:05:49');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Michael Roewin Tan','test product',10.00,5,'2018-09-06 13:57:29','2018-09-07 06:01:39');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin','$2y$10$7Ef/qaE8bzjYNcrD3hXg6ePkklRQIGEpagJ3wxHouc2lFpCG2VEvu',NULL,'2018-09-05 09:40:38','2018-09-05 09:40:38');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-07 14:02:16
