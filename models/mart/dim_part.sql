{{ config(materialized='table') }}

SELECT
    partkey,
    name as part_name,
    mfgr as manufacturer,
    brand,
    type as part_type,
    size,
    container,
    retailprice
FROM {{ ref('stg_part') }}
