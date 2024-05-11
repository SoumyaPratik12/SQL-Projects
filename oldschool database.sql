-- Create database
CREATE DATABASE IF NOT EXISTS library_db;

-- Use the database
USE library_db;

-- Create tables
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Authors (name) VALUES ('J.K. Rowling');
INSERT INTO Authors (name) VALUES ('George Orwell');

SHOW TABLES;

CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    ISBN VARCHAR(20),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

INSERT INTO Books (title, author_id, ISBN) VALUES ('Harry Potter', 1, '9780545069670');
INSERT INTO Books (title, author_id, ISBN) VALUES ('1984', 2, '9780451524935');

SHOW TABLES;

CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

INSERT INTO Users (name, email) VALUES ('Alice', 'alice@example.com');
INSERT INTO Users (name, email) VALUES ('Bob', 'bob@example.com');

SHOW TABLES;

CREATE TABLE IF NOT EXISTS Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
INSERT INTO Loans (user_id, book_id, loan_date, return_date) VALUES (1, 1, '2024-04-01', '2024-04-15');
INSERT INTO Loans (user_id, book_id, loan_date, return_date) VALUES (2, 2, '2024-03-20', '2024-04-10');

SHOW TABLES;