{{ config(materialized='table') }}

SELECT
    events.session_id,
    first_event_utc,
    last_event_utc,
    session_completed
  FROM 
    {{ ref('int_sessions') }} AS events
  