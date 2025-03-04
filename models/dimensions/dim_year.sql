SELECT 
    TO_HEX(SHA256(CAST(year AS STRING))) AS year_id,  
    year
FROM (
    SELECT year FROM {{ ref('stg_prescriptiondrugs') }}
    UNION DISTINCT 
    SELECT year FROM {{ ref('stg_prescriptions') }}
)