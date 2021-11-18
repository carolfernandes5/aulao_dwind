with source_data as (
    Select
        shipper_id
        , phone
        , company_name
        --, _sdc_sequence
        --, _sdc_table_version
        --, _sdc_batched_at

        from {{ source('northwind_etl', 'shippers') }}
)

Select *
from source_data