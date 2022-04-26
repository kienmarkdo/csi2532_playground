-- Exercice 2

CREATE TABLE author (

    -- Attributs
    authorid INTEGER,
    authorname VARCHAR(20),

    -- Contraintes
    PRIMARY KEY (authorid),
);

-- Assertions (utilisé lorsqu'on veut pas utilisé ALTER TABLE ADD CONSTRAINT CHECK() etc.)
-- REMARQUE: Les assertions ne fonctionne pas avec les bases de données relationelles
--           C'est mieux de faire un ALTER TABLE ADD CONSTRAINT... les assertions n'existent pas dans PostgreSQL
CREATE ASSERTION(
    CHECK(
        NOT EXISTS (SELECT * FROM book WHERE amount < 10000)
    )
);