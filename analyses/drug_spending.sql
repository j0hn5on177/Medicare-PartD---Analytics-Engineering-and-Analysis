--medicare part d spending by drugs on a yearly basis

SELECT 
    dy.year,
    dd.brnd_name,
    avg(fds.tot_spndng) AS drug_spending,
    avg(fds.tot_clms) AS claims
FROM `medicare-partd-project1.medicare_warehouse_target.fact_drug_spending` fds
JOIN `medicare-partd-project1.medicare_warehouse_target.dim_drug` dd 
    ON fds.drug_id = dd.drug_id
JOIN `medicare-partd-project1.medicare_warehouse_target.dim_year` dy 
    ON fds.year_id = dy.year_id
GROUP BY dy.year, dd.brnd_name
ORDER BY dy.year, drug_spending DESC
