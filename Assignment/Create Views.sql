-- Creates a view that shows the items that a supplier supplies.
CREATE VIEW supplier_1_items AS
SELECT product.product_id, supplier.supplier_name, supplier.supplier_id, item.item_name, item.item_id, product.product_price, product.product_unit
FROM item, supplier, product
WHERE supplier.supplier_id = 1 
AND item.item_id = product.item_id
AND product.supplier_id = supplier.supplier_id;

-- Creates a view that shows the items that a supplier supplies.
CREATE VIEW supplier_2_items AS
SELECT product.product_id, supplier.supplier_name, supplier.supplier_id, item.item_name, item.item_id, product.product_price, product.product_unit
FROM item, supplier, product
WHERE supplier.supplier_id = 2 
AND item.item_id = product.item_id
AND product.supplier_id = supplier.supplier_id;

-- Creates a view that shows the items that a supplier supplies.
CREATE VIEW supplier_3_items AS
SELECT product.product_id, supplier.supplier_name, supplier.supplier_id, item.item_name, item.item_id, product.product_price, product.product_unit
FROM item, supplier, product
WHERE supplier.supplier_id = 3 
AND item.item_id = product.item_id
AND product.supplier_id = supplier.supplier_id;

-- Create a view for all of the products with thier item name
CREATE VIEW product_item AS
SELECT * FROM product
INNER JOIN item ON product.item_id = item.item_id;

-- Create a view for the product with thier supplier name
CREATE VIEW product_supplier AS
SELECT * FROM product
INNER JOIN supplier ON product.supplier_id = supplier.supplier_id;

SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'pocketpasta' AND TABLE_NAME = 'product';