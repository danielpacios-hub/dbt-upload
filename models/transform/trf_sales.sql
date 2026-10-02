with lineitem as (

    select *
    from {{ ref('stg_lineitem') }}

),

orders as (

    select *
    from {{ ref('stg_order') }}

),

customer as (

    select *
    from {{ ref('stg_customer') }}

),

part as (

    select *
    from {{ ref('stg_part') }}

),

supplier as (

    select *
    from {{ ref('stg_supplier') }}

),

nation as (

    select *
    from {{ ref('stg_nation') }}

),

region as (

    select *
    from {{ ref('stg_region') }}

),

final as (

    select

        l.orderkey,
        l.linenumber,
        l.partkey,
        l.suppkey,
        o.custkey,
        o.orderstatus,
        o.orderdate,
        o.orderpriority,
        o.shippriority,
        l.quantity,
        l.extendedprice,
        l.discount,
        l.tax,
        l.returnflag,
        l.linestatus,
        l.shipdate,
        l.commitdate,
        l.receiptdate,
        l.shipinstruct,
        l.shipmode,
        p.name,
        p.mfgr,
        p.brand,
        p.type,
        p.size,
        p.container,
        c.name as customer_name,
        c.mktsegment,
        s.name as supplier_name,
        sup_nation.name as supplier_nation,
        sup_region.name as supplier_region,
        cust_nation.name as customer_nation,
        cust_region.name as customer_region,

        /*calculo de metricas */

        l.extendedprice * l.discount as discount_amount,

        l.extendedprice * (1 - l.discount)
            as net_amount,

        datediff(
            day,
            l.shipdate,
            l.receiptdate
        ) as shipping_days,

        l.extendedprice / nullif(l.quantity, 0)
            as unit_price

    from lineitem l

    inner join orders o
        on l.orderkey = o.orderkey

    inner join customer c
        on o.custkey = c.custkey

    inner join part p
        on l.partkey = p.partkey

    inner join supplier s
        on l.suppkey = s.suppkey

    inner join nation sup_nation
        on s.nationkey = sup_nation.nationkey

    inner join region sup_region
        on sup_nation.regionkey = sup_region.regionkey
    
    inner join nation cust_nation
        on cust_nation.nationkey = c.nationkey
    
    inner join region cust_region 
        on cust_region.regionkey = cust_nation.regionkey
)

select *
from final
