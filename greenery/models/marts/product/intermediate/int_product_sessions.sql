SELECT
    events.product_id,
    COUNT(1) AS times_abandoned_in_cart
  FROM
    {{ ref('int_sessions') }} AS sessions
  LEFT JOIN
    {{ ref('stg_events') }} AS events ON sessions.session_id = events.session_id
 WHERE events.event_type = 'add_to_cart'
   AND sessions.session_completed = FALSE
 GROUP BY events.product_id