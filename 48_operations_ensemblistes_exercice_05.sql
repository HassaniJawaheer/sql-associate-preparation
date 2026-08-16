(
    SELECT customer_id
    FROM rental

    INTERSECT

    SELECT customer_id
    FROM payment
)

EXCEPT

SELECT customer_id
FROM rental
WHERE return_date IS NULL

ORDER BY customer_id ASC;
