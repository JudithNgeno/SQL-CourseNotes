-- Exloratory Data Analysis

SELECT*
FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

SELECT*
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT Company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY Company
ORDER BY 2 DESC;

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

SELECT Industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY Industry
ORDER BY 2 DESC;

SELECT Country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY Country
ORDER BY 2 DESC;

SELECT YEAR(`Date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`Date`)
ORDER BY 1 DESC;

SELECT Stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY Stage
ORDER BY 2 DESC;

SELECT Company, SUM(percentage_laid_off)
FROM layoffs_staging2
GROUP BY Company
ORDER BY 2 DESC;


SELECT SUBSTRING(`Date`,1,7) AS `Month`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`Date`,1,7) IS NOT NULL
GROUP BY `Month`
ORDER BY 1 ASC
;

WITH Rolling_Total AS
(SELECT SUBSTRING(`Date`,1,7) AS `Month`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`Date`,1,7) IS NOT NULL
GROUP BY `Month`
ORDER BY 1 ASC
)
SELECT `Month`, total_off
,SUM(total_off) OVER (ORDER BY `Month`) AS rolling_total
FROM Rolling_Total;

SELECT Company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY Company
ORDER BY 2 DESC;

SELECT Company, YEAR(`Date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY Company, YEAR(`Date`)
ORDER BY 3 DESC;

WITH Company_Year (company, years, total_laid_off) AS
(
SELECT Company, YEAR(`Date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY Company, YEAR(`Date`)
), Company_Year_Rank AS
(SELECT*, 
DENSE_RANK () OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT*
FROM Company_Year_Rank
WHERE Ranking <= 5;


















































