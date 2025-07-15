-- Roche Subsidiaries Dashboard Deployment Script
-- Use the Roche database and schema
USE DATABASE Roche_Demo;
USE SCHEMA Roche;

-- Create stage for Streamlit files
CREATE OR REPLACE STAGE streamlit_stage
    DIRECTORY = (ENABLE = TRUE)
    COMMENT = 'Stage for Roche Subsidiaries Streamlit application';

-- Upload the Streamlit application file to the stage
-- Note: This would typically be done via SnowSQL or Snowflake UI
-- PUT file://Roche_subsidiaries_dashboard.py @streamlit_stage AUTO_COMPRESS=FALSE;

-- Create Streamlit application
CREATE OR REPLACE STREAMLIT Roche_subsidiaries_dashboard
    ROOT_LOCATION = '@Roche_Demo.Roche.streamlit_stage'
    MAIN_FILE = 'Roche_subsidiaries_dashboard.py'
    QUERY_WAREHOUSE = 'COMPUTE_WH'
    COMMENT = 'Interactive dashboard for Roche subsidiaries and products/services analysis';

-- Grant permissions for the Streamlit application
GRANT USAGE ON STREAMLIT Roche_subsidiaries_dashboard TO ROLE PUBLIC;
GRANT USAGE ON DATABASE Roche_Demo TO ROLE PUBLIC;
GRANT USAGE ON SCHEMA Roche_Demo.Roche TO ROLE PUBLIC;
GRANT SELECT ON ALL TABLES IN SCHEMA Roche_Demo.Roche TO ROLE PUBLIC;

-- Display deployment information
SELECT 
    'Roche Subsidiaries Dashboard deployed successfully!' AS Status,
    'Access the dashboard through Snowflake Streamlit Apps' AS Instructions,
    'Ensure proper Snowflake connection configuration in Streamlit' AS Note;

-- Show the created Streamlit application details
SHOW STREAMLITS IN SCHEMA Roche_Demo.Roche; 