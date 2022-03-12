/* **************************************
   *********** Strong Entities **********
   **************************************
*/

-- Removed AUTO_INCREMENT 
--DROP TABLE Customer CASCADE CONSTRAINTS; 
CREATE TABLE Customer (
customerID             NUMBER(10) NOT NULL,  
fName                  VARCHAR2(20)  NOT NULL, 
mName                  VARCHAR2(20), 
lName                  VARCHAR2(20)  NOT NULL, 
phone                  NUMBER(10)    UNIQUE, 
email                  VARCHAR2(60)  NOT NULL UNIQUE, 
street                 VARCHAR2(50)  NOT NULL, 
city                   VARCHAR2(20)  NOT NULL, 
state                  CHAR(2)       NOT NULL, 
zip                    CHAR(5)       NOT NULL, 
CONSTRAINT customer_pk PRIMARY KEY (customerID));


--DROP TABLE Payment CASCADE CONSTRAINTS; 
CREATE TABLE Payment(
paymentID               NUMBER(6)    NOT NULL, 
paymentType             VARCHAR2(6)  NOT NULL 
CHECK (paymentType in ('Debit', 'Credit')), 
paymentDigits           NUMBER(4)    NOT NULL, 
paymentCompany          VARCHAR2(16) NOT NULL, 
CHECK (paymentCompany in ('Visa','AMEX', 'Mastercard', 'Bank of America', 'Capital One')),
CONSTRAINT payment_pk PRIMARY KEY (paymentID));

-- Removed AUTO_INCREMENT
--DROP TABLE Product CASCADE CONSTRAINTS; 
CREATE TABLE Product(
productID                NUMBER(10) NOT NULL, 
productName              VARCHAR2(50) NOT NULL, 
productDescription       VARCHAR2(50), 
productQuantity          NUMBER(3)    NOT NULL, 
productPrice             NUMBER(6,2)  NOT NULL, 
productSection           VARCHAR2(5)  NOT NULL 
CHECK (productSection IN ('Women','Men', 'Kids')), 
productColor             VARCHAR2(30) NOT NULL, 
productCollection        VARCHAR2(30), 
productCategory          VARCHAR2(30) NOT NULL, 
CONSTRAINT product_pk PRIMARY KEY (productID));


-- Removed AUTO INCREMENT
--DROP TABLE Orders CASCADE CONSTRAINTS; 
CREATE TABLE Orders(
orderID                  NUMBER(10) NOT NULL,
shippingCost             NUMBER(6,2),
orderTimestamp           DATE,  
customerID               NUMBER(10)  NOT NULL,
paymentID                NUMBER(6),
CONSTRAINT orders_pk PRIMARY KEY (orderID), 
CONSTRAINT orders_fk1 FOREIGN KEY (customerID) REFERENCES Customer (customerID) ON DELETE CASCADE,
CONSTRAINT orders_fk2 FOREIGN KEY (paymentID) REFERENCES Payment(paymentID) ON DELETE SET NULL);


/* **************************************
   *********** Weak Entities ************
   **************************************
*/

--DROP TABLE Shipment CASCADE CONSTRAINTS; 
CREATE TABLE Shipment(
trackingNo      VARCHAR2(15)    NOT NULL, 
orderID         NUMBER(10)      NOT NULL, 
street          VARCHAR2(20)    NOT NULL, 
city            VARCHAR2(20)    NOT NULL, 
state           CHAR(2)         NOT NULL, 
zip             CHAR(5)         NOT NULL,
shippingCompany VARCHAR2(20)    NOT NULL,
CONSTRAINT shipment_pk PRIMARY KEY (trackingNo, orderID), 
CONSTRAINT shipmemt_fk FOREIGN KEY (orderID) REFERENCES Orders (orderID) ON DELETE CASCADE);


--DROP TABLE LineItem CASCADE CONSTRAINTS; 
CREATE TABLE LineItem (
line#           NUMBER(2)  NOT NULL, 
orderID         NUMBER(10) NOT NULL, 
quantity        NUMBER(1)  DEFAULT 1 NOT NULL,
discount        NUMBER(6,2) NOT NULL,
productID       NUMBER(10)  NOT NULL, 
CONSTRAINT lineItem_pk PRIMARY KEY (line#, orderID), 
CONSTRAINT lineItem_fk1 FOREIGN KEY (orderID) REFERENCES Orders(orderID) ON DELETE CASCADE, 
CONSTRAINT lineItem_fk2 FOREIGN KEY (productID) REFERENCES Product(productID) ON DELETE CASCADE);



/* **************************************
   *********** Many-to-Many ************
   **************************************
*/

--DROP TABLE Returns CASCADE CONSTRAINTS; 
CREATE TABLE Returns(
orderID         NUMBER(10)    NOT NULL,
productID       NUMBER(10)    NOT NULL,
returnDate      DATE  NOT NULL,
quantity        NUMBER(2)     NOT NULL,
CONSTRAINT returns_pk PRIMARY KEY (orderID, productID), 
CONSTRAINT returns_fk1 FOREIGN KEY (orderID) REFERENCES Orders (orderID) ON DELETE CASCADE,
CONSTRAINT returns_fk2 FOREIGN KEY (productID) REFERENCES Product(productID) ON DELETE CASCADE);


--DROP TABLE Cart CASCADE CONSTRAINTS; 
CREATE TABLE Cart (
customerID             NUMBER(10) NOT NULL,  
productID              NUMBER(10) NOT NULL, 
quantity               NUMBER(1) DEFAULT 1, 
CONSTRAINT cart_pk PRIMARY KEY (customerID, productID),
CONSTRAINT cart_fk1 FOREIGN KEY (customerID) REFERENCES Customer(customerID) ON DELETE CASCADE,
CONSTRAINT cart_fk2 FOREIGN KEY (productID) REFERENCES Product(productID) ON DELETE CASCADE);



/* **************************************
   *********** Sub-classes **************
   **************************************
*/

--DROP TABLE Shoes cascade CONSTRAINTS;  
CREATE TABLE Shoes(
shoesID      NUMBER(10)    NOT NULL, 
usSize       NUMBER(3,1)   NOT NULL, 
euSize       NUMBER(3,1)   NOT NULL,
CONSTRAINT shoes_pk PRIMARY KEY (shoesID),
CONSTRAINT shoes_fk FOREIGN KEY (shoesID) REFERENCES Product(productID) ON DELETE CASCADE);


--DROP TABLE Top cascade CONSTRAINTS;  
CREATE TABLE Top(
topID       NUMBER(10)      NOT NULL,  
topFit      VARCHAR2(7)     NOT NULL 
CHECK(topFit IN ('Regular', 'Tall')),  
topSize     VARCHAR2(10)    NOT NULL 
CHECK(topSize IN ('S', 'M', 'L', 'XL', 'XXL', '3XL')),  
topType     VARCHAR2(11)    NOT NULL 
CHECK(topType IN ('T-shirt', 'Long Sleeve', 'Polo Shirt', 'Sweatshirt', 'Sleeveless')),  
CONSTRAINT top_fk FOREIGN KEY (topID) REFERENCES Product(productID) ON DELETE CASCADE, 
CONSTRAINT top_pk PRIMARY KEY (topID)); 


--DROP TABLE Bottom cascade CONSTRAINTS; 
CREATE TABLE Bottom(
bottomID        NUMBER(10)     NOT NULL, 
bottomFit       VARCHAR2(7)    NOT NULL 
CHECK(bottomFit  IN ('Regular', 'Tall')), 
bottomSize   VARCHAR2(10)      NOT NULL 
CHECK(bottomSize IN ('S', 'M', 'L', 'XL', 'XXL', '3XL')), 
bottomType      VARCHAR2(11)   NOT NULL 
CHECK(bottomType IN ('Sweatpants', 'Leggings', 'Pants', 'Shorts')), 
CONSTRAINT bottom_fk FOREIGN KEY (bottomID) REFERENCES Product(productID) ON DELETE CASCADE, 
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
GRANT SELECT ON Product to PUBLIC; 
GRANT SELECT ON Shoes to PUBLIC; 
GRANT SELECT ON Top to PUBLIC; 
GRANT SELECT ON Bottom to PUBLIC; 
GRANT SELECT ON Returns to PUBLIC; 

COMMIT;
