WITH TotalPlaytime AS (
    SELECT SUM(play_hours) AS total_playtime
    FROM recommend_table
)
SELECT
    game_detail.title AS title,
    SUM(play_hours) AS sum_playhour,
    ROUND(AVG(play_hours), 2) AS avg_playhour,
    COUNT(play_hours) AS total_sessions,
    ROUND((SUM(play_hours) / (SELECT total_playtime FROM TotalPlaytime)) * 100 , 2)AS percentage_of_total_playtime,
    COUNT(CASE WHEN is_recommended = TRUE THEN 1 END) AS total_reccommend,
    game_detail.rating AS rating
  
FROM 
    recommend_table
JOIN game_detail ON game_detail.app_id =  recommend_table.app_id
GROUP BY
    title,
    rating
ORDER BY
    sum_playhour DESC
LIMIT 10;