{# Mart leads_per_listing data model #}
{{
    config (
        materialized = 'table',
        tags = ['mock']     
    )
}}

with
listings as (
    select
        listing_id,
        property_type,
        region
    from {{ ref('active_listings') }} 
),

leads as (
    select 
        contact_id,
        listing_id
    from {{ ref('leads') }}
),

/* Calculate leads per active listing by property_type and region */
stg_metrics as (
    select
        listings.property_type as property_type, 
        listings.region as region,
        count(leads.contact_id) as total_leads
    from listings listings 
        join leads leads on listings.listing_id = leads.listing_id
    group by 
        property_type,
        region
),

final as (
    select 
        property_type,
        region,
        total_leads
    from stg_metrics
),
select *
from final
