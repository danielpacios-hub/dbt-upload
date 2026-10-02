select 
    *
from {{ source('tpch', 'CUSTOMER') }}

