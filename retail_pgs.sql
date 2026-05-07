CREATE TABLE retail(
	Invoice text,
	StockCode text,
	Description text,
	Quantity int,
	InvoiceDate timestamp,
	Price numeric,
	CustomerID numeric,
	Country text,
	Revenue numeric,
	Year int,
	Month int,
	MonthYear text,
	CustomerType text
);

COPY retail
FROM 'C:\Users\KIIT0001\1.PROJECTS\Customer Retention and Retail Analysis\retail_clean.csv'
WITH(FORMAT CSV, HEADER);

SELECT COUNT(*) FROM retail;

SELECT * FROM retail LIMIT 5;

SELECT SUM(Revenue) AS total_revenue 
FROM retail;

-- revenue by customer type
SELECT CustomerType,
SUM(Revenue) AS revenue
FROM retail
GROUP BY CustomerType;

-- repeat revenue %
SELECT
	ROUND(
		SUM(CASE WHEN CustomerType = 'Repeat' THEN Revenue ELSE 0 END) * 100.0
		/ SUM(Revenue),
		2) AS repeat_revenue_percentage
FROM retail;

-- monthly revenue
SELECT 
    DATE_TRUNC('month', InvoiceDate) AS month,
    SUM(Revenue) AS revenue
FROM retail
GROUP BY DATE_TRUNC('month', InvoiceDate) 

-- monthly active customer
SELECT 
DATE_TRUNC('month', InvoiceDate) AS month,
COUNT(DISTINCT CustomerID) AS active_customers
FROM retail
GROUP BY DATE_TRUNC('month', InvoiceDate)
ORDER BY month;
ORDER BY month;

