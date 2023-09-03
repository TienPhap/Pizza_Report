
/* Creating data queries */
/* Total Revenue */
Select Sum(total_price) as Total_Revenue from pizza_sales

/* Average Order Value */
Select Sum(total_price) / COUNT( Distinct order_id) as Average_Order_Value from pizza_sales

/* Total Pizza Sold */
Select Sum(quantity) as Total_Pizza_Sold from pizza_sales

/* Total Orders */
Select COUNT( Distinct order_id) as Total_Orders from pizza_sales

/* Average Pizzas Per Order */
Select Cast(Sum(quantity) as decimal(10,2)) / Cast(COUNT( Distinct order_id)as decimal(10,2)) as Average_Pizzas_Per_Order from pizza_sales

/* Daily Trend for Total Orders */
Select DATENAME(DW,order_date) as order_day, COUNT( Distinct order_id) as Total_order from pizza_sales
Group by DATENAME(DW,order_date)
Order by Total_order Desc

/* Monthly Trend for Total Orders */
Select DATENAME(MONTH,order_date) as order_day, COUNT( Distinct order_id) as Total_order from pizza_sales
Group by DATENAME(MONTH,order_date)
Order by Total_order Desc

/* Percentage of Sales by Pizza Category */
Select pizza_category, Sum(total_price) * 100 / (Select Sum(total_price) from pizza_sales) as Percentage_of_Sales_by_Pizza_Category from pizza_sales
Group by pizza_category

/* Percentage of Sales by Pizza Size */
Select pizza_size, Sum(total_price) * 100 / (Select Sum(total_price) from pizza_sales) as Percentage_of_Sales_by_Pizza_Size from pizza_sales
Group by pizza_size

/* Total Pizzas Sold by Pizza Category */
Select pizza_category, Sum(quantity) as Quantity from pizza_sales
Group by pizza_category

/* Top 5 Best Sellers by Revenue, Total Quantity and Total Orders */
/* by Revenue */
Select Top 5 pizza_name, Sum(total_price) as Revenue from pizza_sales
Group by pizza_name
Order by Revenue desc
/* by Quantity */
Select Top 5 pizza_name, Sum(quantity) as Quantity from pizza_sales
Group by pizza_name
Order by Quantity desc
/* by Orders */
Select Top 5 pizza_name, Count(Distinct order_id) as Orders from pizza_sales
Group by pizza_name
Order by Orders desc

/* Top 5 Bottom Sellers by Revenue, Total Quantity and Total Orders */
Select Top 5 pizza_name, Sum(total_price) as Revenue from pizza_sales
Group by pizza_name
Order by Revenue 
/* by Quantity */
Select Top 5 pizza_name, Sum(quantity) as Quantity from pizza_sales
Group by pizza_name
Order by Quantity
/* by Orders */
Select Top 5 pizza_name, Count(Distinct order_id) as Orders from pizza_sales
Group by pizza_name
Order by Orders
