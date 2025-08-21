create database dpinoz_pizza;
use dpinoz_pizza;
create table orders(
order_id int not null,
order_date date not null,
order_time time not null,
primary key(order_id));

create table order_details(
order_details_id int not null,
order_id int not null,
pizza_id text not null,
quantity int not null,
primary key(order_details_id));


 ------------------
| A. MEASURE KPIs |
 ------------------

-- 1. The total number of orders placed.
SELECT COUNT(order_id) AS total_orders FROM orders;


-- 2. The total revenue generated from pizza sales.
SELECTt *FROM dpinoz_pizza.order_details;
SELECT ROUND(SUM( order_details.quantity *pizzas.price),2) as total_sales
FROM order_details JOIN pizzas
ON pizzas.pizza_id=order_details.pizza_id;


-- 3. Average Order Value.
SELECT ROUND(SUM(order_details.quantity * pizzas.price) / COUNT(DISTINCT order_id),2) AS Avg_order_value
FROM order_details JOIN pizzas 
ON order_details.pizza_id = pizzas.pizza_id;


-- 4. Total number of pizzas sold ?
SELECT SUM(quantity) AS Total_pizzas_sold FROM order_details; 


-- 5. Average pizzas per Order.
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id),2) AS Avg_pizzas_per_order
FROM order_details;


-- 6. Total Quantity sold from each pizza category
SELECT pizza_types.category,SUM(order_details.quantity) AS Total_quantity
FROM pizza_types JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY category;

 --------------------
| B. SEASONAL TRENDS |
 --------------------
 
-- 1. The distribution of orders by hour of the day.
SELECT hour(order_time) AS hour, count(order_id) FROM orders AS order_count
GROUP BY hour;


-- 2. Join relevant tables to find the category-wise distribution of pizzas.
SELECT category, count(name) FROM pizza_types
GROUP BY category;


-- 3. Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT round(avg(quantity),0) FROM 
(SELECT orders.order_date AS order_date, SUM(order_details.quantity) AND quantity
FROM order_details JOIN orders
ON order_details.order_id=orders.order_id
GROUP BY orders.order_date) AS order_quantity;


-- 4. THE peak time hours based on Total Orders ?
SELECT COUNT(order_id) AS orders, HOUR(order_time) AS hours 
FROM orders
GROUP BY hours
ORDER BY orders DESC;


-- 5. Order trend based on Days.
SELECT DAYNAME(order_date) AS day, COUNT(order_id) AS Total_orders
FROM orders
GROUP BY day
ORDER BY Total_orders DESC;


-- 6. Order trend based on Months.
SELECT  MONTHNAME(order_date) AS month, COUNT(order_id) AS Total_orders
FROM orders
GROUP BY month
ORDER BY Total_orders DESC;


-- 7. Quarter-wise sales 
SELECT QUARTER(order_date) as Quarter, ROUND(SUM(order_details.quantity * pizzas.price),2) AS Total_revenue
FROM order_details JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN orders ON orders.order_id = order_details.order_id
GROUP BY Quarter;


-- 8. Cumulative revenue generated over time.
SELECT order_date, sum(revenue) OVER (order by order_date) AS cum_revenue
FROM (SELECT orders.order_date, round(sum(order_details.quantity*pizzas.price),0) AS revenue FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY order_date) AS Total_sales;

 ------------------------
| C. PRODUCT POPULARITY |
 ------------------------

-- 1.Category-wise distribution of pizzas.
SELECT category, COUNT(name) AS pizzas
FROMpizza_types
GROUP BY category
ORDER BY pizzas DESC;


-- 2. Identify the most common pizza size ordered.
SELECT pizzas.size, count(order_details.order_details_id) AS order_count
FROM order_details JOIN pizzas
ON order_details.pizza_id=pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC
LIMIT 1;


-- 3. List the top 5 most ordered pizza types along with their quantities.
SELECT pizza_types.name, sum(order_details.quantity) AS quantity
FROM pizza_types JOIN pizzas ON pizza_types.pizza_type_id=pizzas.pizza_type_id
JOIN order_details ON pizzas.pizza_id=order_details.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;


-- 4. Listthe top 3 most ordered pizza types based on revenue.
SELECT pizza_types.name as pizza_name, sum(order_details.quantity*pizzas.price) AS revenue
FROM pizzas JOIN pizza_types
ON pizzas.pizza_type_id= pizza_types.pizza_type_id
JOIN order_details ON order_details.pizza_id=pizzas.pizza_id
GROUP BY pizza_name
ORDER BY revenue DESC
LIMIT 3;


--  5. The highest-priced pizza sold.
SELECT pizza_types.name,pizzas.price
FROM pizzas JOIN pizza_types 
ON pizzas.pizza_type_id=pizza_types.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;


-- 6. The percentage contribution of each pizza type to total revenue.
SELECT pizza_types.category, ROUND((SUM(order_details.quantity*pizzas.price) / (SELECT ROUND(SUM(order_details.quantity *pizzas.price),2) AS total_sales
 ROM order_details JOIN pizzas
ON pizzas.pizza_id=order_details.pizza_id))*100,2)  AS revenue
FROM pizzas JOIN pizza_types
ON pizzas.pizza_type_id= pizza_types.pizza_type_id
JOIN order_details ON order_details.pizza_id=pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;


-- 7. The cumulative revenue generated over time.
SELECT order_date, SUM(revenue) OVER (ORDER BY order_date) AS cum_revenue FROM 
(SELECT orders.order_date, SUM(order_details.quantity*pizzas.price) AS revenue
FROM order_details JOIN orders
ON order_details.order_id=orders.order_id
JOIN pizzas ON order_details.pizza_id=pizzas.pizza_id
GROUP BY orders.order_date) AS sales;

-- 8. The top 3 most ordered pizza types based on revenue for each pizza category.
SELECT cat, pizza_name, revenue, rank_of_pizza FROM 
(SELECT cat, pizza_name, revenue, RANK() OVER(PARTITION BY cat ORDER BY revenue DESC) AS rank_of_pizza
FROM 
(SELECT pizza_types.name AS pizza_name, pizza_types.category AS cat, SUM(order_details.quantity*pizzas.price) AS revenue
FROM order_details JOIN pizzas
ON order_details.pizza_id=pizzas.pizza_id
JOIN pizza_types
ON pizza_types.pizza_type_id=pizzas.pizza_type_id
GROUP BY 1,2 ) AS a) AS b
WHERE rank_of_pizza <=3;





