with
staging as (
    Select *
    from {{ ref('stg_employees') }}
)
, transformed as (
    Select 
        row_number() over (order by employee_id) as employee_sk
        , employee_id
        , first_name
        , last_name
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
    from staging
)

Select * from transformed