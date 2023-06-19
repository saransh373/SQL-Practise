create database if not exists sales;
use sales;
CREATE TABLE sales (
    purchase_no INT PRIMARY KEY AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT ,
    item_code VARCHAR(10) NOT NULL
);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    email_address VARCHAR(20),
    number_of_complaints INT
);
CREATE TABLE items (
    item_code VARCHAR(20),
    item VARCHAR(20),
    unit_price NUMERIC(10 , 2 ),
    company_id VARCHAR(20)
);
CREATE TABLE companies (
    company_id VARCHAR(20),
    company_name VARCHAR(20),
    headquater_number INT
);

