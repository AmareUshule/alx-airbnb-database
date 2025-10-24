#  Entities and Relationships in ER Diagram

## 1. Entities and Attributes

### 1.1 User
**Attributes:**
- `user_id` (PK, UUID, Indexed)  
- `first_name` (VARCHAR, NOT NULL)  
- `last_name` (VARCHAR, NOT NULL)  
- `email` (VARCHAR, UNIQUE, NOT NULL)  
- `password_hash` (VARCHAR, NOT NULL)  
- `phone_number` (VARCHAR, NULL)  
- `role` (ENUM: guest, host, admin, NOT NULL)  
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)  

**Constraints:**
- `email` UNIQUE  
- Non-null: `first_name`, `last_name`, `email`, `password_hash`, `role`  

---

### 1.2 Property
**Attributes:**
- `property_id` (PK, UUID, Indexed)  
- `host_id` (FK → User.user_id)  
- `name` (VARCHAR, NOT NULL)  
- `description` (TEXT, NOT NULL)  
- `location` (VARCHAR, NOT NULL)  
- `price_per_night` (DECIMAL, NOT NULL)  
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)  
- `updated_at` (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)  

**Constraints:**
- FK: `host_id` → `User.user_id`  
- Non-null: `name`, `description`, `location`, `price_per_night`  

---

### 1.3 Booking
**Attributes:**
- `booking_id` (PK, UUID, Indexed)  
- `property_id` (FK → Property.property_id)  
- `user_id` (FK → User.user_id)  
- `start_date` (DATE, NOT NULL)  
- `end_date` (DATE, NOT NULL)  
- `total_price` (DECIMAL, NOT NULL)  
- `status` (ENUM: pending, confirmed, canceled, NOT NULL)  
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)  

**Constraints:**
- FK: `property_id`, `user_id`  
- `status` restricted to: pending, confirmed, canceled  

---

### 1.4 Payment
**Attributes:**
- `payment_id` (PK, UUID, Indexed)  
- `booking_id` (FK → Booking.booking_id)  
- `amount` (DECIMAL, NOT NULL)  
- `payment_date` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)  
- `payment_method` (ENUM: credit_card, paypal, stripe, NOT NULL)  

**Constraints:**
- FK: `booking_id`  
- Non-null: `amount`, `payment_method`  

---

### 1.5 Review
**Attributes:**
- `review_id` (PK, UUID, Indexed)  
- `property_id` (FK → Property.property_id)  
- `user_id` (FK → User.user_id)  
- `rating` (INTEGER, 1–5, NOT NULL)  
- `comment` (TEXT, NOT NULL)  
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)  

**Constraints:**
- FK: `property_id`, `user_id`  
- `rating` must be between 1 and 5  

---

### 1.6 Message
**Attributes:**
- `message_id` (PK, UUID, Indexed)  
- `sender_id` (FK → User.user_id)  
- `recipient_id` (FK → User.user_id)  
- `message_body` (TEXT, NOT NULL)  
- `sent_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)  

**Constraints:**
- FK: `sender_id`, `recipient_id`  
- Non-null: `message_body`  

---

## 2. Relationships

| Relationship                       | Type | Description |
|-----------------------------------|------|-------------|
| User → Property                    | 1:N  | A host (User) can list multiple properties; a property belongs to one host. |
| User → Booking                     | 1:N  | A guest (User) can make multiple bookings; each booking belongs to one user. |
| Property → Booking                 | 1:N  | A property can have multiple bookings; each booking is for one property. |
| Booking → Payment                  | 1:1  | Each booking has at least one payment; each payment belongs to a booking. |
| User → Review                      | 1:N  | A user can write multiple reviews; each review is written by one user. |
| Property → Review                  | 1:N  | A property can have multiple reviews; each review is for one property. |
| User → Message (as sender)         | 1:N  | A user can send many messages; each message has one sender. |
| User → Message (as recipient)      | 1:N  | A user can receive many messages; each message has one recipient. |


## ER Diagram

![Airbnb Database ER Diagram](airbnb_erd.png)



