DROP TABLE IF EXISTS student;
CREATE TABLE student (
	id varchar(10) PRIMARY KEY,
	fname varchar(10) NOT NULL,
	lname varchar(10) NOT NULL,
	age double NOT NULL,
	city varchar(10)  NOT NULL,
	password varchar(20) NOT NULL
	);