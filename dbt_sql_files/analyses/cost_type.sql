SELECT
    y.year,
    f.prscrbr_type AS prescriber_type,
    SUM(f.total_cost) AS total_cost
FROM {{ ref('fact_prescription') }} f
JOIN {{ ref('dim_year') }} y ON f.year_id = y.year_id
GROUP BY y.year, f.prscrbr_type
ORDER BY y.year, total_cost DESC
