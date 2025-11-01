{# Stage Listings data model #}
{{
    config (
        materialized = 'incremental',
        unique_key = 'listing_id',
        tags = ['mock']     
    )
}}

with     
/* Since there's no flag assume all listings are active */
stg_listings as (
    select 
        listing_id,
        agent_id,
        property_type,
        city,
        region,
        price,
        updated_at,     -- timestamp when record is modified at the source
        inserted_at     -- timestamp when record is first time inserted into staging
    from {{ source('raw', 'property_listings') }}
    where 1 = 1
        and price > 0   -- filter out listings with price error
        and city is not null
        and region is not null
        {% if is_incremental() %}
        and updated_at > (select coalesce(max(updated_at),'1900-01-01') from {{ this }})
        {% endif %}
),

final as (
    select 
        listing_id::int,
        agent_id::int,
        property_type::varchar(50),
        city::varchar(100),
        region::varchar(100),
        price::numeric(20,2),
        updated_at::timestamp_ntz
    from stg_listings
)
select * 
from final

