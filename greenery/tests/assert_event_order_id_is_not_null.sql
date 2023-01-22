SELECT 
    *
  FROM
    {{ ref('stg_events') }} AS events
 WHERE
    events.event_type IN ('checkout', 'package_shipped')
   AND
    events.order_id IS NULL