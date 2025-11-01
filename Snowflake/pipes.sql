create or replace pipe property_listings_pipe
    AUTO_INGEST = TRUE
    AS
    COPY INTO property_listings
    FROM @property_listings_stage
    FILE_FORMAT = (TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',')
    ON_ERROR = 'CONTINUE';

create or replace pipe contacts_leads_pipe
    AUTO_INGEST = TRUE
    AS
    COPY INTO listings
    FROM @contacts_leads_stage
    FILE_FORMAT = (TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',')
    ON_ERROR = 'CONTINUE';