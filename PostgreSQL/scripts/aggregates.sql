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

SELECT first_name
FROM student
LEFT OUTER JOIN enrollment
    ON student.id = enrollment.student_id
GROUP BY enrollment.student_id, first_name
HAVING COUNT(enrollment.student_id) = 0;


-- TODO
-- Subquery example with MAX()
\echo 'List the student enrolled in the most courses'
SELECT student_id, COUNT(student_id)
FROM enrollment
GROUP BY enrollment.student_id;



-- TODO: MAX() dob (date)
