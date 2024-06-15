CREATE VIEW view_web_page_phishing AS
	SELECT 
		ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS unique_id,
		CAST(phishing AS INT) AS phishing,
		url_length,
		n_redirection,
		n_dots,
		n_hypens AS n_hyphens,
		n_underline,
		n_slash,
		n_questionmark,
		n_equal,
		n_at,
		n_and,
		n_exclamation,
		n_space,
		n_tilde,
		n_comma,
		n_plus,
		n_asterisk,
		n_hastag AS n_hashtag,
		n_dollar,
		n_percent
	FROM 
		web_page_phishing;