WITH drugs AS (
    SELECT
        REPLACE(brnd_name, '*', '') AS brnd_name,
        REPLACE(gnrc_name, '*', '') AS gnrc_name,
        REPLACE(mftr_name, '*', '') AS mftr_name
    FROM {{ ref('stg_prescriptiondrugs') }}

    UNION DISTINCT

    SELECT
        REPLACE(brnd_name, '*', '') AS brnd_name,
        REPLACE(gnrc_name, '*', '') AS gnrc_name,
        NULL AS mftr_name
    FROM {{ ref('stg_prescription') }}
)

SELECT 
    ROW_NUMBER() OVER (ORDER BY brnd_name, gnrc_name, COALESCE(mftr_name, '')) AS drug_id, 
    brnd_name,
    gnrc_name,
    mftr_name
FROM drugs
