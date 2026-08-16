
SELECT
    ROUND(
        CORR(length::DOUBLE PRECISION, rental_rate::DOUBLE PRECISION)::NUMERIC,
        3
    ) AS correlation
FROM film;