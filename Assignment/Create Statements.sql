drop database pocketpasta;
create database pocketpasta;
use pocketpasta; 

-- Create Table Statements

-- Drop Customer table
DROP TABLE IF EXISTS customer;
-- Create Customer table
CREATE TABLE customer (
	customer_id INT AUTO_INCREMENT, 
	customer_name VARCHAR(32), 
	customer_email VARCHAR(255), 
	customer_address VARCHAR(255), 
	PRIMARY KEY (customer_id)
);

-- Drop supplier table
DROP TABLE IF EXISTS supplier;
-- Create Supplier table
CREATE TABLE supplier (
	supplier_id  INT AUTO_INCREMENT,
	supplier_name  VARCHAR(32),
	supplier_image BLOB,
	supplier_ABN INT,
	PRIMARY KEY (supplier_id)
);

-- Drop Item table
DROP TABLE IF EXISTS item;
-- Create Item table
CREATE TABLE item (
	item_id INT,
	item_name  VARCHAR(32),
	item_description  VARCHAR(255),
	item_image BLOB,
	PRIMARY KEY (item_id)
);

-- Drop product table
DROP TABLE IF EXISTS product;
-- Create Product table
CREATE TABLE product (
	product_id  INT AUTO_INCREMENT,
	supplier_id INT,
	item_id INT,
	product_price FLOAT,
	product_unit ENUM('kg', 'box', 'grams'),	
	PRIMARY KEY (product_id),
	FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id),
	FOREIGN KEY (item_id) REFERENCES item(item_id)
);

-- Drop product_order table
DROP TABLE IF EXISTS product_order;
-- Create Product_Order table
CREATE TABLE product_order (
	product_order_id INT,
	product_id INT,
	customer_id INT,
	product_order_quantity FLOAT,
	product_order_unit ENUM('kg', 'box', 'grams', 'each'),
	product_order_address VARCHAR(255),
	product_order_date_due DATETIME DEFAULT NOW(),
	product_order_date_created TIMESTAMP NOT NULL DEFAULT NOW(),
	product_order_date_delivered DATETIME,
	PRIMARY KEY (product_order_id),
	FOREIGN KEY (product_id) REFERENCES product(product_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Drop inventory table
DROP TABLE IF EXISTS inventory;
-- Create Inventory Table
CREATE TABLE inventory (
	inventory_id INT AUTO_INCREMENT,
	supplier_id INT,
	inventory_name VARCHAR(32),
	inventory_description VARCHAR(255),
	inventory_address VARCHAR(255),
	PRIMARY KEY (inventory_id),
	FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);

-- Drop stock table
DROP TABLE IF EXISTS stock;
-- Create Stock table
CREATE TABLE stock (
	stock_id INT,
	inventory_id INT,
	item_id INT,
	stock_quantity FLOAT,
	stock_unit ENUM('kg', 'box', 'grams'),
	stock_created TIMESTAMP NOT NULL DEFAULT NOW(),
	PRIMARY KEY (stock_id),
	FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id),
	FOREIGN KEY (item_id) REFERENCES item(item_id)
);

-- Drop recipe table
DROP TABLE IF EXISTS recipe;
-- Create Recipe table
CREATE TABLE recipe (
	recipe_id  INT AUTO_INCREMENT,
	item_id INT,
	recipe_quantity FLOAT,
	recipe_unit ENUM('kg', 'box', 'grams'),
	PRIMARY KEY (recipe_id),
	FOREIGN KEY (item_id) REFERENCES item(item_id)
);

-- Drop process table
DROP TABLE IF EXISTS process;
-- Create Process table
CREATE TABLE process (
	process_id  INT AUTO_INCREMENT,
	recipe_id INT,
	process_precedence INT,
	process_name VARCHAR(32),
	process_description VARCHAR(255),
	process_image BLOB,
	PRIMARY KEY (process_id),
	FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id)
);

-- Drop ingredient table
DROP TABLE IF EXISTS ingredient;
-- Create Ingredient table
CREATE TABLE ingredient (
	process_id INT,
	item_id INT,
	ingredient_quantity FLOAT,
	ingredient_unit ENUM('kg', 'box', 'grams'),
	PRIMARY KEY (process_id, item_id),
	FOREIGN KEY (process_id) REFERENCES process(process_id),
	FOREIGN KEY (item_id) REFERENCES item(item_id)
);