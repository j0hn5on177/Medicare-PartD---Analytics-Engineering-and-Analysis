WITH ranked_data AS (
    SELECT 
        y.year,
        d.brnd_name,
        SUM(f.total_cost) AS total_cost,
        ROW_NUMBER() OVER (PARTITION BY y.year ORDER BY SUM(f.total_cost) DESC) AS rank
    FROM {{ ref('fact_prescription') }} f
    JOIN {{ ref('dim_drug') }} d ON f.drug_id = d.drug_id
    JOIN {{ ref('dim_year') }} y ON f.year_id = y.year_id
    GROUP BY y.year, d.brnd_name
)
SELECT year, brnd_name, total_cost
FROM ranked_data
WHERE rank <= 10
ORDER BY year, total_cost DESC