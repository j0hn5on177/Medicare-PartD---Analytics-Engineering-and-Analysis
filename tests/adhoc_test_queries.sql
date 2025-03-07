SELECT Prscrbr_NPI, prscrbr_last_org_name, prscrbr_first_name, prscrbr_city, prscrbr_state_abrvtn, COUNT(*)
FROM {{ ref('stg_prescription') }}
GROUP BY 1,2,3,4,5
HAVING COUNT(*) > 1
