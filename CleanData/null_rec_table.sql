WITH NullCounts AS (
    SELECT
        'app_id' AS column_name,
        COUNT(*) AS total_rows,
        COUNT(app_id) AS non_null_values,
        COUNT(*) - COUNT(app_id) AS null_values
    FROM recommend_table
    UNION ALL
    SELECT
        'helpful',
        COUNT(*),
        COUNT(helpful_user_count),
        COUNT(*) - COUNT(helpful_user_count)
    FROM recommend_table
    UNION ALL
    SELECT
        'funny',
        COUNT(*),
        COUNT(funny_user_count),
        COUNT(*) - COUNT(funny_user_count)
    FROM recommend_table
    UNION ALL
    SELECT
        'date_publish',
        COUNT(*),
        COUNT(date_publish_rec),
        COUNT(*) - COUNT(date_publish_rec)
    FROM recommend_table
    UNION ALL
    SELECT
        'is_recommend',
        COUNT(*),
        COUNT(is_recommended),
        COUNT(*) - COUNT(is_recommended)
    FROM recommend_table
    UNION ALL
    SELECT
        'play_hours',
        COUNT(*),
        COUNT(play_hours),
        COUNT(*) - COUNT(play_hours)
    FROM recommend_table
    UNION ALL
    SELECT
        'user_id',
        COUNT(*),
        COUNT(user_id),
        COUNT(*) - COUNT(user_id)
    FROM recommend_table
    UNION ALL
    SELECT
        'review_id',
        COUNT(*),
        COUNT(review_id),
        COUNT(*) - COUNT(review_id)
    FROM recommend_table
)
-- Final Selection from the CTE
SELECT 
    column_name,
    total_rows,
    non_null_values,
    null_values
FROM 
    NullCounts
ORDER BY 
    column_name;