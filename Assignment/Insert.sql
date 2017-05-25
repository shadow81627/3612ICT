-- Insert Suppliers
INSERT INTO supplier 
VALUES(1, "coles", null, 1234);

INSERT INTO supplier 
VALUES(2, "woolies", null, 12345);

INSERT INTO supplier 
VALUES(3, "aldi", null, 51824753556);

-- Insert Items
INSERT INTO item 
VALUES(1, "pasta", "great original italian pasta", null, 'grain');

INSERT INTO item 
VALUES(2, "pizza", "great original italian pizza", null,'fruit');

INSERT INTO item 
VALUES(3, "cheese", "delicous parmasain cheese", null,'dairy');

-- Insert Products
INSERT INTO product 
VALUES(1, 1, 1, 3.20, "kg");

INSERT INTO product 
VALUES(2, 2, 2, 4.20, "kg");

INSERT INTO product 
VALUES(3, 3, 3, 5.20, "kg");

-- Insert Customer
INSERT INTO customer 
VALUES(1, "Ben", "ben@gmail.com", "21 Fake street");

INSERT INTO customer 
VALUES(2, "Harry", "harry@gmail.com", "22 Fake street");

INSERT INTO customer 
VALUES(3, "Bruce", "bruce@gmail.com", "23 Fake street");

-- Insert Product order
INSERT INTO product_order 
VALUES( 1, 1, 1, 3.20, "kg", "21 Fake street", null, null, null);

INSERT INTO product_order 
VALUES( 1, 2, 2, 5.7, "kg", "22 Fake street", null, null, null);

INSERT INTO product_order 
VALUES( 1, 3, 3, 20.5, "kg", "23 Fake street", null, null, null);

-- Insert inventory
INSERT INTO inventory 
VALUES(1, 1, "fridge", "the cold room out back", "21 Fake street");

INSERT INTO inventory 
VALUES(2, 2, "pantry", "cupboard in the kitchen back", "22 Fake street");

INSERT INTO inventory 
VALUES(3, 3, "shed", "shed out back", "23 Fake street");

-- Insert stock
INSERT INTO stock 
VALUES(1, 1, 1, 3, "kg", null);

INSERT INTO stock 
VALUES(1, 2, 2, 7.8, "kg", null);

INSERT INTO stock 
VALUES(1, 3, 3, 52.4, "kg", null);

-- Insert recipies
INSERT INTO recipe 
VALUES(1, 1, 3.2, "kg");

INSERT INTO recipe 
VALUES(2, 2, 4.3, "kg");

INSERT INTO recipe 
VALUES(3, 3, 9.3, "kg");

-- Insert process
INSERT INTO process 
VALUES(1, 1, 1, "Add pasta", "Add pasta to the boiling water", null);

INSERT INTO process 
VALUES(2, 2, 1, "Add pizza", "Add pizza to the boiling water", null);

INSERT INTO process 
VALUES(3, 3, 1, "Add cheese", "Add cheese to the boiling water", null);

-- Insert ingrediets
INSERT INTO ingredient 
VALUES(1, 1, 3, "kg");

INSERT INTO ingredient 
VALUES(2, 1, 3, "kg");

INSERT INTO ingredient 
VALUES(3, 1, 3, "kg");