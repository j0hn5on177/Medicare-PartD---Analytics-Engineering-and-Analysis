SELECT 
    dy.year,
    dps.first_name,
    dps.last_name,
    dps.Prscrbr_NPI,
    SUM(fp.total_beneficiaries) AS total_beneficiaries,
FROM `medicare-partd-project1.medicare_warehouse_target.fact_prescribers` fp
JOIN `medicare-partd-project1.medicare_warehouse_target.dim_prescriber_description` dps 
    ON fp.desc_id = dps.desc_id
JOIN `medicare-partd-project1.medicare_warehouse_target.dim_year` dy 
    ON fp.year_id = dy.year_id
WHERE dy.year BETWEEN 2018 AND 2022  
GROUP BY dps.Prscrbr_NPI,dy.year, dps.first_name, dps.last_name
ORDER BY dy.year, total_beneficiaries
