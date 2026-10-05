with 

source as (

    select * from {{ source('tpch', 'PARTSUPP') }}

),

renamed as (

    select
        ps_partkey as partkey,
        ps_suppkey as suppkey,
        ps_availqty as availqty,
        ps_supplycost as supplycost
    from source

)

select * from renamed

