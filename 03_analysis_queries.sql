-- 03: Analyze orders and locations BEFORE the four demo additions.
USE QuantigrationRMA_Portfolio;

-- Count orders for customers in Framingham, Massachusetts (expected: 4).
SELECT COUNT(*) AS FraminghamOrderCount
FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE c.City = 'Framingham' AND c.State = 'Massachusetts';

-- Retrieve Massachusetts customers (expected: 3 rows).
SELECT CustomerID, FirstName, LastName, City, State
FROM Customers
WHERE State = 'Massachusetts';

-- Count Massachusetts customers (expected: 3).
SELECT COUNT(*) AS MassachusettsCustomerCount
FROM Customers WHERE State = 'Massachusetts';

-- Count Woonsocket, RI customers (expected: 2).
SELECT COUNT(*) AS WoonsocketCustomerCount
FROM Customers
WHERE City = 'Woonsocket' AND State = 'Rhode Island';

-- Inspect an RMA before updating it (expected: Pending / Awaiting Documentation).
SELECT RMAID, OrderID, Status, Step
FROM RMA WHERE OrderID = 5175;
