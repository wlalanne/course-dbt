- How many users do we have?
  - 130

- On average, how many orders do we receive per hour?
  - 7.520833


  ``` sql
  WITH orders_per_hour AS
  (
    SELECT COUNT(1) AS amt_orders
          , DATE_TRUNC('hour', created_at) AS hour
      FROM stg_orders
      GROUP BY DATE_TRUNC('hour', created_at)
  )
  SELECT AVG(amt_orders) FROM orders_per_hour;
  ```
- On average, how long does an order take from being placed to being delivered?
  - 3.891803


  ``` sql
  WITH delivery_days AS (
      SELECT TIMESTAMPDIFF('day', created_at, delivered_at) AS days_delta
        FROM stg_orders
  )
  SELECT AVG(days_delta) FROM delivery_days;
  ```
- How many users have only made one purchase? Two purchases? Three+ purchases?
  - one: 25
  - two: 28
  - three+: 71


  ``` sql
  WITH purchases_per_user AS
  (
      SELECT COUNT(1) AS purchases_amt
          , user_id
        FROM stg_orders
      GROUP BY user_id
  ) 
  SELECT COUNT(1) AS users
    FROM purchases_per_user
   WHERE purchases_amt >= 3
  ;
  ```
- On average, how many unique sessions do we have per hour?
  - 16.327586


  ``` sql
  WITH unique_sessions_per_hour AS
  (
      SELECT COUNT(DISTINCT session_id) AS unique_sessions
          , DATE_TRUNC('hour', created_at) AS hour
        FROM stg_events
      GROUP BY DATE_TRUNC('hour', created_at)
  )
  SELECT AVG(unique_sessions) FROM unique_sessions_per_hour;
  ```