-- Standardising data
select trim(company)as Trim
from layoffs_practical3;

update layoffs_practical3
set company = 'Trim';
