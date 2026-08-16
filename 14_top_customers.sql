SELECT 
    customer_id,
	first_name,
	last_name,
	create_date
FROM customer
ORDER BY create_date DESC
LIMIT 10;