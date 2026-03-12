with orders as (
        select * from {{ ref('stg_orders') }} )
select 
    orders.order_id,
    orders.customer_id,
    orders.order_date,
    orders.status_code as order_status_code,
    orders.priority_code as order_priority_code,
    orders.ship_priority as order_ship_priority,
    orders.total_price{{ money() }} as order_total_price_usd ,
    {{ dol_eur('orders.total_price', 4) }} as order_total_price_eur,
    {{ dol_inr('orders.total_price', 4) }} as order_total_price_inr,
    orders.comment,
    orders.clerk_name
from
    orders
order by
    orders.order_date