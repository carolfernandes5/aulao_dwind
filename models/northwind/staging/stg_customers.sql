with source_data as (
    Select
        country
        , city
        , fax
        , postal_code
        -- , _sdc_table_version
        , address
        , region
        -- , _sdc_received_at
        , customer_id
        -- , _sdc_sequence
        , contact_name
        , phone
        , company_name
        , contact_title
        -- , _sdc_batched_at
        -- , _sdc_extracted_at

         from {{ source('northwind_etl', 'customers') }}
)

Select *
from source_data