
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
SELECT * FROM Customer;

/* **************************************
   ***************** Cart ***************
   **************************************
*/

-- Probably will change the way we insert Subtotal!

-- *************** Cart #1 ****************
-- Creating Cart with 0,5 (subtotal and tax)
INSERT INTO Cart(cartSubtotal, cartTax, customerID) VALUES(0,5,2);

-- Inserting items to this cart
INSERT INTO cartLineItem VALUES(1, 1, 2);
INSERT INTO cartLineItem VALUES(1, 6, 3);

-- Updating cart's subtotal according to item's prices and quantity
UPDATE Cart
SET cartSubtotal = (SELECT SUM(cli.quantity * p.productPrice)
                FROM cartLineItem cli
                INNER JOIN Product p
                ON cli.productID = p.productID
                WHERE cli.cartID = 1)
WHERE cartID = 1;
                


-- *************** Cart #2 ****************
-- Creating Cart with 0,5 (subtotal and tax)
INSERT INTO Cart(cartSubtotal, cartTax, customerID) VALUES(0,5,2);

-- Inserting items to this cart
INSERT INTO cartLineItem VALUES(2, 5, 2);
INSERT INTO cartLineItem VALUES(2, 2, 1);

-- Updating cart's subtotal according to item's prices and quantity
UPDATE Cart
SET cartSubtotal = (SELECT SUM(cli.quantity * p.productPrice)
                FROM cartLineItem cli
                INNER JOIN Product p
                ON cli.productID = p.productID
                WHERE cli.cartID = 2)
WHERE cartID = 2;


-- The same process we will use for orders

-- Sanity Check
SELECT * FROM CART;


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
SELECT * FROM Payment


/* **************************************
   *************** Product **************
   **************************************
*/


INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Cold Gear Infared Hoodie', 'Athleisure', 25, 34.60, 'Men', 'Black', NULL, 'Basketball'); 

INSERT INTO TOP VALUES((SELECT MAX(productID) FROM Product),'Regular','S','Long Sleeve');

    

INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Rush Seamless Sleeveless', 'Training', 15, 60.00, 'Men', 'Grey', 'Project Rock', 'Special Collection'); 

INSERT INTO TOP VALUES((SELECT MAX(productID) FROM Product),'Regular','M','Sleeveless');
    

INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Rush Smart Form Long Shorts', 'Training', 29, 70.00, 'Men', 'camo green', 'Project Rock', 'Special Collection'); 

INSERT INTO Bottom VALUES((SELECT MAX(productID) FROM Product),'Regular','M','Shorts');


INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Tribase Reign 4 Pro Shoes', 'Athleisure', 58, 140.00, 'Men', 'lime green', 'Reign 4', 'Special Collection'); 

INSERT INTO Shoes VALUES((SELECT MAX(productID) FROM Product),9,10);
    
INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Tech V-neck', 'Training', 81, 24.99, 'Women', 'Maroon', NULL, 'Women Training'); 

INSERT INTO Top VALUES((SELECT MAX(productID) FROM Product),'Tall','M', 'Long Sleeve');


INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Meridian Crop', 'Training', 35, 65.00, 'Women', 'Rose', 'Meridian', 'Women Training'); 

INSERT INTO Top VALUES((SELECT MAX(productID) FROM Product),'Tall','L', 'Long Sleeve');


INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Meridian Joggers', 'Training', 55, 75.00, 'Women', 'Black', 'Meridian', 'Women Training'); 

INSERT INTO Bottom VALUES((SELECT MAX(productID) FROM Product),'Tall','M', 'Leggings');



INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Meridian Leggings', 'Training', 70, 40.00, 'Women', 'Khaki', 'UA Meridian', 'Women Training'); 

INSERT INTO Bottom VALUES((SELECT MAX(productID) FROM Product),'Regular','M', 'Leggings');



INSERT INTO Product (productName, productDescription, productQuantity, productPrice, productSection, productColor, productCollection, productCategory) 
    VALUES('Rush Warm Up Hoodie', 'Athleisure', 45, 44.50, 'Men', 'Grey', NULL, 'Basketball'); 

INSERT INTO Top VALUES((SELECT MAX(productID) FROM Product),'Tall','M', 'Long Sleeve');


-- Sanity Check
SELECT * FROM Product;
SELECT * FROM Top;
SELECT * FROM Bottom;
SELECT * FROM Shoes;



