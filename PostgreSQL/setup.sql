-- Set up example environment

-- Create user and database
CREATE USER test_user PASSWORD 'pass';
CREATE DATABASE example_db OWNER test_user;

-- TODO: Swith to test_user
-- Connect to the newly created db to create tables in
\c example_db

-- Create tables
CREATE SEQUENCE student_id_seq;
CREATE TABLE student (
    -- more explicit version of "id SERIAL PRIMARY KEY"
    id INTEGER PRIMARY KEY DEFAULT nextval('student_id_seq'),
    first_name VARCHAR (30) NOT NULL,
    last_name VARCHAR (30) NOT NULL,
    sex VARCHAR (6) CHECK(sex in ('male', 'female'))  -- CHECK constraint
);

-- TODO: Unique constraint  on (first_name, last_name)
-- TODO: Index
-- TODO: Some function

CREATE TABLE course (
    id SERIAL PRIMARY KEY,
    name VARCHAR (30) NOT NULL
);

-- Table to resolve M:M relationship between students and courses
CREATE TABLE enrollment (
    -- Foreign key constraints
    student_id INTEGER REFERENCES student (id),
    course_id INTEGER REFERENCES course (id),
    enrolled_on DATE NOT NULL DEFAULT CURRENT_DATE,
    -- Instead of creating an "id" column make pk constraint a composite
    PRIMARY KEY (student_id, course_id)
);

-- Insert table fixtures
INSERT INTO student (first_name, last_name, sex)
VALUES ('david', 'lavelle', 'male'),
       ('lola', 'bunny', 'female'),
       ('paul', 'pogba', 'male');

INSERT INTO course (name)
VALUES ('Spanish'),
       ('Maths'),
       ('Science');

INSERT INTO enrollment (student_id, course_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (1, 2);

-- TEST
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM enrollment;
