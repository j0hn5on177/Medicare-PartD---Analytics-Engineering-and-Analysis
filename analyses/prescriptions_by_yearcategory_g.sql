SELECT 
    y.year,
    fp.prscrbr_type,
    SUM(fp.total_claims) AS total_prescriptions
FROM {{ref('fact_prescription')}} fp
JOIN {{ ref('dim_year')}} y USING (year_id)
GROUP BY y.year, fp.prscrbr_type
ORDER BY y.year, total_prescriptions DESC

-- SELECT 
--     y.year,
--     SUM(fp.total_claims) AS total_prescriptions
-- FROM {{ref('fact_prescription')}} fp
-- JOIN {{ ref('dim_year')}} y USING (year_id)
-- GROUP BY y.year
-- ORDER BY y.year DESC