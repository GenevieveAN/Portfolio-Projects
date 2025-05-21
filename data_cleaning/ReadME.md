# Data Cleaning Project

## Overview
This project focuses on cleaning and preparing a dataset on layoffs for subsequent analysis. The raw data contained duplicates, inconsistent formatting, null values, and extraneous columns that could distort results.

---

## Objectives
- **Remove duplicate records** to ensure data integrity.
- **Standardize textual fields** (e.g., company names, industries, countries) for consistency.
- **Handle null and blank values** by either updating or removing incomplete records.
- **Drop unnecessary columns** after cleaning steps to streamline the dataset.

---

## Key Steps & SQL Techniques

1. **Identifying duplicates** using `ROW_NUMBER()` with partitioning over relevant fields.
2. **Creating a staging table (`layoffs_staging2`)** to hold cleaned data.
3. **Trimming whitespace** and normalizing categorical values (`industry`, `country`).
4. **Parsing dates** into proper `DATE` format for accurate time-based queries.
5. **Updating null or empty values** in critical columns.
6. **Deleting records with missing key data** (e.g., total layoffs and percentage laid off).
7. **Dropping auxiliary columns** used only for cleaning (`row_num`).

---

## How to Use

- Run the SQL scripts sequentially to perform cleaning.
- Validate data quality by checking for duplicates or nulls post-cleaning.
- Use the cleaned `layoffs_staging2` table for analysis or modeling.

---

## Notes

- The dataset’s date format was inconsistent; conversion to MySQL `DATE` type was necessary.
- Standardization ensures that grouping and aggregations operate correctly.
- Cleaning steps prioritize preserving as much valid data as possible while removing problematic records.

---

## Next Steps

- Further enrich data with external sources if available.
- Automate cleaning via stored procedures or scripts for new incoming data.
- Explore data with EDA queries in the `/EDA` project folder.

