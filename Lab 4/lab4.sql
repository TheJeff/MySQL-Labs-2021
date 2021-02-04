# Author: Jeffrey Nicholls
# Title: Lab 4
# Date: February 9th, 2021
# Class: STY 1211

# Making sure the proper database is used
use my_guitar_shop;

# Question 1:
# Write a SELECT statement that joins the Categories table to the Products table
# and returns these columns: category_name, product_name, list_price.
select category_name, product_name, list_price
from products as p join categories as c on p.category_id = c.category_id
order by category_name, product_name; 

# Question 2:
# Write a SELECT statement that joins the Customers table to the 
# Addresses table and returns these columns: first_name, last_name, line1, city, state, zip_code.
# Return one row for each address for the customer with an email address of allan.sherwood@yahoo.com.
select first_name, last_name, line1, city, state, zip_code
from addresses as a join customers as c on a.customer_id = c.customer_id
where c.email_address = "allan.sherwood@yahoo.com";

# Question 3:
# Write a SELECT statement that joins the Customers table to the Addresses table and returns
# these columns: first_name, last_name, line1, city, state, zip_code.
# Return one row for each customer, but only return addresses that are the shipping address for a customer.
select first_name, last_name, line1, city, state, zip_code
from addresses as a
join customers as c on a.customer_id = c.customer_id
where a.address_id = c.shipping_address_id;


# Question 4:
# Write a SELECT statement that joins the Customers, Orders, Order_Items, and Products tables. This statement 
# should return these columns: last_name, first_name, order_date, product_name, item_price, discount_amount, and quantity.
# Use aliases for the tables.
# Sort the final result set by last_name, order_date, and product_name.
select last_name, first_name, order_date, product_name, item_price, discount_amount, quantity
from customers as c
join orders as o on c.customer_id = o.customer_id
join order_items as o_i on o.order_id = o_i.order_id
join products as p on o_i.product_id = p.product_id
order by last_name, order_date, product_name;


# Question 5:
# Write a SELECT statement that returns the product_name and list_price columns from the Products table.
# Return one row for each product that has the same list price as another product. 
# Hint: Use a self-join to check that the product_id columns aren’t equal but the list_price columns are equal.
select p1.product_name, p1.list_price
from products as p1 
join products as p2 on p1.list_price = p2.list_price
where p1.product_id != p2.product_id;



# Question 6:
# Write a SELECT statement that returns these two columns: 
#		category_name		The category_name column from the Categories table
#		product_id			The product_id column from the Products table
# Return one row for each category that has never been used. 
# Hint: Use an outer join and only return rows where the product_id column contains a null value.
select c.category_name, p.product_id
from categories as c left join products as p on c.category_id = p.category_id
where p.product_id is null;


# Question 7:
# Use the UNION operator to generate a result set consisting of three columns from the Orders table: 
#		ship_status			A calculated column that contains a value of SHIPPED or NOT SHIPPED
#		order_id			The order_id column
#		order_date			The order_date column
# If the order has a value in the ship_date column, the ship_status column should contain a value of SHIPPED. 
# Otherwise, it should contain a value of NOT SHIPPED.
# Sort the final result set by order_date.
select "Shipped" as ship_status, order_id, order_date
from orders
where ship_date is not null
union
select "Not Shipped" as ship_status, order_id, order_date
from orders
where ship_date is null
order by order_date;

