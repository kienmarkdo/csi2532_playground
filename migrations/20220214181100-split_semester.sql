SELECT course_name,
split_part(semester,'-',1) session,
split_part(semester,'-',2) annee,
* FROM courses;
-- split_part() has 3 parameters: column, delimiter, index of the column (note that index starts at 1) | -- "W-2020-DR" => ["W","2020","DR"]
