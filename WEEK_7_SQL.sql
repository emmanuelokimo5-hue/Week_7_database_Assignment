
-- ==================================================
-- DATABASE NORMALIZATION ASSIGNMENT
-- Topics: First Normal Form (1NF) and Second Normal Form (2NF)
-- File: answer.sql
-- ==================================================


-- ==================================================
-- QUESTION 1: ACHIEVING FIRST NORMAL FORM (1NF)
-- ==================================================

-- Step 1: Create a new table where each row contains
-- only one product for each order.

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product)
);

-- Step 2: Insert the normalized records.

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Step 3: Display the normalized table.

SELECT * FROM ProductDetail_1NF;


-- ==================================================
-- QUESTION 2: ACHIEVING SECOND NORMAL FORM (2NF)
-- ==================================================

-- Partial dependency:
-- CustomerName depends only on OrderID, not on
-- the complete composite key (OrderID, Product).
-- To achieve 2NF, separate order information
-- from product and quantity information.

-- Step 1: Create the Orders table.

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

-- Step 2: Create the OrderItems table.

CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 3: Insert order information into Orders.

INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 4: Insert product information into OrderItems.

INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Step 5: Display the Orders table.

SELECT * FROM Orders;

-- Step 6: Display the OrderItems table.

SELECT * FROM OrderItems;

-- Step 7: Join both tables to view complete order information.

SELECT
    Orders.OrderID,
    Orders.CustomerName,
    OrderItems.Product,
    OrderItems.Quantity
FROM Orders
INNER JOIN OrderItems
    ON Orders.OrderID = OrderItems.OrderID;


-- ==================================================
-- END OF DATABASE NORMALIZATION ASSIGNMENT
-- ==================================================
