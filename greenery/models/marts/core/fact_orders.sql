{{ config(materialized='table') }}

SELECT 
    orders.order_id,
    orders.user_id,
    orders.promo_id,
    orders.address_id,
    orders.created_at,
    orders.order_cost,
    orders.shipping_cost,
    orders.order_total,
    orders.tracking_id,
    orders.shipping_service,
    orders.estimated_delivery_at,
    orders.delivered_at,
    orders.status,
    orders_rollup.amt_unique_products,
    orders_rollup.amt_total_products
FROM {{ ref('stg_orders') }} AS orders
LEFT JOIN {{ ref('int_orders') }} AS orders_rollup ON orders.order_id = orders_rollup.order_id