-- Day 5: CASE WHEN, WHERE vs HAVING
-- Focus: Conditional logic and analytics-style queries

USE day1_sql;

-- --------------------------------------------------
-- 1. Label each student as Pass or Fail
-- --------------------------------------------------
SELECT name, score,
CASE
  WHEN score >= 40 THEN 'Pass'
  ELSE 'Fail'
END AS result
FROM students;

-- --------------------------------------------------
-- 2. Count total Pass and Fail students
-- --------------------------------------------------
SELECT
CASE
  WHEN score >= 40 THEN 'Pass'
  ELSE 'Fail'
END AS result,
COUNT(*) AS total_students
FROM students
GROUP BY result;

-- --------------------------------------------------
-- 3. Categorize students based on performance
-- --------------------------------------------------
SELECT name, score,
CASE
  WHEN score >= 85 THEN 'High'
  WHEN score >= 60 THEN 'Medium'
  ELSE 'Low'
END AS performance_level
FROM students;

-- --------------------------------------------------
-- 4. Count students in each performance category
-- --------------------------------------------------
SELECT
CASE
  WHEN score >= 85 THEN 'High'
  WHEN score >= 60 THEN 'Medium'
  ELSE 'Low'
END AS performance_level,
COUNT(*) AS total_students
FROM students
GROUP BY performance_level;

-- --------------------------------------------------
-- 5. WHERE vs HAVING example
-- Remove students with score < 60, then group by age
-- --------------------------------------------------
SELECT age, COUNT(*) AS student_count
FROM students
WHERE score >= 60
GROUP BY age;

-- --------------------------------------------------
-- 6. Filter groups using HAVING
-- Show only ages where average score > 70
-- --------------------------------------------------
SELECT age, AVG(score) AS avg_score
FROM students
GROUP BY age
HAVING AVG(score) > 70;
