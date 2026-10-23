{% snapshot part_snapshot %}

{{
    config(
        tags=['snapshots'],
        target_schema='SNAPSHOTS',
        unique_key='partkey',
        strategy='check',
        check_cols=[
            'name',
            'mfgr',
            'brand',
            'type',
            'size',
            'container',
            'retailprice'
        ],
        invalidate_hard_deletes=True
    )
}}

SELECT
    partkey,
    name,
    mfgr,
    brand,
    type,
    size,
    container,
    retailprice
FROM {{ ref('stg_part') }}

{% endsnapshot %}