## Architecture Recommendation
The Food Delivery startup collects four very different types of data.
1. GPS location logs -  Semi-Structured Data
2. Customer text reviews - Unstructured Data
3. Payment transactions - Structured Data
4. Restaurant menu images - Unstructured.

A Data Warehouse can handle only structured data which can be used for BI Reporting.
A Data Lake can store all data but it lacks query and governance capabilities.
A Data Lakehouse can handles all four.

Payment Transactions is structured data. When it comes to payments, we cannot afford duplicate charges or lost records — it needs 100% reliablility. Data Warehouse can store and query structured data, but is it works in batches, so it's not great for handling live, real-time transactions. A Data Lake has no ACID transaction support (there's no guarantee that data won't get corrupted or lost, which is a big risk for payment data).  this leaves Data Lakehouse the most reliable choice here — it gives both ACID transactions, handles real-time data, and can still run analytical queries all at one place.

Semi-structured data and unstructured data can be handled only by datalake and datalake house. But the problem with a Data Lake is that it is built purely for storage — it has no schema, no indexing, and no real-time query performance. So when we actually need to query or analyze this data, the Data Lake cannot support it . Which leaves Data Lakehouse — it can store all data types just like a Data Lake, and also gives us the query performance and structure we need on top of it.

I strongly recommend Data Lakehouse as it gives both  Data warehouse and Datalake felxibility which is the best of both suitable for a growing company.


