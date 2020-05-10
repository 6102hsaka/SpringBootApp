DROP TABLE IF EXISTS student;
CREATE TABLE student (
	id varchar(10) PRIMARY KEY,
	fname varchar(10) NOT NULL,
	lname varchar(10) NOT NULL,
	age double NOT NULL,
	gender varchar(10) NOT NULL,
	city int  NOT NULL,
	password varchar(20) NOT NULL
);

DROP TABLE IF EXISTS country;
CREATE TABLE country(
	country_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	country_name VARCHAR(20)
);

DROP TABLE IF EXISTS state;
CREATE TABLE state(
	state_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	state_name VARCHAR(20),
	state_country_id int,
	FOREIGN KEY (state_country_id) REFERENCES country(country_id)
);

DROP TABLE IF EXISTS city;
CREATE TABLE city(
	city_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	city_name VARCHAR(20),
	city_state_id int,
	FOREIGN KEY (city_state_id) REFERENCES state(state_id)
);