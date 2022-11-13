--5a
SELECT First_name, Last_name, SUM (Total_Cost) As CustTotal
FROM Customer, Purchases
WHERE Customer.Customer_ID = Purchases.Customer_ID;

--5b
SELECT Customer.First_name, Customer.Last_name, email
	FROM Customer, Purchases
	Group BY Customer_ID
		HAVING  AVG(Total_Cost)>
(SELECT AVG(Total_Cost)
	FROM Purchases);

--5c
SELECT Title, SUM (Quantity) AS TotCopies
	FROM Purchases, Book
	WHERE Purchases.ISBN = Book.ISBN
	Group BY ISBN
		ORDER BY Title ASC;

--5d
SELECT Title, SUM (Quantity)
FROM Purchases, Book
WHERE Book.ISBN = Purchases.ISBN
ORDER BY Title ASC;

--5e
SELECT Author.First_Name, Author.Last_Name, MAX (Purchases.ISBN)
FROM  Purchases, Author, Written_by, Book
WHERE  Author.Author_ID=WRITTEN_BY.Author_ID
AND	 Purchases.ISBN = WRITTEN_BY.ISBN
AND 	Book.ISBN = WRITTEN_BY.ISBN
GROUP BY Author.Author_ID;

--5f
SELECT Tot_gp Last_Name,First_Name
           FROM(
 SELECT SUM((publisher_price*quantity)-Total_Cost) AS tot_gp, Author.First_Name,Author.Last_Name
		FROM Written_By, Purchases, Book, AUTHOR
		WHERE  Author.Author_ID=WRITTEN_BY.Author_ID
 AND Purchases.ISBN = WRITTEN_BY.ISBN
 AND Book.ISBN = WRITTEN_BY.ISBN
          	   GROUP BY Author.Author_ID
   Order by tot_gp  Desc )
LIMIT 1;

--5h
SELECT Last_Name, First_Name, ISBN
   FROM
(SELECT ISBN, CUSTOMER.Customer_ID
FROM PURCHASES, CUSTOMER
WHERE COUNT(Total_cost)>AVG(Total_cost))
 AUTHOR, BOOK, WRITTEN_BY,
   WHERE Book.ISBN=WRITTEN_BY.ISBN AND AUTHOR.Author_ID = WRITTEN_BY.Author_ID;



