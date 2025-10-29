-- Task 4: Optimized Complex Query with WHERE/AND
-- Author: Amare Ushule
-- Project: alx-airbnb-database

-- Retrieve all bookings with user, property, and payment details
-- Filter for active bookings in 2025 and completed payments

SELECT 
    b.id AS booking_id,
    u.id AS user_id,
    u.username AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.title AS property_title,
    p.price_per_night,
    pay.id AS payment_id,
    pay.amount AS payment_amount,
    pay.payment_status
FROM bookings b
LEFT JOIN users u 
    ON b.user_id = u.id
LEFT JOIN properties p 
    ON b.property_id = p.id
LEFT JOIN payments pay 
    ON b.id = pay.booking_id
WHERE b.start_date >= '2025-01-01'
  AND b.end_date <= '2025-12-31'
  AND (pay.payment_status = 'Completed' OR pay.payment_status IS NULL);

EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.username AS user_name,
    u.email AS user_email,
    p.title AS property_title,
    p.price_per_night,
    pay.amount AS payment_amount,
    pay.payment_status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;

