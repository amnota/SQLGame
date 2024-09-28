SELECT
    rating,
    COUNT(*)
FROM
    game_detail
GROUP BY
    rating
ORDER BY
    COUNT(*) DESC