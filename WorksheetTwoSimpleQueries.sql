--3a
SELECT Title
FROM Book, Author, Written_by
WHERE Book.Publisher_price < 10
  AND Author.Last_name = 'Pratchett'
  AND Book.ISBN = WRITTEN_BY.ISBN;

--3b
SELECT Title, Purchases.Purchase_date
FROM Purchases, Book
WHERE Customer_ID = '101010'
  AND Purchases.ISBN = Book.ISBN;

--3c
SELECT Book.Title, Book.ISBN
FROM Book, Stores
	WHERE Book_Quantity < 5;

--3d
SELECT Customer.Customer_ID, Customer.First_name, Customer.Last_name, Title
FROM Author, Written_by, Book, Purchases, Customer
WHERE Author.Last_Name = 'Pratchett'
  AND Purchases.ISBN = Book.ISBN
  AND Purchases.Customer_ID = Customer.Customer_ID
  AND Book.ISBN=WRITTEN_BY.ISBN;

--3e
SELECT Customer_ID, SUM (Quantity) AS Total_Q
FROM Purchases
WHERE Customer_ID = '101010';

--3f
SELECT Customer.Customer_ID, MAX(Quantity) AS Max_Q
	FROM Customer, Purchases
	WHERE Customer.Customer_ID = Purchases.Customer_ID;





