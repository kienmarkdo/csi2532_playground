-- q3 Chaque professeur enseigne exactement un cours (ni plus, ni moins).

CREATE TABLE professeur (
	id_p varchar(255) PRIMARY KEY
);

CREATE TABLE cours (
	id_c varchar(5) PRIMARY KEY -- exemples: H2022, E2022, A2022 --
);

CREATE TABLE enseigner (
	id_p varchar(5),
	id_c varchar(255),
	FOREIGN KEY (id_p) REFERENCES professeur(id_p), -- Remarque: les parenthèses sont requis --
	FOREIGN KEY (id_c) REFERENCES cours(id_c),
	PRIMARY KEY (id_p, id_c)
);