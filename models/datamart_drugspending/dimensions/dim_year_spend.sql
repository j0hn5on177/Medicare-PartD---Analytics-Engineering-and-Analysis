SELECT DISTINCT TO_HEX(SHA256(CAST(year AS STRING))) AS year_id, year
FROM {{ ref('stg_prescriber_drugcost')}}