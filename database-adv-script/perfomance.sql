Initial Query:
SELECT
    -- Booking Details
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total_price,
    b.status AS booking_status,

    -- User Details
    u.user_id,
    u.username,
    u.email AS user_email,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,

    -- Property Details
    p.property_id,
    p.property_name,
    p.location,
    p.price_per_night,
    p.num_bedrooms,

    -- Payment Details
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date,

FROM
    Bookings AS b -- Start with the central Bookings table, aliased as 'b'
INNER JOIN
    Users AS u ON b.user_id = u.user_id -- Join with Users table on user_id
INNER JOIN
    Properties AS p ON b.property_id = p.property_id -- Join with Properties table on property_id
INNER JOIN
    Payments AS pay ON b.payment_id = pay.payment_id; -- Join with Payments table on payment_id

-- For PostgreSQL:
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total_price,
    b.status AS booking_status,
    u.user_id,
    u.username,
    u.email AS user_email,
    p.property_id,
    p.property_name,
    p.location,
    p.price_per_night,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.status AS payment_status
FROM
    Bookings AS b
INNER JOIN
    Users AS u ON b.user_id = u.user_id
INNER JOIN
    Properties AS p ON b.property_id = p.property_id
INNER JOIN
    Payments AS pay ON b.payment_id = pay.payment_id;
