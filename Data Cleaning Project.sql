-- Data Cleaning --



SELECT*
FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the data
-- 3. Null values or blank values
-- 4. Remove any columns



CREATE TABLE layoffs_staging
LIKE layoffs;


SELECT*
FROM layoffs_staging;

INSERT layoffs_staging
SELECT *
FROM layoffs;


SELECT*,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS
(
SELECT*,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_staging
)

SELECT*
FROM duplicate_cte
WHERE  row_num > 1;





