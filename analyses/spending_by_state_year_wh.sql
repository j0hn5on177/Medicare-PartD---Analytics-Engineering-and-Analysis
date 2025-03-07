SELECT
    pd.city,
    pd.state,
    SUM(fp.total_cost) AS tot_cost,
    y.year
FROM {{ ref('dim_prescription_description')}} pd
JOIN {{ ref('fact_prescription')}} fp USING (desc_id)
JOIN {{ ref('dim_year')}} y USING (year_id)    
GROUP BY pd.city, pd.state, y.year
ORDER BY tot_cost DESC

