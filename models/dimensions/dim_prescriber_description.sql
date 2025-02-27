SELECT TO_HEX(SHA256(CONCAT(
        COALESCE(CAST(Prscrbr_NPI AS STRING), ''), '|', 
        COALESCE(Prscrbr_Last_Org_Name, ''), '|',
        COALESCE(Prscrbr_First_Name, '')
    ))) AS desc_id,
        prscrbr_last_org_name AS last_name,
        prescrbr_first_name AS first_name,
        prscrbr_city AS city,
        prscrbr_state_abrvtn AS state

FROM {{ ref('stg_prescribers') }}


