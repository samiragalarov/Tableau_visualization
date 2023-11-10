use Pizza_db;
SELECT SUM(total_price) AS Total_Revenue from Pizza_db.pizza_sales


SELECT SUM(total_price)/ Count(DISTINCT  order_id) as Avg_price FROM Pizza_db.pizza_sales;



SELECT SUM(quantity) AS Total_pizza_sold from Pizza_db.pizza_sales;


SELECT COUNT(DISTINCT order_id) AS Total_order from Pizza_db.pizza_sales;


SELECT SUM(quantity) / COUNT(DISTINCT order_id) FROM Pizza_db.pizza_sales;



SELECT HOUR(order_time) as order_hour, SUM(quantity) as Total_pizzas_sold
FROM Pizza_db.pizza_sales
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time);


SELECT 
    WEEK(STR_TO_DATE(order_date, '%d.%m.%Y'), 3) AS WeekNumber,
    YEAR(STR_TO_DATE(order_date, '%d.%m.%Y')) AS Year,
    COUNT(DISTINCT order_id) AS Total_orders
FROM 
    Pizza_db.pizza_sales
GROUP BY 
    WeekNumber,
    Year
ORDER BY 
    Year, WeekNumber;



SELECT pizza_category, sum(total_price) * 100/(SELECT sum(total_price) from pizza_sales) AS PCT
from Pizza_db.pizza_sales
GROUP BY pizza_category




SELECT pizza_category, sum(total_price) as Total_Sales, sum(total_price) * 100 /
(SELECT sum(total_price) from pizza_sales WHERE MONTH(order_date) = 1) AS PCT
from pizza_sales
WHERE MONTH (order_date) = 1
GROUP BY pizza_category



SELECT pizza_size, sum(total_price) as Total_Sales, sum(total_price) * 100 /
(SELECT sum(total_price) from pizza_sales) AS PCT
from pizza_sales
GROUP BY pizza_size



SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;



SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;


SELECT pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC
LIMIT 5;


SELECT pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC
LIMIT 5;


SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;