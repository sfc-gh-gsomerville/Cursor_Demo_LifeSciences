import streamlit as st
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import numpy as np

# Configure page
st.set_page_config(
    page_title="Roche Subsidiaries Dashboard",
    page_icon="🏢",
    layout="wide",
    initial_sidebar_state="expanded"
)

# Custom CSS for Roche brand colors and styling
st.markdown("""
<style>
    .main-header {
        font-size: 3rem;
        color: #0066CC;
        text-align: center;
        margin-bottom: 2rem;
        font-weight: bold;
    }
    .section-header {
        font-size: 2rem;
        color: #003366;
        margin-top: 2rem;
        margin-bottom: 1rem;
        border-bottom: 2px solid #0066CC;
        padding-bottom: 0.5rem;
    }
    .metric-container {
        background-color: #f8f9fa;
        padding: 1rem;
        border-radius: 10px;
        border: 1px solid #dee2e6;
        margin: 0.5rem 0;
    }
    .sidebar .sidebar-content {
        background-color: #003366;
    }
    .stButton > button {
        background-color: #0066CC;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 0.5rem 1rem;
    }
    .stButton > button:hover {
        background-color: #004499;
    }
</style>
""", unsafe_allow_html=True)

# Database connection - USE st.cache_resource for connections
@st.cache_resource
def get_connection():
    return st.connection("snowflake")

# Data loading - USE st.cache_data for data
@st.cache_data(ttl=300)
def load_subsidiaries_data():
    conn = get_connection()
    query = """
    SELECT * FROM Roche_Demo.Roche.Subsidiaries
    ORDER BY business_segment, company_name
    """
    return conn.query(query)

@st.cache_data(ttl=300)
def load_products_services_data():
    conn = get_connection()
    query = """
    SELECT * FROM Roche_Demo.Roche.Subsidiary_Products_Services
    ORDER BY business_segment, product_service_category, product_service_name
    """
    return conn.query(query)

# Navigation functions
def show_overview(subsidiaries_df, products_df):
    st.markdown('<h1 class="main-header">Roche Group Subsidiaries Analysis</h1>', unsafe_allow_html=True)
    st.markdown("**Comprehensive analysis of Roche Group's global subsidiary structure and operations**")
    
    # Key metrics
    col1, col2, col3, col4 = st.columns(4)
    
    with col1:
        st.markdown('<div class="metric-container">', unsafe_allow_html=True)
        st.metric("Total Subsidiaries", len(subsidiaries_df))
        st.markdown('</div>', unsafe_allow_html=True)
    
    with col2:
        st.markdown('<div class="metric-container">', unsafe_allow_html=True)
        st.metric("Business Segments", subsidiaries_df['BUSINESS_SEGMENT'].nunique())
        st.markdown('</div>', unsafe_allow_html=True)
    
    with col3:
        st.markdown('<div class="metric-container">', unsafe_allow_html=True)
        st.metric("Product Categories", products_df['PRODUCT_SERVICE_CATEGORY'].nunique())
        st.markdown('</div>', unsafe_allow_html=True)
    
    with col4:
        st.markdown('<div class="metric-container">', unsafe_allow_html=True)
        st.metric("Total Products/Services", len(products_df))
        st.markdown('</div>', unsafe_allow_html=True)
    
    # Visualizations
    col1, col2 = st.columns(2)
    
    with col1:
        st.markdown('<h3 class="section-header">Subsidiaries by Business Segment</h3>', unsafe_allow_html=True)
        segment_counts = subsidiaries_df['BUSINESS_SEGMENT'].value_counts()
        fig_pie = px.pie(
            values=segment_counts.values,
            names=segment_counts.index,
            title="Distribution of Subsidiaries",
            color_discrete_sequence=['#0066CC', '#003366', '#66B2FF', '#004499', '#0080FF', '#1177DD']
        )
        fig_pie.update_layout(
            font=dict(size=12),
            title_font_size=16,
            height=400
        )
        st.plotly_chart(fig_pie, use_container_width=True)
    
    with col2:
        st.markdown('<h3 class="section-header">Products/Services by Category</h3>', unsafe_allow_html=True)
        category_counts = products_df['PRODUCT_SERVICE_CATEGORY'].value_counts().head(10)
        fig_bar = px.bar(
            x=category_counts.values,
            y=category_counts.index,
            orientation='h',
            title="Top Product/Service Categories",
            color=category_counts.values,
            color_continuous_scale='Blues'
        )
        fig_bar.update_layout(
            font=dict(size=12),
            title_font_size=16,
            height=400,
            showlegend=False
        )
        st.plotly_chart(fig_bar, use_container_width=True)
    
    # Business segment deep dive
    st.markdown('<h3 class="section-header">Business Segment Analysis</h3>', unsafe_allow_html=True)
    
    segment_analysis = subsidiaries_df.groupby('BUSINESS_SEGMENT').agg({
        'COMPANY_NAME': 'count',
        'WEBSITE_URL': lambda x: (x.notna() & (x != '')).sum()
    }).rename(columns={'COMPANY_NAME': 'Subsidiary_Count', 'WEBSITE_URL': 'Has_Website'})
    
    # Add product counts
    product_counts = products_df.groupby('BUSINESS_SEGMENT')['PRODUCT_SERVICE_NAME'].count()
    segment_analysis['Product_Count'] = product_counts
    segment_analysis['Product_Count'] = segment_analysis['Product_Count'].fillna(0).astype(int)
    
    fig_segment = go.Figure()
    
    fig_segment.add_trace(go.Bar(
        name='Subsidiaries',
        x=segment_analysis.index,
        y=segment_analysis['Subsidiary_Count'],
        marker_color='#0066CC'
    ))
    
    fig_segment.add_trace(go.Bar(
        name='Products/Services',
        x=segment_analysis.index,
        y=segment_analysis['Product_Count'],
        marker_color='#66B2FF'
    ))
    
    fig_segment.update_layout(
        title='Subsidiaries and Products by Business Segment',
        xaxis_title='Business Segment',
        yaxis_title='Count',
        barmode='group',
        font=dict(size=12),
        title_font_size=16,
        height=500
    )
    
    st.plotly_chart(fig_segment, use_container_width=True)
    
    # Recent updates
    st.markdown('<h3 class="section-header">Recent Updates</h3>', unsafe_allow_html=True)
    recent_subsidiaries = subsidiaries_df.nlargest(5, 'LAST_UPDATED')[['COMPANY_NAME', 'BUSINESS_SEGMENT', 'LAST_UPDATED']]
    st.dataframe(recent_subsidiaries, use_container_width=True)

def show_subsidiaries(subsidiaries_df):
    st.markdown('<h1 class="main-header">Subsidiaries Directory</h1>', unsafe_allow_html=True)
    
    # Filters
    col1, col2 = st.columns(2)
    
    with col1:
        selected_segments = st.multiselect(
            "Filter by Business Segment",
            options=subsidiaries_df['BUSINESS_SEGMENT'].unique(),
            default=subsidiaries_df['BUSINESS_SEGMENT'].unique()
        )
    
    with col2:
        search_term = st.text_input("Search subsidiaries", placeholder="Enter company name or description...")
    
    # Filter data
    filtered_df = subsidiaries_df[subsidiaries_df['BUSINESS_SEGMENT'].isin(selected_segments)]
    
    if search_term:
        filtered_df = filtered_df[
            filtered_df['COMPANY_NAME'].str.contains(search_term, case=False, na=False) |
            filtered_df['DESCRIPTION'].str.contains(search_term, case=False, na=False)
        ]
    
    st.write(f"**Showing {len(filtered_df)} of {len(subsidiaries_df)} subsidiaries**")
    
    # Display subsidiaries
    for _, subsidiary in filtered_df.iterrows():
        with st.container():
            st.markdown(f"### {subsidiary['COMPANY_NAME']}")
            
            col1, col2 = st.columns([3, 1])
            
            with col1:
                st.markdown(f"**Business Segment:** {subsidiary['BUSINESS_SEGMENT']}")
                st.markdown(f"**Description:** {subsidiary['DESCRIPTION']}")
                st.markdown(f"**Key Products/Services:** {subsidiary['KEY_PRODUCTS_SERVICES']}")
                st.markdown(f"**Market Position:** {subsidiary['MARKET_POSITION']}")
            
            with col2:
                if subsidiary['WEBSITE_URL']:
                    st.markdown(f"[🌐 Visit Website]({subsidiary['WEBSITE_URL']})")
                st.markdown(f"**Created:** {subsidiary['CREATED_DATE'].strftime('%Y-%m-%d')}")
                st.markdown(f"**Updated:** {subsidiary['LAST_UPDATED'].strftime('%Y-%m-%d')}")
            
            st.divider()

def show_products_services(products_df):
    st.markdown('<h1 class="main-header">Products & Services Catalog</h1>', unsafe_allow_html=True)
    
    # Filters
    col1, col2, col3 = st.columns(3)
    
    with col1:
        selected_segments = st.multiselect(
            "Business Segment",
            options=products_df['BUSINESS_SEGMENT'].unique(),
            default=products_df['BUSINESS_SEGMENT'].unique()
        )
    
    with col2:
        selected_categories = st.multiselect(
            "Product Category",
            options=products_df['PRODUCT_SERVICE_CATEGORY'].unique(),
            default=products_df['PRODUCT_SERVICE_CATEGORY'].unique()
        )
    
    with col3:
        search_term = st.text_input("Search products/services", placeholder="Enter product name or feature...")
    
    # Filter data
    filtered_df = products_df[
        (products_df['BUSINESS_SEGMENT'].isin(selected_segments)) &
        (products_df['PRODUCT_SERVICE_CATEGORY'].isin(selected_categories))
    ]
    
    if search_term:
        filtered_df = filtered_df[
            filtered_df['PRODUCT_SERVICE_NAME'].str.contains(search_term, case=False, na=False) |
            filtered_df['DESCRIPTION'].str.contains(search_term, case=False, na=False) |
            filtered_df['KEY_FEATURES'].str.contains(search_term, case=False, na=False)
        ]
    
    st.write(f"**Showing {len(filtered_df)} of {len(products_df)} products/services**")
    
    # Group by category
    for category in filtered_df['PRODUCT_SERVICE_CATEGORY'].unique():
        category_products = filtered_df[filtered_df['PRODUCT_SERVICE_CATEGORY'] == category]
        
        with st.expander(f"**{category}** ({len(category_products)} items)", expanded=True):
            for _, product in category_products.iterrows():
                st.markdown(f"#### {product['PRODUCT_SERVICE_NAME']}")
                
                col1, col2 = st.columns([2, 1])
                
                with col1:
                    st.markdown(f"**Subsidiary:** {product['SUBSIDIARY_NAME']}")
                    st.markdown(f"**Description:** {product['DESCRIPTION']}")
                    st.markdown(f"**Key Features:** {product['KEY_FEATURES']}")
                
                with col2:
                    st.markdown(f"**Target Market:** {product['TARGET_MARKET']}")
                    if product['PRODUCT_URL']:
                        st.markdown(f"[🔗 Product Info]({product['PRODUCT_URL']})")
                
                st.divider()

def show_business_segments(subsidiaries_df, products_df):
    st.markdown('<h1 class="main-header">Business Segments Analysis</h1>', unsafe_allow_html=True)
    
    # Segment selection
    selected_segment = st.selectbox(
        "Select Business Segment",
        options=subsidiaries_df['BUSINESS_SEGMENT'].unique()
    )
    
    # Filter data for selected segment
    segment_subsidiaries = subsidiaries_df[subsidiaries_df['BUSINESS_SEGMENT'] == selected_segment]
    segment_products = products_df[products_df['BUSINESS_SEGMENT'] == selected_segment]
    
    # Segment overview
    col1, col2, col3 = st.columns(3)
    
    with col1:
        st.metric("Subsidiaries", len(segment_subsidiaries))
    
    with col2:
        st.metric("Products/Services", len(segment_products))
    
    with col3:
        st.metric("Product Categories", segment_products['PRODUCT_SERVICE_CATEGORY'].nunique())
    
    # Segment details
    st.markdown(f'<h3 class="section-header">{selected_segment} - Subsidiaries</h3>', unsafe_allow_html=True)
    
    if len(segment_subsidiaries) > 0:
        # Display subsidiaries in this segment
        for _, subsidiary in segment_subsidiaries.iterrows():
            with st.container():
                st.markdown(f"**{subsidiary['COMPANY_NAME']}**")
                st.markdown(subsidiary['DESCRIPTION'])
                st.markdown(f"*Market Position: {subsidiary['MARKET_POSITION']}*")
                if subsidiary['WEBSITE_URL']:
                    st.markdown(f"[Visit Website]({subsidiary['WEBSITE_URL']})")
                st.divider()
    
    # Product categories in this segment
    if len(segment_products) > 0:
        st.markdown(f'<h3 class="section-header">{selected_segment} - Product Categories</h3>', unsafe_allow_html=True)
        
        category_counts = segment_products['PRODUCT_SERVICE_CATEGORY'].value_counts()
        
        fig_categories = px.bar(
            x=category_counts.index,
            y=category_counts.values,
            title=f"Product Categories in {selected_segment}",
            color=category_counts.values,
            color_continuous_scale='Blues'
        )
        fig_categories.update_layout(
            xaxis_title="Product Category",
            yaxis_title="Number of Products",
            font=dict(size=12),
            title_font_size=16,
            height=400
        )
        st.plotly_chart(fig_categories, use_container_width=True)

def show_analytics(subsidiaries_df, products_df):
    st.markdown('<h1 class="main-header">Analytics & Insights</h1>', unsafe_allow_html=True)
    
    # Data quality metrics
    st.markdown('<h3 class="section-header">Data Quality Metrics</h3>', unsafe_allow_html=True)
    
    col1, col2 = st.columns(2)
    
    with col1:
        st.markdown("**Subsidiaries Data Quality**")
        
        # Calculate data completeness
        subsidiaries_completeness = {
            'Company Name': (subsidiaries_df['COMPANY_NAME'].notna()).sum() / len(subsidiaries_df) * 100,
            'Description': (subsidiaries_df['DESCRIPTION'].notna()).sum() / len(subsidiaries_df) * 100,
            'Market Position': (subsidiaries_df['MARKET_POSITION'].notna()).sum() / len(subsidiaries_df) * 100,
            'Website URL': (subsidiaries_df['WEBSITE_URL'].notna() & (subsidiaries_df['WEBSITE_URL'] != '')).sum() / len(subsidiaries_df) * 100
        }
        
        completeness_df = pd.DataFrame(list(subsidiaries_completeness.items()), columns=['Field', 'Completeness'])
        
        fig_completeness = px.bar(
            completeness_df,
            x='Field',
            y='Completeness',
            title='Subsidiaries Data Completeness (%)',
            color='Completeness',
            color_continuous_scale='Blues'
        )
        fig_completeness.update_layout(height=300)
        st.plotly_chart(fig_completeness, use_container_width=True)
    
    with col2:
        st.markdown("**Products Data Quality**")
        
        # Calculate data completeness for products
        products_completeness = {
            'Product Name': (products_df['PRODUCT_SERVICE_NAME'].notna()).sum() / len(products_df) * 100,
            'Description': (products_df['DESCRIPTION'].notna()).sum() / len(products_df) * 100,
            'Target Market': (products_df['TARGET_MARKET'].notna()).sum() / len(products_df) * 100,
            'Product URL': (products_df['PRODUCT_URL'].notna() & (products_df['PRODUCT_URL'] != '')).sum() / len(products_df) * 100
        }
        
        products_completeness_df = pd.DataFrame(list(products_completeness.items()), columns=['Field', 'Completeness'])
        
        fig_products_completeness = px.bar(
            products_completeness_df,
            x='Field',
            y='Completeness',
            title='Products Data Completeness (%)',
            color='Completeness',
            color_continuous_scale='Blues'
        )
        fig_products_completeness.update_layout(height=300)
        st.plotly_chart(fig_products_completeness, use_container_width=True)
    
    # Cross-segment analysis
    st.markdown('<h3 class="section-header">Cross-Segment Analysis</h3>', unsafe_allow_html=True)
    
    # Create bubble chart showing relationship between subsidiaries and products
    segment_summary = subsidiaries_df.groupby('BUSINESS_SEGMENT').agg({
        'COMPANY_NAME': 'count'
    }).rename(columns={'COMPANY_NAME': 'Subsidiary_Count'})
    
    product_summary = products_df.groupby('BUSINESS_SEGMENT').agg({
        'PRODUCT_SERVICE_NAME': 'count',
        'PRODUCT_SERVICE_CATEGORY': 'nunique'
    }).rename(columns={
        'PRODUCT_SERVICE_NAME': 'Product_Count',
        'PRODUCT_SERVICE_CATEGORY': 'Category_Count'
    })
    
    combined_summary = segment_summary.join(product_summary, how='outer').fillna(0)
    combined_summary['Products_per_Subsidiary'] = combined_summary['Product_Count'] / combined_summary['Subsidiary_Count']
    combined_summary['Products_per_Subsidiary'] = combined_summary['Products_per_Subsidiary'].replace([np.inf], 0)
    
    fig_bubble = px.scatter(
        combined_summary.reset_index(),
        x='Subsidiary_Count',
        y='Product_Count',
        size='Category_Count',
        color='BUSINESS_SEGMENT',
        title='Business Segment Portfolio Analysis',
        labels={
            'Subsidiary_Count': 'Number of Subsidiaries',
            'Product_Count': 'Number of Products/Services',
            'Category_Count': 'Product Categories'
        },
        color_discrete_sequence=['#0066CC', '#003366', '#66B2FF', '#004499', '#0080FF', '#1177DD']
    )
    
    fig_bubble.update_layout(
        height=500,
        font=dict(size=12),
        title_font_size=16
    )
    st.plotly_chart(fig_bubble, use_container_width=True)
    
    # Summary statistics
    st.markdown('<h3 class="section-header">Summary Statistics</h3>', unsafe_allow_html=True)
    
    col1, col2 = st.columns(2)
    
    with col1:
        st.markdown("**Subsidiary Statistics**")
        st.dataframe(
            combined_summary[['Subsidiary_Count', 'Product_Count', 'Category_Count']].describe(),
            use_container_width=True
        )
    
    with col2:
        st.markdown("**Top Product Categories**")
        top_categories = products_df['PRODUCT_SERVICE_CATEGORY'].value_counts().head(10)
        st.dataframe(top_categories.to_frame().rename(columns={'PRODUCT_SERVICE_CATEGORY': 'Count'}))

# Main application
def main():
    st.sidebar.title("Roche Subsidiaries Dashboard")
    st.sidebar.markdown("---")
    
    page = st.sidebar.selectbox("Select Page", 
        ["Overview", "Subsidiaries", "Products & Services", "Business Segments", "Analytics"])
    
    try:
        subsidiaries_df = load_subsidiaries_data()
        products_df = load_products_services_data()
        
        # Route to appropriate page function
        if page == "Overview":
            show_overview(subsidiaries_df, products_df)
        elif page == "Subsidiaries":
            show_subsidiaries(subsidiaries_df)
        elif page == "Products & Services":
            show_products_services(products_df)
        elif page == "Business Segments":
            show_business_segments(subsidiaries_df, products_df)
        elif page == "Analytics":
            show_analytics(subsidiaries_df, products_df)
        
        # Sidebar info
        st.sidebar.markdown("---")
        st.sidebar.markdown("### About")
        st.sidebar.markdown("""
        This dashboard provides comprehensive analysis of Roche Group's subsidiary structure, 
        products, and services across all business segments.
        
        **Data Sources:**
        - Roche Annual Reports
        - Official Company Websites
        - Regulatory Filings
        
        **Last Updated:** January 2025
        """)
        
    except Exception as e:
        st.error(f"Error loading data: {str(e)}")
        st.info("Please ensure the Snowflake connection is properly configured and the database tables exist.")
        st.markdown("""
        **Troubleshooting:**
        1. Verify Snowflake connection settings
        2. Ensure database 'Roche_Demo' and schema 'Roche' exist
        3. Check that tables 'Subsidiaries' and 'Subsidiary_Products_Services' are populated
        4. Verify user permissions for the database and schema
        """)

if __name__ == "__main__":
    main() 