-- 01: Set up a new MySQL 8.0 database for a portfolio demonstration.
-- Re-run only against a fresh schema; table creation will fail if tables already exist.
CREATE DATABASE IF NOT EXISTS QuantigrationRMA_Portfolio;
USE QuantigrationRMA_Portfolio;

-- A customer can have multiple orders.
CREATE TABLE Customers (
    CustomerID    INT PRIMARY KEY,
    FirstName     VARCHAR(25),
    LastName      VARCHAR(25),
    StreetAddress VARCHAR(50),
    City          VARCHAR(50),
    State         VARCHAR(25),
    ZipCode       VARCHAR(10),
    Telephone     VARCHAR(15)
) ENGINE=InnoDB;

-- OrderID uniquely identifies an order; CustomerID links to Customers.
CREATE TABLE Orders (
    OrderID      INT PRIMARY KEY,
    CustomerID   INT,
    SKU          VARCHAR(20),
    Description  VARCHAR(75),
    INDEX CustomerID (CustomerID),
    CONSTRAINT fk_orders_party FOREIGN KEY (CustomerID)
      REFERENCES Customers (CustomerID)
) ENGINE=InnoDB;

-- RMAs track the status and reason for a returned order.
CREATE TABLE RMA (
    RMAID    INT PRIMARY KEY,
    OrderID  INT,
    Step     VARCHAR(50),
    Status   VARCHAR(15),
    Reason   VARCHAR(15),
    CONSTRAINT fk_rma_order FOREIGN KEY (OrderID)
      REFERENCES Orders (OrderID)
) ENGINE=InnoDB;

SHOW TABLES;
SHOW CREATE TABLE Orders;
SHOW CREATE TABLE RMA;
