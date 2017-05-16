-- Typical Queries

-- Customer

-- Customer create
INSERT INTO customer 
VALUES(null, customer_name, customer_email, customer_address);

-- Customer updates thier contact infomation
UPDATE customer 
SET customer_name = new_customer_name, customer_email = new_customer_email, customer_address = new_customer_address
WHERE customer_id = given_customer_id;

-- Customer views own details
SELECT * 
FROM customer 
WHERE customer_id = given_customer_id;

-- Product Order

-- Customer creates order
INSERT INTO product_order 
VALUES( null, product_id, customer_id, product_order_quantity, product_order_unit, product_order_address, product_order_due_date, null, null);

-- Customer update order 
UPDATE product_order 
SET product_order_quantity = given_product_order_quantity, product_order_unit = given_product_order_unit, product_order_address = given_product_order_address, product_order_due_date = given_product_order_due_date, product_order_date_delivered
WHERE product_order_id = given_product_order_id;

-- Customer cancel order
DELETE FROM product_order 
WHERE product_order_id = given_product_order_id;

-- View a particular customers orders
SELECT * 
FROM product_order, customer
WHERE customer_id = given_customer_id;

-- Supplier views thier orders and the customer contact detials for each order
SELECT * 
FROM product_order, customer 
WHERE supplier_id = given_supplier_id 
AND product_order.customer_id = customer.customer_id;

-- Supplier

-- Supplier create 
INSERT INTO supplier 
VALUES(null, supplier_name, supplier_image, supplier_ABN);

-- Supplier update details
UPDATE supplier
SET supplier_name = given_supplier_name, supplier_image = given_supplier_image, supplier_ABN = given_supplier_ABN
WHERE supplier_id = given_supplier_id;

-- Product

-- View all product
SELECT * 
FROM product;

-- View the products offered by a particular supplier
SELECT * 
FROM product 
WHERE supplier_id = given_supplier_id;

-- Supplier Creates new product
INSERT INTO product 
VALUES(null, supplier_id, item_id, product_price, product_unit);

-- Item

-- View all items
SELECT * 
FROM item;

-- Supplier add a new item
INSERT INTO item 
VALUES(null, name, description, image);

-- Supplier Update an item
UPDATE item 
SET item_name = given_item_name, item_description = given_item_description, item_image = given_item_image 
WHERE item_id = given_item_id;

-- Supplier delete item
DELETE FROM item 
WHERE item_id = given_item_id;

-- Inventory

-- View all inventories for a particular supplier
SELECT * 
FROM inventory
WHERE supplier_id = given_supplier_id;

-- Supplier add a new inventory
INSERT INTO inventory 
VALUES(null, name, description, address);

-- Supplier update an inventory
UPDATE inventory 
SET inventory_name = given_inventory_name, inventory_description = given_inventory_description, inventory_address = given_inventory_address 
WHERE inventory_id = given_inventory_id;

-- Supplier delete inventory
DELETE FROM inventory 
WHERE inventory_id = given_inventory_id;

-- Stock

-- View all stock for a particular inventory
SELECT * 
FROM stock
WHERE invenetory_id = given_inventory_id;

-- Supplier add a new stock
INSERT INTO stock 
VALUES(null, item_id, inventory_id, stock_quantity, stock_unit, stock_min, stock_max, null);

-- Supplier update an stock
UPDATE stock 
SET item_id = given_item_id, inventory_id = given_inventory_id, stock_quantity = given_stock_quantity, stock_unit = given_stock_unit, stock_min = given_stock_min, stock_max = given_stock_max
WHERE stock_id = given_stock_id;

-- Supplier delete stock
DELETE FROM stock 
WHERE stock_id = given_stock_id;

-- Recipe

-- View all recipes
SELECT * 
FROM recipe;

-- Supplier add a new recipe
INSERT INTO recipe 
VALUES(null, item_id, quantity, unit);

-- Supplier Update an recipe
UPDATE recipe 
SET item_id = given_item_id, recipe_quantity = given_recipe_quantity, recipe_unit = given_recipe_unit 
WHERE recipe_id = given_recipe_id;

-- Supplier delete recipe
DELETE FROM recipe 
WHERE recipe_id = given_recipe_id;

-- Process 

-- View all processes
SELECT * 
FROM process;

-- Supplier add a new process
INSERT INTO process 
VALUES(null, item_id, quantity, unit);

-- Supplier Update an process
UPDATE process 
SET item_id = given_item_id, process_quantity = given_process_quantity, process_unit = given_process_unit 
WHERE process_id = given_process_id;

-- Supplier delete process
DELETE FROM process 
WHERE process_id = given_process_id;