# Index Performance - Airbnb Database

## Objective
Improve query performance by creating indexes on frequently used columns.

## Steps
1. Identify high-usage columns in users, bookings, properties, reviews, and payments tables.
2. Create indexes using SQL CREATE INDEX commands.
3. Measure performance before and after applying indexes using EXPLAIN or ANALYZE.

## Observations
- Queries using JOINs or WHERE clauses on indexed columns show improved execution times.
- Indexes reduced sequential scans and improved performance on large tables.
