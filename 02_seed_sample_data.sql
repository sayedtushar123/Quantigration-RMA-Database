-- 02: Original fictional records created only for this public demo.
-- Run after 01_create_database_and_tables.sql, on an empty database.
USE QuantigrationRMA_Portfolio;

INSERT INTO Customers (CustomerID, FirstName, LastName, StreetAddress, City, State, ZipCode, Telephone) VALUES
    (200001, 'Morgan', 'Reed', '12 Oak Street', 'Framingham', 'Massachusetts', '01701', '508-555-0101'),
    (200002, 'Jordan', 'Blake', '48 Elm Road', 'Framingham', 'Massachusetts', '01702', '508-555-0102'),
    (200003, 'Avery', 'Chen', '91 Harbor Lane', 'Boston', 'Massachusetts', '02108', '617-555-0103'),
    (200004, 'Taylor', 'Finch', '7 River Avenue', 'Woonsocket', 'Rhode Island', '02895', '401-555-0104'),
    (200005, 'Reese', 'Parker', '32 North Street', 'Woonsocket', 'Rhode Island', '02895', '401-555-0105'),
    (200006, 'Casey', 'Miller', '10 Pine Court', 'Reno', 'Nevada', '89501', '775-555-0106'),
    (200007, 'Drew', 'Patel', '25 Lake Street', 'Austin', 'Texas', '78701', '512-555-0107'),
    (200008, 'Alex', 'Rivera', '81 Market Road', 'Sacramento', 'California', '95814', '916-555-0108');

INSERT INTO Orders (OrderID, CustomerID, SKU, Description) VALUES
    (5175, 200001, 'SW-24-10C', '24-port managed copper network switch'),
    (6001, 200001, 'RTR-100', 'Business network router'),
    (6002, 200002, 'SW-48-10F', '48-port managed fiber network switch'),
    (6003, 200003, 'AP-200', 'Wireless access point'),
    (6004, 200004, 'SW-24-10C', '24-port managed copper network switch'),
    (6005, 200005, 'RTR-100', 'Business network router'),
    (6006, 200006, 'AP-200', 'Wireless access point'),
    (6007, 200007, 'SW-48-10F', '48-port managed fiber network switch'),
    (6008, 200008, 'SW-24-10C', '24-port managed copper network switch'),
    (6009, 200002, 'RTR-100', 'Business network router'),
    (6010, 200003, 'SW-48-10F', '48-port managed fiber network switch');

INSERT INTO RMA (RMAID, OrderID, Step, Status, Reason) VALUES
    (40001, 5175, 'Awaiting Documentation', 'Pending', 'Defective'),
    (40002, 6002, 'Inspection Pending', 'Pending', 'Rejected'),
    (40003, 6003, 'Receiving', 'In Progress', 'Wrong Item'),
    (40004, 6004, 'Quality Review', 'Pending', 'Rejected'),
    (40005, 6006, 'Replacement Sent', 'Complete', 'Defective'),
    (40006, 6007, 'Credit Applied', 'Complete', 'Rejected'),
    (40007, 6008, 'Inspection Pending', 'Pending', 'Damaged'),
    (40008, 6009, 'Received', 'In Progress', 'Missing Parts');

SELECT 'Customers' AS TableName, COUNT(*) AS Total FROM Customers
UNION ALL SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL SELECT 'RMA', COUNT(*) FROM RMA;
