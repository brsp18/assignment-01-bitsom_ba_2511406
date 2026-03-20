CREATE TABLE fact_sales (
   
    transaction_id   VARCHAR(20)     NOT NULL UNIQUE,
    store_id         INT             NOT NULL REFERENCES dim_store(store_id),
    product_id       INT             NOT NULL REFERENCES dim_product(product_id),
    customer_id      VARCHAR(20)     NOT NULL,
    units_sold       INT             NOT NULL CHECK (units_sold > 0),
    unit_price       NUMERIC(12,2)   NOT NULL
   
);

CREATE TABLE dim_store (
    store_id      SERIAL        PRIMARY KEY,
    store_name    VARCHAR(50)  NOT NULL UNIQUE,
    store_city    VARCHAR(50)  NOT NULL
    
);

CREATE TABLE dim_product (
    product_id    SERIAL        PRIMARY KEY,
    product_name  VARCHAR(50)  NOT NULL ,
    category      VARCHAR(50)   NOT NULL,       
    unit_price    NUMERIC(12,2) NOT NULL 
);

CREATE TABLE dim_date (
  transaction_id   VARCHAR(20) PRIMARY KEY,
  units_sold       INT             NOT NULL CHECK (units_sold > 0),
  customer_id      VARCHAR(20)     NOT NULL,
  date     DATE          NOT NULL

);

-- Comment
