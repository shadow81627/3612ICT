/*drop database pocketpasta;
create database pocketpasta;
use pocketpasta; */

-- Create Table Statements

-- Create Customer table
CREATE OR REPLACE TABLE Customer (
	customer_id INT AUTO_INCREMENT, 
	customer_name VARCHAR(32), 
	customer_email VARCHAR(255), 
	customer_address VARCHAR(255), 
	PRIMARY KEY (customer_id)
);

-- Create Supplier table
CREATE TABLE Supplier (
	supplier_id  INT AUTO_INCREMENT,
	supplier_name  VARCHAR(32),
	supplier_image BLOB,
	supplier_ABN INT,
	PRIMARY KEY (supplier_id)
);

-- Create Item table
CREATE TABLE Item (
	item_id INT,
	item_name  VARCHAR(32),
	item_description  VARCHAR(255),
	item_image BLOB,
	PRIMARY KEY (item_id)
);

-- Create Material table
CREATE TABLE Material (
	material_id INT AUTO_INCREMENT, 
	supplier_id INT,
	item_id INT,
	price INT,
	unit ENUM('kg', 'box', 'grams', 'each'),
	PRIMARY KEY (material_id),
	FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id),
	FOREIGN KEY (item_id) REFERENCES Item(item_id)
);

-- Create Order table
CREATE TABLE Orders (
	order_id  INT AUTO_INCREMENT, 
	due_date DATETIME NOT NULL DEFAULT NOW(),
	date_created DATETIME NOT NULL DEFAULT NOW(),
	delivery_address VARCHAR(255),
	PRIMARY KEY (order_id)
);

-- Create Order_Material table
CREATE TABLE Order_Material (
	order_id INT,
	material_id INT,
	quantity FLOAT,
	unit ENUM('kg', 'box', 'grams', 'each'),
	PRIMARY KEY (order_id, material_id),
	FOREIGN KEY (order_id) REFERENCES Orders(order_id),
	FOREIGN KEY (material_id) REFERENCES Material(material_id)
);

-- Create User_Order table
CREATE TABLE User_Order (
	order_id INT,
	user_id INT,
	permisson ENUM('owner', 'editor', 'viewer'),
	PRIMARY KEY (order_id, user_id),
	FOREIGN KEY (order_id) REFERENCES Orders(order_id),
	FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create Inventory Table
CREATE TABLE Inventory (
	inventory_id  INT AUTO_INCREMENT,
	name VARCHAR(32),
	description VARCHAR(255),
	latitude FLOAT( 10, 6 ),
	longitude FLOAT( 10, 6 ),
	PRIMARY KEY (inventory_id)
);

-- Create Inventory_User Table
CREATE TABLE Inventory_User (
	inventory_id INT,
	user_id INT,
	permisson ENUM('owner', 'editor', 'viewer'),
	PRIMARY KEY (inventory_id, user_id),
	FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id),
	FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create Stock table
CREATE TABLE Stock (
	inventory_id INT,
	item_id INT,
	quantity FLOAT,
	unit ENUM('kg', 'box', 'grams'),
	PRIMARY KEY (inventory_id, item_id),
	FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id),
	FOREIGN KEY (item_id) REFERENCES Item(item_id)
);

-- Create Recipe table
CREATE TABLE Recipe (
	recipe_id  INT AUTO_INCREMENT,
	quantity FLOAT,
	unit ENUM('kg', 'box', 'grams'),
	PRIMARY KEY (recipe_id)
);

-- Create Process table
CREATE TABLE Process (
	process_id  INT AUTO_INCREMENT,
	name VARCHAR(32),
	description VARCHAR(255),
	recipe_id INT,
	FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id),
	PRIMARY KEY (process_id)
);

-- Create Ingredient table
CREATE TABLE Ingredient (
	process_id INT,
	item_id INT,
	quantity FLOAT,
	unit ENUM('kg', 'box', 'grams'),
	PRIMARY KEY (process_id, item_id),
	FOREIGN KEY (process_id) REFERENCES Process(process_id),
	FOREIGN KEY (item_id) REFERENCES Item(item_id)
);