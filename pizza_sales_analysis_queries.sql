select * from pizza_sales

--total revenue
select sum(total_price) as "total revnue"
from pizza_sales 


---total number of orders
select sum(total_price) / count(distinct order_id)  as " number of orders" from pizza_sales

--- total pizza sold 
select sum(quantity) as "total pizza sold " from pizza_sales


-------total orders placed
select count (distinct order_id) as "total_orders" from pizza_sales


---average pizzas per order 
select cast(cast(sum(quantity) as decimal(10,2)) / 
cast(count(distinct order_id)  as decimal(10,2)) as decimal(10,2)) from pizza_sales 

---- retreive the day of the week 
select datename(dw, order_date) as orderday, count(distinct order_id) as total_orders from pizza_sales 
group by datename(dw,order_date)

----monthy trend for total orders
select datename(month,order_date) as month_name ,count(distinct order_id) as total_order from pizza_sales 
group by datename(month,order_date)
order by total_order
---percentage of sales by pizza category
select pizza_category,sum(total_price) as total_sales  , sum(total_price) *100 / (select sum(total_price) from pizza_sales)  as percentage_sales 
from pizza_sales 
group by pizza_category 
--------------filter it by months
select pizza_category,sum(total_price) as total_sales  , sum(total_price) *100 / (select sum(total_price) from pizza_sales where month(order_date)=1)  as percentage_sales 
from pizza_sales 
where month(order_date)=1
group by pizza_category 
----------- percentage of sales by pizza size 
select pizza_size,sum(total_price) as total_sales  , 
cast(sum(total_price) *100 / (select sum(total_price) from pizza_sales)   as decimal (10,2))as percentage_sales 
from pizza_sales 
group by pizza_size
order by percentage_sales desc 

---top 5 best sellers by revenue , total_orders , total_quantity
select  top 5 pizza_name, sum(total_price)  as revenue from pizza_sales
group by pizza_name 
order by revenue desc


--- bottom 5 seller by revenue
select  top 5 pizza_name, sum(total_price)  as revenue from pizza_sales
group by pizza_name 
order by revenue 


---top 5 sellers by quantity
select top 5 pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity desc

---bottom 
select top 5 pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity 


---top 5 best sellers by total orders 
select top 5 pizza_name, count(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders desc


---bottom 5
select top 5 pizza_name, count(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders 



