CREATE DATABASE Webstore;

USE Webstore;

CREATE TABLE `Customer` (
  `CustomerID` char(10) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL
)
  
  