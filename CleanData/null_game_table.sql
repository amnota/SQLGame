WITH NullCounts AS (
    SELECT
        'app_id' AS column_name,
        COUNT(*) AS total_rows,
        COUNT(app_id) AS non_null_values,
        COUNT(*) - COUNT(app_id) AS null_values
    FROM game_detail
    UNION ALL
    SELECT
        'title',
        COUNT(*),
        COUNT(title),
        COUNT(*) - COUNT(title)
    FROM game_detail
    UNION ALL
    SELECT
        'date_release',
        COUNT(*),
        COUNT(date_release),
        COUNT(*) - COUNT(date_release)
    FROM game_detail
    UNION ALL
    SELECT
        'win',
        COUNT(*),
        COUNT(win),
        COUNT(*) - COUNT(win)
    FROM game_detail
    UNION ALL
    SELECT
        'mac',
        COUNT(*),
        COUNT(mac),
        COUNT(*) - COUNT(mac)
    FROM game_detail
    UNION ALL
    SELECT
        'linux',
        COUNT(*),
        COUNT(linux),
        COUNT(*) - COUNT(linux)
    FROM game_detail
    UNION ALL
    SELECT
        'rating',
        COUNT(*),
        COUNT(rating),
        COUNT(*) - COUNT(rating)
    FROM game_detail
    UNION ALL
    SELECT
        'positive_ratio',
        COUNT(*),
        COUNT(positive_ratio),
        COUNT(*) - COUNT(positive_ratio)
    FROM game_detail
    UNION ALL
    SELECT
        'user_reviews',
        COUNT(*),
        COUNT(user_reviews),
        COUNT(*) - COUNT(user_reviews)
    FROM game_detail
    UNION ALL
    SELECT
        'price_final',
        COUNT(*),
        COUNT(price_final),
        COUNT(*) - COUNT(price_final)
    FROM game_detail
    UNION ALL
    SELECT
        'price_original',
        COUNT(*),
        COUNT(price_original),
        COUNT(*) - COUNT(price_original)
    FROM game_detail
    UNION ALL
    SELECT
        'discount',
        COUNT(*),
        COUNT(discount),
        COUNT(*) - COUNT(discount)
    FROM game_detail
    UNION ALL
    SELECT
        'steam_deck',
        COUNT(*),
        COUNT(steam_deck),
        COUNT(*) - COUNT(steam_deck)
    FROM game_detail
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