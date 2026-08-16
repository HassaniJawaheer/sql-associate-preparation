DROP MATERIALIZED VIEW IF EXISTS mock_booking_cleaned;

CREATE MATERIALIZED VIEW mock_booking_cleaned AS (

    WITH step_1 AS (
        SELECT
            *,

            -- Clean checkin_date first
            CASE
                WHEN checkin_date IS NULL THEN booking_date
                ELSE checkin_date
            END AS clean_checkin_date

        FROM mock_booking_raw
    ),

    step_2 AS (
        SELECT
            *,

            -- Clean booking_date using the cleaned checkin date
            CASE
                WHEN booking_date IS NULL THEN clean_checkin_date
                WHEN booking_date <= clean_checkin_date THEN booking_date
                ELSE clean_checkin_date
            END AS clean_booking_date

        FROM step_1
    )

    SELECT
        booking_id,

        CASE
            WHEN INITCAP(TRIM(customer_type))
                 IN ('Individual', 'Business', 'Group')
            THEN INITCAP(TRIM(customer_type))
            ELSE 'Individual'
        END AS customer_type,

        clean_booking_date AS booking_date,

        clean_checkin_date AS checkin_date,

        CASE
            WHEN checkout_date > clean_checkin_date
            THEN checkout_date
            ELSE clean_checkin_date + 1
        END AS checkout_date,

        CASE
            WHEN INITCAP(TRIM(room_type))
                 IN ('Standard', 'Deluxe', 'Suite', 'Family')
            THEN INITCAP(TRIM(room_type))
            ELSE 'Standard'
        END AS room_type,

        CASE
            WHEN guests BETWEEN 1 AND 8
            THEN guests
            ELSE 1
        END AS guests,

        CASE
            WHEN amount > 0 AND amount <= 1500
            THEN amount
            ELSE 100.00
        END AS amount,

        CASE
            WHEN INITCAP(TRIM(booking_status))
                 IN ('Confirmed', 'Completed', 'Cancelled', 'Pending')
            THEN INITCAP(TRIM(booking_status))
            ELSE 'Pending'
        END AS booking_status

    FROM step_2
);

SELECT *
FROM mock_booking_cleaned;