WITH Stats AS (
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
    (Stats.sum_phishing_n_redirection - Stats.n * Stats.avg_phishing * Stats.avg_n_redirection) / 
        (SQRT((Stats.sum_phishing_squared - Stats.n * POWER(Stats.avg_phishing, 2)) * (Stats.sum_n_redirection_squared - Stats.n * POWER(Stats.avg_n_redirection, 2)))) AS correlation_coefficient
FROM
    Stats;
