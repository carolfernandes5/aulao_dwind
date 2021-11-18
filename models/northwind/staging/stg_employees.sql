with

source_data as (
    select
        first_name
        , last_name
        , employee_id
        , hire_date
        , birth_date
        , reports_to
        , Address
        , Region
        , City
        , Country
        , postal_code
        --, _sdc_table_version
        , Extension
        , photo_path
        --, _sdc_received_at
        --, _sdc_sequence
        , title
        , title_of_courtesy
        , notes
        --, _sdc_batched_at
        , home_phone
       				
    from {{ source('northwind_etl', 'employees') }}
)

Select * from source_data 