-- ===================================================
-- Airbnb Clone – Seed Data
-- Author: Amare Ushule
-- File: seed.sql
-- Repository: alx-airbnb-database
-- ===================================================

-- Enable UUID extension for PostgreSQL
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ===========================
-- USERS
-- ===========================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(uuid_generate_v4(), 'Alice', 'Smith', 'alice@example.com', 'hashed_password1', '0911000001', 'guest'),
(uuid_generate_v4(), 'Bob', 'Johnson', 'bob@example.com', 'hashed_password2', '0911000002', 'host'),
(uuid_generate_v4(), 'Carol', 'Williams', 'carol@example.com', 'hashed_password3', '0911000003', 'admin'),
(uuid_generate_v4(), 'David', 'Brown', 'david@example.com', 'hashed_password4', NULL, 'guest');

-- ===========================
-- PROPERTIES
-- ===========================
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
VALUES
(uuid_generate_v4(), (SELECT user_id FROM users WHERE email='bob@example.com'), 'Cozy Apartment', 'A cozy 2-bedroom apartment.', 'Addis Ababa', 50.00),
(uuid_generate_v4(), (SELECT user_id FROM users WHERE email='bob@example.com'), 'Modern Villa', 'Spacious villa with pool.', 'Bahir Dar', 120.00);

-- ===========================
-- BOOKINGS
-- ===========================
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(uuid_generate_v4(),
 (SELECT property_id FROM properties WHERE name='Cozy Apartment'),
 (SELECT user_id FROM users WHERE email='alice@example.com'),
 '2025-11-01', '2025-11-05', 200.00, 'confirmed'),
(uuid_generate_v4(),
 (SELECT property_id FROM properties WHERE name='Modern Villa'),
 (SELECT user_id FROM users WHERE email='david@example.com'),
 '2025-12-10', '2025-12-15', 600.00, 'pending');

-- ===========================
-- PAYMENTS
-- ===========================
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
(uuid_generate_v4(), (SELECT booking_id FROM bookings WHERE total_price=200.00), 200.00, 'credit_card'),
(uuid_generate_v4(), (SELECT booking_id FROM bookings WHERE total_price=600.00), 600.00, 'paypal');

-- ===========================
-- REVIEWS
-- ===========================
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
(uuid_generate_v4(),
 (SELECT property_id FROM properties WHERE name='Cozy Apartment'),
 (SELECT user_id FROM users WHERE email='alice@example.com'),
 5, 'Amazing stay! Highly recommended.'),
(uuid_generate_v4(),
 (SELECT property_id FROM properties WHERE name='Modern Villa'),
 (SELECT user_id FROM users WHERE email='david@example.com'),
 4, 'Great villa, but the pool was under maintenance.');

-- ===========================
-- MESSAGES
-- ===========================
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
(uuid_generate_v4(),
 (SELECT user_id FROM users WHERE email='alice@example.com'),
 (SELECT user_id FROM users WHERE email='bob@example.com'),
 'Hi Bob, I am interested in your apartment.'),
(uuid_generate_v4(),
 (SELECT user_id FROM users WHERE email='david@example.com'),
 (SELECT user_id FROM users WHERE email='bob@example.com'),
 'Hello, I would like to book the villa.');
