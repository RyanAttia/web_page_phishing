WITH stats AS (
    SELECT
        AVG(CAST(phishing AS FLOAT)) AS avg_phishing,
        AVG(CAST(n_redirection AS FLOAT)) AS avg_n_redirection,
        SUM(CAST(phishing AS FLOAT) * CAST(n_redirection AS FLOAT)) AS sum_phishing_n_redirection,
        SUM(CAST(phishing AS FLOAT) * CAST(phishing AS FLOAT)) AS sum_phishing_squared,
        SUM(CAST(n_redirection AS FLOAT) * CAST(n_redirection AS FLOAT)) AS sum_n_redirection_squared,
        COUNT(*) AS n
    FROM
        view_web_page_phishing
)
SELECT
    (stats.sum_phishing_n_redirection - stats.n * stats.avg_phishing * stats.avg_n_redirection) / 
        (SQRT((stats.sum_phishing_squared - stats.n * POWER(stats.avg_phishing, 2)) * (stats.sum_n_redirection_squared - stats.n * POWER(stats.avg_n_redirection, 2)))) AS correlation_coefficient
FROM
    stats;
