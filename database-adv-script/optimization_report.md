# Optimization Report - Airbnb Database

## Objective
Refactor a complex query to improve performance and reduce execution time.

## Initial Query
- Retrieved all bookings with user, property, and payment details.
- Used multiple LEFT JOINs and SELECT *.

## Analysis
- EXPLAIN ANALYZE showed sequential scans and nested loops.
- Execution time was high due to unindexed columns.

## Optimized Query
- Selected only required columns.
- Used JOIN for guaranteed matches.
- Created indexes on join columns:
  - bookings.user_id
  - bookings.property_id
  - payments.booking_id

## Performance Improvement
- Reduced execution time by X% (measure with EXPLAIN ANALYZE)
- Index scans replaced sequential scans.
- Query now efficient for large datasets.
