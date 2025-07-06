# Partition Performance

Data inserted into the master **'Bookings'** table is routed by the database to the correct partition. 

Queries against the master **'Bookings'** table are also automatically routed to relevant partitions if the WHERE clause includes the partitioning key (start_date)."

Example:
`SELECT * FROM Bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-06-30' AND status = 'confirmed';`

This query will only scan the 'Bookings_2025' partition, significantly improving performance compared to scanning the entire unpartitioned table.

## Adding Indexes to the Individual Partitions
Indexes on primary key and foreign keys are crucial for performance within partitions.

_**PostgreSQL**_ automatically creates indexes on primary key and unique constraints for partitions but we need to create others explicitly.
