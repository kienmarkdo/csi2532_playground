-- create
CREATE TABLE Professor (
	ssn INTEGER PRIMARY KEY,
	course_id VARCHAR(255),
	full_name VARCHAR(255),
	times_taught INTEGER
);

CREATE TABLE Course (
	course_id PRIMARY KEY,
	course_name VARCHAR(255),
	semester_date VARCHAR(255),
	is_recorded bool
);

-- insert

