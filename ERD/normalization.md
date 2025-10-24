\# D# Database Normalization – AirBnB Clone



\## ✅ Objective

Ensure that the relational database schema is normalized up to \*\*Third Normal Form (3NF)\*\* by eliminating redundancy, ensuring data integrity, and enforcing proper relationships between tables.



---



\## 1. First Normal Form (1NF)



A table is in 1NF if:

\- Each cell contains a single value (atomicity).

\- Each record is unique.

\- No repeating groups or arrays.



| Table      | 1NF Compliance | Explanation |

|------------|----------------|-------------|

| User       | ✅ Yes          | All fields are atomic (e.g., first\_name, last\_name). No repeating data. |

| Property   | ✅ Yes          | Each property has a single host and atomic fields. |

| Booking    | ✅ Yes          | Each row is uniquely identified by booking\_id; no repeating groups. |

| Payment    | ✅ Yes          | Stores one payment per booking. |

| Review     | ✅ Yes          | One review per property per user. |

| Message    | ✅ Yes          | One message per sender–recipient pair. |



---



\## 2. Second Normal Form (2NF)



A table is in 2NF if:

\- It is already in 1NF.

\- No \*\*partial dependency\*\* on a part of a composite primary key.



All tables here have \*\*single-column primary keys (UUIDs)\*\*.  

✅ Therefore, \*\*no partial dependency exists\*\*, and all tables comply with \*\*2NF\*\*.



---



\## 3. Third Normal Form (3NF)



A table is in 3NF if:

\- It is in 2NF.

\- No \*\*transitive dependency\*\* (non-key column depending on another non-key column).



\### ✔ Normalization Checks:



\#### ✅ User Table

\- \*\*No transitive dependencies\*\*.  

\- `role`, `email`, `phone\_number` depend only on `user\_id`.



\#### ✅ Property Table

\- `host\_id` depends on `user\_id` → valid foreign key.  

\- No fields depend on non-key attributes.



\#### ✅ Booking Table

\- `total\_price` depends on (property\_id, start\_date, end\_date) and is calculated, but this is acceptable for performance.  

\- No violation of 3NF.



\#### ✅ Payment Table

\- All non-key fields depend only on `payment\_id`.  

\- No transitive dependency.



\#### ✅ Review Table

\- Review depends only on `review\_id`.  

\- No derived or repeated attributes.



\#### ✅ Message Table

\- Each message depends only on `message\_id`.  

\- No transitive dependencies.



---



\## ✅ Conclusion



✔ The database schema \*\*satisfies 1NF, 2NF, and 3NF\*\*.  

✔ No redundancies or transitive dependencies identified.  

✔ Proper use of foreign keys ensures \*\*referential integrity\*\*.



---



\## 🔄 Optional Enhancements (Future Improvements)



| Suggestion | Benefit |

|------------|---------|

| Separate `location` in Property into `country`, `city`, `street` | Better querying \& filtering |

| Create a separate `PaymentMethod` table | Avoid ENUM limitations and allow extensibility |

| Add `unique (property\_id, user\_id, start\_date)` in Booking | Prevent duplicate bookings |



---



\*\*Author:\*\* \*Your Name\*  

\*\*Repository:\*\* `alx-airbnb-database`  

\*\*File:\*\* `normalization.md`



atabase Normalization – AirBnB Clone



\## ✅ Objective

Ensure that the relational database schema is normalized up to \*\*Third Normal Form (3NF)\*\* by eliminating redundancy, ensuring data integrity, and enforcing proper relationships between tables.



---



\## 1. First Normal Form (1NF)



A table is in 1NF if:

\- Each cell contains a single value (atomicity).

\- Each record is unique.

\- No repeating groups or arrays.



| Table      | 1NF Compliance | Explanation |

|------------|----------------|-------------|

| User       | ✅ Yes          | All fields are atomic (e.g., first\_name, last\_name). No repeating data. |

| Property   | ✅ Yes          | Each property has a single host and atomic fields. |

| Booking    | ✅ Yes          | Each row is uniquely identified by booking\_id; no repeating groups. |

| Payment    | ✅ Yes          | Stores one payment per booking. |

| Review     | ✅ Yes          | One review per property per user. |

| Message    | ✅ Yes          | One message per sender–recipient pair. |



---



\## 2. Second Normal Form (2NF)



A table is in 2NF if:

\- It is already in 1NF.

\- No \*\*partial dependency\*\* on a part of a composite primary key.



All tables here have \*\*single-column primary keys (UUIDs)\*\*.  

✅ Therefore, \*\*no partial dependency exists\*\*, and all tables comply with \*\*2NF\*\*.



---



\## 3. Third Normal Form (3NF)



A table is in 3NF if:

\- It is in 2NF.

\- No \*\*transitive dependency\*\* (non-key column depending on another non-key column).



\### ✔ Normalization Checks:



\#### ✅ User Table

\- \*\*No transitive dependencies\*\*.  

\- `role`, `email`, `phone\_number` depend only on `user\_id`.



\#### ✅ Property Table

\- `host\_id` depends on `user\_id` → valid foreign key.  

\- No fields depend on non-key attributes.



\#### ✅ Booking Table

\- `total\_price` depends on (property\_id, start\_date, end\_date) and is calculated, but this is acceptable for performance.  

\- No violation of 3NF.



\#### ✅ Payment Table

\- All non-key fields depend only on `payment\_id`.  

\- No transitive dependency.



\#### ✅ Review Table

\- Review depends only on `review\_id`.  

\- No derived or repeated attributes.



\#### ✅ Message Table

\- Each message depends only on `message\_id`.  

\- No transitive dependencies.



---



\## ✅ Conclusion



✔ The database schema \*\*satisfies 1NF, 2NF, and 3NF\*\*.  

✔ No redundancies or transitive dependencies identified.  

✔ Proper use of foreign keys ensures \*\*referential integrity\*\*.



---



\## 🔄 Optional Enhancements (Future Improvements)



| Suggestion | Benefit |

|------------|---------|

| Separate `location` in Property into `country`, `city`, `street` | Better querying \& filtering |

| Create a separate `PaymentMethod` table | Avoid ENUM limitations and allow extensibility |

| Add `unique (property\_id, user\_id, start\_date)` in Booking | Prevent duplicate bookings |



---



\*\*Author:\*\* \*Your Name\*  

\*\*Repository:\*\* `alx-airbnb-database`  

\*\*File:\*\* `normalization.md`





