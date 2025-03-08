
SELECT DISTINCT year 
FROM {{ ref('stg_prescriber_drugcost')}}