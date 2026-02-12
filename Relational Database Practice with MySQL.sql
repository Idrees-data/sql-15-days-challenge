/* ============================================================
   DATABASE PRACTICE SCRIPT
   Covers:
   - selection
   - ordering / limit
   - create / alter / drop table
   - insert
   - update
   - null handling
   - safe updates
   - delete
============================================================ */

-- ============================================================
-- USE DATABASE
-- ============================================================
USE MyDatabase;

-- ============================================================
-- VIEW EXISTING DATA
-- ============================================================
SELECT * FROM customers;
SELECT * FROM orders;

-- latest 3 orders
SELECT order_date
FROM orders
ORDER BY order_date DESC
LIMIT 3;

-- ============================================================
-- CREATE TABLE
-- ============================================================
DROP TABLE IF EXISTS persons;

CREATE TABLE persons(
    id INT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY (id)
);

SELECT * FROM persons;

-- view structure
SHOW CREATE TABLE persons;

-- ============================================================
-- ALTER TABLE
-- ============================================================

-- add column
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL;

-- drop column
ALTER TABLE persons
DROP COLUMN phone;

SELECT * FROM persons;

-- ============================================================
-- DROP TABLE
-- ============================================================
DROP TABLE persons;

-- ============================================================
-- INSERT INTO CUSTOMERS
-- ============================================================

-- insert partial data
INSERT INTO customers (id, first_name)
VALUES (6, 'Andreas');

SELECT * FROM customers;

-- ============================================================
-- UPDATE
-- ============================================================

UPDATE customers 
SET score = 0
WHERE id = 6;

UPDATE customers
SET country = 'Germany'
WHERE id = 6;

SELECT * FROM customers WHERE id = 6;

-- insert full row
INSERT INTO customers (id, first_name, country, score)
VALUES (7, 'Basheer', 'India', 900);

-- ============================================================
-- NULL MANAGEMENT
-- ============================================================

-- allow nulls
ALTER TABLE customers
MODIFY score INT NULL;

-- insert with null
INSERT INTO customers (id, first_name, country, score)
VALUES (9, 'Kareem', 'Bagdad', NULL);

-- check nulls
SELECT * FROM customers
WHERE score IS NULL;

-- disable safe mode temporarily
SET SQL_SAFE_UPDATES = 0;

-- replace nulls
UPDATE customers
SET score = 0
WHERE score IS NULL;

-- ============================================================
-- DELETE
-- ============================================================

DELETE FROM customers
WHERE id > 5;

-- ============================================================
-- FINAL CHECK
-- ============================================================
SELECT * FROM customers;
