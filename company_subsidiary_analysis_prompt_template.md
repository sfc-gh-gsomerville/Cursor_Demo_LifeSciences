# Company Subsidiary Analysis Project - AI Model Prompt Template

## Overview
This template provides a structured prompt for AI models to create comprehensive subsidiary analysis projects for any company. It incorporates lessons learned from database design, data collection, visualization, and common error patterns.

## Core Prompt Template

```
Create a comprehensive subsidiary analysis project for [COMPANY_NAME]. Follow these specific requirements and avoid common pitfalls:

## PROJECT REQUIREMENTS

### 1. Database Setup
- Create a Snowflake database called `[COMPANY_NAME]_Demo`
- Create a schema called `[COMPANY_NAME]`
- Use standard table types (NOT hybrid tables) unless specifically requested
- Avoid CREATE INDEX statements for standard Snowflake tables

### 2. Table Structure

#### Subsidiaries Table
Create a table called `Subsidiaries` with these columns:
- subsidiary_id (INT AUTOINCREMENT PRIMARY KEY)
- company_name (VARCHAR(100) NOT NULL)
- business_segment (VARCHAR(50) NOT NULL)
- description (TEXT)
- key_products_services (TEXT)
- market_position (VARCHAR(200))
- website_url (VARCHAR(200))
- created_date (TIMESTAMP DEFAULT CURRENT_TIMESTAMP())
- last_updated (TIMESTAMP DEFAULT CURRENT_TIMESTAMP())

#### Subsidiary_Products_Services Table
Create a table called `Subsidiary_Products_Services` with these columns:
- product_service_id (INT AUTOINCREMENT PRIMARY KEY)
- subsidiary_name (VARCHAR(100) NOT NULL)
- business_segment (VARCHAR(50) NOT NULL)
- product_service_category (VARCHAR(100) NOT NULL)
- product_service_name (VARCHAR(200))
- description (TEXT)
- target_market (VARCHAR(200))
- key_features (TEXT)
- product_url (VARCHAR(300))
- created_date (TIMESTAMP DEFAULT CURRENT_TIMESTAMP())
- last_updated (TIMESTAMP DEFAULT CURRENT_TIMESTAMP())

### 3. Data Research and Population

#### Research Requirements:
- Research [COMPANY_NAME]'s current subsidiary structure
- Identify all business segments/divisions
- For each subsidiary, gather:
  - Official company name
  - Business segment classification
  - Detailed description of operations
  - Key products and services offered
  - Market position and competitive advantages
  - Official website URL
  - Specific product/service categories
  - Target markets for each product/service
  - Key features and differentiators

#### Data Quality Standards:
- Ensure all subsidiary names are consistent across both tables
- Provide comprehensive descriptions (minimum 100 words per subsidiary)
- Include specific, actionable market positioning statements
- Verify all website URLs are functional
- Categorize products/services meaningfully
- Avoid generic descriptions

### 4. Streamlit Application Development

#### Application Structure:
Create a multi-page Streamlit application with these pages:
1. **Overview** - Executive summary with key metrics and visualizations
2. **Subsidiaries** - Detailed subsidiary directory with filtering
3. **Products & Services** - Comprehensive product catalog
4. **Business Segments** - Segment-specific analysis
5. **Analytics** - Advanced insights and data quality metrics

#### Technical Requirements:
- Use `st.cache_resource` for database connections (NOT st.cache_data)
- Use `st.cache_data(ttl=300)` for data queries
- Implement proper error handling for database connections
- Use Plotly for interactive visualizations
- Implement responsive design with wide layout
- Include search and filtering capabilities
- Add professional styling with company brand colors

#### Code Template Structure:
```python
import streamlit as st
import pandas as pd
import plotly.express as px

# Configure page
st.set_page_config(
    page_title="[COMPANY_NAME] Subsidiaries Dashboard",
    page_icon="🏢",
    layout="wide",
    initial_sidebar_state="expanded"
)

# Database connection - USE st.cache_resource for connections
@st.cache_resource
def get_connection():
    return st.connection("snowflake")

# Data loading - USE st.cache_data for data
@st.cache_data(ttl=300)
def load_subsidiaries_data():
    conn = get_connection()
    query = """
    SELECT * FROM [COMPANY_NAME]_Demo.[COMPANY_NAME].Subsidiaries
    ORDER BY business_segment, company_name
    """
    return conn.query(query)

# Main application structure with navigation
def main():
    st.sidebar.title("Navigation")
    page = st.sidebar.selectbox("Select Page", 
        ["Overview", "Subsidiaries", "Products & Services", "Business Segments", "Analytics"])
    
    try:
        subsidiaries_df = load_subsidiaries_data()
        products_df = load_products_services_data()
        # Route to appropriate page function
    except Exception as e:
        st.error(f"Error loading data: {str(e)}")
        st.info("Please ensure the Snowflake connection is properly configured.")
        return
```

### 5. Deployment Instructions

#### SQL Deployment Script:
```sql
-- Use the company database and schema
USE DATABASE [COMPANY_NAME]_Demo;
USE SCHEMA [COMPANY_NAME];

-- Create stage for Streamlit files
CREATE OR REPLACE STAGE streamlit_stage
    DIRECTORY = (ENABLE = TRUE)
    COMMENT = 'Stage for [COMPANY_NAME] Subsidiaries Streamlit application';

-- Create Streamlit application
CREATE OR REPLACE STREAMLIT [COMPANY_NAME]_subsidiaries_dashboard
    ROOT_LOCATION = '@[COMPANY_NAME]_Demo.[COMPANY_NAME].streamlit_stage'
    MAIN_FILE = '[COMPANY_NAME]_subsidiaries_dashboard.py'
    QUERY_WAREHOUSE = 'COMPUTE_WH'
    COMMENT = 'Interactive dashboard for [COMPANY_NAME] subsidiaries and products/services';

-- Grant permissions
GRANT USAGE ON STREAMLIT [COMPANY_NAME]_subsidiaries_dashboard TO ROLE PUBLIC;
```

### 6. Common Errors to Avoid

#### Database Design Errors:
❌ **AVOID**: Using `CREATE INDEX` on standard Snowflake tables
❌ **AVOID**: Creating hybrid tables without specific requirements
❌ **AVOID**: Using `CREATE OR REPLACE HYBRID TABLE` syntax

✅ **CORRECT**: Use `CREATE OR REPLACE TABLE` for standard tables
✅ **CORRECT**: Rely on Snowflake's automatic clustering and micro-partitions
✅ **CORRECT**: Only use hybrid tables when specifically needed for OLTP workloads

#### Streamlit Caching Errors:
❌ **AVOID**: `@st.cache_data` for database connections
❌ **AVOID**: Caching non-serializable objects with st.cache_data

✅ **CORRECT**: `@st.cache_resource` for database connections
✅ **CORRECT**: `@st.cache_data` for pandas DataFrames and serializable data

#### Data Quality Issues:
❌ **AVOID**: Generic or placeholder descriptions
❌ **AVOID**: Inconsistent naming between tables
❌ **AVOID**: Missing or broken website URLs

✅ **CORRECT**: Comprehensive, specific descriptions
✅ **CORRECT**: Consistent subsidiary names across tables
✅ **CORRECT**: Verified, functional URLs

### 7. Visualization Requirements

#### Key Metrics Dashboard:
- Total subsidiaries count
- Business segments count
- Product categories count
- Geographic distribution (if applicable)

#### Interactive Charts:
- Pie chart of subsidiaries by business segment
- Bar chart of products/services by subsidiary
- Bubble chart for cross-segment analysis
- Data quality metrics visualization

#### Filtering and Search:
- Multi-level filtering (segment, subsidiary, category)
- Text search across names and descriptions
- Real-time results updating

### 8. File Structure

Create these files:
1. `setup_[COMPANY_NAME]_database.sql` - Database and schema creation
2. `create_subsidiaries_table.sql` - Subsidiaries table with data
3. `create_subsidiary_products_services_table.sql` - Products/services table with data
4. `[COMPANY_NAME]_subsidiaries_dashboard.py` - Main Streamlit application
5. `deploy_streamlit_app.sql` - Deployment script

### 9. Success Criteria

The completed project should:
- ✅ Execute all SQL scripts without errors
- ✅ Load Streamlit application without caching errors
- ✅ Display comprehensive subsidiary information
- ✅ Provide interactive filtering and search
- ✅ Include professional visualizations
- ✅ Demonstrate data quality metrics
- ✅ Be deployable in Snowflake environment

### 10. Research Sources

When researching [COMPANY_NAME], use these sources:
- Official company website and investor relations
- Annual reports and SEC filings
- Industry publications and market research
- LinkedIn company pages for subsidiaries
- News articles and press releases
- Competitor analysis reports

Remember to cite sources and ensure information accuracy.
```

## Usage Instructions

1. Replace `[COMPANY_NAME]` with the actual company name throughout the template
2. Customize business segments based on the specific company structure
3. Adjust color schemes and branding to match company identity
4. Research thoroughly to ensure data accuracy and completeness
5. Test all components before deployment

## Example Usage

```
Create a comprehensive subsidiary analysis project for Microsoft. Follow these specific requirements and avoid common pitfalls:

[Insert full template with Microsoft substituted for [COMPANY_NAME]]
```

This template ensures consistent, high-quality results while avoiding the common errors encountered in the original Danaher project. 