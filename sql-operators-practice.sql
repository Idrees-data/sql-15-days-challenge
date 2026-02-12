/* ============================================================
   WHERE CLAUSE PRACTICE
   Demonstrates filtering rows using comparison,
   logical operators, and pattern matching.
============================================================ */

USE MyDatabase;

-- ============================================================
-- View Data
-- ============================================================
SELECT * FROM customers;

-- ============================================================
-- Equality
-- ============================================================

-- customers from UK
SELECT country
FROM customers
WHERE country = 'UK';

-- customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany';

-- ============================================================
-- Inequality
-- ============================================================

-- not Germany (!=)
SELECT *
FROM customers
WHERE country != 'Germany';

-- not Germany (<>)
SELECT *
FROM customers
WHERE country <> 'Germany';

-- ============================================================
-- Comparison Operators
-- ============================================================

-- score greater or equal 500
SELECT *
FROM customers
WHERE score >= 500;

-- score less or equal 500
SELECT *
FROM customers
WHERE score <= 500;

-- ============================================================
-- Logical Operators (AND / OR / NOT)
-- ============================================================

-- USA customers with high score
SELECT *
FROM customers
WHERE country = 'USA' AND score > 500;

-- USA customers OR anyone high score
SELECT *
FROM customers
WHERE country = 'USA' OR score > 500;

-- not USA
SELECT *
FROM customers
WHERE NOT country = 'USA';

-- ============================================================
-- Pattern Matching (LIKE)
-- ============================================================

-- starts with M
SELECT *
FROM customers
WHERE first_name LIKE 'M%';

-- ends with n
SELECT *
FROM customers
WHERE first_name LIKE '%n';

-- contains r
SELECT *
FROM customers
WHERE first_name LIKE '%r%';

-- third letter is r
SELECT *
FROM customers
WHERE first_name LIKE '__r%';
