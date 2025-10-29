-- Complex SQL Joins for Airbnb Database
-- Author: Amare Ushule
-- Project: alx-airbnb-database

-- 1️⃣ INNER JOIN: All bookings with the respective users who made them
SELECT 
    bookings.id AS booking_id,
    users.username AS booked_by,
    users.email,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM bookings
INNER JOIN users
ON bookings.user_id = users.id;

-- 2️⃣ LEFT JOIN: All properties and their reviews (even properties without reviews)
SELECT 
    properties.id AS property_id,
    properties.title,
    properties.price_per_night,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment,
    reviews.user_id AS reviewer_id
FROM properties
LEFT JOIN reviews
ON properties.id = reviews.property_id;

-- 3️⃣ FULL OUTER JOIN: All users and all bookings, even if unmatched
SELECT 
    users.id AS user_id,
    users.username,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM users
FULL OUTER JOIN bookings
ON users.id = bookings.user_id;
