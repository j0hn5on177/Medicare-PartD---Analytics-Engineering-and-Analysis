SELECT  
    y.year,
    d.brnd_name,
    SUM(f.total_cost) AS total_cost
FROM {{ref('fact_prescription')}} f
JOIN {{ref('dim_drug')}} d 
    ON f.drug_id = d.drug_id
JOIN {{ref('dim_year')}} y 
    ON f.year_id = y.year_id
GROUP BY y.year, d.brnd_name
ORDER BY y.year, total_cost DESC
