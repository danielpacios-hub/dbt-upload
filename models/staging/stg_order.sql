{{
    config(materialized = 'incremental')
    }}

with source as(
    select *
from {{ source('tpch', 'ORDERS') }}

{%if is_incremental()%}
where O_ORDERDATE > 
    (select max(t.ORDERDATE) from {{this}} as t)

{% endif %}
),

renamed as (

    select
        s.o_orderkey as orderkey,
        s.o_custkey as custkey,
        s.o_orderstatus as orderstatus,
        s.o_totalprice as totalprice,
        s.o_orderdate as orderdate,
        s.o_orderpriority as orderpriority,
        s.o_clerk as clerk,
        s.o_shippriority as shippriority
    from source as s 
)
select * from renamed