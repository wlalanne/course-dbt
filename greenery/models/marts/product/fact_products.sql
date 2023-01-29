{{ config(materialized='table') }}

SELECT
    products.product_id,
    COUNT(DISTINCT product_sessions.session_id) AS total_unique_sessions,
    ZEROIFNULL(COUNT_IF(added_to_cart)) AS amt_added_to_cart,
    ZEROIFNULL(COUNT_IF(page_viewed)) AS amt_page_viewed,
    ZEROIFNULL(COUNT_IF(session_completed)) AS amt_sessions_bought
  FROM
    {{ ref('stg_products') }} AS products
  LEFT JOIN
    {{ ref('int_product_sessions') }} AS product_sessions ON products.product_id = product_sessions.product_id
 GROUP BY
    products.product_id
