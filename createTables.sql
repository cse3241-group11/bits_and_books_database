CREATE TABLE CUSTOMER -- DONE
( --NO FOREIGN KEYS
    Customer_ID INT NOT NULL,
    First_Name VARCHAR(30) NOT NULL,
    M_init CHAR(1),
    Last_Name VARCHAR(30) NOT NULL,
    Phone_Number CHAR(10),
    Billing_street VARCHAR(50),
    Billing_city VARCHAR(30),
    Billing_state CHAR(2),
    Billing_zip CHAR(5),
    Shipping_street VARCHAR(50),
    Shipping_city VARCHAR(30),
    Shipping_state CHAR(2),
    Shipping_zip CHAR(5),
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    card_number VARCHAR(19),
    card_sec_code VARCHAR(4),
    card_expiration_date DATE,
    card_owner_name VARCHAR(30),
    PRIMARY KEY(Customer_ID),
    CHECK(length(card_sec_code) > 2)
);

CREATE TABLE BOOK -- DONE
( --NO FOREIGN KEYS
    ISBN VARCHAR(13) NOT NULL,
    Title VARCHAR(50) NOT NULL,
    discount_percent DOUBLE default 0 NOT NULL,
    margin_percent DOUBLE default 0 NOT NULL,
    publisher_price DOUBLE NOT NULL,
    published_date DATE NOT NULL,
    PRIMARY KEY(ISBN), CHECK(length(ISBN) IN (10, 13))
);
--alexxxxxxx
CREATE TABLE BOOK_GENRE -- DONE
(
    ISBN VARCHAR(13) NOT NULL,
    Genre VARCHAR(30) NOT NULL,
    PRIMARY KEY(ISBN, Genre),
    FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN), CHECK(length(ISBN) IN (10, 13))
);

CREATE TABLE AUTHOR -- DONE
(--NO FOREIGN KEYS
    Author_ID INT NOT NULL,
    First_Name VARCHAR(30) NOT NULL,
    Middle_Name VARCHAR(30),
    Last_Name VARCHAR(30) NOT NULL,
    PRIMARY KEY(Author_ID)
);

CREATE TABLE PUBLISHER -- DONE
(--NO FOREIGN KEYS
    Publisher_ID INT NOT NULL,
    Publisher_street VARCHAR(50),
    Publisher_city VARCHAR(30),
    Publisher_state CHAR(2),
    Publisher_zip CHAR(5),
    Publisher_Name VARCHAR(30) NOT NULL,
    publisher_ordering_website VARCHAR(255),
    PRIMARY KEY(Publisher_ID)
);

CREATE TABLE WAREHOUSE -- DONE
(
    Warehouse_number INT NOT NULL,
    Name VARCHAR(30) NOT NULL,
    W_street VARCHAR(50) NOT NULL,
    W_city VARCHAR(30) NOT NULL,
    W_state CHAR(2) NOT NULL,
    W_zip CHAR(5) NOT NULL,
    Administrator_SSN INT NOT NULL,
    PRIMARY KEY(Warehouse_number),
    FOREIGN KEY(Administrator_SSN) REFERENCES ADMINISTRATOR(SSN)
);

CREATE TABLE EMPLOYEE -- DONE
(
    SSN CHAR(9) NOT NULL,
    First_Name VARCHAR(30) NOT NULL,
    M_init CHAR(1),
    Last_Name VARCHAR(30) NOT NULL,
    Bdate DATE,
    Salary DOUBLE NOT NULL,
    E_street VARCHAR(50),
    E_city VARCHAR(30),
    E_state CHAR(2),
    E_zip CHAR(5),
    Warehouse_number INT,
    Administrator_SSN CHAR(9), --can be null if is administrator
    PRIMARY KEY(SSN),
    FOREIGN KEY(Warehouse_number) REFERENCES WAREHOUSE(Warehouse_number),
    FOREIGN KEY(Administrator_SSN) REFERENCES ADMINISTRATOR(SSN)
);

CREATE TABLE ADMINISTRATOR -- DONE
(
    SSN CHAR(9) NOT NULL,
    PRIMARY KEY(SSN),
    FOREIGN KEY(SSN) REFERENCES EMPLOYEE(SSN)
);

CREATE TABLE PURCHASES -- DONE
(
    Purchase_ID INT NOT NULL,
    Customer_ID INT NOT NULL,
    ISBN VARCHAR(13) NOT NULL,
    Quantity INT NOT NULL,
    Total_cost DOUBLE NOT NULL,
    Purchase_date DATETIME NOT NULL,
    PRIMARY KEY(Purchase_ID),
    FOREIGN KEY(Customer_ID) REFERENCES CUSTOMER(Customer_ID),
    FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN),
    UNIQUE(Customer_ID, ISBN), CHECK(length(ISBN) IN (10, 13))
);

CREATE TABLE WRITTEN_BY -- DONE
(
    ISBN VARCHAR(13) NOT NULL,
    Author_ID INT NOT NULL,
    PRIMARY KEY(ISBN, Author_ID),
    FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN),
    FOREIGN KEY(Author_ID) REFERENCES AUTHOR(Author_ID), CHECK(length(ISBN) IN (10, 13))
);

CREATE TABLE PUBLISHED_BY -- DONE
(
    ISBN VARCHAR(13) NOT NULL,
    Publisher_ID INT NOT NULL,
    PRIMARY KEY(ISBN, Publisher_ID),
    FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN),
    FOREIGN KEY(Publisher_ID) REFERENCES PUBLISHER(Publisher_ID), CHECK(length(ISBN) IN (10, 13))
);

CREATE TABLE STORES -- DONE
(
    Warehouse_number INT NOT NULL,
    ISBN VARCHAR(13) NOT NULL,
    Book_quantity INT NOT NULL,
    PRIMARY KEY(Warehouse_number, ISBN),
    FOREIGN KEY(Warehouse_number) REFERENCES WAREHOUSE(Warehouse_number),
    FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN), CHECK(length(ISBN) IN (10, 13))
);

CREATE TABLE ORDERS -- DONE
(
    Order_ID INT NOT NULL,
    Administrator_SSN CHAR(9) NOT NULL,
    Publisher_ID INT NOT NULL,
    ISBN VARCHAR(13) NOT NULL,
    Quantity INT NOT NULL,
    Total_cost DOUBLE NOT NULL,
    Order_date DATETIME NOT NULL,
    PRIMARY KEY(Order_ID),
    FOREIGN KEY(Administrator_SSN) REFERENCES ADMINISTRATOR(SSN),
    FOREIGN KEY(Publisher_ID) REFERENCES PUBLISHER(Publisher_ID),
    FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN),
    UNIQUE(Administrator_SSN, Publisher_ID, ISBN), CHECK(length(ISBN) IN (10, 13))
);

-- Ted was here.
-- Ted wrote some more.

--TODO: recreate tables with check constraints