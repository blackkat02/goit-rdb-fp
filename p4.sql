Use pandemic;

SELECT DISTINCT 
	MAKEDATE(year, 1) AS stat_year, 
    CURDATE() AS today_date, 
    TIMESTAMPDIFF(YEAR, MAKEDATE(year, 1), NOW()) AS year_diff
FROM infectious_cases_3nf;
