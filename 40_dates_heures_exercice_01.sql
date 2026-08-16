SELECT
    DATE_PART('year', r.rental_date) AS year,
    DATE_PART('month', r.rental_date) AS month,
    COUNT(*) AS count
FROM rental AS r
GROUP BY
    DATE_PART('year', r.rental_date),
    DATE_PART('month', r.rental_date)
ORDER BY
    year ASC,
    month ASC;