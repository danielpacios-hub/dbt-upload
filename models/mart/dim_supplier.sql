{{ config(
    materialized='table'
) }}

SELECT

    s.suppkey,
    s.name as supplier_name,
    s.address,
    n.name as supplier_nation,
    r.name as supplier_region,
    s.phone,
    s.actbal as account_balance

FROM {{ ref('stg_supplier') }} s
inner join {{ref('stg_nation')}} n on s.nationkey = n.nationkey
inner join {{ref('stg_region')}} r on n.regionkey = r.regionkey


