

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


-- INSERT STATEMENTS

-- CUSTOMERS
INSERT INTO customers (customer_id, customer_name, customer_email, customer_city) VALUES ('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai');
INSERT INTO customers (customer_id, customer_name, customer_email, customer_city) VALUES ('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi');
INSERT INTO customers (customer_id, customer_name, customer_email, customer_city) VALUES ('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore');
INSERT INTO customers (customer_id, customer_name, customer_email, customer_city) VALUES ('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');
INSERT INTO customers (customer_id, customer_name, customer_email, customer_city) VALUES ('C006', 'Neha Gupta', 'neha@gmail.com', 'Delhi');

-- PRODUCTS
INSERT INTO products (product_id, product_name, category, unit_price) VALUES ('P003', 'Desk Chair', 'Furniture', 8500);
INSERT INTO products (product_id, product_name, category, unit_price) VALUES ('P004', 'Notebook', 'Stationery', 120);
INSERT INTO products (product_id, product_name, category, unit_price) VALUES ('P005', 'Headphones', 'Electronics', 3200);
INSERT INTO products (product_id, product_name, category, unit_price) VALUES ('P006', 'Standing Desk', 'Furniture', 22000);
INSERT INTO products (product_id, product_name, category, unit_price) VALUES ('P007', 'Pen Set', 'Stationery', 250);

-- SALES REPS
INSERT INTO salesreps (sales_rep_id, sales_rep_name, sales_rep_email, office_address) VALUES ('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021');
INSERT INTO salesreps (sales_rep_id, sales_rep_name, sales_rep_email, office_address) VALUES ('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001');
INSERT INTO salesreps (sales_rep_id, sales_rep_name, sales_rep_email, office_address) VALUES ('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001');

-- ORDERS
INSERT INTO orders (order_id, customer_id, sales_rep_id, order_date) VALUES ('ORD1002', 'C002', 'SR02', '2023-01-17');
INSERT INTO orders (order_id, customer_id, sales_rep_id, order_date) VALUES ('ORD1027', 'C002', 'SR02', '2023-11-02');
INSERT INTO orders (order_id, customer_id, sales_rep_id, order_date) VALUES ('ORD1037', 'C002', 'SR03', '2023-03-06');
INSERT INTO orders (order_id, customer_id, sales_rep_id, order_date) VALUES ('ORD1075', 'C005', 'SR03', '2023-04-18');
INSERT INTO orders (order_id, customer_id, sales_rep_id, order_date) VALUES ('ORD1083', 'C006', 'SR01', '2023-07-03');
INSERT INTO orders (order_id, customer_id, sales_rep_id, order_date) VALUES ('ORD1091', 'C001', 'SR01', '2023-07-24');
INSERT INTO orders (order_id, customer_id, sales_rep_id, order_date) VALUES ('ORD1114', 'C001', 'SR01', '2023-08-06');
INSERT INTO orders (order_id, customer_id, sales_rep_id, order_date) VALUES ('ORD1118', 'C006', 'SR02', '2023-11-10');
INSERT INTO orders (order_id, customer_id, sales_rep_id, order_date) VALUES ('ORD1132', 'C003', 'SR02', '2023-03-07');
INSERT INTO orders (order_id, customer_id, sales_rep_id, order_date) VALUES ('ORD1153', 'C006', 'SR01', '2023-02-14');

-- ORDER LIST
INSERT INTO order_list (order_id, product_id, quantity) VALUES ('ORD1002', 'P005', 1);
INSERT INTO order_list (order_id, product_id, quantity) VALUES ('ORD1027', 'P004', 4);
INSERT INTO order_list (order_id, product_id, quantity) VALUES ('ORD1037', 'P007', 2);
INSERT INTO order_list (order_id, product_id, quantity) VALUES ('ORD1075', 'P003', 3);
INSERT INTO order_list (order_id, product_id, quantity) VALUES ('ORD1083', 'P007', 2);
INSERT INTO order_list (order_id, product_id, quantity) VALUES ('ORD1091', 'P006', 3);
INSERT INTO order_list (order_id, product_id, quantity) VALUES ('ORD1114', 'P007', 2);
INSERT INTO order_list (order_id, product_id, quantity) VALUES ('ORD1118', 'P007', 5);
INSERT INTO order_list (order_id, product_id, quantity) VALUES ('ORD1132', 'P007', 5);
INSERT INTO order_list (order_id, product_id, quantity) VALUES ('ORD1153', 'P007', 3);