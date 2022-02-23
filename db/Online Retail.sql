/* **************************************
   *********** Strong Entities **********
   **************************************
*/

-- Changed EMAIL from VARCHAR2(20) to VARCHAR2(60)
-- DROP TABLE Customer CASCADE CONSTRAINTS; 
CREATE TABLE Customer (
customerID             NUMBER(10)    NOT NULL,  
customerFirstName      VARCHAR2(20)  NOT NULL, 
customerMiddleName     VARCHAR2(20), 
customerLastName       VARCHAR2(20)  NOT NULL, 
customerPhone          NUMBER(10)    UNIQUE, 
customerEmail          VARCHAR2(60)  NOT NULL UNIQUE, 
street                 VARCHAR2(20)  NOT NULL, 
city                   VARCHAR2(20)  NOT NULL, 
state                  CHAR(2)       NOT NULL, 
zip                    CHAR(5)       NOT NULL, 
CONSTRAINT customer_pk PRIMARY KEY (customerID));

-- Added line to automatically generate orderID
-- Removed NOT NULL from orderID
-- Added customerID
DROP TABLE Cart CASCADE CONSTRAINTS; 
CREATE TABLE Cart (
cartID                 NUMBER(10)
GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,  
cartSubtotal           NUMBER(4,2), 
cartTax                NUMBER(4,2),
customerID             NUMBER(10) NOT NULL, 
CONSTRAINT cart_pk PRIMARY KEY (cartID),
CONSTRAINT cart_fk FOREIGN KEY (customerID) REFERENCES Customer(customerID));


-- DROP TABLE Payment CASCADE CONSTRAINTS; 
CREATE TABLE Payment(
paymentID               NUMBER(6)    NOT NULL, 
paymentType             VARCHAR2(6)  NOT NULL 
CHECK (paymentType in ('Debit', 'Credit')), 
paymentDigits           NUMBER(4)    NOT NULL, 
paymentCompany          VARCHAR2(10) NOT NULL, 
CHECK (paymentCompany in ('Visa','AMEX', 'Mastercard')),
CONSTRAINT payment_pk PRIMARY KEY (paymentID));


-- DROP TABLE Product CASCADE CONSTRAINTS; 
CREATE TABLE Product(
productID                NUMBER(10)   NOT NULL, 
productName              VARCHAR2(15) NOT NULL, 
productDescription       VARCHAR2(15), 
productQuantity          NUMBER(3)    NOT NULL, 
productPrice             NUMBER(4,2)  NOT NULL, 
productSection           VARCHAR2(5)  NOT NULL 
CHECK (productSection IN ('Women','Men', 'Kids')), 
productColor             VARCHAR2(10) NOT NULL, 
productCollection        VARCHAR2(15), 
productCategory          VARCHAR2(20) NOT NULL, 
CONSTRAINT product_pk PRIMARY KEY (productID));

-- Added paymentID
-- Changed prices to NUMBER(6,2)
-- Added line to automatically generate orderID
-- Removed NOT NULL from orderID
-- Changed Order TABLEname to Orders since Order is a saved word in SQL
DROP TABLE Orders CASCADE CONSTRAINTS; 
CREATE TABLE Orders(
orderID                  NUMBER
GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,  
orderSubtotal            NUMBER(6,2), 
orderTax                 NUMBER(6,2), 
orderDate                DATE, 
orderTime                DATE, 
shippingCost             NUMBER(6,2), 
customerID               NUMBER(10)  NOT NULL,
paymentID                NUMBER(6) NOT NULL,
CONSTRAINT orders_pk PRIMARY KEY (orderID), 
CONSTRAINT orders_fk1 FOREIGN KEY (customerID) REFERENCES Customer (customerID),
CONSTRAINT orders_fk2 FOREIGN KEY (paymentID) REFERENCES Payment(paymentID));


/* **************************************
   *********** Weak Entities ************
   **************************************
*/


-- DROP TABLE Shipment CASCADE CONSTRAINTS; 
CREATE TABLE Shipment(
trackingNo      VARCHAR2(15)    NOT NULL, 
orderID         NUMBER(10)      NOT NULL, 
street          VARCHAR2(20)    NOT NULL, 
city            VARCHAR2(20)    NOT NULL, 
state           CHAR(2)         NOT NULL, 
zip             CHAR(5)         NOT NULL, 
CONSTRAINT shipment_pk PRIMARY KEY (trackingNo, orderID), 
CONSTRAINT shipmemt_fk FOREIGN KEY (orderID) REFERENCES Orders (orderID));



-- DROP TABLE cartLineItem CASCADE CONSTRAINTS; 
CREATE TABLE cartLineItem(
cartID          NUMBER(10) NOT NULL, 
productID       NUMBER(10) NOT NULL, 
quantity        NUMBER(1), 
CONSTRAINT cartLineItem_pk PRIMARY KEY (cartID, productID), 
CONSTRAINT cartLineItem_fk1 FOREIGN KEY (cartID) REFERENCES Cart(cartID), 
CONSTRAINT cartLineItem_fk2 FOREIGN KEY (productID) REFERENCES Product(productID));

-- Changed lineNum to line# since lineNum is a saved word in SQL
-- DROP TABLE LineItem CASCADE CONSTRAINTS; 
CREATE TABLE LineItem (
line#          NUMBER(2)  NOT NULL, 
orderID         NUMBER(10) NOT NULL, 
quantity        NUMBER(15), 
unitPrice       NUMBER(10), 
trackingNo      VARCHAR2(15) NOT NULL, 
productID       NUMBER(10)  NOT NULL, 
CONSTRAINT lineItem_pk PRIMARY KEY (line#, orderID), 
--CONSTRAINT lineItem_fk1 FOREIGN KEY (orderID) REFERENCES Orders(orderID), 
CONSTRAINT lineItem_fk2 FOREIGN KEY (trackingNo, orderID) REFERENCES Shipment(trackingNo,orderID), 
CONSTRAINT lineItem_fk3 FOREIGN KEY (productID) REFERENCES Product(productID));



/* **************************************
   *********** Sub-classes **************
   **************************************
*/

-- DROP TABLE Shoes cascade CONSTRAINTS;  
CREATE TABLE Shoes(
shoesID      NUMBER(10)  NOT NULL, 
usSize       NUMBER(2)   NOT NULL, 
uSize        NUMBER(2)   NOT NULL, 
CONSTRAINT shoes_fk FOREIGN KEY (shoesID) REFERENCES Product(productID),
CONSTRAINT shoes_pk PRIMARY KEY (shoesID)); 



-- DROP TABLE Top cascade CONSTRAINTS;  
CREATE TABLE Top(
topID       NUMBER(10)      NOT NULL,  
topFit      VARCHAR2(7)     NOT NULL 
CHECK(topFit IN ('Regular', 'Tall')),  
topSize     VARCHAR2(10)    NOT NULL 
CHECK(topSize IN ('S', 'M', 'L', 'XL', 'XXL', '3XL')),  
topType     VARCHAR2(11)    NOT NULL 
CHECK(topType IN ('T-shirt', 'Long Sleeve', 'Polo Shirt', 'Sweatshirt', 'Sleeveless')),  
CONSTRAINT top_fk FOREIGN KEY (topID) REFERENCES Product(productID), 
CONSTRAINT top_pk PRIMARY KEY (topID)); 


-- DROP TABLE Bottom cascade CONSTRAINTS; 
CREATE TABLE Bottom(
bottomID        NUMBER(10)     NOT NULL, 
bottomFit       VARCHAR2(7)    NOT NULL 
CHECK(bottomFit  IN ('Regular', 'Tall')), 
bottomSize   VARCHAR2(10)      NOT NULL 
CHECK(bottomSize IN ('S', 'M', 'L', 'XL', 'XXL', '3XL')), 
bottomType      VARCHAR2(11)   NOT NULL 
CHECK(bottomType IN ('Sweatpants', 'Leggins', 'Pants', 'Shorts')), 
CONSTRAINT bottom_fk FOREIGN KEY (bottomID) REFERENCES Product(productID), 
CONSTRAINT bottom_pk PRIMARY KEY (bottomID));



/* **************************************
   ************** Grants ****************
   **************************************
*/
GRANT SELECT ON Customer to PUBLIC; 
GRANT SELECT ON Cart to PUBLIC; 
GRANT SELECT ON Orders to PUBLIC; 
GRANT SELECT ON Payment to PUBLIC; 
GRANT SELECT ON Shipment to PUBLIC; 
GRANT SELECT ON LineItem to PUBLIC; 
-- GRANT SELECT ON ReturnedItems to PUBLIC; 
-- GRANT SELECT ON CartLineItem to PUBLIC; 
GRANT SELECT ON Product to PUBLIC; 
GRANT SELECT ON Shoes to PUBLIC; 
GRANT SELECT ON Top to PUBLIC; 
GRANT SELECT ON Bottom to PUBLIC; 

COMMIT;