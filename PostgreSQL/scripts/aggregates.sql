-- TODO: Aggregate function examples: MIN, MAX, GROUP BY, etc.

-- COUNT() Example - Count the number of students in each course
SELECT course_id, COUNT(course_id) AS students_enrolled
FROM enrollment
GROUP BY course_id
ORDER BY course_id
