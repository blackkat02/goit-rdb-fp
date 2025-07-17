Use pandemic;

SELECT 
	entity_id,
	AVG(Number_rabies) AS avg_rabies,
	MIN(Number_rabies) AS min_rabies,
    MAX(Number_rabies) AS max_rabies,
    SUM(Number_rabies) AS total_rabies
FROM infectious_cases_3nf
WHERE Number_rabies IS NOT NULL
GROUP BY entity_id
ORDER BY avg_rabies DESC
LIMIT 10;

