-- Quantigration RMA: Project Two — RMA Data Analysis
-- Queries were executed in the DAD 220 Codio course environment.
-- The public portfolio sample dataset is smaller and will return different results.
USE QuantigrationRMA;

-- 1. Return counts by customer state (48 state values in lab output).
SELECT c.State, COUNT(r.RMAID) AS TotalReturns
FROM RMA r
JOIN Orders o ON r.OrderID = o.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.State
ORDER BY TotalReturns DESC;

-- 2. Each product description's share of all RMA records.
-- Note: percentage OF RETURNS, not returns / units sold.
SELECT o.Description AS ProductType,
       COUNT(r.RMAID) AS TotalReturns,
       ROUND(COUNT(r.RMAID) * 100.0 /
             (SELECT COUNT(*) FROM RMA), 2) AS ReturnPercentage
FROM RMA r
JOIN Orders o ON r.OrderID = o.OrderID
GROUP BY o.Description
ORDER BY ReturnPercentage DESC;

-- 3. Check total RMA rows.
SELECT COUNT(*) AS TotalRMAs FROM RMA;

-- 4. Check RMA rows that match an order.
SELECT COUNT(*) AS MatchedReturns
FROM RMA r
JOIN Orders o ON r.OrderID = o.OrderID;
