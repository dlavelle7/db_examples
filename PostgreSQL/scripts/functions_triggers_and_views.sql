-- TODO:
-- View to query birthday boy

SELECT first_name, updated_on
FROM student;

-- See TRIGGER in schema_and_fixtures.sql (max students per course is 3)
\echo 'Test trigger on student by updating a student row'

UPDATE student
SET first_name = 'robbie'
WHERE id = 5;

SELECT first_name, updated_on
FROM student;

-- TODO: Make this reusable
-- See TRIGGER in schema_and_fixtures.sql (max students per course is 3)
SELECT COUNT(course_id)
FROM enrollment
GROUP BY course_id
HAVING course_id = 2;

\echo 'Test trigger on enrollment by maxing out Maths course'

INSERT INTO enrollment (student_id, course_id) VALUES (4, 2);

INSERT INTO enrollment (student_id, course_id) VALUES (5, 2);


-- TODO: Last updated by (postgres docs)
