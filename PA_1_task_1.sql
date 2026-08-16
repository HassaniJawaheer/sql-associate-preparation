DROP MATERIALIZED VIEW mock_branch_cleaned;

CREATE MATERIALIZED VIEW mock_branch_cleaned AS (
SELECT
    id,

    CASE
        WHEN location IN ('Europe', 'North America', 'Asia', 'South America')
            THEN location
        ELSE 'Unknown'
    END AS location,

    CASE
        WHEN total_rooms BETWEEN 40 AND 350
            THEN total_rooms
        ELSE 100
    END AS total_rooms,

    CASE
        WHEN staff_count BETWEEN 25 AND 500
            THEN staff_count
        ELSE 100
    END AS staff_count,

    CASE
        WHEN opening_year BETWEEN 1995 AND 2024
            THEN opening_year
        ELSE 2000
    END AS opening_year,

    CASE
        WHEN target_guests IN ('Leisure', 'Business')
            THEN target_guests
        ELSE 'Leisure'
    END AS target_guests

FROM mock_branch_raw
);

SELECT * 
FROM mock_branch_cleaned;