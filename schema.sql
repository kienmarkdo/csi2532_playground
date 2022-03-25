-- Exemple d'un schema par l'EA Hamidou

CREATE SEQUENCE id_inc
    START WITH 1
    INCREMENT BY 1
    CACHE 1


CREATE TABLE patients_rdv (
    rdv_id SERIAL,
    nom VARCHAR(255),
    rdv DATE,
    PRIMARY KEY(rdv_id)
);

INSERT INTO patients_rdv (nom, rdv)
VALUES ('A', '2020-02-08'),
('A', '2022-02-28'),
('B', '2021-01-12'),
('E', '2022-04-02'),
('E', '2021-04-16'),
('E', '2020-04-22'),
('E', '2018-03-12'),
('E', '2022-04-02'),
('R', '2021-03-18'),
('R', '2021-04-18'),
('R', '2021-05-12'),
('B', '2020-12-01');






-- =========================  TRIGGERS PART START  ========================= --

-- define trigger function that is used to execute the procedure

CREATE FUNCTION trigger_function()
    RETURNS trigger AS $$ -- return object of type trigger
BEGIN

    IF NEW.nom IS NULL THEN
        RAISE EXCEPTION 'Le patient doit avoir un nom';
    END IF;
    RETURN NEW;


END;
$$ LANGUAGE plpgsql; -- pl = programming language; pg = postgres; sql = sql


-- create trigger

CREATE TRIGGER trigger_test -- name of trigger is trigger_test
BEFORE INSERT ON patients_rdv -- this means: before inserting into patients_rdv, trigger the function below
FOR EACH ROW
WHEN (nom = 'A')
EXECUTE PROCEDURE trigger_function();

-- To test the above trigger, write the following query into psql shell
-- INSERT INTO patients_rdv (nom, rdv) VALUES (NULL, '2002-02-02'); -- query to add patient with name NULL
-- It will say
-- ERROR: Le patient doit avoir un nom
-- CONTEXT: PL/pgSQL function trigger_function() line 4 at RAISE

-- =========================  TRIGGERS PART END  ========================= --












CREATE or REPLACE FUNCTION check_n()
    RETURNS trigger AS $$
BEGIN
    IF NEW.nom IS NULL THEN
        RAISE EXCEPTION 'Le patient doit avoir un nom';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE ASSERTION assert
CHECK (
    NOT EXISTS (SELECT * FROM patients_rdv WHERE nom = 'Z')
)

CREATE TRIGGER check_namedeeeee
BEFORE INSERT ON patients_rdv
FOR EACH ROW
EXECUTE PROCEDURE check_n();

CREATE TABLE i(
    x VARCHAR(255),
    y INT
);

INSERT INTO i
VALUES ('QWeEE', 1);


