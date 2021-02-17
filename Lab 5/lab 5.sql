# Author: Jeffrey Nicholls
# Title: Lab 5
# Date: February 9th, 2021
# Class: STY 1211

# Making sure the proper database is used
use my_guitar_shop;

# Question 1:
# Write an INSERT statement that adds this row to the Categories table:
#		category_name:		Brass
# Code the INSERT statement so MySQL automatically generates the category_id column.
insert into categories (category_id, category_name)
values (default, "Brass");

# Question 2:
# Write an UPDATE statement that modifies the row you just added to the Categories table. 
# This statement should change the category_name column to “Woodwinds”, and it should use 
# the category_id column to identify the row.
update categories
set category_name = "Woodwinds"
where category_id = (select category_id from categories where category_name = "Brass");

# Question 3:
# Write a DELETE statement that deletes the row you added to the Categories table in exercise 1.
# This statement should use the category_id column to identify the row.
delete from categories
where category_id = (select category_id from categories where category_name = "Woodwinds");


# Question 4:
# Write an INSERT statement that adds this row to the Products table:
#		product_id:			The next automatically generated ID 
#		category_id:		4
#		product_code:		dgx_640
#		product_name:		Yamaha DGX 640 88-Key Digital Piano
#		description:		Long description to come.
#		list_price:			799.99
#		discount_percent:	0
#		date_added:			Today’s date/time.
# Use a column list for this statement
insert into products 
(product_id, category_id, product_code, product_name, description, list_price, discount_percent, date_added)
values
(default, 4, "dgx_640", "Yamaha DGX 640 88-Key Digital Piano", "Long description to come.", 799.99, 0, now());

# Question 5:
# Write an UPDATE statement that modifies the product you added in exercise 4. 
# This statement should change the discount_percent column from 0% to 35%.
update products
set discount_percent = 35
where product_id = (select product_id from products where product_name = "Yamaha DGX 640 88-Key Digital Piano");

# Question 6:
# Write an INSERT statement that adds this row to the Customers table:
#	email_address:	rick@raven.com
#	password:		(empty string)
#	first_name:		Rick
#	last_name:		Raven
# Use a column list for this statement.
insert into customers
(email_address, password, first_name, last_name)
values
("rick@raven.com", "", "Rick", "Raven");

# Question 7:
# Write an UPDATE statement that modifies the Customers table. Change the password
# column to “secret” for the customer with an email address of rick@raven.com.
update customers
set password = "secret"
where customer_id = (select customer_id from customers where email_address = "rick@raven.com");

# Question 8:
# Write an UPDATE statement that modifies the Customers table. Change the password 
# column to “reset” for every customer in the table. If you get an error due to 
# safe-update mode, you can add a LIMIT clause to update the first 100 rows of the table. 
# (This should update all rows in the table.)
update customers
set password = "reset"
limit 100;

# Question 9:
# Open the script named create_my_guitar_shop.sql that’s in the mgs_ex_starts directory. 
# Then, run this script. That should restore the data that’s in the database
#
# Data has been reset to the original db