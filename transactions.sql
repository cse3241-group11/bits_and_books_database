-- BEGIN TRANSACTION NEW_SP
--  INSERT INTO SP VALUES ('S5', 'P1', 1000);
--     IF error THEN GO TO UNDO; END IF;
--     UPDATE P SET TOTQTY = TOTQTY + 1000
--         WHERE P#='P1';
--     IF error THEN GO TO UNDO; END IF;
--     COMMIT;
--     GO TO FINISH;
--   UNDO:
--     ROLLBACK;
--   FINISH:
-- END TRANSACTION;

-- PURCHASING 2 BOOKS WITH ISBN 0782140661
-- TODO: MAKE SURE TO CHANGE PURCHASE_ID IN PURCHASES TO AUTOINCREMENT
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
    INSERT OR ROLLBACK INTO PURCHASES VALUES(Purchase_ID=default,
                                             Customer_ID=1,
                                             ISBN='0782140661',
                                             Quantity=2,
                                             Total_cost=(SELECT publisher_price * (1 + margin_percent) * (1 - discount_percent)
                                                         FROM BOOK WHERE ISBN = '0782140661'),
                                             Purchase_date=DATE('NOW'));
COMMIT TRANSACTION;



-- INSERTING NEW BOOK BY NEW AUTHOR
-- TODO: MAKE SURE TO CHANGE AUTHOR_ID IN AUTHOR TO AUTOINCREMENT
BEGIN TRANSACTION;
    -- Inserting new author into AUTHOR table
    INSERT OR ROLLBACK INTO AUTHOR VALUES(Author_ID=default,
                                          First_Name='Joanne',
                                          Middle_Name='K',
                                          Last_Name='Rowling');
    -- Inserting new book into BOOK table
    INSERT OR ROLLBACK INTO BOOK VALUES(ISBN='043936213X',
                                        Title='Harry Potter And The Sorcerer''s Stone',
                                        discount_percent=0.0,
                                        margin_percent=0.0,
                                        publisher_price=6.99,
                                        published_date='2001-01-01');
    -- Associating book with the publisher
    INSERT OR ROLLBACK INTO PUBLISHED_BY VALUES(ISBN='043936213X',
                                                Publisher_ID=1);
    -- Assuming the most recent author_id was done via autoincrement, the current max should be the one associated with
    -- the one just added.
    -- Associating the book with the author
    INSERT OR ROLLBACK INTO WRITTEN_BY VALUES(ISBN='043936213X',
                                              Author_ID=(SELECT MAX(Author_ID) FROM AUTHOR));
COMMIT TRANSACTION;


-- INSERTING NEW ORDER OF BOOKS FROM PUBLISHER BY AN ADMINISTRATOR OF A WAREHOUSE
--TODO: *NOTE* THE PUBLISHER_IDS AND ISBNS FROM ORDERS DO NOT MATCH WITH THOSE IN PUBLISHED_BY
BEGIN TRANSACTION;
    -- Inserting row to the ORDERS table
    INSERT OR ROLLBACK INTO ORDERS VALUES(ORDER_ID=default,
                                             Administrator_SSN=111111111,
                                             Publisher_ID=1,
                                             ISBN='0782140661',
                                             Quantity=20,
                                             Total_cost=(SELECT publisher_price
                                                         FROM BOOK
                                                         WHERE ISBN = '0782140661') * 20,
                                             Order_date=DATE('NOW'));

    --Updating the new book_quantity, if it exists. If it doesn't this query does nothing and moves on to the insert
    UPDATE OR ROLLBACK STORES
    SET Book_quantity = Book_quantity + 20
    WHERE
        ISBN = '0782140661' AND
        Warehouse_number = 1;

    -- Aborts this sql query if there already is a row with this Warehouse_number and ISBN that already exists
    INSERT OR ABORT INTO STORES VALUES(Warehouse_number=1, ISBN='0782140661', Book_quantity=20);
              SELECT 1, '0782140661', 20
              WHERE NOT EXISTS (SELECT *
                                FROM STORES
                                WHERE Warehouse_number = 1 AND
                                      ISBN = '0782140661');
COMMIT TRANSACTION;