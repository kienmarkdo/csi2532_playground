-- Labo 06 More SQL --

ALTER TABLE customers
ADD COLUMN rating integer CHECK (1 <= rating AND rating <= 10);