CREATE DATABASE os_bank_token;

USE os_bank_token;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    account_number VARCHAR(30),
    service_type VARCHAR(50) NOT NULL,
    token_number INT NOT NULL,
    status VARCHAR(20) DEFAULT 'Waiting',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
USE os_bank_token;

INSERT INTO customers
(customer_name, account_number, service_type, token_number, status)
VALUES
('Arun', 'ACC1001', 'Deposit', 1, 'Waiting'),
('Ravi', 'ACC1002', 'Withdrawal', 2, 'Waiting'),
('Kumar', 'ACC1003', 'Account Opening', 3, 'Waiting');
SELECT * FROM customers;
UPDATE customers
SET status = 'Serving'
WHERE customer_id = 1;
SELECT customer_id, customer_name, status
FROM customers;
UPDATE customers
SET status = 'Serving'
WHERE customer_id = 2;
UPDATE customers
SET status = 'Waiting'
WHERE customer_id = 1;
SELECT customer_id, customer_name, token_number, status
FROM customers;
-- Complete token
UPDATE customers
SET status = 'Completed'
WHERE customer_id = 2;
SELECT customer_id, customer_name, token_number, status
FROM customers;
INSERT INTO customers
(customer_name, account_number, service_type, token_number, status)
VALUES
('Suresh', 'ACC1004', 'Deposit', 4, 'Waiting');
SELECT customer_id, customer_name, token_number, status
FROM customers;
UPDATE customers
SET status = 'Serving'
WHERE customer_id = 3;
SELECT customer_id, customer_name, token_number, status
FROM customers;
-- Complete Kumar
UPDATE customers
SET status = 'Completed'
WHERE customer_id = 3;

-- Serve Suresh
UPDATE customers
SET status = 'Serving'
WHERE customer_id = 4;

-- Complete Suresh
UPDATE customers
SET status = 'Completed'
WHERE customer_id = 4;

-- Final result
SELECT customer_id, customer_name, account_number,
       service_type, token_number, status, created_at
FROM customers;