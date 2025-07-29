-- ToTal Rev
select sum(total_price) as Total_Revenue
from pizza_sales;

-- Average order value
select sum(total_price) /count(distinct order_id) as Avg_Order_Value
from pizza_sales;

-- ToTal Pizzas Sold

select SUM(quantity)as Total_pizza_Sold
from pizza_sales;

-- Total orders
select count(distinct order_id) as Total_Orders
from pizza_sales;

--Average Pizza per Order

select cast(
			cast(SUM(quantity)as decimal(10,2)) / cast(count(distinct order_id)as decimal(10,2))	
				as decimal(10,2))  as Avg_Pizza_per_Order
from pizza_sales;