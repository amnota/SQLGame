SELECT
    COUNT(CASE WHEN win = TRUE THEN 1 END ) AS window_platform,
    COUNT(CASE WHEN mac THEN 1 END) AS mac_platform,
    COUNT(CASE WHEN linux THEN 1 END) AS linus_platform
FROM
    game_detail;