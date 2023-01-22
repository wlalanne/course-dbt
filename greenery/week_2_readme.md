# Week 2

## Part 1. Models

- What is your user repeat rate?
  - 0.761538
  ``` sql
  SELECT
      COUNT_IF(amt_of_orders > 1) AS repeat_users,
      COUNT(1) AS total_users,
      repeat_users/total_users as ratio
    FROM FACT_USER_ORDERS;
  ```

- What are good indicators of a user who will likely purchase again?
  - Has recent page views
  - Has a recently abandoned cart
- What about indicators of users who are likely NOT to purchase again?
  - No recent page views
  - Empty cart
- If you had more data, what features would you want to look into to answer this question?
  - How often they've refunded something vs how often they didn't because this could indicate customer dissatisfaction

- Explain the marts models you added
  - I made models based on questions that I was curious about. How many sessions didn't make it to checkout? How many page views did a user have? How many promo discounts did the user redeem?
- Why did you organize the models in the way you did?
  - If one business unit was using a model, I kept the model in that unit's folder. If more than one unit was using a model, I moved it to the "core" folder

- Use the dbt docs to visualize your model DAGs to ensure the model layers make sense
![image](https://user-images.githubusercontent.com/40395627/213938084-26830a20-0444-45e6-977d-268b934394b0.png)

## Part 2: Tests

- What assumptions are you making about each model? (i.e. why are you adding each test?)
  - One assumption I made that the raw data won't add more status values. For example, for the stg_promos.status model I added a "accepted_values" tests with "active" and "inactive" being the only accepted values. If a new status gets added, my test will fail.

- Did you find any “bad” data as you added and ran tests on your models?
  - No

- How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
  - I didn't find bad data

- Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.
  - I would run the dbt tests on a schedule with a data orchestrator (e.g Dagster), and hook any failure to a Slack or email alert

## Part 3. dbt Snapshots

- Which orders changed from week 1 to week 2?
  - 3 orders went from the status "preparing" to "shipped". The ids of the orders are `265f9aae-561a-4232-a78a-7052466e46b7`, `e42ba9a9-986a-4f00-8dd2-5cf8462c74ea`, and `b4eec587-6bca-4b2a-b3d3-ef2db72c4a4f`.
