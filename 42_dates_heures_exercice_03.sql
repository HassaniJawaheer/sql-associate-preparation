SELECT
    DATE_TRUNC('month', r.rental_date) AS month_debut,
    COUNT(DISTINCT r.rental_id) AS nbs_locations,
    SUM(p.amount) AS total_amount,
    AVG(p.payment_date - r.rental_date) AS mean_delay
FROM rental AS r
INNER JOIN payment AS p USING (rental_id)
GROUP BY
    DATE_TRUNC('month', r.rental_date)
ORDER BY
    month_debut ASC;