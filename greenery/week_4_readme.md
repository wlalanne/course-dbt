# Week 4

## Part 1. dbt Snapshots

- What orders changed from week 3 to week 4?
  - `0e9b8ee9-ad0a-42f4-a778-e1dd3e6f6c51`
  - `841074bf-571a-43a6-963c-ba7cbdb26c85`
  - `df91aa85-bfc7-4c31-93ef-4cee8d00a343`

## Part 2. Modeling challenge

- How are our users moving through the product funnel?

  | TOTAL_UNIQUE_SESSIONS | SESSIONS_WITH_PAGE_VIEWS | SESSIONS_WITH_ADD_TO_CART | SESSIONS_WITH_CHECKOUT |
  | --- | --- | --- | --- |
  | 578 | 578 | 467 | 361 |

  - There are 578 unique sessions. All of those sessions have viewed a page, 467 has added something to their cart, and 361 have made it to checkout.

- Which steps in the funnel have largest drop off points?

  - Sessions added to cart to sessions that checked out has the biggest drop off (22% of added-to-cart sessions dropped off).

## Part 3: Reflection

### 3B. Setting up for production / scheduled dbt run of project

- How would you go about setting up a proudction/scheduled dbt run of my project?

  - I would use Dagster because the documentation is easy to document through and Dagster has a dbt integration allowing engineers to easily visualize and materialize dbt models in Dagit. I would probably start the dbt schedule to run at a 15 minute schedule and adjust as needed.

- The exposure for my product analytics model is located at greenery/models/exposures.yml
