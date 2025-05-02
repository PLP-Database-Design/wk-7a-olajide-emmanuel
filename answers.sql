-- Question 1: Achieving 1NF from ProductDetail

-- Original non-1NF data
-- OrderID | CustomerName | Products
-- 101     | John Doe     | Laptop, Mouse
-- 102     | Jane Smith   | Tablet, Keyboard, Mouse
-- 103     | Emily Clark  | Phone

-- 1NF-compliant result using manual splitting
SELECT 101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop' AS Product
UNION ALL
SELECT 101, 'John Doe', 'Mouse'
UNION ALL
SELECT 102, 'Jane Smith', 'Tablet'
UNION ALL
SELECT 102, 'Jane Smith', 'Keyboard'
UNION ALL
SELECT 102, 'Jane Smith', 'Mouse'
UNION ALL
SELECT 103, 'Emily Clark', 'Phone'

-- Question 2: Transforming OrderDetails into 2NF
-- Step 1: Create a table for Orders (removing partial dependency)

-- This table holds unique OrderID and its associated CustomerName
SELECT DISTINCT
    OrderID,
    CustomerName
FROM OrderDetails;

-- Step 2: Create a table for OrderItems
-- This table references OrderID and includes Product and Quantity
SELECT
    OrderID,
    Product,
    Quantity
FROM OrderDetails;
