-- Roche Group Subsidiaries Table Creation and Data Population
-- Use the Roche database and schema
USE DATABASE Roche_Demo;
USE SCHEMA Roche;

-- Create Subsidiaries table
CREATE OR REPLACE TABLE Subsidiaries (
    subsidiary_id INT AUTOINCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    business_segment VARCHAR(50) NOT NULL,
    description TEXT,
    key_products_services TEXT,
    market_position VARCHAR(200),
    website_url VARCHAR(200),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

-- Insert Roche Group subsidiary data
INSERT INTO Subsidiaries (company_name, business_segment, description, key_products_services, market_position, website_url) VALUES

-- Core Swiss Operations
('F. Hoffmann-La Roche Ltd', 'Corporate Headquarters', 'The parent company and headquarters of the Roche Group, founded in 1896 in Basel, Switzerland. Serves as the central management and strategic direction entity for all global operations, overseeing both Pharmaceuticals and Diagnostics divisions worldwide.', 'Corporate governance, strategic planning, global coordination, financial management, regulatory oversight', 'Parent company of the world''s largest biotechnology company and global leader in in-vitro diagnostics', 'https://www.roche.com'),

-- Major US Operations
('Genentech Inc.', 'Pharmaceuticals', 'A wholly-owned subsidiary of Roche, Genentech is a leading biotechnology company founded in 1976 and acquired by Roche in 2009. Based in South San Francisco, it serves as Roche''s primary innovation engine for biotechnology medicines in the United States, focusing on oncology, immunology, and neuroscience.', 'Biotechnology medicines, cancer immunotherapy, targeted therapies, personalized medicine, clinical research', 'Leading biotechnology company and pioneer in personalized healthcare in the United States', 'https://www.gene.com'),

('Roche Diagnostics Corporation', 'Diagnostics', 'The US subsidiary of Roche Diagnostics, headquartered in Indianapolis, providing comprehensive diagnostic solutions across laboratory medicine, point-of-care testing, and digital health. Serves as the primary diagnostics operation for the North American market with extensive manufacturing and R&D capabilities.', 'Laboratory diagnostics, point-of-care testing, molecular diagnostics, immunoassays, clinical chemistry, diabetes care', 'Leading provider of in-vitro diagnostics in North America with comprehensive testing solutions', 'https://diagnostics.roche.com'),

('Roche Holdings Inc.', 'Finance & Operations', 'The US holding company for Roche Group''s American operations, managing financial activities and serving as the primary entity for US-based pharmaceutical and diagnostic operations. Coordinates business activities across all US subsidiaries and affiliates.', 'Financial management, operational coordination, regulatory compliance, business development', 'Central financial and operational hub for Roche''s extensive US business operations', 'https://www.roche.com'),

-- Japanese Operations
('Chugai Pharmaceutical Co. Ltd.', 'Pharmaceuticals', 'A majority-owned subsidiary of Roche (62.6% ownership), Chugai is a leading pharmaceutical company in Japan founded in 1925. It maintains operational independence while leveraging Roche''s global pipeline and contributing innovative medicines particularly in oncology and autoimmune diseases.', 'Oncology medicines, immunology treatments, bone and joint diseases, kidney diseases, advanced biologics', 'Leading pharmaceutical company in Japan with strong presence in oncology and specialty medicines', 'https://www.chugai-pharm.co.jp'),

-- European Operations
('Roche Pharma AG', 'Pharmaceuticals', 'Roche''s primary pharmaceutical subsidiary in Germany, serving as a key operational center for European pharmaceutical activities. Manages manufacturing, distribution, and commercial operations for pharmaceutical products across German-speaking markets and coordination for broader European activities.', 'Pharmaceutical manufacturing, commercial operations, regulatory affairs, market access, clinical research', 'Leading pharmaceutical company in Germany and key European operational center', 'https://www.roche.de'),

('Roche Diagnostics GmbH', 'Diagnostics', 'The German subsidiary of Roche Diagnostics headquartered in Mannheim, serving as the primary European hub for diagnostic operations. Major manufacturing and R&D center for laboratory instruments, reagents, and diagnostic solutions serving European and global markets.', 'Laboratory automation, molecular diagnostics, tissue diagnostics, diabetes care solutions, clinical chemistry', 'Leading diagnostics provider in Europe with major manufacturing and innovation capabilities', 'https://www.roche.de'),

('Roche Products Limited', 'Pharmaceuticals', 'Roche''s pharmaceutical subsidiary in the United Kingdom, managing commercial operations, regulatory affairs, and market access across the UK and Ireland. Plays a key role in European pharmaceutical strategy and serves as an important regulatory pathway for European approvals.', 'Pharmaceutical commercialization, regulatory affairs, market access, clinical operations, medical affairs', 'Leading pharmaceutical company in the UK with strong regulatory and commercial capabilities', 'https://www.roche.co.uk'),

-- Innovation and Technology Subsidiaries
('Foundation Medicine Inc.', 'Diagnostics', 'A Roche subsidiary specializing in genomic profiling for cancer care, acquired in 2018. Based in Cambridge, Massachusetts, Foundation Medicine provides comprehensive genomic profiling to inform personalized treatment decisions for cancer patients and supports pharmaceutical development.', 'Comprehensive genomic profiling, companion diagnostics, cancer genomics, precision medicine, biomarker analysis', 'Leading provider of comprehensive genomic profiling for cancer care and precision medicine', 'https://www.foundationmedicine.com'),

('Flatiron Health', 'Digital Health', 'A Roche subsidiary acquired in 2018, specializing in oncology-focused electronic health records and real-world evidence generation. Based in New York, it provides technology solutions and data analytics to improve cancer care and accelerate research through real-world data insights.', 'Electronic health records, real-world evidence, data analytics, clinical research platforms, healthcare technology', 'Leading provider of oncology-focused health technology and real-world evidence solutions', 'https://flatiron.com'),

-- Manufacturing and Specialized Operations
('Roche Glycart AG', 'Pharmaceuticals', 'A Swiss subsidiary focused on antibody engineering and glycoengineering technologies. Acquired by Roche in 2005, Glycart specializes in developing enhanced antibody therapeutics with improved efficacy through proprietary glycoengineering platforms.', 'Antibody engineering, glycoengineering, enhanced antibody therapeutics, proprietary technology platforms', 'Leading antibody engineering company with proprietary glycoengineering technology', 'https://www.roche.com'),

('Roche Palo Alto', 'Research & Development', 'Roche''s research and development facility in Palo Alto, California, focusing on early-stage research and innovation in multiple therapeutic areas. Serves as an important innovation hub connecting with Silicon Valley''s biotech ecosystem and academic institutions.', 'Early-stage research, innovation, therapeutic discovery, academic collaborations, technology partnerships', 'Strategic R&D facility leveraging Silicon Valley innovation ecosystem', 'https://www.roche.com'),

-- Asia-Pacific Operations  
('Roche (China) Holding Ltd.', 'Regional Operations', 'Roche''s primary holding company for Chinese operations, coordinating both pharmaceutical and diagnostic activities across mainland China. Manages one of Roche''s fastest-growing markets with significant manufacturing, commercial, and R&D investments including the China Innovation Center.', 'Market coordination, regulatory affairs, manufacturing oversight, commercial operations, innovation management', 'Leading international healthcare company in China with comprehensive pharmaceutical and diagnostic presence', 'https://www.roche.com.cn'),

('Roche Diagnostics Asia Pacific Pte Ltd', 'Diagnostics', 'Regional headquarters for Roche Diagnostics in Asia-Pacific, based in Singapore. Coordinates diagnostic operations across the diverse Asia-Pacific region, managing commercial activities, regulatory affairs, and market development for laboratory and point-of-care diagnostics.', 'Regional coordination, market development, regulatory affairs, commercial operations, technical support', 'Leading diagnostics provider in Asia-Pacific region with comprehensive market coverage', 'https://www.roche.com'),

-- Latin American Operations
('Roche Farma S.A.', 'Pharmaceuticals', 'Roche''s pharmaceutical subsidiary serving Spanish-speaking markets in Latin America, headquartered in Spain but coordinating regional Latin American activities. Manages market access, regulatory affairs, and commercial operations for innovative pharmaceutical products.', 'Pharmaceutical commercialization, regulatory affairs, market access, medical affairs, regional coordination', 'Leading pharmaceutical company in Spanish-speaking markets with strong regional presence', 'https://www.roche.es'),

-- Canadian Operations
('Hoffmann-La Roche Limited', 'Pharmaceuticals', 'Roche''s pharmaceutical subsidiary in Canada, managing commercial operations and regulatory affairs for the Canadian market. Provides innovative pharmaceutical products and maintains strong relationships with Canadian healthcare systems and regulatory authorities.', 'Pharmaceutical commercialization, regulatory affairs, market access, medical affairs, clinical research', 'Leading pharmaceutical company in Canada with comprehensive product portfolio', 'https://www.rochecanada.com');

-- Display summary of inserted data
SELECT 
    business_segment,
    COUNT(*) as subsidiary_count,
    LISTAGG(company_name, ', ') as companies
FROM Subsidiaries 
GROUP BY business_segment 
ORDER BY subsidiary_count DESC; 