-- PURCHASING 2 BOOKS WITH ISBN 0782140661
BEGIN TRANSACTION;

    -- Updating the number of books in a warehouse by subtracting 1. if goes negative (which will be caught by
    -- constraint), we then rollback (this rollback means we are out of stock)
    UPDATE OR ROLLBACK STORES
    SET Book_quantity = Book_quantity - 2
    WHERE
        ISBN = '0782140661' AND
        Warehouse_number = (SELECT Warehouse_number
                            FROM STORES
                            WHERE ISBN = '0782140661'
                            ORDER BY Book_quantity DESC
                            LIMIT 1);

    -- Inserting row to the PURCHASES table with this book, quantity, and price (as derived from publisher price,
    -- margin_percent, and discount_percent). Rollsback if this insertion fails for any reason
    INSERT OR ROLLBACK INTO PURCHASES(Customer_ID, ISBN, Quantity, Total_cost, Purchase_date)
    VALUES(1, '0782140661', 2,
           (SELECT publisher_price * (1 + margin_percent) * (1 - discount_percent)
                       FROM BOOK WHERE ISBN = '0782140661'),
           DATETIME('NOW'));
COMMIT TRANSACTION;



-- INSERTING NEW BOOK BY NEW AUTHOR
BEGIN TRANSACTION;
    -- Inserting new author into AUTHOR table
    INSERT OR ROLLBACK INTO AUTHOR(First_Name, Middle_Name, Last_Name)
        VALUES('Joanne', 'K','Rowling');

    -- Inserting new book into BOOK table
    INSERT OR ROLLBACK INTO BOOK(isbn, title, discount_percent, margin_percent, publisher_price, published_date)
    VALUES('043936213X', 'Harry Potter And The Sorcerer''s Stone', 0.0, 0.0, 6.99, '2001-01-01');
    -- Associating book with the publisher
    INSERT OR ROLLBACK INTO PUBLISHED_BY VALUES('043936213X', 1);
    -- Assuming the most recent author_id was done via autoincrement, the current max should be the one associated with
    -- the one just added.
    -- Associating the book with the author
    INSERT OR ROLLBACK INTO WRITTEN_BY VALUES('043936213X', (SELECT MAX(Author_ID) FROM AUTHOR));
COMMIT TRANSACTION;


-- INSERTING NEW ORDER OF BOOKS FROM PUBLISHER BY AN ADMINISTRATOR OF A WAREHOUSE
BEGIN TRANSACTION;
    -- Inserting row to the ORDERS table
    INSERT OR ROLLBACK INTO ORDERS(ADMINISTRATOR_SSN, PUBLISHER_ID, ISBN, QUANTITY, TOTAL_COST, ORDER_DATE)
    VALUES(111111111, 2, '0201615762', 20, (SELECT publisher_price
                                            FROM BOOK
                                            WHERE ISBN = '0201615762') * 20, DATE('NOW'));

    --Updating the new book_quantity, if it exists. If it doesn't this query does nothing and moves on to the insert
    UPDATE OR ROLLBACK STORES
    SET Book_quantity = Book_quantity + 20
    WHERE
        ISBN = '0201615762' AND
        Warehouse_number = 2;

    -- Aborts this sql query if there already is a row with this Warehouse_number and ISBN that already exists
    INSERT OR ABORT INTO STORES VALUES(2, '0201615762', 20);
COMMIT TRANSACTION;