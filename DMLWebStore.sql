-- DML

USE Webstore;

-- #1 Lista antalet produkter per kategori.

SELECT
  Category.CategoryName AS Category,
  COUNT(*) AS NumProducts
FROM Category
  INNER JOIN ProductCategory ON Category.CategoryID = ProductCategory.CategoryID
GROUP BY Category.CategoryID
ORDER BY NumProducts DESC;

-- #2 Skapa en kundlista med det totala ordervärdet kunden har beställt för. Lista kundens för- och efternamn, samt det totala ordervärdet.

SELECT
  CONCAT_WS(' ', Customer.FirstName, Customer.Surname) AS Customer,
  SUM(SKU.Price * OrderProduct.Quantity)               AS TotalAmount
FROM Customer
  INNER JOIN `Order` ON Customer.CustomerID = `Order`.CustomerID
  INNER JOIN OrderProduct ON `Order`.OrderID = OrderProduct.OrderID
  INNER JOIN SKU ON OrderProduct.SKUID = SKU.SKUID
GROUP BY Customer.CustomerID
ORDER BY TotalAmount DESC;

-- #3 Vilka kunder har köpt blåa byxor storlek 32 av märket Nudie?

SELECT DISTINCT
  CONCAT_WS(' ', Customer.FirstName, Customer.Surname) AS Customer
FROM Customer
  INNER JOIN `Order` ON Customer.CustomerID = `Order`.CustomerID
  INNER JOIN OrderProduct ON `Order`.OrderID = OrderProduct.OrderID
  INNER JOIN SKU ON OrderProduct.SKUID = SKU.SKUID
  INNER JOIN Product ON SKU.ProductID = Product.ProductID
  INNER JOIN Size ON SKU.SizeID = Size.SizeID
WHERE Size = '32' AND Manufacturer = 'Nudie'
  AND 'Blue' IN (
    SELECT CategoryName
    FROM ProductCategory
      INNER JOIN Category ON ProductCategory.CategoryID = Category.CategoryID
    WHERE Product.ProductID = ProductCategory.ProductID)
  AND 'Jeans' IN (
      SELECT CategoryName
      FROM ProductCategory
        INNER JOIN Category ON ProductCategory.CategoryID = Category.CategoryID
      WHERE Product.ProductID = ProductCategory.ProductID);

-- #4 Skriv ut en lista på det totala ordervärdet per ort där ordervärdet är större än 1000 SEK

SELECT
  Customer.City,
  SUM(SKU.Price * OrderProduct.Quantity) AS TotalAmount
FROM Customer
  INNER JOIN `Order` ON Customer.CustomerID = `Order`.CustomerID
  INNER JOIN OrderProduct ON `Order`.OrderID = OrderProduct.OrderID
  INNER JOIN SKU ON OrderProduct.SKUID = SKU.SKUID
GROUP BY Customer.City
HAVING TotalAmount > 1000
ORDER BY TotalAmount DESC;

-- #5 Skapa en top lista av de mest sålda produkterna.

SELECT
  Product.Manufacturer AS Brand,
  Product.Name AS Product,
  SUM(OrderProduct.Quantity) AS Sales
FROM OrderProduct
  INNER JOIN SKU ON OrderProduct.SKUID = SKU.SKUID
  INNER JOIN Product ON SKU.ProductID = Product.ProductID
GROUP BY Product.ProductID
ORDER BY Sales DESC
LIMIT 5;

-- #6 Vilken månad hade man den största försäljningen?

SELECT
  DATE_FORMAT(`Order`.Date, '%M')        AS Month,
  SUM(SKU.Price * OrderProduct.Quantity) AS TotalAmount
FROM OrderProduct
  INNER JOIN `Order` ON OrderProduct.OrderID = `Order`.OrderID
  INNER JOIN SKU ON OrderProduct.SKUID = SKU.SKUID
GROUP BY MONTH
ORDER BY MONTH DESC
LIMIT 1;


-- ----------------------------------------------------------------------------------------

-- #1 Test stored procedure: AddToBasket
USE webstore;
SET @orderID = NULL;
CALL AddToBasket(1, 1, @orderID);

USE webstore;
SET @orderID = 1;
CALL AddToBasket(1, 1, @orderID);
