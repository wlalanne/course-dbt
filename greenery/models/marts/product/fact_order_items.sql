{{ config(materialized='table') }}

SELECT
    products.product_id,
    order_items.amt_sold,
    order_items.revenue
  FROM
    {{ ref('stg_products') }} AS products
  LEFT JOIN
    {{ ref('int_product_order_items') }} AS order_items ON products.product_id = order_items.product_id
