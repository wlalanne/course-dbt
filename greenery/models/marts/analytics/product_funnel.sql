SELECT
    COUNT(session_id) AS total_unique_sessions,
    COUNT_IF(page_view_count > 0) AS sessions_with_page_views,
    COUNT_IF(add_to_cart_count > 0) AS sessions_with_add_to_cart,
    COUNT_IF(checkout_count > 0) AS sessions_with_checkout
  FROM int_session_event_types