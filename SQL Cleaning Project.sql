Select * from layoffs;

--  Remove Duplicates
-- Standardize the Data
-- Null Value or blank value 
-- Remove any columns

Create table layoffs_practical 
like layoffs;

Insert layoffs_practical 
SELECT * from layoffs; 

SELECT * from  layoffs_practical;
WITH CTE as
(
SELECT*,
ROW_number() over (partition by company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions)
as row_num
from layoffs_practical
)
select*
from CTE
where row_num > 1;

SELECT * from layoffs_practical 
where company = 'better.com' ;


CREATE TABLE `layoffs_practical2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
`row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT into layoffs_practical2
SELECT*,
ROW_number() over (partition by company, location, industry, total_laid_off, percentage_laid_off, date , stage, country, funds_raised_millions)
as row_num
from layoffs_practical;

select *from layoffs_practical2
where company = 'Casper';
