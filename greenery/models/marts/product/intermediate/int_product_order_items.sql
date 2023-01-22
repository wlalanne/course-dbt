SELECT 
    products.product_id,
    SUM(order_items.quantity) AS amt_sold,
    SUM(products.price) AS revenue
  FROM {{ ref('stg_products') }} AS products
  LEFT JOIN {{ ref('stg_order_items') }} AS order_items ON products.product_id = order_items.product_id
 GROUP BY products.product_id