{{ config(materialized='table') }}

with
    customers as (
        select
        customer_sk
        , customer_id
        from {{ ref('dim_customers') }}
    )
    
 , orders_with_sk as (
     select 
     orders.order_id
     , customers.customer_id
     , orders.shipped_date
     , orders.ship_city as cidade
     , orders.ship_country as pais
     , orders.ship_region as regiao
     , orders.ship_name
     , orders.ship_postal_code
     , orders.ship_address
     , orders.freight as frete
     , orders.required_date

from {{ ref('stg_orders') }} orders
left join customers on orders.customer_id = customers.customer_id
 )

select * from orders_with_sk