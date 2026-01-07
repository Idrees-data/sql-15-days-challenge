-- Day 3: BETWEEN, IN, NOT, AND, OR
-- Practicing SQL filtering logic on students table

USE day1_sql;

-- score between 65 and 90
SELECT *
FROM students
WHERE score BETWEEN 65 AND 90;

-- age not in 19 and 22
SELECT *
FROM students
WHERE age NOT IN (19, 22);

-- score greater than 85 OR age less than 20
SELECT *
FROM students
WHERE score > 85
OR age < 20;

-- score between 60 and 80 AND age 20 or more
SELECT *
FROM students
WHERE score BETWEEN 60 AND 80
AND age >= 20;

-- students not named Ali and score above 70
SELECT *
FROM students
WHERE name != 'Ali'
AND score > 70;
