-- TODO: Aggregate function examples: MIN, MAX, GROUP BY, etc.

-- COUNT() Example - Count the number of students in each course
SELECT course_id, name, COUNT(course_id) AS students_enrolled
FROM enrollment
JOIN course
    ON enrollment.course_id = course.id
GROUP BY course_id, name
ORDER BY course_id
