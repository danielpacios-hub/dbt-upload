select 
    *
from {{ source('tpch', 'SUPPLIER') }}

