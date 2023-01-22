{{ config(materialized='table') }}

SELECT
    users.user_id,
    users.first_name,
    users.last_name,
    users.email,
    users.phone_number,
    users.created_at,
    users.updated_at,
    users.address_id,
    orders.first_order_made_utc,
    orders.last_order_made_utc,
    orders.amt_of_orders,
    orders.amt_of_promos_used,
    orders.total_discounts_redeemed,
    orders.total_order_costs_spent,
    orders.total_shipping_costs_spent,
    orders.orders_total
FROM {{ ref('stg_users') }} AS users
LEFT JOIN {{ ref('int_user_orders') }} AS orders ON users.user_id = orders.user_id