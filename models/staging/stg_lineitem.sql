{{
    config(materialized='incremental')
}}

with source as (

    select *
    from {{ source('tpch', 'LINEITEM') }}

    {% if is_incremental() %}

        where L_RECEIPTDATE > (
            select max(t.receiptdate)
            from {{ this }} as t
        )

    {% endif %}

),

renamed as (

    select
        s.L_ORDERKEY as orderkey,
        s.L_PARTKEY as partkey,
        s.L_SUPPKEY as suppkey,
        s.L_LINENUMBER as linenumber,
        s.L_QUANTITY as quantity,
        s.L_EXTENDEDPRICE as extendedprice,
        s.L_DISCOUNT as discount,
        s.L_TAX as tax,
        s.L_RETURNFLAG as returnflag,
        s.L_LINESTATUS as linestatus,
        s.L_SHIPDATE as shipdate,
        s.L_COMMITDATE as commitdate,
        s.L_RECEIPTDATE as receiptdate,
        s.L_SHIPINSTRUCT as shipinstruct,
        s.L_SHIPMODE as shipmode,
        s.L_COMMENT as comment
    from source as s

)

select *
from renamed

