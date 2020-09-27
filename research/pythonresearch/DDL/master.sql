------- SCHEMA GOAL_REMINDER--------

CREATE SCHEMA IF NOT EXISTS goalreminder;

USE goalreminder;

------- TABLE USER--------

CREATE TABLE IF NOT EXISTS `goalreminder`.`user` (
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`username`));

  INSERT INTO `goalreminder`.`user` (`username`, `password`, `name`) VALUES ('subhojit.india@gmail.com', 'password', 'Subhojit');

------- TABLE GOAL--------

CREATE TABLE IF NOT EXISTS `goal` (
   `id` int NOT NULL,
   `username` varchar(255) NOT NULL,
   `description` varchar(255) NOT NULL,
   `createdAt` timestamp NOT NULL,
   `updateAt` timestamp NULL DEFAULT NULL,
   `target` timestamp NOT NULL,
   `goaltype` int DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `goaltype_idx` (`goaltype`),
   KEY `useridfk` (`username`),
   CONSTRAINT `goaltypeidfk` FOREIGN KEY (`goaltype`) REFERENCES `goaltype` (`id`),
   CONSTRAINT `useridfk` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
 );


INSERT INTO `goalreminder`.`goal` (`id`, `username`, `description`, `createdAt`, `updateAt`, `target`, `goaltype`)
VALUES ('1', 'subhojit.india@gmail.com', 'Test', '2019-09-27 16:00:00', '2019-09-27 16:00:00', '2019-09-27 16:00:00', '1');

------- TABLE GOALTYPE--------

CREATE TABLE IF NOT EXISTS `goalreminder`.`goaltype` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);

INSERT INTO `reminder`.`goaltype` (`id`, `name`) VALUES ('1', 'Short Term Goal');
INSERT INTO `reminder`.`goaltype` (`id`, `name`) VALUES ('2', 'Long Term Goal');


------- TABLE DAILYFEED--------

CREATE TABLE IF NOT EXISTS `dailyfeed` (
   `id` int NOT NULL,
   `username` varchar(255) NOT NULL,
   `goal_id` int NOT NULL,
   `description` varchar(255) DEFAULT NULL,
   `completed_time` timestamp NOT NULL,
   PRIMARY KEY (`id`),
   KEY `username_idx` (`username`),
   KEY `goal_id_idx` (`goal_id`),
   CONSTRAINT `goal_idfk` FOREIGN KEY (`goal_id`) REFERENCES `goal` (`id`),
   CONSTRAINT `usernamefk` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
 );