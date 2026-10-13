-- OPTIONAL alternate data-loading route for the included fictional CSV files.
-- Run after script 01, INSTEAD OF script 02. Only run once on empty tables.
-- Replace ALL example absolute paths with the location of this repository.
-- The public sample CSVs DO contain a header and use LF (\n) line endings.
-- The original class/lab CSVs did NOT contain headers and used CRLF (\r\n).
-- MySQL may require enabling local_infile on both client and server.
USE QuantigrationRMA_Portfolio;

LOAD DATA LOCAL INFILE '/ABSOLUTE/PATH/TO/REPO/data/customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/ABSOLUTE/PATH/TO/REPO/data/orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/ABSOLUTE/PATH/TO/REPO/data/rma.csv'
INTO TABLE RMA
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

SELECT COUNT(*) AS CustomersImported FROM Customers; -- expected: 8
SELECT COUNT(*) AS OrdersImported FROM Orders;       -- expected: 11
SELECT COUNT(*) AS RMAImported FROM RMA;             -- expected: 8
