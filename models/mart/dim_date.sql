{{ config(
    materialized='table'
) }}

{{ generate_date_dimension('trf_sales') }}

