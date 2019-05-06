DROP DATABASE IF EXISTS bamazon;

CREATE DATABASE bamazon;

USE DATABASE bamazon;

CREATE TABLE products (
    id INT(10) NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(255) NULL,
    department_name VARCHAR(255) NULL,
    price DECIMAL(10,2) NULL,
    stock_quantity INT(10) NULL,
    PRIMARY KEY (id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Sephora Cream Lip Stain Collection Set of 6', 'Beauty & Personal Care', 53.48, 10),
('Tinted Moisturizer - Nude', 'Beauty & Personal Care', 48.30, 35);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Samsung UN65RU7100FXZA Flat 65'' 4K UHD 7 Series Smart TV (2019)', 'Electronics', 697.99, 5),
('SUPER NINTENDO CLASSIC EDITION CONSOLE Renewed [NINTENDO]', 'Electronics', 129.99, 2);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Shop Succulents Rosette Succulent (Collection of 4)', 'Garden & Outdoor', 18.99, 30),
('Adjustable Zero Gravity Lounge Chair Recliners', 'Garden & Outdoor', 74.99, 50);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('YETI Tundra 75 Cooler', 'Sports & Outdoors', 449.99, 4),
('Black Diamond Momentum Climbing Harness Package - Womens Medium', 'Sports & Outdoors', 99.95, 15);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('FurryFriends Soft Sided Pet Crate Travel Carrier Dogs Cats', 'Pet Supplies', 39.99, 60),
('Wholesome Pride Pet Treats Sweet Potato Fries Dog Treats', 'Pet Supplies' 16.99, 25);

