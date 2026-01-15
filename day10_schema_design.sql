-- Day 10: E-commerce Database Schema Design
-- Topic: Primary Keys, Foreign Keys, Relationships
create database ecommerce;
use ecommerce;


-- Customers table
create table customers(
customer_id int primary key,
name varchar(50) not null,
email varchar(100) unique,
city varchar(50) 
);

-- Products table
create table products(
product_id int primary key,
product_name varchar(50) not null,
price int not null
);

-- Orders table
create table orders(
order_id int primary key,
customer_id int,
order_date Date,
foreign key (customer_id) references
customers(customer_id)
);

-- Order items table (many-to-many relationship)
create table order_items (
order_id int,
product_id int,
quantity int not null,
primary key (order_id, product_id),
foreign key(order_id)references
orders(order_id),
foreign key (product_id)references
products(product_id)
);

