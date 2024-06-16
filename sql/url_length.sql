WITH Stats AS (
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
    (Stats.sum_xy - Stats.n * Stats.avg_phishing * Stats.avg_url_length) / 
        (SQRT((Stats.sum_x2 - Stats.n * POWER(Stats.avg_phishing, 2)) * (Stats.sum_y2 - Stats.n * POWER(Stats.avg_url_length, 2)))) AS correlation_coefficient
FROM
    Stats;
