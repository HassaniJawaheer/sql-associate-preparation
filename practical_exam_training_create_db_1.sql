DROP TABLE IF EXISTS mock_booking_raw;

CREATE TABLE mock_booking_raw (
    booking_id      INTEGER PRIMARY KEY,
    customer_type   VARCHAR(30),
    booking_date    DATE,
    checkin_date    DATE,
    checkout_date   DATE,
    room_type       VARCHAR(30),
    guests          INTEGER,
    amount           NUMERIC(10,2),
    booking_status  VARCHAR(30)
);


-- ---------------------------------------------------------
-- 1. Generate 2,000 normal rows
-- ---------------------------------------------------------

INSERT INTO mock_booking_raw (
    booking_id,
    customer_type,
    booking_date,
    checkin_date,
    checkout_date,
    room_type,
    guests,
    amount,
    booking_status
)
SELECT
    n,

    CASE (n % 3)
        WHEN 0 THEN 'Individual'
        WHEN 1 THEN 'Business'
        ELSE 'Group'
    END,

    DATE '2023-01-01' + (n % 700),

    DATE '2023-01-01'
        + (n % 700)
        + (5 + (n % 60)),

    DATE '2023-01-01'
        + (n % 700)
        + (5 + (n % 60))
        + (1 + (n % 14)),

    CASE (n % 4)
        WHEN 0 THEN 'Standard'
        WHEN 1 THEN 'Deluxe'
        WHEN 2 THEN 'Suite'
        ELSE 'Family'
    END,

    1 + (n % 6),

    ROUND(
        (
            60
            + (n % 240)
            + ((n % 17) * 0.75)
        )::numeric,
        2
    ),

    CASE (n % 4)
        WHEN 0 THEN 'Confirmed'
        WHEN 1 THEN 'Completed'
        WHEN 2 THEN 'Cancelled'
        ELSE 'Pending'
    END

FROM generate_series(1, 2000) AS n;


-- ---------------------------------------------------------
-- 2. Missing values
-- ---------------------------------------------------------

UPDATE mock_booking_raw
SET customer_type = NULL
WHERE booking_id % 43 = 0;

UPDATE mock_booking_raw
SET booking_date = NULL
WHERE booking_id % 47 = 0;

UPDATE mock_booking_raw
SET checkin_date = NULL
WHERE booking_id % 53 = 0;

UPDATE mock_booking_raw
SET checkout_date = NULL
WHERE booking_id % 59 = 0;

UPDATE mock_booking_raw
SET room_type = NULL
WHERE booking_id % 61 = 0;

UPDATE mock_booking_raw
SET guests = NULL
WHERE booking_id % 67 = 0;

UPDATE mock_booking_raw
SET amount = NULL
WHERE booking_id % 71 = 0;

UPDATE mock_booking_raw
SET booking_status = NULL
WHERE booking_id % 73 = 0;


-- ---------------------------------------------------------
-- 3. Inconsistent categorical/text values
-- ---------------------------------------------------------

UPDATE mock_booking_raw
SET customer_type = 'individual'
WHERE booking_id % 79 = 0;

UPDATE mock_booking_raw
SET customer_type = ' BUSINESS '
WHERE booking_id % 83 = 0;

UPDATE mock_booking_raw
SET customer_type = 'Corporate'
WHERE booking_id % 89 = 0;


UPDATE mock_booking_raw
SET room_type = 'standard'
WHERE booking_id % 97 = 0;

UPDATE mock_booking_raw
SET room_type = ' Deluxe '
WHERE booking_id % 101 = 0;

UPDATE mock_booking_raw
SET room_type = 'Premium'
WHERE booking_id % 103 = 0;


UPDATE mock_booking_raw
SET booking_status = 'confirmed'
WHERE booking_id % 107 = 0;

UPDATE mock_booking_raw
SET booking_status = ' COMPLETED '
WHERE booking_id % 109 = 0;

UPDATE mock_booking_raw
SET booking_status = 'Unknown'
WHERE booking_id % 113 = 0;


-- ---------------------------------------------------------
-- 4. Invalid numerical values
-- ---------------------------------------------------------

UPDATE mock_booking_raw
SET guests = 0
WHERE booking_id % 127 = 0;

UPDATE mock_booking_raw
SET guests = -2
WHERE booking_id % 131 = 0;

UPDATE mock_booking_raw
SET guests = 15
WHERE booking_id % 137 = 0;


UPDATE mock_booking_raw
SET amount = 0
WHERE booking_id % 139 = 0;

UPDATE mock_booking_raw
SET amount = -150.00
WHERE booking_id % 149 = 0;

UPDATE mock_booking_raw
SET amount = 9999.99
WHERE booking_id % 151 = 0;


-- ---------------------------------------------------------
-- 5. Invalid chronological relationships
-- ---------------------------------------------------------

UPDATE mock_booking_raw
SET booking_date = checkin_date + 5
WHERE booking_id % 157 = 0;


UPDATE mock_booking_raw
SET checkout_date = checkin_date
WHERE booking_id % 163 = 0;


UPDATE mock_booking_raw
SET checkout_date = checkin_date - 3
WHERE booking_id % 167 = 0;


-- ---------------------------------------------------------
-- 6. Unusual but potentially valid date cases
-- ---------------------------------------------------------

UPDATE mock_booking_raw
SET checkin_date = booking_date
WHERE booking_id % 173 = 0;


UPDATE mock_booking_raw
SET checkout_date = checkin_date + 30
WHERE booking_id % 179 = 0;