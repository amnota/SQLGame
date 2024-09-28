WITH DuplicateCheck AS (
    SELECT 
        COUNT(*) AS duplicate_count
    FROM 
        users_detail
    GROUP BY 
        user_id,
        purchase_products,
        amount_of_reviews
    HAVING COUNT(*) > 1
)
SELECT 
    'user_id' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN user_id IN (SELECT user_id FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN user_id IN (SELECT user_id FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM users_detail
UNION ALL
SELECT 
    'purchase_products' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN purchase_products IN (SELECT purchase_products FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN purchase_products IN (SELECT purchase_products FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM users_detail
UNION ALL
SELECT 
    'amount_of_reviews' AS column_name, 
    COUNT(*) AS total_rows, 
    SUM(CASE WHEN amount_of_reviews IN (SELECT amount_of_reviews FROM DuplicateCheck) THEN 1 ELSE 0 END) AS duplicate_values,
    COUNT(*) - SUM(CASE WHEN amount_of_reviews IN (SELECT amount_of_reviews FROM DuplicateCheck) THEN 1 ELSE 0 END) AS non_duplicate_values
FROM users_detail;
