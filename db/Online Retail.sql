/* **************************************
   *********** Strong Entities **********
   **************************************
*/

-- DROP TABLE Customer CASCADE CONSTRAINTS; 
CREATE TABLE Customer (
customerID             NUMBER(10)    NOT NULL,  
customerFirstName      VARCHAR2(20)  NOT NULL, 
customerMiddleName     VARCHAR2(20), 
customerLastName       VARCHAR2(20)  NOT NULL, 
customerPhone          NUMBER(10)    UNIQUE, 
customerEmail          VARCHAR2(20)  NOT NULL UNIQUE, 
street                 VARCHAR2(20)  NOT NULL, 
city                   VARCHAR2(20)  NOT NULL, 
state                  CHAR(2)       NOT NULL, 
zip                    CHAR(5)       NOT NULL, 
CONSTRAINT customer_pk PRIMARY KEY (customerID));


-- DROP TABLE Cart CASCADE CONSTRAINTS; 
CREATE TABLE Cart (
cartID                 NUMBER(10)    NOT NULL,  
cartSubtotal           NUMBER(4,2), 
cartTax                NUMBER(4,2),  
CONSTRAINT cart_pk PRIMARY KEY (cartID));


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

-- Changed Order TABLEname to Orders since Order is a saved word in SQL
-- DROP TABLE Orders CASCADE CONSTRAINTS; 
CREATE TABLE Orders(
orderID                  NUMBER (10) NOT NULL,  
orderSubtotal            NUMBER(4,2), 
orderTax                 NUMBER(4,2), 
orderDate                DATE, 
orderTime                DATE, 
shippingCost             NUMBER(4,2), 
customerID               NUMBER(10)  NOT NULL, 
CONSTRAINT orders_pk PRIMARY KEY (orderID), 
CONSTRAINT orders_fk FOREIGN KEY (customerID) REFERENCES Customer (customerID));


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

