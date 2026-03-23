-- CREATING TABLES 

CREATE TABLE fact_sales (
    transaction_id  VARCHAR(20)     NOT NULL UNIQUE,
    store_id        INT             NOT NULL,
    product_id      INT             NOT NULL,
    customer_id     VARCHAR(20)     NOT NULL,
    units_sold      INT             NOT NULL CHECK (units_sold > 0),
    unit_price      NUMERIC(12,2)   NOT NULL,
    revenue         NUMERIC(15,2)   AS (units_sold * unit_price) STORED,
    FOREIGN KEY (store_id)   REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (transaction_id) REFERENCES dim_date(transaction_id)
);

CREATE TABLE dim_store (
    store_id    INT             PRIMARY KEY AUTO_INCREMENT,
    store_name  VARCHAR(50)     NOT NULL UNIQUE,
    store_city  VARCHAR(50)     NOT NULL
);
 
CREATE TABLE dim_product (
    product_id    INT             PRIMARY KEY AUTO_INCREMENT,
    product_name  VARCHAR(50)     NOT NULL,
    category      VARCHAR(50)     NOT NULL,
    unit_price    NUMERIC(12,2)   NOT NULL
);
 
CREATE TABLE dim_date (
    date_id       INT             PRIMARY KEY AUTO_INCREMENT,
    transaction_id VARCHAR(20)    NOT NULL UNIQUE,
    customer_id   VARCHAR(20)     NOT NULL,
    units_sold    INT             NOT NULL CHECK (units_sold > 0),
    txn_date      DATE            NOT NULL,
    txn_month     VARCHAR(7)      NOT NULL,
    txn_year      INT             NOT NULL
);
 



-- INSERT STATEMENTS 
-- DIM_STORE
INSERT INTO dim_store (store_id, store_name, store_city) VALUES (1, 'Bangalore MG', 'Bangalore');
INSERT INTO dim_store (store_id, store_name, store_city) VALUES (2, 'Chennai Anna', 'Chennai');
INSERT INTO dim_store (store_id, store_name, store_city) VALUES (3, 'Delhi South', 'Delhi');
INSERT INTO dim_store (store_id, store_name, store_city) VALUES (4, 'Mumbai Central', 'Mumbai');
INSERT INTO dim_store (store_id, store_name, store_city) VALUES (5, 'Pune FC Road', 'Pune');
 
-- DIM_PRODUCT
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES (1, 'Atta 10kg', 'Grocery', 52464.00);
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES (2, 'Biscuits', 'Grocery', 27469.99);
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES (3, 'Headphones', 'Electronics', 39854.96);
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES (4, 'Jacket', 'Clothing', 30187.24);
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES (5, 'Jeans', 'Clothing', 2317.47);
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES (6, 'Laptop', 'Electronics', 42343.15);
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES (7, 'Milk 1L', 'Grocery', 43374.39);
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES (8, 'Oil 1L', 'Grocery', 26474.34);
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES (9, 'Phone', 'Electronics', 48703.39);
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES (10, 'Pulses 1kg', 'Grocery', 31604.47);
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES (11, 'Rice 5kg', 'Grocery', 52195.05);
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES (12, 'Saree', 'Clothing', 35451.81);
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES (13, 'Smartwatch', 'Electronics', 58851.01);
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES (14, 'Speaker', 'Electronics', 49262.78);
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES (15, 'T-Shirt', 'Clothing', 29770.19);
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES (16, 'Tablet', 'Electronics', 23226.12);
 
-- DIM_DATE
INSERT INTO dim_date (transaction_id, customer_id, units_sold, txn_date, txn_month, txn_year) VALUES ('TXN5000', 'CUST045', 3, '2023-08-29', '2023-08', 2023);
INSERT INTO dim_date (transaction_id, customer_id, units_sold, txn_date, txn_month, txn_year) VALUES ('TXN5001', 'CUST021', 11, '2023-12-12', '2023-12', 2023);
INSERT INTO dim_date (transaction_id, customer_id, units_sold, txn_date, txn_month, txn_year) VALUES ('TXN5002', 'CUST019', 20, '2023-02-05', '2023-02', 2023);
INSERT INTO dim_date (transaction_id, customer_id, units_sold, txn_date, txn_month, txn_year) VALUES ('TXN5003', 'CUST007', 14, '2023-02-20', '2023-02', 2023);
INSERT INTO dim_date (transaction_id, customer_id, units_sold, txn_date, txn_month, txn_year) VALUES ('TXN5004', 'CUST004', 10, '2023-01-15', '2023-01', 2023);
INSERT INTO dim_date (transaction_id, customer_id, units_sold, txn_date, txn_month, txn_year) VALUES ('TXN5005', 'CUST027', 12, '2023-08-09', '2023-08', 2023);
INSERT INTO dim_date (transaction_id, customer_id, units_sold, txn_date, txn_month, txn_year) VALUES ('TXN5006', 'CUST025', 6, '2023-03-31', '2023-03', 2023);
INSERT INTO dim_date (transaction_id, customer_id, units_sold, txn_date, txn_month, txn_year) VALUES ('TXN5007', 'CUST041', 16, '2023-10-26', '2023-10', 2023);
INSERT INTO dim_date (transaction_id, customer_id, units_sold, txn_date, txn_month, txn_year) VALUES ('TXN5008', 'CUST030', 9, '2023-12-08', '2023-12', 2023);
INSERT INTO dim_date (transaction_id, customer_id, units_sold, txn_date, txn_month, txn_year) VALUES ('TXN5009', 'CUST020', 3, '2023-08-15', '2023-08', 2023);
INSERT INTO dim_date (transaction_id, customer_id, units_sold, txn_date, txn_month, txn_year) VALUES ('TXN5010', 'CUST031', 15, '2023-06-04', '2023-06', 2023);
INSERT INTO dim_date (transaction_id, customer_id, units_sold, txn_date, txn_month, txn_year) VALUES ('TXN5011', 'CUST045', 13, '2023-10-20', '2023-10', 2023);
 
-- FACT_SALES
INSERT INTO fact_sales (transaction_id, store_id, product_id, customer_id, units_sold, unit_price) VALUES ('TXN5000', 2, 14, 'CUST045', 3, 49262.78);
INSERT INTO fact_sales (transaction_id, store_id, product_id, customer_id, units_sold, unit_price) VALUES ('TXN5001', 2, 16, 'CUST021', 11, 23226.12);
INSERT INTO fact_sales (transaction_id, store_id, product_id, customer_id, units_sold, unit_price) VALUES ('TXN5002', 2, 9, 'CUST019', 20, 48703.39);
INSERT INTO fact_sales (transaction_id, store_id, product_id, customer_id, units_sold, unit_price) VALUES ('TXN5003', 3, 16, 'CUST007', 14, 23226.12);
INSERT INTO fact_sales (transaction_id, store_id, product_id, customer_id, units_sold, unit_price) VALUES ('TXN5004', 2, 13, 'CUST004', 10, 58851.01);
INSERT INTO fact_sales (transaction_id, store_id, product_id, customer_id, units_sold, unit_price) VALUES ('TXN5005', 1, 1, 'CUST027', 12, 52464.00);
INSERT INTO fact_sales (transaction_id, store_id, product_id, customer_id, units_sold, unit_price) VALUES ('TXN5006', 5, 13, 'CUST025', 6, 58851.01);
INSERT INTO fact_sales (transaction_id, store_id, product_id, customer_id, units_sold, unit_price) VALUES ('TXN5007', 5, 5, 'CUST041', 16, 2317.47);
INSERT INTO fact_sales (transaction_id, store_id, product_id, customer_id, units_sold, unit_price) VALUES ('TXN5008', 1, 2, 'CUST030', 9, 27469.99);
INSERT INTO fact_sales (transaction_id, store_id, product_id, customer_id, units_sold, unit_price) VALUES ('TXN5009', 1, 13, 'CUST020', 3, 58851.01);
INSERT INTO fact_sales (transaction_id, store_id, product_id, customer_id, units_sold, unit_price) VALUES ('TXN5010', 2, 4, 'CUST031', 15, 30187.24);
INSERT INTO fact_sales (transaction_id, store_id, product_id, customer_id, units_sold, unit_price) VALUES ('TXN5011', 4, 5, 'CUST045', 13, 2317.47);