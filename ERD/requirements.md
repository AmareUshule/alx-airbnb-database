Database Normalization – Airbnb Database

1\. Original Schema Overview



Entities:



User (user\_id, first\_name, last\_name, email, password\_hash, phone\_number, role, created\_at)



Property (property\_id, host\_id, name, description, location, pricepernight, created\_at, updated\_at)



Booking (booking\_id, property\_id, user\_id, start\_date, end\_date, total\_price, status, created\_at)



Payment (payment\_id, booking\_id, amount, payment\_date, payment\_method)



Review (review\_id, property\_id, user\_id, rating, comment, created\_at)



Message (message\_id, sender\_id, recipient\_id, message\_body, sent\_at)



2\. Step 1: First Normal Form (1NF)



1NF Requirements:



Each column must contain atomic values.



Each row must be unique.



Analysis:



All attributes are atomic (no multi-valued attributes).



Primary keys exist for each table.



✅ Conclusion: The schema is in 1NF.



3\. Step 2: Second Normal Form (2NF)



2NF Requirements:



Already in 1NF.



No partial dependency of any column on a subset of a composite primary key.



Analysis:



All tables use single-column primary keys (UUIDs), so no partial dependencies exist.



✅ Conclusion: The schema is in 2NF.



4\. Step 3: Third Normal Form (3NF)



3NF Requirements:



Already in 2NF.



No transitive dependency (non-key column depends on another non-key column).



Analysis \& Adjustments:



User Table:



No transitive dependencies. ✅



Property Table:



host\_id is a foreign key → OK.



No attribute depends on another non-key attribute. ✅



Booking Table:



total\_price could be calculated as pricepernight \* number\_of\_nights.



Option: Remove total\_price to avoid redundancy. Or keep it for performance (denormalization).



Payment Table:



No transitive dependencies. ✅



Review Table:



No transitive dependencies. ✅



Message Table:



No transitive dependencies. ✅



5\. Additional 3NF Improvements



Separate property location details:



If location includes city, state, country, consider creating a Location table for reusability and to avoid repeating strings:



Location Table



location\_id (PK)



city



state



country



Then, Property references location\_id instead of location text. ✅



Separate Payment Method Table (Optional):



payment\_method\_id (PK)



method\_name (credit\_card, paypal, stripe)



Then, Payment.payment\_method\_id references this table.



These optional tables reduce redundancy and enforce consistency.



6\. 3NF Conclusion



After reviewing the schema:



All tables are in 3NF.



Optional refinements for Location and Payment Method tables can further reduce redundancy.



7\. Summary Table – Normalization Steps

Table	1NF	2NF	3NF	Notes

User	✅	✅	✅	No changes needed

Property	✅	✅	✅	Optional: Location table

Booking	✅	✅	✅	Optional: Remove total\_price

Payment	✅	✅	✅	Optional: Payment Method table

Review	✅	✅	✅	No changes needed

Message	✅	✅	✅	No changes needed

