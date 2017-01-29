CREATE DATABASE Webstore;

DROP DATABASE Webstore;

USE Webstore;

CREATE TABLE Customer (
  CustomerID CHAR(10) PRIMARY KEY,
  FirstName  VARCHAR(50) DEFAULT NULL,
  Surname    VARCHAR(50) DEFAULT NULL,
  City       VARCHAR(50) DEFAULT NULL
);

CREATE TABLE Order (
  'OrderNumber' CHAR(20) PRIMARY KEY,
  'SKU'         CHAR(15),
  'Quantity'    TINYINT,
  'OrderValue'  INT,
  'Date'        DATE
);

CREATE TABLE Product (

  SKU          CHAR(15) PRIMARY KEY,
  Manufacturer VARCHAR(50),
  Name         VARCHAR(50),
  Size         VARCHAR(5),
  Category     VARCHAR(50),
  Price        CHAR(5)

);

CREATE TABLE Category (
  CategoryID   CHAR(15) PRIMARY KEY,
  CategoryName VARCHAR(50)
);

CREATE TABLE OutOfStock (

  SKU  CHAR(15) PRIMARY KEY,
  Date DATE

);

CREATE TABLE Inventory (

  SKU          CHAR(15) PRIMARY KEY,
  Manufacturer VARCHAR(50),
  Stock        SMALLINT


);