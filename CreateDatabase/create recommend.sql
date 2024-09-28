    CREATE TABLE reccommend (app_id int,
                             helpful_user_count int,
                             funny_user_count int,
                             date_publish_rec date,
                             is_recommended boolean,
                             play_hours decimal(10 , 2),
                             user_id int,
                             review_id int

    );

COPY reccommend (app_id,helpful_user_count,funny_user_count,date_publish_rec,is_recommended,play_hours,user_id,review_id )
FROM 'C:\Users\sarin\Desktop\SQLGame\game_project\recommendations.csv'
DELIMITER ','
CSV HEADER; 

SELECT *
FROM reccommend
LIMIT 100;