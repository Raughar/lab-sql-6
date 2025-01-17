use sakila;
-- Creating a new table
drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

-- Adding the data from the CSV file:
load data infile 'C:/Users/Samu/Documents/Ironhack/lab-sql-6/files_for_lab/films_2020.csv' 
into table films_2020
fields terminated by ',';

-- It gives an error so will try to solve it:
show variables like 'local_infile';
set global local_infile = 1; -- But in the end it is not possible to load the data, so will use the data import wizard.

-- Updating the values for the new rental duration, rate and replacement cost for 2020:
update films_2020
set rental_duration = 3,
    rental_rate = 2.99,
    replacement_cost = 8.99;
    
select * from films_2020;