# 📊 Exploratory Data Analysis: Layoffs Dataset

## 🔍 Overview
This project performs an exploratory analysis on a dataset of tech industry layoffs using SQL. The goal is to uncover trends by company, geography, stage of funding, and time. It provides a foundation for visualizing and understanding workforce changes across the industry.

---

## 📁 Dataset: `layoffs_staging2`
- Contains records of layoffs across various tech companies.
- Key columns: `company`, `date`, `total_laid_off`, `percentage_laid_off`, `stage`, `country`, `funds_raised_millions`.

---

## 🧪 Key Analyses Performed

### 1. **Initial Data Review**
```sql
SELECT * FROM layoffs_staging2;
```
Provides a raw look at the staging table and ensures the data is loaded as expected.

---

### 2. **Scale of Layoffs**
```sql
SELECT MAX(total_laid_off), MAX(percentage_laid_off) FROM layoffs_staging2;
```
Identifies extreme values and potential outliers.

---

### 3. **100% Layoffs (Shut Downs)**
```sql
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;
```
Highlights companies that laid off all employees, sorted by how much funding they had raised.

---

### 4. **Top Companies by Layoffs**
```sql
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;
```
Shows the companies with the highest cumulative layoffs.

---

### 5. **Date Range**
```sql
SELECT MIN(`date`), MAX(`date`) FROM layoffs_staging2;
```
Verifies the timeline of the dataset.

---

### 6. **Layoffs by Country**
```sql
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;
```
Identifies which countries were hit hardest.

---

### 7. **Annual Layoffs**
```sql
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;
```
Detects the trend of layoffs over the years.

---

### 8. **Layoffs by Funding Stage**
```sql
SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;
```
Determines how layoffs vary by startup maturity.

---

### 9. **Most Impacted Companies by Percentage**
```sql
SELECT company, SUM(percentage_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;
```
Ranks companies by cumulative layoff percentage.

---

### 10. **Monthly Trend of Layoffs**
```sql
SELECT substring(`date`, 1,7) AS MONTH, SUM(total_laid_off)
FROM layoffs_staging2
WHERE substring(`date`, 1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;
```
Gives a month-over-month breakdown of layoffs.

---

### 11. **Rolling Layoff Total Over Time**
```sql
WITH Rolling_Total AS (
  SELECT substring(`date`, 1,7) AS MONTH, SUM(total_laid_off) AS total_off
  FROM layoffs_staging2
  WHERE substring(`date`, 1,7) IS NOT NULL
  GROUP BY `MONTH`
)
SELECT `MONTH`, total_off, SUM(total_off) OVER (ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total;
```
Tracks cumulative layoffs over time.

---

### 12. **Top Companies by Layoffs per Year**
```sql
WITH Company_Year AS (
  SELECT company, YEAR(`date`) AS years, SUM(total_laid_off) AS total_laid_off
  FROM layoffs_staging2
  GROUP BY company, YEAR(`date`)
),
Company_Year_Rank AS (
  SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
  FROM Company_Year
  WHERE years IS NOT NULL
)
SELECT * FROM Company_Year_Rank WHERE Ranking <= 5;
```
Shows the top 5 companies with the most layoffs per year using window functions.

---

## ✅ Skills Demonstrated
- Data wrangling and filtering with SQL
- Aggregation, grouping, and ranking
- Use of window functions for rolling totals and ranking
- Date formatting and temporal analysis
- Clear, reproducible queries for EDA

---

## 📌 Next Steps
- Visualize trends in Tableau or Power BI
- Identify correlation between funding raised and layoffs
- Investigate recovery trends post-layoff

---

## 🤝 Contact
If you'd like to explore this dataset or collaborate on deeper analysis, feel free to connect!
