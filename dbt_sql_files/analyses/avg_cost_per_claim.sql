SELECT
    y.year,
    p.state,
    SUM(f.total_cost) / NULLIF(SUM(f.total_claims), 0) AS avg_cost_per_claim
FROM {{ ref('fact_prescription') }} f
JOIN {{ ref('dim_prescription_description') }} p ON f.desc_id = p.desc_id
JOIN {{ ref('dim_year') }} y ON f.year_id = y.year_id
GROUP BY y.year, p.state
ORDER BY y.year, avg_cost_per_claim DESC
