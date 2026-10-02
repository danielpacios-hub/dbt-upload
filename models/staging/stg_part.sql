select 
    *
from {{ source('tpch', 'PART') }}

