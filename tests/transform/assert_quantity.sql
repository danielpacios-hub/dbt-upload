SELECT trf.orderkey
FROM {{ ref('trf_sales') }} AS trf
WHERE trf.quantity <= 0
   OR trf.quantity IS NULL
