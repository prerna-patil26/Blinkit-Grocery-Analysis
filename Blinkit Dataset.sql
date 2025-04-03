SELECT * FROM blinkit.blinkit_grocery_data;

# 1. Retrieve All Successful Orders
create view Delivered_Orders AS
select * from blinkit_grocery_data 
where order_status = 'Delivered'; 

select * from Delivered_Orders;

# 2. Find the Average Delivery Time per City
create view delivery_time_for_each_city as
select City , avg(Delivery_Time_Minutes)
as avg_delivery_time from blinkit_grocery_data
group by City;

select * from delivery_time_for_each_city ;

# 3. Get the Total Number of Cancelled Orders by Customers
create view cancelled_order_by_customers as
select count(*) from blinkit_grocery_data
where order_status='Cancelled';

# 3. Get the Total Number of Cancelled Orders by Customers
select * from cancelled_order_by_customers;

# 4. List the Top 5 Customers Who Placed the Highest Number of Orders
create view Top_5_Customers as
select Customer_ID , count(Product_ID) as total_order 
from blinkit_grocery_data
group by Customer_ID 
order by total_order DESC limit 5;

select * from Top_5_Customers;

# 5. Identify the most popular products by total quantity sold
create view most_popular_product as
select Product_Name, SUM(Quantity) as Total_Quantity_Sold
from blinkit_grocery_data
group by Product_Name
order by Total_Quantity_Sold DESC
LIMIT 10;

select * from most_popular_product;

# 6. Find the Best and Worst Performing Product Categories
  #Best Performing (Highest Sales):
  create view Best_Product as
  select Category , sum(Total_Amount) as total_sales
  from blinkit_grocery_data
  group by Category 
  order by total_sales DESC
  limit 1;
  
  select * from Best_product;
  
  #Worst Performing (Lowest Sales):
  create view Worst_Product as
  select Category, sum(Total_Amount) as total_sales
  from blinkit_grocery_data
  group by Category
  order by total_sales ASC
  limit 1;
  
  select * from Worst_Product;

# 7. Retrieve All Orders Paid via UPI
create view UPI_Payment as
select * from blinkit_grocery_data 
where Payment_Method = 'UPI'; 

select * from UPI_Payment;

# 8.  Calculate the Total Number of Orders with Discounts Applied
create view discount as 
select COUNT(*) AS Total_Discounted_Orders
from blinkit_grocery_data
where Discount_Applied = 'TRUE'; 

select * from discount;

# 9. Find the Total Number of Orders Placed on Weekends
create view Weekend_Demands as
select COUNT(*) as Weekend_Orders
from BlinkIT_Grocery_Data
where DAYOFWEEK(Order_Date) IN (1, 7); 

select * from Weekend_Demands;

# 10. Calculate the Percentage of Express vs Standard Deliveries
create view delivery_for_express_vs_standard as
select Delivery_Type ,count(*) as Order_Count,
(count(*) * 100.0/ (select count(*) from blinkit_grocery_data)) as Percentage
from blinkit_grocery_data
group by Delivery_Type;

select * from delivery_for_express_vs_standard;

# 11. Find the Total Revenue During Festival Occasions
create view Total_Revenue_During_Festival_Occasions as
select Occasion, SUM(Total_Amount) AS Total_Revenue
from blinkit_grocery_data
where Occasion IS NOT NULL
group by Occasion
order by Total_Revenue DESC;

select * from Total_Revenue_During_Festival_Occasions ;

# 12. Find the Most Common Age Group of Customers
create view Age_Group_Of_Customer as 
select Customer_Age, COUNT(*) AS Order_Count
from blinkit_grocery_data
group by  Customer_Age
order by Order_Count DESC
limit 1;

select * from Age_Group_Of_Customer;



# ---- Retrive All Views  -----

# 1. Retrieve All Successful Orders
select * from Delivered_Orders;

# 2. Find the Average Delivery Time per City
select * from delivery_time_for_each_city ;

# 3. Get the Total Number of Cancelled Orders by Customers
select * from cancelled_order_by_customers;

# 4. List the Top 5 Customers Who Placed the Highest Number of Orders
select * from Top_5_Customers;

# 5. Identify the most popular products by total quantity sold
select * from most_popular_product;

# 6. Find the Best and Worst Performing Product Categories
	 #Best Performing (Highest Sales):
     select * from Best_product;
     #Worst Performing (Lowest Sales):
     select * from Worst_Product;


# 7. Retrieve All Orders Paid via UPI
select * from UPI_Payment;

# 8. Calculate the Total Number of Orders with Discounts Applied
select * from discount;

# 9. Find the Total Number of Orders Placed on Weekends
select * from Weekend_Demands;

# 10. Calculate the Percentage of Express vs Standard Deliveries
select * from delivery_for_express_vs_standard;

# 11. Find the Total Revenue During Festival Occasions
select * from Total_Revenue_During_Festival_Occasions ;

# 12. Find the Most Common Age Group of Customers
select * from Age_Group_Of_Customer;
     




