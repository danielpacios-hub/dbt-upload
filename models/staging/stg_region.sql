select 
    *
from {{ source('tpch', 'REGION') }}
