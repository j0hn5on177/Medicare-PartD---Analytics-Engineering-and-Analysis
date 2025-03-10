WITH prescriber_data AS (
    SELECT DISTINCT
        TO_HEX(SHA256(CONCAT(
            COALESCE(CAST(Prscrbr_NPI AS STRING), ''), '|', 
            COALESCE(prscrbr_last_org_name, ''), '|',
            COALESCE(prscrbr_first_name, '')
        ))) AS desc_id,
        Prscrbr_NPI AS npi,
        prscrbr_last_org_name AS last_name,
        prscrbr_first_name AS first_name,
        prscrbr_city AS city,
        prscrbr_state_abrvtn AS state
    FROM {{ ref('stg_prescriber_drugcost') }}
)

SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY desc_id, npi, last_name, first_name, city, state) AS desc_pk, --PK
    desc_id,
    npi,
    last_name,
    first_name,
    city,
    state
FROM prescriber_data
