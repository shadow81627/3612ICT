/*drop database pocketpasta;
create database pocketpasta;
use pocketpasta; */

-- Create Table Statements

-- Create Customer table
CREATE OR REPLACE TABLE customer (
	customer_id INT AUTO_INCREMENT, 
	customer_name VARCHAR(32), 
	customer_email VARCHAR(255), 
	customer_address VARCHAR(255), 
	PRIMARY KEY (customer_id)
);

-- Create Supplier table
CREATE OR REPLACE TABLE supplier (
	supplier_id  INT AUTO_INCREMENT,
	supplier_name  VARCHAR(32),
	supplier_image BLOB,
	supplier_ABN INT,
	PRIMARY KEY (supplier_id)
);

-- Create Item table
CREATE OR REPLACE TABLE item (
	item_id INT,
	item_name  VARCHAR(32),
	item_description  VARCHAR(255),
	item_image BLOB,
	PRIMARY KEY (item_id)
);

-- Create Material table
CREATE OR REPLACE TABLE material (
	material_id INT AUTO_INCREMENT, 
	supplier_id INT,
	item_id INT,
	material_price INT,
	material_unit ENUM('kg', 'box', 'grams', 'each'),
	PRIMARY KEY (material_id),
	FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id),
	FOREIGN KEY (item_id) REFERENCES item(item_id)
);

-- Create Product table
CREATE OR REPLACE TABLE product (
	product_id  INT AUTO_INCREMENT, 
	item_id INT,
	product_price FLOAT,
	product_unit ENUM('kg', 'box', 'grams'),	
	delivery_address VARCHAR(255),
	PRIMARY KEY (product_id)
);

-- Create Material_Order table
CREATE OR REPLACE TABLE material_order (
	material_order_id INT,
	material_id INT,
	material_order_quantity FLOAT,
	material_order_unit ENUM('kg', 'box', 'grams', 'each'),
	material_order_address VARCHAR(255),
	material_order_date_due DATETIME NOT NULL DEFAULT NOW(),
	material_order_date_created DATETIME NOT NULL DEFAULT NOW(),
	material_order_date_delivered DATETIME,
	PRIMARY KEY (material_order_id),
	FOREIGN KEY (material_id) REFERENCES material(material_id)
);

-- Create Product_Order table
CREATE OR REPLACE TABLE product_order (
	product_order_id INT,
	material_id INT,
	customer_id INT,
	product_order_quantity FLOAT,
	product_order_unit ENUM('kg', 'box', 'grams', 'each'),
	product_order_address VARCHAR(255),
	product_order_date_due DATETIME NOT NULL DEFAULT NOW(),
	product_order_date_created DATETIME NOT NULL DEFAULT NOW(),
	product_order_date_delivered DATETIME,
	PRIMARY KEY (product_order_id),
	FOREIGN KEY (material_id) REFERENCES material(material_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Create Inventory Table
CREATE TABLE OR REPLACE inventory (
	inventory_id  INT AUTO_INCREMENT,
	inventory_name VARCHAR(32),
	ineventory_description VARCHAR(255),
	inventory_address VARCHAR(255),
	PRIMARY KEY (inventory_id)
);

-- Create Stock table
CREATE TABLE OR REPLACE stock (
	inventory_id INT,
	item_id INT,
	stock_quantity FLOAT,
	stock_unit ENUM('kg', 'box', 'grams'),
	stock_min FLOAT,
	stock_max FLOAT,
	PRIMARY KEY (inventory_id, item_id),
	FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id),
	FOREIGN KEY (item_id) REFERENCES item(item_id)
);

-- Create Recipe table
CREATE TABLE OR REPLACE recipe (
	recipe_id  INT AUTO_INCREMENT,
	recipe_quantity FLOAT,
	recipe_unit ENUM('kg', 'box', 'grams'),
	PRIMARY KEY (recipe_id)
);

-- Create Process table
CREATE TABLE OR REPLACE process (
	recipe_id INT,
	process_id  INT,
	process_name VARCHAR(32),
	process_description VARCHAR(255),
	PRIMARY KEY (recipe_id, process_id),
	FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id)
);

-- Create Ingredient table
CREATE OR REPLACE TABLE ingredient (
	recipe_id INT,
	process_id INT,
	item_id INT,
	ingredient_quantity FLOAT,
	ingredient_unit ENUM('kg', 'box', 'grams'),
	PRIMARY KEY (recipe_id, process_id, item_id),
	FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id),
	FOREIGN KEY (process_id) REFERENCES process(process_id),
	FOREIGN KEY (item_id) REFERENCES item(item_id)
);