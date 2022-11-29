-- We shall index name columns in all of the tables because in the real world we are frequently interested in
--    consulting records by names of people and various other entities which are recorded.

CREATE INDEX author_names ON Author(First_Name, Middle_Name, Last_Name); -- Multicolumn index on each author name
CREATE INDEX customer_names ON Customer(First_Name, M_init, Last_Name); -- Multicolumn index on each customer name
CREATE INDEX employee_names ON Employee(First_Name, M_init, Last_Name); -- Multicolumn index on each employee name
CREATE INDEX publisher_names ON PUBLISHER(Publisher_Name); -- Single column index on each publisher name
CREATE INDEX warehouse_names ON WAREHOUSE(Name); -- Single column index on each warehouse name

-- Since looking up transactions and tuples by dates is another common task, indices on such columns would be
-- beneficial as well
CREATE INDEX book_published_dates ON Book(published_date); -- Index on each book's published date
CREATE INDEX employee_bdates ON Employee(Bdate); -- Index on each employee's birthdate
CREATE INDEX order_dates ON Orders(Order_date); -- Index on each order's date timestamp
CREATE INDEX purchase_dates ON Purchases(Purchase_date); -- Index on each purchase's date
