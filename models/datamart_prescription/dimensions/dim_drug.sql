

WITH drugs AS (
    SELECT
        brnd_name,
        gnrc_name
    FROM {{ ref('stg_prescriber_drugcost') }}
)

SELECT 
    CAST(ROW_NUMBER() OVER (ORDER BY brnd_name, gnrc_name) AS STRING) AS drug_id,  -- Ensuring string type
    brnd_name,
    gnrc_name,
FROM drugs
