ALTER SESSION SET nls_date_format='MM/DD/YYYY HH24:MI';

/* **************************************
   *************** Customer *************
   **************************************
*/

INSERT ALL
    INTO Customer VALUES(1, 'Andrew','Tesla','McDonald',7575852822,'andrewTM@gmail.com','222 Wayne St.','Philadelphia','PA','19033')
    INTO Customer VALUES(2, 'Michael','Herz','Jane',7576442822,'michaelj@gmail.com','10 Jefferson Rd.','Philadelphia','PA','19332')
    INTO Customer VALUES(3, 'Kim',NULL,'Harrison',7579442334,'kimharrison@yahoo.com','56 Brooks Rd.','Brooklyn','NY','11345')
    INTO Customer VALUES(4, 'Michael','Dawson','Evans',5652242334,'micdawson@outlook.com','23 Dover Ln.','Philadelphia','PA','19041')
    INTO Customer VALUES(5, 'John','Mitchell','Robinson',5652212244,'johnmitch@icloud.com','22 Walter Dr.','Tampa','FL','33621')
    INTO Customer VALUES(6, 'Haris','Hughes','Williamson',5772214244,'harison@icloud.com','340 Kensigton Rd.','Orlando','FL','33045')
    INTO Customer VALUES(7, 'Thomas','Edison','Jefferson',5772216624,'thomasj@icloud.com','410 Herkimier','Brooklyn','NY','11614')
    INTO Customer VALUES(8, 'Elai','Thompson','Clay',7272212624,'elait@gmail.com','410 Aurora St.','Austin','TX','33123')
    INTO Customer VALUES(9, 'Clay','Richard','Thompson',7272102633,'clayt@gmail.com','410 Miami-Dade St.','Miami','FL','33125')
    INTO Customer VALUES(10, 'Thomas','Richard','Oppenheim',7232042433,'oppentom@gmail.com','423 Traders St.','Cleveland','OH','12045')
SELECT * FROM DUAL;

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
-- SELECT * FROM Payment;


/* **************************************
   *************** Product **************
   **************************************
*/

INSERT ALL
    INTO Product VALUES(1, 'Cold Gear Infared Hoodie', 'Athleisure', 25, 34.60, 'Men', 'Black', NULL, 'Basketball')
    INTO Product VALUES(2, 'Rush Seamless Sleeveless', 'Training', 15, 60.00, 'Men', 'Grey', 'Project Rock', 'Special Collection')
    INTO Product VALUES(3, 'Rush Smart Form Long Shorts', 'Training', 29, 70.00, 'Men', 'camo green', 'Project Rock', 'Special Collection') 
    INTO Product VALUES(4, 'Tribase Reign 4 Pro Shoes', 'Athleisure', 58, 140.00, 'Men', 'lime green', 'Reign 4', 'Special Collection')
    INTO Product VALUES(5, 'Tech V-neck', 'Training', 81, 24.99, 'Women', 'Maroon', NULL, 'Women Training')
    INTO Product VALUES(6,'Meridian Crop', 'Training', 35, 65.00, 'Women', 'Rose', 'Meridian', 'Women Training')
    INTO Product VALUES(7, 'Meridian Joggers', 'Training', 55, 75.00, 'Women', 'Black', 'Meridian', 'Women Training') 
    INTO Product VALUES(8, 'Meridian Leggings', 'Training', 70, 40.00, 'Women', 'Khaki', 'UA Meridian', 'Women Training') 
    INTO Product VALUES(9, 'Rush Warm Up Hoodie', 'Athleisure', 45, 44.50, 'Men', 'Grey', NULL, 'Basketball')
    INTO Product VALUES(10, 'Nike Air Max 97', 'Shoes built for runners', 100, 44.50, 'Women', 'Grey', NULL, 'Running') 
    INTO Product VALUES(11, 'Nike Air Max 97', 'Shoes built for runners', 100, 44.50, 'Women', 'Yellow', NULL, 'Running') 
    INTO Product VALUES(12, 'Nike Air Max 79', 'Shoes built for runners', 100, 44.50, 'Men', 'Shiny Grey', NULL, 'Running') 
SELECT * FROM DUAL;    
    

/* **************************************
   ************* Subclasses *************
   **************************************
*/

-- TOP
INSERT ALL
    INTO Top VALUES(1,'Regular','S','Long Sleeve')
    INTO Top VALUES(2,'Regular','M','Sleeveless')
    INTO Top VALUES(5,'Tall','M', 'Long Sleeve')
    INTO Top VALUES(6,'Tall','L', 'Long Sleeve')
    INTO Top VALUES(9,'Tall','M', 'Long Sleeve')
SELECT * FROM DUAL;

-- Bottom
INSERT ALL
    INTO Bottom VALUES(3,'Regular','M','Shorts')
    INTO Bottom VALUES(7,'Tall','M', 'Leggings')
    INTO Bottom VALUES(8,'Regular','M', 'Leggings')
SELECT * FROM DUAL;

-- Shoes
INSERT ALL
    INTO Shoes VALUES(4,9,42)
    INTO Shoes VALUES(10,8.5,41.5)
    INTO Shoes VALUES(11,9,42)
    INTO Shoes VALUES(12,10,43.5)
SELECT * FROM DUAL;


-- Sanity Check
--SELECT * FROM Product;
--SELECT * FROM Top;
--SELECT * FROM Bottom;
--SELECT * FROM Shoes;



/* **************************************
   ***************** Cart ***************
   **************************************
*/

INSERT ALL
    INTO Cart(customerID, productID, quantity) VALUES (1, 1, 2)
    INTO Cart(customerID, productID, quantity) VALUES (1, 3, 1)
    INTO Cart(customerID, productID, quantity) VALUES (1, 6, 4)
    INTO Cart(customerID, productID, quantity) VALUES (2, 8, 2)
    INTO Cart(customerID, productID, quantity) VALUES (2, 2, 2)
    INTO Cart(customerID, productID, quantity) VALUES (4, 3, 2)
    INTO Cart(customerID, productID, quantity) VALUES (4, 2, 1)
    INTO Cart(customerID, productID, quantity) VALUES (5, 1, 1)
SELECT * FROM DUAL;



/* **************************************
   **************** Orders **************
   **************************************
*/

INSERT ALL
    INTO Orders VALUES(1, 5, TO_DATE( '12/04/2020 10:45', 'MM/DD/YYYY HH24:MI'), 1, 118214)
    INTO Orders VALUES(2, 5, TO_DATE( '01/01/2021 13:00', 'MM/DD/YYYY HH24:MI'), 2, 218751)
    INTO Orders VALUES(3, 5, TO_DATE( '01/01/2021 13:30', 'MM/DD/YYYY HH24:MI'), 3, 327510)
    INTO Orders VALUES(4, 5, TO_DATE( '01/01/2021 13:40', 'MM/DD/YYYY HH24:MI'), 4, 421826)
    INTO Orders VALUES(5, 5, TO_DATE( '01/01/2021 13:50', 'MM/DD/YYYY HH24:MI'), 5, 110142)
    INTO Orders VALUES(6, 5, TO_DATE( '02/01/2021 09:40', 'MM/DD/YYYY HH24:MI'), 3, 327510)
    INTO Orders VALUES(7, 5, TO_DATE( '02/01/2021 13:40', 'MM/DD/YYYY HH24:MI'), 2, 218751)
    INTO Orders VALUES(8, 5,TO_DATE( '03/01/2021 15:25', 'MM/DD/YYYY HH24:MI'), 8, 114914)
    INTO Orders VALUES(9, 5,TO_DATE( '03/01/2021 18:00', 'MM/DD/YYYY HH24:MI'), 7, 413152)
SELECT * FROM DUAL;



/* **************************************
   ************** LineItem **************
   **************************************
*/

INSERT ALL
    INTO lineItem VALUES(1, 1, 2, 0,2) -- Order #1
    INTO lineItem VALUES(2, 1, 1, 5,4)
    INTO lineItem VALUES(1, 2, 2, 0,7) -- Order #2
    INTO lineItem VALUES(2, 2, 3, 5,4)
    INTO lineItem VALUES(1, 3, 1, 0,5) -- Order #3
    INTO lineItem VALUES(1, 4, 6, 5,4) -- Order #4
    INTO lineItem VALUES(1, 5, 2, 0,6) -- Order #5
    INTO lineItem VALUES(2, 5, 1, 0,3)
    INTO lineItem VALUES(1, 6, 1, 0,7) -- Order #6
    INTO lineItem VALUES(2, 6, 1, 0,9)
    INTO lineItem VALUES(1, 7, 1, 0,7) -- Order #7
    INTO lineItem VALUES(1, 8, 2, 0,1) -- Order #8
    INTO lineItem VALUES(1, 9, 1, 0,9) -- Order #9
    INTO lineItem VALUES(2, 9, 1, 0,3)
    INTO lineItem VALUES(3, 9, 1, 0,2)
SELECT * FROM DUAL;

-- Sanity Check
--SELECT * FROM orders;
--SELECT * FROM lineItem;


/* **************************************
   ************** Shipment **************
   **************************************
*/

INSERT ALL
    INTO Shipment VALUES('A7FV4NS0', 1, '222 Wayne St.', 'Philadelphia', 'PA', '19033', 'FedEx')
    INTO Shipment VALUES('SAMNS882M', 2, '10 Jefferson Rd.', 'Philadelphia', 'PA', '19332','UPS')
    INTO Shipment VALUES('LKMN892NN', 3, '56 Brooks Rd.', 'Brooklyn', 'NY', '11345','UPS')
    INTO Shipment VALUES('LMKSN02', 4, '23 Dover Ln.', 'Philadelphia', 'PA', '19041','FedEx')
    INTO Shipment VALUES('ALPMMWEX', 5, '22 Walter Dr.', 'Tamp', 'FL', '33621','UPS')
    INTO Shipment VALUES('LPIIEMM2', 6, '56 Brooks Rd.', 'Brooklyn', 'NY', '11345','UPS')
    INTO Shipment VALUES('PLSDMNUA8', 7, '10 Jefferson Rd.', 'Philadelphia', 'PA', '19332','UPS')
    INTO Shipment VALUES('LMNOPASDC', 8, '410 Aurora St.', 'Austin', 'TX', '33123','FedEx')
SELECT * FROM DUAL;

-- Sanity check
--SELECT * FROM Shipment

/* **************************************
   ************** Returns ***************
   **************************************
*/

INSERT ALL
    INTO Returns VALUES(1,2, TO_DATE( '12/10/2020 10:00', 'MM/DD/YYYY HH24:MI'), 1)
    INTO Returns VALUES(2,4, TO_DATE( '03/01/2021 10:00', 'MM/DD/YYYY HH24:MI'), 2)
    INTO Returns VALUES(8,1, TO_DATE( '05/01/2021 10:00', 'MM/DD/YYYY HH24:MI'), 1)
SELECT * FROM DUAL;

-- Sanity Check
-- SELECT * FROM RETURNs;


COMMIT;
