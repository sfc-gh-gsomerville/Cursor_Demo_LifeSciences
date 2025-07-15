-- Roche Group Subsidiary Analysis Database Setup
-- Created: January 2025
-- Purpose: Comprehensive analysis of Roche Group subsidiaries and business segments

-- Create Roche Demo database
CREATE DATABASE IF NOT EXISTS Roche_Demo;

-- Use the database
USE DATABASE Roche_Demo;

-- Create Roche schema
CREATE SCHEMA IF NOT EXISTS Roche;

-- Use the schema
USE SCHEMA Roche_Demo.Roche;

-- Grant necessary permissions
GRANT USAGE ON DATABASE Roche_Demo TO ROLE PUBLIC;
GRANT USAGE ON SCHEMA Roche_Demo.Roche TO ROLE PUBLIC;
GRANT SELECT ON ALL TABLES IN SCHEMA Roche_Demo.Roche TO ROLE PUBLIC;

-- Display completion message
SELECT 'Roche database and schema created successfully!' AS Status; 