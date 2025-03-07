SELECT 
    y.year,
    d.brnd_name, 
    CAST(ROUND(SUM(f.tot_spndng), 2) AS STRING) AS total_spending  -- No exponents, keeps 2 decimals
FROM {{ ref('fact_drug_spending') }} f
JOIN {{ ref('dim_drug') }} d USING (drug_id)
JOIN {{ ref('fact_prescription') }} p USING (drug_id)
JOIN {{ ref('dim_year') }} y ON (p.year_id = y.year_id)

GROUP BY y.year, d.brnd_name
ORDER BY y.year, total_spending DESC
