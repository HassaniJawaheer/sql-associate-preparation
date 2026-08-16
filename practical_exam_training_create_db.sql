
DROP TABLE IF EXISTS mock_branch_raw;

CREATE TABLE mock_branch_raw (
    id              INTEGER PRIMARY KEY,
    location        VARCHAR(20),
    total_rooms     INTEGER,
    staff_count     INTEGER,
    opening_year    INTEGER,
    target_guests   VARCHAR(30)
);

-- ---------------------------------------------------------
-- 1. Generate 1,000 normal rows
-- ---------------------------------------------------------

INSERT INTO mock_branch_raw (
    id,
    location,
    total_rooms,
    staff_count,
    opening_year,
    target_guests
)
SELECT
    n,

    CASE (n % 4)
        WHEN 0 THEN 'Europe'
        WHEN 1 THEN 'North America'
        WHEN 2 THEN 'Asia'
        ELSE 'South America'
    END,

    40 + (n % 311),

    25 + (n % 476),

    1995 + (n % 30),

    CASE (n % 2)
        WHEN 0 THEN 'Leisure'
        ELSE 'Business'
    END

FROM generate_series(1, 1000) AS n;


-- ---------------------------------------------------------
-- 2. Introduce missing values in several columns
-- ---------------------------------------------------------

UPDATE mock_branch_raw
SET location = NULL
WHERE id % 41 = 0;

UPDATE mock_branch_raw
SET total_rooms = NULL
WHERE id % 47 = 0;

UPDATE mock_branch_raw
SET staff_count = NULL
WHERE id % 53 = 0;

UPDATE mock_branch_raw
SET opening_year = NULL
WHERE id % 59 = 0;

UPDATE mock_branch_raw
SET target_guests = NULL
WHERE id % 61 = 0;


-- ---------------------------------------------------------
-- 3. Introduce invalid categorical values
-- ---------------------------------------------------------

UPDATE mock_branch_raw
SET location = 'Unknown Region'
WHERE id % 67 = 0;

UPDATE mock_branch_raw
SET target_guests = 'Corporate'
WHERE id % 71 = 0;


-- ---------------------------------------------------------
-- 4. Introduce invalid numerical values
-- ---------------------------------------------------------

UPDATE mock_branch_raw
SET total_rooms = 0
WHERE id % 73 = 0;

UPDATE mock_branch_raw
SET total_rooms = 550
WHERE id % 79 = 0;

UPDATE mock_branch_raw
SET staff_count = -5
WHERE id % 83 = 0;

UPDATE mock_branch_raw
SET opening_year = 1980
WHERE id % 89 = 0;

UPDATE mock_branch_raw
SET opening_year = 2035
WHERE id % 97 = 0;