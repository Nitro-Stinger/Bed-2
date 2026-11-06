-- Task 1: Start clean
DROP DATABASE IF EXISTS game_collection;
CREATE DATABASE game_collection;
USE game_collection;

-- Task 2: Create the main table
CREATE TABLE games (
    game_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    release_year INT,
    price DECIMAL(6,2),
    status VARCHAR(20) DEFAULT 'Owned'
);

-- Task 3: Alter the table
ALTER TABLE games
ADD rating VARCHAR(20) DEFAULT 'Not Rated';

ALTER TABLE games
MODIFY genre VARCHAR(80);

DESCRIBE games;

-- Task 4: Insert at least eight rows
INSERT INTO games
    (game_id, title, genre, release_year, price, status, rating)
VALUES
    (1, 'Super Mario Odyssey', 'Platformer', 2017, 59.99, 'Owned', 'Excellent'),
    (2, 'Mario Kart 8 Deluxe', 'Racing', 2017, 49.99, 'Owned', 'Excellent'),
    (3, 'Minecraft', 'Sandbox', 2011, 29.99, 'Owned', 'Excellent'),
    (4, 'The Legend of Zelda: Breath of the Wild', 'Adventure', 2017, 59.99, 'Owned', 'Excellent'),
    (5, 'Animal Crossing: New Horizons', 'Simulation', 2020, 59.99, 'Owned', 'Good'),
    (6, 'Pokemon Sword', 'Role-Playing', 2019, 49.99, 'Owned', 'Good'),
    (7, 'Sonic Mania', 'Platformer', 2017, 19.99, 'Owned', 'Good');

INSERT INTO games
    (game_id, title, genre, release_year, price)
VALUES
    (8, 'Stardew Valley', 'Simulation', 2016, 14.99);

-- Task 5: Read the main table two ways
SELECT * FROM games;

SELECT title, genre, price
FROM games;

-- Task 6: Copy selected rows into a second table
CREATE TABLE game_wishlist (
    game_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    price DECIMAL(6,2)
);

INSERT INTO game_wishlist (game_id, title, price)
SELECT game_id, title, price
FROM games
WHERE price >= 49.99;

SELECT * FROM game_wishlist;

-- Task 7: Update twice
-- Update one row using its primary key
UPDATE games
SET price = 39.99
WHERE game_id = 3;

-- Increase the price of every game costing less than $30
UPDATE games
SET price = price + 2.00
WHERE price < 30.00;

-- Task 8: Delete one row
DELETE FROM games
WHERE game_id = 7;

-- Task 9: Show the final state of both tables
SELECT * FROM games;

SELECT * FROM game_wishlist;
