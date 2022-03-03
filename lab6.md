1. 

SELECT name birthplace FROM artists;

2. 

SELECT title, price FROM artworks WHERE year > 1600;

3. 

SELECT artworks.title, artworks.type
FROM artworks
WHERE (artworks.year = 2000 OR artworks.artist_name = 'Picasso');

4. 

SELECT name, birthplace
FROM artists
WHERE dateofbirth >= '1880-01-01' AND dateofbirth < '1930-01-01';

5. 

SELECT name, country
FROM artists
WHERE style IN ('Modern', 'Baroque', 'Renaissance');

6. 

SELECT *
FROM artworks
GROUP BY title;

7. 

SELECT c.name, c.id
FROM customers AS c, likeartists AS l
WHERE c.id = l.customer_id
AND l.artist_name = 'Picasso';

8. 

SELECT c.name
FROM customers AS c, likeartists AS l, artists, artworks
WHERE (
    c.id = l.customer_id AND
    l.artist_name = artists.name AND
    artists.style = 'Renaissance' AND
    artists.name = artworks.artist_name AND
    artworks.price > 30000
);