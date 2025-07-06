-- 1. Indexes for the User Table
CREATE INDEX idx_user_email ON Users (email);
-- Optional: If user_id is not already a primary key (which automatically creates an index),
--           and if you frequently query directly by user_id without joining:
-- CREATE INDEX idx_user_id ON Users (user_id);


-- 2. Indexes for the Booking Table
CREATE INDEX idx_booking_user_id ON Bookings (user_id);
CREATE INDEX idx_booking_property_id ON Bookings (property_id);
CREATE INDEX idx_booking_start_end_dates ON Bookings (start_date, end_date);
-- Or if queried separately more often:
-- CREATE INDEX idx_booking_start_date ON Bookings (start_date);
-- CREATE INDEX idx_booking_end_date ON Bookings (end_date);
-- Consider a compound index for status and dates if common queries filter by both:
-- CREATE INDEX idx_booking_status_dates ON Bookings (status, start_date, end_date);


-- 3. Indexes for the Property Table
CREATE INDEX idx_property_user_id ON Properties (user_id); -- Assuming user_id is the host_id
CREATE INDEX idx_property_location ON Properties (location);
-- If city and country are separate columns and frequently queried together for search:
-- CREATE INDEX idx_property_city_country ON Properties (city, country);
CREATE INDEX idx_property_price_per_night ON Properties (price_per_night);
-- Consider compound indexes for common search filters:
-- CREATE INDEX idx_property_location_price ON Properties (location, price_per_night);
-- CREATE INDEX idx_property_num_beds_guests ON Properties (num_bedrooms, num_guests);

---

EXPLAIN ANALYZE SELECT * FROM Properties WHERE price_per_night BETWEEN 100 AND 200 ORDER BY price_per_night;
