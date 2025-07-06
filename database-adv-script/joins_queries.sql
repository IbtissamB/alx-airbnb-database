-- a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.

SELECT * FROM Bookings 
INNER JOIN Users 
ON Bookings.user_id = Users.user_id; 

-- a query using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
SELECT 
    Property.property_id,
    Property.name,
    Property.location,
    Property.pricepernight,
    Review.review_id,
    Review.rating,
    Review.comment,
    Review.created_at AS review_date
FROM 
    Property
LEFT JOIN 
    Review ON Property.property_id = Review.property_id

-- a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

  SELECT * FROM Users 
FULL OUTER JOIN Bookings 
ON Users.user_id = Bookings.user_id 
