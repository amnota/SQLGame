CREATE TABLE  game (app_id int,
                    title varchar(255),
                    date_release date,
                    win boolean,
                    mac boolean,
                    linux boolean,
                    rating varchar(255),
                    positive_ratio int,
                    user_reviews int,
                    price_final decimal(10, 2),
                    price_original decimal(10, 2),
                    discount int,
                    steam_deck boolean
);

COPY game (app_id, title, date_release, win, mac, linux, rating, positive_ratio, user_reviews, price_final, price_original, discount, steam_deck)
FROM 'C:\Users\sarin\Desktop\SQLGame\game_project\game.ck.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM game