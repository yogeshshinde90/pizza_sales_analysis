# pizza_sales_analysis
SQL-based analysis of pizza sales data using MySQL. Includes queries for revenue analysis, top-selling pizzas, category-wise performance, order trends, and cumulative revenue using joins, subqueries, and window functions.

# Pizza Sales Data Analysis using SQL

## Project Overview
This project analyzes pizza sales data using SQL to extract meaningful business insights such as revenue trends, customer ordering behavior, and product performance.  
The analysis is performed using MySQL on a relational database containing order, pizza, and category details.

---

## Dataset Description
The database consists of the following tables:

- orders  
  (order_id, order_date, order_time)

- orders_details  
  (order_details_id, order_id, pizza_id, quantity)

- pizzas  
  (pizza_id, pizza_type_id, size, price)

- pizza_types  
  (pizza_type_id, name, category, ingredients)

---

## Objectives
- Calculate total orders and total revenue
- Identify best and worst performing pizzas
- Analyze category-wise and size-wise demand
- Understand order patterns by date and time
- Analyze revenue contribution and cumulative revenue over time

---

## SQL Concepts Used
- INNER JOIN
- GROUP BY and ORDER BY
- Aggregate Functions (SUM, COUNT, AVG)
- Subqueries
- Window Functions (RANK, SUM OVER)
- Date & Time Functions
- Filtering and Sorting

---

## Key Analysis Performed

- Total number of orders placed
- Total revenue generated from pizza sales
- Highest priced pizza
- Most commonly ordered pizza size
- Top 5 most ordered pizza types by quantity
- Category-wise total quantity ordered
- Hour-wise distribution of orders
- Category-wise distribution of pizzas
- Average number of pizzas ordered per day
- Top 3 pizza types by revenue
- Percentage contribution of each pizza type to total revenue
- Cumulative revenue generated over time
- Top 3 pizzas by revenue within each category using window functions

---

## Sample Business Insights
- Certain pizza categories contribute significantly higher revenue compared to others
- Large and Medium size pizzas dominate total orders
- Peak ordering hours can be identified for operational optimization
- A small number of pizza types generate a large portion of total revenue (Pareto pattern)
- Revenue growth trend over time can be tracked using cumulative analysis

---

## Tools Used
- MySQL
- MySQL Workbench

---

## How to Use
1. Import the dataset into MySQL
2. Execute the queries provided in `queries.sql`
3. Analyze the outputs to understand sales trends and performance

---

## Author
Yogesh Shinde

