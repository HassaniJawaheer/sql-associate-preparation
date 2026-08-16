SELECT
    address,
    address2,
    address || COALESCE(', ' || NULLIF(address2, ''), '') AS full_address
FROM address
ORDER BY address;