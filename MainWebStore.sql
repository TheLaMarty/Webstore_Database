CREATE DATABASE Webstore;

USE Webstore;

CREATE TABLE Customer (
  CustomerID INT NOT NULL PRIMARY KEY,
  FirstName  VARCHAR(50) DEFAULT NULL,
  Surname    VARCHAR(50) DEFAULT NULL,
  City       VARCHAR(50) DEFAULT NULL

);

CREATE TABLE Category (
  CategoryID   INT NOT NULL AUTO_INCREMENT,
  CategoryName VARCHAR(50),

  PRIMARY KEY (CategoryID, CategoryName)
);

CREATE TABLE ProductCategory (

  ID         INT NOT NULL,
  CategoryID INT NOT NULL,

  PRIMARY KEY (ID, CategoryID),
  FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID)

);

CREATE TABLE Product (

  SKU               INT    NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ProductCategoryID INT    NOT NULL,
  Manufacturer      VARCHAR(50),
  Name              VARCHAR(50),
  Size              VARCHAR(5),
  Price             DOUBLE NOT NULL,

  FOREIGN KEY (ProductCategoryID) REFERENCES ProductCategory (ID)

);

CREATE TABLE OutOfStock (

  SKU  INT NOT NULL PRIMARY KEY,
  Date DATE,

  FOREIGN KEY (SKU) REFERENCES Product (SKU)

);

CREATE TABLE Inventory (

  SKU          INT NOT NULL PRIMARY KEY,
  Manufacturer VARCHAR(50),
  Stock        SMALLINT,

  FOREIGN KEY (SKU) REFERENCES Product (SKU)

);

CREATE TABLE OrderProducts (

  OrderID INT NOT NULL,
  SKU     INT NOT NULL,

  PRIMARY KEY (OrderID, SKU),
  FOREIGN KEY (OrderID) REFERENCES `Order` (OrderID),
  FOREIGN KEY (SKU) REFERENCES Product (SKU)

);


CREATE TABLE `Order` (

  OrderID    INT NOT NULL AUTO_INCREMENT,
  CustomerID INT NOT NULL,
  SKU        INT NOT NULL,
  `Date`     DATE,
  Quantity   TINYINT,
  PRIMARY KEY (OrderID),
  FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
  FOREIGN KEY (SKU) REFERENCES Product (SKU)

);

