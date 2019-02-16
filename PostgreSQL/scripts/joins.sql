-- TODO: Examples of all joins

-- Get details of all students in the Maths course
SELECT * FROM student
INNER JOIN enrollment
ON enrollment.student_id = student.id
