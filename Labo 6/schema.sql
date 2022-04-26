-- Labo 06 More SQL --
-- Un diagramme relationnel peut être exprimé sous la forme d'un schéma SQL.
-- Les noms dans le diagramme diffèrent du SQL ci-dessous.
CREATE TABLE artists (
  name VARCHAR(20), 
  birthplace VARCHAR(20), 
  style VARCHAR(20), 
  dateofbirth DATE, 
  PRIMARY KEY (name)
);
CREATE TABLE customers (
  id INTEGER, 
  name VARCHAR(20), 
  address VARCHAR(20), 
  amount numeric(8, 2), 
  PRIMARY KEY (id)
);
CREATE TABLE artworks (
  title VARCHAR(20), 
  year INTEGER, 
  type VARCHAR(20), 
  price numeric(8, 2), 
  artist_name VARCHAR(20), 
  PRIMARY KEY (title), 
  FOREIGN KEY(artist_name) REFERENCES artists(name)
);
CREATE TABLE likeartists (
  customer_id INTEGER, 
  artist_name VARCHAR(20), 
  PRIMARY KEY(artist_name, customer_id), 
  FOREIGN KEY (artist_name) REFERENCES artists(name), 
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);
-- Insérez les données suivantes dans votre base de données
INSERT INTO customers (id, name, address, amount) 
VALUES 
  (1, 'John', 'Ottawa', 8.5), 
  (2, 'Amy', 'Orleans', 9.0), 
  (3, 'Peter', 'Gatineau', 6.3);
INSERT INTO artists (
  name, birthplace, style, dateofbirth
) 
VALUES 
  (
    'Caravaggio', 'Milan', 'Baroque', 
    '1571-09-28'
  ), 
  (
    'Smith', 'Ottawa', 'Modern', '1977-12-12'
  ), 
  (
    'Picasso', 'Malaga', 'Cubism', '1881-10-25'
  );
INSERT INTO artworks (
  title, year, type, price, artist_name
) 
VALUES 
  (
    'Blue', 2000, 'Modern', 10000.00, 'Smith'
  ), 
  (
    'The Cardsharps', 1594, 'Baroque', 
    40000.00, 'Caravaggio'
  );
