-- Daily Trend fro Total Orders

select		
		DATENAME(DW,order_date) as Order_day ,
		count(distinct order_id) as Total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)


-- Monthly Trend for Total orders


select DATENAME(MONTH, order_date) as Month_name,
		count(distinct order_id) as Total_orders 
FROM pizza_sales
GROUP BY DATENAME(Month,order_date)
order by Total_orders desc;



--Percentage of Sales by Pizza Category


select pizza_category ,
		cast(sum(total_price)as decimal(10,2) )as Total_Sales  ,
		cast(sum(total_price)*100 / (select sum(total_price) from pizza_sales where month(order_date)=1) as decimal(10,2))as PCT
from pizza_sales
where month(order_date)=1
group by pizza_category; 


--Percentage of Sales by Pizza Size


select pizza_size,
		cast(sum(total_price)as decimal(10,2) )as Total_Sales ,
		cast(sum(total_price)*100 / (select sum(total_price) from pizza_sales  where DATENAME(quarter,order_date)=1 )as decimal(10,2) )as PCT

from pizza_sales
where DATENAME(quarter,order_date)=1
group by pizza_size
order by PCT desc ; 



--total pizza by category


select pizza_category ,	
	   sum(quantity) as Total_pizza_Sold
	   
from pizza_sales 
group by pizza_category
order by Total_pizza_Sold;



--Top 5 Best selles by Rev ,Quantity and Orders


select  top 5 pizza_name ,
	   sum(total_price) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue desc;


--Bottom 5 Best selles by Rev 


select  top 5 pizza_name ,
	   cast(sum(total_price)as decimal(10,2) )as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue Asc;


--Top 5 Best selles by Quantity

select  top 5 pizza_name ,
	   sum(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_quantity desc;


--Bottom 5 Best selles by Quantity


select  top 5 pizza_name ,
	   sum(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_quantity asc;


-- Top 5 Pizzas by Total Orders


SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;


-- Bottom 5 Pizzas by Total Orders


SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC;