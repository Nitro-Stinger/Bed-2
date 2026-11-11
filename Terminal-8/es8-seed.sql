DROP DATABASE IF EXISTS es8;
CREATE DATABASE es8;
USE es8;

CREATE TABLE orders_flat (
  order_no       INT PRIMARY KEY,
  order_date     DATE,
  customer_email VARCHAR(60),
  customer_name  VARCHAR(40),
  customer_phone VARCHAR(12),
  item1_code     CHAR(4),
  item1_name     VARCHAR(40),
  item1_price    DECIMAL(5,2),
  item1_qty      INT,
  item2_code     CHAR(4),
  item2_name     VARCHAR(40),
  item2_price    DECIMAL(5,2),
  item2_qty      INT
);

INSERT INTO orders_flat VALUES
(1001, '2026-11-02', 'ana.rivera@example.com',  'Ana Rivera',   '863-555-0142', 'BR01', 'Sourdough loaf',    6.50, 1, 'PS01', 'Croissant',         3.25, 2),
(1002, '2026-11-02', 'ben.okafor@example.com',  'Ben Okafor',   '863-555-0178', 'PS02', 'Cinnamon roll',     3.75, 4, NULL,   NULL,                NULL, NULL),
(1003, '2026-11-03', 'chloe.nguyen@example.com','Chloe Nguyen', '863-555-0113', 'BR02', 'Rye loaf',          5.75, 1, 'CK01', 'Carrot cake slice', 4.50, 2),
(1004, '2026-11-03', 'ana.rivera@example.com',  'Ana Rivera',   '863-555-0142', 'PS01', 'Croissant',         3.25, 6, 'PS02', 'Cinnamon roll',     3.75, 6),
(1005, '2026-11-04', 'dev.patel@example.com',   'Dev Patel',    '863-555-0195', 'BR01', 'Sourdough loaf',    6.50, 2, NULL,   NULL,                NULL, NULL),
(1006, '2026-11-05', 'ben.okafor@example.com',  'Ben Okafor',   '863-555-0178', 'CK01', 'Carrot cake slice', 4.50, 1, 'PS01', 'Croissant',         3.25, 1),
(1007, '2026-11-05', 'chloe.nguyen@example.com','Chloe Nguyen', '863-555-0113', 'BR01', 'Sourdough loaf',    6.50, 1, NULL,   NULL,                NULL, NULL),
(1008, '2026-11-06', 'dev.patel@example.com',   'Dev Patel',    '863-555-0195', 'PS02', 'Cinnamon roll',     3.75, 2, 'CK01', 'Carrot cake slice', 4.50, 2),
(1009, '2026-11-06', 'ana.rivera@example.com',  'Ana Rivera',   '863-555-0142', 'BR02', 'Rye loaf',          5.75, 2, NULL,   NULL,                NULL, NULL),
(1010, '2026-11-07', 'ben.okafor@example.com',  'Ben Okafor',   '863-555-0178', 'BR01', 'Sourdough loaf',    6.50, 1, 'BR02', 'Rye loaf',          5.75, 1);