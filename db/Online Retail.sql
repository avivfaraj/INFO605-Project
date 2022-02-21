/* **************************************
   *********** Strong Entities **********
   **************************************
*/

-- DROP TABLE Customer CASCADE CONSTRAINTs; 
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


-- DROP TABLE Cart CASCADE CONSTRAINTs; 
CREATE TABLE Cart (
cartID                 NUMBER(10)    NOT NULL,  
cartSubtotal           NUMBER(4,2), 
cartTax                NUMBER(4,2),  
CONSTRAINT cart_pk PRIMARY KEY (cartID));


-- drop table Payment cascade CONSTRAINTS; 
CREATE TABLE Payment(
paymentID               NUMBER(6)    NOT NULL, 
paymentType             VARCHAR2(6)  NOT NULL 
CHECK (paymentType in ('Debit', 'Credit')), 
paymentDigits           NUMBER(4)    NOT NULL, 
paymentCompany          VARCHAR2(10) NOT NULL, 
CHECK (paymentCompany in ('Visa','AMEX', 'Mastercard')), 
CONSTRAINT payment_pk PRIMARY KEY (paymentID));


-- Drop table Product cascade CONSTRAINTS; 
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


-- drop table Orders cascade CONSTRAINTS; 
CREATE TABLE Orders(
orderID                  NUMBER (10) NOT NULL,  
orderSubtotal            NUMBER(4,2), 
orderTax                 NUMBER(4,2), 
orderDate                DATE, 
orderTime                DATE, 
shippingCost             NUMBER(4,2), 
customerID               NUMBER(10)  NOT NULL, 
CONSTRAINT order_pk PRIMARY KEY (orderID), 
CONSTRAINT order_fk FOREIGN KEY (customerID) REFERENCES Customer (customerID));


/* **************************************
   *********** Weak Entities ************
   **************************************
*/






/* **************************************
   *********** Sub-classes **************
   **************************************
*/

