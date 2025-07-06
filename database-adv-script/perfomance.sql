-- Initial Query: Retrieve all confirmed, upcoming bookings in London with full details
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total_price,
    b.status AS booking_status,
    u.user_id,
    u.email AS user_email,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    p.property_id,
    p.property_name,
    p.location,
    p.price_per_night,
    p.num_bedrooms,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM
    Bookings AS b
INNER JOIN
    Users AS u ON b.user_id = u.user_id
INNER JOIN
    Properties AS p ON b.property_id = p.property_id
INNER JOIN
    Payments AS pay ON b.payment_id = pay.payment_id
WHERE
    b.status = 'confirmed'
    AND b.start_date >= CURRENT_DATE
    AND p.location = 'London';

-- For PostgreSQL:

EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total_price,
    b.status AS booking_status,
    u.user_id,
    u.email AS user_email,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    p.property_id,
    p.property_name,
    p.location,
    p.price_per_night,
    p.num_bedrooms,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM
    Bookings AS b
INNER JOIN
    Users AS u ON b.user_id = u.user_id
INNER JOIN
    Properties AS p ON b.property_id = p.property_id
INNER JOIN
    Payments AS pay ON b.payment_id = pay.payment_id
WHERE
    b.status = 'confirmed'
    AND b.start_date >= CURRENT_DATE
    AND p.location = 'London';
