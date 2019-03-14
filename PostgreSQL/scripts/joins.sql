-- Examples of PostgresSQL JOIN clauses

-- INNER JOIN: Like an "intersection" of 2 sets.
\echo 'Get details of students enrolled in the Maths course'

SELECT student.first_name, enrollment.enrolled_on, course.name AS course_name
FROM student
INNER JOIN enrollment
    ON enrollment.student_id = student.id
INNER JOIN course
    ON course.id = enrollment.course_id
WHERE course.name = 'Maths';


-- LEFT OUTER JOIN: Everything from the left sided table, nulls in the right
-- if not present.
-- Not all students are enrolled in courses.
\echo 'List all students and what courses they are or are not enrolled in'

SELECT student.id AS student_id, student.first_name, enrollment.course_id, enrollment.enrolled_on
FROM student  -- lhs table
LEFT OUTER JOIN enrollment  -- rhs table
    ON enrollment.student_id = student.id
ORDER BY student.id;


-- RIGHT OUTER JOIN: Everything from the right sided table, null in the left
-- if not present.
-- Not all courses have students enrolled.
\echo 'List all courses and what students have or have not enrolled in them'

SELECT enrollment.student_id, enrollment.enrolled_on, course.id AS course_id, course.name
FROM enrollment  -- lhs table
RIGHT OUTER JOIN course  -- rhs table
    ON enrollment.course_id = course.id;

-- FULL OUTER JOIN: Like a union of 2 sets.
-- null values added on both left and right sided tables if not present.
\echo 'Get an overall view of all student, courses and enrollments'

SELECT *
FROM student
FULL OUTER JOIN enrollment
    ON enrollment.student_id = student.id
FULL OUTER JOIN course
    ON course.id = enrollment.course_id
ORDER BY student.id
