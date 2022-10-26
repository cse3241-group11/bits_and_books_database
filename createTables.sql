CREATE TABLE CUSTOMER
(
    Customer_ID INT NOT NULL,
    First_Name VARCHAR(30) NOT NULL,
    M_init CHAR(1),
    Last_Name VARCHAR(30) NOT NULL,
    Phone_Number, --TODO
    Billing_Address VARCHAR(50),
    Shipping_Address VARCHAR(50),
    email VARCHAR(50) UNIQUE,
    password VARCHAR(50) NOT NULL,
    card_number , --TODO
    card_sec_code , --TODO
    card_expiration_date , --TODO
    card_owner_name , --TODO
    PRIMARY KEY(Customer_ID)
);

CREATE TABLE BOOK
(
    ISBN CHAR(13) NOT NULL,
    Title VARCHAR(50) NOT NULL,
    discount_percent DOUBLE NOT NULL,
    margin_percent DOUBLE NOT NULL,
    publisher_price DOUBLE NOT NULL,
    published_date DATETIME NOT NULL,
    PRIMARY KEY(ISBN)
);

CREATE TABLE BOOK_GENRE
(
    ISBN CHAR(13) NOT NULL,
    Genre VARCHAR(30) NOT NULL,
    PRIMARY KEY(ISBN, Genre),
    FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN)
);

CREATE TABLE AUTHOR
(
    Author_ID INT NOT NULL,
    First_Name VARCHAR(30) NOT NULL,
    M_init CHAR(1),
    Last_Name VARCHAR(30) NOT NULL,
    PRIMARY KEY(Author_ID)
);

CREATE TABLE PUBLISHER
(
    Publisher_ID INT NOT NULL,
    Publisher_address VARCHAR(50),
    Publisher_Name VARCHAR(30) NOT NULL,
    publisher_ordering_website VARCHAR(255) NOT NULL,
    PRIMARY KEY(Publisher_ID)
);

CREATE TABLE WAREHOUSE
(
    Warehouse_number INT NOT NULL,
    Name VARCHAR(30) NOT NULL,
    Warehouse_address VARCHAR(50) NOT NULL,
    Administrator_SSN INT NOT NULL,
    PRIMARY KEY(Warehouse_number),
    FOREIGN KEY(Administrator_SSN) REFERENCES ADMINISTRATOR(SSN)
);

CREATE TABLE EMPLOYEE
(
    SSN CHAR(9) NOT NULL,
    First_Name VARCHAR(30) NOT NULL,
    M_init CHAR(1),
    Last_Name VARCHAR(30) NOT NULL,
    Bdate DATE,
    Salary DOUBLE NOT NULL,
    Employee_address VARCHAR(50),
    Warehouse_number INT NOT NULL, --TODO: MAYBE IT CAN BE NULL
    Administrator_SSN CHAR(9), --can be null if is administrator
    PRIMARY KEY(SSN),
    FOREIGN KEY(Warehouse_number) REFERENCES WAREHOUSE(Warehouse_number),
    FOREIGN KEY(Administrator_SSN) REFERENCES ADMINISTRATOR(SSN)
);

CREATE TABLE ADMINISTRATOR
(
    SSN CHAR(9) NOT NULL,
    PRIMARY KEY(SSN),
    FOREIGN KEY(SSN) REFERENCES EMPLOYEE(SSN)
);

CREATE TABLE PURCHASES
(
    Purchase_ID INT NOT NULL,
    Customer_ID INT NOT NULL,
    ISBN CHAR(13) NOT NULL,
    Quantity INT NOT NULL,
    Purchase_date DATE NOT NULL,
    PRIMARY KEY(Purchase_ID),
    FOREIGN KEY(Customer_ID) REFERENCES CUSTOMER(Customer_ID),
    FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN),
    UNIQUE(Customer_ID, ISBN)
);

CREATE TABLE WRITTEN_BY
(
    ISBN CHAR(13) NOT NULL,
    Author_ID INT NOT NULL,
    PRIMARY KEY(ISBN, Author_ID),
    FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN),
    FOREIGN KEY(Author_ID) REFERENCES AUTHOR(Author_ID)
);

CREATE TABLE PUBLISHED_BY
(
    ISBN CHAR(13) NOT NULL,
    Publisher_ID INT NOT NULL,
    PRIMARY KEY(ISBN, Publisher_ID),
    FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN),
    FOREIGN KEY(Publisher_ID) REFERENCES PUBLISHER(Publisher_ID)
);

CREATE TABLE STORES
(
    Warehouse_number INT NOT NULL,
    ISBN CHAR(13) NOT NULL,
    Book_quantity INT NOT NULL,
    PRIMARY KEY(Warehouse_number, ISBN),
    FOREIGN KEY(Warehouse_number) REFERENCES WAREHOUSE(Warehouse_number),
    FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN)
);

CREATE TABLE ORDERS
(
    Order_ID INT NOT NULL,
    Administrator_SSN CHAR(9) NOT NULL,
    Publisher_ID INT NOT NULL,
    ISBN CHAR(13) NOT NULL,
    Quantity INT NOT NULL,
    Order_date DATE NOT NULL,
    PRIMARY KEY(Order_ID),
    FOREIGN KEY(Administrator_SSN) REFERENCES ADMINISTRATOR(SSN),
    FOREIGN KEY(Publisher_ID) REFERENCES PUBLISHER(Publisher_ID),
    FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN),
    UNIQUE(Administrator_SSN, Publisher_ID, ISBN)
);