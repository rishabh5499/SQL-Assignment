CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);


-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL UNIQUE,
    CategoryID INT,
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);


-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    JoinDate DATE
);


-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-- Insert Categories
INSERT INTO Categories VALUES
(1,'Electronics'),
(2,'Books'),
(3,'Home Goods'),
(4,'Apparel');


-- Insert Products
INSERT INTO Products VALUES
(101,'Laptop Pro',1,1200.00,50),
(102,'SQL Handbook',2,45.50,200),
(103,'Smart Speaker',1,99.99,150),
(104,'Coffee Maker',3,75.00,80),
(105,'Novel : The Great SQL',2,25.00,120),
(106,'Wireless Earbuds',1,150.00,100),
(107,'Blender X',3,120.00,60),
(108,'T-Shirt Casual',4,20.00,300);


-- Insert Customers
INSERT INTO Customers VALUES
(1,'Alice Wonderland','alice@example.com','2023-01-10'),
(2,'Bob the Builder','bob@example.com','2022-11-25'),
(3,'Charlie Chaplin','charlie@example.com','2023-03-01'),
(4,'Diana Prince','diana@example.com','2021-04-26');


-- Insert Orders
INSERT INTO Orders VALUES
(1001,1,'2023-04-26',1245.50),
(1002,2,'2023-10-12',99.99),
(1003,1,'2023-07-01',145.00),
(1004,3,'2023-01-14',150.00),
(1005,2,'2023-09-24',120.00),
(1006,1,'2023-06-19',20.00);