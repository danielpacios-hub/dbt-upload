with 

source as (

    select * from {{ source('tpch', 'REGION') }}

),

renamed as (

    select
        r_regionkey as regionkey,
        r_name as name
    from source

)
select * from renamed
