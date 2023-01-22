SELECT
    events.product_id,
    COUNT(DISTINCT events.event_id) AS page_views
  FROM {{ ref('stg_events') }} AS events
 WHERE events.event_type = 'page_view'
 GROUP BY events.product_id