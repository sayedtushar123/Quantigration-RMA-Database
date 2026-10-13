-- 07: Export order records as comma-separated values (CSV).
-- MySQL's server must have FILE privileges and write permission to the destination.
-- Check the configured output directory first:
USE QuantigrationRMA_Portfolio;
SHOW VARIABLES LIKE 'secure_file_priv';
SELECT COUNT(*) AS OrdersToExport FROM Orders; -- expected: 15

-- Replace the output path with an allowed, writable path before running.
-- MySQL does NOT overwrite a file that already exists.
-- Example syntax (remove the leading -- from the lines below):
-- SELECT OrderID, CollaboratorID, SKU, Description
-- FROM Orders
-- INTO OUTFILE '/path/allowed/by/mysql/orders_export.csv'
-- FIELDS TERMINATED BY ','
-- OPTIONALLY ENCLOSED BY '"'
-- LINES TERMINATED BY '\r\n';

-- As an alternative, from a terminal on the MySQL client machine:
-- mysql -u YOUR_USER -p --batch --raw --skip-column-names \
--   -D QuantigrationRMA_Portfolio \
--   -e "SELECT OrderID, CollaboratorID, SKU, Description FROM Orders;" \
--   > orders_tab_separated.tsv
-- For a real CSV export, use the INTO OUTFILE statement above (with proper permissions).
