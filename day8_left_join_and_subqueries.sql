-- Day 8: LEFT JOIN, NULL handling, and Subqueries
-- Focus: missing data + nested queries (interview essentials)

USE day1_sql;

-- --------------------------------------------------
-- LEFT JOIN + NULL handling
-- --------------------------------------------------

-- 1. Show all students and their course (if any)
SELECT s.name, c.course
FROM students s
LEFT JOIN courses c
ON s.id = c.student_id;

-- 2. Show students who are NOT enrolled in any course
SELECT s.name
FROM students s
LEFT JOIN courses c
ON s.id = c.student_id
WHERE c.course IS NULL;

-- 3. Show students enrolled in SQL and also those with no course
SELECT s.name, c.course
FROM students s
LEFT JOIN courses c
ON s.id = c.student_id
WHERE c.course = 'SQL' OR c.course IS NULL;

-- --------------------------------------------------
-- SUBQUERIES
-- --------------------------------------------------

-- 4. Students with above-average score
SELECT name, score
FROM students
WHERE score >
      (SELECT AVG(score) FROM students);

-- 5. Students enrolled in SQL (using subquery)
SELECT name
FROM students
WHERE id IN
      (SELECT student_id FROM courses WHERE course = 'SQL');

-- 6. Students NOT enrolled in any course (using subquery)
SELECT name
FROM students
WHERE id NOT IN
      (SELECT student_id FROM courses);

-- 7. Count students whose score is above average
SELECT COUNT(*) AS total_students
FROM (
    SELECT score
    FROM students
    WHERE score >
          (SELECT AVG(score) FROM students)
) t;
