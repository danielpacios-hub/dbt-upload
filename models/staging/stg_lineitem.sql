{{
    config( materialized='incremental')
    }}
select 
    *
from {{ source('tpch', 'LINEITEM') }}

{%if is_incremental()%}
where L_RECEIPTDATE > 
    (select max(L_RECEIPTDATE) from {{this}})

{% endif %}