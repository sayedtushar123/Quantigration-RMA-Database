-- 05: Demonstrate safe updates and targeted deletion on fictional data.
USE QuantigrationRMA_Portfolio;

SELECT RMAID, OrderID, Status, Step FROM RMA WHERE OrderID = 5175;

UPDATE RMA
SET Status = 'Complete', Step = 'Credit Customer Account'
WHERE OrderID = 5175;

SELECT RMAID, OrderID, Status, Step FROM RMA WHERE OrderID = 5175;

-- Check how many rows meet the delete condition before deleting (expected: 3).
SELECT COUNT(*) AS RejectedBefore FROM RMA WHERE Reason = 'Rejected';
DELETE FROM RMA WHERE Reason = 'Rejected';
SELECT ROW_COUNT() AS DeletedRecords; -- expected: 3
SELECT COUNT(*) AS RejectedAfter FROM RMA WHERE Reason = 'Rejected'; -- expected: 0
SELECT COUNT(*) AS RemainingRMA FROM RMA; -- expected: 5
