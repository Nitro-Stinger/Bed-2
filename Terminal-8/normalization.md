Bakery Order Normalization

Starting point

The original orders_flat table stores one order per row. Customer details are repeated whenever a customer places another order, product details are repeated whenever a product is ordered, and the two item positions (item1_ and item2_) form a repeating group.
First normal form (1NF)
The problem: The item1_code, item1_name, item1_price, item1_qty columns and the corresponding item2_ columns represent repeating groups. An order's items are stored in numbered column sets instead of as separate, consistently structured rows. This makes it difficult to support more than two items and complicates item-level queries.

The fix: Keep order-level information in one table and move each item position into its own row in an order-line table. Each field now contains one value, and each order line is identified by the combination of its order number and item code.

- Orders_1NF — PK order_no; order_date, customer_email, customer_name, customer_phone

- OrderLines_1NF — composite PK (order_no, item_code); quantity, item_name, item_price; order_no refers to an order

At this stage, customer information is still repeated in Orders_1NF, and product name and price are still repeated in OrderLines_1NF.

Second normal form (2NF)

The problem: In OrderLines_1NF, the primary key is the combination of order_no and item_code, but item_name and item_price depend only on item_code, not on the entire key. They are partial dependencies. The order-line quantity, by contrast, depends on the full combination because it describes how many of that product are on that particular order.

The fix: Move product details into a separate Products table, keyed by item_code. Keep only the order number, item code, and quantity in the order-lines table. The order-level table remains keyed by order_no.

- Orders_2NF — PK order_no; order_date, customer_email, customer_name, customer_phone

- Products — PK item_code; item_name, item_price

- OrderLines — composite PK (order_no, item_code); FK order_no references Orders_2NF(order_no); FK item_code references Products(item_code); quantity

Every non-key column in each table now depends on the whole key. However, customer name and phone still depend on the customer email rather than directly on the order number.

Third normal form (3NF)

The problem: In Orders_2NF, the dependency is order_no → customer_email → customer_name, customer_phone. The customer name and phone are transitively dependent on the order key because they describe the customer, not the order. Repeating those details on every order can cause update and consistency problems.

The fix: Move customer details into a Customers table with customer_email as its primary key. Keep customer_email in Orders as a foreign key. The remaining non-key columns in each table depend on that table's key, the whole key, and nothing but the key.

Final design

These are the four tables built in es8.sql:

- Customers
  - PK: customer_email
  - Columns: customer_email, customer_name, customer_phone
  - Foreign keys: none

- Products
  - PK: item_code
  - Columns: item_code, item_name, item_price
  - Foreign keys: none

- Orders
  - PK: order_no
  - Columns: order_no, order_date, customer_email
  - FK: customer_email references Customers(customer_email)

- OrderLines
  - Composite PK: (order_no, item_code)
  - Columns: order_no, item_code, quantity
  - FK: order_no references Orders(order_no)
  - FK: item_code references Products(item_code)

Relationship cardinalities

- Customers to Orders: one-to-many. One customer can place many orders; each order belongs to one customer.

- Orders to OrderLines: one-to-many. One order can contain one or more order lines; each order line belongs to one order.

- Products to OrderLines: one-to-many. One product can appear on many order lines; each order line refers to one product.
Together, Orders and Products have a many-to-many relationship, resolved by the OrderLines junction table.

Project note

For this project, I started with the bakery's original table and separated the repeating item information, product details, and customer details into tables with clear primary and foreign keys. I used INSERT INTO ... SELECT to move the existing data instead of entering it again, then used INNER JOIN queries to answer the four questions using only the normalized tables.