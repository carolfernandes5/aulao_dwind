with source_data as (
    Select
    supplier_id
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
        from {{ source('northwind_etl', 'suppliers') }}
)

Select *
from source_data