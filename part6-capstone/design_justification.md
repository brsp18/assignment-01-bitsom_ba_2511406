
Stage 1: DATA SOURCES : Data from multiple sources is collected in multiple forms (Structured, semi-structured and  unstructured). Before ETL = OLTP — Raw data coming in from all 4 sources is transactional. It is messy, real-time, and operational.

Stage 2: STORAGE AREA : It is a staging zone — raw data lands here before it is clean enough to be used.

## OLTP vs OLAP Boundary

Stage 3: ETL PROCESS : Raw data goes through cleaning process known as ETL process where raw data is cleaned which includes removing duplicates, fixing null values, standardizing data, casing the data etc.  OLTP process ends at the ETL stage. Before ETL, data is raw and transactional (OLTP). After ETL, data moves into analytical systems (OLAP) where reporting and ML happens.

## Storage Systems
Stage 4: STORAGE DESIGN :
1.  Data Warehouse — Used for Patient Records and Hospital Visit Information
This data is structured and needs to be queried regularly for reports (daily, weekly, monthly). A Data Warehouse is the best fit because it is built for analytical queries on structured data.

2. Time Series Database — Used for ICU Alerts and Emergency Monitoring
Hospital vitals like heart rate, blood pressure, and oxygen levels change every second. A Time Series database is designed specifically to handle this kind of continuously changing data efficiently.

3. Vector Database — Used for Doctor's Notes
Doctor's notes are unstructured free text. A Vector Database converts this text into embeddings so the LLM can search and retrieve relevant historical patient information and give doctors plain English responses.

4. SQL Database — Used for Hospital Inpatient Treatment (Operations)
Day-to-day hospital operations like admissions, discharges, and treatments are transactional data. A SQL Database handles these with full ACID compliance — no duplicate records, no lost entries.

Stage 5: AI LAYER:  AI Layer consists of BI Reporting for scheduled reports, an Alerting Engine for ICU emergencies, an LLM for doctor queries, and an ML Model for flagging high risk patients.

Stage 6: OUTPUT : Data from AI/REPORTING layer can be used for generating reports, View patients historical data, Nurses can view alerts during patients serious conditions, Doctors can view patients condition and analyse the treatment options.


## Trade-offs
ETL  vs Real-time Alerts — Cleaning data before it moves forward ensures quality, but it includes time delay. In a hospital, even a few minutes delay in ICU vitals could be life threatening. To mitigate this, the Time Series database should receive a direct raw stream bypassing full ETL, while all other data goes through the normal ETL pipeline.