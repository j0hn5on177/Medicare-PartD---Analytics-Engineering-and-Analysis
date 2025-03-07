-- WITH fact_drugdata AS (
--     SELECT
--         TO_HEX(SHA256(CONCAT(
--             COALESCE(brnd_name, ''), '|', 
--             COALESCE(gnrc_name, '')
--         ))) AS drug_id,
--         TO_HEX(SHA256(CAST(year AS STRING))) AS year_id,
--         avg_spnd_per_bene,
--         avg_spnd_per_clm,
--         avg_spnd_per_dsg_unt_wghtd,
--         tot_clms,
--         tot_dsg_unts,
--         tot_spndng
--     FROM {{ ref('stg_prescriptiondrugs') }}
-- )
-- SELECT
--     TO_HEX(SHA256(CONCAT(
--     COALESCE(drug_id, ''), '|',
--     COALESCE(year_id, ''), '|',
--     COALESCE(CAST(avg_spnd_per_bene AS STRING), '')
-- ))) AS fact_spending_id,
--     drug_id,
--     year_id,
--     avg_spnd_per_bene,
--     avg_spnd_per_clm,
--     avg_spnd_per_dsg_unt_wghtd,
--     tot_clms,
--     tot_dsg_unts,
--     tot_spndng
-- FROM fact_drugdata

-- WITH fact_drugdata AS (
--     SELECT
--         TO_HEX(SHA256(CONCAT(
--             COALESCE(brnd_name, ''), '|', 
--             COALESCE(gnrc_name, '')
--         ))) AS drug_id,
--         CAST(year AS STRING) AS year_id, -- No need to hash year
--         avg_spnd_per_bene,
--         avg_spnd_per_clm,
--         avg_spnd_per_dsg_unt_wghtd,
--         tot_clms,
--         tot_dsg_unts,
--         tot_spndng
--     FROM {{ ref('stg_prescriptiondrugs') }}
-- ),

-- ranked_facts AS (
--     SELECT 
--         *,
--         ROW_NUMBER() OVER (
--             PARTITION BY drug_id, year_id 
--             ORDER BY 
--                 drug_id, 
--                 year_id, 
--                 avg_spnd_per_bene DESC, -- Ordering by avg_spnd_per_bene (descending) for consistency
--                 CAST(tot_spndng AS STRING) DESC -- Adding a second ordering by another stable column (tot_spndng)
--         ) AS row_num
--     FROM fact_drugdata
-- )

-- SELECT
--     TO_HEX(SHA256(CONCAT(
--         COALESCE(drug_id, ''), '|',
--         COALESCE(year_id, ''), '|',
--         COALESCE(CAST(avg_spnd_per_bene AS STRING), ''), '|',
--         COALESCE(CAST(row_num AS STRING), '') -- Ensures uniqueness
--     ))) AS fact_spending_id,
--     drug_id,
--     year_id,
--     avg_spnd_per_bene,
--     avg_spnd_per_clm,
--     avg_spnd_per_dsg_unt_wghtd,
--     tot_clms,
--     tot_dsg_unts,
--     tot_spndng
-- FROM ranked_facts

WITH fact_drugdata AS (
    SELECT
        TO_HEX(SHA256(CONCAT(
            COALESCE(brnd_name, ''), '|', 
            COALESCE(gnrc_name, '')
        ))) AS drug_id,
        CAST(year AS STRING) AS year_id, -- No need to hash year
        avg_spnd_per_bene,
        avg_spnd_per_clm,
        avg_spnd_per_dsg_unt_wghtd,
        tot_clms,
        tot_dsg_unts,
        tot_spndng
    FROM {{ ref('stg_prescriptiondrugs') }}
),

ranked_facts AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY drug_id, year_id 
            ORDER BY 
                drug_id, 
                year_id, 
                avg_spnd_per_bene DESC, -- Ordering by avg_spnd_per_bene (descending) for consistency
                CAST(tot_spndng AS STRING) DESC -- Adding a second ordering by another stable column (tot_spndng)
        ) AS row_num
    FROM fact_drugdata
)

SELECT DISTINCT  -- Ensures only unique rows are selected
    TO_HEX(SHA256(CONCAT(
        COALESCE(drug_id, ''), '|',
        COALESCE(year_id, ''), '|',
        COALESCE(CAST(avg_spnd_per_bene AS STRING), ''), '|',
        COALESCE(CAST(row_num AS STRING), '') -- Ensures uniqueness
    ))) AS fact_spending_id,
    drug_id,
    year_id,
    avg_spnd_per_bene,
    avg_spnd_per_clm,
    avg_spnd_per_dsg_unt_wghtd,
    tot_clms,
    tot_dsg_unts,
    tot_spndng
FROM ranked_facts
WHERE row_num = 1  -- Select only the first row for each group to avoid duplicates
