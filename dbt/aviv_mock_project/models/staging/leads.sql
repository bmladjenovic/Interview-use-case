{# Leads data model #}
{{
    config (
        materialized = 'incremental',
        unique_key = 'contact_id',
        incremental_strategy = 'merge',
        tags = ['mock']     
    )
}}

with     
stg_leads as (
    select 
        contact_id,
        listing_id,
        contact_source,
        contact_timestamp
    from {{ source('raw', 'contacts_leads') }}
    where 1 = 1
    and contact_source is not null      -- ensure that contact source is always available
),

final as (
    select 
        contact_id::int,
        listing_id::int,
        contact_source::varchar(50),
        contact_timestamp::timestamp_ntz
    from stg_leads
)
select * 
from final

