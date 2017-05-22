-- Change the delimiter so we can create a procedure
DELIMITER $

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS transfer_stock;
-- This procedure is used to ensure that the stock is consistant when being updated.
-- Using the given amount the procedure will add or remove that amount from the stock.
CREATE PROCEDURE transfer_stock(IN stock INT, IN amount FLOAT)
BEGIN
	START TRANSACTION;
	SELECT stock_quantity INTO stock_quantity_found FROM stock WHERE stock_id = stock;
	UPDATE stock SET stock_quantity = stock_quantity_found + amount WHERE stock_id = stock;
	COMMIT;
END



-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS delivery_date;

-- Create a procedure to get the recipes that make an item


-- Creates a procedure to get if there are enough ingredient for a recipe
CREATE PROCEDURE check_ingredient(IN recipe INT, OUT message VARCHAR(255))
BEGIN
	-- Get the id of the inventory of the ingredient is in
	SELECT inventory_id INTO ingredient_found FROM stock WHERE item_id = item AND stock_quantity >= product_order_quantity LIMIT 1

-- Creates a procedure to get the expected delivery date of an Item
CREATE PROCEDURE delivery_date(IN item INT, OUT delivery_date DATETIME)
BEGIN
	-- Get the id of the inventory that has enough of an item in it for the order
	SELECT inventory_id INTO stock_found FROM stock WHERE item_id = item AND stock_quantity >= product_order_quantity LIMIT 1;
	
	-- if we don't have enough stock we need to aquire more
	IF stock_found IS NULL THEN
		SELECT inventory_id INTO enough_stock FROM 

Customer places Product_Order for Product
Product is an Item
//check to see if we have that kind of item as stock
If Stock of Item in Inventory then
	//check to see if we have enough to deliver
	If Stock of Item is less than product_order_quantity then
		Check recipes that make Item
			Check Inventory for stock of Recipe Ingredients
				If stock of Recipe Item is less than ingredient_quantity then
					Order material from supplier
					Else
						//enough Ingredients to make order
				Else
					//we don't have an stock of this Ingredient
					Order Ingredient from supplier
			Else
				//if there are no recipes to make the item then we can't make it
		Else
			//we don't have enough stock so we will have to make more
	Else
		//we don't have the item so we have to make it
else
	//we haven't got any of the item in stock so we need to add it
	Check recipes that make Item
			Check Inventory for stock of Recipe Ingredients
				If stock of Recipe Item is less than ingredient_quantity then
					Order material from supplier
					Else
						//enough Ingredients to make order
				Else
					//we don't have an stock of this Ingredient
					Order Ingredient from supplier
			Else
				//if there are no recipes to make the item then we can't make it