SELECT
    domain_name,
    COUNT(*) AS nb_customers
FROM (
    SELECT
        SUBSTRING(email FROM STRPOS(email, '@') + 1) AS domain_name
    FROM customer
) AS domains
GROUP BY
    domain_name
ORDER BY
    nb_customers DESC,
    domain_name ASC;