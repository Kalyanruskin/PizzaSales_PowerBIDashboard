SELECT *
FROM Pizza_sales

/*TOTAL REVENUE*/

SELECT ROUND(SUM(total_price),4) AS Total_Revenue FROM pizza_sales;

/*AVG ORDER VALUE*/

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales

/*Total Pizzas Sold*/

SELECT SUM(quantity) as Total_Pizzas_Sold FROM Pizza_sales

/*Total Orders*/

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

/*Average Pizzas Per Order*/

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales

/*Daily Trend for Total Orders*/

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY total_orders DESC

/*Monthly Trend for Orders*/

SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS total_orders
FROM Pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY total_orders DESC

/*% of Sales by Pizza Category*/

SELECT pizza_category, CAST(SUM(total_price) AS decimal (10,2)) as Total_Revenue,
CAST(SUM(total_price)*100 /(SELECT SUM(total_price) FROM Pizza_sales) AS decimal (10,2)) AS sales_Percent
FROM Pizza_sales
GROUP BY pizza_category
order by sales_Percent desc

/*% of Sales by Pizza Size*/

SELECT pizza_size, CAST(SUM(total_price) AS decimal (10,2)) as Total_Revenue,
CAST(SUM(total_price)*100 /(SELECT SUM(total_price) FROM Pizza_sales) AS decimal (10,2)) AS sales_Percent
FROM Pizza_sales
GROUP BY pizza_size
order by sales_Percent desc

/*Total Pizzas Sold by Pizza Category*/

SELECT pizza_category,SUM(quantity) as Total_Quantity_Sold FROM Pizza_sales
GROUP BY pizza_category

/*Top 5 Pizzas by Revenue*/

SELECT Top 5 pizza_name, CAST(SUM(total_price) AS decimal (10,2)) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

/*Bottom 5 Pizzas by Revenue*/

SELECT Top 5 pizza_name, CAST(SUM(total_price) AS decimal (10,2)) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue

/*Top 5 Pizzas by Quantity*/

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

/*Bottom 5 Pizzas by Quantity*/

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold

/*Top 5 Pizzas by Total Orders*/

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

/*Bottom 5 Pizzas by Total Orders*/

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders