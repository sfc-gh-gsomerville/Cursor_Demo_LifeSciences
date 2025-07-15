-- Roche Group Subsidiary Products & Services Table Creation and Data Population
-- Use the Roche database and schema
USE DATABASE Roche_Demo;
USE SCHEMA Roche;

-- Create Subsidiary_Products_Services table
CREATE OR REPLACE TABLE Subsidiary_Products_Services (
    product_service_id INT AUTOINCREMENT PRIMARY KEY,
    subsidiary_name VARCHAR(100) NOT NULL,
    business_segment VARCHAR(50) NOT NULL,
    product_service_category VARCHAR(100) NOT NULL,
    product_service_name VARCHAR(200),
    description TEXT,
    target_market VARCHAR(200),
    key_features TEXT,
    product_url VARCHAR(300),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

-- Insert Roche Group product and service data
INSERT INTO Subsidiary_Products_Services (subsidiary_name, business_segment, product_service_category, product_service_name, description, target_market, key_features, product_url) VALUES

-- Pharmaceutical Products - Oncology
('Genentech Inc.', 'Pharmaceuticals', 'Oncology', 'Tecentriq (atezolizumab)', 'A cancer immunotherapy that works by blocking the PD-L1 protein, helping the immune system detect and fight cancer cells. Approved for multiple cancer types including lung, bladder, and breast cancers.', 'Oncology patients with PD-L1 positive tumors', 'PD-L1 inhibitor, immune checkpoint therapy, multiple cancer indications, companion diagnostic available', 'https://www.gene.com/medical-professionals/medicines/tecentriq'),

('Genentech Inc.', 'Pharmaceuticals', 'Oncology', 'Avastin (bevacizumab)', 'Anti-angiogenesis therapy that inhibits blood vessel formation in tumors, used to treat multiple cancer types including colorectal, lung, kidney, and brain cancers.', 'Multiple cancer types requiring anti-angiogenic therapy', 'VEGF inhibitor, anti-angiogenesis, established efficacy across multiple tumor types', 'https://www.gene.com/medical-professionals/medicines/avastin'),

('Genentech Inc.', 'Pharmaceuticals', 'Oncology', 'Herceptin (trastuzumab)', 'Targeted therapy for HER2-positive breast and gastric cancers, significantly improving outcomes for patients with HER2 overexpressing tumors through targeted antibody therapy.', 'HER2-positive breast and gastric cancer patients', 'HER2 targeting, targeted therapy, companion diagnostic required, established standard of care', 'https://www.gene.com/medical-professionals/medicines/herceptin'),

('Genentech Inc.', 'Pharmaceuticals', 'Oncology', 'Perjeta (pertuzumab)', 'HER2-targeted therapy used in combination with Herceptin and chemotherapy for HER2-positive breast cancer, providing dual HER2 blockade for enhanced efficacy.', 'HER2-positive breast cancer patients', 'Dual HER2 blockade, combination therapy, improved pathological complete response rates', 'https://www.gene.com/medical-professionals/medicines/perjeta'),

('Genentech Inc.', 'Pharmaceuticals', 'Oncology', 'Polivy (polatuzumab vedotin)', 'Antibody-drug conjugate for the treatment of diffuse large B-cell lymphoma, combining targeted antibody delivery with potent cytotoxic payload for enhanced cancer cell killing.', 'Relapsed or refractory diffuse large B-cell lymphoma patients', 'Antibody-drug conjugate, CD79b targeting, potent cytotoxic payload, lymphoma treatment', 'https://www.gene.com/medical-professionals/medicines/polivy'),

-- Pharmaceutical Products - Neuroscience
('F. Hoffmann-La Roche Ltd', 'Pharmaceuticals', 'Neuroscience', 'Ocrevus (ocrelizumab)', 'The first and only therapy approved for both relapsing forms of multiple sclerosis and primary progressive multiple sclerosis, targeting CD20-positive B cells that contribute to disease progression.', 'Multiple sclerosis patients with relapsing or primary progressive forms', 'CD20 B-cell targeting, twice-yearly infusion, both RRMS and PPMS approved, disease progression reduction', 'https://www.ocrevus.com'),

('F. Hoffmann-La Roche Ltd', 'Pharmaceuticals', 'Neuroscience', 'Evrysdi (risdiplam)', 'First and only oral treatment for spinal muscular atrophy (SMA) that increases SMN protein production, approved for patients two months of age and older with SMA.', 'Spinal muscular atrophy patients of all ages', 'Oral SMN2 splicing modifier, increases SMN protein, broad age indication, daily oral dosing', 'https://www.evrysdi.com'),

-- Pharmaceutical Products - Ophthalmology
('Genentech Inc.', 'Pharmaceuticals', 'Ophthalmology', 'Vabysmo (faricimab)', 'First bispecific antibody for retinal diseases that inhibits both VEGF-A and Ang-2 pathways, treating wet age-related macular degeneration, diabetic macular edema, and retinal vein occlusion.', 'Patients with wet AMD, diabetic macular edema, and retinal vein occlusion', 'Bispecific antibody, dual pathway inhibition (VEGF-A and Ang-2), extended dosing intervals', 'https://www.gene.com/medical-professionals/medicines/vabysmo'),

('Genentech Inc.', 'Pharmaceuticals', 'Ophthalmology', 'Lucentis (ranibizumab)', 'Anti-VEGF therapy for the treatment of various retinal diseases including wet age-related macular degeneration and diabetic macular edema, designed specifically for ocular use.', 'Patients with wet AMD, diabetic macular edema, and other retinal diseases', 'Anti-VEGF, specifically designed for eye injection, established efficacy in retinal diseases', 'https://www.gene.com/medical-professionals/medicines/lucentis'),

-- Pharmaceutical Products - Hematology
('F. Hoffmann-La Roche Ltd', 'Pharmaceuticals', 'Hematology', 'Hemlibra (emicizumab)', 'Prophylactic treatment for hemophilia A that mimics the function of missing clotting factor VIII, reducing bleeding episodes in patients with hemophilia A with or without factor VIII inhibitors.', 'Hemophilia A patients with or without factor VIII inhibitors', 'Factor VIII mimetic, subcutaneous administration, prophylactic treatment, inhibitor and non-inhibitor patients', 'https://www.hemlibra.com'),

('F. Hoffmann-La Roche Ltd', 'Pharmaceuticals', 'Hematology', 'MabThera/Rituxan (rituximab)', 'CD20-targeted monoclonal antibody for B-cell non-Hodgkin lymphomas, chronic lymphocytic leukemia, and certain autoimmune conditions including rheumatoid arthritis.', 'B-cell lymphomas, CLL, and autoimmune disease patients', 'CD20 B-cell targeting, multiple hematologic and autoimmune indications, established standard of care', 'https://www.rituxan.com'),

-- Diagnostic Products - Core Lab
('Roche Diagnostics Corporation', 'Diagnostics', 'Core Lab', 'cobas pro integrated solutions', 'Fully automated, high-throughput laboratory systems that integrate immunoassays, clinical chemistry, and ion-selective electrode testing in a single platform for maximum efficiency.', 'High-volume clinical laboratories and hospital systems', 'Integrated automation, high throughput, multiple testing methodologies, comprehensive menu', 'https://diagnostics.roche.com/us/en/products/systems/cobas-pro-integrated-solutions.html'),

('Roche Diagnostics GmbH', 'Diagnostics', 'Core Lab', 'Elecsys immunoassay systems', 'Leading electrochemiluminescence immunoassay platform providing highly sensitive and specific testing for cardiac markers, cancer biomarkers, infectious diseases, and hormones.', 'Clinical laboratories requiring high-quality immunoassay testing', 'Electrochemiluminescence technology, broad test menu, high sensitivity and specificity, rapid results', 'https://diagnostics.roche.com/global/en/products/systems/elecsys-systems.html'),

-- Diagnostic Products - Molecular Lab
('Roche Diagnostics Corporation', 'Diagnostics', 'Molecular Lab', 'cobas 6800/8800 systems', 'High-throughput molecular diagnostic systems for detection of infectious diseases, genetic variations, and viral load monitoring with automated sample processing and result reporting.', 'Molecular laboratories requiring high-throughput PCR testing', 'Automated PCR processing, high throughput, infectious disease testing, viral load monitoring', 'https://diagnostics.roche.com/us/en/products/systems/cobas-6800-8800.html'),

('Foundation Medicine Inc.', 'Diagnostics', 'Molecular Lab', 'FoundationOne CDx', 'Comprehensive genomic profiling assay that analyzes 324 genes to identify actionable mutations in solid tumors, serving as a companion diagnostic for multiple targeted therapies.', 'Oncologists treating solid tumor patients requiring genomic profiling', 'Comprehensive genomic profiling, 324 gene panel, companion diagnostic, actionable mutations identification', 'https://www.foundationmedicine.com/test/foundationone-cdx'),

-- Diagnostic Products - Pathology Lab
('Roche Diagnostics Corporation', 'Diagnostics', 'Pathology Lab', 'VENTANA BenchMark systems', 'Automated immunohistochemistry and in situ hybridization staining systems for tissue-based diagnostics, providing standardized and reproducible results for cancer diagnosis.', 'Pathology laboratories and cancer centers', 'Automated staining, standardized protocols, comprehensive antibody menu, cancer diagnostics', 'https://diagnostics.roche.com/us/en/products/systems/ventana-benchmark-systems.html'),

('Roche Diagnostics Corporation', 'Diagnostics', 'Pathology Lab', 'Companion Diagnostics Portfolio', 'Comprehensive portfolio of companion diagnostic tests that identify patients most likely to benefit from specific targeted therapies, enabling personalized treatment decisions.', 'Pathologists and oncologists requiring companion diagnostic testing', 'Personalized medicine, therapy selection, regulatory approved, multiple cancer types', 'https://diagnostics.roche.com/us/en/products/companion-diagnostics.html'),

-- Diagnostic Products - Near Patient Care
('Roche Diagnostics Corporation', 'Diagnostics', 'Near Patient Care', 'Accu-Chek diabetes care systems', 'Comprehensive diabetes management solutions including blood glucose meters, continuous glucose monitoring, and insulin delivery systems for optimal diabetes control.', 'Diabetes patients requiring glucose monitoring and management', 'Blood glucose monitoring, continuous glucose monitoring, insulin pumps, diabetes management apps', 'https://www.accu-chek.com'),

('Roche Diagnostics Corporation', 'Diagnostics', 'Near Patient Care', 'cobas Liat system', 'Point-of-care PCR testing platform providing rapid, laboratory-quality molecular diagnostic results in near-patient settings for infectious diseases and other conditions.', 'Point-of-care settings requiring rapid molecular testing', 'Point-of-care PCR, rapid results, easy operation, infectious disease testing', 'https://diagnostics.roche.com/us/en/products/systems/cobas-liat.html'),

-- Digital Health Solutions
('Flatiron Health', 'Digital Health', 'Healthcare Technology', 'OncoEMR', 'Specialized electronic health record system designed specifically for oncology practices, streamlining clinical workflows and improving cancer care coordination and documentation.', 'Oncology practices and cancer centers', 'Oncology-specific EHR, clinical workflow optimization, treatment planning, patient management', 'https://flatiron.com/oncoemr'),

('Flatiron Health', 'Digital Health', 'Real-World Evidence', 'Real-World Evidence Platform', 'Advanced analytics platform that generates insights from real-world clinical data to support drug development, regulatory submissions, and clinical decision-making in oncology.', 'Pharmaceutical companies and regulatory agencies', 'Real-world data analytics, drug development support, regulatory evidence, clinical insights', 'https://flatiron.com/real-world-evidence'),

-- Research & Development Services
('Genentech Inc.', 'Pharmaceuticals', 'Research Services', 'Biomarker Development', 'Advanced biomarker discovery and development services supporting precision medicine initiatives, companion diagnostic development, and personalized therapy selection.', 'Pharmaceutical companies and research institutions', 'Biomarker discovery, companion diagnostics, precision medicine, regulatory support', 'https://www.gene.com/medical-professionals/biomarkers'),

('Roche Palo Alto', 'Research & Development', 'Innovation Services', 'Early-Stage Research', 'Cutting-edge research in emerging therapeutic areas including novel drug targets, innovative delivery systems, and breakthrough therapeutic approaches.', 'Internal R&D programs and external collaborations', 'Novel target identification, innovative therapeutics, technology platforms, academic partnerships', 'https://www.roche.com/research_and_development'),

-- Regional Commercial Services
('Chugai Pharmaceutical Co. Ltd.', 'Pharmaceuticals', 'Commercial Services', 'Japan Market Access', 'Comprehensive market access and commercialization services for innovative pharmaceuticals in the Japanese market, including regulatory affairs and reimbursement strategy.', 'Pharmaceutical products requiring Japanese market entry', 'Regulatory expertise, reimbursement strategy, commercial excellence, local market knowledge', 'https://www.chugai-pharm.co.jp'),

('Roche (China) Holding Ltd.', 'Regional Operations', 'Commercial Services', 'China Innovation Center', 'Comprehensive innovation hub providing research, development, and commercialization support for the rapidly growing Chinese healthcare market.', 'Healthcare innovations targeting Chinese patients', 'Local innovation, regulatory support, market development, clinical research capabilities', 'https://www.roche.com.cn');

-- Display summary of inserted product data
SELECT 
    business_segment,
    product_service_category,
    COUNT(*) as product_count,
    LISTAGG(DISTINCT subsidiary_name, ', ') as subsidiaries
FROM Subsidiary_Products_Services 
GROUP BY business_segment, product_service_category 
ORDER BY business_segment, product_count DESC; 