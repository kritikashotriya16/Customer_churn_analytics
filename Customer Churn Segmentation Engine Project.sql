
## PART-1 DATABASE SCHEMA

CREATE table customers (
customer_id INT PRIMARY KEY,
signup_date DATE,
region VARCHAR(50),
plan_type VARCHAR(20),
email VARCHAR(120),
age_band VARCHAR(20) );

CREATE table orders (
order_id INT PRIMARY KEY,
customer_id INT REFERENCES customers(customer_id),
order_date DATE,
order_value DECIMAL(10,2),
status VARCHAR(20) );

CREATE table products (
line_id INT PRIMARY KEY,
order_id INT REFERENCES orders(order_id),
category VARCHAR(50),
unit_price DECIMAL(10,2),
quantity INT );   

INSERT INTO customers 
(customer_id, signup_date, region, plan_type, email, age_band) 
VALUES 
(1001, '2022-03-15', 'North',  'premium',    'aisha.k@email.com',    '25-34'),
(1002, '2021-11-20', 'West',   'enterprise', 'rohit.m@email.com',    '35-44'),
(1003, '2022-07-08', 'South',  'premium',    'priya.s@email.com',    '25-34'),
(1004, '2021-05-30', 'East',   'enterprise', 'vikram.n@email.com',   '35-44'),
(1005, '2022-09-12', 'North',  'premium',    'meera.p@email.com',    '25-34'),
(1006, '2023-01-04', 'West',   'basic',      'arjun.v@email.com',    '18-24'),
(1007, '2022-06-22', 'South',  'premium',    'sunita.r@email.com',   '45+'  ),
(1008, '2023-03-17', 'East',   'basic',      'deepak.g@email.com',   '35-44'),
(1009, '2021-08-01', 'North',  'premium',    'kavita.b@email.com',   '35-44'),
(1010, '2022-02-14', 'West',   'enterprise', 'sanjay.t@email.com',   '45+'  ),
(1011, '2021-12-05', 'South',  'premium',    'nisha.c@email.com',    '25-34'),
(1012, '2022-04-19', 'East',   'enterprise', 'rahul.d@email.com',    '35-44'),
(1013, '2020-06-10', 'North',  'enterprise', 'anita.sh@email.com',   '45+'  ),
(1014, '2021-03-25', 'West',   'premium',    'manish.j@email.com',   '35-44'),
(1015, '2020-11-18', 'South',  'enterprise', 'pooja.k@email.com',    '25-34'),
(1016, '2025-01-03', 'North',  'basic',      'ravi.m@email.com',     '18-24'),
(1017, '2025-02-11', 'East',   'basic',      'sneha.p@email.com',    '18-24'),
(1018, '2024-12-20', 'West',   'basic',      'karan.l@email.com',    '18-24'),
(1019, '2025-01-28', 'South',  'premium',    'divya.r@email.com',    '25-34'),
(1020, '2025-03-05', 'North',  'basic',      'amit.s@email.com',     '18-24'); 


INSERT INTO orders(order_id, customer_id, order_date, order_value, status)
VALUES
(2001, 1001, '2025-04-10', 8500.00,  'completed'),
(2002, 1001, '2025-03-01', 7200.00,  'completed'),
(2003, 1001, '2025-01-15', 9100.00,  'completed'),
(2004, 1001, '2024-11-20', 6800.00,  'completed'),
(2005, 1002, '2025-04-25', 15000.00, 'completed'),
(2006, 1002, '2025-02-18', 12500.00, 'completed'),
(2007, 1002, '2024-12-05', 11000.00, 'completed'),
(2008, 1003, '2025-04-18', 5400.00,  'completed'),
(2009, 1003, '2025-03-22', 4900.00,  'completed'),
(2010, 1004, '2025-04-30', 18200.00, 'completed'),
(2011, 1005, '2025-03-10', 3200.00,  'completed'),
(2012, 1005, '2025-01-05', 2900.00,  'completed'),
(2013, 1006, '2025-02-28', 1800.00,  'completed'),
(2014, 1006, '2024-12-14', 2100.00,  'completed'),
(2015, 1007, '2025-03-05', 4500.00,  'completed'),
(2016, 1008, '2025-04-02', 2200.00,  'completed'),
(2017, 1009, '2024-12-20', 6700.00,  'completed'),
(2018, 1009, '2024-10-08', 5900.00,  'completed'),
(2019, 1009, '2024-07-15', 7200.00,  'completed'),
(2020, 1010, '2024-11-30', 14500.00, 'completed'),
(2021, 1010, '2024-09-12', 13200.00, 'completed'),
(2022, 1011, '2025-01-05', 4100.00,  'completed'),
(2023, 1011, '2024-10-22', 3800.00,  'refunded'),
(2024, 1012, '2024-12-01', 9800.00,  'completed'),
(2025, 1012, '2024-08-19', 8700.00,  'completed'),
(2026, 1013, '2024-07-10', 22000.00, 'completed'),
(2027, 1013, '2024-04-22', 19500.00, 'completed'),
(2028, 1013, '2024-01-30', 17800.00, 'completed'),
(2029, 1014, '2024-08-15', 11200.00, 'completed'),
(2030, 1014, '2024-05-03', 9600.00,  'completed'),
(2031, 1015, '2024-06-20', 16400.00, 'completed'),
(2032, 1015, '2024-03-11', 14100.00, 'completed'),
(2033, 1015, '2023-12-25', 12700.00, 'completed'),
(2034, 1016, '2025-01-10', 1200.00,  'completed'),
(2035, 1017, '2025-02-15', 950.00,   'completed'),
(2036, 1018, '2024-12-28', 1450.00,  'completed'),
(2037, 1019, '2025-02-01', 2200.00,  'completed'),
(2038, 1020, '2025-03-08', 800.00,   'pending'  ); 


INSERT INTO products(line_id, order_id, category, unit_price, quantity)
VALUES 
(3001, 2001, 'Electronics', 4250.00, 2),
(3002, 2002, 'Electronics', 3600.00, 2),
(3003, 2003, 'Appliances',  9100.00, 1),
(3004, 2004, 'Electronics', 3400.00, 2),
(3005, 2005, 'Software',    5000.00, 3),
(3006, 2006, 'Software',    6250.00, 2),
(3007, 2007, 'Electronics', 5500.00, 2),
(3008, 2008, 'Beauty',      1800.00, 3),
(3009, 2009, 'Beauty',      1633.00, 3),
(3010, 2010, 'Software',    9100.00, 2),
(3011, 2011, 'Apparel',     1600.00, 2),
(3012, 2012, 'Apparel',     1450.00, 2),
(3013, 2013, 'Apparel',     900.00,  2),
(3014, 2014, 'Beauty',      700.00,  3),
(3015, 2015, 'Apparel',     1500.00, 3),
(3016, 2016, 'Beauty',      1100.00, 2),
(3017, 2017, 'Electronics', 6700.00, 1),
(3018, 2018, 'Appliances',  2950.00, 2),
(3019, 2019, 'Electronics', 3600.00, 2),
(3020, 2020, 'Software',    7250.00, 2),
(3021, 2021, 'Software',    6600.00, 2),
(3022, 2022, 'Electronics', 4100.00, 1),
(3023, 2026, 'Appliances',  11000.00,2),
(3024, 2027, 'Appliances',  9750.00, 2),
(3025, 2034, 'Beauty',      600.00,  2),
(3026, 2035, 'Apparel',     475.00,  2),
(3027, 2036, 'Beauty',      725.00,  2),
(3028, 2037, 'Apparel',     1100.00, 2); 

## PART-2 RFM BASE (RFM = Recency (days since last purchase), Frequency (# orders), Monetary (total spend)) 

WITH 
rfm_base AS 

(SELECT c.customer_id, c.region, c.plan_type, c.signup_date,

DATEDIFF(CURRENT_DATE(), MAX(o.order_date))  AS recency_days,

COUNT(DISTINCT o.order_id)    AS frequency,

SUM(o.order_value)             AS monetary_value,

AVG(o.order_value)             AS avg_order_value

FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id
AND o.status = 'completed'  
GROUP BY c.customer_id, c.region, c.plan_type, c.signup_date  )

SELECT * FROM rfm_base
ORDER BY monetary_value DESC
LIMIT 10;

## PART-3 RFM_SCORING (builds on rfm_base) ,NTILE(4) splits customers into 4 equal quartile buckets (1=worst, 4=best)

WITH 
rfm_base AS 
(SELECT c.customer_id, c.region, c.plan_type, c.signup_date,

DATEDIFF(CURRENT_DATE(), MAX(o.order_date))  AS recency_days,

COUNT(DISTINCT o.order_id)    AS frequency,

SUM(o.order_value)             AS monetary_value,

AVG(o.order_value)             AS avg_order_value

FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id
AND o.status = 'completed'  
GROUP BY c.customer_id, c.region, c.plan_type, c.signup_date 
ORDER BY monetary_value DESC ),


rfm_scored  AS 
(SELECT *,
NTILE(4) OVER(ORDER BY recency_days DESC)  AS r_score,
NTILE(4) OVER(ORDER BY frequency ASC) AS f_score,
NTILE(4) OVER(ORDER BY monetary_value ASC) AS m_score 
FROM rfm_base),

rfm_combined AS (
SELECT *, 
( r_score + f_score + m_score) AS rfm_total,
CONCAT(r_score,f_score,m_score) AS rfm_cell 
FROM rfm_scored)

SELECT * FROM rfm_combined;  


## PART-4 RFM_SEGMENTS (Converting a number (rfm_total) into a label a VP can act on — "At Risk" vs "444" — is business acumen made visible in code.)

WITH 
rfm_base AS 
(SELECT c.customer_id, c.region, c.plan_type, c.signup_date,

DATEDIFF(CURRENT_DATE(), MAX(o.order_date))  AS recency_days,

COUNT(DISTINCT o.order_id)    AS frequency,

SUM(o.order_value)             AS monetary_value,

AVG(o.order_value)             AS avg_order_value

FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id
AND o.status = 'completed'  
GROUP BY c.customer_id, c.region, c.plan_type, c.signup_date 
ORDER BY monetary_value DESC ),


rfm_scored  AS 
(SELECT *,
NTILE(4) OVER(ORDER BY recency_days DESC)  AS r_score,
NTILE(4) OVER(ORDER BY frequency ASC) AS f_score,
NTILE(4) OVER(ORDER BY monetary_value ASC) AS m_score 
FROM rfm_base),

rfm_combined AS (
SELECT *, 
( r_score + f_score + m_score) AS rfm_total,
CONCAT(r_score,f_score,m_score) AS rfm_cell 
FROM rfm_scored),

rfm_segments AS (

SELECT customer_id, plan_type, region, recency_days, frequency, 
ROUND(monetary_value, 2) AS total_spend, r_score, f_score, m_score, rfm_total,

CASE
  WHEN rfm_total >= 11  THEN  'Champion'
  WHEN rfm_total >= 9   THEN  'Loyal Customer'
  WHEN rfm_total >= 7 AND r_score >= 3   THEN  'Potential Loyalist'
  WHEN rfm_total >= 7 AND r_score <= 2   THEN  'At Risk'
  WHEN rfm_total >= 4 AND recency_days > 180   THEN  'Lost' 
  WHEN frequency = 1  THEN  'New Customer'
  ELSE  'Needs Attention'
  END AS Segment,
  
CASE
   WHEN rfm_total >= 11  THEN  1
   WHEN rfm_total >= 9   THEN  2
   WHEN rfm_total >= 7   THEN  3
   WHEN recency_days > 180  THEN 4
   WHEN r_score <= 2  AND m_score >= 3  THEN  5
   ELSE  3
   END AS churn_risk_score 
   
   FROM rfm_combined)
   
   SELECT * FROM rfm_segments;
                   

## PART-5  Final Output with full-chained CTE (part-2 to part-4) 

WITH 
rfm_base AS 
(SELECT c.customer_id, c.region, c.plan_type, c.signup_date,

DATEDIFF(CURRENT_DATE(), MAX(o.order_date))  AS recency_days,

COUNT(DISTINCT o.order_id)    AS frequency,

SUM(o.order_value)             AS monetary_value,

AVG(o.order_value)             AS avg_order_value

FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id
AND o.status = 'completed'  
GROUP BY c.customer_id, c.region, c.plan_type, c.signup_date 
ORDER BY monetary_value DESC ),


rfm_scored  AS 
(SELECT *,
NTILE(4) OVER(ORDER BY recency_days DESC)  AS r_score,
NTILE(4) OVER(ORDER BY frequency ASC) AS f_score,
NTILE(4) OVER(ORDER BY monetary_value ASC) AS m_score 
FROM rfm_base),

rfm_combined AS (
SELECT *, 
( r_score + f_score + m_score) AS rfm_total,
CONCAT(r_score,f_score,m_score) AS rfm_cell 
FROM rfm_scored),

rfm_segments AS (

SELECT customer_id, plan_type, region, recency_days, frequency, 
ROUND(monetary_value, 2) AS total_spend, r_score, f_score, m_score, rfm_total,

CASE
  WHEN rfm_total >= 11  THEN  'Champion'
  WHEN rfm_total >= 9   THEN  'Loyal Customer'
  WHEN rfm_total >= 7 AND r_score >= 3   THEN  'Potential Loyalist'
  WHEN rfm_total >= 7 AND r_score <= 2   THEN  'At Risk'
  WHEN rfm_total >= 4 AND recency_days > 180   THEN  'Lost' 
  WHEN frequency = 1  THEN  'New Customer'
  ELSE  'Needs Attention'
  END AS Segment,
  
CASE
   WHEN rfm_total >= 11  THEN  1
   WHEN rfm_total >= 9   THEN  2
   WHEN rfm_total >= 7   THEN  3
   WHEN recency_days > 180  THEN 4
   WHEN r_score <= 2  AND m_score >= 3  THEN  5
   ELSE  3
   END AS churn_risk_score 
   
FROM rfm_combined)

SELECT customer_id, region, plan_type, segment, churn_risk_score, recency_days, frequency AS total_orders, 
total_spend, ROUND(total_spend/NULLIF(frequency,0), 2)  AS  avg_order_value,
r_score, f_score, m_score, rfm_total 

FROM rfm_segments 
ORDER BY  
  churn_risk_score DESC,
  total_spend DESC;

