{% macro generate_date_dimension(source_model) %}

WITH date_range AS (

    SELECT
        LEAST(
            MIN(orderdate),
            MIN(shipdate),
            MIN(commitdate),
            MIN(receiptdate)
        ) AS min_date,

        GREATEST(
            MAX(orderdate),
            MAX(shipdate),
            MAX(commitdate),
            MAX(receiptdate)
        ) AS max_date

    FROM {{ ref(source_model) }}

),

dates AS (

    SELECT
        DATEADD(DAY, SEQ4(), min_date) AS date_day

    FROM date_range,
         TABLE(GENERATOR(ROWCOUNT => 100000))

    WHERE DATEADD(DAY, SEQ4(), min_date) <= max_date

)

SELECT
    date_day AS date_key,
    date_day,
    YEAR(date_day) AS year,
    QUARTER(date_day) AS quarter,
    MONTH(date_day) AS month,
    WEEK(date_day) AS week,
    DAY(date_day) AS day,
    DAYOFWEEK(date_day) AS day_of_week,
    DAYNAME(date_day) AS day_name

FROM dates

{% endmacro %}


