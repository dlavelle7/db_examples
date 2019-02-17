-- TODO: Examples of all joins

-- Get details of students enrolled in the Maths course
SELECT student.first_name, enrollment.enrolled_on, course.name AS course_name
FROM student
INNER JOIN enrollment
    ON enrollment.student_id = student.id
INNER JOIN course
    ON course.id = enrollment.course_id
WHERE course.name = 'Maths';
