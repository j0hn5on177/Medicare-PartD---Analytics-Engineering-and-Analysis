WITH fact_data AS (
    SELECT
        TO_HEX(SHA256(CONCAT(
            COALESCE(CAST(Prscrbr_NPI AS STRING), ''), '|', 
            COALESCE(prscrbr_last_org_name, ''), '|',
            COALESCE(prscrbr_first_name, '')
        ))) AS desc_id,
        TO_HEX(SHA256(CONCAT(
            COALESCE(brnd_name, ''), '|', 
            COALESCE(gnrc_name, '')
        ))) AS drug_id,
        TO_HEX(SHA256(CAST(year AS STRING))) AS year_id,
        prscrbr_type,
        prscrbr_type_src,
        tot_clms AS total_claims,
        tot_benes AS total_beneficiaries,
        tot_drug_cst AS total_cost,
        tot_30day_fills,
        tot_day_suply AS total_day_supply
    FROM {{ ref('stg_prescriber_drugcost') }}
)

SELECT DISTINCT
    TO_HEX(SHA256(CONCAT(
        COALESCE(desc_id, ''), '|',
        COALESCE(drug_id, ''), '|',
        COALESCE(year_id, '')
    ))) AS fact_prescription_id,
    desc_id,
    drug_id,
    year_id,
    prscrbr_type,
    prscrbr_type_src,
    total_claims,
    total_beneficiaries,
    total_cost,
    tot_30day_fills,
    total_day_supply
FROM fact_data
