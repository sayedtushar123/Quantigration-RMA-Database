-- 04: Demonstrate INSERT by adding four fictional customers and their orders.
-- Customers must be added before Orders to satisfy the foreign key.
USE QuantigrationRMA_Portfolio;

INSERT INTO Customers (CustomerID, FirstName, LastName, StreetAddress, City, State, ZipCode, Telephone) VALUES
    (200009, 'Sam', 'Ortiz', '14 South Street', 'New York', 'New York', '10001', '212-555-0109'),
    (200010, 'Riley', 'Jones', '92 Ridge Road', 'Phoenix', 'Arizona', '85001', '602-555-0110'),
    (200011, 'Quinn', 'Brooks', '50 Maple Drive', 'Framingham', 'Massachusetts', '01701', '508-555-0111'),
    (200012, 'Jamie', 'Davis', '28 Birch Lane', 'Durham', 'North Carolina', '27701', '919-555-0112');

INSERT INTO Orders (OrderID, CustomerID, SKU, Description) VALUES
    (6011, 200009, 'SW-24-10C', '24-port managed copper network switch'),
    (6012, 200010, 'AP-200', 'Wireless access point'),
    (6013, 200011, 'SW-48-10F', '48-port managed fiber network switch'),
    (6014, 200012, 'RTR-100', 'Business network router');

SELECT CustomerID, FirstName, LastName FROM Customers
WHERE CustomerID IN (200009, 200010, 200011, 200012);

SELECT OrderID, CustomerID, SKU FROM Orders
WHERE OrderID IN (6011, 6012, 6013, 6014);

SELECT COUNT(*) AS TotalCustomers FROM Customers; -- expected: 12
SELECT COUNT(*) AS TotalOrders FROM Orders;       -- expected: 15
