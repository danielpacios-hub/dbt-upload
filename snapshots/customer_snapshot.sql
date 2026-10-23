{%snapshot customer_snapshot%}

{{
    config(
        tags=['snapshots'],
        target_schema='SNAPSHOTS',
        unique_key='custkey',
        strategy='check',
        check_cols=[
            'name',
            'address',
            'nationkey',
            'phone',
            'acctbal',
            'mktsegment'
        ],
        invalidate_hard_deletes=True
    )
}}

SELECT
    custkey,
    name,
    address,
    nationkey,
    phone,
    acctbal,
    mktsegment
FROM {{ ref('stg_customer') }}

{% endsnapshot %}