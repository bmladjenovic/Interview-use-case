create or replace stage property_listings_stage
    URL = 's3://mock-data-bucket/property_listings/'
    STORAGE_INTEGRATION = mock_integration
    FILE_FORMAT = (TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',');

create or replace stage contacts_leads_stage
    URL = 's3://mock-data-bucket/contacts_leads/'
    STORAGE_INTEGRATION = mock_integration  
    FILE_FORMAT = (TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',');