SHOW TABLES;

SELECT *
FROM menu_items;

SELECT *
FROM order_details;

# Number of orders with item ordered
SELECT COUNT(item_id) AS number_of_orders, 
	  item_id
FROM order_details
GROUP BY item_id
ORDER BY number_of_orders DESC;

# Most ordered item with number of times ordered
SELECT COUNT(o.item_id) AS number_of_orders,
	 m.item_name
FROM order_details o
JOIN menu_items m
ON o.item_id = m.menu_item_id
GROUP BY m.item_name
ORDER BY number_of_orders DESC
LIMIT 1;


# Least ordered item with number of times ordered
SELECT COUNT(o.item_id) AS number_of_orders,
       m.item_name
FROM order_details o
JOIN menu_items m
ON o.item_id = m.menu_item_id
GROUP BY m.item_name
ORDER BY number_of_orders ASC
LIMIT 1;

# Category of Least ordered item with number of times ordered
SELECT COUNT(o.item_id) AS number_of_orders,
       m.item_name,
       m.category
FROM order_details o
JOIN menu_items m
ON o.item_id = m.menu_item_id
GROUP BY m.item_name
ORDER BY number_of_orders ASC
LIMIT 1;

# Category of Most ordered item with number of times ordered
SELECT COUNT(o.item_id) AS number_of_orders, 
       m.item_name,
       m.category
FROM order_details o
JOIN menu_items m
ON o.item_id = m.menu_item_id
GROUP BY m.item_name
ORDER BY number_of_orders DESC
LIMIT 1;

# Number of times each orders were made
SELECT COUNT(order_id) AS no_of_orders_by_customers,
       order_id
FROM order_details 
GROUP BY order_id
ORDER BY no_of_orders_by_customers DESC;

# Customer with the highest spend and amount spent
SELECT o.order_id, SUM(m.price) AS sum_of_orders
FROM order_details o
JOIN menu_items m
ON o.item_id = m.menu_item_id
GROUP BY o.order_id
ORDER BY sum_of_orders DESC
LIMIT 1;

# The highest spend orders
SELECT  item_name
FROM order_details o
JOIN   menu_items m
ON o.item_id = m.menu_item_id
JOIN (SELECT o.order_id, 
            sum(m.price) AS sum_of_orders
	  FROM order_details o
	  JOIN menu_items m
	  ON o.item_id = m.menu_item_id
	  GROUP BY o.order_id
	  ORDER BY sum_of_orders DESC
      LIMIT 1) AS kl
WHERE o.order_id = 440;

# Hours with less orders
SELECT COUNT(order_id) AS no_of_order,
       HOUR(order_time) AS time_of_order
FROM order_details
GROUP BY hour_ordered
ORDER BY no_of_order
LIMIT 1;

# Hours with most orders
SELECT COUNT(order_id) AS no_of_order,
       HOUR(order_time) AS time_of_order
FROM order_details
GROUP BY hour_ordered
ORDER BY no_of_order DESC
LIMIT 1;

#day of least orders
SELECT COUNT(order_id) AS no_of_order, 
       DAYNAME(order_date) AS day_of_order
FROM order_details
GROUP BY day_of_order
ORDER BY no_of_order
LIMIT 1;

#day of most orders
SELECT COUNT(order_id) AS no_of_order,
       DAYNAME(order_date) AS day_of_order
FROM order_details
GROUP BY day_of_order
ORDER BY no_of_order desc
LIMIT 1;


