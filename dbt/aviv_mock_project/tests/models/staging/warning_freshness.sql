{# Warn if we have data in raw that is not yet in the staging #}
{{ config(severity = 'warn') }}
SELECT distinct listing_id FROM {{ source('raw', 'property_listings') }} 
WHERE updated_at > (SELECT max(updated_at) FROM {{ ref('active_lisitngs') }})