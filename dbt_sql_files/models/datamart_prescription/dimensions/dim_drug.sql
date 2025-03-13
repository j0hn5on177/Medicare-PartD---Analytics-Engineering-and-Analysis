

WITH drugs AS (
    SELECT DISTINCT
        brnd_name,
        gnrc_name
    FROM {{ ref('stg_prescriber_drugcost') }}
)

SELECT 
    CAST(ROW_NUMBER() OVER (ORDER BY brnd_name, gnrc_name) AS STRING) AS drug_pk,
    TO_HEX(SHA256(CONCAT(
            COALESCE(brnd_name, ''), '|', 
            COALESCE(gnrc_name, '')
        ))) AS drug_id,
    brnd_name,
    gnrc_name,
FROM drugs
