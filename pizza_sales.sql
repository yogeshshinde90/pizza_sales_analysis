-- 1.. Retrieve the total number of orders placed.

SELECT count(order_id) as total_orders FROM orders;

-- 2..Calculate the total revenue generated from pizza sales.

SELECT sum(orders_details.quantity * pizzas.price) as total_revenue
from orders_details join pizzas
on orders_details.pizza_id = pizzas.pizza_id;

-- 3.. Identify the highest-priced pizza.
SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY price DESC
LIMIT 1;

-- 4 .. Identify the most common pizza size ordered.

SELECT count(orders_details.quantity) as counts, pizzas.size
from orders_details join pizzas on orders_details.pizza_id=pizzas.pizza_id
group by pizzas.size order by counts desc limit 1; 

-- 5.. List the top 5 most ordered pizza types along with their quantities.

SELECT pizza_types.name, sum(orders_details.quantity) as quantity
from pizza_types join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by quantity desc limit 5;


-- 6..Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT pizza_types.category, sum(orders_details.quantity) as quantity
from pizza_types join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details on pizzas.pizza_id = orders_details.pizza_id
group by pizza_types.category order by quantity desc;

-- 7.. Determine the distribution of orders by hour of the day.

select hour(order_time) as hour, count(order_id) as order_count from orders
group by hour(order_time);

-- 8..Join relevant tables to find the category-wise distribution of pizzas.
select category, count(name)  from pizza_types
group by category;

-- 9.. Group the orders by date and calculate the average number of pizzas ordered per day.

select avg(quantity) from
(select orders.order_date , sum(orders_details.quantity) as quantity
from orders join orders_details on orders.order_id = orders_details.order_id
group by orders.order_date) as order_quantity;

-- 10..Determine the top 3 most ordered pizza types based on revenue.

select pizza_types.name, sum(orders_details.quantity * pizzas.price) as revenue
from pizzas join orders_details on pizzas.pizza_id = orders_details.pizza_id
join pizza_types on pizza_types.pizza_type_id = pizzas.pizza_type_id
group by pizza_types.name order by revenue desc limit 3;

-- 11.. Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pizza_types.name,
    SUM(orders_details.quantity * pizzas.price) /
    (
        SELECT SUM(orders_details.quantity * pizzas.price)
        FROM pizzas
        JOIN orders_details 
            ON pizzas.pizza_id = orders_details.pizza_id
    ) AS revenue
FROM pizzas
JOIN orders_details 
    ON pizzas.pizza_id = orders_details.pizza_id
JOIN pizza_types 
    ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;

-- 12..Analyze the cumulative revenue generated over time.

select order_date,
sum(revenue) over(order by order_date) as cum_revenue 
from 
(select orders.order_date,
 sum(orders_details.quantity * pizzas.price) as revenue 
 from orders_details join pizzas
 on orders_details.pizza_id = pizzas.pizza_id
 join orders
 on orders.order_id = orders_details.order_id
 group by orders.order_date) as sales;


-- 13..Determine the top 3 most ordered pizza types based on revenue for each pizza category.


select name, revenue from
(select category, name, revenue,
rank() over(partition by category order by revenue desc) as rn
from
(SELECT 
  pizza_types.category,
    pizza_types.name,
    SUM((orders_details.quantity) * pizzas.price) AS revenue
FROM pizzas
JOIN orders_details 
    ON pizzas.pizza_id = orders_details.pizza_id
JOIN pizza_types 
    ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.category, pizza_types.name) as a) as b 
where rn < 3;




































































































































































































































































































































































































































































































































































































































