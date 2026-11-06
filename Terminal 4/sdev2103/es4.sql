-- Task 1
SELECT VERSION();

-- Task 2
DROP DATABASE IF EXISTS vet_clinic;
CREATE DATABASE vet_clinic;
USE vet_clinic;

-- Task 3: Create owners table
CREATE TABLE owners (
    owner_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(255) UNIQUE
);

-- Task 4: Create pets table with foreign key
CREATE TABLE pets (
    pet_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    owner_id INT UNSIGNED NOT NULL,
    name VARCHAR(100) NOT NULL,
    species VARCHAR(50) NOT NULL,
    birth_date DATE,
    weight_kg DECIMAL(6,2),
    FOREIGN KEY (owner_id) REFERENCES owners(owner_id)
);

-- Task 5: Create visits table with foreign key
CREATE TABLE visits (
    visit_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    pet_id INT UNSIGNED NOT NULL,
    visit_date DATE NOT NULL,
    reason TEXT NOT NULL,
    fee DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (pet_id) REFERENCES pets(pet_id)
);

-- Task 6: List the tables and describe each table
SHOW TABLES;
DESCRIBE owners;
DESCRIBE pets;
DESCRIBE visits;