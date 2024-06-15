WITH stats AS (
    SELECT
        AVG(CAST(phishing AS FLOAT)) AS avg_phishing,
        AVG(CAST(url_length AS FLOAT)) AS avg_url_length,
        SUM(CAST(phishing AS FLOAT) * CAST(url_length AS FLOAT)) AS sum_xy,
        SUM(CAST(phishing AS FLOAT) * CAST(phishing AS FLOAT)) AS sum_x2,
        SUM(CAST(url_length AS FLOAT) * CAST(url_length AS FLOAT)) AS sum_y2,
        COUNT(*) AS n
    FROM
        view_web_page_phishing
)
SELECT
    (stats.sum_xy - stats.n * stats.avg_phishing * stats.avg_url_length) / 
        (SQRT((stats.sum_x2 - stats.n * POWER(stats.avg_phishing, 2)) * (stats.sum_y2 - stats.n * POWER(stats.avg_url_length, 2)))) AS correlation_coefficient
FROM
    stats;
