--5a
SELECT First_name, Last_name, SUM (Total_Cost) As CustTotal
FROM Customer, Purchases
WHERE Customer.Customer_ID = Purchases.Customer_ID

--5b

