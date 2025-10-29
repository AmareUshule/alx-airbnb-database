-- Task 2: Aggregations and Window Functions
-- Author: Amare Ushule
-- Project: alx-airbnb-database

-- 1. Total number of bookings per user
SELECT 
    u.id AS user_id,
    u.username,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b
    ON u.id = b.user_id
GROUP BY u.id, u.username
ORDER BY total_bookings DESC;

-- 2. Rank properties based on total bookings
SELECT 
    p.id AS property_id,
    p.title AS property_title,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM properties p
LEFT JOIN bookings b
    ON p.id = b.property_id
GROUP BY p.id, p.title
ORDER BY booking_rank;
