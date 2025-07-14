drop table if exists zepto;
create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercentage NUMERIC(5,2),
availableQuantity INTEGER,
distountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);
--DATA EXPLORATION

-- Sample data 
SELECT * FROM zepto
limit 10;
-- RENAME COLUMN
ALTER TABLE zepto
RENAME COLUMN distountedSellingPrice TO discountedSellingPrice;

-- checking null values 
select * from zepto
where name IS NULL 
OR
category IS NULL 
OR
mrp IS NULL 
OR
discountPercentage IS NULL 
OR
availableQuantity IS NULL 
OR
discountedSellingPrice IS NULL 
OR
weightinGms IS NULL 
OR
outOfStock IS NULL 
OR
quantity IS NULL;
-- different types of categories
select distinct category 
from zepto
order by category;
--- Product in stock vs out of stock 
select outOfStock,Count(sku_id)
from zepto
group by outOfStock;
-- product name present in multiple time
select name , count(sku_id) as "Number_of_SKUs"
from zepto
GROUP BY name
Having count(sku_id)>1
order by count (sku_id) DESC;

--selling product price with zero 
select * from zepto
where mrp = 0 or discountedSellingPrice = 0;

-- deleting the product at zero cost
delete from zepto
where mrp = 0;

--converting paise into rupees
Update zepto
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;
select mrp,discountedSellingPrice from zepto;

--Find the top 10 best-value products based on the discount percentage.
SELECT name, mrp, discountPercentage
FROM zepto
ORDER BY discountPercentage DESC
LIMIT 10;
-- What are the products with high MRP but out of stock?
SELECT name, mrp, outOfStock
FROM zepto
WHERE mrp > 300 AND outOfStock = TRUE
order by mrp desc;
--Calculate estimated revenue for each category.
SELECT category,
       SUM(discountedSellingPrice * availableQuantity) AS estimated_revenue
FROM zepto
GROUP BY category
ORDER BY estimated_revenue DESC;
--Find all products where MRP > ₹500 and discount < 10%
SELECT distinct name, mrp,discountPercentage
FROM zepto
WHERE mrp > 500 AND discountPercentage < 10
order by mrp desc, discountPercentage desc;
-- Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
       AVG(discountPercentage) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;
--Find the price per gram for products above 100g and sort by best value.
SELECT name,
       discountedSellingPrice,
       weightInGms,
       ROUND(discountedSellingPrice::numeric / weightInGms, 2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;
---Group the products into category like low, medium, bulk
select distinct name, weightInGms,
CASE WHEN weightInGms < 1000 then 'Low'
     WHEN weightInGms < 5000 then 'Medium'
	 ELSE 'Bulk'
	 END AS weight_category
FROM zepto;
-- what is the total inventory weight per category
select category,
SUM(weightInGms*availableQuantity) AS total_weight
from zepto
group by category
order by total_weight;

	 
	 
