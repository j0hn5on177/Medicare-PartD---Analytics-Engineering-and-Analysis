SELECT DISTINCT year, TO_HEX(SHA256(CAST(year AS STRING))) AS year_id
FROM {{ ref('stg_prescriber_drugcost')}}