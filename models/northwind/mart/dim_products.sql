with
staging as (
    Select *
    from {{ ref('stg_products') }}
)
, transformed as (
    Select 
        row_number() over (order by product_id) as product_sk
        , product_id
        , product_name
        , units_on_order
        , unit_price
        , units_in_stock
        , quantity_per_unit
        , category_id
        --, _sdc_table_version
        --, _sdc_received_at
        , supplier_id
        --, _sdc_sequence
        , discontinued
        --, _sdc_batched_at
        , reorder_level
  
    from staging
)

Select * from transformed