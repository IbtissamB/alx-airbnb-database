-- Query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

SELECT
    user_id,                  -- Select the user identifier
    COUNT(booking_id) AS total_bookings -- Count the number of booking_ids for each user and alias the result
FROM
    bookings                  -- Specify the table from which to retrieve data
GROUP BY
    user_id                   -- Group the results by user_id to count bookings per distinct user
ORDER BY
    total_bookings DESC;      -- (Optional) Order the results to see users with most bookings first



-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.

WITH PropertyBookingCounts AS (
    SELECT
        property_id,
        COUNT(booking_id) AS total_bookings
    FROM
        bookings
    GROUP BY
        property_id
)
SELECT
    property_id,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS property_rank_by_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC, property_id ASC) AS property_row_number
FROM
    PropertyBookingCounts
ORDER BY
    property_rank_by_bookings ASC, total_bookings DESC;
