## Anomaly Analysis.

1: INSERT ANOMALY: Example "office_address"

In orders_flat.csv, the columns sales_rep_id, sales_rep_name, sales_rep_email, and office_address describes Sales Representatives.If the dataset is normalized, the above four attributes would belong to Sales_Rep table with sales_rep_id referring as a primary key.

In the current denormalized orders_flat file, information is repeated multiple times leading to data redundancy and inconsistency.

For sales_rep_id SR01, the office address appears in two different ways:
- Mumbai HQ, Nariman Point, Mumbai - 400021
- Mumbai HQ, Nariman Pt, Mumbai - 400021

Since we have two different addressess, Inserting a new order will be challenging resulting an INSERT ANAMOLY.






2. UPDATE ANOMALY: Example "Change in unit_price for one of the product"

In the current orders_flat.csv file, information is repeated across many rows leading to data redundancy and inconsistency.

For example, the dataset contains 8 different products, and each product’s unit_price, product_name, and category are repeated in every order.

If the price of a product changes, the update must be applied to every row that contains that product.

If even one row is missed, the table will contain multiple different prices for the same product, resulting in an UPDATE ANOMALY.







3. DELETE ANOMALY: Example "Webcam"

In the current orders_flat.csv file, information is repeated across many rows leading to data redundancy and inconsistency.

A delete anomaly happens when deleting a single row causes the loss of important master data.

We have a Product with product_name as "Webcam". For any reason, if order_id (ORD1185) id deleted, all the information (product_id, product_name, unit_price) related to "Webcam" will be lost from orders_flat.csv file leading to DELETE ANOMALY.






## Normalization Justification 

Normalization is not over‑engineering. It keeps data clean, avoids mistakes, and also makes reporting much easier as the system grows.

In the current orders_flat.csv file, information is repeated across many rows leading to data redundancy and inconsistency.

As mentioned above, if the data is not normalized it can lead to multiple anamolies Insert Anamoly, Update Anamoly, Delete Anamoly. Giving the following examples will give more information to the manager:

INSERT ANAMOLY EXAMPLE: 
sales_rep_id "SR01", the office address appears in two different ways:
- Mumbai HQ, Nariman Point, Mumbai - 400021
- Mumbai HQ, Nariman Pt, Mumbai - 400021
Since we have two different addressess, Inserting a new order will be challenging resulting an INSERT ANAMOLY.

UPDATE ANAMOLY EXAMPLE:
If the price of a product changes, the update must be applied to every row that contains that product.
If even one row is missed, the table will contain multiple different prices for the same product, resulting in an UPDATE ANOMALY.

DELETE ANAMOLY EXAMPLE:
A delete anomaly happens when deleting a single row causes the loss of important master data.
We have a Product with product_name as "Webcam". For any reason, if order_id (ORD1185) id deleted, all the information (product_id, product_name, unit_price) related to "Webcam" will be lost from orders_flat.csv file leading to DELETE ANOMALY.

These examples will give better understanding and a need for normalization.







