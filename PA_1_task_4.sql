SELECT
    customer_id,
    staff_id,
    ROUND(AVG(amount), 2) AS avg_payment
FROM payment
GROUP BY
    customer_id,
    staff_id
HAVING AVG(amount) < 4.00
ORDER BY avg_payment ASC;
