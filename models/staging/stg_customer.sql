with 

source as (

    select * from {{ source('tpch', 'CUSTOMER') }}

),

renamed as (
    /* renombramos columnas y no traemos campo comment */
    select
        c_custkey as custkey,
        c_name as name,
        c_address as address,
        c_nationkey as nationkey,
        c_phone as phone,
        c_acctbal as acctbal,
        c_mktsegment as mktsegment
    from source)

select * from renamed