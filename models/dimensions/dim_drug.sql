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
    FROM {{ ref('stg_prescribers') }}
)

SELECT 
    TO_HEX(SHA256(CONCAT(
        COALESCE(prescrbr_npi, ''), '|', 
        COALESCE(prscrbr_last_org_name, ''),
        COALESCE(prescrbr_city))))
     AS desc_id,  -- Stable, deterministic key
    prscrbr_npi AS npi,
    prscrbr_last_org_name AS last_org_name,
    prscrbr_na AS manufacturer_name
FROM drugs

