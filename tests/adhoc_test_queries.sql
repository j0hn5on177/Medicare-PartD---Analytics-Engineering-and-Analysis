SELECT
    *,
    COUNT(*) AS duplicate_count

FROM {{ ref('fact_drug_spending') }}
GROUP BY 
    fact_spending_id,
    drug_id,
    year_id,
    avg_spnd_per_bene,
    avg_spnd_per_clm,
    avg_spnd_per_dsg_unt_wghtd,
    tot_clms,
    tot_dsg_unts,
    tot_spndng
HAVING COUNT(*) > 1
ORDER BY fact_spending_id

