-- Exercice 1

CREATE TABLE book (

    -- Attributs
    bookid INTEGER,
    authorid INTEGER,
    amount NUMERIC(7,2),
    rating INTEGER,
    booktype VARCHAR(25),

    -- Contraintes

    CHECK(rating >= 1 AND rating <= 10),
    CHECK(
        booktype = "Adult Fiction" OR 
        booktype = "Adult non-fiction" OR
        booktype = "Youth fiction" OR
        booktype = "Youth non-fiction"
    ),

    PRIMARY KEY (bookid),
    FOREIGN KEY (authorid) REFERENCES author(authorid)
    ON UPDATE CASCADE ON DELETE CASCADE
);

