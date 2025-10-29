# Task 6: Monitor and Refine Database Performance  
**Author:** Amare Ushule  
**Project:** alx-airbnb-database  

---

## 🎯 Objective
To monitor and refine database performance by analyzing query execution plans, identifying bottlenecks, and implementing schema or indexing optimizations.

---

## 🧪 Step 1: Monitor Query Performance

### 🧩 Example 1: Query Without Optimization
```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 12;

CREATE INDEX idx_bookings_user_id ON bookings(user_id);

## Optimize Complex JOIN Queries 

EXPLAIN ANALYZE
SELECT 
    b.id,
    u.username,
    p.title,
    pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id;
