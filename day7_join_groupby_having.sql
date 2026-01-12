-- Day 7: JOIN + GROUP BY + HAVING
-- Focus: analytics-style queries on joined tables

USE day1_sql;

-- --------------------------------------------------
-- 1. Course-wise average score
-- --------------------------------------------------
SELECT c.course, AVG(s.score) AS avg_score
FROM students s
INNER JOIN courses c
    ON s.id = c.student_id
GROUP BY c.course;

-- --------------------------------------------------
-- 2. Courses where average score > 75
-- --------------------------------------------------
SELECT c.course, AVG(s.score) AS avg_score
FROM students s
INNER JOIN courses c
    ON s.id = c.student_id
GROUP BY c.course
HAVING AVG(s.score) > 75;

-- --------------------------------------------------
-- 3. Course-wise highest score
-- --------------------------------------------------
SELECT c.course, MAX(s.score) AS max_score
FROM students s
INNER JOIN courses c
    ON s.id = c.student_id
GROUP BY c.course;

-- --------------------------------------------------
-- 4. Course-wise student count (high to low)
-- --------------------------------------------------
SELECT c.course, COUNT(*) AS student_count
FROM students s
INNER JOIN courses c
    ON s.id = c.student_id
GROUP BY c.course
ORDER BY student_count DESC;
