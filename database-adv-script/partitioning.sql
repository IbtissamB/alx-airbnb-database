-- This table will not store data itself, but directs data to its partitions.
CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    payment_id INT, -- Assuming payment_id is nullable or linked later
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    -- Add foreign key constraints (deferrable if creating before referenced tables)
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    CONSTRAINT fk_property
        FOREIGN KEY (property_id)
        REFERENCES Properties (property_id),
    CONSTRAINT fk_payment
        FOREIGN KEY (payment_id)
        REFERENCES Payments (payment_id)
) PARTITION BY RANGE (start_date); -- Define partitioning strategy by start_date

-- Partition for 2024 bookings
CREATE TABLE Bookings_2024 PARTITION OF Bookings
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- (Optional but recommended)
-- Index on user_id for faster lookups within partitions
CREATE INDEX idx_bookings_2024_user_id ON Bookings_2024 (user_id);

