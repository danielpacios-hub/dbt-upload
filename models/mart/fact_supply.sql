{{ config(
    materialized='view'
) }}

SELECT

    ps.partkey,
    ps.suppkey,

    ps.availqty as available_quantity,
    ps.supplycost,

    ps.availqty * ps.supplycost
        AS inventory_value

FROM {{ ref('stg_partsupp') }} ps
