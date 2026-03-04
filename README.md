# Smart Credit: Automated Rule-Based Lending Risk Segmentation Model
A rule-based credit decision engine built in Excel using VBA to automate loan evaluations, risk segmentation, and operational efficiency analysis through interactive dashboards.
## 📊 Project Overview
Smart Credit is a rule-based loan decision and risk segmentation model developed to simulate an automated credit evaluation process.

The project integrates VBA macros, structured decision logic, and financial risk metrics (Credit Score, Debt Exposure, and DTI Ratio) to classify loan applications into Approved, Refused, or Revision categories.

An interactive dashboard was built using Pivot Tables and dynamic segmentation tools to analyze approval distribution, debt exposure by rule category, and borrower risk patterns.
## 🏦 Business Problem
FINANZIA faces operational inefficiencies due to high manual loan review rates and inconsistent credit evaluation criteria. Additionally, relying solely on credit score does not fully capture borrower risk, as debt exposure and DTI levels significantly impact financial stability.

A structured, automated decision model is required to improve efficiency, standardize evaluations, and maintain disciplined credit risk management.

How can we design and implement an automated loan evaluation model in Excel that integrates credit score, debt exposure, and DTI metrics to optimize decision-making while preserving portfolio stability?

## Project Diagram 
<img width="1536" height="1024" alt="Project Diagram (3)" src="https://github.com/user-attachments/assets/e96a72f6-a1ca-46c2-8810-3dc2d57d026f" />
## 🧠 Methodology
1. Data Ingestion Layer
Raw client application files (CSV/Excel) are imported into the system and standardized into structured tables. Initial exploratory data analysis (EDA) is performed to validate data integrity, formats, and completeness.

2. Data Structuring & Cleaning
Data is converted into Excel Tables to ensure dynamic range management. Validation rules and automated formatting are applied to prepare the dataset for processing.

3. VBA Automation Layer
Custom VBA macros automate:
New record detection and insertion
Duplicate control via unique ID validation
Rule execution and structured evaluation
Data standardization and formatting
This layer simulates a lightweight ETL and processing engine within Excel.

4. Rule-Based Decision Engine
A structured rule logic framework evaluates each loan application based on:
Credit Score thresholds
Debt exposure
Years of employment
Age conditions
Applications are automatically classified into:
Approved
Refused
Revision
Each decision is supported by a corresponding Rule Flag for risk segmentation transparency.

5. Risk Segmentation & Client Lookup
A dynamic lookup interface allows individual client review, displaying:
Decision outcome
Risk category
Key financial indicators
This enables case-level analysis and compliance validation.

6. KPI Aggregation & Dashboard Analytics
Pivot Tables aggregate portfolio-level metrics including:
Approval rate
Average DTI ratio
Debt exposure by rule category
Risk distribution patterns
An interactive dashboard provides executive-level insights through dynamic visualizations.

## 🛠 Skills & Tools Applied
Technical Skills
Advanced Microsoft Excel
VBA Automation & Macro Development
Rule-Based Logic Design
Data Cleaning & Structuring
Risk Segmentation Modeling
KPI Design & Dashboard Development
Ad-hoc Business Analysis

Analytical Skills
Credit Risk Analysis
Debt-to-Income (DTI) Evaluation
Portfolio Performance Monitoring
Operational Efficiency Assessment
Logical Framework Design

Tools
Microsoft Excel (Advanced)
VBA (Visual Basic for Applications)
Pivot Tables & Dynamic Charts
XLOOKUP & Advanced Formulas
Structured Tables & Data Validation
## Final Report
file:///C:/Users/paubr/OneDrive/Escritorio/DATA%20ANALYST/projects%20portafolio/excel%20project/excel_loan_FINANZIA/Final%20report.pdf

## Dashboard
<img width="1129" height="483" alt="dashboard" src="https://github.com/user-attachments/assets/c4f94053-74df-4737-9dd2-d3f09dbc6710" />

## 📊 Results
14.80% Approved
34.00% Refused
51.20% Revision
The high concentration in the Revision segment reflects a conservative risk framework and partial dependency on conditional review.
Approved applicants maintain a low average DTI of 11.76%, confirming disciplined credit selection. Debt exposure is primarily concentrated within non-approved categories, particularly under Other Risk Factors.
📌 Insight:
A strong credit score alone is not sufficient — debt levels and DTI remain critical drivers of risk segmentation.

## 🚀 Next Steps & Recommendations
Analyze the Revision segment to identify near-approval profiles.
Refine DTI and debt thresholds to improve segmentation precision.
Gradually enhance automation to reduce manual review dependency.
Continuously monitor portfolio performance to validate risk limits.




