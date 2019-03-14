-- Set up example environment

-- Create user and database
CREATE USER test_user PASSWORD 'pass';
CREATE DATABASE example_db OWNER test_user;

-- Connect to the newly created db to create tables in
\c example_db

-- Swith ROLE to test_user for this session
SET ROLE test_user;

-- Create tables
CREATE SEQUENCE student_id_seq;
CREATE TABLE student (
    -- more explicit version of "id SERIAL PRIMARY KEY"
    id INTEGER PRIMARY KEY DEFAULT nextval('student_id_seq'),
    first_name VARCHAR (30) NOT NULL,
    last_name VARCHAR (30) NOT NULL,
    dob DATE NOT NULL,
    sex VARCHAR (6) CHECK(sex in ('male', 'female')),  -- CHECK constraint
    UNIQUE (first_name, last_name, dob)  -- UNIQUE constraint multi columns
);

-- TODO: Index & DESCRIBE / EXPLAIN
-- TODO: Some function (e.g. create_full_name() -> first_name + last_name)

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
INSERT INTO student (first_name, last_name, dob, sex)
VALUES ('david', 'lavelle', '1985-06-10', 'male'),
       ('lola', 'bunny', '2014-07-18', 'female'),
       ('sarah', 'morvelle', '1998-01-01', 'female'),
       ('paul', 'pogba', '1993-03-15', 'male');

INSERT INTO course (name)
VALUES ('Spanish'),
       ('Maths'),
       ('History'),
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
