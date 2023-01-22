SELECT 
    orders.user_id,
    MIN(orders.created_at) AS first_order_made_utc,
    MAX(orders.created_at) AS last_order_made_utc,
    COUNT(DISTINCT orders.order_id) AS amt_of_orders,
    COUNT(DISTINCT orders.promo_id) AS amt_of_promos_used,
    SUM(promos.discount) AS total_discounts_redeemed,
    SUM(orders.order_cost) AS total_order_costs_spent,
    SUM(orders.shipping_cost) AS total_shipping_costs_spent,
    SUM(orders.order_total) AS orders_total
FROM {{ ref('stg_orders') }} AS orders
LEFT JOIN {{ ref('stg_promos') }} AS promos ON orders.promo_id = promos.promo_id
GROUP BY user_id