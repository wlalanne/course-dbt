SELECT
    *
  FROM
    {{ ref('stg_events') }} AS events
 WHERE
    events.event_type IN ('add_to_cart', 'page_view')
   AND
    events.product_id IS NULL