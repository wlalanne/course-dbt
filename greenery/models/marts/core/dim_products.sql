{{ config(materialized='table') }}

SELECT 
    products.product_id,
    products.name,
    products.price,
    products.inventory
  FROM {{ ref('stg_products') }} AS products