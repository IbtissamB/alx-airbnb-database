# Normalization

### Definition
Normalization is the process of organizing data to reduce redundancy and improve data integrity. It involves dividing a database into two or more tables and defining relationships between them.

## Normalization Forms:

- **First Normal Form (1NF)**: Ensure each column contains atomic values, and each record is unique.

- **Second Normal Form (2NF)**: Achieve 1NF and ensure all non-key attributes are fully functionally dependent on the primary key.

- **Third Normal Form (3NF)**: Achieve 2NF and ensure all attributes are functionally dependent only on the primary key.

## How to Normalize:

- Identify Functional Dependencies: Determine which attributes are dependent on others.
- Decompose Tables: Break tables into smaller tables to remove redundancy.
- Define Relationships: Use foreign keys to maintain relationships between decomposed tables

## Our schema

### User

- All attributes depend only on `user_id`.

- role is not derived from any other attribute.

### Property

- All attributes depend on `property_id`.

- `host_id` is a foreign key, but not a transitive dependency.

### Booking

- `property_id` and `user_id` are foreign keys, not derived from each other.

- All other attributes (`start_date`, `total_price` etc) depend only on `booking_id`.

### Payment

- All attributes depend on `payment_id`.

- `amount`, `payment_method` are not derivable from other attributes.

### Review

- Attributes like `rating`, `comment` depend only on `review_id`.

- Even though it references a property and user, no transitive dependency exists.

### Message

- All attributes depend on` message_id`.

- `Sender` and `recipient` are foreign keys and `message_body` depends only on `message_id`.

### Summary:

- Atomic fields.

- No partial dependencies.

- No transitive dependencies.

- Proper use of foreign keys without violating normalization.
