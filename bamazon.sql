DROP DATABASE IF EXISTS bamazon;

CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products (
    id INT(10) NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(255) NULL,
    department_name VARCHAR(255) NULL,
    price DECIMAL(10,2) NULL,
    stock_quantity INT(10) NULL,
    PRIMARY KEY (id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Sephora Lip Stain Collection', 'Beauty & Personal Care', 53.48, 10),
('Tinted Moisturizer', 'Beauty & Personal Care', 48.30, 35);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Samsung Flat 65-inch Smart TV', 'Electronics', 697.99, 5),
('Super Nintendo Classic Edition', 'Electronics', 129.99, 2);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Succulents (Collection of 4)', 'Garden & Outdoor', 18.99, 30),
('Adjustable Lounge Chair Recliners', 'Garden & Outdoor', 74.99, 50);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('YETI Tundra 75 Cooler', 'Sports & Outdoors', 449.99, 4),
('Black Diamond Climbing Harness', 'Sports & Outdoors', 99.95, 15);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Pet Crate Travel Carrier', 'Pet Supplies', 39.99, 60),
('Sweet Potato Fries - Dog Treats', 'Pet Supplies', 16.99, 25);

SELECT * FROM products;