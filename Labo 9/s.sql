-- Exemples par le EA Hamidou

CREATE TABLE professeur(
    -- Attributs
    prof_id VARCHAR(20),
    nom VARCHAR(255),
    salary INT,

    -- Contraintes
    CHECK(nom <> "Z"), -- Constrainte: l'attribut nom ne peut pas être "Z". Le symbole <> est l'alternatif à !=
    CHECK(salary > 12000),

    -- Types de clés
    PRIMARY KEY(prof_id)
);

-- Assertions (utilisé lorsqu'on veut pas utilisé ALTER TABLE ADD CONSTRAINT CHECK() etc.)
-- REMARQUE: Les assertions ne fonctionne pas avec les bases de données relationelles
--           C'est mieux de faire un ALTER TABLE ADD CONSTRAINT... les assertions n'existent pas dans PostgreSQL
CREATE ASSERTION(
    CHECK(
        NOT EXISTS (SELECT * FROM professeur WHERE nom = "Z")
    )
);


-- Triggers (déclencheurs)
-- Trois étapes: Evènement(s), Condition, Action

CREATE TABLE cours(
    nom_cours VARCHAR(255),
    id_prof VARCHAR(20),
    FOREIGN KEY id_prof REFERENCES professeur(prof_id)
);


-- Contrainte d'intégrité syntaxe
-- ALTER TABLE table_name
-- ADD CONSTRAINT something

-- Trigger syntax
-- CREATE TRIGGER name {BEFORE | AFTER}
-- {event[OR...]} [OF attribute] ON table
-- [FOR [EACH] { ROW | STATEMENT }]
-- [WHEN(condition)]
-- EXECUTE PROCEDURE funcname(arguments)

-- Trigger functions