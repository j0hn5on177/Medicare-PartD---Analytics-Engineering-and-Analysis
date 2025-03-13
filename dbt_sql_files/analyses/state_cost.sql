WITH prescriber_data AS (
    SELECT
        p.state AS state,
        y.year AS year,
        SUM(f.total_cost) AS total_cost
    FROM {{ ref('fact_prescription') }} f
    JOIN {{ ref('dim_prescription_description') }} p ON f.desc_id = p.desc_id
    JOIN {{ ref('dim_year') }} y ON f.year_id = y.year_id
    GROUP BY p.state, y.year
)

SELECT
    state,
    year,
    total_cost
FROM prescriber_data
ORDER BY total_cost DESC, year
