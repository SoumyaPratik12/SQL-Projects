CREATE DATABASE CRM;

USE CRM;

-- Create table for customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

-- Create table for customer interactions
CREATE TABLE Interactions (
    InteractionID INT PRIMARY KEY,
    CustomerID INT,
    InteractionDate DATE,
    InteractionType VARCHAR(50),
    Notes TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create table for leads
CREATE TABLE Leads (
    LeadID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Source VARCHAR(100),
    Status VARCHAR(50)
);

-- Create table for sales
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    SaleDate DATE,
    Product VARCHAR(100),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Inserting sample data into the Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES 
    (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '456-789-0123', '456 Elm St'),
    (3, 'Alice', 'Johnson', 'alice.johnson@example.com', '789-012-3456', '789 Oak St'),
	(4, 'Emily', 'Wilson', 'emily.wilson@example.com', '678-901-2345', '123 Pine St'),
    (5, 'Daniel', 'Taylor', 'daniel.taylor@example.com', '789-012-3456', '456 Maple St'),
    (6, 'Sophia', 'Anderson', 'sophia.anderson@example.com', '890-123-4567', '789 Cedar St');
    
-- Inserting sample data into the Interactions table
INSERT INTO Interactions (InteractionID, CustomerID, InteractionDate, InteractionType, Notes)
VALUES 
    (1, 1, '2024-04-01', 'Phone Call', 'Discussed product features.'),
    (2, 2, '2024-04-02', 'Email', 'Sent follow-up information.'),
    (3, 3, '2024-04-03', 'Meeting', 'Demoed our services.'),
    (4, 4, '2024-04-12', 'Meeting', 'Discussed project requirements.'),
    (5, 5, '2024-04-15', 'Phone Call', 'Answered product inquiries.'),
    (6, 6, '2024-04-18', 'Email', 'Sent quotation.');
    
-- Inserting sample data into the Leads table
INSERT INTO Leads (LeadID, FirstName, LastName, Email, Phone, Source, Status)
VALUES 
    (1, 'Michael', 'Brown', 'michael.brown@example.com', '234-567-8901', 'Referral', 'Contacted'),
    (2, 'Emily', 'Davis', 'emily.davis@example.com', '345-678-9012', 'Website', 'New'),
    (3, 'David', 'Martinez', 'david.martinez@example.com', '567-890-1234', 'Event', 'Qualified'),
	(4, 'Olivia', 'Moore', 'olivia.moore@example.com', '901-234-5678', 'Advertisement', 'Contacted'),
    (5, 'William', 'Jackson', 'william.jackson@example.com', '012-345-6789', 'Referral', 'New'),
    (6, 'Ava', 'White', 'ava.white@example.com', '123-456-7890', 'Website', 'Qualified');
    
-- Inserting sample data into the Sales table
INSERT INTO Sales (SaleID, CustomerID, SaleDate, Product, Amount)
VALUES 
    (1, 1, '2024-04-05', 'Product A', 100.00),
    (2, 2, '2024-04-07', 'Product B', 150.00),
    (3, 3, '2024-04-10', 'Product C', 200.00),
    (4, 4, '2024-04-20', 'Product A', 100.00),
    (5, 5, '2024-04-22', 'Product B', 150.00),
    (6, 6, '2024-04-25', 'Product C', 200.00);

DESCRIBE TABLE INTERACTIONS;

SELECT * FROM Interactions;

SELECT Interactions.InteractionID, Customers.FirstName, Customers.LastName, Interactions.InteractionDate, Interactions.InteractionType, Interactions.Notes
FROM Interactions
LEFT JOIN Customers ON Interactions.CustomerID = Customers.CustomerID;

SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Email, Customers.Phone, Customers.Address,
       Interactions.InteractionID, Interactions.InteractionDate, Interactions.InteractionType, Interactions.Notes
FROM Customers
LEFT JOIN Interactions ON Customers.CustomerID = Interactions.CustomerID;

SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Email, Customers.Phone, Customers.Address,
       Interactions.InteractionID, Interactions.InteractionDate, Interactions.InteractionType, Interactions.Notes
FROM Customers
CROSS JOIN Interactions;

SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Email, Customers.Phone, Customers.Address,
       Sales.SaleID, Sales.SaleDate, Sales.Product, Sales.Amount
FROM Customers
JOIN Sales ON Customers.CustomerID = Sales.CustomerID;

SELECT NOW();

SELECT DATE();

SELECT ascii('t');
