{{
    config( materialized='incremental')
    }}
with 

source as (

    select * from {{ source('tpch', 'LINEITEM') }}

{%if is_incremental()%}

    where L_RECEIPTDATE > 
    (select max(L_RECEIPTDATE) from {{this}})

{% endif %}

),

renamed as (

    select
        s.l_orderkey as orderkey,
        s.l_partkey as partkey,
        s.l_suppkey as suppkey,
        s.l_linenumber as linenumber,
        s.l_quantity as quantity,
        s.l_extendedprice as extendedprice,
        s.l_discount as discount,
        s.l_tax as tax, 
        s.l_returnflag as returnflag,
        s.l_linestatus as linestatus,
        s.l_shipdate as shipdate,
        s.l_commitdate as commitdate,
        s.l_receiptdate as receiptdate,
        s.l_shipinstruct as shipinstruct,
        s.l_shipmode as shipmode,
        s.l_comment as comment
    from source as s

)

select * from renamed

