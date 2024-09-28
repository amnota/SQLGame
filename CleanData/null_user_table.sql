WITH NullCounts AS (
    SELECT
        'user_id' AS column_name,
        COUNT(*) AS total_rows,
        COUNT(user_id) AS non_null_values,
        COUNT(*) - COUNT(user_id) AS null_values
    FROM users_detail
    UNION ALL
    SELECT
        'purchase_products',
        COUNT(*),
        COUNT(purchase_products),
        COUNT(*) - COUNT(purchase_products)
    FROM users_detail
    UNION ALL
    
    SELECT
        'amount_of_reviews',
        COUNT(*),
        COUNT(amount_of_reviews),
        COUNT(*) - COUNT(amount_of_reviews)
    FROM users_detail
)

SELECT
    column_name,
    total_rows,
    non_null_values,
    null_values
FROM NullCounts