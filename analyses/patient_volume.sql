SELECT 
    dy.year,
    dps.npi,
    dps.first_name,
    dps.last_name,
    AVG(fp.total_beneficiaries) AS avg_beneficiaries
FROM `medicare-partd-project1.medicare_warehouse_target.fact_prescription_id` fp
JOIN `medicare-partd-project1.medicare_warehouse_target.dim_prescriber_description` dps 
    ON fp.desc_id = dps.desc_id
JOIN `medicare-partd-project1.medicare_warehouse_target.dim_year` dy 
    ON fp.year_id = dy.year_id
WHERE dy.year BETWEEN 2018 AND 2022  
GROUP BY dy.year, dps.npi, dps.first_name, dps.last_name
ORDER BY avg_beneficiaries DESC