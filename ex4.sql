-- Exercice 4

ALTER TABLE author
ADD COLUMN author_sum_rating INTEGER DEFAULT 0;


CREATE FUNCTION check_book_rating()
    RETURNS trigger AS $$ -- return object of type trigger
BEGIN

    IF NEW.rating IS NOT 0 THEN

        UPDATE book
        SET author_sum_rating = SUM(
            (
                SELECT b.authorid, a.authorid
                FROM book AS b, author AS a
                WHERE b.authorid = a.authorid
            )
        );

    END IF;
    RETURN NEW;

END;
$$ LANGUAGE plpgsql; -- pl = programming language; pg = postgres; sql = sql


-- create trigger

CREATE TRIGGER trigger_test
    BEFORE UPDATE OF rating ON book
    FOR EACH ROW
    EXECUTE PROCEDURE check_book_rating();