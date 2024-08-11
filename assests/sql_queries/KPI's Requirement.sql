
--- KPI's Requirement

---Total Revenue
SELECT SUM(total_price)
	AS Total_Revenue
FROM pizza_sales

---Average Order Value
SELECT AVG(order_total) AS Avg_Order_Value
FROM (
    SELECT order_id, SUM(total_price) AS order_total
    FROM pizza_sales
    GROUP BY order_id
) AS order_totals;

--Or 
SELECT SUM(total_price) / COUNT (DISTINCT order_id)
	AS Avg_Order_Value
FROM pizza_sales

---Total Pizza Sold
SELECT SUM(quantity)
	AS Total_Pizza_Sold
FROM pizza_sales

---Total Order
SELECT COUNT(DISTINCT Order_id)
	AS Total_Order
FROM pizza_sales

---Ave pizza per order
SELECT 
  CAST(
    CAST(SUM(quantity) AS DECIMAL(10,2)) / 
    CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
  AS DECIMAL(10,2)) AS Ave_Pizza_Per_Order
FROM pizza_sales;
