with
staging as (
    Select *
    from {{ ref('stg_shippers') }}
)
, transformed as (
    Select 
        row_number() over (order by shipper_id) as shipper_sk
        , shipper_id
        , phone
        , company_name
        --, _sdc_sequence
        --, _sdc_table_version
        --, _sdc_received_at
        --, _sdc_batched_at

    from staging
)

Select * from transformed