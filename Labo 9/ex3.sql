-- Exercice 3

-- define trigger function that is used to execute the procedure
-- assume that the function has already been created

CREATE FUNCTION check_book_rating()
    RETURNS trigger AS $$ -- return object of type trigger
BEGIN

    -- l'implémentation de mon collègue

END;
$$ LANGUAGE plpgsql; -- pl = programming language; pg = postgres; sql = sql


-- create trigger

CREATE TRIGGER trigger_test
    BEFORE UPDATE OF rating ON book
    FOR EACH ROW
    EXECUTE PROCEDURE check_book_rating();