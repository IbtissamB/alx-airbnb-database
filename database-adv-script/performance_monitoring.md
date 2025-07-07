## Some Frequently Used Queries

#### Searching properties
_Example_: `SELECT * FROM Properties WHERE location = 'London' AND start_date <= '2025-08-01' AND end_date >= '2025-08-05' AND price_per_night BETWEEN 50 AND 150;
`
#### Viewing a specific property's details
_Example_:` SELECT * FROM Properties WHERE property_id = 123;` (often implicitly joined with reviews, bookings)

#### Fetching a user's bookings
_Example_: `SELECT * FROM Bookings WHERE user_id = 456 ORDER BY start_date DESC;`

<br/>

## Monitoring Performance with EXPLAIN ANALYZE
-- Example Query

``` sql
EXPLAIN ANALYZE
SELECT
    p.property_id,
    p.property_name,
    p.location,
    p.price_per_night
FROM
    Properties AS p
WHERE
    p.location = 'London'
    AND p.price_per_night BETWEEN 100 AND 300
    AND NOT EXISTS (
        SELECT 1
        FROM Bookings AS b
        WHERE b.property_id = p.property_id
        AND b.status IN ('confirmed', 'pending')
        AND b.start_date <= '2025-08-10'
        AND b.end_date >= '2025-08-05'
    );
```

<br/>

## Bottlenecks
### 1. Seq Scan on properties p
This is a major bottleneck. The database is doing a full table scan on Properties  to find 'London' properties within the price range.

_**Suggested Changes**_

- Composite Index for the Properties table (to optimize location and price filtering)

  `CREATE INDEX idx_properties_location_price ON Properties (location, price_per_night);`

### 2. Seq Scan on bookings b
Another significant bottleneck. The NOT EXISTS subquery is also performing a full table scan on Bookings to find conflicting dates and statuses.

_**Suggested Changes**_

- Composite Index for the Bookings table (to optimize the NOT EXISTS subquery for availability)

  `CREATE INDEX idx_bookings_property_availability ON Bookings (property_id, start_date, end_date, status);`
