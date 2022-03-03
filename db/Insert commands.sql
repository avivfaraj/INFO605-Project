ALTER SESSION SET nls_date_format='MM/DD/YYYY HH24:MI';

/* **************************************
   *************** Customer *************
   **************************************
*/
INSERT INTO Customer (fName, mName, lName, phone, email, street, city, state, zip) 
    VALUES('Andrew','Tesla','McDonald',7575852822,'andrewTM@gmail.com','222 Wayne St.','Philadelphia','PA','19033');
    
INSERT INTO Customer (fName, mName, lName, phone, email, street, city, state, zip)
    VALUES('Michael','Herz','Jane',7576442822,'michaelj@gmail.com','10 Jefferson Rd.','Philadelphia','PA','19332');
    
INSERT INTO Customer (fName, mName, lName, phone, email, street, city, state, zip)
    VALUES('Kim',NULL,'Harrison',7579442334,'kimharrison@yahoo.com','56 Brooks Rd.','Brooklyn','NY','11345');

INSERT INTO Customer (fName, mName, lName, phone, email, street, city, state, zip)
    VALUES('Michael','Dawson','Evans',5652242334,'micdawson@outlook.com','23 Dover Ln.','Philadelphia','PA','19041');

INSERT INTO Customer (fName, mName, lName, phone, email, street, city, state, zip)
    VALUES('John','Mitchell','Robinson',5652212244,'johnmitch@icloud.com','22 Walter Dr.','Tampa','FL','33621');

INSERT INTO Customer (fName, mName, lName, phone, email, street, city, state, zip)
    VALUES('Haris','Hughes','Williamson',5772214244,'harison@icloud.com','340 Kensigton Rd.','Orlando','FL','33045');

INSERT INTO Customer (fName, mName, lName, phone, email, street, city, state, zip)
    VALUES('Thomas','Edison','Jefferson',5772216624,'thomasj@icloud.com','410 Herkimier','Brooklyn','NY','11614');

INSERT INTO Customer (fName, mName, lName, phone, email, street, city, state, zip)
    VALUES('Elai','Thompson','Clay',7272212624,'elait@gmail.com','410 Aurora St.','Austin','TX','33123');

INSERT INTO Customer (fName, mName, lName, phone, email, street, city, state, zip)
    VALUES('Clay','Richard','Thompson',7272102633,'clayt@gmail.com','410 Miami-Dade St.','Miami','FL','33125');

INSERT INTO Customer (fName, mName, lName, phone, email, street, city, state, zip)
    VALUES('Thomas','Richard','Oppenheim',7232042433,'oppentom@gmail.com','423 Traders St.','Cleveland','OH','12045');

-- Sanity Check
--SELECT * FROM Customer;


/* **************************************
   *************** Payment **************
   **************************************
*/

/* paymentID Generation: company, type, 4digits 
    Companies: 
        Visa - 1
        Mastercard - 2
        Capital One - 3
        AMEX - 4
        Bank of America - 5
    
    Type: Debit - 1, Credit - 2
    
    Example: Visa (1), Credit(2), 8222 ----> paymentID = 128222
*/
INSERT ALL
    INTO Payment VALUES (118214, 'Debit', 8214, 'Visa')
    INTO Payment VALUES (218751, 'Debit', 8214, 'Mastercard')
    INTO Payment VALUES (327510, 'Credit', 7510, 'Capital One')
    INTO Payment VALUES (421826, 'Credit', 1826, 'AMEX')
    INTO Payment VALUES (110142, 'Debit', 0142, 'Visa')
    INTO Payment VALUES (526179, 'Credit', 6179, 'Bank of America')
    INTO Payment VALUES (413152, 'Debit', 3152, 'AMEX')
    INTO Payment VALUES (114914, 'Debit', 4914, 'Visa')
    INTO Payment VALUES (217162, 'Debit', 7162, 'Mastercard')
    INTO Payment VALUES (320981, 'Credit', 0981, 'Capital One')
SELECT * FROM DUAL;

-- Sanity Check
--SELECT * FROM Payment;


/* **************************************
   *************** Product **************
   **************************************
*/


INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Cold Gear Infared Hoodie', 'Athleisure', 25, 34.60, 'Men', 'Black', NULL, 'Basketball'); 

INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Rush Seamless Sleeveless', 'Training', 15, 60.00, 'Men', 'Grey', 'Project Rock', 'Special Collection'); 

INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Rush Smart Form Long Shorts', 'Training', 29, 70.00, 'Men', 'camo green', 'Project Rock', 'Special Collection'); 

INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Tribase Reign 4 Pro Shoes', 'Athleisure', 58, 140.00, 'Men', 'lime green', 'Reign 4', 'Special Collection'); 
 
INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Tech V-neck', 'Training', 81, 24.99, 'Women', 'Maroon', NULL, 'Women Training'); 

INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Meridian Crop', 'Training', 35, 65.00, 'Women', 'Rose', 'Meridian', 'Women Training'); 

INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Meridian Joggers', 'Training', 55, 75.00, 'Women', 'Black', 'Meridian', 'Women Training'); 

INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Meridian Leggings', 'Training', 70, 40.00, 'Women', 'Khaki', 'UA Meridian', 'Women Training'); 

INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Rush Warm Up Hoodie', 'Athleisure', 45, 44.50, 'Men', 'Grey', NULL, 'Basketball'); 

INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Nike Air Max 97', 'Shoes built for runners', 100, 44.50, 'Women', 'Grey', NULL, 'Running'); 

INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Nike Air Max 97', 'Shoes built for runners', 100, 44.50, 'Women', 'Yellow', NULL, 'Running'); 

INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Nike Air Max 79', 'Shoes built for runners', 100, 44.50, 'Men', 'Shiny Grey', NULL, 'Running'); 




/* **************************************
   ************* Subclasses *************
   **************************************
*/

-- TOP
INSERT INTO Top VALUES(1,'Regular','S','Long Sleeve');
INSERT INTO Top VALUES(2,'Regular','M','Sleeveless');
INSERT INTO Top VALUES(5,'Tall','M', 'Long Sleeve');
INSERT INTO Top VALUES(6,'Tall','L', 'Long Sleeve');
INSERT INTO Top VALUES(9,'Tall','M', 'Long Sleeve');

-- Bottom
INSERT INTO Bottom VALUES(3,'Regular','M','Shorts');
INSERT INTO Bottom VALUES(7,'Tall','M', 'Leggings');
INSERT INTO Bottom VALUES(8,'Regular','M', 'Leggings');

-- Shoes
INSERT INTO Shoes VALUES(4,9,42);
INSERT INTO Shoes VALUES(10,8.5,41.5);
INSERT INTO Shoes VALUES(11,9,42);
INSERT INTO Shoes VALUES(12,10,43.5);




-- Sanity Check
--SELECT * FROM Product;
--SELECT * FROM Top;
--SELECT * FROM Bottom;
--SELECT * FROM Shoes;



/* **************************************
   ***************** Cart ***************
   **************************************
*/

-- Probably will change the way we insert Subtotal!

INSERT INTO Cart(customerID, productID, quantity) VALUES (1, 1, 2);
INSERT INTO Cart(customerID, productID, quantity) VALUES (1, 3, 1);
INSERT INTO Cart(customerID, productID, quantity) VALUES (1, 6, 4);
INSERT INTO Cart(customerID, productID, quantity) VALUES (2, 8, 2);
INSERT INTO Cart(customerID, productID, quantity) VALUES (2, 8, 2);
INSERT INTO Cart(customerID, productID, quantity) VALUES (4, 3, 2);
INSERT INTO Cart(customerID, productID, quantity) VALUES (4, 2, 1);
INSERT INTO Cart(customerID, productID, quantity) VALUES (5, 1, 1);


-- Sanity Check
--SELECT * FROM Cart;


/* **************************************
   **************** Orders **************
   **************************************
*/

-- Order #1
INSERT INTO Orders(shippingCost, orderTimestamp, customerID, paymentID) 
    VALUES(5,TO_DATE( '12/04/2020 10:45', 'MM/DD/YYYY HH24:MI'), 1, 118214);

-- Order #2
INSERT INTO Orders(shippingCost, orderTimestamp, customerID, paymentID) 
VALUES(5,TO_DATE( '01/01/2021 13:00', 'MM/DD/YYYY HH24:MI'), 2, 218751);

-- Order #3
INSERT INTO Orders(shippingCost, orderTimestamp, customerID, paymentID) 
VALUES(5,TO_DATE( '01/01/2021 13:30', 'MM/DD/YYYY HH24:MI'), 3, 327510);

-- Order #4
INSERT INTO Orders(shippingCost, orderTimestamp, customerID, paymentID) 
VALUES(5,TO_DATE( '01/01/2021 13:40', 'MM/DD/YYYY HH24:MI'), 4, 421826);

-- Order #5
INSERT INTO Orders(shippingCost, orderTimestamp, customerID, paymentID) 
VALUES(5,TO_DATE( '01/01/2021 13:50', 'MM/DD/YYYY HH24:MI'), 5, 110142);

-- Order #6
INSERT INTO Orders(shippingCost, orderTimestamp, customerID, paymentID) 
VALUES(5,TO_DATE( '02/01/2021 09:40', 'MM/DD/YYYY HH24:MI'), 3, 327510);

-- Order #7
INSERT INTO Orders(shippingCost, orderTimestamp, customerID, paymentID) 
VALUES(5,TO_DATE( '02/01/2021 13:40', 'MM/DD/YYYY HH24:MI'), 2, 218751);

-- Order #8
INSERT INTO Orders(shippingCost, orderTimestamp, customerID, paymentID) 
VALUES(5,TO_DATE( '03/01/2021 15:25', 'MM/DD/YYYY HH24:MI'), 8, 114914);

-- Order #9
INSERT INTO Orders(shippingCost, orderTimestamp, customerID, paymentID) 
VALUES(5,TO_DATE( '03/01/2021 18:00', 'MM/DD/YYYY HH24:MI'), 7, 413152);

-- Sanity Check
--SELECT * FROM Orders;



/* **************************************
   ************** LineItem **************
   **************************************
*/
-- orderID = 1
INSERT INTO lineItem VALUES(1, 1, 2, 0,2);
INSERT INTO lineItem VALUES(2, 1, 1, 5,4);

-- orderID = 2
INSERT INTO lineItem VALUES(1, 2, 2, 0,7);
INSERT INTO lineItem VALUES(2, 2, 3, 5,4);

-- orderID = 3
INSERT INTO lineItem VALUES(1, 3, 1, 0,5);

-- orderID = 4
INSERT INTO lineItem VALUES(1, 4, 6, 5,4);

-- orderID = 5
INSERT INTO lineItem VALUES(1, 5, 2, 0,6);
INSERT INTO lineItem VALUES(2, 5, 1, 0,3);

-- orderID = 6
INSERT INTO lineItem VALUES(1, 6, 1, 0,7);
INSERT INTO lineItem VALUES(2, 6, 1, 0,9);

-- orderID = 7
INSERT INTO lineItem VALUES(1, 7, 1, 0,7);

-- orderID = 8
INSERT INTO lineItem VALUES(1, 8, 2, 0,1);

-- orderID = 9
INSERT INTO lineItem VALUES(1, 9, 1, 0,9);
INSERT INTO lineItem VALUES(2, 9, 1, 0,3);
INSERT INTO lineItem VALUES(3, 9, 1, 0,2);

-- Sanity Check
--SELECT * FROM lineItem;



/* **************************************
   ************** Shipment **************
   **************************************
*/
INSERT INTO Shipment VALUES('A7FV4NS0', 1, '222 Wayne St.', 'Philadelphia', 'PA', '19033', 'FedEx');
INSERT INTO Shipment VALUES('SAMNS882M', 2, '10 Jefferson Rd.', 'Philadelphia', 'PA', '19332','UPS');
INSERT INTO Shipment VALUES('LKMN892NN', 3, '56 Brooks Rd.', 'Brooklyn', 'NY', '11345','UPS');
INSERT INTO Shipment VALUES('LMKSN02', 4, '23 Dover Ln.', 'Philadelphia', 'PA', '19041','FedEx');
INSERT INTO Shipment VALUES('ALPMMWEX', 5, '22 Walter Dr.', 'Tamp', 'FL', '33621','UPS');
INSERT INTO Shipment VALUES('LPIIEMM2', 6, '56 Brooks Rd.', 'Brooklyn', 'NY', '11345','UPS');
INSERT INTO Shipment VALUES('SAMNS882M', 7, '10 Jefferson Rd.', 'Philadelphia', 'PA', '19332','UPS');
INSERT INTO Shipment VALUES('SAMNS882M', 8, '410 Aurora St.', 'Austin', 'TX', '33123','FedEx');

-- Sanity Check
--SELECT * FROM Shipment;



/* **************************************
   ************** Returns ***************
   **************************************
*/

INSERT INTO Returns (orderID, productID, returnDate, quantity)
VALUES(1,2, TO_DATE( '12/10/2020 10:00', 'MM/DD/YYYY HH24:MI'), 1);

INSERT INTO Returns (orderID, productID, returnDate, quantity)
VALUES(2,4, TO_DATE( '03/01/2021 10:00', 'MM/DD/YYYY HH24:MI'), 2);

INSERT INTO Returns (orderID, productID, returnDate, quantity)
VALUES(8,1, TO_DATE( '05/01/2021 10:00', 'MM/DD/YYYY HH24:MI'), 1);


-- Sanity Check
--SELECT * FROM RETURNs;
