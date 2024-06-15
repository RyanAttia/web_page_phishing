# Report Web Page Phishing

# Table of contents 

- [Correlation Analysis of Columns with Phishing Indicator](#correlation-analysis-of-columns-with-phishing-indicator)
  - [Objective](#objective)
  - [Data Description](#data-description)
  - [Methodology](#methodology)
    - [Calculation of Correlation Coefficients](#calculation-of-correlation-coefficients)
    - [SQL Implementaion](#SQL-implementaion)
  - [Conclusion](#conclusion)
- [Correlation Analysis of Columns with Phishing Indicator](#correlation-analysis-of-columns-with-phishing-indicator)
  - [Objective](#objective)- [Stages](#stages)
- [Correlation Analysis of Columns with Phishing Indicator](#correlation-analysis-of-columns-with-phishing-indicator)
  - [Objective](#objective)

## Correlation Analysis of Columns with Phishing Indicator

### Objective:
The goal of this analysis is to calculate the correlation coefficients between several numeric columns in a database view (view_web_page_phishing) and a binary indicator (phishing). These correlations will help determine the strength and direction of linear relationships between each column and the likelihood of a web page being classified as phishing.

### Data Description:
Edited the original data from Kaggle to include a new field called unique_id which assigns each row a unique number. I also changed the datatypes of all the fields to INTEGERS loading it into a VIEW named view_web_page_phishing. 

### Methodology:

#### Calculation of Correlation Coefficients:
I would need to use the following formula for the code where X would be the field phishing and Y would be the respective field I am finding.
\[ Correlation = \frac{\sum (X - \bar{X}) \cdot (Y - \bar{Y})}{\sqrt{\sum (X - \bar{X})^2 \cdot \sum (Y - \bar{Y})^2}} \]

#### SQL implementaion:
```sql
WITH correlations AS (
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
-- Repeat the above pattern for each column...
)
SELECT * FROM correlations;
```

### Conclusion:
The SQL code provides a systematic approach to calculating correlation coefficients between each numeric column and the phishing indicator in the view_web_page_phishing view. As a result with a correlation of 0.531 n_slash appears to be the field with the strongest correlation to phishing while with a correlation of 0.0195 n_plus is the field with the weakest correlation to phishing. 
![Results images](assets/images/results_1.png)
