SELECT
    title,
    COUNT(CASE WHEN is_recommended = TRUE THEN 1 END) AS num_reccommend,
    user_reviews,
    positive_ratio,
    ROUND(AVG(play_hours), 2) AS avg_playhour,
    ROUND(SUM(purchase_products)) AS product_sell
FROM recommend_table
JOIN game_detail ON game_detail.app_id = recommend_table.app_id
JOIN users_detail ON users_detail.user_id = recommend_table.user_id  
GROUP BY
    title,
    user_reviews,
    positive_ratio
ORDER BY
    num_reccommend DESC
LIMIT 10    