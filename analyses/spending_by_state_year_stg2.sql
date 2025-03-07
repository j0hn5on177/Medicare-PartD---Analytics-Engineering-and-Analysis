SELECT
    prscrbr_state_abrvtn,
    SUM(tot_drug_cst) AS tot_cost,
    year
FROM {{ ref('stg_prescription')}}  
GROUP BY prscrbr_state_abrvtn, year
ORDER BY tot_cost DESC

