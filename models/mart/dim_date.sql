{{ config(
    materialized='table',
    grants={
        'select': ['SYSADMIN']}
) }}

{{ generate_date_dimension('trf_sales') }}

