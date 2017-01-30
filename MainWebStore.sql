CREATE DATABASE Webstore;

DROP DATABASE Webstore;

USE Webstore;

CREATE TABLE Customer (
  CustomerID INT NOT NULL PRIMARY KEY,
  FirstName  VARCHAR(50) DEFAULT NULL,
  Surname    VARCHAR(50) DEFAULT NULL,
  City       VARCHAR(50) DEFAULT NULL
);

CREATE TABLE Product (

  SKU          INT NOT NULL PRIMARY KEY,
  CategoryID   INT NOT NULL,
  Manufacturer VARCHAR(50),
  Name         VARCHAR(50),
  Size         VARCHAR(5),
  Category     VARCHAR(50),
  Price        DOUBLE

);

CREATE TABLE Category (
  CategoryID   INT NOT NULL PRIMARY KEY,
  CategoryName VARCHAR(50)
);

CREATE TABLE OutOfStock (

  SKU  INT NOT NULL PRIMARY KEY,
  Date DATE

);

CREATE TABLE Inventory (

  SKU          INT NOT NULL PRIMARY KEY,
  Manufacturer VARCHAR(50),
  Stock        SMALLINT

);

CREATE TABLE ProductCategory (

  CategoryID INT NOT NULL,
  SKU        INT NOT NULL,

  PRIMARY KEY (CategoryID, SKU)

);

CREATE TABLE OrderProducts (

  OrderID INT NOT NULL,
  SKU     INT NOT NULL,

  PRIMARY KEY (OrderID, SKU)

);


CREATE TABLE `Order` (

  OrderID    INT NOT NULL AUTO_INCREMENT,
  CustomerID INT NOT NULL,
  SKU        INT NOT NULL,
  `Date`     DATE,
  Quantity   TINYINT,
  PRIMARY KEY (OrderID),
  FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
);
