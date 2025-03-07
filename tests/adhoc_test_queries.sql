SELECT brnd_name, gnrc_name
FROM {{ ref('stg_prescriptiondrugs') }}
WHERE brnd_name LIKE '%*%'
GROUP BY 1, 2
