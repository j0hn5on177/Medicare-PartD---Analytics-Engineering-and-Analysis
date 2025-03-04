WITH drugs AS (
    SELECT
        brnd_name,
        gnrc_name,
        mftr_name
    FROM {{ ref('stg_prescriptiondrugs') }}

    UNION DISTINCT

    SELECT
        brnd_name,
        gnrc_name,
        NULL AS mftr_name
    FROM {{ ref('stg_prescriptions') }}
)


SELECT 
    TO_HEX(SHA256(CONCAT(
        COALESCE(brnd_name, ''), '|', 
        COALESCE(gnrc_name, '')
        )))
     AS drug_id,  -- Stable, deterministic key
    brnd_name,
    gnrc_name,
    mftr_name
FROM drugs

