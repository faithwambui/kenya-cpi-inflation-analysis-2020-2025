USE kenya_cpi_analysis;
SELECT
    current_data.Division,
    current_data.`Date`,
    current_data.CPI AS Current_CPI,
    previous_data.CPI AS Previous_Year_CPI,
    ROUND(
        ((current_data.CPI - previous_data.CPI)
        / previous_data.CPI) * 100, 2
    ) AS YoY_Inflation
FROM cpi_data AS current_data
JOIN cpi_data AS previous_data
    ON current_data.Division = previous_data.Division
    AND previous_data.`Date` = DATE_SUB(
        current_data.`Date`,
        INTERVAL 1 YEAR
    )
WHERE current_data.Division = 'ALL ITEMS'
ORDER BY current_data.`Date`;
SELECT
    YEAR(`Date`) AS Year,
    ROUND(AVG(YoY_Inflation), 2) AS Average_Inflation
FROM (
    SELECT
        current_data.`Date`,
        ROUND(
            ((current_data.CPI - previous_data.CPI)
            / previous_data.CPI) * 100, 2
        ) AS YoY_Inflation
    FROM cpi_data AS current_data
    JOIN cpi_data AS previous_data
        ON current_data.Division = previous_data.Division
        AND previous_data.`Date` = DATE_SUB(
            current_data.`Date`,
            INTERVAL 1 YEAR
        )
    WHERE current_data.Division = 'ALL ITEMS'
) AS inflation_results
GROUP BY YEAR(`Date`)
ORDER BY Year;
SELECT
    YEAR(current_data.`Date`) AS Year,
    current_data.Division,
    ROUND(AVG(
        ((current_data.CPI - previous_data.CPI)
        / previous_data.CPI) * 100
    ), 2) AS Average_Inflation
FROM cpi_data AS current_data
JOIN cpi_data AS previous_data
    ON current_data.Division = previous_data.Division
    AND previous_data.`Date` = DATE_SUB(
        current_data.`Date`,
        INTERVAL 1 YEAR
    )
WHERE current_data.Division <> 'ALL ITEMS'
GROUP BY YEAR(current_data.`Date`), current_data.Division
ORDER BY Year, Average_Inflation DESC;
SELECT
    Division,
    ROUND(AVG(YoY_Inflation), 2) AS Average_Inflation
FROM (
    SELECT
        current_data.Division,
        current_data.`Date`,
        ((current_data.CPI - previous_data.CPI)
        / previous_data.CPI) * 100 AS YoY_Inflation
    FROM cpi_data AS current_data
    JOIN cpi_data AS previous_data
        ON current_data.Division = previous_data.Division
        AND previous_data.`Date` = DATE_SUB(
            current_data.`Date`,
            INTERVAL 1 YEAR
        )
) AS inflation_results
WHERE Division <> 'ALL ITEMS'
GROUP BY Division
ORDER BY Average_Inflation DESC;
SELECT
    Division,
    `Date`,
    ROUND(
        ((CPI - Previous_CPI) / Previous_CPI) * 100, 2
    ) AS YoY_Inflation
FROM (
    SELECT
        current_data.Division,
        current_data.`Date`,
        current_data.CPI,
        previous_data.CPI AS Previous_CPI
    FROM cpi_data AS current_data
    JOIN cpi_data AS previous_data
        ON current_data.Division = previous_data.Division
        AND previous_data.`Date` = DATE_SUB(
            current_data.`Date`,
            INTERVAL 1 YEAR
        )
) AS monthly_inflation
ORDER BY YoY_Inflation ASC
LIMIT 1;
SELECT
    Division,
    `Date`,
    ROUND(
        ((CPI - Previous_CPI) / Previous_CPI) * 100, 2
    ) AS YoY_Inflation
FROM (
    SELECT
        current_data.Division,
        current_data.`Date`,
        current_data.CPI,
        previous_data.CPI AS Previous_CPI
    FROM cpi_data AS current_data
    JOIN cpi_data AS previous_data
        ON current_data.Division = previous_data.Division
        AND previous_data.`Date` = DATE_SUB(
            current_data.`Date`,
            INTERVAL 1 YEAR
        )
) AS monthly_inflation
ORDER BY YoY_Inflation DESC
LIMIT 1;
