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
    addresses.address,
    addresses.zipcode,
    addresses.state,
    addresses.country
FROM {{ ref('stg_users') }} AS users
LEFT JOIN {{ ref('stg_addresses') }} AS addresses ON users.address_id = addresses.address_id