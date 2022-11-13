--first view
CREATE VIEW IF NOT EXISTS most_loyal_customers
AS
    SELECT First_Name, M_init, Last_Name, email, SUM(Total_cost) AS Total_c
    FROM CUSTOMER, PURCHASES
    WHERE CUSTOMER.Customer_ID = Purchase_ID
    GROUP BY CUSTOMER.Customer_ID
    ORDER BY Total_c DESC;

--second view
CREATE VIEW IF NOT EXISTS view_name
AS
    SELECT BOOK.ISBN, Title, publisher_price, COUNT(*) AS Total_p
    FROM BOOK, PURCHASES
    WHERE BOOK.ISBN = PURCHASES.ISBN
    GROUP BY BOOK.ISBN
    ORDER BY Total_p DESC;