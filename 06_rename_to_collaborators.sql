-- 06: Reflect a change in business terminology while preserving relationships.
-- Run after the analysis and record-change exercises.
USE QuantigrationRMA_Portfolio;

ALTER TABLE Customers RENAME TO Collaborators;
ALTER TABLE Collaborators RENAME COLUMN CustomerID TO CollaboratorID;
ALTER TABLE Orders RENAME COLUMN CustomerID TO CollaboratorID;
ALTER TABLE Orders RENAME INDEX CustomerID TO CollaboratorID;

SHOW TABLES;
DESCRIBE Collaborators;
DESCRIBE Orders;
SHOW CREATE TABLE Orders; -- the FK now references Collaborators(CollaboratorID)
SELECT COUNT(*) AS TotalCollaborators FROM Collaborators; -- expected: 12
