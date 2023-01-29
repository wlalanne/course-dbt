SELECT
    events.session_id,
    {{ event_type_counter('add_to_cart') }} AS add_to_cart_count,
    {{ event_type_counter('checkout') }} AS checkout_count,
    {{ event_type_counter('package_shipped') }} AS package_shipped_count,
    {{ event_type_counter('page_view') }} AS page_view_count
  FROM {{ ref('stg_events') }} AS events
 GROUP BY events.session_id