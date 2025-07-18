USE pandemic;

DELIMITER //

DROP FUNCTION IF EXISTS Calculated_date;

CREATE FUNCTION Calculated_date(
    stat_year INT
)
RETURNS FLOAT
DETERMINISTIC
NO SQL
BEGIN
    IF stat_year = 0 THEN
        RETURN NULL;
    END IF;
    RETURN TIMESTAMPDIFF(YEAR, MAKEDATE(stat_year, 1), NOW());
END //

DELIMITER ;

-- Тестовий виклик
SELECT
    year,
    Calculated_date(year) AS year_diff
FROM
    infectious_cases_3nf

