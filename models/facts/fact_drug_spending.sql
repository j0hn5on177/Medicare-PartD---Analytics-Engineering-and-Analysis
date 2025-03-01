WITH fact_drugdata AS (
    SELECT
        TO_HEX(SHA256(CONCAT(
            COALESCE(brnd_name, ''), '|', 
            COALESCE(gnrc_name, '')
        ))) AS drug_id,
        TO_HEX(SHA256(CAST(year AS STRING))) AS year_id,
        avg_spnd_per_bene,
        avg_spnd_per_clm,
        avg_spnd_per_dsg_unt_wghtd,
        tot_clms,
        tot_dsg_unts,
        tot_spndng
    FROM {{ ref('stg_prescriptiondrugs') }}
)
SELECT
    TO_HEX(SHA256(CONCAT(
    COALESCE(drug_id, ''), '|',
    COALESCE(year_id, ''), '|',
    COALESCE(CAST(avg_spnd_per_bene AS STRING), '')
))) AS fact_spending_id,
    avg_spnd_per_bene,
    avg_spnd_per_clm,
    avg_spnd_per_dsg_unt_wghtd,
    tot_clms,
    tot_dsg_unts,
    tot_spndng
FROM fact_drugdata