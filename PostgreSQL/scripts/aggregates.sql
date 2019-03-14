-- Aggregate function examples: MIN, MAX, COUNT, etc.

-- COUNT() Example
\echo 'Count the number of students in each course'

SELECT name AS course_name, COUNT(course_id) AS students_enrolled
FROM enrollment
JOIN course
    ON enrollment.course_id = course.id
GROUP BY course_id, name;


-- HAVING clause
\echo 'List the students that are not enrolled in any course'

SELECT first_name, COUNT(enrollment.student_id) AS courses_enrolled_in
FROM student
LEFT OUTER JOIN enrollment
    ON student.id = enrollment.student_id
GROUP BY enrollment.student_id, first_name
HAVING COUNT(enrollment.student_id) = 0;


-- Use LIMIT and ORDER BY with COUNT, to get the student in most courses
\echo 'List the student enrolled in the most courses'

SELECT first_name, COUNT(student_id) AS courses_enrolled_in
FROM student
INNER JOIN enrollment
    ON student.id = enrollment.student_id
GROUP BY student_id, first_name
ORDER BY courses_enrolled_in DESC
LIMIT 1;


-- MIN() with a subquery
\echo 'Find the oldest student'

SELECT first_name, dob
FROM student
WHERE dob = (
    SELECT MIN(dob)
    FROM student
);
