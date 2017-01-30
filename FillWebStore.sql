USE Webstore;

INSERT INTO Customer (FirstName, Surname, City)
VALUES ('Sundus', 'Abdulghani', 'Nyköping');

INSERT INTO Customer (FirstName, Surname, City)
VALUES ('Narek', 'Mkrtchyan', 'Stockholm');

INSERT INTO Customer (FirstName, Surname, City)
VALUES ('Elisabet', 'Holmberg', 'Boden');

INSERT INTO Customer (FirstName, Surname, City)
VALUES ('Siv', 'Larsson', 'Lund');

INSERT INTO Customer (FirstName, Surname, City)
VALUES ('Isabel', 'Franzen', 'Kalmar');

INSERT INTO Category (CategoryName)
VALUES ('Jeans');

INSERT INTO Category (CategoryName)
VALUES ('Blue');

INSERT INTO Category (CategoryName)
VALUES ('Black');

INSERT INTO Category (CategoryName)
VALUES ('White');

INSERT INTO Category (CategoryName)
VALUES ('SlimFit');

INSERT INTO Category (CategoryName)
VALUES ('LooseFit');

INSERT INTO Category (CategoryName)
VALUES ('HighWaist');

INSERT INTO Category (CategoryName)
VALUES ('LowWaist');

INSERT INTO ProductCategory (CategoryID, ID) VALUES (1, 1);
INSERT INTO ProductCategory (CategoryID, ID) VALUES (1, 2);
INSERT INTO ProductCategory (CategoryID, ID) VALUES (1, 5);
INSERT INTO ProductCategory (CategoryID, ID) VALUES (1, 8);

INSERT INTO ProductCategory (CategoryID, ID) VALUES (2, 1);
INSERT INTO ProductCategory (CategoryID, ID) VALUES (2, 3);
INSERT INTO ProductCategory (CategoryID, ID) VALUES (2, 6);
INSERT INTO ProductCategory (CategoryID, ID) VALUES (2, 7);

INSERT INTO ProductCategory (CategoryID, ID) VALUES (3, 1);
INSERT INTO ProductCategory (CategoryID, ID) VALUES (3, 2);
INSERT INTO ProductCategory (CategoryID, ID) VALUES (3, 6);
INSERT INTO ProductCategory (CategoryID, ID) VALUES (3, 7);

INSERT INTO ProductCategory (CategoryID, ID) VALUES (4, 1);
INSERT INTO ProductCategory (CategoryID, ID) VALUES (4, 3);
INSERT INTO ProductCategory (CategoryID, ID) VALUES (4, 5);
INSERT INTO ProductCategory (CategoryID, ID) VALUES (4, 8);

INSERT INTO ProductCategory (CategoryID, ID) VALUES (5, 1);
INSERT INTO ProductCategory (CategoryID, ID) VALUES (5, 4);
INSERT INTO ProductCategory (CategoryID, ID) VALUES (5, 5);
INSERT INTO ProductCategory (CategoryID, ID) VALUES (5, 7);

INSERT INTO Product (ProductCategoryID, Manufacturer, Name, Size, Price)
VALUES (1, 'Nudie', 'Magda', '32', 2000);

INSERT INTO Product (ProductCategoryID, Manufacturer, Name, Size, Price)
VALUES (1, 'Nudie', 'Magda', '34', 2000);

INSERT INTO Product (ProductCategoryID, Manufacturer, Name, Size, Price)
VALUES (1, 'Nudie', 'Magda', '36', 2000);

INSERT INTO Product (ProductCategoryID, Manufacturer, Name, Size, Price)
VALUES (2, 'Tiger Of Sweden', 'W/S', '32', 1889);

INSERT INTO Product (ProductCategoryID, Manufacturer, Name, Size, Price)
VALUES (3, 'HOPE-STHLM', 'Magda', '32', 2000);

INSERT INTO Product (ProductCategoryID, Manufacturer, Name, Size, Price)
VALUES (1, 'Hunkydory', 'Le La Jean', '36', 1799);

INSERT INTO Product (ProductCategoryID, Manufacturer, Name, Size, Price)
VALUES (4, 'Hunkydory', 'Eldon Jean', '38', 1699);

INSERT INTO Product (ProductCategoryID, Manufacturer, Name, Size, Price)
VALUES (5, 'HOPE-STHLM', 'STAY', '40', 1300);

INSERT INTO Inventory (SKU, Manufacturer, Stock)
VALUES (1, 'Nudie', 200);

INSERT INTO Inventory (SKU, Manufacturer, Stock)
VALUES (2, 'Nudie', 300);

INSERT INTO Inventory (SKU, Manufacturer, Stock)
VALUES (3, 'Nudie', 120);

INSERT INTO Inventory (SKU, Manufacturer, Stock)
VALUES (4, 'Tiger Of Sweden', 100);

INSERT INTO Inventory (SKU, Manufacturer, Stock)
VALUES (5, 'HOPE-STHLM', 150);

INSERT INTO Inventory (SKU, Manufacturer, Stock)
VALUES (6, 'Hunkydory', 150);

INSERT INTO Inventory (SKU, Manufacturer, Stock)
VALUES (7, 'Hunkydory', 100);

INSERT INTO Inventory (SKU, Manufacturer, Stock)
VALUES (8, 'HOPE-STHLM', 100);

