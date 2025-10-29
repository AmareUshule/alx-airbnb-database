-- Task 3: Indexes for Optimization
-- Author: Amare Ushule
-- Project: alx-airbnb-database

-- 1. Indexes on Users table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_username ON users(username);

-- 2. Indexes on Properties table
CREATE INDEX idx_properties_owner_id ON properties(owner_id);
CREATE INDEX idx_properties_title ON properties(title);

-- 3. Indexes on Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- 4. Indexes on Reviews table
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);

-- 5. Indexes on Payments table
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- Query: Total bookings per user
EXPLAIN ANALYZE
SELECT u.id, u.username, COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.username;

