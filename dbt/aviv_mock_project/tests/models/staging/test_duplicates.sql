{# Validate we dont have duplicate current records in active listings #}
select distinct listing_id FROM {{ ref('active_lisings') }} 
where price > 0
qualify count(*) over (partition by listing_id)>1