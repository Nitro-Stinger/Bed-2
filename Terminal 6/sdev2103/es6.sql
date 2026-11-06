DROP DATABASE IF EXISTS bike_shop;
CREATE DATABASE bike_shop;
USE bike_shop;

CREATE TABLE parts (
    part_id       INT PRIMARY KEY,
    name          VARCHAR(60) NOT NULL,
    category      VARCHAR(20) NOT NULL,
    brand         VARCHAR(30) NOT NULL,
    price         DECIMAL(7,2) NOT NULL,
    cost          DECIMAL(7,2) NOT NULL,
    qty_in_stock  INT NOT NULL DEFAULT 0,
    reorder_level INT NOT NULL DEFAULT 5,
    weight_g      INT,
    discontinued  BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO parts VALUES
(1,  '11-speed chain',      'Drivetrain', 'Shimano',      42.99,  24.50, 12,  5,  257, FALSE),
(2,  'Chain checker',       'Tools',      'Park Tool',    29.95,  15.00,  4,  3,   60, FALSE),
(3,  'Cassette 11-34',      'Drivetrain', 'Shimano',      89.00,  55.00,  3,  4,  390, FALSE),
(4,  'Chainring 42T',       'Drivetrain', 'SRAM',         64.00,  38.00,  0,  2,  110, FALSE),
(5,  'Brake pads (pair)',   'Brakes',     'Shimano',      18.50,   7.25, 30, 10,   40, FALSE),
(6,  'Hydraulic brake set', 'Brakes',     'SRAM',        219.00, 150.00,  2,  2,  540, FALSE),
(7,  'Rim brake calipers',  'Brakes',     'Tektro',       34.00,  19.00,  6,  4,  330, TRUE),
(8,  'Road tire 700x28',    'Tires',      'Continental',  64.00,  40.00, 14,  6,  250, FALSE),
(9,  'Gravel tire 700x40',  'Tires',      'WTB',          54.00,  30.50,  9,  6,  520, FALSE),
(10, 'Inner tube 700c',     'Tires',      'Continental',   8.99,   3.10, 48, 20, NULL, FALSE),
(11, 'Tire levers (3)',     'Tools',      'Park Tool',     6.50,   2.00, 25, 10, NULL, FALSE),
(12, 'Multi-tool 18-in-1',  'Tools',      'Topeak',       39.99,  22.00,  7,  5,  175, FALSE),
(13, 'Floor pump',          'Tools',      'Topeak',       54.00,  33.00,  5,  3, 1450, FALSE),
(14, 'Bar tape',            'Cockpit',    'Lizard Skins', 34.00,  14.00, 11,  8, NULL, FALSE),
(15, 'Flat pedals',         'Pedals',     'Race Face',    89.00,  52.00,  1,  3,  390, FALSE),
(16, 'Clipless pedals',     'Pedals',     'Shimano',     124.95,  80.00,  8,  3,  310, TRUE);


-- Task 1
SELECT name, price, cost, price - cost AS margin
FROM parts;

-- Task 2
SELECT name, price, qty_in_stock,
       price * qty_in_stock AS stock_value
FROM parts;

-- Task 3
SELECT name, price, ROUND(price * 0.85, 2) AS sale_price
FROM parts
WHERE category = 'Brakes';

-- Task 4
SELECT name, price
FROM parts
WHERE price > 50;

-- Task 5
SELECT name, qty_in_stock, reorder_level
FROM parts
WHERE qty_in_stock <= reorder_level;

-- Task 6
SELECT name, brand
FROM parts
WHERE brand <> 'Shimano';

-- Task 7
SELECT name, price
FROM parts
WHERE category = 'Tires'
  AND price < 60;

-- Task 8
SELECT name, brand
FROM parts
WHERE brand IN ('SRAM', 'Park Tool', 'Topeak');

-- Task 9
SELECT name, price
FROM parts
WHERE price BETWEEN 34 AND 64;

-- Task 10
SELECT name
FROM parts
WHERE name LIKE '%chain%';

-- Task 11
SELECT name, weight_g
FROM parts
WHERE weight_g IS NULL;

-- Task 12
SELECT name, price, cost, price - cost AS margin
FROM parts
WHERE discontinued = FALSE
  AND (price - cost) >= price * 0.40;
