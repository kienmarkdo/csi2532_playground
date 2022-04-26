-- Labo 06 More SQL --

-- Supprimez toutes les tables avec l'instruction DROP TABLE. Ou exécutez ALTER TABLE pour supprimer / rajouter la clé
-- étrangère avec la propriété CASCADE.

ALTER TABLE 
  artworks 
DROP 
  CONSTRAINT artworks_artist_name_fkey;
ALTER TABLE 
  artworks 
ADD 
  CONSTRAINT artworks_artist_name_fkey FOREIGN KEY (artist_name) REFERENCES artists(name) ON DELETE CASCADE ON UPDATE CASCADE;
