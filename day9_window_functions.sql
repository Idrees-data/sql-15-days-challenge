-- Day 9: Window Functions
-- Focus: ranking without collapsing rows

USE day1_sql;
select name , score,
row_number() over(order by score desc)
as ranking
from students;

select name , score,
rank()over(order by score desc) as ranki
from students;

show tables;
SELECT name, score,
       DENSE_RANK() OVER (ORDER BY score DESC) AS drnk
FROM students;
INSERT INTO students
VALUES (6, 'khali', 22, 89);

show tables;
SELECT name, score,
       DENSE_RANK() OVER (ORDER BY score DESC) AS drnk
from students;


-- 1. Rank all students by score (highest first)

SELECT name, score,
       ROW_NUMBER() OVER (ORDER BY score DESC) AS row_num,
       RANK() OVER (ORDER BY score DESC) AS rank_num,
       DENSE_RANK() OVER (ORDER BY score DESC) AS dense_rank_num
FROM students;


-- 2. Rank students within each course

SELECT s.name, c.course, s.score,
       RANK() OVER (PARTITION BY c.course ORDER BY s.score DESC) AS course_rank
FROM students s
JOIN courses c
ON s.id = c.student_id;


-- 3. Top student(s) per course

SELECT *
FROM (
    SELECT s.name, c.course, s.score,
           RANK() OVER (PARTITION BY c.course ORDER BY s.score DESC) AS rnk
    FROM students s
    JOIN courses c
    ON s.id = c.student_id
) t
WHERE rnk = 1;
