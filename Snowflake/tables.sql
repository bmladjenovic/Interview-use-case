create or replace table property_listings (
    listing_id int,                     
    property_type varchar(50),
    city varchar(100),
    region varchar(100),
    price numeric(12, 2),
    created_at timestamp_ntz,
    updated_at timestamp_ntz,
    agent_id int,
    meta$filename varchar(100),
    meta$loaded_on varchar(100)
);

create or replace table contacts_leads (
    contact_id numeric,              
    listing_id numeric,               
    contact_source varchar(50),       
    contact_timestamp timestamp_ntz,
    meta$filename varchar(100),
    meta$loaded_on timestamp_ntz 
);