DROP TABLE IF EXISTS retail_sales;

CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantiy INT,
    price_per_unit NUMERIC(10,2),
    cogs NUMERIC(10,2),
    total_sale NUMERIC(10,2)
);

COPY retail_sales
FROM 'D:\SQL_projects\project_1\retail_sales.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER ','
);

SELECT COUNT(*) FROM retail_sales;

SELECT *
FROM retail_sales
LIMIT 10;

-- Data cleaning --
SELECT *
FROM retail_sales
WHERE transactions_id IS NULL;

SELECT *
FROM retail_sales
WHERE sale_date IS NULL;

SELECT *
FROM retail_sales
WHERE sale_time IS NULL;

SELECT *
FROM retail_sales
WHERE customer_id IS NULL;

SELECT *
FROM retail_sales
WHERE gender IS NULL;

SELECT *
FROM retail_sales
WHERE age IS NULL;

SELECT *
FROM retail_sales
WHERE category IS NULL;

SELECT *
FROM retail_sales
WHERE quantiy IS NULL;

SELECT *
FROM retail_sales
WHERE cogs IS NULL;

SELECT *
FROM retail_sales
WHERE total_sale IS NULL;

-- all important colums together--
SELECT * 
FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_datE IS NULL
   OR sale_time IS NULL
   OR gender IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

SELECT COUNT(*) AS total_sales
FROM retail_sales;

-- 1-> How many unique customers do we have?

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales;

-- 2-> What categories exist?

SELECT DISTINCT category
FROM retail_sales;

SELECT COUNT(*) AS total_sales
FROM retail_sales;

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales;

SELECT DISTINCT category
FROM retail_sales;

-- BUSINESS ANALYSIS --

-- 1. Sales on specify date?

select *
From retail_sales
WHERE sale_date = '2022-11-01';

-- 2. Clothing sales in November 2022 ?

SELECT * 
FROM retail_sales
WHERE category = 'clothing'
  AND sale_date >= '2022-11-01'
  AND sale_date < '2022-12-01';

-- 3. Total sales by category?

SELECT 
	category,
	SUM(total_sale) AS total_orders
FROM retail_sales
GROUP BY category;