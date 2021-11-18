with
staging as (
    Select *
    from {{ ref('stg_suppliers') }}
)
, transformed as (
    Select 
        row_number() over (order by supplier_id) as supplier_sk
        , supplier_id
        , country
        , city
        , fax
        , postal_code
        , homepage
        --, _sdc_table_version
        , address
        , region
        --, _sdc_received_at
        --, _sdc_sequence
        , contact_name
        , phone
        , company_name
        , contact_title
        --, _sdc_batched_at

    from staging
)

Select * from transformed