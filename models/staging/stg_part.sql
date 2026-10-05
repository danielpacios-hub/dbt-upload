with 

source as (

    select * from {{ source('tpch', 'PART') }}

),

renamed as (

    select
        p_partkey as partkey,
        p_name as name,
        p_mfgr as mfgr,
        p_brand as brand,
        p_type as type,
        p_size as size,
        p_container as container,
        p_retailprice as retailprice
    from source

)
select * from renamed
