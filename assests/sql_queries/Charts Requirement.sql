--- Charts Requirement 

--- Daily Trend for total orders
SELECT 
	DATENAME(DW, order_date) AS order_Day, 
	COUNT(DISTINCT order_id) AS Total_Orders
FROM 
	Pizza_sales
GROUP BY 
	DATENAME(DW, order_date)

--- Hourly Trend for total orders
SELECT 
    DATEPART(HOUR, order_time) AS Order_Hour,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM 
    pizza_sales
GROUP BY 
    DATEPART(HOUR, order_time)
ORDER BY 
	Order_Hour

---Percentage of Sales by Pizza Category 
SELECT 
	pizza_category, 
	CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales)  AS DECIMAL (10,2))  
AS 
	PCT
FROM 
	pizza_sales
GROUP BY 
	pizza_category

--- % by Pizza Size
SELECT 
	pizza_size, 
	CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales)  AS DECIMAL (10,2))
AS 
	PCT
FROM 
	pizza_sales
GROUP BY 
	pizza_size
ORDER BY
	PCT 
DESC

---Total pizza category

SELECT pizza_category, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_category


--- Top 5

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM Pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC

--- Bottom 5

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM Pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC
