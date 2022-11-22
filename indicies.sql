-- We shall index name columns in all of the tables because in the real world we are frequently interested in
--    consulting records by names of people which are recorded.

CREATE INDEX author_names ON Author(First_Name, Middle_Name, Last_Name);
CREATE INDEX customer_names ON Customer(First_Name, M_init, Last_Name);
CREATE INDEX employee_names ON Employee(First_Name, M_init, Last_Name);
-- ETC...

-- Since looking up transactions by dates is another common task, indices on such columns would be beneficial as well
CREATE INDEX order_dates ON Orders(Order_date);
CREATE INDEX purchase_dates ON Purchases(Purchase_date);
