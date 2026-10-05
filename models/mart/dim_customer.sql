{{config(materialized='table')}}
select 
    c.custkey,
    c.name as customer_name,
    c.address,
    c.phone,
    c.acctbal as account_balance,
    c.mktsegment,
    n.name as customer_nation,
    r.name as customer_region

from {{ref('stg_customer')}} c
inner join {{ref('stg_nation')}} n on c.nationkey = n.nationkey
inner join {{ref('stg_region')}} r on n.regionkey = r.regionkey


