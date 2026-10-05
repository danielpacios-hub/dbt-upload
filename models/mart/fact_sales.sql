{{ config(
    materialized='view'
) }}

SELECT

    s.orderkey,
    s.linenumber,

    s.custkey,
    s.partkey,
    s.suppkey,

    d_order.date_key   AS order_date_key,
    d_ship.date_key    AS ship_date_key,
    d_commit.date_key  AS commit_date_key,
    d_receipt.date_key AS receipt_date_key,

    s.orderstatus,
    s.orderpriority,
    s.shippriority,
    s.returnflag,
    s.linestatus,

    s.quantity,
    s.extendedprice,
    s.tax,
    s.discount_amount,
    s.net_amount,
    s.unit_price,
    s.shipping_days

FROM {{ ref('trf_sales') }} s

LEFT JOIN {{ ref('dim_date') }} d_order
    ON s.orderdate = d_order.date_day

LEFT JOIN {{ ref('dim_date') }} d_ship
    ON s.shipdate = d_ship.date_day

LEFT JOIN {{ ref('dim_date') }} d_commit
    ON s.commitdate = d_commit.date_day

LEFT JOIN {{ ref('dim_date') }} d_receipt
    ON s.receiptdate = d_receipt.date_day
