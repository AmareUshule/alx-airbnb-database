-- Task 5: Partitioning Large Tables
-- Author: Amare Ushule
-- Project: alx-airbnb-database

-- Step 1: Rename the existing bookings table
ALTER TABLE bookings RENAME TO bookings_old;

-- Step 2: Create the parent (partitioned) table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    property_id INT REFERENCES properties(id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions based on year ranges
CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE bookings_2026 PARTITION OF bookings
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

-- Step 4: (Optional) Create a default partition for old data
CREATE TABLE bookings_default PARTITION OF bookings
    DEFAULT;

-- Step 5: Move data from old table into partitioned table
INSERT INTO bookings (id, user_id, property_id, start_date, end_date)
SELECT id, user_id, property_id, start_date, end_date
FROM bookings_old;

-- Step 6: Test performance on the partitioned table
EXPLAIN ANALYZE
SELECT * 
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-06-30';
