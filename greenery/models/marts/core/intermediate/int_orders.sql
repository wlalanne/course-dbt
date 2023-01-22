SELECT
    order_items.order_id,
    COUNT(DISTINCT order_items.product_id) AS amt_unique_products,
    SUM(order_items.quantity) AS amt_total_products
 FROM {{ ref('stg_order_items') }} AS order_items
GROUP BY order_items.order_id
