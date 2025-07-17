CREATE SCHEMA IF NOT EXISTS pandemic ;
Use pandemic;

CREATE TABLE infectious_cases_3nf (
    id INT PRIMARY KEY AUTO_INCREMENT,
    entity_id INT NOT NULL,
    year INT NOT NULL,
    number_yaws DOUBLE,
    polio_cases DOUBLE,
    cases_guinea_worm DOUBLE,
    number_rabies DOUBLE,
    number_malaria DOUBLE,
    number_hiv DOUBLE,
    number_tuberculosis DOUBLE,
    number_smallpox DOUBLE,
    number_cholera DOUBLE,
    UNIQUE(entity_id, year),
    FOREIGN KEY (entity_id) REFERENCES entities(entity_id)
);

INSERT INTO infectious_cases_3nf (
    entity_id,
    year,
    number_yaws,
    polio_cases,
    cases_guinea_worm,
    number_rabies,
    number_malaria,
    number_hiv,
    number_tuberculosis,
    number_smallpox,
    number_cholera
)
SELECT
    e.entity_id,
    CAST(NULLIF(ic.Year, '') AS UNSIGNED),
    CAST(NULLIF(ic.Number_yaws, '') AS DOUBLE),
    CAST(NULLIF(ic.polio_cases, '') AS DOUBLE),
    CAST(NULLIF(ic.cases_guinea_worm, '') AS DOUBLE),
    CAST(NULLIF(ic.Number_rabies, '') AS DOUBLE),
    CAST(NULLIF(ic.Number_malaria, '') AS DOUBLE),
    CAST(NULLIF(ic.Number_hiv, '') AS DOUBLE),
    CAST(NULLIF(ic.Number_tuberculosis, '') AS DOUBLE),
    CAST(NULLIF(ic.Number_smallpox, '') AS DOUBLE),
    CAST(NULLIF(ic.Number_cholera_cases, '') AS DOUBLE)
FROM infectious_cases ic
JOIN entities e
  ON ic.Entity = e.entity_name AND ic.Code <=> e.iso_code;


SELECT * FROM infectious_cases_3nf;

