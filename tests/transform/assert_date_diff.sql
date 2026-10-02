SELECT trf.orderkey
FROM {{ ref('trf_sales') }} AS trf
WHERE trf.shipping_days <= 0