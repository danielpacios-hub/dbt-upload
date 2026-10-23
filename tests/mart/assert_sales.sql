SELECT
    orderkey,
    linenumber,
    COUNT(*) AS row_count
FROM {{ ref('fact_sales') }}
GROUP BY
orderkey,
linenumber
HAVING COUNT(*) > 1