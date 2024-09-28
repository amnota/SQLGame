WITH category AS (
    SELECT
        user_id,
        AVG(play_hours) AS avg_play_hours,  
        COUNT(review_id) AS review_count,
        CASE
            WHEN COUNT(review_id) < 50 THEN 'Casual Reviewer'
            WHEN COUNT(review_id) BETWEEN 50 AND 200 THEN 'Regular Reviewer'
            WHEN COUNT(review_id) BETWEEN 201 AND 300 THEN 'Frequent Reviewer'
            WHEN COUNT(review_id) > 300 THEN 'Top Reviewer'
        END AS reviewer_category
    FROM
        recommend_table
    GROUP BY
        user_id
),
total_users AS (
    SELECT COUNT(DISTINCT user_id) AS total_user_count
    FROM recommend_table
)
SELECT
    reviewer_category,
    COUNT(user_id) AS count_reviewers,  
    ROUND((COUNT(user_id) * 100.0) / (SELECT total_user_count FROM total_users), 2) AS percentage_of_users,
    ROUND(AVG(avg_play_hours), 2) AS avg_playtime  
FROM
    category
GROUP BY
    reviewer_category
ORDER BY
    count_reviewers DESC;