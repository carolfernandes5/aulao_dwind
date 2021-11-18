{{ config(materialized='table') }}

with
    products as (
        select
        product_sk
        , product_id
        , product_name
        , supplier_id
        from {{ ref('dim_products') }}
),

    suppliers as (
        select
        supplier_sk
        , supplier_id
        , company_name
        from {{ ref('dim_suppliers') }}
)
    
 , orderdetails_with_sk as (
    select
    suppliers.company_name
    , products.product_name
    , order_details.order_id
    , order_details.product_id
    , order_details.discount
    , order_details.unit_price
    , order_details.quantity
    --, _sdc_sequence
    --, _sdc_table_version
    --, _sdc_received_at
    --, _sdc_batched_at

from {{ ref('stg_orderdetails') }} order_details
left join products on order_details.product_id = products.product_id
left join suppliers on products.supplier_id = suppliers.supplier_id

 )

select * from orderdetails_with_sk