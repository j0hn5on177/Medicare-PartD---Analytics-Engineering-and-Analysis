SELECT 
    dy.year,
    d.brnd_name, 
    SUM(fp.total_cost) AS total_cost
FROM {{ ref('fact_prescription') }} fp
JOIN {{ ref('dim_drug') }} d ON fp.drug_id = d.drug_id
JOIN {{ ref('dim_year') }} dy ON fp.year_id = dy.year_id
GROUP BY dy.year, d.brnd_name
ORDER BY total_cost DESC
