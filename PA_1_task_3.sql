SELECT
    r.rental_id AS rental_id,
    f.film_id AS film_id,
    f.title AS title,
    c.name AS category,
    r.rental_date AS rental_date,
    r.customer_id AS customer_id
FROM rental AS r
INNER JOIN inventory AS i USING (inventory_id)
INNER JOIN film AS f USING (film_id)
INNER JOIN film_category USING (film_id)
INNER JOIN category AS c USING (category_id)
WHERE c.name IN ('Drama', 'Comedy');