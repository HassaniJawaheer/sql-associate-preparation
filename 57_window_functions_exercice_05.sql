SELECT
   customer_id,
   c.first_name,
   c.last_name,
   SUM(p.amount) AS total_amount,
   RANK() OVER (ORDER BY SUM(p.amount) DESC) AS rank
FROM customer AS c
INNER JOIN payment AS p USING (customer_id)
GROUP BY
    customer_id,
    c.first_name,
    c.last_name
ORDER BY
    rank ASC
LIMIT 10;
