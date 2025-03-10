WITH drugs AS (
    SELECT
        brnd_name,
        gnrc_name,
        mftr_name
    FROM {{ ref('stg_spending') }}
)

SELECT DISTINCT TO_HEX(SHA256(CONCAT(
    COALESCE(brnd_name, ''), '|', 
    COALESCE(gnrc_name, ''), '|',
    COALESCE(mftr_name, '')       
        ))) AS drug_id,
    brnd_name,
    gnrc_name,
    mftr_name
FROM drugs
