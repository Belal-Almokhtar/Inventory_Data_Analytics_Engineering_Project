-- Business Questions
-- 1- What is the Revenue did we generate ?
SELECT 
	SUM(Retail_price * Quantity) AS total_revenue
FROM Prices p
INNER JOIN Orders o
ON p.Item_id = o.Item_id;

-- 2- How many units did we sell ? 
SELECT 
	SUM(Quantity) AS total_unit_sold
FROM Orders;

-- 3- What is the total profit ?
WITH total_profit AS(
SELECT 
	ROUND((SUM(Retail_price * Quantity) - 
	SUM(raw_material + factory_labor + factory_equipment_rent + distribution + advertisement)),2) AS total_Profit
FROM Costs c
INNER JOIN Prices p
	ON c.Item_id = p.Item_id
INNER JOIN Orders o
	ON c.Item_id = o.Item_id;

-- 4- What is our inventory turnover for each product
SELECT 
    s.item_id,
    SUM(o.Quantity) AS units_sold,
    s.[2021_start_stock],
    SUM(o.Quantity) * 1.0 / s.[2021_start_stock] AS inventory_turnover
FROM Orders o
JOIN Stock s
ON o.Item_id = s.item_id
GROUP BY s.item_id, s.[2021_start_stock];
-- 5- Which categories generate the highest revenue ?
SELECT 
	category,
	ROUND(SUM(Retail_price * Quantity),2) AS total_Revenue
FROM Prices p
INNER JOIN Orders o
ON p.Item_id = o.Item_id
INNER JOIN Categories c
ON p.Item_id = c.Item_id
GROUP BY category
ORDER BY total_Revenue DESC;


