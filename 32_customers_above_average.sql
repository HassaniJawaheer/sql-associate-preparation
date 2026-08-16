SELECT
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_amount
FROM customer AS c
INNER JOIN payment AS p USING (customer_id)
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING SUM(p.amount) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT
            customer_id,
            SUM(amount) AS customer_total
        FROM payment
        GROUP BY customer_id
    ) AS customer_totals
)
ORDER BY
    total_amount DESC,
    c.last_name ASC;