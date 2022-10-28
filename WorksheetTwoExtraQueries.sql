--4a
SELECT Customer.Customer_ID, First_name, Last_Name, Title
FROM Published_By, Book, Customer, Publisher, Purchases
WHERE Publisher_name = 'HarperCollins'
  AND Publisher.Publisher_ID = Published_By.Publisher_ID
  AND Purchases.ISBN = Book.ISBN
  AND Purchases.Customer_ID = Customer.Customer_ID;

--4b
SELECT SUM (Quantity) AS Total_Q
FROM Customer, Publisher, Purchases, PUBLISHED_BY, Book
WHERE First_name = 'James'
  AND Customer.Customer_ID = Purchases.Customer_ID
  AND Publisher_Name = 'HarperCollins'
  AND Publisher.Publisher_ID = Published_By.Publisher_ID
  AND Purchases.ISBN = Book.ISBN;

--4c
SELECT AVG(Salary) AS Avg_Sal
FROM EMPLOYEE NATURAL JOIN ADMINISTRATOR;
