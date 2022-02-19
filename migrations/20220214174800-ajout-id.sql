-- ALTER TABLE courses
-- DROP COLUMN id; -- erase existing id column (note that the current id column has no constraints)

ALTER TABLE courses
ADD id serial; -- serial automatically increments the id integer

-- CREATE SEQUENCE -- create a temporary table
-- ALTER TABLE courses
-- ADD id integer;