WITH DuplicateCheck AS (
    SELECT 
        COUNT(*) AS duplicate_count
    FROM 
        game_detail
    GROUP BY 
        app_id,
        title,
        date_release,
        win,
        mac,
        linux,
        rating,
        positive_ratio,
        user_reviews,
        price_final,
        price_original,
        discount,
        steam_deck
    HAVING COUNT(*) > 1
)
SELECT 
    'app_id' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN app_id IN (SELECT app_id FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN app_id IN (SELECT app_id FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM game_detail
UNION ALL
SELECT 
    'title' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN title IN (SELECT title FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN title IN (SELECT title FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM game_detail
UNION ALL
SELECT 
    'date_release' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN date_release IN (SELECT date_release FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN date_release IN (SELECT date_release FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM game_detail
UNION ALL
SELECT 
    'win' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN win IN (SELECT win FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN win IN (SELECT win FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM game_detail
UNION ALL
SELECT 
    'mac' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN mac IN (SELECT mac FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN mac IN (SELECT mac FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM game_detail
UNION ALL
SELECT 
    'linux' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN linux IN (SELECT linux FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN linux IN (SELECT linux FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM game_detail
UNION ALL
SELECT 
    'rating' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN rating IN (SELECT rating FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN rating IN (SELECT rating FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM game_detail
UNION ALL
SELECT 
    'positive_ratio' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN positive_ratio IN (SELECT positive_ratio FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN positive_ratio IN (SELECT positive_ratio FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM game_detail
UNION ALL
SELECT 
    'user_reviews' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN user_reviews IN (SELECT user_reviews FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN user_reviews IN (SELECT user_reviews FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM game_detail
UNION ALL
SELECT 
    'price_final' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN price_final IN (SELECT price_final FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN price_final IN (SELECT price_final FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM game_detail
UNION ALL
SELECT 
    'price_original' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN price_original IN (SELECT price_original FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN price_original IN (SELECT price_original FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM game_detail
UNION ALL
SELECT 
    'discount' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN discount IN (SELECT discount FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN discount IN (SELECT discount FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM game_detail
UNION ALL
SELECT 
    'steam_deck' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN steam_deck IN (SELECT steam_deck FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN steam_deck IN (SELECT steam_deck FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM game_detail;