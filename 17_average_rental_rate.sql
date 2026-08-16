SELECT
    rating,
    AVG(rental_rate) AS avg_rental_rate
FROM film
GROUP BY rating
ORDER BY
    avg_rental_rate DESC,
    rating ASC
;