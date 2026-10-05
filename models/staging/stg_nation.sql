with 

source as (

    select * from {{ source('tpch', 'NATION') }}

),

renamed as (

    select
        n_nationkey as nationkey,
        n_name as name, 
        n_regionkey as regionkey
    from source

)
select * from renamed