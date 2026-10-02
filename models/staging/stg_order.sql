{{
    config(materialized = 'incremental')
    }}
select 
    *
from {{ source('tpch', 'ORDERS') }}

{%if is_incremental()%}
where O_ORDERDATE > 
    (select max(O_ORDERDATE) from {{this}}

{% endif %}