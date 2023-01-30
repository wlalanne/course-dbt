SELECT
    events.product_id,
    events.session_id,
    BOOLOR_AGG(events.event_type = 'add_to_cart') AS added_to_cart,
    BOOLOR_AGG(events.event_type = 'page_view') AS page_viewed,
    BOOLOR_AGG(sessions.session_completed) AS session_completed
  FROM
    {{ ref('int_sessions') }} AS sessions
  LEFT JOIN
    {{ ref('stg_events') }} AS events ON sessions.session_id = events.session_id
 WHERE events.product_id IS NOT NULL
 GROUP BY
    events.product_id,
    events.session_id