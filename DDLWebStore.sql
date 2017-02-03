-- DDL

DROP DATABASE IF EXISTS Webstore;

CREATE DATABASE Webstore;

USE Webstore;

CREATE TABLE Customer (

  CustomerID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FirstName  VARCHAR(50) DEFAULT NULL,
  Surname    VARCHAR(50) DEFAULT NULL,
  City       VARCHAR(50) DEFAULT NULL

);

CREATE TABLE Product (

  ProductID         INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Manufacturer      VARCHAR(50),
  Name              VARCHAR(50)
);

CREATE TABLE Size (

  SizeID            INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Size              VARCHAR(5)

);

CREATE TABLE SKU (

  SKUID             INT NOT NULL AUTO_INCREMENT,
  ProductID         INT NOT NULL,
  SizeID            INT NOT NULL,
  Price             DOUBLE NOT NULL,

  PRIMARY KEY (SKUID, ProductID, SizeID),
  FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
  FOREIGN KEY (SizeID) REFERENCES Size (SizeID)
);

CREATE TABLE Category (

  CategoryID   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  CategoryName VARCHAR(50)

);

CREATE TABLE ProductCategory (

  ProductID        INT NOT NULL,
  CategoryID INT NOT NULL,

  PRIMARY KEY (ProductID, CategoryID),
  FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
  FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID)

);

CREATE TABLE `Order` (

  OrderID           INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  CustomerID        INT NOT NULL,
  Date              DATE,

  FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)

);

CREATE TABLE OrderProduct (

  OrderID           INT NOT NULL,
  SKUID               INT NOT NULL,
  Quantity          TINYINT,

  PRIMARY KEY (OrderID, SKUID),
  FOREIGN KEY (OrderID) REFERENCES `Order` (OrderID),
  FOREIGN KEY (SKUID) REFERENCES SKU (SKUID)

);

CREATE TABLE Inventory (

  SKUID             INT NOT NULL PRIMARY KEY,
  Stock             INT,

  FOREIGN KEY (SKUID) REFERENCES SKU (SKUID)

);

CREATE TABLE OutOfStock (

  SKUID             INT NOT NULL PRIMARY KEY,
  Date              DATE,

  FOREIGN KEY (SKUID) REFERENCES SKU (SKUID)

);

-- --------------- Customer ------------------------
INSERT INTO Customer (CustomerID, FirstName, Surname, City)
VALUES (1, 'Sundus', 'Abdulghani', 'Nyköping');

INSERT INTO Customer (CustomerID, FirstName, Surname, City)
VALUES (2, 'Narek', 'Mkrtchyan', 'Stockholm');

INSERT INTO Customer (CustomerID, FirstName, Surname, City)
VALUES (3, 'Elisabet', 'Holmberg', 'Boden');

INSERT INTO Customer (CustomerID, FirstName, Surname, City)
VALUES (4, 'Siv', 'Larsson', 'Lund');

INSERT INTO Customer (CustomerID, FirstName, Surname, City)
VALUES (5, 'Isabel', 'Franzen', 'Kalmar');

-- --------------- Product ------------------------
INSERT INTO Product (ProductID, Manufacturer, Name)
VALUES (1, 'Nudie', 'Magda');

INSERT INTO Product (ProductID, Manufacturer, Name)
VALUES (2, 'Tiger Of Sweden', 'W/S');

INSERT INTO Product (ProductID, Manufacturer, Name)
VALUES (3, 'HOPE-STHLM', 'STAY');

INSERT INTO Product (ProductID, Manufacturer, Name)
VALUES (4, 'Hunkydory', 'Le La Jean');

INSERT INTO Product (ProductID, Manufacturer, Name)
VALUES (5, 'Hunkydory', 'Eldon Jean');

-- --------------- Size ------------------------
INSERT INTO SIZE (SizeID, Size) VALUES (1, '32');
INSERT INTO SIZE (SizeID, Size) VALUES (2, '34');
INSERT INTO SIZE (SizeID, Size) VALUES (3, '36');
INSERT INTO SIZE (SizeID, Size) VALUES (4, '38');
INSERT INTO SIZE (SizeID, Size) VALUES (5, '40');

-- --------------- SKU ------------------------
INSERT INTO SKU (SKUID, ProductID, SizeID, Price)
VALUES (1, 1, 1, 2000);

INSERT INTO SKU (SKUID, ProductID, SizeID, Price)
VALUES (2, 1, 2, 2000);

INSERT INTO SKU (SKUID, ProductID, SizeID, Price)
VALUES (3, 1, 3, 2000);

INSERT INTO SKU (SKUID, ProductID, SizeID, Price)
VALUES (4, 2, 1, 1889);

INSERT INTO SKU (SKUID, ProductID, SizeID, Price)
VALUES (5, 3, 1, 2000);

INSERT INTO SKU (SKUID, ProductID, SizeID, Price)
VALUES (6, 1, 3, 1799);

INSERT INTO SKU (SKUID, ProductID, SizeID, Price)
VALUES (7, 4, 4, 1699);

INSERT INTO SKU (SKUID, ProductID, SizeID, Price)
VALUES (8, 5, 5, 1300);

-- --------------- Category ------------------------
INSERT INTO Category (CategoryID, CategoryName)
VALUES (1, 'Jeans');

INSERT INTO Category (CategoryID, CategoryName)
VALUES (2, 'Blue');

INSERT INTO Category (CategoryID, CategoryName)
VALUES (3, 'Black');

INSERT INTO Category (CategoryID, CategoryName)
VALUES (4, 'White');

INSERT INTO Category (CategoryID, CategoryName)
VALUES (5, 'SlimFit');

INSERT INTO Category (CategoryID, CategoryName)
VALUES (6, 'LooseFit');

INSERT INTO Category (CategoryID, CategoryName)
VALUES (7, 'HighWaist');

INSERT INTO Category (CategoryID, CategoryName)
VALUES (8, 'LowWaist');

-- --------------- ProductCategory ------------------------
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (1, 1);
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (1, 2);
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (1, 5);
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (1, 8);

INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (2, 1);
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (2, 3);
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (2, 6);
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (2, 7);

INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (3, 1);
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (3, 2);
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (3, 6);
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (3, 7);

INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (4, 1);
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (4, 3);
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (4, 5);
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (4, 8);

INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (5, 1);
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (5, 4);
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (5, 5);
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES (5, 7);

-- --------------- Order ------------------------
INSERT INTO `Order` (OrderID, CustomerID, Date)
VALUES (1, 1, '2016-01-20 00:00:01');

INSERT INTO `Order` (OrderID, CustomerID, Date)
VALUES (2, 2, '2016-03-20 00:00:01');

INSERT INTO `Order` (OrderID, CustomerID, Date)
VALUES (3, 3, '2016-06-20 00:00:01');

INSERT INTO `Order` (OrderID, CustomerID, Date)
VALUES (4, 4, '2016-07-20 00:00:01');

INSERT INTO `Order` (OrderID, CustomerID, Date)
VALUES (5, 5, '2016-09-20 00:00:01');

INSERT INTO `Order` (OrderID, CustomerID, Date)
VALUES (6, 1, '2016-09-20 00:00:01');

INSERT INTO `Order` (OrderID, CustomerID, Date)
VALUES (7, 2, '2016-10-20 00:00:01');

INSERT INTO `Order` (OrderID, CustomerID, Date)
VALUES (8, 3, '2016-12-20 00:00:01');

-- --------------- OrderProducts ------------------------
INSERT INTO OrderProduct (OrderID, SKUID, Quantity)
VALUES (1, 2, 60);
INSERT INTO OrderProduct (OrderID, SKUID, Quantity)
VALUES (1, 4, 20);

INSERT INTO OrderProduct (OrderID, SKUID, Quantity)
VALUES (2, 1, 30);
INSERT INTO OrderProduct (OrderID, SKUID, Quantity)
VALUES (2, 3, 50);

INSERT INTO OrderProduct (OrderID, SKUID, Quantity)
VALUES (3, 5, 10);
INSERT INTO OrderProduct (OrderID, SKUID, Quantity)
VALUES (3, 1, 10);

INSERT INTO OrderProduct (OrderID, SKUID, Quantity)
VALUES (4, 8, 30);
INSERT INTO OrderProduct (OrderID, SKUID, Quantity)
VALUES (4, 7, 15);

INSERT INTO OrderProduct (OrderID, SKUID, Quantity)
VALUES (5, 1, 40);
INSERT INTO OrderProduct (OrderID, SKUID, Quantity)
VALUES (5, 8, 20);

INSERT INTO OrderProduct (OrderID, SKUID, Quantity)
VALUES (6, 6, 44);
INSERT INTO OrderProduct (OrderID, SKUID, Quantity)
VALUES (6, 2, 10);

-- --------------- Inventory ------------------------
INSERT INTO Inventory (SKUID, Stock)
VALUES (1, 2);

INSERT INTO Inventory (SKUID, Stock)
VALUES (2, 300);

INSERT INTO Inventory (SKUID, Stock)
VALUES (3, 120);

INSERT INTO Inventory (SKUID, Stock)
VALUES (4, 100);

INSERT INTO Inventory (SKUID, Stock)
VALUES (5, 150);

INSERT INTO Inventory (SKUID, Stock)
VALUES (6, 150);

INSERT INTO Inventory (SKUID, Stock)
VALUES (7, 100);

INSERT INTO Inventory (SKUID, Stock)
VALUES (8, 100);


-- --------------- Procedures ------------------------
DROP PROCEDURE IF EXISTS AddToBasket;

DELIMITER //

CREATE PROCEDURE AddToBasket(IN in_customer_id INT, IN in_sku_id INT, INOUT inout_order_id INT)

  proc: BEGIN

    -- Validate all input
    IF (in_customer_id IS NULL) OR ((SELECT COUNT(*) FROM Customer WHERE in_customer_id = Customer.CustomerID) = 0) THEN
      SELECT 'ERROR: in_customer_id not found';
      LEAVE proc;
    END IF;

    IF (in_sku_id IS NULL) OR ((SELECT COUNT(*) FROM SKU WHERE in_sku_id = SKU.SKUID) = 0) THEN
      SELECT 'Error: in_sku_id not found';
      LEAVE proc;
    END IF;

    IF (inout_order_id IS NOT NULL) AND ((SELECT COUNT(*) FROM `Order` WHERE inout_order_id = `Order`.OrderID) = 0) THEN
      SELECT 'Error: inout_order_id not found';
      LEAVE proc;
    END IF;

    -- Validate that the CustomerID for an existing OrderID matches the provided customerID
    IF (inout_order_id IS NOT NULL) AND (SELECT `Order`.CustomerID FROM `Order` WHERE inout_order_id = `Order`.OrderID) != in_customer_id THEN
      SELECT 'Error: in_customer_id does not match existing inout_order_id';
      LEAVE proc;
    END IF;

    START TRANSACTION; -- --------------------------------------------------------

    -- Create new order if the orderId was null
    IF inout_order_id IS NULL THEN
      INSERT INTO `Order` (CustomerID, Date)
      VALUES (in_customer_id, NOW());
      -- Retrieve the generated orderId
      SELECT LAST_INSERT_ID() INTO inout_order_id;
    END IF;

    -- Try to add product to basket...

    -- Validate if we have at least one product at stock
    IF (SELECT Inventory.Stock FROM Inventory WHERE in_sku_id = Inventory.SKUID) < 1 THEN
      SELECT 'WARNING: Product was not added to the basket because it is out of stock';
      LEAVE proc;
    END IF;

    -- Insert a new product if we already have that product in the basket
    IF (SELECT Count(*) FROM OrderProduct WHERE inout_order_id = OrderProduct.OrderID AND in_sku_id = OrderProduct.SKUID) = 0 THEN
      INSERT INTO OrderProduct (OrderID, SKUID, Quantity)
      VALUES (inout_order_id, in_sku_id, 1);
    -- Increment only the quantity if that product is already in the basket
    ELSE
      UPDATE OrderProduct SET Quantity = Quantity + 1
      WHERE inout_order_id = OrderProduct.OrderID AND in_sku_id = OrderProduct.SKUID;
    END IF;

    -- Decrement to product's stock in the inventory
    UPDATE Inventory SET Stock = Stock - 1
    WHERE in_sku_id = Inventory.SKUID;

    COMMIT ;-- --------------------------------------------------------

    SELECT 'SUCCESS: AddToBasket finished';

  END //

DELIMITER ;

-- --------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE TopProducts(IN startDate DATE, IN endDate DATE, IN listRange INT)
  BEGIN
    SELECT
      Product.Name,
      COUNT(OrderProduct.SKUID * OrderProduct.SKUID) AS Products_sold
    FROM OrderProduct
      INNER JOIN `Order` ON OrderProduct.OrderID = `Order`.OrderID
      INNER JOIN SKU ON OrderProduct.SKUID = SKU.SKUID
      INNER JOIN Product ON SKU.SKUID = Product.SKU
    WHERE Order.date >= startDate AND Order.date <= endDate
    GROUP BY Product.Name
    ORDER BY Products_sold DESC
    LIMIT listRange;
  END //
DELIMITER ;

CALL TopProducts('20160101', '20161231', 7);

-- --------------------------------------------------------------------


DROP TRIGGER IF EXISTS OutOfStock;

DELIMITER //
CREATE TRIGGER OutOfStock
AFTER UPDATE ON SKU
FOR EACH ROW
  BEGIN
    INSERT IGNORE INTO OutOfStock (SKUID, DATE ) SELECT (new.SKUID, current_date)
                                                           FROM Inventory
                                                           WHERE Stock = 0;
END//
DELIMITER ;

