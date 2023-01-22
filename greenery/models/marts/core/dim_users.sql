{{ config(materialized='table') }}

SELECT 
    users.user_id,
    users.first_name,
    users.last_name,
    users.email,
    users.phone_number,
    users.created_at,
    users.updated_at,
    users.address_id,
    user_page_views.page_views,
    addresses.address,
    addresses.zipcode,
    addresses.state,
    addresses.country
FROM {{ ref('stg_users') }} AS users
LEFT JOIN {{ ref('int_user_page_views') }} AS user_page_views ON users.user_id = user_page_views.user_id
LEFT JOIN {{ ref('stg_addresses') }} AS addresses ON users.address_id = addresses.address_id