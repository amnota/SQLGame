WITH DuplicateCheck AS (
    SELECT 
        COUNT(*) AS duplicate_count
    FROM 
        recommend_table
    GROUP BY 
        app_id,
        helpful_user_count,
        funny_user_count,
        date_publish_rec,
        is_recommended,
        play_hours,
        user_id,
        review_id
    HAVING COUNT(*) > 1
)
SELECT 
    'app_id' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN app_id IN (SELECT app_id FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN app_id IN (SELECT app_id FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM recommend_table
UNION ALL
SELECT 
    'helpful_user_count' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN helpful_user_count IN (SELECT helpful_user_count FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN helpful_user_count IN (SELECT helpful_user_count FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM recommend_table
UNION ALL
SELECT 
    'funny_user_count' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN funny_user_count IN (SELECT funny_user_count FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN funny_user_count IN (SELECT funny_user_count FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM recommend_table
UNION ALL
SELECT 
    'date_publish_rec' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN date_publish_rec IN (SELECT date_publish_rec FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN date_publish_rec IN (SELECT date_publish_rec FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM recommend_table
UNION ALL
SELECT 
    'is_recommended' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN is_recommended IN (SELECT is_recommended FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN is_recommended IN (SELECT is_recommended FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM recommend_table
UNION ALL
SELECT 
    'play_hours' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN play_hours IN (SELECT play_hours FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN play_hours IN (SELECT play_hours FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM recommend_table
UNION ALL
SELECT 
    'user_id' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN user_id IN (SELECT user_id FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN user_id IN (SELECT user_id FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM recommend_table
UNION ALL
SELECT 
    'review_id' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN review_id IN (SELECT review_id FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN review_id IN (SELECT review_id FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM recommend_table;