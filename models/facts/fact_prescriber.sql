WITH prescriber_cte AS (
    SELECT
        Prscrbr_NPI,
        Prscrbr_Last_Org_Name,
        Prscrbr_First_Name,
        brnd_name,
        year,
        tot_clms,
        tot_benes,
        tot_drug_cst,
        tot_30day_fills,
        tot_day_suply,
        TO_HEX(SHA256(CONCAT(
            COALESCE(CAST(Prscrbr_NPI AS STRING), ''), '|',
            COALESCE(CAST(Prscrbr_Last_Org_Name AS STRING), ''), '|',
            COALESCE(CAST(Prscrbr_First_Name AS STRING), '')
        ))) AS desc_id,
        TO_HEX(SHA256(COALESCE(CAST(brnd_name AS STRING), ''))) AS drug_id,
        TO_HEX(SHA256(COALESCE(CAST(year AS STRING), ''))) AS year_id
    FROM {{ ref('stg_prescribers') }} AS s
)

SELECT
    TO_HEX(SHA256(CONCAT(
        COALESCE(CAST(p.drug_id AS STRING), ''), '|',
        COALESCE(CAST(p.desc_id AS STRING), ''), '|',
        COALESCE(CAST(p.year_id AS STRING), '')
    ))) AS prescriber_fact_id,
    p.desc_id,
    p.drug_id,
    p.year_id,
    p.tot_clms AS total_claims,
    p.tot_benes AS total_beneficiaries,
    p.tot_drug_cst AS total_drug_cost,
    p.tot_30day_fills,
    p.tot_day_suply AS total_day_supply
FROM prescriber_cte AS p
JOIN {{ ref('dim_prescriber_description') }} AS de ON p.desc_id = de.desc_id
JOIN {{ ref('dim_drug') }} AS d ON p.drug_id = d.drug_id
JOIN {{ ref('dim_year') }} AS y ON p.year_id = y.year_id
