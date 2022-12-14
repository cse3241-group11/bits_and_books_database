--3a
SELECT Title
FROM Book, Author, Written_by
WHERE Book.Publisher_price < 10
  AND Author.Last_name = 'Pratchett'
  AND Book.ISBN = WRITTEN_BY.ISBN
  AND Author.Author_ID = WRITTEN_BY.Author_ID;

--3b
SELECT Title, Purchases.Purchase_date
FROM Purchases, Book
WHERE Customer_ID = '1'
  AND Purchases.ISBN = Book.ISBN;

--3c
SELECT Book.Title, Book.ISBN
FROM Book, (SELECT Stores.ISBN,
                   SUM(Stores.Book_quantity) AS Total_of_each_book
                   FROM Stores GROUP BY Stores.Book_quantity) AS Book_totals
     WHERE Book.ISBN = Book_totals.ISBN AND Book_totals.Total_of_each_book < 5;

--3d
SELECT Customer.Customer_ID, Customer.First_name, Customer.Last_name, Title
FROM Author, Written_by, Book, Purchases, Customer
WHERE Author.Last_Name = 'Pratchett'
  AND Purchases.ISBN = Book.ISBN
  AND Purchases.Customer_ID = Customer.Customer_ID
  AND Book.ISBN=WRITTEN_BY.ISBN
  AND Author.Author_ID = WRITTEN_BY.Author_ID;

--3e
SELECT Customer_ID, SUM (Quantity) AS Total_Q
FROM Purchases
WHERE Customer_ID = '1';

--3f
SELECT Customer.Customer_ID, MAX(Quantity) AS Max_Q
	FROM Customer, Purchases
	WHERE Customer.Customer_ID = Purchases.Customer_ID;

--Provide the list of authors who
-- wrote the books purchased by the
-- customers who have spent more than the average customer.
   SELECT DISTINCT Author.First_Name, Author.Middle_Name, Author.Last_Name
       FROM (SELECT SUM(Total_cost) as Customer_total_spending, Purchases.Customer_ID FROM
                Purchases GROUP BY Purchases.Customer_ID HAVING
                      Customer_total_spending > (SELECT AVG(Customer_total_spending_pre_avg) FROM
                                                   (SELECT SUM(Total_cost) as Customer_total_spending_pre_avg FROM
                                                          Purchases GROUP BY Purchases.Customer_ID))) AS
           Purchases_more_than_avg, Purchases, Written_by, Author WHERE
                Purchases_more_than_avg.Customer_ID = Purchases.Customer_ID AND
                Purchases.ISBN = Written_by.ISBN AND
                Written_by.Author_ID = Author.Author_ID;