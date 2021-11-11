with
staging as (
    Select *
    from {{ ref('stg_customers') }}
)
, transformed as (
    Select 
    row_number() over (order by customer_id) as customer_sk
    , customer_id	
    , company_name	
    , contact_name
    , contact_title
    , address	
    , city	
    , region	
    , postal_code	
    , country
    , phone	
    , fax
    from staging
)

Select * from transformed