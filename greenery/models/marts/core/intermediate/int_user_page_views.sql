SELECT
    events.user_id AS user_id,
    COUNT(DISTINCT events.event_id) AS page_views
  FROM {{ ref('stg_events') }} AS events
 WHERE event_type = 'page_view'
 GROUP BY user_id