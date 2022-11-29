-- We shall index name columns in all of the tables because in the real world we are frequently interested in
--    consulting records by names of people and various other entities which are recorded.

CREATE INDEX author_names ON Author(First_Name, Middle_Name, Last_Name);
CREATE INDEX customer_names ON Customer(First_Name, M_init, Last_Name);
CREATE INDEX employee_names ON Employee(First_Name, M_init, Last_Name);
CREATE INDEX publisher_names ON PUBLISHER(Publisher_Name);
CREATE INDEX warehouse_names ON WAREHOUSE(Name);

-- Since looking up transactions and tuples by dates is another common task, indices on such columns would be
-- beneficial as well
CREATE INDEX book_published_dates ON Book(published_date);
CREATE INDEX employee_bdates ON Employee(Bdate);
CREATE INDEX order_dates ON Orders(Order_date);
CREATE INDEX purchase_dates ON Purchases(Purchase_date);
