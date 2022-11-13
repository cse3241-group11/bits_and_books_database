--first view
--gets the name, email, and total spent with us of each customer and orders
-- them in descending order base on the total spent to determine the most
-- loyal customers/customers that spent the most
CREATE VIEW IF NOT EXISTS most_loyal_customers
AS
    SELECT First_Name, M_init, Last_Name, email, SUM(Total_cost) AS Total_c
    FROM CUSTOMER, PURCHASES
    WHERE CUSTOMER.Customer_ID = Purchase_ID
    GROUP BY CUSTOMER.Customer_ID
    ORDER BY Total_c DESC;

--second view
--gets the ISBN, title, and publisher price of the most popular books (based
-- on number of transactions that ISBN was part of in descending order)
CREATE VIEW IF NOT EXISTS most_popular_books
AS
    SELECT BOOK.ISBN, Title, publisher_price, COUNT(*) AS Total_p
    FROM BOOK, PURCHASES
    WHERE BOOK.ISBN = PURCHASES.ISBN
    GROUP BY BOOK.ISBN
    ORDER BY Total_p DESC;