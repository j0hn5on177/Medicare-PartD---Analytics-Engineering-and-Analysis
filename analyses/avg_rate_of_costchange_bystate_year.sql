WITH state_year_cost AS (
    SELECT
        y.year,
        p.state AS state_name,  -- Explicit alias to avoid ambiguity
        SUM(f.total_cost) AS total_cost
    FROM {{ ref('fact_prescription') }} f
    JOIN {{ ref('dim_prescription_description') }} p ON f.desc_id = p.desc_id
    JOIN {{ ref('dim_year') }} y ON f.year_id = y.year_id
    GROUP BY y.year, p.state
),
state_rate_of_change AS (
    SELECT
        curr.state_name,
        (SUM(
            (curr.total_cost - prev.total_cost) / NULLIF(prev.total_cost, 0)
        ) / COUNT(*)) * 100 AS avg_annual_rate_percent  -- Convert rate to percentage
    FROM state_year_cost curr
    JOIN state_year_cost prev 
        ON curr.state_name = prev.state_name 
        AND curr.year = prev.year + 1  -- Compare consecutive years
    GROUP BY curr.state_name
)
SELECT 
    state_name, 
    ROUND(avg_annual_rate_percent, 2) AS avg_annual_rate_percent
FROM state_rate_of_change
ORDER BY avg_annual_rate_percent DESC
