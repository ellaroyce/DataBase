-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: TweetFromTheAir
-- ------------------------------------------------------
-- Server version	5.7.12

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
-- Table structure for table `Airline`
--

DROP TABLE IF EXISTS `Airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Airline` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airline`
--

LOCK TABLES `Airline` WRITE;
/*!40000 ALTER TABLE `Airline` DISABLE KEYS */;
INSERT INTO `Airline` VALUES (1,'Delta'),(2,'Souhwest'),(3,'US Airways'),(4,'United'),(5,'Virgin Americs');
/*!40000 ALTER TABLE `Airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airline_has_ReasonReal`
--

DROP TABLE IF EXISTS `Airline_has_ReasonReal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Airline_has_ReasonReal` (
  `Airline_id` int(11) NOT NULL,
  `ReasonReal_id` int(11) NOT NULL,
  KEY `fk_Airline_has_ReasonReal_ReasonReal1_idx` (`ReasonReal_id`),
  KEY `fk_Airline_has_ReasonReal_Airline1_idx` (`Airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airline_has_ReasonReal`
--

LOCK TABLES `Airline_has_ReasonReal` WRITE;
/*!40000 ALTER TABLE `Airline_has_ReasonReal` DISABLE KEYS */;
INSERT INTO `Airline_has_ReasonReal` VALUES (39,39),(53,53),(49,49),(22,22),(33,33),(38,38),(10,10),(4,4),(44,44),(3,3),(40,40),(25,25),(48,48),(42,42),(32,32),(50,50),(20,20),(1,1),(52,52),(9,9),(1,1),(2,2),(31,31),(15,15),(10,10),(48,48),(36,36),(54,54),(32,32),(50,50),(50,50),(20,20),(39,39),(52,52),(38,38),(15,15),(31,31),(15,15),(25,25),(3,3),(14,14),(28,28),(2,2),(34,34),(31,31),(6,6),(8,8),(25,25),(31,31),(15,15),(7,7),(48,48),(36,36),(35,35),(36,36),(42,42),(9,9),(15,15),(53,53),(9,9),(18,18),(54,54),(38,38),(38,38),(49,49),(18,18),(53,53),(51,51),(44,44),(35,35),(13,13),(18,18),(48,48),(43,43),(26,26),(37,37),(36,36),(43,43),(40,40),(32,32),(41,41),(34,34),(8,8),(45,45),(50,50),(43,43),(12,12),(27,27),(21,21),(52,52),(8,8),(32,32),(30,30),(25,25),(5,5),(26,26),(52,52),(13,13),(8,8),(20,20);
/*!40000 ALTER TABLE `Airline_has_ReasonReal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airport`
--

DROP TABLE IF EXISTS `Airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Airport` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `City_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`City_id`),
  KEY `fk_Airport_City1_idx` (`City_id`),
  CONSTRAINT `fk_Airport_City1` FOREIGN KEY (`City_id`) REFERENCES `City` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airport`
--

LOCK TABLES `Airport` WRITE;
/*!40000 ALTER TABLE `Airport` DISABLE KEYS */;
INSERT INTO `Airport` VALUES (1,'Atlanta, GA',1),(2,'Atlanta, Georgia',2),(3,'Austin, TX',3),(4,'Bhutan',4),(5,'boston',5),(6,'Brooklyn, NY',6),(7,'Chapel Hill, NC',7),(8,'Charlotte, North Carolina',8),(9,'Château d\'If',9),(10,'Chicagoland Area',10),(11,'Cleveland, Ohio',11),(12,'Columbus, OH',12),(13,'CT to Queens ',13),(14,'Dallas, TX',14),(15,'DC / MIA',15),(16,'Deerfield',16),(17,'District of Corruption',17),(18,'Downers Grove',18),(19,'Dublin Raised | Brooklyn Based',19),(20,'Fort Lauderdale',20),(21,'grand rapids, michigan',21),(22,'Houston',22),(23,'Houston, Texas',23),(24,'Huntsville, AL',24),(25,'Kanasa City',25),(26,'Las Vegas',26),(27,'Las Vegas, NV',27),(28,'London, UK',28),(29,'Los Angeles, CA',29),(30,'MiamiHoustonDCHouston',30),(31,'Nashville, TN',31),(32,'New Jersey',32),(33,'New York',33),(34,'North West, UK',34),(35,'Northridge, CA',35),(36,'Northwestern NJ',36),(37,'Nova Scotia',37),(38,'NYC',38),(39,'Ohio',39),(40,'Omagh/Belfast',40),(41,'Phoenix, AZ',41),(42,'Portland, OR',42),(43,'Puerto Rico ',43),(44,'Queens',44),(45,'Raleigh,NC',45),(46,'Silicon Valley',46),(47,'Texas',47),(48,'Toronto',48),(49,'Tucson, AZ and Vancouver, BC',49),(50,'USA',50),(51,'Virginia',51),(52,'Washington, DC',52),(53,'Worthington, Ohio',53),(54,'Yauco, Puerto Rico',54);
/*!40000 ALTER TABLE `Airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airport_has_Airline`
--

DROP TABLE IF EXISTS `Airport_has_Airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Airport_has_Airline` (
  `Airport_id` bigint(14) NOT NULL,
  `Airline_id` bigint(14) NOT NULL,
  KEY `fk_Airport_has_Airline_Airline1_idx` (`Airline_id`),
  KEY `fk_Airport_has_Airline_Airport1_idx` (`Airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airport_has_Airline`
--

LOCK TABLES `Airport_has_Airline` WRITE;
/*!40000 ALTER TABLE `Airport_has_Airline` DISABLE KEYS */;
INSERT INTO `Airport_has_Airline` VALUES (39,5),(53,4),(49,5),(22,3),(33,3),(38,5),(10,3),(4,3),(44,4),(3,4),(40,5),(25,4),(48,2),(42,4),(32,4),(50,1),(20,5),(1,1),(52,4),(9,3),(1,3),(2,1),(31,5),(15,1),(10,5),(48,2),(36,1),(54,1),(32,5),(50,2),(50,2),(20,3),(39,1),(52,3),(38,1),(15,4),(31,1),(15,4),(25,1),(3,2),(14,4),(28,3),(2,3),(34,5),(31,4),(6,2),(8,3),(25,2),(31,1),(15,3),(7,4),(48,3),(36,5),(35,3),(36,2),(42,2),(9,1),(15,2),(53,1),(9,3),(18,5),(54,3),(38,4),(38,3),(49,2),(18,5),(53,3),(51,5),(44,4),(35,5),(13,3),(18,3),(48,2),(43,2),(26,4),(37,1),(36,5),(43,5),(40,3),(32,5),(41,5),(34,2),(8,3),(45,2),(50,5),(43,5),(12,1),(27,3),(21,3),(52,3),(8,3),(32,4),(30,3),(25,1),(5,2),(26,3),(52,1),(13,1),(8,4),(20,3);
/*!40000 ALTER TABLE `Airport_has_Airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airport_has_ReasonReal`
--

DROP TABLE IF EXISTS `Airport_has_ReasonReal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Airport_has_ReasonReal` (
  `Airport_id` int(11) DEFAULT NULL,
  `Airport_City_id` int(11) DEFAULT NULL,
  `ReasonReal_id` int(11) NOT NULL,
  KEY `fk_Airport_has_ReasonReal_ReasonReal1_idx` (`ReasonReal_id`),
  KEY `fk_Airport_has_ReasonReal_Airport1_idx` (`Airport_id`,`Airport_City_id`),
  CONSTRAINT `fk_Airport_has_ReasonReal_Airport1` FOREIGN KEY (`Airport_id`, `Airport_City_id`) REFERENCES `Airport` (`id`, `City_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Airport_has_ReasonReal_ReasonReal1` FOREIGN KEY (`ReasonReal_id`) REFERENCES `ReasonReal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airport_has_ReasonReal`
--

LOCK TABLES `Airport_has_ReasonReal` WRITE;
/*!40000 ALTER TABLE `Airport_has_ReasonReal` DISABLE KEYS */;
INSERT INTO `Airport_has_ReasonReal` VALUES (39,39,2),(53,53,4),(49,49,1),(22,22,3),(33,33,2),(38,38,6),(10,10,6),(4,4,3),(44,44,4),(3,3,6),(40,40,6),(25,25,5),(48,48,3),(42,42,5),(32,32,6),(50,50,2),(20,20,3),(1,1,4),(52,52,3),(9,9,5),(1,1,4),(2,2,6),(31,31,1),(15,15,2),(10,10,4),(48,48,2),(36,36,1),(54,54,1),(32,32,1),(50,50,4),(50,50,3),(20,20,5),(39,39,1),(52,52,4),(38,38,6),(15,15,3),(31,31,6),(15,15,3),(25,25,2),(3,3,4),(14,14,5),(28,28,1),(2,2,6),(34,34,1),(31,31,1),(6,6,3),(8,8,1),(25,25,5),(31,31,3),(15,15,1),(7,7,1),(48,48,3),(36,36,6),(35,35,2),(36,36,6),(42,42,1),(9,9,6),(15,15,3),(53,53,2),(9,9,4),(18,18,3),(54,54,1),(38,38,2),(38,38,2),(49,49,3),(18,18,4),(53,53,1),(51,51,6),(44,44,3),(35,35,2),(13,13,4),(18,18,5),(48,48,5),(43,43,5),(26,26,4),(37,37,4),(36,36,1),(43,43,1),(40,40,5),(32,32,3),(41,41,6),(34,34,2),(8,8,2),(45,45,4),(50,50,2),(43,43,2),(12,12,6),(27,27,5),(21,21,5),(52,52,3),(8,8,5),(32,32,3),(30,30,2),(25,25,3),(5,5,2),(26,26,1),(52,52,6),(13,13,6),(8,8,5),(20,20,5);
/*!40000 ALTER TABLE `Airport_has_ReasonReal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `City`
--

DROP TABLE IF EXISTS `City`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `City` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `City`
--

LOCK TABLES `City` WRITE;
/*!40000 ALTER TABLE `City` DISABLE KEYS */;
INSERT INTO `City` VALUES (1,'Atlanta, GA'),(2,'Atlanta, Georgia'),(3,'Austin, TX'),(4,'Bhutan'),(5,'boston'),(6,'Brooklyn, NY'),(7,'Chapel Hill, NC'),(8,'Charlotte, North Carolina'),(9,'Château d\'If'),(10,'Chicagoland Area'),(11,'Cleveland, Ohio'),(12,'Columbus, OH'),(13,'CT to Queens '),(14,'Dallas, TX'),(15,'DC / MIA'),(16,'Deerfield'),(17,'District of Corruption'),(18,'Downers Grove'),(19,'Dublin Raised | Brooklyn Based'),(20,'Fort Lauderdale'),(21,'grand rapids, michigan'),(22,'Houston'),(23,'Houston, Texas'),(24,'Huntsville, AL'),(25,'Kanasa City'),(26,'Las Vegas'),(27,'Las Vegas, NV'),(28,'London, UK'),(29,'Los Angeles, CA'),(30,'MiamiHoustonDCHouston'),(31,'Nashville, TN'),(32,'New Jersey'),(33,'New York'),(34,'North West, UK'),(35,'Northridge, CA'),(36,'Northwestern NJ'),(37,'Nova Scotia'),(38,'NYC'),(39,'Ohio'),(40,'Omagh/Belfast'),(41,'Phoenix, AZ'),(42,'Portland, OR'),(43,'Puerto Rico '),(44,'Queens'),(45,'Raleigh,NC'),(46,'Silicon Valley'),(47,'Texas'),(48,'Toronto'),(49,'Tucson, AZ and Vancouver, BC'),(50,'USA'),(51,'Virginia'),(52,'Washington, DC'),(53,'Worthington, Ohio'),(54,'Yauco, Puerto Rico');
/*!40000 ALTER TABLE `City` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `retweet` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
INSERT INTO `Comment` VALUES (324151,'JetBlue is REALLY getting on my nerves !!  #nothappy','2015-02-16 23:43:02',0),(324152,'SouthwestAir its cool that my bags take a bit longer, dont give me baggage blue balls-turn the carousel on, tell me it\'s coming, then not.','2015-02-17 00:00:36',0),(324153,'united I like delays less than you because I\'m the one on the plane. Connect me with a voucher','2015-02-17 00:05:27',0),(324154,'united I tried 2 DM it would not go thru... not sure why','2015-02-17 01:32:09',0),(324155,'Wanted to get my bag benefit, but instead get $25 pricing on all three tickets. When adding a card, MP Visa is only option. united','2015-02-17 01:54:53',0),(324156,'united i have items of sentimental value that I\'m heartbroken are missing','2015-02-17 04:33:32',0),(324157,'SouthwestAir We have been stuck in SJU for several hours and no one is answering here. Really tough to LUV SW. No response is bad.','2015-02-17 04:35:00',0),(324158,'USAirways AmericanAir How r u supposed to change flights when u can\'t get thru to reservations? #OneHourOnHold','2015-02-17 05:04:44',0),(324159,'United is officially the worst, most delayed, and least helpful airline I have ever had the misfortune of flying on','2015-02-17 05:26:15',0),(324160,'.USAirways we have no choice but to pay another $50 to go to the airport in the hopes that we will be treated better by a rep.','2015-02-17 06:52:12',0),(324161,'.united call my work and tell them it\'s your fault I\'m 7','2015-02-17 07:12:58',0),(324162,'SouthwestAir why have you guys jacked up the prices AFTER you said prices were going to be lowered? SMH','2015-02-17 07:17:16',0),(324163,'USAirways I have been on hold with your Gold reservations line for OVER 3 HOURS now. Flight 3led. Trying to rebook.','2015-02-17 07:40:44',0),(324164,'USAirways we are on the 2pm flight FLL to PHL and then connection to MAN. However, with the delays we might miss it. Can we go earlier?','2015-02-17 07:50:06',0),(324165,'SouthwestAir Hoping you answer the phone today?','2015-02-17 08:02:21',0),(324166,'United - Ridiculous to fly outdated 757s anywhere much less btwn IAH and SFO. No power ports, no  Wifi, no personal entertainment. TORTURE','2015-02-17 08:05:12',0),(324167,'SouthwestAir the last 4 times I\'ve arrived LASairport our gate has been blocked by a slow to depart plane leading to 30-60 min delays','2015-02-17 08:09:14',0),(324168,'SouthwestAir Guys for real. I\'ve been on hold for 4+ hours including one hangup. Please have someone reach out so I can get my $ back.','2015-02-17 08:14:09',0),(324169,'SouthwestAir tried to rebook online but it says that I have to pay $200 for difference in price. Please help','2015-02-17 08:19:50',0),(324170,'USAirways I’ve had my flight 3led twice now, and after 5 minutes of automated questions, the phone just goes to a busy signal. Help?','2015-02-17 08:26:40',0),(324171,'. USAirways It\'s been 3ed. Your SM response is slow.','2015-02-17 08:27:14',0),(324172,'SouthwestAir Hi-My flight (BNA to LGA) was 3ed this morning--#1814. Looks like other flights out of BNA are taking off. Any chance?','2015-02-17 08:28:37',0),(324173,'USAirways Almost 4 hours and coin now. Understand higher call volume, but this is unacceptable.','2015-02-17 08:28:39',0),(324174,'SouthwestAir I need updates on my flights 464 &amp; 3574. I have been on hold for over 2 hours.','2015-02-17 08:28:45',0),(324175,'SouthwestAir tried online and told I must call b/c of modifications to my reservation. Been on hold for almost 2 hours.','2015-02-17 08:33:08',0),(324176,'SouthwestAir discount for three delays?','2015-02-17 08:33:33',0),(324177,'united You know what the United Club needs? Power. MOAR power. Insufficient outlets for the #RoadWarrior (ORD)','2015-02-17 08:36:09',0),(324178,'SouthwestAir too bad I\'m getting this memo: \"Your reservation contains modifications that prevent you from changing it online.\" #FUSTURATED','2015-02-17 08:39:10',1),(324179,'JetBlue Is today\'s JetBlue Flight 918 (NYC-&gt;BOS) delayed? My app says on time and the website says it\'s not...','2015-02-17 08:39:10',0),(324180,'united didn\'t get her name. She was not in our group. She was sitting behind us. Think it was window seat #40? We only overheard...','2015-02-17 08:40:01',0),(324181,'Yes, I filed a report in Atlanta. My bags are in Charlotte, NC. 24 hours 7r and still can\'t find my luggage ... USAirways','2015-02-17 08:40:03',0),(324182,'USAirways AmericanAir you make Spirit look like the gem of air travel. You haven\'t handle this winter storm very well...','2015-02-17 08:41:42',0),(324183,'.united nothing apparently. I\'ve flown w/ you 4 times in last 3 weeks and 3 of those experiences (incl today) were clusterfucks.','2015-02-17 08:42:37',0),(324184,'USAirways I got up at 2 am for a 5 am flight from bos to Charlotte which I found was 3led once I got to the gate (1)','2015-02-17 08:49:38',0),(324185,'USAirways I did and it\'s been a disaster. You had me sitting on the runway only to bring the plane back to the gate smh','2015-02-17 08:52:25',0),(324186,'USAirways you have the ability to switch my flight to AmericanAir but you cannot tell me where my bags are.','2015-02-17 08:52:49',0),(324187,'USAirways I expect something more than telling me to see an agent to rebook my flight...','2015-02-17 08:53:12',0),(324188,'USAirways your customer service is horrible','2015-02-17 08:53:24',0),(324189,'SouthwestAir Flight 3led, re6 online has not worked, on my second round of hold (3 hrs now). Any other options?','2015-02-17 08:53:59',0),(324190,'USAirways and it still says it\'s on time on your website btw','2015-02-17 08:54:42',0),(324191,'USAirways thank you for blowing my vacation. Couldn\'t get me anywhere today to make my reservation and also lost 2 bags of mine!','2015-02-17 08:55:48',0),(324192,'USAirways No kidding. Oy.','2015-02-17 08:56:33',0),(324193,'USAirways no warm weather hubs means no Mexico for us.  And I can\'t go anywhere else since you lost my bags. I hope you attempt to rectify','2015-02-17 08:56:55',0),(324194,'SouthwestAir I\'ve been on hold with customer service for over an hour. Can you help?!','2015-02-17 08:56:55',0),(324195,'USAirways tried twice today on hold for 30 min each time. i have things to do so can\'t live on hold dealing w/ your customer serv failures','2015-02-17 08:57:53',0),(324196,'USAirways Thanks for the info but have been trying for over 24hrs and no luck. Flight dep. Today. Need 2 change 2 tomorrow or Thursday','2015-02-17 08:58:03',0),(324197,'USAirways I didn\'t even leave the airport and you sent 2 of my bags to Philadelphia!','2015-02-17 08:58:14',0),(324198,'SouthwestAir have you considered adding the \"we\'ll call you back when we have someone free\" feature to your support line?','2015-02-17 08:58:51',0),(324199,'united\'s first-class','2015-02-17 09:00:26',0),(324200,'USAirways This is dating back to Nov. I have been sent back and forth between you and eDreams_en. It\'s a disgrace.','2015-02-17 09:00:47',0),(324201,'united Gold Star for united- change my flight- miss all connections- but can\'t accommodate me until a MUCH 7r arrival time-Not HAPPY!','2015-02-17 09:01:07',0),(324202,'SouthwestAir Trying to get through by phone to confirm that funds from a 3led reservation can still be used in the future. Can u help?','2015-02-17 09:02:02',0),(324203,'united No but u cld explain how such a disorganized and inefficient company w surly and obviously unhappy employees stays in business.','2015-02-17 09:06:09',0),(324204,'united +what took me aback was the response by the flight attendant, who put the responsibility squarely back on passenger\'s shoulders. +','2015-02-17 09:06:26',0),(324205,'USAirways The phone line disconnects. How can I be in the queue to be answered when the phone line simply disconnects when I call?','2015-02-17 09:08:14',0),(324206,'united BTW is it true you have to remind flight staff after checking in even after indicating meal prefer on your reservation? +','2015-02-17 09:08:19',0),(324207,'united + that\'s the gist of what the flight attendant told her.','2015-02-17 09:09:03',0),(324208,'SouthwestAir I\'ve been on hold for an hour &amp; a half trying to change my flight to BNA. Not very happy with customer service right now!!!!!!','2015-02-17 09:09:13',0),(324209,'JetBlue Got flight reschedule to flight form PIT to FLL and our flight had mechanical problems so we were delayed an hour Missed my connect','2015-02-17 09:12:09',0),(324210,'USAirways Flight 2069 from JFK to Charlotte, then 3750 from Charlotte to Birmingham. 2 previous flights to HSV were 3led.','2015-02-17 09:13:11',0),(324211,'SouthwestAir been on hold for over an hour.....not cool, you guys.','2015-02-17 09:13:46',0),(324212,'USAirways Now I am probably going to miss my connection in Charlotte, so I will have to drive home for the funeral.','2015-02-17 09:13:52',0),(324213,'JetBlue should i continue?','2015-02-17 09:14:55',0),(324214,'.united we rebooked. But casleah and I had to split up and take different flights because a pilot ran out of hours? Frustrating.','2015-02-17 09:15:38',0),(324215,'USAirways I can\'t believe that you would refer me to a number no one seems to be getting through. Really? I need help ASAP!','2015-02-17 09:17:08',0),(324216,'united + besides, no small degree of self-interest. We take that route several times a year &amp; would hate to be in that situation.','2015-02-17 09:17:35',0),(324217,'. SouthwestAir condescension must be a quality your co rewards. Your tone reeks of it','2015-02-17 09:18:11',0),(324218,'USAirways when I call it says y\'all are too busy and to call back 7r.  this is terrible customer service.  what will you do about it?','2015-02-17 09:18:26',0),(324219,'USAirways &amp; there are seats together, they just have fees. Seems if I\'m taking a 5am flight the least you can do is wave the $10.','2015-02-17 09:25:08',0),(324220,'SouthwestAir I\'m trying to change a family vacation due to Measles outbreak and haven\'t been able to get anyone on the phone. Any help?','2015-02-17 09:26:32',0),(324221,'SouthwestAir no flights out of #nashville today? Are you kidding me?!?! Why are other airlines flying and you\'re not?! So frustrated!!','2015-02-17 09:28:50',0),(324222,'JetBlue they are rude and unhelpful. They suggested I catch a flight tomorrow I was supposed to be home today at 2 am and work is waiting','2015-02-17 09:30:14',0),(324223,'SouthwestAir 45mins wait on the phone with no option for a callback? Finally had to hang up because my phone was dying. #customerservice','2015-02-17 09:31:17',0),(324224,'JetBlue already spent $300 to stay at hotel last night due to you guys rescheduling my flight. Since my 3ation I\'ve spent almost $500','2015-02-17 09:31:42',0),(324225,'southwestair Thanks. Yes I got through. Biggest frustration is that I\'m no longer able to check in online for my flight after 4 3s.','2015-02-17 09:32:31',0),(324226,'JetBlue and they are telling me I got to get another hotel and food...so spend more money because you guys made me miss my connection','2015-02-17 09:32:34',0),(324227,'united you better hold my flight to Tucson #5237, just landed in Houston after an hour delay for some minor computer problem','2015-02-17 09:35:36',0),(324228,'JetBlue Been dealing with a 3led flight since last night &amp; was booked to a 6:15 flight,wouldve at least liked to see Ella perform lol','2015-02-17 09:47:52',0),(324229,'USAirways it\'s not a consolation because my bags are somewhere else, which is a real impediment to me going on a different vacation','2015-02-17 09:50:33',0),(324230,'USAirways missing my reservations due to a 3led flight. Make it right by giving me first class tomorrow. Make your customers happy.','2015-02-17 09:51:41',0),(324231,'VirginAmerica my group got their 3lation fees waived but I can\'t because my ticket is booked for 2/18? Your reps were no help either','2015-02-17 09:56:23',0),(324232,'SouthwestAir Trying to add my dog on the flight but can\'t get through.','2015-02-17 09:58:38',0),(324233,'USAirways issues are not with people who r nice or storm emails with wrong phone numbers auto rebooked flights to non connecting cities','2015-02-17 09:58:42',0),(324234,'united my mother\'s flight was delayed from phl-ord. We\'re on our way to NRT and the gate refused to upgrade. A platinum.  Blegh','2015-02-17 10:00:17',0),(324235,'USAirways cust serv reps who are unable to change reservations in your system Check in unaware of 3s that I got word on night before','2015-02-17 10:01:38',0),(324236,'VirginAmerica my flight (6000) scheduled for 1pm departure still says on time but no plane at gate. Any update on how long of a delay?','2015-02-17 10:02:26',0),(324237,'united Not fast enough.  No excuse for service between big hubs to have such outdated craft. Southwest has wifi. This is awful.','2015-02-17 10:04:58',0),(324238,'JetBlue as much i have paid in fees. Plus hotel and food because of your changes i could had flown with a more reliable airline #no2jetblue','2015-02-17 10:09:27',0),(324239,'SouthwestAir are you kidding me?  I needed help yesterday. I\'m now landed and waiting for my connection.  Never will I fly southwest again!','2015-02-17 10:11:24',0),(324240,'united Second day &amp; attempt trying to leave IAD &amp; I\'m on another plane delayed for mechanical issues. Over an hour delayed!','2015-02-17 10:13:00',0),(324241,'SouthwestAir worst customer service, Terrible attitudes. I don\'t care how big a storm.  Your employees need an attitude adjustment','2015-02-17 10:13:33',0),(324242,'united 1591 had wi-fi broken on plane. Had same outage on 1618 on Friday. How can Southwest get it right on every plane but United can\'t?','2015-02-17 10:14:38',0),(324243,'USAirways it\'s be nice to take a flight and have some level of consistency / service from the flight attendants. Quality control???','2015-02-17 10:14:41',0),(324244,'united Nearly 48 hours 7r and still no idea where it is. I will never fly United again if I can help it.','2015-02-17 10:14:55',0),(324245,'SouthwestAir BernhardtJH I did eventually get through but that flight 3led.  Decided to drive but gave up holding to process refund','2015-02-17 10:20:01',0),(324246,'USAirways AmericanAir what a joke of a company today reminded me why I never book with you','2015-02-17 10:23:13',0),(324247,'SouthwestAir no had to rebook my flight myself and am about to board in bham.','2015-02-17 10:26:42',0),(324248,'SouthwestAir can someone help me set up a callback today?','2015-02-17 10:28:16',0),(324249,'united NY_NJairports Only at Newark can you land 15 minutes early but lose all that time waiting on tarmac for a gate.','2015-02-17 10:28:49',0),(324250,'SouthwestAir are you kidding me?  I needed help yesterday. I\'m now landed and waiting for my connection.  Never will I fly southwest again!','2015-02-17 10:11:24',0);
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment_has_Airline`
--

DROP TABLE IF EXISTS `Comment_has_Airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment_has_Airline` (
  `Comment_id` int(11) NOT NULL,
  `Airline_id` int(11) DEFAULT NULL,
  KEY `fk_Comment_has_Airline_Airline1_idx` (`Airline_id`),
  KEY `fk_Comment_has_Airline_Comment1_idx` (`Comment_id`),
  CONSTRAINT `fk_Comment_has_Airline_Airline1` FOREIGN KEY (`Airline_id`) REFERENCES `Airline` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_has_Airline_Comment1` FOREIGN KEY (`Comment_id`) REFERENCES `Comment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment_has_Airline`
--

LOCK TABLES `Comment_has_Airline` WRITE;
/*!40000 ALTER TABLE `Comment_has_Airline` DISABLE KEYS */;
INSERT INTO `Comment_has_Airline` VALUES (324151,5),(324152,4),(324153,5),(324154,3),(324155,3),(324156,5),(324157,3),(324158,3),(324159,4),(324160,4),(324161,5),(324162,4),(324163,2),(324164,4),(324165,4),(324166,1),(324167,5),(324168,1),(324169,4),(324170,3),(324171,3),(324172,1),(324173,5),(324174,1),(324175,5),(324176,2),(324177,1),(324178,1),(324179,5),(324180,2),(324181,2),(324182,3),(324183,1),(324184,3),(324185,1),(324186,4),(324187,1),(324188,4),(324189,1),(324190,2),(324191,4),(324192,3),(324193,3),(324194,5),(324195,4),(324196,2),(324197,3),(324198,2),(324199,1),(324200,3),(324201,4),(324202,3),(324203,5),(324204,3),(324205,2),(324206,2),(324207,1),(324208,2),(324209,1),(324210,3),(324211,5),(324212,3),(324213,4),(324214,3),(324215,2),(324216,5),(324217,3),(324218,5),(324219,4),(324220,5),(324221,3),(324222,3),(324223,2),(324224,2),(324225,4),(324226,1),(324227,5),(324228,5),(324229,3),(324230,5),(324231,5),(324232,2),(324233,3),(324234,2),(324235,5),(324236,5),(324237,1),(324238,3),(324239,3),(324240,3),(324241,3),(324242,4),(324243,3),(324244,1),(324245,2),(324246,3),(324247,1),(324248,1),(324249,4),(324250,3);
/*!40000 ALTER TABLE `Comment_has_Airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment_has_City`
--

DROP TABLE IF EXISTS `Comment_has_City`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment_has_City` (
  `Comment_id` int(11) NOT NULL,
  `City_id` int(11) NOT NULL,
  KEY `fk_Comment_has_City_City1_idx` (`City_id`),
  KEY `fk_Comment_has_City_Comment1_idx` (`Comment_id`),
  CONSTRAINT `fk_Comment_has_City_City1` FOREIGN KEY (`City_id`) REFERENCES `City` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_has_City_Comment1` FOREIGN KEY (`Comment_id`) REFERENCES `Comment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment_has_City`
--

LOCK TABLES `Comment_has_City` WRITE;
/*!40000 ALTER TABLE `Comment_has_City` DISABLE KEYS */;
INSERT INTO `Comment_has_City` VALUES (324151,39),(324152,53),(324153,49),(324154,22),(324155,33),(324156,38),(324157,10),(324158,4),(324159,44),(324160,3),(324161,40),(324162,25),(324163,48),(324164,42),(324165,32),(324166,50),(324167,20),(324168,1),(324169,52),(324170,9),(324171,1),(324172,2),(324173,31),(324174,15),(324175,10),(324176,48),(324177,36),(324178,54),(324179,32),(324180,50),(324181,50),(324182,20),(324183,39),(324184,52),(324185,38),(324186,15),(324187,31),(324188,15),(324189,25),(324190,3),(324191,14),(324192,28),(324193,2),(324194,34),(324195,31),(324196,6),(324197,8),(324198,25),(324199,31),(324200,15),(324201,7),(324202,48),(324203,36),(324204,35),(324205,36),(324206,42),(324207,9),(324208,15),(324209,53),(324210,9),(324211,18),(324212,54),(324213,38),(324214,38),(324215,49),(324216,18),(324217,53),(324218,51),(324219,44),(324220,35),(324221,13),(324222,18),(324223,48),(324224,43),(324225,26),(324226,37),(324227,36),(324228,43),(324229,40),(324230,32),(324231,41),(324232,34),(324233,8),(324234,45),(324235,50),(324236,43),(324237,12),(324238,27),(324239,21),(324240,52),(324241,8),(324242,32),(324243,30),(324244,25),(324245,5),(324246,26),(324247,52),(324248,13),(324249,8),(324250,20);
/*!40000 ALTER TABLE `Comment_has_City` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment_has_Reason`
--

DROP TABLE IF EXISTS `Comment_has_Reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment_has_Reason` (
  `Comment_id` int(11) NOT NULL,
  `Reason_id` int(11) NOT NULL,
  KEY `fk_Comment_has_Reason_Reason1_idx` (`Reason_id`),
  KEY `fk_Comment_has_Reason_Comment1_idx` (`Comment_id`),
  CONSTRAINT `fk_Comment_has_Reason_Comment1` FOREIGN KEY (`Comment_id`) REFERENCES `Comment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_has_Reason_Reason1` FOREIGN KEY (`Reason_id`) REFERENCES `Reason` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment_has_Reason`
--

LOCK TABLES `Comment_has_Reason` WRITE;
/*!40000 ALTER TABLE `Comment_has_Reason` DISABLE KEYS */;
INSERT INTO `Comment_has_Reason` VALUES (324151,2),(324152,4),(324153,7),(324154,4),(324155,6),(324156,8),(324157,7),(324158,4),(324159,7),(324160,4),(324161,7),(324162,2),(324163,4),(324164,7),(324165,4),(324166,1),(324167,7),(324168,4),(324169,6),(324170,3),(324171,3),(324172,3),(324173,4),(324174,4),(324175,4),(324176,7),(324177,4),(324178,6),(324179,4),(324180,1),(324181,8),(324182,1),(324183,2),(324184,3),(324185,4),(324186,8),(324187,4),(324188,4),(324189,3),(324190,7),(324191,4),(324192,3),(324193,8),(324194,4),(324195,4),(324196,4),(324197,8),(324198,4),(324199,2),(324200,4),(324201,7),(324202,4),(324203,4),(324204,5),(324205,4),(324206,5),(324207,5),(324208,4),(324209,7),(324210,3),(324211,4),(324212,7),(324213,2),(324214,3),(324215,4),(324216,2),(324217,2),(324218,4),(324219,4),(324220,4),(324221,2),(324222,4),(324223,4),(324224,3),(324225,3),(324226,7),(324227,7),(324228,3),(324229,8),(324230,3),(324231,4),(324232,4),(324233,4),(324234,7),(324235,4),(324236,7),(324237,1),(324238,3),(324239,4),(324240,7),(324241,4),(324242,1),(324243,5),(324244,8),(324245,3),(324246,2),(324247,6),(324248,7),(324249,7),(324250,4);
/*!40000 ALTER TABLE `Comment_has_Reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reason`
--

DROP TABLE IF EXISTS `Reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reason` (
  `id` int(11) NOT NULL,
  `text` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reason`
--

LOCK TABLES `Reason` WRITE;
/*!40000 ALTER TABLE `Reason` DISABLE KEYS */;
INSERT INTO `Reason` VALUES (1,'Bad Flight'),(2,'Cant Tell'),(3,'Cancelled Flight'),(4,'Customer Service Issue'),(5,'Flight Attendant Complaints'),(6,'Flight Booking Problems'),(7,'Late Flight'),(8,'Lost Luggage');
/*!40000 ALTER TABLE `Reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReasonReal`
--

DROP TABLE IF EXISTS `ReasonReal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReasonReal` (
  `id` int(11) NOT NULL,
  `estimation` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReasonReal`
--

LOCK TABLES `ReasonReal` WRITE;
/*!40000 ALTER TABLE `ReasonReal` DISABLE KEYS */;
INSERT INTO `ReasonReal` VALUES (1,'weather'),(2,'security'),(3,'late_aircraft'),(4,'cancelled'),(5,'diverted'),(6,'delay');
/*!40000 ALTER TABLE `ReasonReal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TwitterUser`
--

DROP TABLE IF EXISTS `TwitterUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TwitterUser` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TwitterUser`
--

LOCK TABLES `TwitterUser` WRITE;
/*!40000 ALTER TABLE `TwitterUser` DISABLE KEYS */;
INSERT INTO `TwitterUser` VALUES (1,'nesi_1992','Pacific Time (US & Canada)'),(2,'VahidESQ','Pacific Time (US & Canada)'),(3,'CRomerDome','Pacific Time (US & Canada)'),(4,'feliciastoler','Central Time (US & Canada)'),(5,'markhlyon','Eastern Time (US & Canada)'),(6,'hannahtorney','London'),(7,'followkashyap','Eastern Time (US & Canada)'),(8,'sevnthstar','Pacific Time (US & Canada)'),(9,'MiKasuga','Eastern Time (US & Canada)'),(10,'MarkKersten','Quito'),(11,'wackydunks','Eastern Time (US & Canada)'),(12,'Raven_TheGreat','Central Time (US & Canada)'),(13,'CharNewsJunkie','Eastern Time (US & Canada)'),(14,'sankeshw','Casablanca'),(15,'kukalong','Arizona'),(16,'tcfitz3','Central Time (US & Canada)'),(17,'PorterHaney','Pacific Time (US & Canada)'),(18,'MyMissus','Eastern Time (US & Canada)'),(19,'portugrad','Central Time (US & Canada)'),(20,'DaFuente','Eastern Time (US & Canada)'),(21,'LucyALloyd','Central Time (US & Canada)'),(22,'challemann','Eastern Time (US & Canada)'),(23,'CharNewsJunkie','Eastern Time (US & Canada)'),(24,'ClaudddiaVS','Pacific Time (US & Canada)'),(25,'faithfabulous','Quito'),(26,'deantak','Pacific Time (US & Canada)'),(27,'mtezna','Eastern Time (US & Canada)'),(28,'jjenreich','Central Time (US & Canada)'),(29,'JessonaJourney','Eastern Time (US & Canada)'),(30,'BhutanOrient','Pacific Time (US & Canada)'),(31,'juliadavis','Eastern Time (US & Canada)'),(32,'TheTaxDiva','Central Time (US & Canada)'),(33,'kat_volk','Arizona'),(34,'laura_crom','Quito'),(35,'TheTaxDiva','Central Time (US & Canada)'),(36,'TheTaxDiva','Central Time (US & Canada)'),(37,'TheTaxDiva','Central Time (US & Canada)'),(38,'TheTaxDiva','Central Time (US & Canada)'),(39,'onestitchshort','Central Time (US & Canada)'),(40,'laura_crom','Quito'),(41,'itsjustdoc','Quito'),(42,'LucyALloyd','Central Time (US & Canada)'),(43,'itsjustdoc','Quito'),(44,'laurenaddell','Eastern Time (US & Canada)'),(45,'Jamayka','Central Time (US & Canada)'),(46,'portugrad','Central Time (US & Canada)'),(47,'itsjustdoc','Quito'),(48,'eguroff','Central Time (US & Canada)'),(49,'meracross','Pacific Time (US & Canada)'),(50,'TullamoreEims','Dublin'),(51,'CanadianCowgirl','Eastern Time (US & Canada)'),(52,'TJGoertz','Eastern Time (US & Canada)'),(53,'MiKasuga','Eastern Time (US & Canada)'),(54,'BhutanOrient','Pacific Time (US & Canada)'),(55,'tamajared','Quito'),(56,'BhutanOrient','Pacific Time (US & Canada)'),(57,'BhutanOrient','Pacific Time (US & Canada)'),(58,'iBrianWeaver','Central Time (US & Canada)'),(59,'alsonmusical','Central Time (US & Canada)'),(60,'simuLate Flightthis','Quito'),(61,'Loley9','Central Time (US & Canada)'),(62,'simuLate Flightthis','Quito'),(63,'alsonmusical','Central Time (US & Canada)'),(64,'SeanHerwaldt','Central Time (US & Canada)'),(65,'portugrad','Central Time (US & Canada)'),(66,'BhutanOrient','Pacific Time (US & Canada)'),(67,'81FSUnole','Eastern Time (US & Canada)'),(68,'Jamayka','Central Time (US & Canada)'),(69,'cristalyze','Eastern Time (US & Canada)'),(70,'StarkTTT','Central Time (US & Canada)'),(71,'jjenreich','Central Time (US & Canada)'),(72,'alsonmusical','Central Time (US & Canada)'),(73,'caralageson','Central Time (US & Canada)'),(74,'alsonmusical','Central Time (US & Canada)'),(75,'etachoir','Eastern Time (US & Canada)'),(76,'alsonmusical','Central Time (US & Canada)'),(77,'Aeisinger','Mountain Time (US & Canada)'),(78,'oheyjasmine','Hawaii'),(79,'itsjustdoc','Quito'),(80,'Kyle_Clarke528','Central Time (US & Canada)'),(81,'texasjuls','Central Time (US & Canada)'),(82,'beccalauren2011','Central Time (US & Canada)'),(83,'ALHphoto','Atlantic Time (Canada)'),(84,'JenSpnSuperstar','Central Time (US & Canada)'),(85,'ALHphoto','Atlantic Time (Canada)'),(86,'jonovoss','Atlantic Time (Canada)'),(87,'tcfitz3','Central Time (US & Canada)'),(88,'alsonmusical','Central Time (US & Canada)'),(89,'LedPinkCloudz','Pacific Time (US & Canada)'),(90,'MsDMichelle','Eastern Time (US & Canada)'),(91,'LedPinkCloudz','Pacific Time (US & Canada)'),(92,'fshubert','Eastern Time (US & Canada)'),(93,'sampleonephl','Central Time (US & Canada)'),(94,'jholowka','Eastern Time (US & Canada)'),(95,'BernhardtJH','Eastern Time (US & Canada)'),(96,'_JoeChuck','Eastern Time (US & Canada)'),(97,'jonw4570','Central Time (US & Canada)'),(98,'caralageson','Central Time (US & Canada)'),(99,'fshubert','Eastern Time (US & Canada)'),(100,'jjenreich','Central Time (US & Canada)');
/*!40000 ALTER TABLE `TwitterUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TwitterUser_has_Comment`
--

DROP TABLE IF EXISTS `TwitterUser_has_Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TwitterUser_has_Comment` (
  `TwitterUser_id` int(11) NOT NULL,
  `Comment_id` int(11) DEFAULT NULL,
  KEY `fk_TwitterUser_has_Comment_Comment1_idx` (`Comment_id`),
  KEY `fk_TwitterUser_has_Comment_TwitterUser_idx` (`TwitterUser_id`),
  CONSTRAINT `fk_TwitterUser_has_Comment_Comment1` FOREIGN KEY (`Comment_id`) REFERENCES `Comment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TwitterUser_has_Comment_TwitterUser` FOREIGN KEY (`TwitterUser_id`) REFERENCES `TwitterUser` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TwitterUser_has_Comment`
--

LOCK TABLES `TwitterUser_has_Comment` WRITE;
/*!40000 ALTER TABLE `TwitterUser_has_Comment` DISABLE KEYS */;
INSERT INTO `TwitterUser_has_Comment` VALUES (1,324151),(2,324152),(3,324153),(4,324154),(5,324155),(6,324156),(7,324157),(8,324158),(9,324159),(10,324160),(11,324161),(12,324162),(13,324163),(14,324164),(15,324165),(16,324166),(17,324167),(18,324168),(19,324169),(20,324170),(21,324171),(22,324172),(23,324173),(24,324174),(25,324175),(26,324176),(27,324177),(28,324178),(29,324179),(30,324180),(31,324181),(32,324182),(33,324183),(34,324184),(35,324185),(36,324186),(37,324187),(38,324188),(39,324189),(40,324190),(41,324191),(42,324192),(43,324193),(44,324194),(45,324195),(46,324196),(47,324197),(48,324198),(49,324199),(50,324200),(51,324201),(52,324202),(53,324203),(54,324204),(55,324205),(56,324206),(57,324207),(58,324208),(59,324209),(60,324210),(61,324211),(62,324212),(63,324213),(64,324214),(65,324215),(66,324216),(67,324217),(68,324218),(69,324219),(70,324220),(71,324221),(72,324222),(73,324223),(74,324224),(75,324225),(76,324226),(77,324227),(78,324228),(79,324229),(80,324230),(81,324231),(82,324232),(83,324233),(84,324234),(85,324235),(86,324236),(87,324237),(88,324238),(89,324239),(90,324240),(91,324241),(92,324242),(93,324243),(94,324244),(95,324245),(96,324246),(97,324247),(98,324248),(99,324249),(100,324250);
/*!40000 ALTER TABLE `TwitterUser_has_Comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-29 19:23:46
