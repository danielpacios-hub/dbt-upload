select
    orderkey,
    orderdate
from {{ ref('stg_order') }}
where orderdate is null
   or orderdate < '1992-01-01'::date
   or orderdate > '2000-01-01'::date

