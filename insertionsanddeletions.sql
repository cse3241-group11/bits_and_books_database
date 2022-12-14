--WAREHOUSE
INSERT INTO WAREHOUSE VALUES(0,'A', '', '', '', '', '111111111');
INSERT INTO WAREHOUSE VALUES(1,'B', '', '', '', '', '111111112');
INSERT INTO WAREHOUSE VALUES(2,'C', '', '', '', '', '111111113');
INSERT INTO WAREHOUSE VALUES(3,'D', '', '', '', '', '111111114');
INSERT INTO WAREHOUSE VALUES(4,'E', '', '', '', '', '111111115');
-- INSERT INTO WAREHOUSE VALUES(0,'F', '', '', '', '', '');
-- INSERT INTO WAREHOUSE VALUES(0,'G', '', '', '', '', '');
-- INSERT INTO WAREHOUSE VALUES(0,'H', '', '', '', '', '');
-- INSERT INTO WAREHOUSE VALUES(0,'I', '', '', '', '', '');
-- INSERT INTO WAREHOUSE VALUES(0,'J', '', '', '', '', '');
-- INSERT INTO WAREHOUSE VALUES(0,'K', '', '', '', '', '');
-- INSERT INTO WAREHOUSE VALUES(0,'L', '', '', '', '', '');
-- INSERT INTO WAREHOUSE VALUES(0,'O', '', '', '', '', '');
-- INSERT INTO WAREHOUSE VALUES(0,'P', '', '', '', '', '');
-- INSERT INTO WAREHOUSE VALUES(0,'Q', '', '', '', '', '');
-- INSERT INTO WAREHOUSE VALUES(0,'R', '', '', '', '', '');
-- INSERT INTO WAREHOUSE VALUES(0,'S', '', '', '', '', '');
-- INSERT INTO WAREHOUSE VALUES(0,'T', '', '', '', '', '');
-- INSERT INTO WAREHOUSE VALUES(0,'U', '', '', '', '', '');
-- INSERT INTO WAREHOUSE VALUES(0,'V', '', '', '', '', '');

--EMPLOYEE
-- INSERT INTO WAREHOUSE VALUES('SSN','First_Name', 'M_init', 'Last_Name', 'Bdate', 'Salary', 'E_street', 'E_city', 'E_state', 'E_zip', 'Warehouse_number', 'Administrator_SSN');
INSERT INTO EMPLOYEE VALUES('111111111', 'Hanson', null, 'Ma', null, 10000, null, null, null, null, null, null);
INSERT INTO EMPLOYEE VALUES('111111112', 'Neha', null, 'Checka', null, 20000, null, null, null, null, null, null);
INSERT INTO EMPLOYEE VALUES('111111113', 'Ted', null, 'Li', null, 30000, null, null, null, null, null, null);
INSERT INTO EMPLOYEE VALUES('111111114', 'Alexandra', null, 'Kashani', null, 40000, null, null, null, null, null, null);
INSERT INTO EMPLOYEE VALUES('111111115', 'Odin', null, 'Acevedo', null, 10000, null, null, null, null, null, null);
INSERT INTO EMPLOYEE VALUES('111111116', 'Jacqueline', null, 'Piper', null, 10000, null, null, null, null, 0, '111111111');
INSERT INTO EMPLOYEE VALUES('111111117', 'Keanu', null, 'Crosby', null, 10000, null, null, null, null, 0, '111111111');
INSERT INTO EMPLOYEE VALUES('111111118', 'asdf', null, 'asdf', null, 10000, null, null, null, null, 0, '111111111');
INSERT INTO EMPLOYEE VALUES('111111119', 'Kate', null, 'Hull', null, 10000, null, null, null, null, 1, '111111112');
INSERT INTO EMPLOYEE VALUES('111111110', 'Amanda', null, 'Rodriguez', null, 20000, null, null, null, null, 1, '111111112');
INSERT INTO EMPLOYEE VALUES('011111111', 'Ted', null, 'Ford', null, 30000, null, null, null, null, 1, '111111112');
INSERT INTO EMPLOYEE VALUES('001111112', 'Alex', null, 'Smith', null, 40000, null, null, null, null, 2, '111111113');
INSERT INTO EMPLOYEE VALUES('001111113', 'Jack', null, 'Black', null, 10000, null, null, null, null, 2, '111111113');
INSERT INTO EMPLOYEE VALUES('011111114', 'Leo', null, 'Oliver', null, 40000, null, null, null, null, 2, '111111113');
INSERT INTO EMPLOYEE VALUES('011111115', 'Nina', null, 'Patel', null, 20000, null, null, null, null, 3, '111111114');
INSERT INTO EMPLOYEE VALUES('011111116', 'Ania', null, 'Brzozka', null, 30000, null, null, null, null, 3, '111111114');
INSERT INTO EMPLOYEE VALUES('011111117', 'Patrick', null, 'Yang', null, 10000, null, null, null, null, 3, '111111114');
INSERT INTO EMPLOYEE VALUES('011111118', 'Liyah', null, 'Bouza', null, 20000, null, null, null, null, 4, '111111115');
INSERT INTO EMPLOYEE VALUES('011111119', 'Eddie', null, 'Allen', null, 30000, null, null, null, null, 4, '111111115');
INSERT INTO EMPLOYEE VALUES('011111120', 'Nia', null, 'Smith', null, 40000, null, null, null, null, 4, '111111115');

--ADMINISTRATOR
INSERT INTO ADMINISTRATOR VALUES('111111111');
INSERT INTO ADMINISTRATOR VALUES('111111112');
INSERT INTO ADMINISTRATOR VALUES('111111113');
INSERT INTO ADMINISTRATOR VALUES('111111114');
INSERT INTO ADMINISTRATOR VALUES('111111115');

--BOOK
-- Insert into book table information about the book titled "The Book Thief"
INSERT INTO BOOK VALUES ('0235670861','The Book Thief' ,'0.33','0.58','50','2002-01-01');
-- Insert into book table information about the book titled "It Ends with Us: A Novel"
INSERT INTO BOOK VALUES ('1501110365', 'It Ends with Us: A Novel', '0.37', '0.43', '95', '2016-08-02');
--INSERT INTO BOOK VALUES ('ISBN', 'Title', 'discount price', 'margin percent', 'publisher_price', 'published_date');

--PUBLISHER
-- Insert into publisher table information about the publisher named "Addison-Nicholas Pub Co"
INSERT INTO PUBLISHER (Publisher_street, Publisher_city, Publisher_state, Publisher_zip,
                                                 Publisher_Name, publisher_ordering_website) VALUES
                      ('70532 Preston Underpass','New Nicholestad','DE','19979','Addison-Nicholas Pub Co',
                                                                                'db-913.diaz.larsen.net');
-- Insert into publisher table information about the publisher named "Jossey-Guitar"
INSERT INTO PUBLISHER (Publisher_street, Publisher_city, Publisher_state, Publisher_zip,
                                                Publisher_Name, publisher_ordering_website) VALUES
                      ('6299 Robinson Mountains Apt. 387', 'Riggsborough', 'MD', '21883', 'Jossey-Guitar',
                                                                        'web-012.barrera-walker.morris.info');

/* Syntax:
 * INSERT INTO PUBLISHER (Publisher_street, Publisher_city, Publisher_state, Publisher_zip,
 *                                               Publisher_Name, publisher_ordering_website) VALUES
 *                    ('Publisher_street', 'Publisher_city', 'Publisher_state','Publisher_zip',
 *                                                    'Publisher_Name', 'publisher_ordering_website');
 */

--AUTHOR
-- Insert into author table information the author named "Nicole-L??szl?? Bereb??si"
INSERT INTO AUTHOR (First_Name, Middle_Name, Last_Name) VALUES ('Nicole-L??szl??', null, 'Bereb??si');
--INSERT INTO AUTHOR (First_Name, Middle_Name, Last_Name)  VALUES ('First_Name', 'Middle_Name', 'Last_Name');

--CUSTOMERS
-- Insert into customer table information the customer named "Daniel E Glover"
INSERT INTO CUSTOMER (First_Name, M_init, Last_Name, Phone_Number, Billing_street, Billing_city,
                                  Billing_state, Billing_zip, Shipping_street, Shipping_city, Shipping_state,
                                  Shipping_zip,email,password, card_number, card_sec_code, card_expiration_date,
                                                                                               card_owner_name) VALUES
                                ('Daniel','E','Glover','6854659558','881 Kathleen Cliff',
                                 'North Karenfurt','NE','68090','99417 Lauren Locks','New Elizabethtown', 'FL',
                                 '33898','amberglover@yahoo.com','r_0Q4%tH3s#d@syj^YCQXRfT','502066797338',
                                                                       '913','2028-05-25','Dr. Bruce Murphy');
/* INSERT INTO CUSTOMER (First_Name, M_init, Last_Name, Phone_Number, Billing_street, Billing_city,
 *                                Billing_state, Billing_zip, Shipping_street, Shipping_city, Shipping_state,
 *                                Shipping_zip, email,password, card_sec_code, card_expiration_date,
 *                                                                                             card_owner_name) VALUES
 *                      ('First_Name', 'M_init', 'Last_Name', 'Phone_Number', 'Billing_street', 'Billing_city',
 *                                'Billing_state', 'Billing_zip', 'Shipping_street', 'Shipping_city', 'Shipping_state',
 *                                'Shipping_zip','email','password', 'card_sec_code', 'card_expiration_date',
 *                                                                                             'card_owner_name');
 */

-- EMPLOYEE
-- Deletes the row in the Author table that has the first name Nia and Last name Smith
DELETE FROM EMPLOYEE
WHERE  First_Name = 'Nia' AND Last_Name = 'Smith';


-- CUSTOMERS
DELETE FROM CUSTOMER
WHERE Last_Name = 'Glover';
--Deletes all rows in the Customer table that have the last name Glover
-- AUTHOR
-- Deletes the row in the Author table that has the name Albert-L??szl??
DELETE FROM AUTHOR
WHERE First_Name = 'Albert-L??szl??';


-- PUBLISHER
-- Deletes the Publisher that has the street address '8567 Anderson Vista Suite 232'
DELETE FROM PUBLISHER
WHERE Publisher_street = '8567 Anderson Vista Suite 232';
