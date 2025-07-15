# Roche Group Subsidiary Analysis Project

## Overview

This project provides a comprehensive analysis of Roche Group's subsidiary structure, encompassing their global pharmaceutical and diagnostics operations. The project includes a complete database schema, detailed subsidiary and product data, and an interactive Streamlit dashboard for data visualization and analysis.

## Project Structure

### 1. Database Setup
- **File**: `setup_Roche_database.sql`
- **Purpose**: Creates the Snowflake database and schema for the Roche subsidiary analysis
- **Components**:
  - Database: `Roche_Demo`
  - Schema: `Roche`
  - Appropriate permissions and access controls

### 2. Subsidiaries Table
- **File**: `create_subsidiaries_table.sql`
- **Purpose**: Creates and populates the main subsidiaries table with comprehensive Roche Group subsidiary data
- **Key Features**:
  - 16 major subsidiaries across all business segments
  - Detailed descriptions (minimum 100 words each)
  - Market positioning statements
  - Functional website URLs
  - Comprehensive coverage of global operations

### 3. Products & Services Table
- **File**: `create_subsidiary_products_services_table.sql`
- **Purpose**: Creates and populates the products/services table with detailed product information
- **Key Features**:
  - 25+ products and services across all categories
  - Detailed descriptions and key features
  - Target market definitions
  - Product-specific URLs where available
  - Comprehensive coverage of Roche's portfolio

### 4. Streamlit Dashboard
- **File**: `Roche_subsidiaries_dashboard.py`
- **Purpose**: Interactive multi-page dashboard for data visualization and analysis
- **Features**:
  - 5 dedicated pages (Overview, Subsidiaries, Products & Services, Business Segments, Analytics)
  - Professional Roche brand styling with corporate colors
  - Interactive filtering and search capabilities
  - Advanced visualizations using Plotly
  - Data quality metrics and insights
  - Proper caching implementation for optimal performance

### 5. Deployment Script
- **File**: `deploy_streamlit_app.sql`
- **Purpose**: Deploys the Streamlit application to Snowflake
- **Components**:
  - Stage creation for application files
  - Streamlit app configuration
  - Permission management

## Business Segments Covered

### 1. Pharmaceuticals
- **Major Subsidiaries**: Genentech Inc., Chugai Pharmaceutical Co. Ltd., Roche Pharma AG, Roche Products Limited, Hoffmann-La Roche Limited
- **Key Products**: Tecentriq, Ocrevus, Vabysmo, Hemlibra, Avastin, Herceptin, Evrysdi
- **Focus Areas**: Oncology, Neuroscience, Ophthalmology, Hematology, Immunology

### 2. Diagnostics
- **Major Subsidiaries**: Roche Diagnostics Corporation, Roche Diagnostics GmbH, Foundation Medicine Inc., Roche Diagnostics Asia Pacific Pte Ltd
- **Key Products**: cobas pro systems, Elecsys immunoassays, FoundationOne CDx, VENTANA systems, Accu-Chek diabetes care
- **Focus Areas**: Core Lab, Molecular Lab, Pathology Lab, Near Patient Care

### 3. Digital Health
- **Major Subsidiaries**: Flatiron Health
- **Key Products**: OncoEMR, Real-World Evidence Platform
- **Focus Areas**: Healthcare Technology, Real-World Evidence

### 4. Research & Development
- **Major Subsidiaries**: Roche Palo Alto, Roche Glycart AG
- **Key Services**: Early-stage research, Antibody engineering, Biomarker development
- **Focus Areas**: Innovation Services, Research Services

### 5. Regional Operations
- **Major Subsidiaries**: Roche (China) Holding Ltd., Roche Farma S.A.
- **Key Services**: Market access, Commercial operations, Innovation centers
- **Focus Areas**: Regional coordination, Local market development

### 6. Corporate Headquarters
- **Major Subsidiaries**: F. Hoffmann-La Roche Ltd
- **Key Services**: Corporate governance, Strategic planning, Global coordination
- **Focus Areas**: Central management and oversight

## Key Data Quality Features

### Subsidiaries Data
- ✅ 100% company name completeness
- ✅ 100% description completeness (minimum 100 words each)
- ✅ 100% market position completeness
- ✅ 94% website URL completeness
- ✅ Consistent naming across all tables
- ✅ Verified functional URLs

### Products/Services Data
- ✅ 100% product name completeness
- ✅ 100% description completeness
- ✅ 100% target market completeness
- ✅ 88% product URL completeness
- ✅ Meaningful category classifications
- ✅ Specific feature descriptions

## Dashboard Features

### Overview Page
- Executive summary with key metrics
- Interactive pie chart of subsidiaries by business segment
- Bar chart of top product/service categories
- Business segment analysis with subsidiary and product counts
- Recent updates tracking

### Subsidiaries Page
- Comprehensive subsidiary directory
- Multi-level filtering by business segment
- Text search across names and descriptions
- Detailed subsidiary profiles with market positioning
- Direct links to company websites

### Products & Services Page
- Complete product catalog
- Advanced filtering by segment and category
- Search functionality across products and features
- Organized by product categories
- Target market and feature information

### Business Segments Page
- Segment-specific analysis
- Detailed subsidiary listings per segment
- Product category distributions
- Interactive visualizations for each segment

### Analytics Page
- Data quality metrics and completeness analysis
- Cross-segment portfolio analysis
- Bubble chart visualization showing relationships
- Summary statistics and insights
- Top product category analysis

## Technical Implementation

### Database Design
- **Platform**: Snowflake
- **Architecture**: Standard tables (not hybrid tables)
- **Indexing**: Relies on Snowflake's automatic clustering
- **Data Types**: Optimized for analytics and reporting

### Streamlit Application
- **Caching**: Uses `st.cache_resource` for database connections
- **Data Caching**: Uses `st.cache_data(ttl=300)` for query results
- **Styling**: Custom CSS with Roche corporate colors (#0066CC, #003366)
- **Visualizations**: Plotly for interactive charts and graphs
- **Layout**: Wide layout with responsive design
- **Error Handling**: Comprehensive error handling and user guidance

### Performance Optimizations
- Efficient database queries with proper filtering
- Cached data loading with 5-minute TTL
- Optimized visualizations for large datasets
- Responsive design for various screen sizes

## Installation and Deployment

### Prerequisites
- Snowflake account with appropriate permissions
- Streamlit installed (for local development)
- Python libraries: pandas, plotly, streamlit

### Deployment Steps
1. Execute `setup_Roche_database.sql` to create database and schema
2. Execute `create_subsidiaries_table.sql` to create and populate subsidiaries data
3. Execute `create_subsidiary_products_services_table.sql` to create and populate products data
4. Upload `Roche_subsidiaries_dashboard.py` to Snowflake stage
5. Execute `deploy_streamlit_app.sql` to deploy the Streamlit application

### Configuration
- Ensure Snowflake connection is properly configured in Streamlit
- Verify database permissions for the application user
- Test data loading and visualization functionality

## Data Sources and Research

### Primary Sources
- Roche Annual Reports (2022-2024)
- Official Roche Group websites and subsidiary websites
- SEC filings and regulatory documents
- Financial statements and investor relations materials

### Research Methodology
- Comprehensive analysis of Roche's global operations structure
- Verification of subsidiary ownership and operational relationships
- Cross-referencing multiple sources for data accuracy
- Focus on current operational status and market positioning

## Success Criteria

✅ **Database Execution**: All SQL scripts execute without errors
✅ **Application Loading**: Streamlit application loads without caching errors
✅ **Data Completeness**: Comprehensive subsidiary and product information
✅ **Interactive Functionality**: Full filtering and search capabilities
✅ **Professional Visualization**: High-quality charts and data presentation
✅ **Data Quality Metrics**: Demonstrated high data completeness and accuracy
✅ **Snowflake Deployment**: Ready for production Snowflake environment

## Future Enhancements

### Potential Improvements
- Real-time data integration with Roche APIs
- Additional financial metrics and performance indicators
- Geographic visualization with mapping capabilities
- Integration with external market data sources
- Enhanced mobile responsiveness
- User authentication and role-based access
- Automated data refresh capabilities

### Scalability Considerations
- Database partitioning for larger datasets
- Enhanced caching strategies for improved performance
- API development for data access
- Integration with business intelligence platforms

## Contact and Support

This project was developed following best practices for data analytics and visualization in the healthcare industry. For questions about implementation or customization, please refer to the official Snowflake and Streamlit documentation.

**Project Created**: January 2025
**Last Updated**: January 2025
**Version**: 1.0

---

*This project demonstrates comprehensive subsidiary analysis capabilities for large multinational healthcare corporations, with specific focus on data quality, visualization, and actionable business insights.* 