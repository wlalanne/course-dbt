# Week 3

## Part 1: Create new models to answer the first two questions

- What is our overall conversion rate?
  - The conversion rate is 0.624567

  ``` sql
    SELECT
        COUNT(DISTINCT session_id) AS total_session_ids,
        COUNT_IF(session_completed = TRUE) AS amt_sessions_with_purchase,
        amt_sessions_with_purchase/total_session_ids AS conversion_rate
      FROM int_sessions AS s;
  ```

- What is our conversion by product?

  - I think the conversion rates are the way they are because of a combination of the price, what plants are trendy, and what plants are easier to keep alive:

  | PRODUCT_ID | PRODUCT_NAME | TOTAL_UNIQUE_SESSIONS | AMT_SESSIONS_BOUGHT | CONVERSION_RATE | PRICE |
  | --- | --- | --- | --- | --- | --- |
  | e706ab70-b396-4d30-a6b2-a1ccf3625b52 | Fiddle Leaf Fig | 56 | 50 | 0.892857 | 85.5 |
  | fb0e8be7-5ac4-4a76-a1fa-2cc4bf0b2d80 | String of pearls | 64 | 57 | 0.890625 | 80.5 |
  | be49171b-9f72-4fc9-bf7a-9a52e259836b | Monstera | 49 | 43 | 0.877551 | 50.75 |
  | b66a7143-c18a-43bb-b5dc-06bb5d1d3160 | ZZ Plant | 63 | 55 | 0.873016 | 25 |
  | c17e63f7-0d28-4a95-8248-b01ea354840e | Cactus | 55 | 47 | 0.854545 | 15 |
  | 689fb64e-a4a2-45c5-b9f2-480c2155624d | Bamboo | 67 | 56 | 0.835821 | 15.25 |
  | 64d39754-03e4-4fa0-b1ea-5f4293315f67 | Spider Plant | 59 | 49 | 0.830508 | 15 |
  | b86ae24b-6f59-47e8-8adc-b17d88cbd367 | Calathea Makoyana | 53 | 44 | 0.830189 | 40.25 |
  | 5ceddd13-cf00-481f-9285-8340ab95d06d | Majesty Palm | 67 | 55 | 0.820896 | 70 |
  | 74aeb414-e3dd-4e8a-beef-0fa45225214d | Arrow Head | 63 | 50 | 0.793651 | 30.95 |
  | 37e0062f-bd15-4c3e-b272-558a86d90598 | Dragon Tree | 62 | 49 | 0.790323 | 50.25 |
  | e18f33a6-b89a-4fbc-82ad-ccba5bb261cc | Ponytail Palm | 70 | 55 | 0.785714 | 80.75 |
  | d3e228db-8ca5-42ad-bb0a-2148e876cc59 | Money Tree | 56 | 44 | 0.785714 | 30.5 |
  | 579f4cd0-1f45-49d2-af55-9ab2b72c3b35 | Rubber Plant | 54 | 42 | 0.777778 | 20.5 |
  | e8b6528e-a830-4d03-a027-473b411c7f02 | Snake Plant | 73 | 56 | 0.767123 | 25.5 |
  | 35550082-a52d-4301-8f06-05b30f6f3616 | Devil's Ivy | 45 | 34 | 0.755556 | 15.25 |
  | 05df0866-1a66-41d8-9ed7-e2bbcddd6a3d | Bird of Paradise | 60 | 45 | 0.75 | 65 |
  | 5b50b820-1d0a-4231-9422-75e7f6b0cecf | Pilea Peperomioides | 59 | 44 | 0.745763 | 20.5 |
  | 55c6a062-5f4a-4a8b-a8e5-05ea5e6715a3 | Philodendron | 62 | 46 | 0.741935 | 45 |
  | 58b575f2-2192-4a53-9d21-df9a0c14fc25 | Angel Wings Begonia | 61 | 45 | 0.737705 | 95 |
  | 4cda01b9-62e2-46c5-830f-b7f262a58fb1 | Pothos | 61 | 45 | 0.737705 | 30.5 |
  | c7050c3b-a898-424d-8d98-ab0aaad7bef4 | Orchid | 75 | 55 | 0.733333 | 50.75 |
  | bb19d194-e1bd-4358-819e-cd1f1b401c0c | Birds Nest Fern | 78 | 57 | 0.730769 | 15.5 |
  | 80eda933-749d-4fc6-91d5-613d29eb126f | Pink Anthurium | 74 | 54 | 0.72973 | 60.95 |
  | e5ee99b6-519f-4218-8b41-62f48f59f700 | Peace Lily | 66 | 48 | 0.727273 | 60.5 |
  | 843b6553-dc6a-4fc4-bceb-02cd39af0168 | Ficus | 68 | 49 | 0.720588 | 20.25 |
  | e2e78dfc-f25c-4fec-a002-8e280d61a2f2 | Boston Fern | 63 | 45 | 0.714286 | 20 |
  | a88a23ef-679c-4743-b151-dc7722040d8c | Jade Plant | 46 | 32 | 0.695652 | 15 |
  | 6f3a3072-a24d-4d11-9cef-25b0b5f8a4af | Alocasia Polly | 51 | 34 | 0.666667 | 95 |
  | 615695d3-8ffd-4850-bcf7-944cf6d3685b | Aloe Vera | 65 | 43 | 0.661538 | 15 |

## Part 2: Create a macro to simplify part of a model(s):

- I made a macro that counts the amount of event types in an aggregate. The macro is called `event_type_counter`.

## Part 3: Add a post hook to your project to apply grants to the role “reporting”.:

- I made a post hook called `grant_select_on_role`.

## Part 4:  After learning about dbt packages, we want to try one out and apply some macros or tests.

- I used the `dbt_utils.unique_combination_of_columns` in the tests 

## Part 5. dbt Snapshots

- Orders `29d20dcd-d0c4-4bca-a52d-fc9363b5d7c6`, `e2729b7d-e313-4a6f-9444-f7f65ae8db9a`, and `c0873253-7827-4831-aa92-19c38372e58d` were updated. They went from to the "preparing" status to the "shipped" status.
