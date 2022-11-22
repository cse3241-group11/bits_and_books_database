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
--INSERT INTO BOOK VALUES ('0235670861','The Book Thief' ,'0.33','0.58','50','2002-01-01');
--INSERT INTO BOOK VALUES ('0805317554, 'Fundamentals of Database Systems', '0.37', '0.43', '95', '1999-01-01');
--INSERT INTO BOOK VALUES ('ISBN', 'Title', 'discount price', 'margin percent', 'publisher_price', 'published_date');

--PUBLISHER
--INSERT INTO PUBLISHER VALUES (1,'70522 Preston Underpass','New Nicholestad','DE','19979','Addison-Wesley Pub Co','db-91.diaz.larsen.info');
--INSERT INTO PUBLISHER VALUES (22, '6239 Robinson Mountains Apt. 387', 'Riggsborough', 'MD', '21883', 'Jossey-Bass', 'web-01.barrera-walker.morris.net');
--INSERT INTO PUBLISHER VALUES ('Publisher_ID','Publisher_street', 'Publisher_city', 'Publisher_state','Publisher_zip', 'Publisher_Name', 'publisher_ordering_website');

--AUTHOR
--INSERT INTO AUTHOR VALUES (1, 'Albert-László, null, 'Barabási');
--INSERT INTO AUTHOR VALUES ('Author_ID','First_Name', 'Middle_Name', 'Last_Name');

--CUSTOMERS
--INSERT INTO CUSTOMER VALUES (1, 'Cynthia','E','Glover','6854659558','881 Kathleen Cliff','North Karenfurt','NE','68090','99417 Lauren Locks','New Elizabethtown,FL','33898,amberbaldwin@yahoo.com','r_0Q4%tH3s#d@syj^YCQXRfT','502066797338','913,2028-05-25','Dr. Bruce Murphy');
--INSERT INTO CUSTOMER VALUES ('Customer_ID',' First_Name', 'M_init', 'Last_Name', Phone_Number', 'Billing_street', 'Billing_city', 'Billing_state', 'Billing_zip', Shipping_street', 'Shipping_city', 'Shipping_state','Shipping_zip','email','password', 'card_sec_code', 'card_expiration_date', 'card_owner_name');

--EMPLOYEE
--DELETE FROM EMPLOYEE
--WHERE  Fname = 'Nia' AND Lname = 'Smith';
--Deletes the row in the Author table that has the first name Nia and Last name Smith

--CUSTOMERS
--DELETE FROM CUSTOMER
--WHERE Last_Name = 'Glover';
--Deletes the row in the Author table that has the last name Glover
--AUTHOR
--DELETE FROM AUTHOR
--WHERE First_Name = 'Albert-László';
--Deletes the row in the Author table that has the name Albert-László

--PUBLISHER
--DELETE FROM PUBLISHER
-- WHERE Publisher_street = '8567 Anderson Vista Suite 232';
--Deletes the Publisher that has the street '8567 Anderson Vista Suite 232'

