-- Typical Queries

-- Customer

-- Customer create 
INSERT INTO customer 
VALUES(null, "Ben", "ben@gmail.com", "21 Fake street");

-- Customer views own details
SELECT * 
FROM customer 
WHERE customer_id = 1;

-- Customer updates thier contact infomation
UPDATE customer 
SET customer_name = "Harry", customer_email = "harry@gmail.com", customer_address = "22 Fake street"
WHERE customer_id = 1;

-- Item

-- Supplier add a new item
INSERT INTO item 
VALUES(null, "pasta", "great original italian pasta", null);

-- View all items
SELECT * 
FROM item;

-- View a particular item
SELECT * 
FROM item 
WHERE item_id = 1;

-- Supplier Update an item
UPDATE item 
SET item_name = "pizza", item_description = "great original italian pasta", item_image = null 
WHERE item_id = 1;

-- Supplier delete item
DELETE FROM item 
WHERE item_id = 1;

-- Supplier

-- Supplier create 
INSERT INTO supplier 
VALUES(null, "coles", null, 1234);

-- View all Suppliers
SELECT * 
FROM supplier;

-- View a particular supplier
SELECT * 
FROM supplier
WHERE supplier_id = 1;

-- Supplier update details
UPDATE supplier
SET supplier_name = "Coles", supplier_image = null, supplier_ABN = 12345
WHERE supplier_id = 1;

-- Product

-- Supplier Creates new product
INSERT INTO product 
VALUES(null, 1, 1, 3.20, "kg");

-- View all product
SELECT * 
FROM product;

-- View the products offered by a particular supplier
SELECT * 
FROM product 
WHERE supplier_id = 1;

-- View all products for a particular item
SELECT * 
FROM product
WHERE item_id = 1;

-- Supplier update product
UPDATE product 
SET product_price = 4.20, product_unit = "box"
WHERE product_id = 1;

-- Supplier delete product
DELETE FROM product
WHERE product_id = 1;

-- Product Order

-- Customer creates order
INSERT INTO product_order 
VALUES( null, 1, 1, 3, "kg", "21 Fake street", null, null, null);

-- View a particular customers orders
SELECT * 
FROM product_order
WHERE customer_id = 1;

-- Supplier views thier orders and the customer contact detials for each order
SELECT * 
FROM product_order, customer 
WHERE supplier_id = 1 
AND product_order.customer_id = customer.customer_id;

-- Customer update order 
UPDATE product_order 
SET product_order_quantity = 4.2, product_order_unit = "grams", product_order_address = "22 Fake strret", product_order_due_date = NOW(), NOW()
WHERE product_order_id = 1;

-- Customer cancel order
DELETE FROM product_order 
WHERE product_order_id = 1;

-- Inventory

-- View all inventories for a particular supplier
SELECT * 
FROM inventory
WHERE supplier_id = 1;

-- Supplier add a new inventory
INSERT INTO inventory 
VALUES(null, "fridge", "the cold room out back", "23 Fake street");

-- Supplier update an inventory
UPDATE inventory 
SET inventory_name = "pantry", inventory_description = "The cupboard in the kitchen", inventory_address = "21 Fake street" 
WHERE inventory_id = 1;

-- Supplier delete inventory
DELETE FROM inventory 
WHERE inventory_id = 1;

-- Stock

-- View all stock for a particular inventory
SELECT * 
FROM stock
WHERE invenetory_id = 1;

-- Supplier add a new stock
INSERT INTO stock 
VALUES(null, 1, 1, 3, "kg", null);

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
VALUES(null, recipe_id, process_precedence, process_name, process_description, process_image);

-- Supplier Update an process
UPDATE process 
SET recipe_id = given_recipe_id, process_precedence = given_process_precedence, process_name = given_process_name, process_description = given_process_description, process_image = given_process_image 
WHERE process_id = given_process_id;

-- Supplier delete process
DELETE FROM process 
WHERE process_id = given_process_id;

-- Ingredient 

-- View all ingredients
SELECT * 
FROM ingredient;

-- Supplier add a new ingredient
INSERT INTO ingredient 
VALUES(item_id, process_id, ingredient_quantity, ingredient_unit);

-- Supplier Update an ingredient
UPDATE ingredient 
SET ingredient_quantity = given_ingredient_quantity, ingredient_unit = given_ingredient_unit 
WHERE ingredient_id = given_ingredient_id;

-- Supplier delete ingredient
DELETE FROM ingredient 
WHERE ingredient_id = given_ingredient_id;