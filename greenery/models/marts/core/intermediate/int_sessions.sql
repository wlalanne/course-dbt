SELECT
    events.session_id,
    MIN(events.created_at) AS first_event_utc,
    MAX(events.created_at) AS last_event_utc,
    boolor_agg(events.event_type = 'checkout') AS session_completed
  FROM 
    {{ ref('stg_events') }} AS events
 GROUP BY
    events.session_id
  