

## Schema Design 


CREATE TABLE customers (
    customer_id varchar(50) PRIMARY KEY NOT NULL,
    customer_name varchar(50),
    customer_email varchar(50),
    customer_city varchar(50)
);


CREATE TABLE products (
    product_id varchar(50) PRIMARY KEY NOT NULL,
    product_name varchar(50),
    category varchar(50),
    unit_price INT
);


CREATE TABLE salesreps(
    sales_rep_id varchar(50) PRIMARY KEY NOT NULL,
    sales_rep_name varchar(50),
    sales_rep_email varchar(50),
    office_address varchar(50)
);

CREATE TABLE orders(
    order_id varchar(50) PRIMARY KEY NOT NULL,
    customer_id VARCHAR(50),
    sales_rep_id VARCHAR(50),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES salesreps(sales_rep_id)
    
);


CREATE TABLE order_list (
    order_id VARCHAR(50),
    product_id VARCHAR(50),
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);