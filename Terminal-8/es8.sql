USE es8

-- Drop child tables before parent tables so foreign keys do not block the drops.
DROP TABLE IF EXISTS order_lines;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- Customers: one row per customer.
CREATE TABLE customers (
  customer_email VARCHAR(60) NOT NULL,
  customer_name  VARCHAR(40) NOT NULL,
  customer_phone VARCHAR(12) NOT NULL,
  PRIMARY KEY (customer_email)
);

-- Products: one row per product.
CREATE TABLE products (
  item_code  CHAR(4) NOT NULL,
  item_name  VARCHAR(40) NOT NULL,
  item_price DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (item_code)
);

-- Orders: each order belongs to exactly one customer.
CREATE TABLE orders (
  order_no       INT NOT NULL,
  order_date     DATE NOT NULL,
  customer_email VARCHAR(60) NOT NULL,
  PRIMARY KEY (order_no),
  FOREIGN KEY (customer_email) REFERENCES customers(customer_email)
);

-- Order lines connect orders and products. The two-column key prevents
-- the same product from appearing twice on the same order.
CREATE TABLE order_lines (
  order_no  INT NOT NULL,
  item_code CHAR(4) NOT NULL,
  quantity  INT NOT NULL,
  PRIMARY KEY (order_no, item_code),
  FOREIGN KEY (order_no) REFERENCES orders(order_no),
  FOREIGN KEY (item_code) REFERENCES products(item_code)
);

-- Move customer records from the original table; DISTINCT keeps one row per customer.
INSERT INTO customers (customer_email, customer_name, customer_phone)
SELECT DISTINCT customer_email, customer_name, customer_phone
FROM orders_flat;

-- Combine both item positions, then DISTINCT keeps one row per product.
INSERT INTO products (item_code, item_name, item_price)
SELECT item_code, item_name, item_price
FROM (
  SELECT item1_code AS item_code, item1_name AS item_name, item1_price AS item_price
  FROM orders_flat
  WHERE item1_code IS NOT NULL
  UNION
  SELECT item2_code AS item_code, item2_name AS item_name, item2_price AS item_price
  FROM orders_flat
  WHERE item2_code IS NOT NULL
) AS all_products;

-- One row per original order.
INSERT INTO orders (order_no, order_date, customer_email)
SELECT DISTINCT order_no, order_date, customer_email
FROM orders_flat;

-- Turn item1 and item2 into separate order-line rows.
INSERT INTO order_lines (order_no, item_code, quantity)
SELECT order_no, item1_code, item1_qty
FROM orders_flat
WHERE item1_code IS NOT NULL
UNION ALL
SELECT order_no, item2_code, item2_qty
FROM orders_flat
WHERE item2_code IS NOT NULL;

-- Verify the contents and expected row counts.
SELECT * FROM customers;
SELECT COUNT(*) AS customer_count FROM customers;       -- 4
SELECT * FROM products;
SELECT COUNT(*) AS product_count FROM products;         -- 5
SELECT * FROM orders;
SELECT COUNT(*) AS order_count FROM orders;              -- 10
SELECT * FROM order_lines;
SELECT COUNT(*) AS order_line_count FROM order_lines;    -- 16

-- Question 1
SELECT o.order_no, o.order_date, c.customer_name
FROM orders AS o
INNER JOIN customers AS c
  ON o.customer_email = c.customer_email
ORDER BY o.order_date, o.order_no;

-- Question 2
SELECT p.item_name, p.item_price, ol.quantity,