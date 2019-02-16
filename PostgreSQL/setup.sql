-- Set up example environment

-- Create user and database
CREATE USER test_user PASSWORD 'pass';
CREATE DATABASE example_db OWNER test_user;

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

-- Insert table fixtures
INSERT INTO student (first_name, last_name, sex)
VALUES ('david', 'lavelle', 'male'),
       ('lola', 'bunny', 'female'),
       ('paul', 'pogba', 'male');

INSERT INTO course (name)
VALUES ('Spanish'),
       ('Maths'),
       ('Science');

-- TODO: All JOIN examples
-- TODO: EXPLAIN example


-- TEST
SELECT * FROM student;
SELECT * FROM course;
