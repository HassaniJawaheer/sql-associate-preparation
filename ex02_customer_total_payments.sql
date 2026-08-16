SELECT
    payment.customer_id AS customer_id,
    customer.first_name AS first_name,
    customer.last_name AS last_name,
    COUNT(payment.customer_id) AS payment_count
FROM payment
LEFT JOIN customer
    ON payment.customer_id = customer.customer_id
GROUP BY
    payment.customer_id,
    customer.first_name,
    customer.last_name
HAVING COUNT(payment.customer_id) > 30
ORDER BY
    payment_count DESC,
    customer_id ASC;