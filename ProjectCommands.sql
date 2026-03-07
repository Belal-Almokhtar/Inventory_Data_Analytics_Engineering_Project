
-- I put constraints and editing primary keys columns 
-- for more data integration and denormalization (Star Schema)
SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Stock';

ALTER TABLE Stock 
ALTER COLUMN item_id VARCHAR(256) NOT NULL;
ALTER TABLE Stock
ADD CONSTRAINT stock_pk PRIMARY KEY (item_id);
UPDATE Stock
SET  Item_id = '85135C'
WHERE Item_id = '85135 C';


-------------------------------------------------------
SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Costs';

ALTER TABLE Costs 
ALTER COLUMN Item_id VARCHAR(256) NOT NULL;

ALTER TABLE Costs
ADD CONSTRAINT cost_stock_fk 
FOREIGN KEY (Item_id) REFERENCES Stock(item_id)
ON DELETE CASCADE;

SELECT Item_id
FROM Stock 
WHERE Item_id NOT IN (SELECT item_id 
						FROM Costs);
-- --------------------------------------------------
ALTER TABLE Orders 
ALTER COLUMN item_id VARCHAR(256) NOT NULL;

ALTER TABLE Orders
ADD CONSTRAINT order_stock_fk 
FOREIGN KEY (item_id) REFERENCES Stock(Item_id)
ON DELETE CASCADE;

SELECT top 20 *
FROM Countries
ORDER BY InvoiceNo Desc;
-----------------------------------------------------
ALTER TABLE Prices 
ALTER COLUMN item_id VARCHAR(256) NOT NULL;

ALTER TABLE Prices
ADD CONSTRAINT price_stock_fk 
FOREIGN KEY (item_id) REFERENCES Stock(Item_id)
ON DELETE CASCADE;
-- --------------------------------------------------
SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Categories';

ALTER TABLE Categories 
ALTER COLUMN item_id VARCHAR(256) NOT NULL;

ALTER TABLE Categories
ADD CONSTRAINT categories_stock_fk 
FOREIGN KEY (Item_id) REFERENCES Stock(item_id)
ON DELETE CASCADE;

SELECT Item_id
FROM Stock 
WHERE Item_id NOT IN (SELECT item_id 
						FROM Categories);

ALTER TABLE Categories
DROP CONSTRAINT categories_stock_fk;
-- --------------------------------------------------
ALTER TABLE Orders 
ALTER COLUMN InvoiceNo INT NOT NULL;

ALTER TABLE Countries 
ALTER COLUMN InvoiceNo INT NOT NULL;

ALTER TABLE Orders
ADD CONSTRAINT order_country_fk FOREIGN KEY (InvoiceNo) REFERENCES Countries(InvoiceNo);