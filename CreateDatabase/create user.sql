CREATE TABLE users (user_id int,
                        purchase_products int,
                        amount_of_reviews int
);

COPY users (user_id, purcahse_products, amount_of_reviews)
FROM 'C:\Users\sarin\Desktop\SQLGame\game_project\users.csv'
DELIMITER ','
CSV HEADER; 

SELECT * 
FROM users
LIMIT 100;