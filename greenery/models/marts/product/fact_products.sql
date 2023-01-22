{{ config(materialized='table') }}

SELECT
    products.product_id,
    products.name,
    products.price,
    sessions.times_abandoned_in_cart,
    order_items.amt_sold,
    order_items.revenue,
    page_views.page_views
  FROM
    {{ ref('stg_products') }} AS products
  LEFT JOIN
    {{ ref('int_product_sessions') }} AS sessions ON products.product_id = sessions.product_id
  LEFT JOIN
    {{ ref('int_product_order_items') }} AS order_items ON products.product_id = order_items.product_id
  LEFT JOIN
    {{ ref('int_product_page_views') }} AS page_views ON products.product_id = page_views.product_id
