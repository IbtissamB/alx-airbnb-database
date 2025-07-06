SELECT * FROM Property 
WHERE property_id IN (
    -- Subquery: Get property_ids with AVG(rating) > 4.0
    SELECT property_id 
    FROM Review 
    GROUP BY property_id 
    HAVING AVG(rating) > 4.0  
); 

SELECT * FROM User 
WHERE user_id IN (
    SELECT user_id 
    FROM Booking 
    GROUP BY user_id 
    HAVING COUNT(*) > 3  
);
