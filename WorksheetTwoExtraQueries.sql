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

