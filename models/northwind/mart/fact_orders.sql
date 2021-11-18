{{ config(materialized='table') }}

with
    customers as (
        select
        customer_sk
        , customer_id,
        from {{ ref('dim_customers') }}
    )
    , employees as (
        select
        employee_sk
        , employee_id,
        from {{ ref('dim_employees') }}
    )

    , shippers as (
        select
        shipper_sk
        , shipper_id
        , company_name
        from {{ ref('dim_shippers') }}
    )

    , order_details as (
        select
        order_id
        , company_name
        , product_name
    from {{ref ('fact_order_details')}}
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
     , fod.company_name as suppliers_name
     , fod.product_name
     , shippers.company_name as shippers_name
    

from {{ ref('stg_orders') }} orders
left join customers on orders.customer_id = customers.customer_id
left join employees on orders.employee_id = employees.employee_id
left join shippers on orders.ship_name = shippers.company_name
left join order_details as fod on orders.order_id = fod.order_id
 )

select * from orders_with_sk