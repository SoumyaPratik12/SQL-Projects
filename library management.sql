create database library_demo;

show databases;

use library_demo;

CREATE TABLE readers
	(
		reader_id VARCHAR(6),
        fname VARCHAR(30),
        lname VARCHAR(30),
        ltname VARCHAR(30),
        city VARCHAR(15),
        mobileno VARCHAR(10),
        occupation VARCHAR(10),
        dob DATE,
        CONSTRAINT readers_pk PRIMARY KEY (reader_id)
	);
    
INSERT INTO readers VALUES (1, 'John', 'Doe', 'Smith', 'New York', '1234567890', 'Engineer', '1990-05-15');
INSERT INTO readers VALUES (2, 'Jane', 'Smith', 'Johnson', 'Los Angeles', '9876543210', 'Teacher', '1985-08-20');
INSERT INTO readers VALUES (3, 'Michael', 'Brown', 'Williams', 'Chicago', '5551234567', 'Doctor', '1978-03-10');
INSERT INTO readers VALUES (4, 'Emily', 'Johnson', 'Miller', 'Houston', '1112223333', 'Lawyer', '1995-11-25');
INSERT INTO readers VALUES (5, 'David', 'Davis', 'Jones', 'Phoenix', '9998887777', 'Artist', '1982-09-30');
INSERT INTO readers VALUES (6, 'Sarah', 'Wilson', 'Taylor', 'Philadelphia', '4445556666', 'Nurse', '1992-07-18');
INSERT INTO readers VALUES (7, 'Matthew', 'Anderson', 'Brown', 'San Antonio', '7778889999', 'Software Developer', '1987-01-05');
INSERT INTO readers VALUES (8, 'Jessica', 'Martinez', 'Garcia', 'San Diego', '2223334444', 'Chef', '1980-06-22');
INSERT INTO readers VALUES (9, 'Andrew', 'Lee', 'Hernandez', 'Dallas', '6667778888', 'Architect', '1975-12-12');
INSERT INTO readers VALUES (10, 'Elizabeth', 'Perez', 'Rodriguez', 'Miami', '3334445555', 'Entrepreneur', '1998-04-08');

SELECT * FROM readers;

DROP TABLE readers;

CREATE TABLE book(
	bid VARCHAR(6),
    bname VARCHAR(50),
    bdomain VARCHAR(50),
    CONSTRAINT book_bid_pk PRIMARY KEY(bid)
);

INSERT INTO book VALUES('B1','The Cat In The Hat','Story');
INSERT INTO book VALUES('B2','Charlie And The Chocolate Factory','Story');
INSERT INTO book VALUES('B3','The Hungry Caterpillar','Story');

SELECT * FROM book;

CREATE TABLE active_readers
	(
		account_id VARCHAR(6),
		reader_id VARCHAR(6),
		bid VARCHAR(6),
		atype VARCHAR(10),
		astatus VARCHAR(10),
		CONSTRAINT activereaders_acnumber_pk PRIMARY KEY (account_id),
        CONSTRAINT account_readerid_fk FOREIGN KEY(reader_id) REFERENCES readers(reader_id),
        CONSTRAINT FOREIGN KEY(bid) REFERENCES book(bid)
	);
    
SELECT * FROM active_readers;