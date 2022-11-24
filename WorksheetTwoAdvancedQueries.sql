--4A

SELECT CUSTOMER.Customer_ID, CUSTOMER.First_Name, CUSTOMER.Last_Name, Book.Title
FROM Published_By, Book, Customer, Publisher, Purchases
WHERE Publisher_Name = 'HarperCollins'
AND Publisher.Publisher_ID = Published_By.Publisher_ID
AND PUBLISHED_BY.ISBN = Book.ISBN
AND Purchases.ISBN = Book.ISBN
AND Purchases.Customer_ID = Customer.Customer_ID;

--4b.

SELECT SUM (Quantity) AS Total_Q
FROM Customer, Publisher, Purchases, PUBLISHED_BY, BOOK
WHERE CUSTOMER.First_Name = 'Samantha'
AND Customer.Customer_ID = Purchases.Customer_ID
AND Publisher.Publisher_Name = 'HarperCollins'
AND Publisher.Publisher_ID = Published_By.Publisher_ID
AND Purchases.ISBN = Book.ISBN
AND PUBLISHED_BY.ISBN = Book.ISBN;

--4c
SELECT AVG(Salary) AS Avg_Sal
FROM Employee
NATURAL JOIN Administrator;


--5a
SELECT Customer.First_Name, Customer.Last_Name, SUM (Total_Cost) As CustTotal
FROM Customer, Purchases
WHERE Customer.Customer_ID = Purchases.Customer_ID
GROUP BY Customer.First_Name, Customer.Last_Name;


--5b
	SELECT First_name, Last_name, email
	FROM (SELECT Customer.First_name, Customer.Last_Name, Customer.email, SUM(Total_Cost)AS Total_Cost
	        FROM Customer, Purchases
	        WHERE CUSTOMER.Customer_ID = PURCHASES.Customer_ID
            GROUP BY Customer.First_Name, Customer.Last_Name, Customer.email),
             (SELECT AVG(Total_Cost) AVG_COST
	FROM Purchases)
	WHERE Total_Cost > AVG_COST;




--5c
SELECT Title, TotCopies
  FROM (SELECT Book.Title, SUM (Quantity) AS TotCopies
	FROM Purchases, Book
	WHERE Purchases.ISBN = Book.ISBN
	Group BY Book.ISBN)
		ORDER BY TotCopies DESC;


--5d
SELECT Title, TotPurchased
  FROM (SELECT Book.Title, SUM (Total_cost) AS TotPurchased
	FROM Purchases, Book
	WHERE Purchases.ISBN = Book.ISBN
	Group BY Book.ISBN)
		ORDER BY TotPurchased DESC;


--5e Find the most popular author in the database (i.e. the one who has sold the most books)
SELECT First_Name, Last_Name, TotPurchased FROM (SELECT First_Name, Last_Name, TotPurchased
FROM Author,
    (SELECT SUM (Quantity) AS TotPurchased, Author_ID
	FROM Purchases,Book, Author
	WHERE Purchases.ISBN = Book.ISBN
	Group BY Author_ID) AS Purchasing
WHERE Purchasing.Author_ID = Author.Author_ID
order by TotPurchased DESC)
LIMIT  1;

--5f
SELECT First_Name, Last_Name
     FROM(
        SELECT SUM(Total_cost) AS tot_cost, Author.First_Name, Author.Last_Name
		FROM Written_By, Purchases, Book, AUTHOR
		WHERE  Author.Author_ID=WRITTEN_BY.Author_ID
        AND Purchases.ISBN = WRITTEN_BY.ISBN
        AND Book.ISBN = WRITTEN_BY.ISBN
          	   GROUP BY Author.Author_ID
   Order by tot_cost  Desc )
LIMIT 1;

--5h

	SELECT First_name, Last_name
	FROM (SELECT Author.First_name, Author.Last_name, SUM(Total_Cost)AS Total_Cost
	        FROM Customer, Purchases, Author, WRITTEN_BY
	        WHERE CUSTOMER.Customer_ID = PURCHASES.Customer_ID
	        AND WRITTEN_BY.ISBN = Purchases.ISBN
	        AND Author.Author_ID = WRITTEN_BY.Author_ID
            GROUP BY Customer.First_Name, Customer.Last_Name, Customer.email),
             (SELECT AVG(Total_Cost) AVG_COST
	FROM Purchases)
	WHERE Total_Cost > AVG_COST;




