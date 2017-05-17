-- Typical Queries

-- Customer

-- Customer create 
INSERT INTO customer 
VALUES(1, "Ben", "ben@gmail.com", "21 Fake street");

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
VALUES(1, "pasta", "great original italian pasta", null);

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
VALUES(1, "coles", null, 1234);

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
VALUES(1, 1, 1, 3.20, "kg");

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
VALUES( 1, 1, 1, 3, "kg", "21 Fake street", null, null, null);

-- View a particular customers orders
SELECT * 
FROM product_order
WHERE customer_id = 1;

-- Supplier views thier orders and the customer contact detials for each order
SELECT * 
FROM product_order, customer, product
WHERE supplier_id = 1
AND product_order.customer_id = customer.customer_id;

-- Customer update order 
UPDATE product_order 
SET product_order_quantity = 4.2, product_order_unit = "grams", product_order_address = "22 Fake strret", product_order_date_due = null
WHERE product_order_id = 1;

-- Customer cancel order
DELETE FROM product_order 
WHERE product_order_id = 1;

-- Inventory

-- Supplier add a new inventory
INSERT INTO inventory 
VALUES(1, 1, "fridge", "the cold room out back", "23 Fake street");

-- View all inventories for a particular supplier
SELECT * 
FROM inventory
WHERE supplier_id = 1;

-- Supplier update an inventory
UPDATE inventory 
SET inventory_name = "pantry", inventory_description = "The cupboard in the kitchen", inventory_address = "21 Fake street" 
WHERE inventory_id = 1;

/*-- Supplier delete inventory
DELETE FROM inventory 
WHERE inventory_id = 1; */

-- Stock

-- Supplier add a new stock
INSERT INTO stock 
VALUES(1, 1, 1, 3, "kg", null);

-- View all stock for a particular inventory
SELECT * 
FROM stock
WHERE inventory_id = 1;

-- Supplier update the quantity of a stocked item
UPDATE stock 
SET stock_quantity = 7, stock_unit = "grams"
WHERE stock_id = 1;

-- Supplier delete stock
DELETE FROM stock 
WHERE stock_id = 1; 

-- Recipe

-- Supplier add a new recipe
INSERT INTO recipe 
VALUES(1, 1, 3, "kg");

-- View all recipes
SELECT * 
FROM recipe;

-- Supplier Update a recipe
UPDATE recipe 
SET recipe_quantity = 4, recipe_unit = "grams" 
WHERE recipe_id = 1;

-- Supplier delete recipe
DELETE FROM recipe 
WHERE recipe_id = 1; 

-- Process 

-- Supplier add a new process
INSERT INTO process 
VALUES(1, 1, 1, "Add pasta", "Add pasta to the boiling water", null);

-- View all processes
SELECT * 
FROM process;

-- Supplier Update an process
UPDATE process 
SET recipe_id = 1, process_precedence = 2, process_name = "Add pizza", process_description = "pour pizza onto your plate", process_image = null 
WHERE process_id = 1;

-- Supplier delete process
DELETE FROM process 
WHERE process_id = 1; 

-- Ingredient 

-- Supplier add a new ingredient
INSERT INTO ingredient 
VALUES(1, 1, 3, "kg");

-- View all ingredients
SELECT * 
FROM ingredient;

-- Supplier Update an ingredient
UPDATE ingredient 
SET ingredient_quantity = 4, ingredient_unit = "grams" 
WHERE item_id = 1 AND process_id = 1;

-- Supplier delete ingredient
DELETE FROM ingredient 
WHERE ingredient_id = 1;