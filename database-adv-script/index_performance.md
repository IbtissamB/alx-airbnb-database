### User Table
This table typically stores information about the application's users.
- `user_id` : Almost always used in JOIN clauses (e.g., joining User to Booking), WHERE clauses (e.g., WHERE user_id = 123), and sometimes ORDER BY.
- `email` : Often used in WHERE clauses for login authentication (WHERE email = 'user@example.com'), JOIN (identifying users), and ORDER BY for sorting user lists.


### Booking Table
This table records details about each reservation.
- `booking_id`: WHERE (e.g., WHERE booking_id = 456), JOIN.
- `start_date`, `end_date` : Critical for WHERE clauses (e.g., WHERE start_date BETWEEN '...' AND '...'), ORDER BY (e.g., sorting upcoming bookings), and checking property availability.
- Foreign Keys (`user_id`, `property_id`): Heavily used in JOIN clauses to link bookings to the user who made them and the property being booked. Also in WHERE clauses to find bookings by a specific user or for a specific property.

### Property Table
This table stores details about the listings available for booking.
- `property_id`: Often used in JOIN clauses (e.g., joining Property to Booking), WHERE clauses (e.g., WHERE property_id = 789), and ORDER BY.
- `location`: Extremely common in WHERE clauses for search functionality (WHERE city = 'London').
- `price_per_night`: Often used in WHERE clauses for price range filtering (WHERE price_per_night BETWEEN 50 AND 200) and ORDER BY for sorting by price.
- Foreign Key (`user_id`): Used in JOIN clauses to link properties to their hosts. Also in WHERE clauses to find all properties owned by a specific host.

---

### How to Confirm High-Usage:

- Analyze Query Logs: Examine your database query logs to see which columns appear most frequently in WHERE, JOIN, and ORDER BY clauses.

- Use Database Performance Monitoring Tools: Many database systems (PostgreSQL, MySQL, etc.) and cloud providers (AWS RDS, Google Cloud SQL) offer tools that track query performance and index usage.

---

### Steps to Measure Performance
`EXPLAIN ANALYZE` in PostgreSQL, or `EXPLAIN EXTENDED` in MySQL/MariaDB
  
1. Select a Representative Query: 
    `SELECT * FROM Bookings WHERE user_id = 123;`
2. Measure BEFORE Indexing:
    `EXPLAIN ANALYZE SELECT * FROM Bookings WHERE user_id = 123;`
3. Create the Indexes:
    Execute the `CREATE INDEX` commands
4. Measure after Indexing
