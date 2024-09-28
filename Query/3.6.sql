SELECT
    title,
    win,
    mac,
    linux,
    CASE 
        WHEN win = TRUE AND mac = TRUE AND linux = TRUE THEN 'Available on all platforms'
        ELSE 'Limited Availability'
    END AS platforms_availability,
    SUM(user_reviews) AS total_review,
    ROUND(SUM(CASE WHEN is_recommended = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS recommend_percentage,
    positive_ratio,
    ROUND(AVG(play_hours), 2) AS avg_playtime
FROM 
    game_detail
JOIN 
    recommend_table ON recommend_table.app_id = game_detail.app_id
GROUP BY
    title,
    win,
    mac,
    linux,
    positive_ratio
ORDER BY
    total_review DESC  
LIMIT 10;