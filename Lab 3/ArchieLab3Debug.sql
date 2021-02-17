#1
SELECT
product_code, product_name, list_price, discount_percent
FROM
Products
ORDER BY
list_price DESC;

#2
SELECT CONCAT
(last_name , ", " , first_name) AS full_name
FROM
Customers
WHERE
last_name >= "M"
ORDER BY
last_name;

#3 
SELECT
product_name, list_price, date_added
FROM
Products
WHERE
list_price > 500 AND list_price < 2000
ORDER BY
date_added DESC;

#4
SELECT
product_name, list_price, discount_percent,
ROUND(list_price * (discount_percent/100),2) AS discount_amount,
ROUND(list_price - (discount_percent/100 * list_price),2) AS discount_price
FROM
Products
ORDER BY
(list_price -(discount_percent/100 * list_price))DESC
LIMIT
5;

#5
SELECT
item_id, item_price, discount_amount, quantity, item_price * quantity AS price_total,
discount_amount * quantity AS discount_total,
(item_price - discount_amount) * quantity AS item_total
FROM
Order_Items
WHERE  
((item_price - discount_amount) * quantity) > 500
ORDER BY
item_total DESC;

#6
SELECT
order_id, order_date, ship_date
FROM
Orders
WHERE
ship_date IS NULL;

#7
SELECT
NOW() AS "today_unformatted",
DATE_FORMAT(NOW(), "%d-%b-%Y") AS "today_formatted";

#8
SELECT
100 AS price,
0.07 AS tax_rate,
100 * 0.07 AS tax_amount,
100 + (0.07 * 100) AS total;
