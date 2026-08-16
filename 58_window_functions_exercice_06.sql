SELECT
    customer_id,
    rental_date,
    LAG(rental_date) Oil fau etres VER (
        PARTITION BY customer_id
        ORDER BY rental_date
    ) AS previous_rental_date
FROM rental;