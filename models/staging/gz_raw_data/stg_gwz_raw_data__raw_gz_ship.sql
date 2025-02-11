with 

source as (

    select * from {{ source('gwz_raw_data', 'raw_gz_ship') }}

),

renamed as (

    select

    from source

)

select * from renamed
