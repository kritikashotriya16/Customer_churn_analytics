# Customer_churn_analytics
A subscription/e-commerce company is losing revenue to silent churn. Marketing is spending equally on all customers. My analysis segments customers by behavior to reveal who is about to leave, who is loyal, and where retention spend should actually go — potentially saving 15–20% of customer acquisition cost.

# Overview 
This project simulates a real-world e-commerce/subscription business problem where companies lose revenue because customer retention efforts are not targeted effectively. Instead of treating all customers equally, this solution uses RFM (Recency, Frequency, Monetary) analysis, SQL window functions, CTEs, and cohort-style segmentation logic to identify:
High-value loyal customers
Customers at risk of churn
Potential loyalists
Lost customers
New customers needing engagement

The final output is transformed into an interactive Power BI dashboard that enables business stakeholders to prioritize retention campaigns based on customer behavior. 

# Business Problem
Subscription and e-commerce businesses often experience silent churn:

Customers gradually stop purchasing before officially leaving.
This creates several business challenges:

Marketing teams spend retention budgets inefficiently
High-value customers leave unnoticed
Acquisition costs increase because existing customers are not retained
Revenue forecasting becomes unstable

The goal of this project is to build a data-driven churn segmentation engine that:

Detects churn risk early
Segments customers using behavioral analytics
Prioritizes retention actions
Helps reduce unnecessary acquisition spend

# Project Objectives
This project focuses on:

Building a scalable RFM segmentation model
Using SQL CTEs and window functions for advanced analytics
Creating customer risk scores
Developing actionable business segments
Visualizing customer behavior in Power BI
Producing stakeholder-ready business insights 

# Tech Stack

**Technology**	                                      **Purpose**
PostgreSQL / BigQuery	                          Data querying and transformation
SQL	                                            Data modeling and analytics
Power BI	                                      Dashboard creation and visualization
Window Functions	                              Customer ranking and scoring
CTEs	                                          Layered query structuring
CASE Logic	                                    Segment classification
RFM Analysis	                                  Customer behavior modeling 

# Dataset Schema
The project uses three relational tables.

1. **customers**
Contains customer demographic and subscription details.

**Column**	                                                **Description**
customer_id	                                     Unique customer identifier
signup_date	                                     Customer registration date
region	                                         Geographic region
plan_type	                                       Subscription plan
email	                                           Customer email
age_band	                                       Customer age category

2. **orders**
Stores customer transaction history.

**Column**                                                    **Description**
order_id	                                        Unique order identifier
customer_id	                                      Linked customer
order_date	                                      Purchase date
order_value	                                      Total order value
status	                                          Order completion status

3. **products**
Contains product-level order information.

**Column**                                                       **Description**
line_id	                                           Unique row identifier
order_id	                                         Linked order
category	                                         Product category
unit_price	                                       Product price
quantity	                                         Quantity purchased


# Project Workflow
The SQL project is divided into four analytical layers.

**Layer 1 — RFM Base Calculation**
The first layer calculates core customer metrics:

**Metrics Generated**
Recency: Number of days since the customer's latest purchase.
Frequency: Total number of completed orders.
Monetary: Total customer spending.
Average Order Value: Average spend per transaction.

**SQL Concepts Used**
Aggregations
GROUP BY
LEFT JOIN
Date calculations
Filtering completed orders

**Business Value**
This layer creates the behavioral foundation for churn prediction.
Customers with:
High recency = inactive customers
Low frequency = weak engagement
Low monetary value = low revenue contribution
are more likely to churn.

**Layer 2 — RFM Scoring Using Window Functions**
The second layer transforms raw customer metrics into percentile-based scores.

**Window Functions Used**
NTILE(4) OVER(ORDER BY recency_days DESC)
NTILE(4) OVER(ORDER BY frequency ASC)
NTILE(4) OVER(ORDER BY monetary_value ASC)

Why NTILE()?
NTILE divides customers into quartiles:

Score	Meaning
1:	Lowest-performing customers
4:	Highest-performing customers

This standardizes customer behavior into comparable rankings.

Additional Outputs:
R Score
F Score
M Score
RFM Total Score
RFM Cell Combination

Example:
444 = Best Customers
111 = Highest Risk Customers

**Business Value**
This layer allows stakeholders to quickly compare customers using behavioral rankings instead of raw metrics.

**Layer 3 — Customer Segmentation**
The third layer converts numerical scores into business-friendly customer segments.

**Segments Created**

**Segment**                                                  **Meaning**
Champion	                                                Highly engaged high-value customers
Loyal Customer	                                          Consistent repeat buyers
Potential Loyalist	                                      Customers showing growth potential
At Risk	                                                  Customers likely to churn soon
Lost	                                                    Inactive customers
New Customer	                                            Recently acquired customers
Needs Attention	                                          Medium engagement customers

**SQL Technique Used**
CASE WHEN
Business rules were implemented using conditional logic.

Example:
WHEN rfm_total >= 11 THEN 'Champion'
WHEN rfm_total >= 9 THEN 'Loyal Customer'

**Business Value**
This transforms technical analytics into strategic decision-making categories.
Instead of showing executives numerical scores, the dashboard communicates:

1. Who needs retention campaigns
2. Which customers are most valuable
3. Where marketing spend should go

**Layer 4 — Churn Risk Prioritization**
The final SQL layer creates a ranked churn-risk table.

**Output Includes**
Customer ID
Plan Type
Region
RFM Scores
Segment Labels
Churn Risk Scores
Total Spend
Frequency Metrics
Churn Risk Logic

**Customers are prioritized using:**
Recency behavior
Spending patterns
Engagement frequency
Segment classification
Business Outcome

This creates an export-ready analytics table that can directly feed:

Power BI
Tableau
Retention Campaigns
CRM workflows
Marketing automation systems
SQL Concepts Demonstrated
Common Table Expressions (CTEs)

Used to create modular multi-layer analytics pipelines.

**Benefits:**
Improved readability
Easier debugging
Scalable query architecture
Window Functions
Used for ranking and percentile scoring.

**Functions used:**
NTILE()
Aggregations

**Used to calculate:**
Total revenue
Order count
Average order value
Customer activity
CASE Logic

**Used for:**
Customer segmentation
Churn risk categorization
Business-rule implementation

 
# Power BI Dashboard
The SQL output was connected to Power BI for visualization and stakeholder reporting.

**Dashboard Goals**
The dashboard was designed to help business teams:

Monitor churn risk
Track customer segments
Analyze customer revenue contribution
Prioritize retention efforts
Identify high-value customers

**Key Dashboard Visualizations**

**KPI Cards**
Tracks:

Total Customers
Total Revenue
Average Order Value
High-Risk Customers
Retention Priority Count

**Customer Segment Distribution**
Visualizes:

Champion customers
Loyal customers
At-risk customers
Lost customers

Used to understand overall customer health.

**Churn Risk Analysis**
Displays:

High-risk customer concentration
Retention priority groups
Risk score distribution

Helps marketing teams prioritize intervention.

**Revenue Contribution by Segment**
Shows which customer segments generate maximum revenue.

Business insight:
A small percentage of loyal customers often contribute the majority of revenue.

**Regional Customer Analysis**
Analyzes:
Revenue by region
Customer concentration
Churn trends geographically
Plan Type Performance

Compares:
Basic
Premium
Enterprise customers

Measures:
Revenue generation
Customer loyalty
Churn tendency


**Key Business Insights**
Some major insights generated from the analysis:

Loyal and Champion customers contribute the highest revenue share
At-risk customers show declining purchase frequency
Recently inactive customers require immediate engagement campaigns
Enterprise users have higher monetary contribution
New customers require onboarding retention strategies

**Potential Business Impact**
Implementing this segmentation framework can help businesses:

Improve retention strategy precision
Reduce customer acquisition costs
Increase customer lifetime value (CLV)
Improve marketing ROI
Build proactive churn prevention systems

**Estimated impact:**

15–20% reduction in unnecessary acquisition spending
Better allocation of retention budgets
Improved customer engagement targeting

**Some major insights generated from the analysis:**

Loyal and Champion customers contribute the highest revenue share
At-risk customers show declining purchase frequency
Recently inactive customers require immediate engagement campaigns
Enterprise users have higher monetary contribution
New customers require onboarding retention strategies
Potential Business Impact

Implementing this segmentation framework can help businesses:

Improve retention strategy precision
Reduce customer acquisition costs
Increase customer lifetime value (CLV)
Improve marketing ROI
Build proactive churn prevention systems

Estimated impact:

15–20% reduction in unnecessary acquisition spending
Better allocation of retention budgets
Improved customer engagement targeting


# Project Deliverables

**SQL Deliverables**
Database schema creation
Data insertion scripts
RFM modeling queries
Churn segmentation logic
Final risk-prioritized output table

**Power BI Deliverables**
Interactive dashboard
Customer segmentation visuals
Churn risk analytics
Executive-level KPIs
Retention insights


# Conclusion
This project demonstrates how SQL analytics and Power BI visualization can be combined to create a practical customer retention solution.
By transforming raw transactional data into customer intelligence, businesses can move from reactive decision-making to proactive retention strategy.

The final solution provides:

Actionable churn insights
Customer prioritization
Revenue-focused segmentation
Executive-ready reporting
Scalable analytics architecture
