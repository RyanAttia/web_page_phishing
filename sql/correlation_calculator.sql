WITH stats AS (
    SELECT
        COUNT(*) AS cnt,
        AVG(phishing) AS avg_phishing,
        AVG(url_length) AS avg_url_length,
        AVG(n_redirection) AS avg_n_redirection,
        AVG(n_dots) AS avg_n_dots,
        AVG(n_hyphens) AS avg_n_hyphens,
        AVG(n_underline) AS avg_n_underline,
        AVG(n_slash) AS avg_n_slash,
        AVG(n_questionmark) AS avg_n_questionmark,
        AVG(n_equal) AS avg_n_equal,
        AVG(n_at) AS avg_n_at,
        AVG(n_and) AS avg_n_and,
        AVG(n_exclamation) AS avg_n_exclamation,
        AVG(n_space) AS avg_n_space,
        AVG(n_tilde) AS avg_n_tilde,
        AVG(n_comma) AS avg_n_comma,
        AVG(n_plus) AS avg_n_plus,
        AVG(n_asterisk) AS avg_n_asterisk,
        AVG(n_hashtag) AS avg_n_hashtag,
        AVG(n_dollar) AS avg_n_dollar,
        AVG(n_percent) AS avg_n_percent
    FROM view_web_page_phishing
), correlations AS (
    SELECT
        'url_length' AS column_name,
        (SUM((phishing - avg_phishing) * (url_length - avg_url_length)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(url_length - avg_url_length, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(url_length) AS avg_url_length
        FROM
            view_web_page_phishing
    ) AS stats
    UNION ALL
    SELECT
        'n_redirection' AS column_name,
        (SUM((phishing - avg_phishing) * (n_redirection - avg_n_redirection)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(n_redirection - avg_n_redirection, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(n_redirection) AS avg_n_redirection
        FROM
            view_web_page_phishing
    ) AS stats
    UNION ALL
    SELECT
        'n_dots' AS column_name,
        (SUM((phishing - avg_phishing) * (n_dots - avg_n_dots)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(n_dots - avg_n_dots, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(n_dots) AS avg_n_dots
        FROM
            view_web_page_phishing
    ) AS stats
    UNION ALL
    SELECT
        'n_hyphens' AS column_name,
        (SUM((phishing - avg_phishing) * (n_hyphens - avg_n_hyphens)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(n_hyphens - avg_n_hyphens, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(n_hyphens) AS avg_n_hyphens
        FROM
            view_web_page_phishing
    ) AS stats
    UNION ALL
    SELECT
        'n_underline' AS column_name,
        (SUM((phishing - avg_phishing) * (n_underline - avg_n_underline)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(n_underline - avg_n_underline, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(n_underline) AS avg_n_underline
        FROM
            view_web_page_phishing
    ) AS stats
    UNION ALL
    SELECT
        'n_slash' AS column_name,
        (SUM((phishing - avg_phishing) * (n_slash - avg_n_slash)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(n_slash - avg_n_slash, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(n_slash) AS avg_n_slash
        FROM
            view_web_page_phishing
    ) AS stats
    UNION ALL
    SELECT
        'n_questionmark' AS column_name,
        (SUM((phishing - avg_phishing) * (n_questionmark - avg_n_questionmark)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(n_questionmark - avg_n_questionmark, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(n_questionmark) AS avg_n_questionmark
        FROM
            view_web_page_phishing
    ) AS stats
    UNION ALL
    SELECT
        'n_equal' AS column_name,
        (SUM((phishing - avg_phishing) * (n_equal - avg_n_equal)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(n_equal - avg_n_equal, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(n_equal) AS avg_n_equal
        FROM
            view_web_page_phishing
    ) AS stats
    UNION ALL
    SELECT
        'n_at' AS column_name,
        (SUM((phishing - avg_phishing) * (n_at - avg_n_at)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(n_at - avg_n_at, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(n_at) AS avg_n_at
        FROM
            view_web_page_phishing
    ) AS stats
    UNION ALL
    SELECT
        'n_and' AS column_name,
        (SUM((phishing - avg_phishing) * (n_and - avg_n_and)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(n_and - avg_n_and, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(n_and) AS avg_n_and
        FROM
            view_web_page_phishing
    ) AS stats
    UNION ALL
    SELECT
        'n_exclamation' AS column_name,
        (SUM((phishing - avg_phishing) * (n_exclamation - avg_n_exclamation)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(n_exclamation - avg_n_exclamation, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(n_exclamation) AS avg_n_exclamation
        FROM
            view_web_page_phishing
    ) AS stats
    UNION ALL
    SELECT
        'n_space' AS column_name,
        (SUM((phishing - avg_phishing) * (n_space - avg_n_space)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(n_space - avg_n_space, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(n_space) AS avg_n_space
        FROM
            view_web_page_phishing
    ) AS stats
    UNION ALL
    SELECT
        'n_tilde' AS column_name,
        (SUM((phishing - avg_phishing) * (n_tilde - avg_n_tilde)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(n_tilde - avg_n_tilde, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(n_tilde) AS avg_n_tilde
        FROM
            view_web_page_phishing
    ) AS stats
    UNION ALL
    SELECT
        'n_comma' AS column_name,
        (SUM((phishing - avg_phishing) * (n_comma - avg_n_comma)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(n_comma - avg_n_comma, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(n_comma) AS avg_n_comma
        FROM
            view_web_page_phishing
    ) AS stats
    UNION ALL
    SELECT
        'n_plus' AS column_name,
        (SUM((phishing - avg_phishing) * (n_plus - avg_n_plus)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(n_plus - avg_n_plus, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(n_plus) AS avg_n_plus
        FROM
            view_web_page_phishing
    ) AS stats
    UNION ALL
    SELECT
        'n_asterisk' AS column_name,
        (SUM((phishing - avg_phishing) * (n_asterisk - avg_n_asterisk)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(n_asterisk - avg_n_asterisk, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(n_asterisk) AS avg_n_asterisk
        FROM
            view_web_page_phishing
    ) AS stats
    UNION ALL
    SELECT
        'n_percent' AS column_name,
        (SUM((phishing - avg_phishing) * (n_percent - avg_n_percent)) / 
            (SQRT(SUM(POWER(phishing - avg_phishing, 2))) * SQRT(SUM(POWER(n_percent - avg_n_percent, 2))))) AS correlation
    FROM
        view_web_page_phishing
    CROSS JOIN (
        SELECT
            AVG(phishing) AS avg_phishing,
            AVG(n_percent) AS avg_n_percent
        FROM
            view_web_page_phishing
    ) AS stats
)

SELECT *
FROM correlations;