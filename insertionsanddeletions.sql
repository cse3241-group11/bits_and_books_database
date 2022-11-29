-- BOOK
-- Insert into book table information about the book titled "The Book Thief"
INSERT INTO BOOK VALUES ('0235670861','The Book Thief' ,'0.33','0.58','50','2002-01-01');
-- Insert into book table information about the book titled "It Ends with Us: A Novel"
INSERT INTO BOOK VALUES ('1501110365', 'It Ends with Us: A Novel', '0.37', '0.43', '95', '2016-08-02');
--INSERT INTO BOOK VALUES ('ISBN', 'Title', 'discount price', 'margin percent', 'publisher_price', 'published_date');

-- PUBLISHER
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

-- AUTHOR
-- Insert into author table information the author named "Nicole-László Berebási"
INSERT INTO AUTHOR (First_Name, Middle_Name, Last_Name) VALUES ('Nicole-László', null, 'Berebási');
--INSERT INTO AUTHOR (First_Name, Middle_Name, Last_Name)  VALUES ('First_Name', 'Middle_Name', 'Last_Name');

-- CUSTOMERS
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
--Deletes all rows in the Customer table that have the last name Glover
DELETE FROM CUSTOMER
WHERE Last_Name = 'Glover';
-- AUTHOR
-- Deletes the row in the Author table that has the name Albert-László
DELETE FROM AUTHOR
WHERE First_Name = 'Albert-László';


-- PUBLISHER
-- Deletes the Publisher that has the street address '8567 Anderson Vista Suite 232'
DELETE FROM PUBLISHER
WHERE Publisher_street = '8567 Anderson Vista Suite 232';
