CREATE DATABASE  IF NOT EXISTS `movie` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `movie`;
-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: localhost    Database: movie
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cast`
--

DROP TABLE IF EXISTS `cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cast` (
  `cast_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `character_name` varchar(200) NOT NULL,
  `gender` char(1) NOT NULL,
  `birthdate` date NOT NULL,
  `nationality` varchar(100) NOT NULL,
  `biography` text,
  PRIMARY KEY (`cast_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast`
--

LOCK TABLES `cast` WRITE;
/*!40000 ALTER TABLE `cast` DISABLE KEYS */;
INSERT INTO `cast` VALUES (1,'Sophia','Brown','Lucas Smith','F','1978-12-12','New Zealander','Sophia is a well-known actress with a passion for musical theater.'),(2,'David','Brown','Ava Johnson','M','1991-01-15','Irish','David is known for his intense performances on screen.'),(3,'Sarah','Williams','Liam Roberts','F','1987-07-25','New Zealander','Sarah is a rising star with a growing fan base.'),(4,'Grace','Hall','Mia Garcia','F','1989-04-01','British','Grace is a versatile actress with a passion for drama.'),(5,'Alexander','Lee','Noah White','M','1977-06-18','Irish','Alexander is a respected actor known for his dramatic roles.'),(6,'Emily','Davis','Emma Johnson','F','1982-12-05','Canadian','Emily is an award-winning actress with a passion for theater.'),(7,'Isabella','Brooks','Olivia Rodriguez','F','1990-08-06','Canadian','Isabella is a talented actress with a wide range of roles.'),(8,'John','Doe','Lucas Harris','M','1985-03-21','American','John is an accomplished actor known for his versatile roles.'),(9,'Chloe','Martin','Aiden Wilson','F','1985-08-25','Canadian','Chloe has a passion for independent films and documentaries.'),(10,'Oscar','Hughes','Evelyn Martinez','M','1993-09-05','Scottish','Oscar has a strong background in television drama.'),(11,'Sophia','Moore','Zachary Adams','F','1981-02-17','British','Sophia is a celebrated actress with multiple awards to her name.'),(12,'William','Martin','Sophia Clark','M','1986-01-15','Scottish','William has appeared in several critically acclaimed films.'),(13,'Matthew','King','Michael Brown','M','1986-09-22','Scottish','Matthew has appeared in several critically acclaimed films.'),(14,'Sophia','Harrison','Hannah Mitchell','F','1979-12-30','South African','Sophia is a respected actress with a wide range of roles.'),(15,'Joshua','Lewis','Isabella Miller','M','1989-07-29','American','Joshua is known for his versatility and charm.'),(16,'Emma','Taylor','Nathaniel Thompson','F','1983-11-20','South African','Emma has a background in musical theater and drama.'),(17,'Benjamin','Thompson','Charlotte Reed','M','1975-05-17','Irish','Benjamin is a veteran actor with a long career in film.'),(18,'Hughes','Joshua','Elijah Walker','M','1977-04-12','Australian','Joshua has appeared in both blockbuster films and indie productions.'),(19,'Elliot','Perry','Alexander Patterson','M','1988-09-08','American','Elliot is a charismatic actor with a strong following.'),(20,'Ethan','Stewart','Chloe Edwards','M','1986-02-22','American','Ethan has a reputation for his intense method acting.');
/*!40000 ALTER TABLE `cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cast_movies`
--

DROP TABLE IF EXISTS `cast_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cast_movies` (
  `cast_id` int NOT NULL,
  `movies_id` int NOT NULL,
  PRIMARY KEY (`cast_id`,`movies_id`),
  KEY `fk_cast_movies_movies_idx` (`movies_id`),
  KEY `fk_cast_movies_cast_idx` (`cast_id`),
  CONSTRAINT `fk_cast_movies_cast` FOREIGN KEY (`cast_id`) REFERENCES `cast` (`cast_id`),
  CONSTRAINT `fk_cast_movies_movies` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`movies_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast_movies`
--

LOCK TABLES `cast_movies` WRITE;
/*!40000 ALTER TABLE `cast_movies` DISABLE KEYS */;
INSERT INTO `cast_movies` VALUES (20,1),(3,2),(9,3),(14,4),(11,6),(6,7),(14,8),(1,10),(16,11),(17,12),(1,13),(17,14),(7,15),(2,16),(5,17),(7,18),(18,19),(15,20),(18,21),(5,22),(2,23),(20,24),(17,25),(14,26),(20,27),(3,28),(8,29),(4,30),(1,31),(4,32),(13,33),(7,35),(19,36),(19,37),(14,38),(9,39),(15,40),(6,41),(9,42),(16,43),(4,44),(16,46),(12,48),(8,49),(7,50),(2,51),(20,52),(16,53),(14,54),(9,55),(15,56),(4,59),(10,60),(10,62),(5,63),(10,64),(11,65),(2,67),(15,68),(17,69),(8,70),(12,71),(6,72),(17,73),(13,74),(12,75),(8,76),(1,77),(11,78),(11,79),(13,80),(2,81),(18,82),(7,83),(11,84),(19,85),(18,86),(6,87),(9,88),(11,89),(12,90),(4,91),(18,92),(13,93),(8,94),(5,95),(19,97),(3,98),(5,99),(10,100),(1,101),(12,102),(10,103),(3,104),(3,105),(6,105),(19,105),(20,106),(16,107);
/*!40000 ALTER TABLE `cast_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directors` (
  `directors_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `gender` char(1) NOT NULL,
  `birthdate` date NOT NULL,
  `nationality` varchar(100) NOT NULL,
  PRIMARY KEY (`directors_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES (1,'Steven','Spielberg','M','1946-12-18','American'),(2,'Quentin','Tarantino','M','1963-03-27','American'),(3,'Sofia','Coppola','F','1971-05-14','American'),(4,'Kathryn','Bigelow','F','1951-11-27','American'),(5,'Martin','Scorsese','M','1942-11-17','American'),(6,'Christopher','Nolan','M','1970-07-30','British'),(7,'James','Cameron','M','1954-08-16','Canadian'),(8,'Greta','Gerwig','F','1983-08-04','American'),(9,'Guillermo','del Toro','M','1964-10-09','Mexican'),(10,'Mira','Nair','F','1957-10-15','Indian'),(11,'Wes','Anderson','M','1969-05-01','American'),(12,'Jane','Campion','F','1954-04-30','New Zealander');
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genres_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`genres_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Action'),(2,'Adventure'),(3,'Comedy'),(4,'Drama'),(5,'Fantasy'),(6,'Horror'),(7,'Mystery'),(8,'Romance'),(9,'Science Fiction'),(10,'Thriller'),(11,'Western'),(12,'Documentary'),(13,'Animation'),(14,'Crime'),(15,'Family'),(16,'Musical'),(17,'War'),(18,'Biographical'),(19,'Sports'),(20,'Historical');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `movies_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `video` varchar(255) NOT NULL,
  `cover_photo` varchar(255) NOT NULL,
  `release_year` int NOT NULL,
  `runtime` int NOT NULL,
  `plot_summary` text,
  `average_rating` decimal(3,2) DEFAULT NULL,
  `genres_id` int NOT NULL,
  `directors_id` int NOT NULL,
  PRIMARY KEY (`movies_id`),
  KEY `fk_movies_genres1_idx` (`genres_id`),
  KEY `fk_movies_directors1_idx` (`directors_id`),
  CONSTRAINT `fk_movies_directors1` FOREIGN KEY (`directors_id`) REFERENCES `directors` (`directors_id`),
  CONSTRAINT `fk_movies_genres1` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`genres_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'The Godfather','godfather.mov','godfather.jpg',1972,175,'The story of a powerful mafia family.',4.70,1,3),(2,'The Shawshank Redemption','shawshank.mp4','shawshank.png',1994,142,'An imprisoned man finds hope.',4.90,8,7),(3,'The Dark Knight','darkknight.avi','darkknight.jpg',2008,152,'Batman faces the Joker.',4.80,15,1),(4,'Pulp Fiction','pulpfiction.wmv','pulpfiction.png',1994,154,'Interwoven stories in Los Angeles.',4.50,12,4),(5,'Star Wars: Episode IV - A New Hope','starwars.flv','starwars.jpg',1977,121,'A young Jedi battles the Empire.',4.60,3,11),(6,'The Lord of the Rings: The Fellowship of the Ring','lotr.mkv','lotr.png',2001,178,'A group sets out to destroy a powerful ring.',4.70,5,10),(7,'Inception','inception.mp4','inception.jpg',2010,148,'A heist within dreams.',4.80,19,9),(8,'Forrest Gump','forrestgump.avi','forrestgump.png',1994,142,'The life of a simple man with a big heart.',4.70,7,6),(9,'The Matrix','matrix.wmv','matrix.jpg',1999,136,'A hacker discovers the nature of reality.',4.60,10,5),(10,'Schindler\'s List','schindlerslist.mov','schindlerslist.png',1993,195,'The story of a man who saved many Jews during WWII.',4.90,11,4),(11,'Fight Club','fightclub.flv','fightclub.jpg',1999,139,'An underground fight club emerges.',4.60,16,3),(12,'Jurassic Park','jurassicpark.mkv','jurassicpark.png',1993,127,'A theme park with cloned dinosaurs.',4.50,2,7),(13,'The Silence of the Lambs','silenceofthelambs.mp4','silenceofthelambs.jpg',1991,118,'An FBI trainee seeks a serial killer.',4.70,13,12),(14,'Titanic','titanic.avi','titanic.png',1997,195,'A love story on the doomed ship.',4.80,6,2),(15,'The Avengers','avengers.mov','avengers.jpg',2012,143,'Superheroes come together to save Earth.',4.70,17,8),(16,'Gladiator','gladiator.wmv','gladiator.png',2000,155,'A Roman general becomes a gladiator.',4.70,4,9),(17,'The Lion King','lionking.flv','lionking.jpg',1994,88,'A young lion finds his destiny.',4.60,14,11),(18,'Back to the Future','backtothefuture.mkv','backtothefuture.png',1985,116,'A teenager travels back in time.',4.70,18,1),(19,'The Terminator','terminator.mp4','terminator.jpg',1984,107,'A cyborg from the future.',4.70,1,10),(20,'Indiana Jones and the Raiders of the Lost Ark','indianajones.avi','indianajones.png',1981,115,'An archaeologist goes on an adventure.',4.60,19,3),(21,'Jaws','jaws.mov','jaws.jpg',1975,124,'A giant shark terrorizes a beach town.',4.60,20,6),(22,'The Green Mile','greenmile.wmv','greenmile.png',1999,189,'A prison guard meets a special inmate.',4.60,2,5),(23,'Saving Private Ryan','savingprivateryan.flv','savingprivateryan.jpg',1998,169,'A group of soldiers on a rescue mission.',4.70,3,7),(24,'Goodfellas','goodfellas.mkv','goodfellas.jpg',1990,146,'The life of a mobster.',4.70,4,2),(25,'The Sixth Sense','sixthsense.mp4','sixthsense.jpg',1999,107,'A child psychologist and a boy with a secret.',4.80,15,9),(26,'E.T. the Extra-Terrestrial','et.avi','et.jpg',1982,115,'A young boy befriends an alien.',4.60,6,8),(27,'Rocky','rocky.mov','rocky.jpg',1976,120,'An underdog boxer rises to fame.',4.60,11,12),(28,'Braveheart','braveheart.wmv','braveheart.jpg',1995,178,'A Scottish warrior fights for freedom.',4.70,7,4),(29,'The Godfather: Part II','godfather2.flv','godfather2.jpg',1974,202,'The continuation of the Corleone saga.',4.80,9,5),(30,'Gone with the Wind','gonewiththewind.mkv','gonewiththewind.jpg',1939,238,'A story set in the American South.',4.70,3,11),(31,'The Great Escape','greatescape.mp4','greatescape.jpg',1963,172,'Prisoners plan a great escape.',4.60,10,12),(32,'Die Hard','diehard.avi','diehard.png',1988,132,'An officer battles terrorists in a high-rise.',4.60,14,6),(33,'The Wizard of Oz','wizardofoz.mov','wizardofoz.jpg',1939,102,'A young girl is transported to a magical world.',4.80,8,9),(34,'Alien','alien.wmv','alien.png',1979,117,'A crew encounters a deadly alien.',4.60,12,7),(35,'Casablanca','casablanca.flv','casablanca.jpg',1942,102,'A love story during WWII.',4.70,18,10),(36,'It\'s a Wonderful Life','wonderfullife.mkv','wonderfullife.png',1946,130,'A man learns about the impact of his life.',4.80,13,1),(37,'To Kill a Mockingbird','tokillamockingbird.mp4','tokillamockingbird.jpg',1962,129,'A lawyer defends an innocent man.',4.70,5,3),(38,'Spirited Away','spiritedaway.avi','spiritedaway.jpg',2001,125,'A young girl in a mystical world.',4.80,17,12),(39,'Avatar','avatar.mov','avatar.jpg',2009,162,'A man discovers a new world.',4.60,9,2),(40,'The Exorcist','exorcist.wmv','exorcist.jpg',1973,122,'A young girl is possessed by a demon.',4.70,7,4),(41,'The Godfather: Part III','godfather3.mov','godfather3.jpg',1990,162,'The final chapter of the Corleone saga.',4.50,8,12),(42,'A Clockwork Orange','clockwork_orange.mp4','clockwork_orange.png',1971,136,'A dystopian tale of ultraviolence.',4.30,6,7),(43,'The Big Lebowski','big_lebowski.avi','big_lebowski.jpg',1998,117,'The story of \'The Dude\' and his bowling adventures.',4.40,5,11),(44,'Reservoir Dogs','reservoir_dogs.wmv','reservoir_dogs.jpg',1992,99,'A heist goes terribly wrong.',4.60,3,6),(45,'Blade Runner','blade_runner.flv','blade_runner.jpg',1982,117,'A dystopian world of replicants.',4.70,1,10),(46,'The Green Hornet','green_hornet.mkv','green_hornet.png',2011,119,'A modern take on the classic superhero.',4.00,7,9),(47,'The Karate Kid','karate_kid.mp4','karate_kid.jpg',1984,126,'A young boy learns karate from a master.',4.20,4,5),(48,'Spider-Man','spider_man.avi','spider_man.jpg',2002,121,'Peter Parker becomes Spider-Man.',4.50,10,2),(49,'The Blues Brothers','blues_brothers.wmv','blues_brothers.jpg',1980,133,'Two brothers on a musical mission.',4.60,9,7),(50,'The Hunger Games','hunger_games.flv','hunger_games.jpg',2012,142,'A dystopian world where children fight.',4.40,12,3),(51,'The Departed','the_departed.mkv','the_departed.jpg',2006,151,'A story of cops and undercover agents.',4.80,15,6),(52,'Mad Max: Fury Road','mad_max_fury_road.mp4','mad_max_fury_road.jpg',2015,120,'An action-packed post-apocalyptic world.',4.70,14,8),(53,'Kill Bill: Vol. 1','kill_bill_vol_1.avi','kill_bill_vol_1.jpg',2003,111,'The Bride seeks revenge.',4.60,17,10),(54,'Inglourious Basterds','inglourious_basterds.wmv','inglourious_basterds.jpg',2009,153,'A group of soldiers on a mission during WWII.',4.70,18,1),(55,'La La Land','la_la_land.flv','la_la_land.jpg',2016,128,'A musical love story in Los Angeles.',4.80,16,11),(56,'The Social Network','social_network.mkv','social_network.png',2010,120,'The story of Facebook\'s creation.',4.50,3,9),(57,'Finding Nemo','finding_nemo.mp4','finding_nemo.jpg',2003,100,'A fish searches for his son.',4.70,11,4),(58,'The Incredibles','incredibles.avi','incredibles.jpg',2004,115,'A superhero family in action.',4.80,7,3),(59,'The Breakfast Club','breakfast_club.wmv','breakfast_club.jpg',1985,97,'Five high school students in detention.',4.60,6,7),(60,'Full Metal Jacket','full_metal_jacket.flv','full_metal_jacket.jpg',1987,116,'A story of soldiers during the Vietnam War.',4.40,2,8),(61,'The Sound of Music','sound_of_music.mkv','sound_of_music.jpg',1965,174,'The story of the Von Trapp family.',4.80,14,12),(62,'The Prestige','prestige.mp4','prestige.jpg',2006,130,'Two rival magicians in a battle.',4.70,18,10),(63,'Shutter Island','shutter_island.avi','shutter_island.jpg',2010,138,'A psychological thriller on an island.',4.60,19,2),(64,'The Grand Budapest Hotel','grand_budapest_hotel.wmv','grand_budapest_hotel.jpg',2014,100,'A whimsical tale about a hotel and its eccentric characters.',4.80,17,11),(65,'The Hateful Eight','hateful_eight.flv','hateful_eight.jpg',2015,187,'A group of strangers in a snowstorm.',4.30,1,6),(66,'The Conjuring','conjuring.mkv','conjuring.png',2013,112,'A paranormal investigation story.',4.50,5,9),(67,'The Revenant','revenant.mp4','revenant.jpg',2015,156,'A frontiersman fights for survival.',4.70,10,7),(68,'Glengarry Glen Ross','glengarry_glen_ross.avi','glengarry_glen_ross.jpg',1992,100,'A story of real estate salesmen.',4.30,2,8),(69,'The Sixth Sense','sixth_sense.mp4','sixth_sense.jpg',1999,107,'A boy who can see ghosts.',4.80,4,10),(70,'Iron Man','iron_man.wmv','iron_man.jpg',2008,126,'Tony Stark creates a suit of armor.',4.60,6,3),(71,'Captain America: Civil War','civil_war.mov','civil_war.jpg',2016,147,'A battle among heroes over ideology.',4.70,11,1),(72,'The Jungle Book','jungle_book.mkv','jungle_book.jpg',2016,106,'The story of Mowgli.',4.50,7,12),(73,'The Theory of Everything','theory_of_everything.mp4','theory_of_everything.jpg',2014,123,'The story of Stephen Hawking.',4.70,17,9),(74,'Dallas Buyers Club','dallas_buyers_club.avi','dallas_buyers_club.jpg',2013,117,'The story of an AIDS patient.',4.60,13,6),(75,'The Bourne Identity','bourne_identity.wmv','bourne_identity.jpg',2002,119,'A spy with amnesia.',4.50,8,11),(76,'The Pianist','the_pianist.flv','the_pianist.jpg',2002,150,'A pianist survives the Holocaust.',4.80,9,2),(77,'The Truman Show','truman_show.mkv','truman_show.jpg',1998,103,'A man finds out he\'s the star of a TV show.',4.60,4,8),(78,'The King\'s Speech','kings_speech.mp4','kings_speech.jpg',2010,118,'A story of King George VI and his speech therapy.',4.80,10,5),(79,'The Pursuit of Happyness','pursuit_of_happyness.avi','pursuit_of_happyness.jpg',2006,117,'A man overcomes challenges to find success.',4.70,18,3),(80,'Cinderella','cinderella.wmv','cinderella.jpg',2015,105,'The classic tale of Cinderella.',4.50,2,9),(81,'The Imitation Game','imitation_game.flv','imitation_game.jpg',2014,113,'The story of Alan Turing and the codebreaking efforts during WWII.',4.70,6,7),(82,'American Beauty','american_beauty.mkv','american_beauty.jpg',1999,122,'A man has a midlife crisis.',4.70,1,10),(83,'The Wolf of Wall Street','wolf_of_wall_street.mp4','wolf_of_wall_street.jpg',2013,180,'The story of a corrupt stockbroker.',4.60,15,4),(84,'The Great Gatsby','great_gatsby.wmv','great_gatsby.jpg',2013,143,'The story of Jay Gatsby\'s lavish lifestyle.',4.60,12,1),(85,'The Big Short','big_short.flv','big_short.jpg',2015,130,'The story of the 2008 financial crisis.',4.50,14,11),(86,'Catch Me If You Can','catch_me_if_you_can.mkv','catch_me_if_you_can.jpg',2002,141,'A con artist is pursued by the FBI.',4.70,11,12),(87,'Lincoln','lincoln.mp4','lincoln.jpg',2012,150,'The story of Abraham Lincoln\'s presidency.',4.70,3,8),(88,'Argo','argo.avi','argo.jpg',2012,120,'A covert operation to rescue hostages in Iran.',4.80,7,9),(89,'The Shape of Water','shape_of_water.wmv','shape_of_water.jpg',2017,123,'A story of a woman and a sea creature.',4.70,5,6),(90,'Gran Torino','gran_torino.flv','gran_torino.jpg',2008,116,'An aging war veteran befriends a young boy.',4.60,9,3),(91,'The Dark Knight Rises','dark_knight_rises.mkv','dark_knight_rises.jpg',2012,165,'Batman returns to face new threats.',4.60,17,2),(92,'Django Unchained','django_unchained.mp4','django_unchained.jpg',2012,165,'A freed slave seeks revenge.',4.80,18,10),(93,'Batman Begins','batman_begins.avi','batman_begins.jpg',2005,140,'The origin story of Batman.',4.70,15,7),(94,'Prisoners','prisoners.wmv','prisoners.jpg',2013,153,'A man seeks to find his kidnapped daughter.',4.60,8,12),(95,'Heat','heat.flv','heat.jpg',1995,170,'A cat-and-mouse game between cops and robbers.',4.70,16,5),(96,'City of God','city_of_god.mkv','city_of_god.jpg',2002,130,'A story about life in the slums of Rio de Janeiro.',4.80,20,6),(97,'Requiem for a Dream','requiem_for_a_dream.mp4','requiem_for_a_dream.jpg',2000,102,'A haunting tale of addiction and its consequences.',4.50,19,11),(98,'The Irishman','the_irishman.avi','the_irishman.jpg',2019,209,'The story of an aging mob hitman.',4.60,2,3),(99,'Gone Girl','gone_girl.wmv','gone_girl.jpg',2014,149,'A husband is suspected in his wife\'s disappearance.',4.40,11,9),(100,'The Prestige','prestige.flv','prestige.jpg',2006,130,'Two magicians in a rivalry.',4.60,18,10),(101,'Shutter Island','shutter_island.mkv','shutter_island.jpg',2010,138,'A detective uncovers disturbing secrets.',4.50,13,7),(102,'The Grand Budapest Hotel','grand_budapest_hotel.mp4','grand_budapest_hotel.jpg',2014,100,'A quirky story set in a legendary hotel.',4.70,4,11),(103,'The Hateful Eight','hateful_eight.mov','hateful_eight.jpg',2015,187,'A group of strangers in a remote cabin during a snowstorm.',4.40,12,6),(104,'The Conjuring','conjuring.wmv','conjuring.jpg',2013,112,'A ghost hunting tale.',4.50,5,9),(105,'The Revenant','revenant.mp4','revenant.jpg',2015,156,'A frontiersman fights for survival.',4.70,10,7),(106,'Glengarry Glen Ross','glengarry_glen_ross.avi','glengarry_glen_ross.jpg',1992,100,'A drama about real estate salesmen.',4.30,2,8),(107,'The Sixth Sense','sixth_sense.mp4','sixth_sense.jpg',1999,107,'A boy who can see ghosts.',4.80,6,8);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `ratings_id` int NOT NULL AUTO_INCREMENT,
  `rating` decimal(3,2) NOT NULL,
  `movies_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`ratings_id`),
  KEY `fk_ratings_movies1_idx` (`movies_id`),
  KEY `fk_ratings_user1_idx` (`user_id`),
  CONSTRAINT `fk_ratings_movies1` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`movies_id`),
  CONSTRAINT `fk_ratings_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,4.25,23,17),(2,3.75,57,11),(3,4.00,32,41),(4,3.50,88,29),(5,4.50,71,22),(6,4.75,64,35),(7,4.90,12,3),(8,3.25,101,43),(9,4.10,19,8),(10,3.80,75,26),(11,4.30,45,16),(12,4.55,21,14),(13,3.90,11,9),(14,4.40,39,12),(15,4.60,82,21),(16,4.15,34,24),(17,4.70,97,33),(18,4.05,7,27),(19,3.95,53,36),(20,4.85,28,38),(21,3.70,66,40),(22,4.35,16,13),(23,4.50,24,5),(24,4.25,18,44),(25,3.85,90,15),(26,4.60,55,31),(27,4.75,38,7),(28,4.10,49,20),(29,3.60,102,10),(30,4.00,63,50),(31,4.90,73,23),(32,3.95,13,28),(33,3.75,33,18),(34,4.30,89,19),(35,4.25,105,2),(36,4.65,52,47),(37,4.50,29,25),(38,3.80,36,1),(39,4.15,86,42),(40,3.50,99,4),(41,4.00,44,46),(42,4.55,67,37),(43,4.40,25,6),(44,4.85,74,39),(45,3.90,8,32),(46,3.80,48,30),(47,4.25,20,45),(48,3.75,58,49),(49,4.30,78,48),(50,4.70,95,34),(51,3.95,22,12),(52,4.60,35,33),(53,4.50,103,21),(54,4.25,87,43),(55,3.90,14,41),(56,4.75,51,17),(57,4.40,47,24),(58,4.00,77,3),(59,3.85,60,5),(60,3.70,100,13),(61,4.30,62,6),(62,3.95,46,8),(63,3.60,85,19),(64,4.15,61,31),(65,3.75,68,20),(66,4.10,91,22),(67,4.55,104,11),(68,4.85,69,23),(69,3.50,40,26),(70,4.70,26,15),(71,4.45,83,16),(72,3.85,76,17),(73,4.00,17,36),(74,4.60,65,4),(75,3.75,41,35),(76,3.25,54,50),(77,3.90,79,28),(78,4.25,56,42),(79,3.65,59,40),(80,4.55,31,21),(81,4.30,15,25),(82,3.90,106,33),(83,3.75,84,44),(84,3.80,30,47),(85,4.15,37,29),(86,4.70,72,30),(87,3.85,50,38),(88,4.65,70,46),(89,4.25,27,12),(90,3.95,27,14),(91,4.00,107,9),(92,4.55,2,45),(93,3.50,80,18),(94,4.10,92,2),(95,3.80,107,34),(96,3.90,94,11),(97,4.30,81,13),(98,3.85,107,28),(99,4.00,3,32),(100,3.65,2,7),(101,4.25,32,26),(102,4.70,56,15),(103,4.55,89,46),(104,3.80,24,27),(105,4.15,45,29),(106,3.90,36,49),(107,4.25,50,20),(108,4.65,39,25),(109,3.95,65,22),(110,4.55,96,30),(111,4.45,52,35),(112,4.70,6,16),(113,3.85,58,48),(114,4.20,27,19),(115,3.90,93,28),(116,4.35,4,37),(117,3.70,5,47),(118,4.00,82,36),(119,4.60,67,14),(120,3.65,49,10),(121,4.25,68,9),(122,3.95,93,4),(123,4.50,104,27),(124,3.80,33,21),(125,4.70,26,5),(126,3.90,35,22),(127,3.65,88,43),(128,4.25,71,29),(129,4.60,20,7),(130,3.75,78,13),(131,3.85,53,9),(132,4.10,57,3),(133,3.70,91,32),(134,3.90,99,35),(135,3.65,100,37),(136,4.55,40,6),(137,4.70,69,49),(138,3.95,94,33),(139,4.10,101,20),(140,3.50,50,26),(141,3.80,81,17),(142,3.90,46,25),(143,3.85,70,30),(144,3.70,56,35),(145,3.90,97,22),(146,4.60,36,10),(147,4.40,43,50),(148,4.75,11,1),(149,4.25,84,3),(150,4.15,45,32),(151,3.85,27,33),(152,4.35,2,44),(153,3.95,89,26),(154,3.75,38,18),(155,4.50,8,9),(156,4.65,105,12),(157,3.60,17,25),(158,4.85,68,40),(159,3.75,29,47),(160,4.10,100,49),(161,3.95,62,36),(162,3.70,72,13),(163,3.90,54,41),(164,4.25,18,43),(165,3.60,35,10),(166,3.85,15,27),(167,4.50,58,17),(168,4.65,74,48),(169,4.10,53,21),(170,3.75,73,19),(171,4.30,13,12),(172,4.55,50,11),(173,3.85,78,22),(174,3.80,11,29),(175,3.70,10,4),(176,4.60,37,6),(177,4.35,28,18),(178,3.75,101,1),(179,3.85,19,37),(180,4.70,36,43),(181,4.25,82,28),(182,3.95,8,15),(183,3.90,103,27),(184,4.00,21,11),(185,3.85,86,24),(186,4.55,52,21),(187,4.75,32,49),(188,4.25,44,37),(189,3.95,19,16),(190,3.60,54,13),(191,4.35,12,8),(192,3.85,93,27),(193,4.10,99,35),(194,3.70,103,38),(195,4.60,96,29),(196,3.85,4,26),(197,3.90,45,30),(198,3.75,5,37),(199,4.50,53,32),(200,4.35,14,17),(201,3.85,60,43),(202,4.55,26,10),(203,3.90,100,20),(204,3.65,107,35),(205,3.80,95,42),(206,4.15,33,8),(207,3.60,86,14),(208,3.85,38,26),(209,4.30,13,17),(210,3.95,17,43),(211,4.40,67,47),(212,4.85,19,20),(213,3.70,53,12),(214,4.75,2,32),(215,3.90,22,18),(216,3.85,101,22),(217,3.95,41,23),(218,3.80,32,33),(219,3.65,107,38),(220,3.75,31,27),(221,4.15,60,50),(222,3.90,27,44),(223,3.85,78,31),(224,3.95,15,45),(225,4.30,40,39),(226,3.85,85,35),(227,3.80,89,10),(228,3.70,54,26),(229,3.95,17,14),(230,4.25,63,41),(231,4.10,50,25),(232,4.15,84,42),(233,3.85,65,10),(234,3.60,105,39),(235,3.70,22,30),(236,3.95,66,8),(237,4.30,107,9),(238,4.25,55,3),(239,3.85,101,32),(240,3.75,49,43),(241,3.80,103,50),(242,4.10,39,27),(243,3.90,74,44),(244,3.75,102,5),(245,4.30,93,41),(246,3.85,40,12),(247,3.65,47,38),(248,3.90,85,45),(249,3.70,36,25),(250,3.75,10,9),(251,4.00,24,19),(252,3.85,84,15),(253,3.65,60,27),(254,3.90,87,28),(255,4.15,79,12),(256,3.70,11,21),(257,3.85,45,36),(258,3.60,78,13),(259,3.95,69,37),(260,3.85,82,43),(261,4.55,26,24),(262,3.85,46,48),(263,4.50,14,50),(264,4.10,35,17),(265,4.20,87,33),(266,3.90,55,16),(267,4.15,100,44),(268,3.80,89,47),(269,3.70,62,7),(270,3.65,105,22),(271,3.95,28,36),(272,4.35,84,8),(273,4.25,49,21),(274,3.60,93,34),(275,3.70,95,30),(276,3.85,82,50),(277,3.90,22,19),(278,3.75,71,47),(279,3.85,47,3),(280,4.15,19,42),(281,3.70,24,35),(282,4.10,96,12),(283,3.85,68,14),(284,3.70,53,9),(285,4.55,58,35),(286,3.75,14,21),(287,3.60,104,18),(288,3.80,102,25),(289,3.95,17,32),(290,3.85,38,37),(291,4.30,48,43),(292,3.95,107,24),(293,4.65,99,19),(294,4.85,27,51),(295,4.25,31,36);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `reviews_id` int NOT NULL AUTO_INCREMENT,
  `reviews` text NOT NULL,
  `rating` decimal(3,2) NOT NULL,
  `user_id` int NOT NULL,
  `movies_id` int NOT NULL,
  PRIMARY KEY (`reviews_id`),
  KEY `fk_reviews_user1_idx` (`user_id`),
  KEY `fk_reviews_movies1_idx` (`movies_id`),
  CONSTRAINT `fk_reviews_movies1` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`movies_id`),
  CONSTRAINT `fk_reviews_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'Absolutely amazing movie, would watch again!',4.50,23,87),(2,'The plot was a bit confusing, but the action was great!',3.80,11,45),(3,'An emotional rollercoaster, highly recommend!',4.70,5,32),(4,'A fantastic film with brilliant acting!',4.60,19,59),(5,'Not what I expected, but it had some good moments.',3.50,12,101),(6,'An epic adventure from start to finish!',4.90,27,64),(7,'A solid film, but the pacing was off at times.',3.70,14,22),(8,'One of the best movies I\'ve seen in years!',4.80,31,19),(9,'Interesting storyline but a little slow.',3.60,3,73),(10,'A thrilling experience with a great soundtrack!',4.40,22,46),(11,'An enjoyable movie with a unique premise.',4.30,47,78),(12,'It could have been better, but overall it\'s decent.',3.80,8,51),(13,'Loved the chemistry between the characters.',4.70,36,9),(14,'Some scenes were unnecessary, but the rest was fine.',3.60,42,99),(15,'One of my all-time favorites!',4.90,21,102),(16,'A great family movie with lots of fun!',4.60,9,105),(17,'Very touching and heartwarming.',4.20,18,33),(18,'Not as good as the original, but still worth watching.',3.70,29,12),(19,'The special effects were incredible!',4.80,41,103),(20,'The dialogue was a bit cheesy, but overall a good film.',3.90,24,18),(21,'A well-crafted movie with a compelling storyline.',4.50,13,36),(22,'The performances were outstanding!',4.70,48,89),(23,'It had some plot holes, but the action was superb.',3.80,15,53),(24,'A classic that never gets old!',4.90,39,71),(25,'A bit predictable, but still entertaining.',3.60,10,77),(26,'An absolute masterpiece!',4.80,6,93),(27,'The cinematography was stunning!',4.40,35,95),(28,'Good, but not great. Needed more character development.',3.70,16,104),(29,'A fun movie with a great cast.',4.50,28,55),(30,'A beautiful film with breathtaking scenery.',4.90,25,48),(31,'Too many cliches, but it was okay.',3.80,37,24),(32,'A unique take on a classic story.',4.70,49,72),(33,'The action sequences were well-done!',4.60,7,106),(34,'It was too long and dragged in places.',3.70,20,35),(35,'A must-watch for fans of the genre.',4.90,32,100),(36,'A delightful film with a charming story.',4.50,44,26),(37,'A suspenseful and thrilling experience.',4.80,50,68),(38,'An interesting movie, but the ending was weak.',3.70,17,83),(39,'An absolute joy to watch!',4.60,38,91),(40,'Not my cup of tea, but some might like it.',3.60,4,31),(41,'An exciting and engaging film!',4.80,26,40),(42,'It was okay, but not great.',3.50,11,107),(43,'A nostalgic movie that brings back memories.',4.70,30,15),(44,'A unique and thought-provoking film.',4.50,23,47),(45,'An action-packed movie with a great plot.',4.70,33,63),(46,'The acting was a bit stiff, but overall it\'s good.',3.80,45,72),(47,'A compelling story with unexpected twists.',4.90,47,27),(48,'Some scenes were too graphic for me.',3.50,36,19),(49,'A fantastic adaptation of a classic book!',4.80,27,21),(50,'A dark and gritty movie that keeps you on the edge.',4.60,19,104),(51,'A bit slow to start, but it picked up later.',3.80,21,14),(52,'A hilarious comedy with great performances!',4.50,10,25),(53,'An emotional and touching story.',4.90,16,12),(54,'It could have been shorter, but overall it\'s good.',3.60,49,37),(55,'A fantastic musical with catchy songs!',4.70,42,79),(56,'A unique perspective on a well-known event.',4.80,48,59),(57,'The chemistry between the leads was amazing!',4.70,13,45),(58,'A great movie for a weekend night!',4.50,29,7),(59,'A visually stunning film with great CGI.',4.60,38,94),(60,'The humor was hit and miss, but overall it\'s enjoyable.',3.80,22,81),(61,'A compelling story with a powerful message.',4.90,35,93),(62,'A bit too much violence for my taste.',3.60,7,49),(63,'An adventurous film with lots of action.',4.70,32,89),(64,'A unique take on a familiar genre.',4.40,17,68),(65,'It had potential, but it fell short in some areas.',3.60,19,78),(66,'An intense thriller with a surprising twist!',4.90,24,102),(67,'Some scenes were too slow, but the rest was fine.',3.70,8,107),(68,'A visually captivating film with great direction.',4.80,47,21),(69,'A beautiful story with a happy ending.',4.60,25,35),(70,'It had some good moments, but it was overall mediocre.',3.60,20,53),(71,'An intense and gripping movie.',4.80,33,100),(72,'Too many plot holes, but it was still fun.',3.70,16,43),(73,'A captivating movie with great performances!',4.70,26,85),(74,'The characters were well-developed.',4.60,49,72),(75,'An engaging story with a memorable soundtrack.',4.70,13,95),(76,'A well-executed film with a compelling narrative.',4.90,35,45),(77,'The special effects were fantastic!',4.70,28,50),(78,'An interesting movie with great acting.',4.50,39,47),(79,'A fun and entertaining movie.',4.60,50,72),(80,'A visually pleasing movie with great sets.',4.70,38,107),(81,'Some scenes could have been shorter.',3.50,3,29),(82,'An emotional journey with a strong message.',4.80,19,19),(83,'It was good, but not great.',3.80,7,14),(84,'An action-packed film with great stunts!',4.60,22,69),(85,'A delightful film with an engaging story.',4.70,35,33),(86,'It was funny, but some jokes fell flat.',3.60,20,102),(87,'A heartwarming story with a touching message.',4.90,41,103),(88,'An enjoyable movie with a great cast.',4.50,12,77),(89,'A suspenseful and thrilling ride!',4.70,48,85),(90,'A movie with a lot of heart.',4.60,26,39),(91,'An entertaining movie with great performances.',4.70,31,106),(92,'Some scenes were unnecessary, but overall it\'s good.',3.70,27,51),(93,'A captivating story with great acting.',4.80,49,64),(94,'A bit too long, but still worth watching.',3.60,14,44),(95,'A delightful movie with great chemistry between the leads.',4.90,32,102),(96,'An emotional and touching story.',4.50,33,85),(97,'It was good, but could have been better.',3.60,27,49),(98,'A captivating film with excellent visuals.',4.80,50,78),(99,'A bit too predictable, but still enjoyable.',3.50,22,95),(100,'An intense and suspenseful movie.',4.70,7,103),(101,'A fun movie with a great plot.',4.60,26,67),(102,'Some scenes were too graphic for my taste.',3.60,17,81),(103,'An enjoyable film with great characters.',4.80,38,26),(104,'The special effects were stunning!',4.70,13,97),(105,'The humor was a bit forced, but overall it\'s enjoyable.',3.80,16,107),(106,'An engaging movie with great acting.',4.70,29,33),(107,'An interesting movie with unique visuals.',4.60,20,72),(108,'A suspenseful and thrilling ride!',4.80,24,45),(109,'An adventurous movie with great action sequences.',4.50,21,85),(110,'A unique perspective on a classic story.',4.80,15,105),(111,'It could have been shorter, but overall it\'s good.',3.60,42,39),(112,'An intense thriller with unexpected twists.',4.70,48,89),(113,'Some scenes were a bit too long.',3.60,11,43),(114,'A compelling story with a strong message.',4.90,35,100),(115,'An adventurous movie with great performances.',4.60,26,21),(116,'An enjoyable film with a great cast.',4.70,29,47),(117,'A unique take on a classic genre.',4.60,38,105),(118,'Some scenes were too graphic, but overall it\'s good.',3.50,14,83),(119,'An emotional story with great character development.',4.90,17,49),(120,'A fun movie with a great cast.',4.50,26,89),(121,'A visually stunning film with great CGI.',4.60,32,107),(122,'An enjoyable movie with great performances.',4.70,49,97),(123,'Some scenes were too slow, but overall it\'s good.',3.70,18,55),(124,'A captivating story with a memorable soundtrack.',4.90,38,45),(125,'An interesting movie with unexpected twists.',4.70,33,48),(126,'A well-crafted film with excellent direction.',4.80,35,103),(127,'An emotional movie with great performances.',4.60,19,29),(128,'Some scenes could have been better, but overall it\'s decent.',3.50,17,63),(129,'An action-packed film with great visuals!',4.70,13,72),(130,'A heartwarming movie with a powerful message.',4.50,29,99),(131,'A suspenseful and thrilling ride!',4.70,48,19),(132,'An engaging movie with a great cast.',4.80,21,102),(133,'A fun movie with great chemistry between the leads.',4.60,26,88),(134,'An intense movie with unexpected twists.',4.80,33,105),(135,'An interesting movie with unique characters.',4.60,18,85),(136,'It was okay, but not great.',3.50,17,35),(137,'A fun and entertaining movie.',4.80,38,39),(138,'Some scenes were too slow, but the rest was fine.',3.70,22,73),(139,'An enjoyable movie with great acting.',4.70,49,81),(140,'An intense thriller with great performances!',4.90,35,47),(141,'Some scenes could have been better, but overall it\'s good.',3.60,17,32),(142,'An action-packed movie with lots of twists.',4.80,33,55),(143,'An adventurous movie with great stunts!',4.60,38,72),(144,'An emotional and touching story.',4.70,49,89),(145,'Some scenes were too long, but overall it\'s good.',3.50,11,33),(146,'An engaging movie with great characters.',4.80,24,17),(147,'A captivating story with a powerful message.',4.70,29,21),(148,'An intense and suspenseful movie!',4.90,48,72),(149,'An action-packed film with great visuals.',4.60,35,64),(150,'A fun movie with a great soundtrack!',4.80,38,45),(151,'An engaging movie with excellent performances.',4.70,13,85),(152,'A compelling story with strong character development.',4.80,21,33),(153,'An adventurous movie with lots of action!',4.50,26,105),(154,'An emotional movie with great performances!',4.60,31,17),(155,'Some scenes could have been better, but overall it\'s decent.',3.70,7,21),(156,'An engaging movie with a memorable soundtrack!',4.80,49,59),(157,'A well-crafted movie with excellent direction.',4.60,17,89),(158,'An adventurous film with a great cast!',4.70,48,102),(159,'An intense movie with a unique twist!',4.90,35,85),(160,'An enjoyable movie with great performances!',4.70,26,55),(161,'A unique take on a classic story!',4.60,33,105),(162,'Some scenes could have been better, but overall it\'s good!',3.50,20,17),(163,'An engaging movie with a great plot!',4.70,17,107),(164,'An intense and suspenseful film!',4.80,48,25),(165,'An adventurous movie with a great plot!',4.60,38,81),(166,'An enjoyable movie with great performances!',4.70,49,72),(167,'An interesting movie with unique characters!',4.50,13,89),(168,'An adventurous movie with a great cast!',4.80,26,105),(169,'Some scenes could have been better, but overall it\'s good!',3.60,35,27),(170,'An intense movie with unexpected twists!',4.70,48,45),(171,'An engaging movie with great characters!',4.80,33,41),(172,'A compelling story with a unique twist!',4.60,17,93),(173,'An enjoyable movie with a great soundtrack!',4.70,49,78),(174,'Some scenes could have been better, but overall it\'s decent!',3.50,17,43),(175,'An action-packed movie with great visuals!',4.80,38,105),(176,'An adventurous movie with a great plot!',4.60,26,72),(177,'An engaging movie with excellent performances!',4.70,29,59),(178,'An interesting movie with a unique premise!',4.60,33,27),(179,'An adventurous film with great stunts!',4.70,48,89),(180,'An intense and suspenseful movie!',4.70,35,45),(181,'An engaging movie with great performances!',4.80,26,72),(182,'Some scenes could have been better, but overall it\'s good!',3.70,33,105),(183,'An intense movie with great performances!',4.90,49,21),(184,'A compelling story with a powerful message!',4.70,38,103),(185,'An adventurous movie with a great plot!',4.80,21,43),(186,'An engaging film with strong character development!',4.60,26,21),(187,'An interesting movie with unique visuals!',4.70,13,87),(188,'An adventurous movie with great performances!',4.80,33,17),(189,'A captivating story with strong character development!',4.70,48,78),(190,'An intense movie with great performances!',4.90,35,55),(191,'An enjoyable movie with great characters!',4.60,26,89),(192,'Some scenes were too graphic for my taste!',3.70,11,21),(193,'An engaging movie with excellent performances!',4.80,48,27),(194,'A suspenseful and thrilling movie!',4.70,29,103),(195,'An intense movie with a unique twist!',4.80,33,107),(196,'An adventurous movie with great visuals!',4.70,35,81);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'john_doe1','john_doe1@gmail.com','aSd12!34'),(2,'jane_smith1','jane_smith1@aol.com','Zxcv56!78'),(3,'bob_jones1','bob_jones1@yahoo.com','QwEr78!90'),(4,'alice_johnson1','alice_johnson1@hotmail.com','TyUi12!34'),(5,'michael_brown1','michael_brown1@outlook.com','HgFe56!78'),(6,'susan_wilson1','susan_wilson1@gmail.com','PoYu78!90'),(7,'james_martin1','james_martin1@aol.com','QwEr12!34'),(8,'linda_moore1','linda_moore1@yahoo.com','Zxcv56!78'),(9,'robert_taylor1','robert_taylor1@hotmail.com','AsDf78!90'),(10,'emma_anderson1','emma_anderson1@outlook.com','TyUi12!34'),(11,'william_lee1','william_lee1@gmail.com','HgFe56!78'),(12,'olivia_jackson1','olivia_jackson1@aol.com','PoYu78!90'),(13,'ethan_white1','ethan_white1@yahoo.com','QwEr12!34'),(14,'chloe_walker1','chloe_walker1@hotmail.com','Zxcv56!78'),(15,'daniel_hall1','daniel_hall1@outlook.com','AsDf78!90'),(16,'sophia_harris1','sophia_harris1@gmail.com','TyUi12!34'),(17,'benjamin_clark1','benjamin_clark1@aol.com','HgFe56!78'),(18,'mia_rodriguez1','mia_rodriguez1@yahoo.com','PoYu78!90'),(19,'liam_scott1','liam_scott1@hotmail.com','QwEr12!34'),(20,'isabella_thompson1','isabella_thompson1@outlook.com','Zxcv56!78'),(21,'elijah_jones1','elijah_jones1@gmail.com','AsDf78!90'),(22,'amelia_king1','amelia_king1@aol.com','TyUi12!34'),(23,'lucas_moore1','lucas_moore1@yahoo.com','HgFe56!78'),(24,'sophia_garcia1','sophia_garcia1@hotmail.com','PoYu78!90'),(25,'emma_miller1','emma_miller1@outlook.com','QwEr12!34'),(26,'olivia_martinez1','olivia_martinez1@gmail.com','Zxcv56!78'),(27,'joshua_williams1','joshua_williams1@aol.com','AsDf78!90'),(28,'sarah_lee1','sarah_lee1@yahoo.com','TyUi12!34'),(29,'matthew_brown1','matthew_brown1@hotmail.com','HgFe56!78'),(30,'joseph_johnson1','joseph_johnson1@outlook.com','PoYu78!90'),(31,'liam_smith1','liam_smith1@gmail.com','QwEr12!34'),(32,'madison_anderson1','madison_anderson1@aol.com','Zxcv56!78'),(33,'alexander_hall1','alexander_hall1@yahoo.com','AsDf78!90'),(34,'ava_jackson1','ava_jackson1@hotmail.com','TyUi12!34'),(35,'noah_clark1','noah_clark1@outlook.com','HgFe56!78'),(36,'samantha_miller1','samantha_miller1@gmail.com','PoYu78!90'),(37,'jacob_taylor1','jacob_taylor1@aol.com','QwEr12!34'),(38,'mia_white1','mia_white1@yahoo.com','Zxcv56!78'),(39,'lucas_jones1','lucas_jones1@hotmail.com','AsDf78!90'),(40,'emily_scott1','emily_scott1@outlook.com','TyUi12!34'),(41,'ryan_martin1','ryan_martin1@gmail.com','HgFe56!78'),(42,'jackson_wilson1','jackson_wilson1@aol.com','PoYu78!90'),(43,'madison_king1','madison_king1@yahoo.com','QwEr12!34'),(44,'zoe_hall1','zoe_hall1@hotmail.com','Zxcv56!78'),(45,'jacob_rodriguez1','jacob_rodriguez1@outlook.com','AsDf78!90'),(46,'ava_brown1','ava_brown1@gmail.com','TyUi12!34'),(47,'isabella_miller1','isabella_miller1@aol.com','HgFe56!78'),(48,'emily_martin1','emily_martin1@yahoo.com','PoYu78!90'),(49,'noah_lee1','noah_lee1@hotmail.com','QwEr12!34'),(50,'elijah_martinez1','elijah_martinez1@outlook.com','Zxcv56!78'),(51,'amelia_white1','amelia_white1@gmail.com','AsDf78!90');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_movies`
--

DROP TABLE IF EXISTS `user_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_movies` (
  `user_id` int NOT NULL,
  `movies_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`movies_id`),
  KEY `fk_user_has_movies_movies1_idx` (`movies_id`),
  KEY `fk_user_has_movies_user_idx` (`user_id`),
  CONSTRAINT `fk_user_has_movies_movies1` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`movies_id`),
  CONSTRAINT `fk_user_has_movies_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_movies`
--

LOCK TABLES `user_movies` WRITE;
/*!40000 ALTER TABLE `user_movies` DISABLE KEYS */;
INSERT INTO `user_movies` VALUES (35,1),(2,2),(50,3),(17,4),(9,6),(8,7),(47,8),(38,10),(22,11),(31,12),(50,13),(43,14),(7,15),(46,16),(3,17),(17,18),(16,19),(25,20),(45,21),(27,22),(46,23),(14,24),(26,25),(7,26),(12,27),(34,28),(8,29),(37,30),(35,31),(19,32),(30,33),(11,35),(37,36),(32,37),(13,38),(51,39),(49,40),(12,41),(25,42),(20,43),(18,44),(44,46),(2,48),(27,49),(3,50),(5,51),(19,52),(32,53),(26,54),(4,55),(23,56),(11,59),(36,60),(16,62),(48,63),(29,64),(40,65),(29,67),(21,68),(33,69),(40,70),(10,71),(10,72),(31,73),(47,74),(23,75),(45,76),(6,77),(41,78),(28,79),(21,80),(13,81),(14,82),(49,83),(28,84),(1,85),(39,86),(1,87),(39,88),(33,89),(44,90),(24,91),(34,92),(42,93),(43,94),(15,95),(30,97),(9,98),(48,99),(5,100),(20,101),(4,102),(24,103),(6,104),(15,105),(31,105),(38,105),(25,106),(36,107);
/*!40000 ALTER TABLE `user_movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-10 20:40:31
