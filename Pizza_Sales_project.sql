SELECT * FROM pizza_sales_project.`pizza_sales (1)`;
 
#A. KPI’s

#1. Total Revenue:

select sum(total_price) as total_Rvenue from pizza_sales;

#2. Average Order Value

select sum(total_price) / count(distinct order_id) as avg_order_val from pizza_sales;

#3. Total Pizzas Sold

select sum(quantity) as total_pizza_sold from pizza_sales;

#4. Total Orders

select count(distinct order_id) as total_orders from pizza_sales;

#5. Average Pizzas Per Order

select cast(cast(sum(quantity) as decimal (10,2)) /
cast(count(distinct order_id) as decimal (10,2)) as decimal (10,2)) as avg_pizza_per_order
from pizza_sales;

#B. Daily Trend for Total Orders

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

#C. Monthly Trend for Orders

select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date);


#D. % of Sales by Pizza Category

select pizza_category, sum(total_price) * 100 /
(select sum(total_price) from pizza_sales) as pct_of_total_sales from pizza_sales
group by pizza_category;

#E. % of Sales by Pizza Size


SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

#F. Total Pizzas Sold by Pizza Category

Select pizza_category, sum(quantity) as total_pizza_sold from pizza_sales
group by pizza_category;

#G. Top 5 Pizzas by Revenue

select pizza_name, sum(total_price) as total_Rvenue from pizza_sales
group by pizza_name
order by total_Rvenue desc limit 5;

#H. Bottom 5 Pizzas by Revenue

select pizza_name, sum(total_price) as total_Rvenue from pizza_sales
group by pizza_name
order by total_Rvenue asc limit 5;

#I. Top 5 Pizzas by Quantity

select pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity  desc limit 5; 

#J. Bottom 5 Pizzas by Quantity

select pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity  asc limit 5; 

#K. Top 5 Pizzas by Total Orders

select pizza_name, count(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders  desc limit 5; 

#L. Borrom 5 Pizzas by Total Orders

select pizza_name, count(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders  asc limit 5; 




