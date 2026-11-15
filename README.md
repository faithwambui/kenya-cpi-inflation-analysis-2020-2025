# # Kenya Consumer Price Index (CPI) Analysis, 2020–2025

## Project Overview

This project analyses Kenya's Consumer Price Index (CPI) across 14 expenditure divisions from January 2020 to December 2025, using data from the Kenya National Bureau of Statistics (KNBS).

The objective is to examine changes in consumer prices, identify divisions experiencing higher price increases, and understand inflation trends over time.

## Tools and Technologies

- Python — data cleaning, exploration and analysis
- Pandas and NumPy — data manipulation
- Matplotlib — data visualization
- MySQL — data storage and SQL analysis
- Power BI — interactive dashboard development

## Project Objectives

- Examine CPI trends across expenditure divisions.
- Calculate year-on-year (YoY) inflation.
- Compare annual average inflation rates.
- Identify divisions with the highest and lowest inflation.
- Present findings through an interactive Power BI dashboard.

## Key Findings

- Food and Non-Alcoholic Beverages recorded the highest average CPI at 147.93.
- Transport recorded the second-highest average CPI at 141.23.
- Overall annual average inflation peaked at 7.70% in 2023.
- Average annual inflation declined to 4.07% in 2025.
- Transport recorded the highest monthly YoY inflation of 18.12% in March 2021.
- Housing, Water, Electricity, Gas and Other Fuels recorded the lowest monthly YoY inflation of -1.60% in January 2025.

## Methodology

1. Imported and inspected the KNBS CPI dataset.
2. Cleaned and filtered observations to 2020–2025 using Python.
3. Explored CPI distributions and trends across divisions.
4. Calculated monthly YoY inflation rates.
5. Used MySQL for data storage and analytical queries.
6. Built an interactive Power BI dashboard.

## Data Source

Kenya National Bureau of Statistics (KNBS).

Dataset: Consumer Price Index by Division; Base February 2019 = 100.

## Scope and Limitations

The Python analysis uses 2019 observations as the comparison baseline to calculate YoY inflation during 2020. The SQL table contains only 2020–2025 observations, so its self-join calculations cover 2021–2025.

The annual average inflation figures represent averages of monthly YoY rates, not December-to-December inflation.
## Dashboard Preview

![Kenya CPI Dashboard](Final Visualization.png, Final Visualization2.png)

## Project Status

Completed: Python analysis, SQL analysis and Power BI dashboard.
