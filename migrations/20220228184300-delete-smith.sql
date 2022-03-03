-- Labo 06 More SQL --

-- Supprimer l'artiste Smith automatiquement

SELECT *
FROM artworks; -- Smith exists!!!
DELETE
FROM artists
WHERE name = 'Smith';
SELECT *
FROM artworks; -- Smith will be gone!!!
