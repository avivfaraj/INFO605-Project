/* Trim */
-- 1
SELECT p.productName, p.productQuantity AS "Initial", SUM(lit.quantity) AS "Sold"
FROM Bottom b
INNER JOIN Product p ON b.bottomID = p.productID
INNER JOIN LineItem lit ON p.productID = lit.productID
GROUP BY p.productName, p.productQuantity;

-- 2
SELECT c.state, COUNT(o.orderID)
FROM Customer c
INNER JOIN Orders o ON c.customerID = o.customerID
GROUP BY c.state
ORDER BY COUNT(o.orderID) DESC;

-- 3
SELECT SUM(li.quantity) AS "Items Sold"
FROM Lineitem li
LEFT JOIN Orders o
ON li.orderID = o.orderID
WHERE o.orderTimestamp > '02/01/2021';



/* Aviv */
-- 1
SELECT p.productName, SUM(c.quantity) AS "# Saved"
FROM Cart c
INNER JOIN product p  
ON p.productID = c.productID
GROUP BY p.productName
ORDER BY SUM(c.quantity) DESC;

-- 2
SELECT o.shippingCost,
       SUM(li.quantity*p.productPrice - li.discount) AS Subtotal,
       SUM(li.quantity*p.productPrice - li.discount)*0.05 AS Tax,
       SUM(li.quantity) AS "# of Items",
       SUM(li.discount) AS "Total Discount"
FROM LineItem li
INNER JOIN Orders o ON o.orderID = li.orderID
INNER JOIN Product p ON p.productID = li.productID
WHERE o.orderID = 1
GROUP BY o.shippingCost;


-- 3
SELECT 
    p.productName,
    p.productPrice,
    COUNT(c.productID)
FROM Cart c
INNER JOIN Product p ON p.productID = c.productID
WHERE c.productID IN (SELECT topID FROM Top)
GROUP BY p.productName, p.productPrice;


/* Joshua */

-- 1
COLUMN COUNT(o.customerID) JUSTIFY CENTER 
SELECT c.customerID, c.fname, c.lname, COUNT(o.orderID)
FROM Customer c
LEFT JOIN Orders o
ON c.customerID = o.customerID 
GROUP BY c.customerID, c.fname, c.lname 
HAVING COUNT(o.orderID) > 1;

-- 2
SELECT c.customerID, c.fName, c.lName, o.orderID 
FROM Customer c
JOIN Orders o
ON c.customerID = o.customerID 
WHERE c.fName = 'Michael' 
ORDER BY c.CustomerID; 


-- 3
COLUMN MAX(l.quantity) HEADING 'Max Items' FORMAT 99,999,999
SELECT 
    c.customerID,
    o.orderID,
    c.fname, 
    c.lname,
    c.phone,
    c.email,
    MAX(l.quantity)
FROM Customer c 
INNER JOIN Orders o ON c.customerID = o.customerID 
INNER JOIN Lineitem l ON o.orderID = l.orderID 
GROUP BY c.customerID ,o.orderID,  c.fname, c.lname, c.phone, c.email
HAVING MAX(l.quantity) >= 2
ORDER BY MAX(l.quantity) DESC; 



/* Ashley */

-- 1
COLUMN 'Total' HEADING ' Total' FORMAT $9,999.99
SELECT 
    p.productName,
    p.productPrice,
    li.quantity,
    li.discount,
    SUM(li.quantity * p.productPrice - li.discount) AS Total
FROM LineItem li
INNER JOIN Product p ON p.productID = li.productID
WHERE li.orderID = 2
GROUP BY 
    p.productName,
    p.productPrice,
    li.quantity,
    li.discount;

-- 2
SELECT
    p.productName,
    p.productCategory, 
    t.topFit,
    t.topType,
    t.topSize
FROM Product p
INNER JOIN Top t ON t.topID = p.productID
WHERE p.productSection = 'Women';

-- 3
SELECT 
    p.productName, 
    o.orderTimestamp AS "Order Date", 
    r.returnDate AS "Return Date", 
    r.returnDate - o.orderTimestamp AS "Return Time Frame in Days"
FROM Product p, Orders o, Returns r
WHERE o.orderID = r.orderID AND p.productID = r.productID
GROUP BY p.productName, o.orderTimestamp, r.returnDate;


/* Warren */

-- 1
SELECT
    SUM(ca.quantity*p.productPrice) AS Subtotal,
    SUM(ca.quantity*p.productPrice)*0.05 AS Tax,
    SUM(ca.quantity) AS "# of Items"
FROM Cart ca
INNER join Customer c ON c.customerID = ca.customerID
INNER JOIN Product p ON p.productID = ca.productID
WHERE c.customerID = '1';

-- 2
SELECT p.productName, p.productDescription, SUM(r.quantity)
FROM Product p
INNER JOIN returns r ON r.productID = p.productID
GROUP BY p.productName, p.productDescription;

-- 3
SELECT 
    p.productID,
    p.productName,
    p.productPrice,
    SUM(li.quantity)
FROM Product p
INNER JOIN LineItem li ON li.productID = p.productID
GROUP BY p.productID, p.productName, p.productPrice
HAVING SUM(li.quantity) > 3
ORDER BY SUM(li.quantity) DESC;
