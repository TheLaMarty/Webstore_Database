-- DML

USE Webstore;

-- #1 Lista antalet produkter per kategori.

SELECT
  Category.CategoryName,
  COUNT(Product.SKU)
FROM Category
  INNER JOIN ProductCategory ON Category.CategoryID = ProductCategory.CategoryID
  INNER JOIN Product ON ProductCategory.ID = Product.ProductCategoryID
GROUP BY Category.CategoryName;


-- #2 Skapa en kundlista med det totala ordervärdet kunden har beställt för. Lista kundens för- och efternamn, samt det totala ordervärdet.

SELECT
  CONCAT_WS(' ', Customer.FirstName, Customer.Surname),
  SUM(Product.Price * OrderProducts.Quantity) AS Total_amount
FROM Customer
  INNER JOIN `Order` ON Customer.CustomerID = Order.CustomerID
  INNER JOIN OrderProducts ON Order.OrderID = OrderProducts.OrderID
  INNER JOIN Product ON OrderProducts.SKU = Product.SKU
WHERE OrderProducts.SKU = Product.SKU
GROUP BY ORDER.OrderID;


-- #3 Vilka kunder har köpt blåa byxor  storlek 32 av märket Nudie?

SELECT CONCAT_WS(' ', Customer.FirstName, Customer.Surname) AS Customer
FROM Customer
  INNER JOIN `Order` ON Customer.CustomerID = Order.CustomerID
  INNER JOIN OrderProducts ON Order.OrderID = OrderProducts.OrderID
  INNER JOIN Product ON OrderProducts.SKU = Product.SKU
WHERE OrderProducts.SKU = 1;


-- #4 Skriv ut en lista på det totala ordervärdet per ort där ordervärdet är större än 1000 SEK

SELECT
  Customer.City,
  SUM(Product.price * OrderProducts.Quantity) AS Total_amount
FROM Customer
  INNER JOIN `Order` ON Customer.CustomerID = Order.CustomerID
  INNER JOIN OrderProducts ON Order.OrderID = OrderProducts.OrderID
  INNER JOIN Product ON OrderProducts.SKU = Product.SKU
GROUP BY CUSTOMER.City HAVING Total_amount > 1000;


-- #5 Skapa en top lista av de mest sålda produkterna.




-- #6 Vilken månad hade man den största försäljningen?