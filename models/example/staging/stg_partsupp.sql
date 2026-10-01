select 
    *
from {{ source('tpch', 'PARTSUPP') }}

